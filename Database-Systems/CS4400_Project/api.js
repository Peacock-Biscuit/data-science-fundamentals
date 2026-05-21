// after setting everything up (dependencies, sql connection parameters, db update), you should be able to
// run node api.js from the command prompt and access the api from locahost:4040 from there

const { readdirSync } = require('fs');

// dependencies, run "npm i -s express cors body-parser mysql" on first setup

const express = require('express'),
  app = express(),
  cors = require('cors'),
  bodyParser = require('body-parser'),
  mysql = require('mysql');

// mysql for node requires a different authentication method so run
//     ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'
// on MySQL workbench for the connection to work on first setup

// change parameters to connect to the mysql db as required (likely that only password needs to be changed)

var db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'covidtest_fall2020'
});

db.connect();

const server = {
  port: 4040 // port to access api from
};

app.use(cors())
app.use(bodyParser.json());

function formatBody(body) {
    for (const [ key, value ] of Object.entries(body)) {
      if (value == null || value == true || value == false) {
        body[key] = value;
      } else {
        body[key] = `\'${value}\'`
      }
    }
    return body;
}

// now the api can be accessed from localhost:4040

app.listen(server.port, () => console.log(`Server started, listening port: ${server.port}`));

// we can finally start adding routes! each route should call our db and return the result in json format

app.post('/login', (req, res) => {
    let body = formatBody(req.body);
    db.query(`SELECT * FROM user WHERE username = ${body.username} AND user_password = md5(${body.password})`,
        (error, result) => {
            if (result.length == 0) {
                res.json({result: false});
            } else {
                res.json({result: true});
            }
        });
})

// Route to register a user
app.post('/register', (req, res) => {
  let body = formatBody(req.body);
  // If housing type is filled in, register a student. If not, register an employee.
  if (!body.sitetester && !body.labtech) {
      db.query(`CALL register_student(${body.username}, ${body.email}, ${body.fname}, ${body.lname}, ${body.location}, ${body.housing_type}, ${body.password})`,
        (error, result) => {
            res.json({error});
    });
  } else {
    db.query(`CALL register_employee(${body.username}, ${body.email}, ${body.fname}, ${body.lname}, ${body.phone}, ${body.labtech}, ${body.sitetester}, ${body.password})`,
        (error, result) => {
            res.json({error});
        });
  }
})

// Route to viewresults

app.post('/view-results', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL student_view_results(${body.student_username}, ${body.test_status}, ${body.start_date}, ${body.end_date})`,
        () => {
            db.query(`SELECT * FROM student_view_results_result`, (error, result) => {
                res.json({result});
            });
        });
})

// Route to explore results

app.post('/explore-results', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL explore_results(${body.test_id})`,
        () => {
            db.query(`SELECT * FROM explore_results_result`, (error, result) => {
                res.json({result});
            });
        });
})

// Route for aggregate results

app.post('/aggregate-results', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL aggregate_results(${body.location}, ${body.housing}, ${body.testing_site}, ${body.start_date}, ${body.end_date})`,
        () => {
            db.query(`SELECT * FROM aggregate_results_result`, (error, result) => {
                res.json({result});
            });
        });
})

// Route for filtering test signups

app.post('/test-sign-up-filter', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL test_sign_up_filter(${body.username}, ${body.testing_site}, ${body.start_date}, ${body.end_date}, ${body.start_time}, ${body.end_time})`,
        () => {
            db.query(`SELECT * FROM test_sign_up_filter_result`, (error, result) => {
                res.json({result});
            });
        });
})

// Route to sign up for test

app.post('/test-sign-up', (req, res) => {
    let body = formatBody(req.body);
    db.query('SELECT max(test_id) AS maxId FROM test', (error, result) => {
        let newTestId = parseInt(JSON.parse(JSON.stringify(result))[0].maxId) + 1;
        db.query(`CALL test_sign_up(${body.username}, ${body.site_name}, ${body.appt_date}, ${body.appt_time}, ${newTestId})`,
            (error) => {
                    res.json({error})
            });
    });
})

// Route to view tests processed

app.post('/tests-processed', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL tests_processed(${body.start_date}, ${body.end_date}, ${body.test_status}, ${body.lab_tech_username})`,
        () => {
            db.query(`SELECT * FROM tests_processed_result`, (error, result) => {
                res.json({result});
            });
        });
})


// Route to view pools

app.post('/pools', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL view_pools(${body.begin_process_date}, ${body.end_process_date}, ${body.pool_status}, ${body.processed_by})`,
        () => {
            db.query(`SELECT * FROM view_pools_result`, (error, result) => {
                res.json({result});
            });
        });
})


// Route to create a pool

app.post('/create_pool', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL create_pool(${body.pool_id}, ${body.test_id})`,
        (error) => {
            res.json({error})
        });
})

// Route to assign test to pool

app.post('/assign_test', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL assign_test_to_pool(${body.pool_id}, ${body.test_id})`,
        (error) => {
          res.json({error})
        });
})


// Route to process pool

app.post('/process_pool', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL process_pool(${body.pool_id}, ${body.pool_status}, ${body.process_date}, ${body.processed_by})`,
        (error) => {
            res.json({error})
        });
})

// Route to process test

app.post('/process_test', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL process_test(${body.test_id}, ${body.test_status})`,
        (error) => {
            res.json({error})
        });
})

// Route to create appointment

app.post('/create_appointment', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL create_appointment(${body.site_name}, ${body.date}, ${body.time})`,
        (error) => {
            res.json({error})
        });
})

// Route to view all appointments

app.post('/appointments', (req, res) => {
    let body = formatBody(req.body);
    body.is_available = parseInt(body.is_available)
    db.query(`CALL view_appointments(${body.site_name}, ${body.begin_appt_date}, ${body.end_appt_date}, ${body.begin_appt_time}, ${body.end_appt_time}, ${body.is_available})`,
        () => {
            db.query(`SELECT * FROM view_appointments_result`, (error, result) => {
                res.json({result});
            });
        });
})

// Route to view all testers

app.post('/testers', (req, res) => {
    db.query(`CALL view_testers()`,
        () => {
            db.query(`SELECT * FROM view_testers_result`, (error, result) => {
                res.json({result});
            });
        });
})

// Route to create testing site

app.post('/create_testing_site', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL create_testing_site(${body.site_name}, ${body.street}, ${body.city}, ${body.state}, ${body.zip}, ${body.location}, ${body.first_tester_username})`,
        (error) => {
            res.json({error})
        });
})

// Route to view pool metadata

app.post('/pool_metadata', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL pool_metadata(${body.pool_id})`,
        () => {
            db.query(`SELECT * FROM pool_metadata_result`, (error, result) => {
                res.json({result});
            });
        });
})

// Route to view tests in pool

app.post('/tests_in_pool', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL tests_in_pool(${body.pool_id})`,
        () => {
            db.query(`SELECT * FROM tests_in_pool_result`, (error, result) => {
                res.json({result});
            });
        });
})

// Route to view the sites assigned to a tester

app.post('/tester_assigned_sites', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL tester_assigned_sites(${body.tester_username})`,
        () => {
            db.query(`SELECT * FROM tester_assigned_sites_result`, (error, result) => {
                res.json({result});
            });
        });
})

// Route to assign tester

app.post('/assign_tester', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL assign_tester(${body.tester_username}, ${body.site_name})`,
        (error) => {
            res.json({error})
        });
})

// Route to unassign tester

app.post('/unassign_tester', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL unassign_tester(${body.tester_username}, ${body.site_name})`,
        (error) => {
            res.json({error})
        });
})

// Route to view daily results

app.post('/daily_results', (req, res) => {
    let body = formatBody(req.body);
    db.query(`CALL daily_results()`,
        () => {
            db.query(`SELECT * FROM daily_results_result`, (error, result) => {
                res.json({result});
            });
        });
})

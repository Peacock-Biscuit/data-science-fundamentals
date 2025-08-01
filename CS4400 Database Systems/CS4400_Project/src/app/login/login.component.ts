import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Observable, Observer } from 'rxjs';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  validateForm!: FormGroup;
  loggedIn = false;
  loginFailed = false;

  // submitForm(): void {
  //   console.log(this.form.value);
  // }

  constructor(private fb: FormBuilder) {}

  login(event: any) {
    var http = new XMLHttpRequest();
    http.open("POST", "http://localhost:4040/login", true);
    http.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    http.onreadystatechange = () => {
      if(http.readyState == 4 && http.status == 200) {
          let response = JSON.parse(http.responseText);
          if (response.result) {
            this.loggedIn = true;
            this.loginFailed = false;
          } else {
            this.loggedIn = false;
            this.loginFailed = true;
          }
      }
    }
    http.send(JSON.stringify({
      username: this.validateForm.controls.userName.value, 
      password: this.validateForm.controls.password.value
    }));
  }

  ngOnInit(): void {
    this.validateForm = this.fb.group({
      userName: [null, [Validators.required]],
      password: [null, [Validators.required]],
    });
  }
  
}

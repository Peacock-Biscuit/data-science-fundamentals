import { Component, OnInit } from '@angular/core';

interface DataItem {
  testID: number;
  timeslotDate: string;
  dataProcessed: string;
  poolStatus: string;
  status: string;
}


@Component({
  selector: 'app-student-view-test-results',
  templateUrl: './student-view-test-results.component.html',
  styleUrls: ['./student-view-test-results.component.css']
})
export class StudentViewTestResultsComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }
  listOfColumn = [
    {
      title: 'Test ID#',
      compare: null,
      priority: false
    },
    {
      title: 'Timeslot Date',
      compare: (a: DataItem, b: DataItem) =>  a.timeslotDate.localeCompare(b.timeslotDate),
      priority: false
    },
    {
      title: 'Date Processed',
      compare: (a: DataItem, b: DataItem) => 
      a.dataProcessed.localeCompare(b.dataProcessed),
      priority: false
    },
    {
      title: 'Pool Status',
      compare: (a: DataItem, b: DataItem) =>       a.poolStatus.localeCompare(b.poolStatus),
      priority: false
    },
    {
      title: 'Status',
      compare: (a: DataItem, b: DataItem) => a.status.localeCompare(b.status),
      priority: false
    }
  ];
    listOfData: DataItem[] = [
    {
      testID: 1,
      timeslotDate: "8/19/20",
      dataProcessed: "8/20/20",
      poolStatus: "Negative",
      status: "Negative"
    },
    {
      testID: 2,
      timeslotDate: "8/24/20",
      dataProcessed: "8/24/20",
      poolStatus: "Positive",
      status: "Negative"
    },
    {
      testID: 3,
      timeslotDate: "8/18/20",
      dataProcessed: "8/28/20",
      poolStatus: "Positive",
      status: "Positive"
    },
    {
      testID: 4,
      timeslotDate: "9/1/20",
      dataProcessed: "NULL",
      poolStatus: "Pending",
      status: "Pending"
    }
  ];
}

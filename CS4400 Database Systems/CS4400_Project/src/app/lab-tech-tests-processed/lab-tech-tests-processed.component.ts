import { Component, OnInit } from '@angular/core';

interface DataItem {
  testID: number;
  poolID: number;
  dateTested: string;
  dateProcessed: string;
  result: string;
}

@Component({
  selector: 'app-lab-tech-tests-processed',
  templateUrl: './lab-tech-tests-processed.component.html',
  styleUrls: ['./lab-tech-tests-processed.component.css']
})
export class LabTechTestsProcessedComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }
  listOfColumn = [
    {
      title: 'Test ID#',
      compare: false,
      priority: false
    },
    {
      title: 'Pool ID',
      compare: false,
      priority: false
    },
    {
      title: 'Date Tested',
      compare: (a: DataItem, b: DataItem) =>       
      a.dateTested.localeCompare(b.dateTested),
      priority: false
    },
    {
      title: 'Date Processed',
      compare: (a: DataItem, b: DataItem) =>       
      a.dateProcessed.localeCompare(b.dateProcessed),
      priority: false
    },
    {
      title: 'Result',
      compare: (a: DataItem, b: DataItem) =>       
      a.result.localeCompare(b.result),
      priority: false
    },
  ];
    listOfData: DataItem[] = [
    {
      testID: 1,
      poolID: 2232,
      dateTested: "8/17/20",
      dateProcessed: "8/29/20",
      result: "Negative",
    },
    {
      testID: 2,
      poolID: 2232,
      dateTested: "8/12/20",
      dateProcessed: "8/29/20",
      result: "Positive",
    },
    {
      testID: 3,
      poolID: 2232,
      dateTested: "8/17/20",
      dateProcessed: "8/29/20",
      result: "Positive",
    },
    {
      testID: 4,
      poolID: 44554,
      dateTested: "9/1/20",
      dateProcessed: "9/1/20",
      result: "Positive",
    }
  ];
}

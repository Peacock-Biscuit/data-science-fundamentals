import { Component, OnInit } from '@angular/core';

interface DataItem {
  testID: number;
  dateTested: string;
}

@Component({
  selector: 'app-create-a-pool',
  templateUrl: './create-a-pool.component.html',
  styleUrls: ['./create-a-pool.component.css']
})
export class CreateAPoolComponent implements OnInit {
  size = 8;
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
      title: 'Date Tested',
      compare: (a: DataItem, b: DataItem) =>       
      a.dateTested.localeCompare(b.dateTested),
      priority: false
    },
    {
      title: 'Include in Pool',
      compare: false,
      priority: false
    },
  ];
    listOfData: DataItem[] = [
    {
      testID: 1,
      dateTested: "8/17/20",
    },
    {
      testID: 2,
      dateTested: "8/17/20",
    },
    {
      testID: 3,
      dateTested: "8/18/20",
    },
    {
      testID: 4,
      dateTested: "8/24/20",
    },
    {
      testID: 5,
      dateTested: "8/28/20",
    },
    {
      testID: 6,
      dateTested: "8/31/20",
    },
    {
      testID: 7,
      dateTested: "9/1/20",
    }
  ];
}

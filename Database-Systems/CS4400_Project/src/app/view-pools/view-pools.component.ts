import { Component, OnInit } from '@angular/core';

interface DataItem {
  poolID: number;
  testIDs: string;
  dateProcessed: string;
  processedBy: string;
  poolStatus: string;
}

@Component({
  selector: 'app-view-pools',
  templateUrl: './view-pools.component.html',
  styleUrls: ['./view-pools.component.css']
})
export class ViewPoolsComponent implements OnInit {
  
  constructor() { }

  ngOnInit(): void {
  }
  value?: string;
  
  listOfColumn = [
    {
      title: 'Pool ID',
      compare: false,
      priority: false
    },
    {
      title: 'Test ids',
      compare: false,
      priority: false
    },
    {
      title: 'Date Processed',
      compare: (a: DataItem, b: DataItem) =>       
      a.dateProcessed.localeCompare(b.dateProcessed),
      priority: false
    },
    {
      title: 'Processed By',
      compare: (a: DataItem, b: DataItem) =>       
      a.processedBy.localeCompare(b.processedBy),
      priority: false
    },
    {
      title: 'Pool Status',
      compare: (a: DataItem, b: DataItem) =>       
      a.poolStatus.localeCompare(b.poolStatus),
      priority: false
    },
  ];
    listOfData: DataItem[] = [
    {
      poolID: 22332,
      testIDs: "1,2,3",
      dateProcessed: "8/18/20",
      processedBy: "jim123",
      poolStatus: "Negative",
    },
    {
      poolID: 33443,
      testIDs: "4,5,6",
      dateProcessed: "8/25/20",
      processedBy: "nathan124",
      poolStatus: "Negative",
    },
    {
      poolID: 45678,
      testIDs: "10,11",
      dateProcessed: "8/28/20",
      processedBy: "bryan12",
      poolStatus: "Positive",
    },
    {
      poolID: 54321,
      testIDs: "12",
      dateProcessed: "NULL",
      processedBy: "NULL",
      poolStatus: "Pending",
    }
  ];
}

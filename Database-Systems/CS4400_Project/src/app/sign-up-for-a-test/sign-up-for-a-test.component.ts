import { Component, OnInit } from '@angular/core';

interface DataItem {
  date: string;
  time: string;
  siteAddress: string;
  testSite: string;
}

@Component({
  selector: 'app-sign-up-for-a-test',
  templateUrl: './sign-up-for-a-test.component.html',
  styleUrls: ['./sign-up-for-a-test.component.css']
})
export class SignUpForATestComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }
  
  onChange(result: Date): void {
    console.log('Selected Time: ', result);
  }

  onOk(result: Date | Date[] | null): void {
    console.log('onOk', result);
  }

  onCalendarChange(result: Array<Date | null>): void {
    console.log('onCalendarChange', result);
  }
  listOfColumn = [
    {
      title: 'Date',
      compare: (a: DataItem, b: DataItem) =>  
      a.date.localeCompare(b.date),
      priority: false
    },
    {
      title: 'Time',
      compare: (a: DataItem, b: DataItem) =>  
      a.time.localeCompare(b.time),
      priority: false
    },
    {
      title: 'Site Address',
      compare: false,
      priority: false
    },
    {
      title: 'Test Site',
      compare: (a: DataItem, b: DataItem) =>       
      a.testSite.localeCompare(b.testSite),
      priority: false
    },
    {
      title: 'Signup',
      compare: false,
      priority: false
    },
  ];
    listOfData: DataItem[] = [
    {
      date: "8/17/20",
      time: "10:00 am",
      siteAddress: "169 5th St",
      testSite: "Nathan's House"
    },
    {
      date: "9/19/20",
      time: "11:00 am",
      siteAddress: "175 St",
      testSite: "Bryan's House"
    },
    {
      date: "8/17/20",
      time: "12:00 pm",
      siteAddress: "1 Techwood Dr",
      testSite: "Eleanor's House"
    },
    {
      date: "8/17/20",
      time: "1:00 pm",
      siteAddress: "Spring St",
      testSite: "Jim's House"
    }
  ];
}

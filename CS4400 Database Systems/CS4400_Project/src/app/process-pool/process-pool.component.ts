import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-process-pool',
  templateUrl: './process-pool.component.html',
  styleUrls: ['./process-pool.component.css']
})
export class ProcessPoolComponent implements OnInit {
  poolID: 6;
  validateForm!: FormGroup;
  poolStatus: string;
  testResult = "Positive";
  listOfData = [
    {
      testID: '1',
      dateTested: '08-17-2020',
      testResult: 'Negative'
    },
    {
      testID: '2',
      dateTested: '08-17-2020',
      testResult: 'Negative'
    },
    {
      testID: '3',
      dateTested: '08-19-2020',
      testResult: 'Negative'
    }
  ];
  types = ['Positive', 'Negative'];

  testResultTypeCall(value){
    this.testResult = value;
  }
 
  radioChangeHandler(event:any) {
    this.poolStatus = event.target.value;
    console.log(this.poolStatus);
  }
  
  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.validateForm = this.fb.group({
      date: [null]
    });
  }

}

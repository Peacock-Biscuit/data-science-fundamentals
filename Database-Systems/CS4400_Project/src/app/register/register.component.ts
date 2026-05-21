import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Routes, RouterModule, Router } from '@angular/router';
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  router: string;
  validateForm!: FormGroup;
  selectedRole: string;
  isTester = false;
  isTech = false;
  housingType ='Student Housing';
  location = 'East';

  types = [ 'Student Housing', 'Greek Housing', 'Off-campus Apartment', 'Off-campus House' ];
  locations = ['East', 'West'];

 housingTypeCall(value){
    this.housingType = value;
 }
 locationCall(value) {
   this.location = value;
 }
 radioChangeHandler(event:any) {
  this.selectedRole = event.target.value;
  if (this.selectedRole == "Student") {
      this.router = "/studentHome";
  }
}

siteTesterChangeHandler(event:any) {
  this.isTester = event.target.checked;
  if (this.isTester) {

      this.router = "/siteTestHome";
  }
  if (!this.isTester && !this.isTech) {
    this.router = "/register";
  }
  if (this.isTester && this.isTech) {
    this.router = "/labSiteHome";
  }

}

labTechChangeHandler(event:any) {
  this.isTech = event.target.checked;
  if (this.isTech) {
    this.router = "/labTechHome";
  } 
  if (!this.isTester && !this.isTech) {
    this.router = "/register";
  }
  if (this.isTester && this.isTech) {
    this.router = "/labSiteHome";
  }
}

  onSubmit(event:any) {
    var http = new XMLHttpRequest();
    http.open("POST", "http://localhost:4040/register");
    http.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    http.send(JSON.stringify({
      username: this.validateForm.controls.user.value, 
      email: this.validateForm.controls.email.value,
      fname: this.validateForm.controls.fname.value,
      lname: this.validateForm.controls.lname.value,
      password: this.validateForm.controls.password.value,
      location: this.location,
      housing_type: this.housingType,
      sitetester: this.isTester,
      labtech: this.isTech,
      phone: this.validateForm.controls.phoneNumber.value}));
  }

  onOptionsSelected(event:any){
    this.housingType = event.target.value;
}

  updateConfirmValidator(): void {
    /** wait for refresh value */
    Promise.resolve().then(() => this.validateForm.controls.checkPassword.updateValueAndValidity());
  }

  confirmationValidator = (control: FormControl): { [s: string]: boolean } => {
    if (!control.value) {
      return { required: true };
    } else if (control.value !== this.validateForm.controls.password.value) {
      return { confirm: true, error: true };
    } else if (control.value.length < 8) {
      return { size: true, error: true };
    }
    return {};
  };
  
  constructor(private fb: FormBuilder) {}

  ngOnInit(): void {
    this.validateForm = this.fb.group({
      user: [null, [Validators.required]],
      email: [null, [Validators.email, Validators.required]],
      fname: [null, [Validators.required]],
      lname: [null, [Validators.required]],
      password: [null, [Validators.required]],
      checkPassword: [null, [Validators.required, this.confirmationValidator]],
      phoneNumber: [null, [Validators.required]]
    });
  }

}

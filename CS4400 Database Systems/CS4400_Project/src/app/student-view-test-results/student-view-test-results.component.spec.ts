import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StudentViewTestResultsComponent } from './student-view-test-results.component';

describe('StudentViewTestResultsComponent', () => {
  let component: StudentViewTestResultsComponent;
  let fixture: ComponentFixture<StudentViewTestResultsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StudentViewTestResultsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StudentViewTestResultsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

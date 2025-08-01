import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AggregateTestResultsComponent } from './aggregate-test-results.component';

describe('AggregateTestResultsComponent', () => {
  let component: AggregateTestResultsComponent;
  let fixture: ComponentFixture<AggregateTestResultsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AggregateTestResultsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AggregateTestResultsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

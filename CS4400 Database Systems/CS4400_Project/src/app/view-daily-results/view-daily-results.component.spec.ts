import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewDailyResultsComponent } from './view-daily-results.component';

describe('ViewDailyResultsComponent', () => {
  let component: ViewDailyResultsComponent;
  let fixture: ComponentFixture<ViewDailyResultsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewDailyResultsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewDailyResultsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LabTechTestsProcessedComponent } from './lab-tech-tests-processed.component';

describe('LabTechTestsProcessedComponent', () => {
  let component: LabTechTestsProcessedComponent;
  let fixture: ComponentFixture<LabTechTestsProcessedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LabTechTestsProcessedComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LabTechTestsProcessedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

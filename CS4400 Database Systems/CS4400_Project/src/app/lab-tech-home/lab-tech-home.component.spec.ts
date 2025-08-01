import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LabTechHomeComponent } from './lab-tech-home.component';

describe('LabTechHomeComponent', () => {
  let component: LabTechHomeComponent;
  let fixture: ComponentFixture<LabTechHomeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LabTechHomeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LabTechHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

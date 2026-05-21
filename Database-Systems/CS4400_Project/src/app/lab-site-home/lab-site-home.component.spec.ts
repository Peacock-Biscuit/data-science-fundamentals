import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LabSiteHomeComponent } from './lab-site-home.component';

describe('LabSiteHomeComponent', () => {
  let component: LabSiteHomeComponent;
  let fixture: ComponentFixture<LabSiteHomeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LabSiteHomeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LabSiteHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

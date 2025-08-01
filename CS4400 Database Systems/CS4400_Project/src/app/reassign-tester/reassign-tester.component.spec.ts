import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReassignTesterComponent } from './reassign-tester.component';

describe('ReassignTesterComponent', () => {
  let component: ReassignTesterComponent;
  let fixture: ComponentFixture<ReassignTesterComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReassignTesterComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReassignTesterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

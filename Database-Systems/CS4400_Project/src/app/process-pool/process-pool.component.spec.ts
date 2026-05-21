import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProcessPoolComponent } from './process-pool.component';

describe('ProcessPoolComponent', () => {
  let component: ProcessPoolComponent;
  let fixture: ComponentFixture<ProcessPoolComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProcessPoolComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProcessPoolComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewPoolsComponent } from './view-pools.component';

describe('ViewPoolsComponent', () => {
  let component: ViewPoolsComponent;
  let fixture: ComponentFixture<ViewPoolsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewPoolsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewPoolsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

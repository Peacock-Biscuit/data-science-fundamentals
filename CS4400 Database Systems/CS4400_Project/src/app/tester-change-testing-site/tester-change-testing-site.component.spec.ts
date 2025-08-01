import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TesterChangeTestingSiteComponent } from './tester-change-testing-site.component';

describe('TesterChangeTestingSiteComponent', () => {
  let component: TesterChangeTestingSiteComponent;
  let fixture: ComponentFixture<TesterChangeTestingSiteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TesterChangeTestingSiteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TesterChangeTestingSiteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

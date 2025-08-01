import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateTestingSiteComponent } from './create-testing-site.component';

describe('CreateTestingSiteComponent', () => {
  let component: CreateTestingSiteComponent;
  let fixture: ComponentFixture<CreateTestingSiteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CreateTestingSiteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateTestingSiteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

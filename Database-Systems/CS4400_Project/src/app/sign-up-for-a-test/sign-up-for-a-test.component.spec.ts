import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SignUpForATestComponent } from './sign-up-for-a-test.component';

describe('SignUpForATestComponent', () => {
  let component: SignUpForATestComponent;
  let fixture: ComponentFixture<SignUpForATestComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SignUpForATestComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SignUpForATestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

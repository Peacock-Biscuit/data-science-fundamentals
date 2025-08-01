import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateAPoolComponent } from './create-a-pool.component';

describe('CreateAPoolComponent', () => {
  let component: CreateAPoolComponent;
  let fixture: ComponentFixture<CreateAPoolComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CreateAPoolComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateAPoolComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

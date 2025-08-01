import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ExploreTestResultComponent } from './explore-test-result.component';

describe('ExploreTestResultComponent', () => {
  let component: ExploreTestResultComponent;
  let fixture: ComponentFixture<ExploreTestResultComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ExploreTestResultComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ExploreTestResultComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

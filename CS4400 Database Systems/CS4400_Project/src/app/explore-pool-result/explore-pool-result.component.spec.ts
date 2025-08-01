import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ExplorePoolResultComponent } from './explore-pool-result.component';

describe('ExplorePoolResultComponent', () => {
  let component: ExplorePoolResultComponent;
  let fixture: ComponentFixture<ExplorePoolResultComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ExplorePoolResultComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ExplorePoolResultComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

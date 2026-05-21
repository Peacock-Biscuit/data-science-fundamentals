import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SiteTestHomeComponent } from './site-test-home.component';

describe('SiteTestHomeComponent', () => {
  let component: SiteTestHomeComponent;
  let fixture: ComponentFixture<SiteTestHomeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SiteTestHomeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SiteTestHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

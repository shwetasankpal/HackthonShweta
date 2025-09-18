import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResturantList } from './resturant-list';

describe('ResturantList', () => {
  let component: ResturantList;
  let fixture: ComponentFixture<ResturantList>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ResturantList]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ResturantList);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

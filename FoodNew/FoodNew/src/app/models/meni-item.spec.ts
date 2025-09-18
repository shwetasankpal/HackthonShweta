import { TestBed } from '@angular/core/testing';

import { MeniItem } from './meni-item';

describe('MeniItem', () => {
  let service: MeniItem;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MeniItem);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

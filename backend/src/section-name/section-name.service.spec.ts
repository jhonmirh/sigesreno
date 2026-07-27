import { Test, TestingModule } from '@nestjs/testing';
import { SectionNameService } from './section-name.service';

describe('SectionNameService', () => {
  let service: SectionNameService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [SectionNameService],
    }).compile();

    service = module.get<SectionNameService>(SectionNameService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});

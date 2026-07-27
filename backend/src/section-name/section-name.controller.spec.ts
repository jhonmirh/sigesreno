import { Test, TestingModule } from '@nestjs/testing';
import { SectionNameController } from './section-name.controller';
import { SectionNameService } from './section-name.service';

describe('SectionNameController', () => {
  let controller: SectionNameController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [SectionNameController],
      providers: [SectionNameService],
    }).compile();

    controller = module.get<SectionNameController>(SectionNameController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});

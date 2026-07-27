import { Module } from '@nestjs/common';
import { RepresentativesService } from './representatives.service';
import { RepresentativesController } from './representatives.controller';

@Module({
  providers: [RepresentativesService],
  controllers: [RepresentativesController]
})
export class RepresentativesModule {}

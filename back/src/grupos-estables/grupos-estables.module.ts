import { Module } from '@nestjs/common';
import { GruposEstablesService } from './grupos-estables.service';
import { GruposEstablesController } from './grupos-estables.controller';

@Module({
  controllers: [GruposEstablesController],
  providers: [GruposEstablesService],
})
export class GruposEstablesModule {}

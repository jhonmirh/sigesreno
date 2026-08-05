import { Injectable } from '@nestjs/common';
import { CreateGruposEstableDto } from './dto/create-grupos-estable.dto';
import { UpdateGruposEstableDto } from './dto/update-grupos-estable.dto';

@Injectable()
export class GruposEstablesService {
  create(createGruposEstableDto: CreateGruposEstableDto) {
    return 'This action adds a new gruposEstable';
  }

  findAll() {
    return `This action returns all gruposEstables`;
  }

  findOne(id: number) {
    return `This action returns a #${id} gruposEstable`;
  }

  update(id: number, updateGruposEstableDto: UpdateGruposEstableDto) {
    return `This action updates a #${id} gruposEstable`;
  }

  remove(id: number) {
    return `This action removes a #${id} gruposEstable`;
  }
}

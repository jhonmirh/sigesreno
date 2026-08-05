import { Injectable } from '@nestjs/common';
import { CreateAnioEscolarDto } from './dto/create-anio-escolar.dto';
import { UpdateAnioEscolarDto } from './dto/update-anio-escolar.dto';

@Injectable()
export class AnioEscolarService {
  create(createAnioEscolarDto: CreateAnioEscolarDto) {
    return 'This action adds a new anioEscolar';
  }

  findAll() {
    return `This action returns all anioEscolar`;
  }

  findOne(id: number) {
    return `This action returns a #${id} anioEscolar`;
  }

  update(id: number, updateAnioEscolarDto: UpdateAnioEscolarDto) {
    return `This action updates a #${id} anioEscolar`;
  }

  remove(id: number) {
    return `This action removes a #${id} anioEscolar`;
  }
}

-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'SECRETARIA', 'DOCENTE');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'DOCENTE',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Estado" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Estado_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Municipio" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "estadoId" INTEGER NOT NULL,

    CONSTRAINT "Municipio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Parroquia" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "municipioId" INTEGER NOT NULL,

    CONSTRAINT "Parroquia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlanDeEstudio" (
    "id" TEXT NOT NULL,
    "codigo" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT,

    CONSTRAINT "PlanDeEstudio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Materia" (
    "id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "horasSemanales" INTEGER NOT NULL,
    "anioCurso" INTEGER NOT NULL,
    "planDeEstudioId" TEXT NOT NULL,

    CONSTRAINT "Materia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NombreProcer" (
    "id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "NombreProcer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Seccion" (
    "id" TEXT NOT NULL,
    "anioCurso" INTEGER NOT NULL,
    "nombreProcerId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Seccion_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "Estado_nombre_key" ON "Estado"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "PlanDeEstudio_codigo_key" ON "PlanDeEstudio"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "NombreProcer_nombre_key" ON "NombreProcer"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "Seccion_anioCurso_nombreProcerId_key" ON "Seccion"("anioCurso", "nombreProcerId");

-- AddForeignKey
ALTER TABLE "Municipio" ADD CONSTRAINT "Municipio_estadoId_fkey" FOREIGN KEY ("estadoId") REFERENCES "Estado"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Parroquia" ADD CONSTRAINT "Parroquia_municipioId_fkey" FOREIGN KEY ("municipioId") REFERENCES "Municipio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Materia" ADD CONSTRAINT "Materia_planDeEstudioId_fkey" FOREIGN KEY ("planDeEstudioId") REFERENCES "PlanDeEstudio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Seccion" ADD CONSTRAINT "Seccion_nombreProcerId_fkey" FOREIGN KEY ("nombreProcerId") REFERENCES "NombreProcer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

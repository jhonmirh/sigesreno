-- CreateTable
CREATE TABLE "Profesor" (
    "id" TEXT NOT NULL,
    "cedula" TEXT NOT NULL,
    "primerNombre" TEXT NOT NULL,
    "segundoNombre" TEXT,
    "primerApellido" TEXT NOT NULL,
    "segundoApellido" TEXT,
    "estadoCivil" TEXT NOT NULL,
    "direccion" TEXT NOT NULL,
    "tituloPregrado" TEXT,
    "tituloEspecializacion" TEXT,
    "tituloMaestria" TEXT,
    "tituloDoctorado" TEXT,
    "otroTitulo" TEXT,
    "codigoCargo" TEXT,
    "descripcionCargo" TEXT,
    "funcionInstitucion" TEXT,
    "fechaIngresoMPPE" TIMESTAMP(3),
    "discapacidad" BOOLEAN NOT NULL DEFAULT false,
    "informeMedico" BOOLEAN NOT NULL DEFAULT false,
    "numeroHijos" INTEGER NOT NULL DEFAULT 0,
    "tallaCamisa" TEXT,
    "tallaPantalon" TEXT,
    "tallaZapatos" TEXT,
    "banco" TEXT,
    "tipoCuenta" TEXT,
    "numeroCuenta" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Profesor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Representante" (
    "id" TEXT NOT NULL,
    "cedula" TEXT NOT NULL,
    "nacionalidad" TEXT NOT NULL,
    "nombres" TEXT NOT NULL,
    "apellidos" TEXT NOT NULL,
    "parentesco" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "fechaNacimiento" TIMESTAMP(3) NOT NULL,
    "edad" INTEGER NOT NULL,
    "lugarNacimiento" TEXT NOT NULL,
    "direccion" TEXT NOT NULL,
    "correo" TEXT,
    "telefono1" TEXT NOT NULL,
    "telefono2" TEXT,
    "profesion" TEXT,
    "lugarTrabajo" TEXT,
    "direccionTrabajo" TEXT,
    "telefonoTrabajo" TEXT,
    "banco" TEXT,
    "tipoCuenta" TEXT,
    "numeroCuenta" TEXT,
    "colaboracion" TEXT,
    "viveConEstudiante" BOOLEAN NOT NULL DEFAULT true,
    "descripcionAutorizacion" TEXT,
    "grupoSanguineo" TEXT,

    CONSTRAINT "Representante_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ContactoEmergencia" (
    "id" TEXT NOT NULL,
    "cedula" TEXT NOT NULL,
    "nombres" TEXT NOT NULL,
    "apellidos" TEXT NOT NULL,
    "telefono" TEXT NOT NULL,
    "direccion" TEXT NOT NULL,

    CONSTRAINT "ContactoEmergencia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Estudiante" (
    "id" TEXT NOT NULL,
    "nacionalidad" TEXT NOT NULL,
    "cedula" TEXT,
    "primerNombre" TEXT NOT NULL,
    "segundoNombre" TEXT,
    "primerApellido" TEXT NOT NULL,
    "segundoApellido" TEXT,
    "sexo" TEXT NOT NULL,
    "fechaNacimiento" TIMESTAMP(3) NOT NULL,
    "diaNacimiento" INTEGER NOT NULL,
    "mesNacimiento" INTEGER NOT NULL,
    "anioNacimiento" INTEGER NOT NULL,
    "lugarNacimiento" TEXT NOT NULL,
    "estadoNacimiento" TEXT,
    "edad" INTEGER NOT NULL,
    "direccion" TEXT NOT NULL,
    "telefono" TEXT,
    "correo" TEXT,
    "nombreMadre" TEXT,
    "cedulaMadre" TEXT,
    "direccionMadre" TEXT,
    "nombrePadre" TEXT,
    "cedulaPadre" TEXT,
    "direccionPadre" TEXT,
    "viveCon" TEXT NOT NULL,
    "representanteId" TEXT NOT NULL,
    "contactoEmergenciaId" TEXT,
    "estaturaMetros" INTEGER NOT NULL,
    "estaturaCentimetros" INTEGER NOT NULL,
    "pesoKilos" INTEGER NOT NULL,
    "pesoGramos" INTEGER NOT NULL,
    "tallaCamisa" TEXT NOT NULL,
    "tallaPantalon" TEXT NOT NULL,
    "tallaZapatos" TEXT NOT NULL,
    "grupoSanguineo" TEXT,
    "discapacidad" BOOLEAN NOT NULL DEFAULT false,
    "informeMedico" BOOLEAN NOT NULL DEFAULT false,
    "alergico" BOOLEAN NOT NULL DEFAULT false,
    "especificacionAlergia" TEXT,
    "plantelDestino" TEXT,
    "ultimoAnioAprobadoLiteral" TEXT,
    "gradoACursar" INTEGER NOT NULL,
    "mencion" TEXT NOT NULL,
    "fechaInscripcion" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Estudiante_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentosEstudiante" (
    "id" TEXT NOT NULL,
    "estudianteId" TEXT NOT NULL,
    "copiaCedula" BOOLEAN NOT NULL DEFAULT false,
    "partidaNacimiento" BOOLEAN NOT NULL DEFAULT false,
    "boletaPromocion" BOOLEAN NOT NULL DEFAULT false,
    "fotoAlumno" BOOLEAN NOT NULL DEFAULT false,
    "fotoRepresentante" BOOLEAN NOT NULL DEFAULT false,
    "fotocopiaCedulaRep" BOOLEAN NOT NULL DEFAULT false,
    "notasCertificadas" BOOLEAN NOT NULL DEFAULT false,
    "cartaBuenaConducta" BOOLEAN NOT NULL DEFAULT false,
    "copiaCuentaBancaria" BOOLEAN NOT NULL DEFAULT false,
    "informeMedico" BOOLEAN NOT NULL DEFAULT false,
    "autorizacionRepresentante" BOOLEAN NOT NULL DEFAULT false,
    "observacion" TEXT,

    CONSTRAINT "DocumentosEstudiante_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Profesor_cedula_key" ON "Profesor"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "Representante_cedula_key" ON "Representante"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "ContactoEmergencia_cedula_key" ON "ContactoEmergencia"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "Estudiante_cedula_key" ON "Estudiante"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "DocumentosEstudiante_estudianteId_key" ON "DocumentosEstudiante"("estudianteId");

-- AddForeignKey
ALTER TABLE "Estudiante" ADD CONSTRAINT "Estudiante_representanteId_fkey" FOREIGN KEY ("representanteId") REFERENCES "Representante"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Estudiante" ADD CONSTRAINT "Estudiante_contactoEmergenciaId_fkey" FOREIGN KEY ("contactoEmergenciaId") REFERENCES "ContactoEmergencia"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentosEstudiante" ADD CONSTRAINT "DocumentosEstudiante_estudianteId_fkey" FOREIGN KEY ("estudianteId") REFERENCES "Estudiante"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

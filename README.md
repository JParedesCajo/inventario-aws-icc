# Sistema Web de Gestión de Inventario — GRUPO 05

## Descripción del proyecto

Proyecto académico de Infraestructura como Código (IcC), orientado al diseño e implementación progresiva de una infraestructura en Amazon Web Services (AWS) para un Sistema Web de Gestión de Inventario.

La arquitectura objetivo contempla 120 sucursales, hasta 1,000 usuarios concurrentes y aproximadamente 100,000 movimientos de inventario diarios.

## Objetivo general

Implementar una parte representativa de la arquitectura AWS mediante Terraform, aplicando buenas prácticas de organización, documentación, seguridad y control de versiones.

## Tecnologías utilizadas

- Terraform: automatización de infraestructura.
- Amazon Web Services (AWS): plataforma en la nube.
- AWS CLI: administración y verificación de servicios AWS.
- Visual Studio Code: entorno de desarrollo.
- Git y GitHub: control de versiones y registro de avances.

## Alcance del laboratorio

La implementación se realizará progresivamente, comenzando con la configuración del entorno, el proveedor AWS y los componentes básicos de red.

No se desplegará toda la arquitectura de producción durante esta primera etapa.

## Metodología de trabajo

Cada avance seguirá el siguiente procedimiento:

1. Implementar una funcionalidad o configuración.
2. Explicar los cambios realizados.
3. Ejecutar las pruebas correspondientes.
4. Registrar evidencias en la bitácora.
5. Crear un commit en Git.

## Estructura del proyecto

- `docs/`: documentación y bitácora de avances.
- `terraform/`: configuración de infraestructura.
- `.github/`: futuros flujos de automatización.
- `README.md`: descripción y guía general del proyecto.

## Estado actual

**Sprint 1 — Inicialización del proyecto.**

Herramientas locales verificadas. Pendiente la validación del repositorio Git y la configuración inicial de Terraform.

## Consideraciones de costos

Se priorizará una infraestructura de laboratorio de bajo costo. Antes de desplegar recursos en AWS se revisará el plan de Terraform y sus posibles cargos.

## Nota académica

Este proyecto representa un avance práctico de la arquitectura propuesta y no una implementación completa del sistema de inventario para producción.

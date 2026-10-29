# Sprint 1 — Avance 05: Implementación de Amazon VPC

## 1. Objetivo

Definir mediante Terraform la red virtual principal de la infraestructura AWS del Sistema Web de Gestión de Inventario del Grupo 05.

## 2. Componente implementado en código

**Servicio:** Amazon Virtual Private Cloud (VPC).

**Nombre del recurso:** `inventario-vpc-dev`.

**Región configurada:** `us-east-1`.

**Rango CIDR:** `10.0.0.0/16`.

## 3. Justificación técnica

La VPC proporciona un entorno de red aislado lógicamente para organizar los componentes de la arquitectura.

Sobre esta red se crearán posteriormente las subredes, tablas de rutas y mecanismos de conectividad necesarios para los servicios del sistema de inventario.

## 4. Archivo modificado

`terraform/environments/dev/main.tf`

Se declara el recurso `aws_vpc.inventario`, habilitando soporte DNS y nombres DNS.

## 5. Procedimiento

1. Crear `main.tf`.
2. Definir el recurso Amazon VPC.
3. Configurar el rango CIDR.
4. Habilitar las opciones DNS.
5. Asignar la etiqueta de identificación.
6. Ejecutar las validaciones de Terraform.
7. Revisar el plan antes del despliegue.

## 6. Pruebas

| Comando | Resultado |
|---|---|
| `terraform fmt` | Pendiente de registrar |
| `terraform validate` | Pendiente de registrar |
| `terraform plan` | Pendiente de registrar |

## 7. Consideraciones de costos

La creación de una VPC no tiene un cargo adicional por sí misma.

Sin embargo, los servicios y recursos que se incorporen posteriormente pueden generar costos.

## 8. Evidencias

- Código del recurso VPC en Visual Studio Code.
- Resultado de `terraform validate`.
- Resultado de `terraform plan`.
- Captura de la VPC en AWS, únicamente si se autoriza su creación.

## 9. Estado

**Implementación declarada en código. Validación y despliegue pendientes de verificar.**

## Incidencia 01 — Autenticación con AWS

**Problema identificado:** al ejecutar `terraform plan`, Terraform mostró el error `No valid credential sources found`.

**Causa:** no existía una configuración de credenciales AWS disponible para el proveedor.

**Acciones realizadas:**
1. Creación del usuario IAM `terraform-inventario-dev`.
2. Asociación de la política personalizada `InventarioTerraformNetworkPolicy`.
3. Preparación del perfil AWS CLI `inventario-dev`.

**Verificaciones pendientes:**
- Confirmar la identidad mediante `aws sts get-caller-identity`.
- Validar nuevamente la configuración Terraform.
- Obtener el plan de creación de la VPC.

**Estado:** pendiente de verificar la conexión y el plan.

## Evidencia de infraestructura

**Recurso:** `aws_vpc.inventario`  
**Nombre:** `inventario-vpc-dev`  
**CIDR:** `10.0.0.0/16`  
**Región:** `us-east-1`

**Estado:** declarado en código; despliegue pendiente.

### Incidencia 02 — Restricción de permisos mediante AWS Organizations

**Comando ejecutado:** `terraform apply "vpc.tfplan"`

**Error:** `UnauthorizedOperation — ec2:CreateVpc`.

**Código HTTP:** 403.

**Causa identificada:** AWS rechazó la creación de la VPC debido a una denegación explícita en una Service Control Policy (SCP).

**Validaciones realizadas:**
- Autenticación AWS CLI correcta.
- Proveedor AWS configurado.
- Código Terraform validado.
- Plan de ejecución generado correctamente: 1 recurso por crear.

**Impacto:** el recurso `aws_vpc.inventario` está definido en Terraform, pero no se ha desplegado en AWS.

**Acción pendiente:** revisar las restricciones de AWS Organizations y determinar si existe una cuenta o entorno autorizado para el despliegue.

**Estado:** pendiente de resolución.
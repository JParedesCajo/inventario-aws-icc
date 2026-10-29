# Sprint 1 — Avance 04: Configuración del proveedor AWS

## 1. Objetivo

Establecer la configuración inicial de Terraform para administrar la infraestructura del Sistema Web de Gestión de Inventario del Grupo 05 en Amazon Web Services (AWS).

Este avance prepara la conexión con AWS y define los parámetros que utilizarán los próximos componentes de infraestructura.

## 2. Componentes trabajados

- **Terraform:** herramienta de Infraestructura como Código.
- **AWS Provider:** proveedor que permite administrar recursos AWS.
- **Variables:** parámetros reutilizables para la configuración.
- **Default Tags:** etiquetas para identificar los recursos del proyecto.

## 3. Archivos de implementación

### 3.1 versions.tf

Define la versión mínima de Terraform y la versión compatible del proveedor AWS.

Configuración utilizada:
- Terraform: versión mínima 1.15.8.
- Proveedor: hashicorp/aws.
- Versión del proveedor: compatible con 6.x.

### 3.2 providers.tf

Configura el proveedor AWS y utiliza la variable `aws_region` para determinar la región de implementación.

También establece las etiquetas:

- Project: inventario-aws-icc.
- Environment: dev.
- ManagedBy: Terraform.
- Group: Grupo-05.

### 3.3 variables.tf

Declara la variable `aws_region` de tipo `string`, con el valor predeterminado `us-east-1`.

Esto permite modificar la región sin alterar directamente el archivo del proveedor.

## 4. Procedimiento de implementación

1. Crear el archivo `versions.tf`.
2. Crear el archivo `providers.tf`.
3. Declarar `aws_region` en `variables.tf`.
4. Guardar los archivos en `terraform/environments/dev/`.
5. Inicializar Terraform.
6. Verificar el formato del código.
7. Validar la configuración.
8. Revisar el plan de ejecución.

## 5. Comandos de validación

```powershell
terraform init
terraform fmt
terraform validate
terraform plan
```

## 6. Incidencias identificadas

Durante la configuración inicial, Visual Studio Code mostró el mensaje:

`No declaration found for "var.aws_region"`

Se identificó la necesidad de verificar que la variable `aws_region` estuviera declarada correctamente en `variables.tf` y que los archivos `.tf` se encontraran en el mismo directorio.

**Estado de la incidencia:** pendiente de confirmar mediante `terraform validate`.

## 7. Resultados de las pruebas

| Prueba | Estado |
|---|---|
| Verificación de archivos `.tf` | Pendiente |
| `terraform init` | Pendiente |
| `terraform fmt` | Pendiente |
| `terraform validate` | Pendiente |
| `terraform plan` | Pendiente |

Los resultados se actualizarán después de ejecutar y verificar cada comando.

## 8. Evidencias

Se conservarán capturas de:

- Estructura de archivos Terraform en VS Code.
- Configuración del proveedor AWS.
- Resultado de `terraform init`.
- Resultado de `terraform validate`.
- Resultado de `terraform plan`.

## 9. Consideraciones de seguridad y costos

En esta etapa no se han definido recursos AWS para desplegar.

No se almacenarán claves de acceso ni credenciales en los archivos Terraform del repositorio.

La configuración del proveedor no implica por sí sola la creación de infraestructura.

## 10. Estado del avance

**En desarrollo.**

Pendiente validar la configuración y registrar el commit correspondiente.

## 11. Próximo avance

Implementación de la Amazon VPC principal del Sistema Web de Gestión de Inventario mediante Terraform.
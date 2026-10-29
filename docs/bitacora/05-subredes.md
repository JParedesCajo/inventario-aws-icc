# Sprint 1 — Avance 06: Implementación de subredes públicas

## 1. Objetivo

Implementar mediante Terraform dos subredes públicas distribuidas en diferentes zonas de disponibilidad de AWS, como parte de la infraestructura de red del Sistema Web de Gestión de Inventario.

## 2. Componentes desarrollados

| Recurso Terraform | CIDR | Zona de disponibilidad |
|---|---|---|
| aws_subnet.public_a | 10.0.1.0/24 | us-east-1a |
| aws_subnet.public_b | 10.0.2.0/24 | us-east-1b |

Ambos recursos están asociados a `aws_vpc.inventario`.

## 3. Justificación técnica

La distribución en dos zonas de disponibilidad permite preparar la arquitectura para componentes redundantes, como balanceadores de carga y servidores de aplicación.

Las subredes públicas alojarán posteriormente componentes que requieran conectividad externa controlada.

## 4. Implementación

Se incorporaron dos recursos `aws_subnet` en `terraform/environments/dev/main.tf`.

Cada subred dispone de un rango CIDR independiente, una zona de disponibilidad y etiquetas de identificación.

## 5. Validaciones

- `terraform fmt`: pendiente de registrar resultado.
- `terraform validate`: pendiente de registrar resultado.
- `terraform plan`: pendiente de registrar resultado.

## 6. Restricciones

El despliegue de recursos continúa condicionado por la política SCP de la cuenta AWS.

No se ejecutará `terraform apply` hasta contar con autorización.

## 7. Resultado del avance

**Estado:** implementación de código realizada; validación pendiente.

## 8. Próxima funcionalidad

Configuración de Internet Gateway, tabla de rutas públicas y asociaciones con ambas subredes.
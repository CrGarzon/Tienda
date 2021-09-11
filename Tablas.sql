/*Creacion de las tablas*/
CREATE TABLE `clientes` (
	`cedula_cliente` INT(20) NOT NULL DEFAULT '0',
	`direccion_cliente` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`email_cliente` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`nombre_cliente` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`telefono_cliente` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`cedula_cliente`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `usuarios` (
	`cedula_usuario` INT(20) NOT NULL,
	`email_usuario` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`nombre_usuario` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`password` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`usuario` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`estado` VARCHAR(100) NOT NULL DEFAULT '0' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`cedula_usuario`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `ventas` (
	`codigo_venta` INT(20) NOT NULL,
	`cedula_cliente` INT(20) NOT NULL,
	`cedula_usuario` INT(20) NOT NULL,
	`ivaventa` DOUBLE NULL DEFAULT '0',
	`total_venta` DOUBLE NULL DEFAULT '0',
	`valor_venta` DOUBLE NULL DEFAULT '0',
	PRIMARY KEY (`codigo_venta`) USING BTREE,
	INDEX `FK__clientes` (`cedula_cliente`) USING BTREE,
	INDEX `FK__usuarios` (`cedula_usuario`) USING BTREE,
	CONSTRAINT `FK__clientes` FOREIGN KEY (`cedula_cliente`) REFERENCES `tienda_generica`.`clientes` (`cedula_cliente`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK__usuarios` FOREIGN KEY (`cedula_usuario`) REFERENCES `tienda_generica`.`usuarios` (`cedula_usuario`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `proveedores` (
	`nitproveedor` INT(20) NOT NULL,
	`ciudad_proveedor` VARCHAR(100) NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`direccion_proveedor` VARCHAR(100) NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`nombre_proveedor` VARCHAR(100) NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`telefono_proveedor` VARCHAR(100) NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`nitproveedor`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `productos` (
	`codigo_producto` INT(20) NOT NULL,
	`iva_compra` DOUBLE NULL DEFAULT '0',
	`nit_proveedor` INT(20) NOT NULL DEFAULT '0',
	`nombre_producto` VARCHAR(100) NOT NULL DEFAULT '0' COLLATE 'utf8mb3_general_ci',
	`precio_compra` DOUBLE NOT NULL DEFAULT '0',
	`precio_venta` DOUBLE NOT NULL DEFAULT '0',
	PRIMARY KEY (`codigo_producto`) USING BTREE,
	INDEX `FK__proveedores` (`nit_proveedor`) USING BTREE,
	CONSTRAINT `FK__proveedores` FOREIGN KEY (`nit_proveedor`) REFERENCES `tienda_generica`.`proveedores` (`nitproveedor`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `detalle_ventas` (
	`codigo_detalle_venta` INT(20) NOT NULL,
	`cantidad_producto` INT(20) NOT NULL,
	`codigo_producto` INT(20) NOT NULL,
	`codigo_venta` INT(20) NOT NULL,
	`valor_total` DOUBLE NOT NULL DEFAULT '0',
	`valor_venta` DOUBLE NOT NULL DEFAULT '0',
	`valoriva` DOUBLE NOT NULL DEFAULT '0',
	PRIMARY KEY (`codigo_detalle_venta`) USING BTREE,
	INDEX `FK__productos` (`codigo_producto`) USING BTREE,
	INDEX `FK__ventas` (`codigo_venta`) USING BTREE,
	CONSTRAINT `FK__productos` FOREIGN KEY (`codigo_producto`) REFERENCES `tienda_generica`.`productos` (`codigo_producto`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK__ventas` FOREIGN KEY (`codigo_venta`) REFERENCES `tienda_generica`.`ventas` (`codigo_venta`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;
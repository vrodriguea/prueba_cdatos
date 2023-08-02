CREATE TABLE cliente (
  cedula VARCHAR(10) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  region VARCHAR(50) NOT NULL,
  edad INT NOT NULL,
  PRIMARY KEY (cedula)
);

CREATE TABLE cuentas (
  num_cuenta VARCHAR(10) NOT NULL,
  cedula_cliente VARCHAR(10) NOT NULL,
  estado INT NOT NULL,
  saldo DECIMAL(10,2) NOT NULL,
  fecha_apertura DATE NOT NULL,
  PRIMARY KEY (num_cuenta),
  FOREIGN KEY (cedula_cliente) REFERENCES cliente (cedula)
);

CREATE TABLE clave_dinamica (
  cedula_cliente VARCHAR(10) NOT NULL,
  correo VARCHAR(50) NOT NULL,
  celular VARCHAR(10) NOT NULL,
  PRIMARY KEY (cedula_cliente),
  FOREIGN KEY (cedula_cliente) REFERENCES cliente (cedula)
);
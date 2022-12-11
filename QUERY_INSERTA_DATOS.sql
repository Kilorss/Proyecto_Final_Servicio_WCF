USE Tarea1
GO

--PAISES--
INSERT INTO DBO.PAISES VALUES
('CRI','COSTA RICA','CR',506)
INSERT INTO DBO.PAISES VALUES
('NIC','NICARAGUA','NI',505)
---------------------------------------------------------------


--PERSONAS FISICAS--
INSERT INTO [dbo].[PERSONAS_FISICAS]          
VALUES
(601290100, 'CRI', 'Pietro', 'N/A', 'Corrales', 'Mesen','Piti', 'M', 0x10, '1980-10-05', CURRENT_USER, GETDATE()
,CURRENT_USER, GETDATE())
GO

INSERT INTO [dbo].[PERSONAS_FISICAS]           
VALUES
(206590875, 'CRI', 'Manuel', 'N/A', 'Sanchez', 'Perez','Baduel', 'M', 0x10, '1990-06-05', CURRENT_USER, GETDATE()
,CURRENT_USER, GETDATE())
GO
-----------------------------------------------------------------------------------------------------------------------------------


--PERSONAS JURIDICAS--
INSERT INTO PERSONAS_JURIDICAS VALUES 
('3-101-3655','PATITOS S.A','EL PATITO FEO','MIGUEL SIERRA','CARLOS','2022-12-06','CARLOS','2022-12-06')

INSERT INTO PERSONAS_JURIDICAS VALUES 
('3-101-3656','HACHEROS S.A','FERRETERIA EL HACHA','CLAUDIO OLIVAS','CARLOS','2022-12-06','CARLOS','2022-12-06')
-------------------------------------------------------------------------------------------------------------------


--PROVINCIAS--
INSERT INTO PROVINCIAS VALUES
('CRI',1,'SAN JOSE ')
INSERT INTO PROVINCIAS VALUES
('CRI',2,'ALAJUELA')
INSERT INTO PROVINCIAS VALUES
('CRI',3,'CARTAGO')
INSERT INTO PROVINCIAS VALUES
('CRI',4,'HEREDIA')
INSERT INTO PROVINCIAS VALUES
('CRI',5,'GUANACASTE')
INSERT INTO PROVINCIAS VALUES
('CRI',6,'PUNTARENAS')
INSERT INTO PROVINCIAS VALUES
('CRI',7,'LIMON')
-------------------------------


--TIPO STATUS--
INSERT INTO TIPO_ESTATUS VALUES 
('ACTIVO')
INSERT INTO TIPO_ESTATUS VALUES 
('INACTIVO')
-------------------------------


--TIPO PERSONAS--
INSERT INTO TIPO_PERSONAS VALUES 
('PERSONA FISICA')

INSERT INTO TIPO_PERSONAS VALUES 
('PERSONA JURIDICA')
--------------------------------

--PERSONAS--
INSERT INTO DBO.[PERSONAS	]  VALUES 
('3-101-3655','CARLOS','2022-12-06','CARLOS','2022-12-06',01)

INSERT INTO DBO.[PERSONAS	]  VALUES 
('3-101-3656','CARLOS','2022-12-06','CARLOS','2022-12-06',01)
---------------------------------------------------------------


--CANTONES--
INSERT INTO  DBO.CANTONES VALUES
('CRI',1,1,'SAN JOSE')

INSERT INTO  DBO.CANTONES VALUES
('CRI',1,2,'ALAJUELITA')

INSERT INTO  DBO.CANTONES VALUES
('CRI',1,3,'CORONADO')

INSERT INTO  DBO.CANTONES VALUES
('CRI',3,1,'CARTAGO')

INSERT INTO  DBO.CANTONES VALUES
('CRI',3,2,'EL GUARCO')

INSERT INTO  DBO.CANTONES VALUES
('CRI',3,3,'ALVARADO')
---------------------------------


--DISTRITOS--
INSERT INTO  DBO.DISTRITOS VALUES
('CRI',1,1,1,'CATEDRAL')

INSERT INTO  DBO.DISTRITOS VALUES
('CRI',1,1,2,'CARMEN')

INSERT INTO  DBO.DISTRITOS VALUES
('CRI',3,1,1,'OCCIDENTAL')

INSERT INTO  DBO.DISTRITOS VALUES
('CRI',3,1,2,'ORIENTAL')
----------------------------------


--CORREOS--
INSERT INTO CORREOS_ELECTRONICOS VALUES 
('sramirez49@gmail.com','3-101-3655',GETDATE(),'N/A','2022-12-06',1,1)

INSERT INTO CORREOS_ELECTRONICOS VALUES 
('stevenrm21@gmail.com','3-101-3656',GETDATE(),'N/A','2022-12-06',2,1)
---------------------------------------------------------------------


--Direcciones--
INSERT INTO [dbo].[DIRECCIONES]         
VALUES
('601290100', 1, 'CRI', 1, 1, 2, '800 este de pollo Tiquicia'
,CURRENT_USER, GETDATE(), CURRENT_USER, GETDATE())
GO

INSERT INTO [dbo].[DIRECCIONES]         
VALUES
('206590875', 1, 'CRI', 3, 1, 2, 'Fuente de la hispanidad'
,CURRENT_USER, GETDATE(), CURRENT_USER, GETDATE())
GO
-----------------------------------------------------------------------
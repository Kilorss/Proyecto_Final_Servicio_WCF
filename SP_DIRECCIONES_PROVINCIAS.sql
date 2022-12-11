USE Tarea1
GO



------DIRECCIONES------

--Insertar--
CREATE PROCEDURE [dbo].[SP_AGREGAR_DIRECCIONES]
(@id_persona nvarchar(50)
           ,@cod_estatus_direccion tinyint
           ,@cod_pais char(3)
           ,@cod_provincia smallint
           ,@cod_canton smallint
           ,@cod_distrito smallint
           ,@direccion_completa nvarchar(max)
           ,@id_registrado_por nvarchar(50)
           ,@fecha_registro datetime
           ,@id_modificado_por nvarchar(50)
           ,@fecha_ultima_modificacion datetime)
AS
BEGIN
INSERT INTO [dbo].[DIRECCIONES]           
     VALUES
          (@id_persona 
           ,@cod_estatus_direccion 
           ,@cod_pais 
           ,@cod_provincia 
           ,@cod_canton 
           ,@cod_distrito 
           ,@direccion_completa
           ,@id_registrado_por 
           ,@fecha_registro 
           ,@id_modificado_por 
           ,@fecha_ultima_modificacion)

		   select max([cod_direccion]) from [dbo].[DIRECCIONES]
END
GO

--Listar--
CREATE PROCEDURE [dbo].[SP_LISTAR_DIRECCIONES]
AS
BEGIN
SELECT [cod_direccion] [Dirección Id]
      ,PF.primer_nombre [Nombre]
      ,E.cod_estatus_direccion [Activo/Inactivo]
      ,E.cod_pais [Código país]
      ,E.cod_provincia [Provincia]
      ,E.cod_canton [Código cantón]
      ,E.cod_distrito [Código distrito]
      ,[direccion_completa] [Dirección]
      ,PF.[id_registrado_por] [Registrado por]
      ,PF.[fecha_registro] [Fecha de registro]
      ,PF.[id_modificado_por] [Modificado ultima vez por]
      ,PF.[fecha_ultima_modificacion] [Ultima modificación]
  FROM [dbo].[DIRECCIONES] E
	   INNER JOIN [dbo].[PERSONAS_FISICAS] PF
	   ON E.id_persona = PF.id_persona	   
END
GO

--Filtrar--
CREATE PROCEDURE [dbo].[SP_FILTRAR_DIRECCIONES]
(
	@Nombre nvarchar(50) 
)
AS
BEGIN
SELECT [cod_direccion] [Dirección Id]
      ,PF.primer_nombre [Nombre]
      ,E.cod_estatus_direccion [Activo/Inactivo]
      ,E.cod_pais [Código país]
      ,E.cod_provincia [Provincia]
      ,E.cod_canton [Código cantón]
      ,E.cod_distrito [Código distrito]
      ,[direccion_completa] [Dirección]
      ,PF.[id_registrado_por] [Registrado por]
      ,PF.[fecha_registro] [Fecha de registro]
      ,PF.[id_modificado_por] [Modificado ultima vez por]
      ,PF.[fecha_ultima_modificacion] [Ultima modificación]
  FROM [dbo].[DIRECCIONES] E
	   INNER JOIN [dbo].[PERSONAS_FISICAS] PF
	   ON E.id_persona = PF.id_persona
	   WHERE ltrim(rtrim(PF.primer_nombre)) like '%' + ltrim(rtrim(@Nombre)) + '%'
END
GO

--Modificar--
CREATE PROCEDURE [dbo].[SP_MODIFICAR_DIRECCIONES]
(
       @codigo_direccion smallint
	  ,@id_persona nvarchar(50)
      ,@cod_estatus_direccion tinyint
      ,@cod_pais char(3)
      ,@cod_provincia smallint
      ,@cod_canton smallint
      ,@cod_distrito smallint
      ,@direccion_completa nvarchar(max)
      ,@id_registrado_por nvarchar(50)
      ,@fecha_registro datetime
      ,@id_modificado_por nvarchar(50)
      ,@fecha_ultima_modificacion datetime 
)
AS
BEGIN
	UPDATE [dbo].[DIRECCIONES]
   SET [id_persona] = @id_persona
      ,[cod_estatus_direccion] = @cod_estatus_direccion
      ,[cod_pais] = @cod_pais
      ,[cod_provincia] = @cod_provincia
      ,[cod_canton] = @cod_canton
      ,[cod_distrito] = @cod_distrito
      ,[direccion_completa] = @direccion_completa
      ,[id_registrado_por] = @id_registrado_por
      ,[fecha_registro] = @id_registrado_por
      ,[id_modificado_por] = @id_modificado_por
      ,[fecha_ultima_modificacion] = @fecha_ultima_modificacion
 WHERE [cod_direccion] = @codigo_direccion
END
GO

--Eliminar--
CREATE PROCEDURE [dbo].[SP_ELIMINAR_DIRECCIONES]
(
	@codigo_direccion smallint
)
AS
BEGIN
DELETE FROM [dbo].[DIRECCIONES]
      WHERE [cod_direccion] = @codigo_direccion
END
GO



-----PROVINCIAS-----

--Insertar--
CREATE PROCEDURE [dbo].[SP_AGREGAR_PROVINCIAS]
		   (
		    @cod_pais char(3)
           ,@cod_provincia smallint
           ,@nombre_provincia nvarchar(50)
		   )
AS
BEGIN
INSERT INTO [dbo].[PROVINCIAS]
           (
		    [cod_pais]
           ,[cod_provincia]
           ,[nombre_provincia])
     VALUES
          (
		    @cod_pais 
           ,@cod_provincia 
           ,@nombre_provincia 
		   )
END
GO

--Listar--
CREATE PROCEDURE [dbo].[SP_LISTAR_PROVINCIAS]
AS
BEGIN
SELECT [cod_pais]
      ,[cod_provincia]
      ,[nombre_provincia]
  FROM [dbo].[PROVINCIAS]   
END
GO

--Filtrar--
CREATE PROCEDURE [dbo].[SP_FILTRAR_PROVINCIAS]
(
 @Nombre nvarchar(50)
)
AS
BEGIN
SELECT [cod_pais]
      ,[cod_provincia]
      ,[nombre_provincia]
  FROM [dbo].[PROVINCIAS]   
  WHERE ltrim(rtrim([nombre_provincia])) like '%' + ltrim(rtrim(@Nombre)) + '%'
END
GO

--Modificar--
CREATE PROCEDURE [dbo].[SP_MODIFICAR_PROVINCIAS]
(
	   @cod_pais char(3)
      ,@cod_provincia smallint
      ,@nombre_provincia nvarchar(50)
)
AS 
BEGIN
UPDATE [dbo].[PROVINCIAS]
   SET [cod_pais] = @cod_pais
      ,[cod_provincia] = @cod_provincia
      ,[nombre_provincia] = @nombre_provincia
 WHERE cod_pais = @cod_pais AND cod_provincia = @cod_provincia 
END
GO

--Eliminar--
CREATE PROCEDURE [dbo].[SP_ELIMINAR_PROVINCIAS]
(
	@cod_pais char(3)
   ,@cod_provincia smallint
)
AS
BEGIN
DELETE FROM [dbo].[DIRECCIONES]
      WHERE cod_pais = @cod_pais AND cod_provincia = @cod_provincia 
END
GO
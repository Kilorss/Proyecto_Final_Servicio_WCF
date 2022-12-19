USE Tarea1

--insertar--
go
create procedure [dbo].[SP_INSERTAR_PERSONA]
(
           @id_persona int,
		   @id_legal varchar (50),
           @id_registrado_por nvarchar (50),
           @fecha_registro datetime,
           @id_modificado_por nvarchar(50),
           @fecha_ultima_modificacion datetime,
           @cod_tipo_persona tinyint
)
as
begin
           INSERT INTO [dbo].[PERSONAS	]
           ([id_persona]
			,[id_legal]
           ,[id_registrado_por]
           ,[fecha_registro]
           ,[id_modificado_por]
           ,[fecha_ultima_modificacion]
           ,[cod_tipo_persona])

		 values 
		 (
		 @id_persona, 
		 @id_legal,        
		 @id_registrado_por, 
		 @fecha_registro, 
         @id_modificado_por,
         @fecha_ultima_modificacion,
         @cod_tipo_persona
		 )
end

go
create procedure [dbo].[SP_INSERTAR_TIPO_PERSONA]
(
           @cod_tipo_persona int,
		   @descripcion_tipo_persona varchar (50)
)
as
begin
           INSERT INTO [dbo].[TIPO_PERSONAS]
           ([cod_tipo_persona]
			,[descripcion_tipo_persona])

		 values 
		 (
		 @cod_tipo_persona, 
		 @descripcion_tipo_persona     
		 )
end

--listar--

go
Create Procedure [dbo].[SP_LISTAR_PERSONA]
As
Begin
SELECT		[id_persona]
			,[id_legal]
           ,[id_registrado_por]
           ,[fecha_registro]
           ,[id_modificado_por]
           ,[fecha_ultima_modificacion]
           ,[cod_tipo_persona]
  FROM [dbo].[PERSONAS	]
END

go
Create Procedure [dbo].[SP_LISTAR_TIPO_PERSONA]
As
Begin
SELECT		[cod_tipo_persona]
			,[descripcion_tipo_persona]
  FROM [dbo].[TIPO_PERSONAS]
END


--filtrar--

go
Create Procedure [dbo].[SP_FILTRAR_PERSONA]
(
@filtro nvarchar (50)
)
As
Begin
SELECT		[id_persona]
			,[id_legal]
           ,[id_registrado_por]
           ,[fecha_registro]
           ,[id_modificado_por]
           ,[fecha_ultima_modificacion]
           ,[cod_tipo_persona]
  FROM [dbo].[PERSONAS	]
WHERE LTRIM (RTRIM([id_persona])) like '%' + LTRIM(RTRIM(@filtro)) + '%'
--LTRIM Y RTRIM QUITA ESPACIOS A LA DERECHA Y A LA IZQUIERDA, EL LIKE BUSCA COINSIDENCIAS EN EL TEXTO--
END

go
Create Procedure [dbo].[SP_FILTRAR_TIPO_PERSONA]
(
@filtro nvarchar (50)
)
As
Begin
SELECT		[cod_tipo_persona]
			,[descripcion_tipo_persona]
  FROM [dbo].[TIPO_PERSONAS]
WHERE LTRIM (RTRIM([descripcion_tipo_persona])) like '%' + LTRIM(RTRIM(@filtro)) + '%'
--LTRIM Y RTRIM QUITA ESPACIOS A LA DERECHA Y A LA IZQUIERDA, EL LIKE BUSCA COINSIDENCIAS EN EL TEXTO--
END



--modificar--
go
create procedure [dbo].[SP_MODIFICAR_PERSONA]
(
           @id_persona int,
		   @id_legal varchar (50),
           @id_registrado_por nvarchar (50),
           @fecha_registro datetime,
           @id_modificado_por nvarchar(50),
           @fecha_ultima_modificacion datetime,
           @cod_tipo_persona tinyint
)
as
begin
UPDATE [dbo].[PERSONAS	]
   SET 
	   [id_persona] = @id_persona
      ,[id_legal] = @id_legal
      ,[id_registrado_por] = @id_registrado_por
      ,[fecha_registro] = @fecha_registro
      ,[id_modificado_por] = @id_modificado_por
      ,[fecha_ultima_modificacion] = @fecha_ultima_modificacion
      ,[cod_tipo_persona] = @cod_tipo_persona
 WHERE [id_persona] = @id_persona
end

go
create procedure [dbo].[SP_MODIFICAR_TIPO_PERSONA]
(
           @cod_tipo_persona int,
		   @descripcion_tipo_persona varchar (50)
)
as
begin
UPDATE [dbo].[TIPO_PERSONAS]
   SET 
	   [cod_tipo_persona] = @cod_tipo_persona
      ,[descripcion_tipo_persona] = @descripcion_tipo_persona
 WHERE [cod_tipo_persona] = @cod_tipo_persona
end

--eliminar--
go
CREATE PROCEDURE [dbo].[SP_ELIMINAAR_PERSONA]
(
	@id_persona int
)
AS
	BEGIN

		DELETE FROM [dbo].[PERSONAS	]
			  WHERE id_persona = @id_persona

	END


	go
	CREATE PROCEDURE [dbo].[SP_ELIMINAAR_TIPO_PERSONA]
(
	@cod_tipo_persona tinyint
)
AS
	BEGIN

		DELETE FROM [dbo].[TIPO_PERSONAS]
			  WHERE cod_tipo_persona = @cod_tipo_persona

	END
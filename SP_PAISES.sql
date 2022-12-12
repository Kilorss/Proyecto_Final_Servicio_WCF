USE [Tarea1]
GO

--Paises--

--Lista
CREATE PROCEDURE [dbo].[SP_LISTAR_PAISES]
AS
BEGIN
SELECT [cod_pais]
      ,[nombre_pais]
      ,[cod_pais_iso]
      ,[cod_area_pais_iso]
  FROM [dbo].[PAISES]
END
GO

--Filtra
CREATE PROCEDURE [dbo].[SP_FILTRAR_PAISES]
(
@Nombre nvarchar(50)
)
AS
BEGIN
SELECT [cod_pais]
      ,[nombre_pais]
      ,[cod_pais_iso]
      ,[cod_area_pais_iso]
  FROM [dbo].[PAISES]
  WHERE ltrim(rtrim([nombre_pais])) like '%' + ltrim(rtrim(@Nombre)) + '%'

END
GO

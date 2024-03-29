USE [OBJ_REDES]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 12/19/2012 17:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[Fecha_Nacimiento] [smalldatetime] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[agr_usuario]    Script Date: 12/19/2012 17:29:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[agr_usuario]
	@nombre nvarchar(50),
	@apellido nvarchar(50),
	@correo nvarchar(50),
	@fechaNac smalldatetime,
	@password nvarchar(50),
	@tipo nvarchar(50)
as
begin
	insert into Usuarios
	values
	(
		@nombre,
		@apellido,
		@correo,
		@fechaNac,
		@password,
		@tipo
	)
end
GO

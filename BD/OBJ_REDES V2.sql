USE [OBJ_REDES]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 12/28/2012 11:27:13 ******/
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
/****** Object:  Table [dbo].[Actividades]    Script Date: 12/28/2012 11:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividades](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Actividades] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 12/28/2012 11:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Reactivo] [text] NOT NULL,
	[FK_Actividad] [int] NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Det_Actividad_Usuario]    Script Date: 12/28/2012 11:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Det_Actividad_Usuario](
	[FK_Actividad] [int] NOT NULL,
	[FK_Usuario] [int] NOT NULL,
	[Creador] [bit] NOT NULL,
	[Calificacion] [float] NULL,
	[Fecha_Realizacion] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[agr_usuario]    Script Date: 12/28/2012 11:27:22 ******/
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
/****** Object:  StoredProcedure [dbo].[agr_actividad]    Script Date: 12/28/2012 11:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[agr_actividad]
	@tipo nvarchar(50)
as
begin
	insert into Actividades values
	(
		@tipo
	)
	select SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[agr_pregunta]    Script Date: 12/28/2012 11:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agr_pregunta]
	@reactivo text,
	@fk_actividad int
AS
BEGIN
	INSERT INTO Preguntas VALUES
	(
		@reactivo,
		@fk_actividad
	)
	select SCOPE_IDENTITY()
END
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 12/28/2012 11:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Respuesta] [text] NOT NULL,
	[FK_Pregunta] [int] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[agr_respuesta]    Script Date: 12/28/2012 11:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agr_respuesta]
	@respuesta text,
	@fk_pregunta int
AS
BEGIN
	INSERT INTO Respuestas VALUES
	(
		@respuesta,
		@fk_pregunta
	)
	select SCOPE_IDENTITY()
END
GO
/****** Object:  ForeignKey [FK_Det_Actividad_Usuario_Actividades]    Script Date: 12/28/2012 11:27:13 ******/
ALTER TABLE [dbo].[Det_Actividad_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Det_Actividad_Usuario_Actividades] FOREIGN KEY([FK_Actividad])
REFERENCES [dbo].[Actividades] ([ID])
GO
ALTER TABLE [dbo].[Det_Actividad_Usuario] CHECK CONSTRAINT [FK_Det_Actividad_Usuario_Actividades]
GO
/****** Object:  ForeignKey [FK_Det_Actividad_Usuario_Usuarios]    Script Date: 12/28/2012 11:27:13 ******/
ALTER TABLE [dbo].[Det_Actividad_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Det_Actividad_Usuario_Usuarios] FOREIGN KEY([FK_Usuario])
REFERENCES [dbo].[Usuarios] ([ID])
GO
ALTER TABLE [dbo].[Det_Actividad_Usuario] CHECK CONSTRAINT [FK_Det_Actividad_Usuario_Usuarios]
GO
/****** Object:  ForeignKey [FK_Preguntas_Actividades]    Script Date: 12/28/2012 11:27:13 ******/
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Actividades] FOREIGN KEY([FK_Actividad])
REFERENCES [dbo].[Actividades] ([ID])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Actividades]
GO
/****** Object:  ForeignKey [FK_Respuestas_Preguntas]    Script Date: 12/28/2012 11:27:13 ******/
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([FK_Pregunta])
REFERENCES [dbo].[Preguntas] ([ID])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO

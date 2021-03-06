USE [BDArbol]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 05/16/2016 02:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id_Empleado] [int] NULL,
	[Id_Padre] [int] NULL,
	[Emp_Nombre] [varchar](150) NULL,
	[Emp_Fase] [varchar](150) NULL,
	[Emp_Horas] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Empleado] ([Id_Empleado], [Id_Padre], [Emp_Nombre], [Emp_Fase], [Emp_Horas]) VALUES (6, 1, N'Empleado 6', N'Implantación', 20)
INSERT [dbo].[Empleado] ([Id_Empleado], [Id_Padre], [Emp_Nombre], [Emp_Fase], [Emp_Horas]) VALUES (4, 3, N'Empleado 4', N'Desarrollo', 60)
INSERT [dbo].[Empleado] ([Id_Empleado], [Id_Padre], [Emp_Nombre], [Emp_Fase], [Emp_Horas]) VALUES (7, 6, N'Empleado 7', N'Implantación', 20)
INSERT [dbo].[Empleado] ([Id_Empleado], [Id_Padre], [Emp_Nombre], [Emp_Fase], [Emp_Horas]) VALUES (7, 4, N'Empleado 7', N'Desarrollo', 70)
INSERT [dbo].[Empleado] ([Id_Empleado], [Id_Padre], [Emp_Nombre], [Emp_Fase], [Emp_Horas]) VALUES (7, 7, N'Empleado 7', N'Desarrollo', 20)
INSERT [dbo].[Empleado] ([Id_Empleado], [Id_Padre], [Emp_Nombre], [Emp_Fase], [Emp_Horas]) VALUES (13, 5, N'Empleado 13', N'Desarrollo', 50)
INSERT [dbo].[Empleado] ([Id_Empleado], [Id_Padre], [Emp_Nombre], [Emp_Fase], [Emp_Horas]) VALUES (8, 8, N'Empleado 8', N'Implantación', 80)
INSERT [dbo].[Empleado] ([Id_Empleado], [Id_Padre], [Emp_Nombre], [Emp_Fase], [Emp_Horas]) VALUES (7, 2, N'Empleado 7', N'Diseño', 80)
INSERT [dbo].[Empleado] ([Id_Empleado], [Id_Padre], [Emp_Nombre], [Emp_Fase], [Emp_Horas]) VALUES (5, 5, N'Empleado 5', N'Implantación', 40)
INSERT [dbo].[Empleado] ([Id_Empleado], [Id_Padre], [Emp_Nombre], [Emp_Fase], [Emp_Horas]) VALUES (6, 3, N'Empleado 6', N'Diseño', 30)
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/16/2016 02:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Usu_Nombre] [varchar](150) NULL,
	[Usu_Usuario] [varchar](150) NULL,
	[Usu_Clave] [varchar](150) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON
INSERT [dbo].[Usuario] ([Id_Usuario], [Usu_Nombre], [Usu_Usuario], [Usu_Clave]) VALUES (1, N'Orry Nays Cruzado Morey', N'ocruzado', N'admin123')
INSERT [dbo].[Usuario] ([Id_Usuario], [Usu_Nombre], [Usu_Usuario], [Usu_Clave]) VALUES (2, N'Jose Armando Cruzado', N'jcruzado', N'admin123')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  StoredProcedure [dbo].[pa_ObtenerUsuario]    Script Date: 05/16/2016 02:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[pa_ObtenerUsuario]
	--@Id_Usuario	int,
	--@Usu_Nombre	varchar(150),
	@Usu_Usuario varchar(150),
	@Usu_Clave varchar(150)
AS
BEGIN
	select 
		u.Id_Usuario,
		u.Usu_Nombre
	from Usuario as u
	where
		u.Usu_Usuario = @Usu_Usuario and
		u.Usu_Clave = @Usu_Clave 
		
END
GO
/****** Object:  StoredProcedure [dbo].[pa_ListarEmpleadoData]    Script Date: 05/16/2016 02:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pa_ListarEmpleadoData]
as
begin 
	select
		e.Id_Empleado,
		e.Id_Padre,
		e.Emp_Nombre,
		e.Emp_Fase,
		e.Emp_Horas
	from 
		Empleado as e;	
end
GO
/****** Object:  StoredProcedure [dbo].[pa_ListarEmpleadoArbol]    Script Date: 05/16/2016 02:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pa_ListarEmpleadoArbol]
as
begin 

	select distinct
		e.Id_Empleado,
		e.Id_Padre,
		e.Emp_Nombre
	from 
		Empleado as e;	
end
GO
/****** Object:  StoredProcedure [dbo].[pa_ListarEmpleado_Fase]    Script Date: 05/16/2016 02:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[pa_ListarEmpleado_Fase]
as
begin
	select 
		e.Id_Empleado, 
		e.emp_Nombre,
		SUM(case when (e.emp_Fase = 'Análisis') then emp_Horas else 0 end) as 'Análisis',
		SUM(case when (e.emp_Fase = 'Diseño') then emp_Horas else 0 end) as 'Diseño',
		SUM(case when (e.emp_Fase = 'Desarrollo') then emp_Horas else 0 end) as 'Desarrollo',
		SUM(case when (e.emp_Fase = 'Pruebas') then emp_Horas else 0 end) as 'Pruebas',
		SUM(case when (e.emp_Fase = 'Implantación') then emp_Horas else 0 end) as 'Implantación',
		SUM(case when (e.Id_Empleado = e.Id_Empleado) then emp_Horas else 0 end) as 'TOTAL'
	from Empleado as e
	group by 
	e.Id_Empleado, 
	e.emp_Nombre
END
GO
/****** Object:  StoredProcedure [dbo].[pa_InsertarUsuario]    Script Date: 05/16/2016 02:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[pa_InsertarUsuario]
	--@Id_Usuario	int,
	@Usu_Nombre	varchar(150),
	@Usu_Usuario	varchar(150),
	@Usu_Clave	varchar(150),
	
	@ID int output
AS
BEGIN
	
	insert into Usuario(
		--Id_Usuario,
		Usu_Nombre,
		Usu_Usuario,
		Usu_Clave
	)values(
		@Usu_Nombre,
		@Usu_Usuario,
		@Usu_Clave
	);
	
	--select @@IDENTITY
	set @ID=@@IDENTITY;

END
GO
/****** Object:  StoredProcedure [dbo].[pa_InsertarEmpleado]    Script Date: 05/16/2016 02:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[pa_InsertarEmpleado]
	@Id_Empleado int,
	@Id_Padre int,
	@Emp_Nombre varchar(150),
	@Emp_Fase varchar(150),
	@Emp_Horas int
AS
BEGIN
	
	insert into Empleado(
		Id_Empleado,
		Id_Padre,
		Emp_Nombre,
		Emp_Fase,
		Emp_Horas
	)values(
		@Id_Empleado,
		@Id_Padre,
		@Emp_Nombre,
		@Emp_Fase,
		@Emp_Horas
	);

END
GO
/****** Object:  StoredProcedure [dbo].[pa_EliminarEmpleadoData]    Script Date: 05/16/2016 02:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_EliminarEmpleadoData]
as
BEGIN
	truncate table Empleado;
END
GO

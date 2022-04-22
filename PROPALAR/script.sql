USE [master]
GO
/****** Object:  Database [proyecto titulo]    Script Date: 21/4/2022 22:06:25 ******/
CREATE DATABASE [proyecto titulo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyecto titulo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proyecto titulo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proyecto titulo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proyecto titulo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [proyecto titulo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyecto titulo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyecto titulo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyecto titulo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyecto titulo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyecto titulo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyecto titulo] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyecto titulo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proyecto titulo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyecto titulo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyecto titulo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyecto titulo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyecto titulo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyecto titulo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyecto titulo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyecto titulo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyecto titulo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [proyecto titulo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyecto titulo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyecto titulo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyecto titulo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyecto titulo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyecto titulo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyecto titulo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyecto titulo] SET RECOVERY FULL 
GO
ALTER DATABASE [proyecto titulo] SET  MULTI_USER 
GO
ALTER DATABASE [proyecto titulo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyecto titulo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyecto titulo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyecto titulo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyecto titulo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [proyecto titulo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'proyecto titulo', N'ON'
GO
ALTER DATABASE [proyecto titulo] SET QUERY_STORE = OFF
GO
USE [proyecto titulo]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[id_admin] [int] NOT NULL,
	[nickname] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[id_pais] [int] NULL,
	[contraseña] [varchar](50) NULL,
	[id_categoria_adm] [int] NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beneficios]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficios](
	[id_benef] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[foto] [varbinary](max) NULL,
 CONSTRAINT [PK_Beneficios] PRIMARY KEY CLUSTERED 
(
	[id_benef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria_adm]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria_adm](
	[id_categoria_adm] [int] NOT NULL,
	[nombre categoria] [varchar](50) NULL,
 CONSTRAINT [PK_categoria_adm] PRIMARY KEY CLUSTERED 
(
	[id_categoria_adm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudad](
	[id_ciudad] [int] NOT NULL,
	[nombre_ciudad] [varchar](50) NULL,
	[id_pais] [int] NULL,
 CONSTRAINT [PK_ciudad] PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipo_trabajo]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipo_trabajo](
	[id_equipo_trab] [int] NULL,
	[nombre] [varchar](50) NULL,
	[foto] [varbinary](max) NULL,
	[cargo] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material_visual_pro]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_visual_pro](
	[id_material] [int] NOT NULL,
	[foto] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Material_visual_pro] PRIMARY KEY CLUSTERED 
(
	[id_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[id_pais] [int] NOT NULL,
	[nombre_pais] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyecto]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyecto](
	[id_proyecto] [int] NOT NULL,
	[nombre_proyecto] [varchar](50) NULL,
	[descripccion_proyecto] [varchar](1000) NULL,
	[id_tipo_proyecto] [int] NULL,
	[monto_recaudar] [int] NULL,
	[monto_recaudado] [int] NULL,
	[id_solicitud] [int] NULL,
	[id_equipo_trab] [int] NULL,
	[id_material] [int] NULL,
	[id_benef] [int] NULL,
 CONSTRAINT [PK_Proyecto] PRIMARY KEY CLUSTERED 
(
	[id_proyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitudes]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitudes](
	[id_solicitud] [int] NOT NULL,
	[id_tipo_solicitud] [int] NULL,
	[descripcion] [varchar](1000) NULL,
 CONSTRAINT [PK_solicitudes] PRIMARY KEY CLUSTERED 
(
	[id_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_proyecto]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_proyecto](
	[id_tipo_proyecto] [int] NOT NULL,
	[categoria] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_proyecto] PRIMARY KEY CLUSTERED 
(
	[id_tipo_proyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_solicitud]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_solicitud](
	[id_tipo_solicitud] [int] NOT NULL,
	[categoria] [varchar](50) NULL,
 CONSTRAINT [PK_Tipo_solicitud] PRIMARY KEY CLUSTERED 
(
	[id_tipo_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaccion]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaccion](
	[id_transac] [int] NOT NULL,
	[fecha] [date] NULL,
	[monto] [int] NULL,
	[id_usuario] [int] NULL,
	[id_proyecto] [int] NULL,
 CONSTRAINT [PK_transaccion] PRIMARY KEY CLUSTERED 
(
	[id_transac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 21/4/2022 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] NOT NULL,
	[nickname] [varchar](50) NULL,
	[contraseña] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[apellido_pat] [varchar](50) NULL,
	[apellido_mat] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[id_pais] [int] NULL,
	[telefono] [varchar](50) NULL,
	[id_solicitud] [int] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_categoria_adm] FOREIGN KEY([id_categoria_adm])
REFERENCES [dbo].[categoria_adm] ([id_categoria_adm])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_categoria_adm]
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Pais] FOREIGN KEY([id_pais])
REFERENCES [dbo].[Pais] ([id_pais])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Pais]
GO
ALTER TABLE [dbo].[ciudad]  WITH CHECK ADD  CONSTRAINT [FK_ciudad_Pais1] FOREIGN KEY([id_pais])
REFERENCES [dbo].[Pais] ([id_pais])
GO
ALTER TABLE [dbo].[ciudad] CHECK CONSTRAINT [FK_ciudad_Pais1]
GO
ALTER TABLE [dbo].[Equipo_trabajo]  WITH CHECK ADD  CONSTRAINT [FK_Equipo_trabajo_Proyecto] FOREIGN KEY([id_equipo_trab])
REFERENCES [dbo].[Proyecto] ([id_proyecto])
GO
ALTER TABLE [dbo].[Equipo_trabajo] CHECK CONSTRAINT [FK_Equipo_trabajo_Proyecto]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_Beneficios] FOREIGN KEY([id_benef])
REFERENCES [dbo].[Beneficios] ([id_benef])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_Beneficios]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_Material_visual_pro] FOREIGN KEY([id_material])
REFERENCES [dbo].[Material_visual_pro] ([id_material])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_Material_visual_pro]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_solicitudes] FOREIGN KEY([id_solicitud])
REFERENCES [dbo].[solicitudes] ([id_solicitud])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_solicitudes]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_tipo_proyecto] FOREIGN KEY([id_tipo_proyecto])
REFERENCES [dbo].[tipo_proyecto] ([id_tipo_proyecto])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_tipo_proyecto]
GO
ALTER TABLE [dbo].[solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_solicitudes_Tipo_solicitud] FOREIGN KEY([id_tipo_solicitud])
REFERENCES [dbo].[Tipo_solicitud] ([id_tipo_solicitud])
GO
ALTER TABLE [dbo].[solicitudes] CHECK CONSTRAINT [FK_solicitudes_Tipo_solicitud]
GO
ALTER TABLE [dbo].[transaccion]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_Proyecto] FOREIGN KEY([id_proyecto])
REFERENCES [dbo].[Proyecto] ([id_proyecto])
GO
ALTER TABLE [dbo].[transaccion] CHECK CONSTRAINT [FK_transaccion_Proyecto]
GO
ALTER TABLE [dbo].[transaccion]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[transaccion] CHECK CONSTRAINT [FK_transaccion_usuario]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_Pais] FOREIGN KEY([id_pais])
REFERENCES [dbo].[Pais] ([id_pais])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_Pais]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_solicitudes] FOREIGN KEY([id_solicitud])
REFERENCES [dbo].[solicitudes] ([id_solicitud])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_solicitudes]
GO
USE [master]
GO
ALTER DATABASE [proyecto titulo] SET  READ_WRITE 
GO

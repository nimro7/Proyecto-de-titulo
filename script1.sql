USE [master]
GO
/****** Object:  Database [proyecto_titulo]    Script Date: 22/4/2022 17:11:36 ******/
CREATE DATABASE [proyecto_titulo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyecto titulo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proyecto titulo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proyecto titulo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proyecto titulo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [proyecto_titulo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyecto_titulo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyecto_titulo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyecto_titulo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyecto_titulo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyecto_titulo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyecto_titulo] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyecto_titulo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proyecto_titulo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyecto_titulo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyecto_titulo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyecto_titulo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyecto_titulo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyecto_titulo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyecto_titulo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyecto_titulo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyecto_titulo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [proyecto_titulo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyecto_titulo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyecto_titulo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyecto_titulo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyecto_titulo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyecto_titulo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyecto_titulo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyecto_titulo] SET RECOVERY FULL 
GO
ALTER DATABASE [proyecto_titulo] SET  MULTI_USER 
GO
ALTER DATABASE [proyecto_titulo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyecto_titulo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyecto_titulo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyecto_titulo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyecto_titulo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [proyecto_titulo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'proyecto_titulo', N'ON'
GO
ALTER DATABASE [proyecto_titulo] SET QUERY_STORE = OFF
GO
USE [proyecto_titulo]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[auth_group]    Script Date: 22/4/2022 17:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 22/4/2022 17:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 22/4/2022 17:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 22/4/2022 17:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetime2](7) NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 22/4/2022 17:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 22/4/2022 17:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beneficios]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[categoria_adm]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[ciudad]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 22/4/2022 17:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetime2](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 22/4/2022 17:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 22/4/2022 17:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 22/4/2022 17:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipo_trabajo]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[Material_visual_pro]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[Pais]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[Proyecto]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[solicitudes]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[tipo_proyecto]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[Tipo_solicitud]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[transaccion]    Script Date: 22/4/2022 17:11:36 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 22/4/2022 17:11:36 ******/
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
SET IDENTITY_INSERT [dbo].[auth_permission] ON 

INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (1, N'Can add log entry', 1, N'add_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (2, N'Can change log entry', 1, N'change_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (3, N'Can delete log entry', 1, N'delete_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (4, N'Can view log entry', 1, N'view_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (5, N'Can add permission', 2, N'add_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (6, N'Can change permission', 2, N'change_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (7, N'Can delete permission', 2, N'delete_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (8, N'Can view permission', 2, N'view_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (9, N'Can add group', 3, N'add_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (10, N'Can change group', 3, N'change_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (11, N'Can delete group', 3, N'delete_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (12, N'Can view group', 3, N'view_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (13, N'Can add user', 4, N'add_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (14, N'Can change user', 4, N'change_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (15, N'Can delete user', 4, N'delete_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (16, N'Can view user', 4, N'view_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (17, N'Can add content type', 5, N'add_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (18, N'Can change content type', 5, N'change_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (19, N'Can delete content type', 5, N'delete_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (20, N'Can view content type', 5, N'view_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (21, N'Can add session', 6, N'add_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (22, N'Can change session', 6, N'change_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (23, N'Can delete session', 6, N'delete_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (24, N'Can view session', 6, N'view_session')
SET IDENTITY_INSERT [dbo].[auth_permission] OFF
GO
SET IDENTITY_INSERT [dbo].[django_content_type] ON 

INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'admin', N'logentry')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'group')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'auth', N'permission')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'user')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'contenttypes', N'contenttype')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (6, N'sessions', N'session')
SET IDENTITY_INSERT [dbo].[django_content_type] OFF
GO
SET IDENTITY_INSERT [dbo].[django_migrations] ON 

INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', CAST(N'2022-04-22T20:57:47.4116090' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'auth', N'0001_initial', CAST(N'2022-04-22T20:57:47.4325520' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'admin', N'0001_initial', CAST(N'2022-04-22T20:57:47.4544940' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'admin', N'0002_logentry_remove_auto_add', CAST(N'2022-04-22T20:57:47.4634690' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'admin', N'0003_logentry_add_action_flag_choices', CAST(N'2022-04-22T20:57:47.4704510' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'contenttypes', N'0002_remove_content_type_name', CAST(N'2022-04-22T20:57:47.7308160' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0002_alter_permission_name_max_length', CAST(N'2022-04-22T20:57:47.7365330' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0003_alter_user_email_max_length', CAST(N'2022-04-22T20:57:47.7445120' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0004_alter_user_username_opts', CAST(N'2022-04-22T20:57:47.7504960' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'auth', N'0005_alter_user_last_login_null', CAST(N'2022-04-22T20:57:47.7594730' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'auth', N'0006_require_contenttypes_0002', CAST(N'2022-04-22T20:57:47.7624650' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'auth', N'0007_alter_validators_add_error_messages', CAST(N'2022-04-22T20:57:47.7694460' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'auth', N'0008_alter_user_username_max_length', CAST(N'2022-04-22T20:57:48.0207570' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (14, N'auth', N'0009_alter_user_last_name_max_length', CAST(N'2022-04-22T20:57:48.0277390' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (15, N'auth', N'0010_alter_group_name_max_length', CAST(N'2022-04-22T20:57:48.2860490' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (16, N'auth', N'0011_update_proxy_permissions', CAST(N'2022-04-22T20:57:48.2920310' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (17, N'sessions', N'0001_initial', CAST(N'2022-04-22T20:57:48.2960210' AS DateTime2))
SET IDENTITY_INSERT [dbo].[django_migrations] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_group_name_a6ea08ec_uniq]    Script Date: 22/4/2022 17:11:36 ******/
ALTER TABLE [dbo].[auth_group] ADD  CONSTRAINT [auth_group_name_a6ea08ec_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 22/4/2022 17:11:36 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 22/4/2022 17:11:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 22/4/2022 17:11:36 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 22/4/2022 17:11:36 ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 22/4/2022 17:11:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [dbo].[auth_permission]
(
	[content_type_id] ASC,
	[codename] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [codename] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_user_username_6821ab7c_uniq]    Script Date: 22/4/2022 17:11:36 ******/
ALTER TABLE [dbo].[auth_user] ADD  CONSTRAINT [auth_user_username_6821ab7c_uniq] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_group_id_97559544]    Script Date: 22/4/2022 17:11:36 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_6a12ed8b]    Script Date: 22/4/2022 17:11:36 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_user_id_6a12ed8b] ON [dbo].[auth_user_groups]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_group_id_94350c0c_uniq]    Script Date: 22/4/2022 17:11:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_groups_user_id_group_id_94350c0c_uniq] ON [dbo].[auth_user_groups]
(
	[user_id] ASC,
	[group_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_permission_id_1fbb5f2c]    Script Date: 22/4/2022 17:11:36 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_a95ead1b]    Script Date: 22/4/2022 17:11:36 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq]    Script Date: 22/4/2022 17:11:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC,
	[permission_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 22/4/2022 17:11:36 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 22/4/2022 17:11:36 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 22/4/2022 17:11:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 22/4/2022 17:11:36 ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[ciudad]  WITH CHECK ADD  CONSTRAINT [FK_ciudad_Pais1] FOREIGN KEY([id_pais])
REFERENCES [dbo].[Pais] ([id_pais])
GO
ALTER TABLE [dbo].[ciudad] CHECK CONSTRAINT [FK_ciudad_Pais1]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id]
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
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
USE [master]
GO
ALTER DATABASE [proyecto_titulo] SET  READ_WRITE 
GO

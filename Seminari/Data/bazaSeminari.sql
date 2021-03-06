USE [BazaSeminari]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 31.3.2021. 21:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 31.3.2021. 21:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 31.3.2021. 21:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 31.3.2021. 21:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 31.3.2021. 21:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 31.3.2021. 21:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 31.3.2021. 21:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 31.3.2021. 21:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[predavac]    Script Date: 31.3.2021. 21:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[predavac](
	[ID_predavac] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NULL,
	[prezime] [nvarchar](50) NULL,
 CONSTRAINT [PK_predavac] PRIMARY KEY CLUSTERED 
(
	[ID_predavac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[predbiljezba]    Script Date: 31.3.2021. 21:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[predbiljezba](
	[ID_predbiljezba] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[prezime] [nvarchar](50) NOT NULL,
	[adresa] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[telefon] [nvarchar](50) NOT NULL,
	[datum] [date] NOT NULL,
	[ID_seminar] [int] NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_predbiljezba] PRIMARY KEY CLUSTERED 
(
	[ID_predbiljezba] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seminar]    Script Date: 31.3.2021. 21:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seminar](
	[ID_seminar] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
	[opis] [nvarchar](250) NULL,
	[datum] [date] NULL,
	[popunjen] [bit] NULL,
	[ID_predavac] [int] NULL,
 CONSTRAINT [PK_seminar] PRIMARY KEY CLUSTERED 
(
	[ID_seminar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210317170055_AddingIdentity', N'5.0.4')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8e1402db-ffcc-4e14-954b-310bb3b0a12f', N'admin', N'ADMIN', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEDUkK09lMp89CmoWb9Viq7i7cSdi3ev+lZYJpOSd82pbg8KsMsK0cS5U81uUQtqDeQ==', N'4XITGSCA42I7L3PZRXNSVITGYEIDYHW6', N'65b6ee37-591c-4f2a-b489-75f2bf4bfaa9', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[predavac] ON 

INSERT [dbo].[predavac] ([ID_predavac], [ime], [prezime]) VALUES (1, N'Bojan', N'Bračić')
INSERT [dbo].[predavac] ([ID_predavac], [ime], [prezime]) VALUES (2, N'Žarko', N'Dubinko')
INSERT [dbo].[predavac] ([ID_predavac], [ime], [prezime]) VALUES (3, N'Šiško', N'Grabovac')
INSERT [dbo].[predavac] ([ID_predavac], [ime], [prezime]) VALUES (4, N'Damjan', N'Dolar')
INSERT [dbo].[predavac] ([ID_predavac], [ime], [prezime]) VALUES (5, N'Tamara', N'Križanić')
INSERT [dbo].[predavac] ([ID_predavac], [ime], [prezime]) VALUES (6, N'Ivana', N'Martinović')
INSERT [dbo].[predavac] ([ID_predavac], [ime], [prezime]) VALUES (7, N'Božidar', N'Zajc')
INSERT [dbo].[predavac] ([ID_predavac], [ime], [prezime]) VALUES (8, N'Josipa', N'Prokopić')
INSERT [dbo].[predavac] ([ID_predavac], [ime], [prezime]) VALUES (9, N'Mario', N'Lipanović')
INSERT [dbo].[predavac] ([ID_predavac], [ime], [prezime]) VALUES (10, N'Ostoja', N'Radovanović')
SET IDENTITY_INSERT [dbo].[predavac] OFF
GO
SET IDENTITY_INSERT [dbo].[predbiljezba] ON 

INSERT [dbo].[predbiljezba] ([ID_predbiljezba], [ime], [prezime], [adresa], [email], [telefon], [datum], [ID_seminar], [status]) VALUES (15, N'Marko', N'Marković', N'Ivana Meštrovića 3, Osijek', N'mmarkovic@gmail.com', N'0952143356', CAST(N'2021-04-02' AS Date), 2, 0)
INSERT [dbo].[predbiljezba] ([ID_predbiljezba], [ime], [prezime], [adresa], [email], [telefon], [datum], [ID_seminar], [status]) VALUES (17, N'Stipo', N'Stipić', N'Marka Marulića 4, Omiš', N'sstipic@gmail.com', N'091457666', CAST(N'2021-03-27' AS Date), 8, 1)
INSERT [dbo].[predbiljezba] ([ID_predbiljezba], [ime], [prezime], [adresa], [email], [telefon], [datum], [ID_seminar], [status]) VALUES (20, N'Marko', N'Svetlić', N'Tita Brezovačkog 4, Velika Gorica', N'msvetlic@hotmail.com', N'0913715520', CAST(N'2021-03-27' AS Date), 8, NULL)
INSERT [dbo].[predbiljezba] ([ID_predbiljezba], [ime], [prezime], [adresa], [email], [telefon], [datum], [ID_seminar], [status]) VALUES (21, N'Tomo', N'Belus', N'Vicka Bogojevića 19, Split', N'tbelus@gmail.com', N'0921247895', CAST(N'2021-03-27' AS Date), 7, NULL)
INSERT [dbo].[predbiljezba] ([ID_predbiljezba], [ime], [prezime], [adresa], [email], [telefon], [datum], [ID_seminar], [status]) VALUES (22, N'Tomislav', N'Novaković', N'Livadska 4, Đurđevac', N'tnovakovic@gmail.com', N'0934598878', CAST(N'2021-03-27' AS Date), 9, NULL)
INSERT [dbo].[predbiljezba] ([ID_predbiljezba], [ime], [prezime], [adresa], [email], [telefon], [datum], [ID_seminar], [status]) VALUES (1003, N'Ivo', N'Marinković', N'Josipa Horvata 20, Rijeka', N'imarinkovic@gmail.com', N'0924243569', CAST(N'2021-03-31' AS Date), 6, 1)
INSERT [dbo].[predbiljezba] ([ID_predbiljezba], [ime], [prezime], [adresa], [email], [telefon], [datum], [ID_seminar], [status]) VALUES (1004, N'Frane', N'Petković', N'Juraja Dobrile 5a, Omiš', N'fpetko@hotmail.com', N'0953457421', CAST(N'2021-03-31' AS Date), 12, NULL)
SET IDENTITY_INSERT [dbo].[predbiljezba] OFF
GO
SET IDENTITY_INSERT [dbo].[seminar] ON 

INSERT [dbo].[seminar] ([ID_seminar], [naziv], [opis], [datum], [popunjen], [ID_predavac]) VALUES (1, N'ASP.NET developer', N'Razvoj dinamičkih web stranica', CAST(N'2021-04-12' AS Date), 0, 1)
INSERT [dbo].[seminar] ([ID_seminar], [naziv], [opis], [datum], [popunjen], [ID_predavac]) VALUES (2, N'Administrator baza podataka', N'Administracija baza podataka', CAST(N'2021-04-05' AS Date), 0, 2)
INSERT [dbo].[seminar] ([ID_seminar], [naziv], [opis], [datum], [popunjen], [ID_predavac]) VALUES (6, N'Android programer', N'Izrada Android aplikacija koristeći Kotlin i Android SDK', CAST(N'2021-04-01' AS Date), 0, 3)
INSERT [dbo].[seminar] ([ID_seminar], [naziv], [opis], [datum], [popunjen], [ID_predavac]) VALUES (7, N'Front-end developer', N'Front-end programiranje u JavaScriptu', CAST(N'2021-05-22' AS Date), NULL, 9)
INSERT [dbo].[seminar] ([ID_seminar], [naziv], [opis], [datum], [popunjen], [ID_predavac]) VALUES (8, N'Back-end developer', N'PHP, MySQL i Laravel radno okružje', CAST(N'2021-04-15' AS Date), 0, 6)
INSERT [dbo].[seminar] ([ID_seminar], [naziv], [opis], [datum], [popunjen], [ID_predavac]) VALUES (9, N'Web-dizajner', N'Dizajniranje web stranica', CAST(N'2021-06-12' AS Date), NULL, 7)
INSERT [dbo].[seminar] ([ID_seminar], [naziv], [opis], [datum], [popunjen], [ID_predavac]) VALUES (10, N'CCNA akademija', N'Dizajn, izgradnja i održavanje računalnih mreža', CAST(N'2021-06-01' AS Date), NULL, 10)
INSERT [dbo].[seminar] ([ID_seminar], [naziv], [opis], [datum], [popunjen], [ID_predavac]) VALUES (11, N'Sistemski i mrežni administrator', N'Zakoračite u uzbudljiv svijet informacijske tehnologije', CAST(N'2021-05-15' AS Date), NULL, 9)
INSERT [dbo].[seminar] ([ID_seminar], [naziv], [opis], [datum], [popunjen], [ID_predavac]) VALUES (12, N'Grafički dizajner', N'Usmjerite svoju kreativnost u jedno od najtraženijih područja dizajna', CAST(N'2021-05-01' AS Date), NULL, 5)
SET IDENTITY_INSERT [dbo].[seminar] OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[predbiljezba]  WITH CHECK ADD  CONSTRAINT [FK_predbiljezba_seminar] FOREIGN KEY([ID_seminar])
REFERENCES [dbo].[seminar] ([ID_seminar])
GO
ALTER TABLE [dbo].[predbiljezba] CHECK CONSTRAINT [FK_predbiljezba_seminar]
GO
ALTER TABLE [dbo].[seminar]  WITH CHECK ADD  CONSTRAINT [FK_seminar_predavac] FOREIGN KEY([ID_predavac])
REFERENCES [dbo].[predavac] ([ID_predavac])
GO
ALTER TABLE [dbo].[seminar] CHECK CONSTRAINT [FK_seminar_predavac]
GO

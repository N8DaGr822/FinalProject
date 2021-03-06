IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] DROP CONSTRAINT [FK_TSTTickets_TSTTicketStatuses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketPriorities]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] DROP CONSTRAINT [FK_TSTTickets_TSTTicketPriorities]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] DROP CONSTRAINT [FK_TSTTickets_TSTEmployees1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] DROP CONSTRAINT [FK_TSTTickets_TSTEmployees]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTTickets]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes] DROP CONSTRAINT [FK_TSTTechNotes_TSTTickets]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes] DROP CONSTRAINT [FK_TSTTechNotes_TSTEmployees]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTEmployeeStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] DROP CONSTRAINT [FK_TSTEmployees_TSTEmployeeStatuses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] DROP CONSTRAINT [FK_TSTEmployees_TSTDepartments]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[TSTTicketStatuses]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTicketStatuses]') AND type in (N'U'))
DROP TABLE [dbo].[TSTTicketStatuses]
GO
/****** Object:  Table [dbo].[TSTTickets]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTickets]') AND type in (N'U'))
DROP TABLE [dbo].[TSTTickets]
GO
/****** Object:  Table [dbo].[TSTTicketPriorities]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTicketPriorities]') AND type in (N'U'))
DROP TABLE [dbo].[TSTTicketPriorities]
GO
/****** Object:  Table [dbo].[TSTTechNotes]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]') AND type in (N'U'))
DROP TABLE [dbo].[TSTTechNotes]
GO
/****** Object:  Table [dbo].[TSTEmployeeStatuses]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployeeStatuses]') AND type in (N'U'))
DROP TABLE [dbo].[TSTEmployeeStatuses]
GO
/****** Object:  Table [dbo].[TSTEmployees]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployees]') AND type in (N'U'))
DROP TABLE [dbo].[TSTEmployees]
GO
/****** Object:  Table [dbo].[TSTDepartments]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTDepartments]') AND type in (N'U'))
DROP TABLE [dbo].[TSTDepartments]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/11/2016 9:59:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/11/2016 9:59:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTDepartments]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTDepartments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTDepartments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TSTDepartments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTEmployees]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTEmployees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](25) NOT NULL,
	[Lname] [nvarchar](25) NOT NULL,
	[DOB] [smalldatetime] NOT NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](25) NULL,
	[State] [nvarchar](2) NULL,
	[Zip] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[HireDate] [smalldatetime] NOT NULL,
	[SeparationDate] [smalldatetime] NULL,
	[JobTitle] [nvarchar](25) NULL,
	[IsActive] [bit] NOT NULL,
	[Image] [nvarchar](100) NULL,
	[Note] [nvarchar](max) NULL,
	[UserID] [nvarchar](100) NULL,
	[DeptID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_TSTEmployees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTEmployeeStatuses]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployeeStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTEmployeeStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_TSTEmployeeStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTTechNotes]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTTechNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TechID] [int] NOT NULL,
	[TicketID] [int] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[TimeCreated] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TSTTechNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTTicketPriorities]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTicketPriorities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTTicketPriorities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_TSTTicketPriorities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTTickets]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTickets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTTickets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubmitedByID] [int] NOT NULL,
	[TechID] [int] NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[ResolutionDate] [smalldatetime] NULL,
	[Description] [nvarchar](max) NOT NULL,
	[StatusID] [int] NOT NULL,
	[PriorityID] [int] NOT NULL,
	[Subject] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_TSTTickets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTTicketStatuses]    Script Date: 8/11/2016 9:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTicketStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTTicketStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_TSTTicketStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201608021554394_InitialCreate', N'IdentitySample.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE4B8117D0F907F10F49404DE962F99C1C468EFC2DBB61323E30BA6ED41DE066C89DD5646A2B412E5B511E4CBF2904FCA2FA4285117DE74E996BBDB8B0516D32279AA583C248BC5A2FFF79FFF4E7F7A0903EB1927A91F9133FB6872685B98B891E793D5999DD1E50F9FEC9F7EFCFDEFA6975EF8627D2DEB9DB07AD092A467F613A5F1A9E3A4EE130E513A097D3789D26849276E143AC88B9CE3C3C3BF3847470E06081BB02C6BFA2523D40F71FE037ECE22E2E2986628B8893C1CA4FC3B94CC7354EB1685388D918BCFEC6B0F435BFA3A47611CE049D1C0B6CE031F8132731C2C6D0B1112514441D5D3C714CF691291D53C860F2878788D31D45BA220C5BC0BA775F5BEBD393C66BD71EA8625949BA5340A07021E9D70F33872F3B58C6C57E603035EE6C662BDCE8D58DBEF4B1480016481A7B3206195CFEC9B4AC4791ADF623A291B4E0AC8AB04E07E8D92EF9326E281D5BBDD4145A7E3C921FBEFC09A6501CD127C46704613141C58F7D922F0DDBFE3D787E83B266727478BE5C9A70F1F9177F2F1CFF8E443B3A7D057A8277C804FF74914E30474C3CBAAFFB6E588ED1CB961D5ACD1A6B00A700966866DDDA097CF98ACE813CC99E34FB675E5BF60AFFCC2C9F5487C9848D0882619FCBCCD82002D025C953BAD32D9FF5BA41E7FF8388AD45BF4ECAFF2A197E4C3C449605E7DC1415E9A3EF97131BD84F1FEC6AB5D2551C87E8BFC2A4ABFCDA32C7159672263950794AC3015B59B3A35797B519A418D4FEB1275FFA9CD3455E9ADADCA3AB4CE4C28456C7B3694FABEADDCDE8C3B8F6318BC9C5ACC226D84D3EE571309E000542728804EFF13BB74F2783DB9F93AAB5974D49745047AF75B5E142F43E40723AC8A3DA4804FB2F4931057BDFC39020E223258E77B94A6B028787F43E9538BEAF0CF11549F63374B18DB28D0EDCDA5DD3F4504DF66E1824D81EDC91A6D681E7E8DAE904BA3E492B0561BE37D8EDCEF51462F897781287EA46E09C87E3EF8617F8051D439775D9CA6574066ECCD2270B94BC06B424F8E07C3B1856AD75EC92C407EA8774BA425F55B59B5764DF43514F7C4504DE7A2B4A9FA395AF9A49FAA6555B3AA458D4E5579B5A1AA32B07E9AF29A6645F30A9D7A16B54673FAF2111ADFEBCB61F7DFEDDB6CF336AD050D33CE6185C47FC50427B08C79F788529C907A04FAAC1BBB7016F2E16342DF7C6FCA257D454136B6A8B56643BE088C3F1B72D8FD9F0DB99AF0F9D9F79857D2E32C545606F85EF5F5C7ACEE392769B6EDE9207473DBC2B7B30698A6CB799A46AE9FCF024D148CC73044FDC187B3BA031A456FE4A008740C88EEB32D0FBE40DF6C995477E402079862EBDC2DA2843394BAC853CD081DF2062856EEA81AC5EAE088A8DC9F1499C0749CB046881D825298A93EA1EAB4F089EBC728E8B492D4B2E716C6FA5EC9904B2E708C0913D869893EC2F5B110A64025471A942E0B4D9D06E3DA8968F05A4D63DEE5C2D6E3AE8428B6C2C90EDFD9C04BEEBFBD0931DB2DB60572B69BA48F02C6B8DE2E08CACF2A7D09201F5CF68DA0D289C94050EE526D85A0A2C5764050D124EF8EA0C511B5EFF84BE7D57DA3A77850DEFEB6DE6AAE1D7053B0C79E51B3F03DA10D85163851E979B16085F8856A0E67A0273F9FA5DCD59529925F22602A866C6A7F57EB873AED203289DA006BA27580F21B410548995003942B6379ADDA712F62006C19776B85E56BBF04DBE0808ADDBC196D5434DF9FCAE4EC75FAA87A56B1412179AFC3420347430879F1123BDEC328A6B8AC6A983EBEF0106FB8D1313E182D06EAF05C0D462A3B33BA954A6A765B49E7900D71C936B292E43E19AC547666742B718E761B49E3140C700B363291B8858F34D9CA4847B5DB546553A7C899E21FA68E21B96A7A83E2D827AB46B215FF62CD8B4CABD90FF3E1F9476181E1B8A9260DA9D2B69244A304ADB0540AA241D32B3F49E905A26881589C67E6854A35EDDE6A58FE4B91CDED531DC4721F286BB37F8B6BBB788F2F6CB7AA3FC261AEA09321736AF248BA8602FAE616CB7F43014A34C1FB5914642131FB58E6D6C5155EB37DF14545983A92FE8A0FA5184CF17445EBF71A1B755E8C374E9517B3FE5899214C162F7DD0A6CD4D7EA919A50C5335514CA1AB9D8D9DC99D193A5EB2B3387CB83A11DE6676F10C952600FF3410A391E4A08035CAFAA38A79284D4CB1A43FA2946CD284948A0668D94C2911946C16AC8567B0A8BE467F096A1249135D2DED8FAC492769426B8AD7C0D6E82C97F547D5649C348135C5FDB1EBF413791DDDE3FDCB7884D964032B0EBA9BED60068CB75914C7D9001BF7F94DA0C6E78158FCC65E01E3DFF79250C6D3DE26842A421C9B11CA80615E7F84CB7071F969BDC137630A37DCC212DF76C36FC61B46DB37258772DE93AB54D2AB739F74BE9BF2B356F70B1BE5F05554B1ADD28CB0BDBFA6148713566132FF2598053E668B7959E106117F89535A6475D8C78747C7D20B9DFD792DE3A4A91768CEAAA62733E2986D21418B3CA3C47D42899A2EB1C18B921A5489445F130FBF9CD9FFCA5B9DE6410DF6AFFCF381759D3E12FF970C0A1E920C5BFF56D33FC7C9B06F3F6DEDE97B88FE56BDFEC7B7A2E9817597C08C39B50E255BAE33C2E22B8941DA144D37D066EDB713EF774209AF11B4A8D28458FFF1C1C2A7A33C3C28B5FC43885EFE385435EDE3828D10350F08C6C21BC584A60702EB60191F0778F093E68F03867556FF58601DD58C0F057C321C4C7E26D07F192A5BEE70ABD11C8BB6B124E576EE4CB3DE28E772D77B93928DBDD1445733AE07C06D9055BD0633DE5942F268BBA326DF7834EC5D52FBCD938CF725AFB8CEF8D86D3AF13633885BEE877E5389C37B90EAA649DDD97D7AF0B6B9660AE5EE798EE5B024E03D231B4FE8DA7DAAEFB6C9660AF3EE39D90625F4EE19D776B57FEE9869BDB7D09DA7E7AA9946862B195D2CB82BFDB6089CC3097F1101090A8FB27835A9CFF73209ABC962145857310B35279AC9829589A3C8556AB48B1DD657BEE1B77696D769176B48CF6C93CDD7FF56D9BC4EBB6C43D2E32E1287B56987BA64EE8E75AC2D1BEA3D250A0B3DE9C84BEFF2595BEFD7DF535EF0284611668FE18EF8FDA4018F629231A7CE80B45FF5BA17F6CEC69F5D84FD3BF5573504FB238C04BBC2AE59D5B926CBA8DCBC258DCA2A5284E60653E4C1967A9E507F895C0AC52CC69C3FFBCEE376ECA66381BD6B7297D138A3D0651C2E0221E0C59C8036F9796EB3A8F3F42ECEFF82C9185D00357D169BBF233F677EE0557A5F6962420608E65DF0882E1B4BCA22BBABD70AE936223D81B8F92AA7E80187710060E91D99A367BC8E6E40BFCF7885DCD73A026802E91E08D1ECD30B1FAD1214A61CA36E0F3F81C35EF8F2E3FF01AED343BB7D540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'9b21b6c0-a4dc-4749-9d4c-af8c300c0433', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c2b13877-d325-4bdb-a572-06cdcbd09f84', N'Tech')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3dc7ee29-f303-410c-b334-5993fd0665f8', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'42c1cdf2-f48d-405d-9fa0-346d14aa2637', N'3dc7ee29-f303-410c-b334-5993fd0665f8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'aaa867c8-d7a4-488a-912f-d84b22d8a33f', N'3dc7ee29-f303-410c-b334-5993fd0665f8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e5ca02a5-f4b0-4006-8d5f-4b3cd92bd35e', N'3dc7ee29-f303-410c-b334-5993fd0665f8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4922813d-0e8b-4f45-ae00-1b5b20dbf5d6', N'9b21b6c0-a4dc-4749-9d4c-af8c300c0433')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9aa941e2-7a4a-4f1a-8465-e240ff483ca4', N'9b21b6c0-a4dc-4749-9d4c-af8c300c0433')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e57d337e-6f8d-4398-99b6-80ba3411d5e0', N'c2b13877-d325-4bdb-a572-06cdcbd09f84')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'42c1cdf2-f48d-405d-9fa0-346d14aa2637', N'hello@goodbye.com', 0, N'ADYcAYbO6+263sIoaX3c0g6CwFpCbYdFYac4ia3N0rRuHXQIodcoix9X34t+XAwcnA==', N'd7810c33-6764-449b-b5de-b293424c19ae', NULL, 0, 0, NULL, 1, 0, N'hello@goodbye.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4922813d-0e8b-4f45-ae00-1b5b20dbf5d6', N'Nathen.lentz@natualcodes.net', 0, N'ADSvGd+fKqezsMEKCHaAsT7+aHF1OPK2uS925nCE8nGZcgk3ZBKnTrf6hbTLLyFmPQ==', N'41f4744b-d0e6-4a6b-ba36-12a16fde466e', NULL, 0, 0, NULL, 1, 0, N'Nathen.lentz@natualcodes.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9aa941e2-7a4a-4f1a-8465-e240ff483ca4', N'nathen.lentz@gmail.com', 0, N'AAOMPHQi75kEnR0VFaWSwTpdRf7n49IyBDuoM4r/a43XS7LBXDxHzfQ0DHP6F5TW2A==', N'7c08b89d-1511-4688-91dd-bc7da307a2d9', NULL, 0, 0, NULL, 1, 0, N'nathen.lentz@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'aaa867c8-d7a4-488a-912f-d84b22d8a33f', N'NoOne@LifeSucks.com', 0, N'AHgSdL9X5BQiSePpEK2W9XMxxz9gh9N7DNJ4Q/KcMrI0YER4XbjfdXHG2iNtIf/vtg==', N'f4e43bcd-e9eb-4042-b150-28759e6cbf73', NULL, 0, 0, NULL, 1, 0, N'NoOne@LifeSucks.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e57d337e-6f8d-4398-99b6-80ba3411d5e0', N'Who.Cares@noone.com', 0, N'AIC+tUVrVIlchcMTsnIez3eFcwK9AAHbu81Y7/tdG0Zv6Ec71cjwjL8OSMqcmz5aEA==', N'302a4970-c773-45e9-8d5c-8b292ef15a39', NULL, 0, 0, NULL, 1, 0, N'Who.Cares@noone.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e5ca02a5-f4b0-4006-8d5f-4b3cd92bd35e', N'j@j.com', 0, N'AE044SxetH/7+NlNj2JkIPvQylvoketpKPsBiqKvDuieAmUU54vEI6+Sg0njJnmmQg==', N'1fc39f25-a739-4928-bf68-aecd30c1e7cb', NULL, 0, 0, NULL, 1, 0, N'j@j.com')
SET IDENTITY_INSERT [dbo].[TSTDepartments] ON 

INSERT [dbo].[TSTDepartments] ([ID], [Name], [Description], [IsActive]) VALUES (1, N'Human Resource', N'Keeping the Peace', 1)
INSERT [dbo].[TSTDepartments] ([ID], [Name], [Description], [IsActive]) VALUES (2, N'Accounting', N'Keep numbers in there place', 1)
INSERT [dbo].[TSTDepartments] ([ID], [Name], [Description], [IsActive]) VALUES (3, N'Purchasing', N'Keep the money going out.', 1)
INSERT [dbo].[TSTDepartments] ([ID], [Name], [Description], [IsActive]) VALUES (4, N'Research and Development', N'Keeping the creative juices flowing', 1)
INSERT [dbo].[TSTDepartments] ([ID], [Name], [Description], [IsActive]) VALUES (5, N'Production', N'To Make things', 0)
INSERT [dbo].[TSTDepartments] ([ID], [Name], [Description], [IsActive]) VALUES (6, N'Marketing', N'Let people know we exist', 0)
INSERT [dbo].[TSTDepartments] ([ID], [Name], [Description], [IsActive]) VALUES (7, N'IT', N'Computer issues! They solve them!', 1)
SET IDENTITY_INSERT [dbo].[TSTDepartments] OFF
SET IDENTITY_INSERT [dbo].[TSTEmployees] ON 

INSERT [dbo].[TSTEmployees] ([ID], [Fname], [Lname], [DOB], [Address1], [Address2], [City], [State], [Zip], [Email], [Phone], [HireDate], [SeparationDate], [JobTitle], [IsActive], [Image], [Note], [UserID], [DeptID], [StatusID]) VALUES (1, N'Nathen', N'Lentz', CAST(0x80400000 AS SmallDateTime), N'421 NE 87th Terr', NULL, N'Kansas City', N'MO', N'64155', N'nathen.lentz@gmail.com', N'9136839979', CAST(0x80400000 AS SmallDateTime), NULL, N'Shoe Buffer', 0, N'00b8683a-a64c-4024-a360-9043bb8cdf8f.jpg', NULL, N'6b4c2e65f20a', 1, 1)
INSERT [dbo].[TSTEmployees] ([ID], [Fname], [Lname], [DOB], [Address1], [Address2], [City], [State], [Zip], [Email], [Phone], [HireDate], [SeparationDate], [JobTitle], [IsActive], [Image], [Note], [UserID], [DeptID], [StatusID]) VALUES (4, N'no', N'One', CAST(0x80400000 AS SmallDateTime), NULL, NULL, NULL, NULL, NULL, N'Who.Cares@noone.com', NULL, CAST(0x80400000 AS SmallDateTime), NULL, N'Door Greeter', 1, N'85819457-d6c2-4f5d-80f3-b6500bee8157.png', NULL, N'e57d337e-6f8d-4398-99b6-80ba3411d5e0', 1, 1)
INSERT [dbo].[TSTEmployees] ([ID], [Fname], [Lname], [DOB], [Address1], [Address2], [City], [State], [Zip], [Email], [Phone], [HireDate], [SeparationDate], [JobTitle], [IsActive], [Image], [Note], [UserID], [DeptID], [StatusID]) VALUES (5, N'Nathen', N'Lentz', CAST(0x80400000 AS SmallDateTime), N'421 NE 87th Terr', NULL, N'Kansas City', N'MO', N'64155', N'Nathen.lentz@natualcodes.net', N'9136839979', CAST(0x80400000 AS SmallDateTime), NULL, NULL, 1, N'd68b4d35-eb7b-4fc7-81b2-9203cdb0ba04.jpg', NULL, N'4922813d-0e8b-4f45-ae00-1b5b20dbf5d6', 1, 1)
INSERT [dbo].[TSTEmployees] ([ID], [Fname], [Lname], [DOB], [Address1], [Address2], [City], [State], [Zip], [Email], [Phone], [HireDate], [SeparationDate], [JobTitle], [IsActive], [Image], [Note], [UserID], [DeptID], [StatusID]) VALUES (6, N'Who', N'Cares?', CAST(0x80400000 AS SmallDateTime), NULL, NULL, NULL, NULL, NULL, N'NoOne@LifeSucks.com', NULL, CAST(0x7DD00000 AS SmallDateTime), NULL, N'bum', 1, N'bb1e5e83-c967-483f-86fa-7c2f589fd209.jpg', NULL, N'aaa867c8-d7a4-488a-912f-d84b22d8a33f', 1, 1)
INSERT [dbo].[TSTEmployees] ([ID], [Fname], [Lname], [DOB], [Address1], [Address2], [City], [State], [Zip], [Email], [Phone], [HireDate], [SeparationDate], [JobTitle], [IsActive], [Image], [Note], [UserID], [DeptID], [StatusID]) VALUES (9, N'Herro', N'GoodBye', CAST(0x80400000 AS SmallDateTime), N'Home', NULL, N'Home', N'Hm', N'11111', N'hello@goodbye.com', NULL, CAST(0xA65F0000 AS SmallDateTime), NULL, N'IT', 1, N'8c6182ac-5d1b-44fb-b883-58a417570f80.jpg', NULL, N'42c1cdf2-f48d-405d-9fa0-346d14aa2637', 7, 1)
INSERT [dbo].[TSTEmployees] ([ID], [Fname], [Lname], [DOB], [Address1], [Address2], [City], [State], [Zip], [Email], [Phone], [HireDate], [SeparationDate], [JobTitle], [IsActive], [Image], [Note], [UserID], [DeptID], [StatusID]) VALUES (10, N't', N't', CAST(0x85560000 AS SmallDateTime), N't', N't', N't', N'mo', N'6', N'j@j.com', N'9136839979', CAST(0xA65E0000 AS SmallDateTime), NULL, N't', 0, N'cee7b71d-d32f-44c5-9a91-7c66cbb8e2e1.JPG', N't', N'e5ca02a5-f4b0-4006-8d5f-4b3cd92bd35e', 1, 1)
SET IDENTITY_INSERT [dbo].[TSTEmployees] OFF
SET IDENTITY_INSERT [dbo].[TSTEmployeeStatuses] ON 

INSERT [dbo].[TSTEmployeeStatuses] ([ID], [Name], [Description]) VALUES (1, N'Full-Time', N'Employment in an established position requiring a regular schedule of 35 to 40 hours of work per week.')
INSERT [dbo].[TSTEmployeeStatuses] ([ID], [Name], [Description]) VALUES (2, N'Part-Time', N'Employment in an established position with a regular schedule of less than 40 hours of work per week.')
INSERT [dbo].[TSTEmployeeStatuses] ([ID], [Name], [Description]) VALUES (3, N'Temporary', N'Employment in a job established for a specific purpose, for a specific period of time, or for the duration of a specific project or group of assignments. ')
INSERT [dbo].[TSTEmployeeStatuses] ([ID], [Name], [Description]) VALUES (4, N'On-Call', N'Employment in a job on an “as needed” basis. On-call employees do not work a defined/regular schedule')
SET IDENTITY_INSERT [dbo].[TSTEmployeeStatuses] OFF
SET IDENTITY_INSERT [dbo].[TSTTechNotes] ON 

INSERT [dbo].[TSTTechNotes] ([ID], [TechID], [TicketID], [Notes], [TimeCreated]) VALUES (1, 4, 1, N'here it goes again', CAST(0xA65D02B7 AS SmallDateTime))
INSERT [dbo].[TSTTechNotes] ([ID], [TechID], [TicketID], [Notes], [TimeCreated]) VALUES (2, 5, 4, N'oOMG i need help with this ticket', CAST(0xA65E04BF AS SmallDateTime))
INSERT [dbo].[TSTTechNotes] ([ID], [TechID], [TicketID], [Notes], [TimeCreated]) VALUES (3, 5, 2, N'asdasd', CAST(0xA65F0203 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[TSTTechNotes] OFF
SET IDENTITY_INSERT [dbo].[TSTTicketPriorities] ON 

INSERT [dbo].[TSTTicketPriorities] ([ID], [Name], [Description]) VALUES (1, N'Low', N'Waste of time.')
INSERT [dbo].[TSTTicketPriorities] ([ID], [Name], [Description]) VALUES (2, N'Medium Low', N'Nice to have.')
INSERT [dbo].[TSTTicketPriorities] ([ID], [Name], [Description]) VALUES (3, N'Medium', N'Important')
INSERT [dbo].[TSTTicketPriorities] ([ID], [Name], [Description]) VALUES (4, N'Medium High', N'Very Important')
INSERT [dbo].[TSTTicketPriorities] ([ID], [Name], [Description]) VALUES (5, N'High', N'Most Important')
INSERT [dbo].[TSTTicketPriorities] ([ID], [Name], [Description]) VALUES (6, N'DEFCON', N'Stop immediately and FREAKOUT')
SET IDENTITY_INSERT [dbo].[TSTTicketPriorities] OFF
SET IDENTITY_INSERT [dbo].[TSTTickets] ON 

INSERT [dbo].[TSTTickets] ([ID], [SubmitedByID], [TechID], [CreatedDate], [ResolutionDate], [Description], [StatusID], [PriorityID], [Subject]) VALUES (1, 1, 9, CAST(0x80400000 AS SmallDateTime), NULL, N'hjkhjk', 8, 2, N'hjkhj')
INSERT [dbo].[TSTTickets] ([ID], [SubmitedByID], [TechID], [CreatedDate], [ResolutionDate], [Description], [StatusID], [PriorityID], [Subject]) VALUES (2, 5, 9, CAST(0xA65E02AF AS SmallDateTime), NULL, N'Help! Help! Help!', 1, 3, N'I clearly need HELP!')
INSERT [dbo].[TSTTickets] ([ID], [SubmitedByID], [TechID], [CreatedDate], [ResolutionDate], [Description], [StatusID], [PriorityID], [Subject]) VALUES (3, 5, NULL, CAST(0xA65E02B0 AS SmallDateTime), NULL, N'Strange feelings!', 1, 3, N'I think I am growing up')
INSERT [dbo].[TSTTickets] ([ID], [SubmitedByID], [TechID], [CreatedDate], [ResolutionDate], [Description], [StatusID], [PriorityID], [Subject]) VALUES (4, 5, 9, CAST(0xA65E04BE AS SmallDateTime), NULL, N'Help Me!', 1, 6, N'I need help')
INSERT [dbo].[TSTTickets] ([ID], [SubmitedByID], [TechID], [CreatedDate], [ResolutionDate], [Description], [StatusID], [PriorityID], [Subject]) VALUES (5, 5, NULL, CAST(0xA65F0203 AS SmallDateTime), NULL, N'awsdasd', 1, 3, N'asda')
SET IDENTITY_INSERT [dbo].[TSTTickets] OFF
SET IDENTITY_INSERT [dbo].[TSTTicketStatuses] ON 

INSERT [dbo].[TSTTicketStatuses] ([ID], [Name], [Description]) VALUES (1, N'New', N'The default status that is applied when a ticket is created or inserted. You cannot return a ticket to this status after you change it.')
INSERT [dbo].[TSTTicketStatuses] ([ID], [Name], [Description]) VALUES (2, N'QUEUED', N'The ticket is in the queue and work can begin on it.')
INSERT [dbo].[TSTTicketStatuses] ([ID], [Name], [Description]) VALUES (3, N'INPROG', N'Work on the ticket is ongoing')
INSERT [dbo].[TSTTicketStatuses] ([ID], [Name], [Description]) VALUES (4, N'PENDING
', N'The ticket is pending an action. For example, work cannot continue until a part is received.')
INSERT [dbo].[TSTTicketStatuses] ([ID], [Name], [Description]) VALUES (8, N'RESOLVED', N'Information was gathered and routed, service was restored, or a solution was provided.  COMPLETE.')
INSERT [dbo].[TSTTicketStatuses] ([ID], [Name], [Description]) VALUES (9, N'CLOSE', N'A closed record is a historical archive and you cannot change its status. ')
SET IDENTITY_INSERT [dbo].[TSTTicketStatuses] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TSTEmployees_TSTDepartments] FOREIGN KEY([DeptID])
REFERENCES [dbo].[TSTDepartments] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] CHECK CONSTRAINT [FK_TSTEmployees_TSTDepartments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTEmployeeStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TSTEmployees_TSTEmployeeStatuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[TSTEmployeeStatuses] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTEmployeeStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] CHECK CONSTRAINT [FK_TSTEmployees_TSTEmployeeStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes]  WITH CHECK ADD  CONSTRAINT [FK_TSTTechNotes_TSTEmployees] FOREIGN KEY([TechID])
REFERENCES [dbo].[TSTEmployees] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes] CHECK CONSTRAINT [FK_TSTTechNotes_TSTEmployees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTTickets]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes]  WITH CHECK ADD  CONSTRAINT [FK_TSTTechNotes_TSTTickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[TSTTickets] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTTickets]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes] CHECK CONSTRAINT [FK_TSTTechNotes_TSTTickets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets]  WITH CHECK ADD  CONSTRAINT [FK_TSTTickets_TSTEmployees] FOREIGN KEY([SubmitedByID])
REFERENCES [dbo].[TSTEmployees] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] CHECK CONSTRAINT [FK_TSTTickets_TSTEmployees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets]  WITH CHECK ADD  CONSTRAINT [FK_TSTTickets_TSTEmployees1] FOREIGN KEY([TechID])
REFERENCES [dbo].[TSTEmployees] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] CHECK CONSTRAINT [FK_TSTTickets_TSTEmployees1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketPriorities]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets]  WITH CHECK ADD  CONSTRAINT [FK_TSTTickets_TSTTicketPriorities] FOREIGN KEY([PriorityID])
REFERENCES [dbo].[TSTTicketPriorities] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketPriorities]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] CHECK CONSTRAINT [FK_TSTTickets_TSTTicketPriorities]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets]  WITH CHECK ADD  CONSTRAINT [FK_TSTTickets_TSTTicketStatuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[TSTTicketStatuses] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] CHECK CONSTRAINT [FK_TSTTickets_TSTTicketStatuses]
GO

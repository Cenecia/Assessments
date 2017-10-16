USE [master]
GO
/****** Object:  Database [assessments]    Script Date: 2017-10-15 11:09:32 PM ******/
CREATE DATABASE [assessments]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assessments', FILENAME = N'C:\Users\Chris\assessments.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'assessments_log', FILENAME = N'C:\Users\Chris\assessments_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [assessments] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [assessments].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [assessments] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [assessments] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [assessments] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [assessments] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [assessments] SET ARITHABORT OFF 
GO
ALTER DATABASE [assessments] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [assessments] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [assessments] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [assessments] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [assessments] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [assessments] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [assessments] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [assessments] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [assessments] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [assessments] SET  DISABLE_BROKER 
GO
ALTER DATABASE [assessments] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [assessments] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [assessments] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [assessments] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [assessments] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [assessments] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [assessments] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [assessments] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [assessments] SET  MULTI_USER 
GO
ALTER DATABASE [assessments] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [assessments] SET DB_CHAINING OFF 
GO
ALTER DATABASE [assessments] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [assessments] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [assessments] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [assessments] SET QUERY_STORE = OFF
GO
USE [assessments]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [assessments]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2017-10-15 11:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[RoleId] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentCategories]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TranslationID] [int] NOT NULL,
	[AssessmentCollectionID] [int] NOT NULL,
 CONSTRAINT [PK_AssessmentCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentCheckoffItems]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentCheckoffItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TranslationID] [int] NOT NULL,
	[AssessmentQuestionID] [int] NOT NULL,
	[AssessmentLevelID] [int] NOT NULL,
	[CheckOffItemOrder] [int] NOT NULL,
 CONSTRAINT [PK_AssessmentCheckoffItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentCollections]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentCollections](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TranslationID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[AvailableDate] [datetime] NULL,
	[ExpiresDate] [datetime] NULL,
 CONSTRAINT [PK_AssessmentCollections] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentLevels]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentLevels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TranslationID] [int] NOT NULL,
	[LevelOrder] [int] NOT NULL,
 CONSTRAINT [PK_AssessmentLevels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentQuestions]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HeadingTranslationID] [int] NOT NULL,
	[AssessmentCategoryID] [int] NOT NULL,
	[BodyTranslationID] [int] NULL,
	[QuestionOrder] [int] NOT NULL,
	[QuestionCode] [nvarchar](10) NULL,
 CONSTRAINT [PK_AssessmentQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[C__MigrationHistory]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[C__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_C__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translations]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EN] [nvarchar](max) NULL,
 CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAssessmentCategories]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssessmentCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentCategoryID] [int] NOT NULL,
	[UserAssessmentID] [int] NOT NULL,
 CONSTRAINT [PK_UserAssessmentCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAssessmentCheckoffItems]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssessmentCheckoffItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentCheckoffItemID] [int] NOT NULL,
	[UserAssessmentQuestionID] [int] NOT NULL,
	[Checked] [bit] NOT NULL,
 CONSTRAINT [PK_UserAssessmentCheckoffItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAssessmentQuestions]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssessmentQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentQuestionID] [int] NOT NULL,
	[UserAssessmentCategoryID] [int] NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK_UserAssessmentQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAssessments]    Script Date: 2017-10-15 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssessments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentID] [int] NOT NULL,
	[UserDetailID] [int] NOT NULL,
 CONSTRAINT [PK_UserAssessments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2017-10-15 11:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_AspNetUserRoles_AspNetUser]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_AspNetUserRoles_AspNetUser] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_AssessmentCategoryAssessmentCollection]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_AssessmentCategoryAssessmentCollection] ON [dbo].[AssessmentCategories]
(
	[AssessmentCollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_AssessmentCategoryTranslationName]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_AssessmentCategoryTranslationName] ON [dbo].[AssessmentCategories]
(
	[TranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_AssessmentCheckoffItemAssessmentQuestion]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_AssessmentCheckoffItemAssessmentQuestion] ON [dbo].[AssessmentCheckoffItems]
(
	[AssessmentQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_AssessmentCheckoffItemTranslationWording]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_AssessmentCheckoffItemTranslationWording] ON [dbo].[AssessmentCheckoffItems]
(
	[TranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_AssessmentQuestionAssessmentLevel]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_AssessmentQuestionAssessmentLevel] ON [dbo].[AssessmentCheckoffItems]
(
	[AssessmentLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_AssessmentCollectionTranslationTitle]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_AssessmentCollectionTranslationTitle] ON [dbo].[AssessmentCollections]
(
	[TranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_AssessmentLevelTranslationName]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_AssessmentLevelTranslationName] ON [dbo].[AssessmentLevels]
(
	[TranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_AssessmentQuestionAssessmentCategory]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_AssessmentQuestionAssessmentCategory] ON [dbo].[AssessmentQuestions]
(
	[AssessmentCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_AssessmentQuestionTranslationBody]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_AssessmentQuestionTranslationBody] ON [dbo].[AssessmentQuestions]
(
	[BodyTranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_AssessmentQuestionTranslationHeading]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_AssessmentQuestionTranslationHeading] ON [dbo].[AssessmentQuestions]
(
	[HeadingTranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_UserAssessmentCategoryAssessmentCategory]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_UserAssessmentCategoryAssessmentCategory] ON [dbo].[UserAssessmentCategories]
(
	[AssessmentCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_UserAssessmentCategoryUserAssessmentID]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_UserAssessmentCategoryUserAssessmentID] ON [dbo].[UserAssessmentCategories]
(
	[UserAssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_UserAssessmentCheckoffItemAssessmentCheckoffItem]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_UserAssessmentCheckoffItemAssessmentCheckoffItem] ON [dbo].[UserAssessmentCheckoffItems]
(
	[AssessmentCheckoffItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_UserAssessmentCheckoffItemUserAssessmentQuestion]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_UserAssessmentCheckoffItemUserAssessmentQuestion] ON [dbo].[UserAssessmentCheckoffItems]
(
	[UserAssessmentQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_UserAssessmentQuestionAssessmentQuestion]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_UserAssessmentQuestionAssessmentQuestion] ON [dbo].[UserAssessmentQuestions]
(
	[AssessmentQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_UserAssessmentQuestionUserAssessmentCategory]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_UserAssessmentQuestionUserAssessmentCategory] ON [dbo].[UserAssessmentQuestions]
(
	[UserAssessmentCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_UserAssessmentAssessmentCollection]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_UserAssessmentAssessmentCollection] ON [dbo].[UserAssessments]
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_fk_UserAssessmentUserDetail]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_UserAssessmentUserDetail] ON [dbo].[UserAssessments]
(
	[UserDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_fk_UserDetailsAspNetUsers]    Script Date: 2017-10-15 11:09:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_fk_UserDetailsAspNetUsers] ON [dbo].[UserDetails]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRole]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUser]
GO
ALTER TABLE [dbo].[AssessmentCategories]  WITH CHECK ADD  CONSTRAINT [fk_AssessmentCategoryAssessmentCollection] FOREIGN KEY([AssessmentCollectionID])
REFERENCES [dbo].[AssessmentCollections] ([ID])
GO
ALTER TABLE [dbo].[AssessmentCategories] CHECK CONSTRAINT [fk_AssessmentCategoryAssessmentCollection]
GO
ALTER TABLE [dbo].[AssessmentCategories]  WITH CHECK ADD  CONSTRAINT [fk_AssessmentCategoryTranslationName] FOREIGN KEY([TranslationID])
REFERENCES [dbo].[Translations] ([ID])
GO
ALTER TABLE [dbo].[AssessmentCategories] CHECK CONSTRAINT [fk_AssessmentCategoryTranslationName]
GO
ALTER TABLE [dbo].[AssessmentCheckoffItems]  WITH CHECK ADD  CONSTRAINT [fk_AssessmentCheckoffItemAssessmentQuestion] FOREIGN KEY([AssessmentQuestionID])
REFERENCES [dbo].[AssessmentQuestions] ([ID])
GO
ALTER TABLE [dbo].[AssessmentCheckoffItems] CHECK CONSTRAINT [fk_AssessmentCheckoffItemAssessmentQuestion]
GO
ALTER TABLE [dbo].[AssessmentCheckoffItems]  WITH CHECK ADD  CONSTRAINT [fk_AssessmentCheckoffItemTranslationWording] FOREIGN KEY([TranslationID])
REFERENCES [dbo].[Translations] ([ID])
GO
ALTER TABLE [dbo].[AssessmentCheckoffItems] CHECK CONSTRAINT [fk_AssessmentCheckoffItemTranslationWording]
GO
ALTER TABLE [dbo].[AssessmentCheckoffItems]  WITH CHECK ADD  CONSTRAINT [fk_AssessmentQuestionAssessmentLevel] FOREIGN KEY([AssessmentLevelID])
REFERENCES [dbo].[AssessmentLevels] ([ID])
GO
ALTER TABLE [dbo].[AssessmentCheckoffItems] CHECK CONSTRAINT [fk_AssessmentQuestionAssessmentLevel]
GO
ALTER TABLE [dbo].[AssessmentCollections]  WITH CHECK ADD  CONSTRAINT [fk_AssessmentCollectionTranslationTitle] FOREIGN KEY([TranslationID])
REFERENCES [dbo].[Translations] ([ID])
GO
ALTER TABLE [dbo].[AssessmentCollections] CHECK CONSTRAINT [fk_AssessmentCollectionTranslationTitle]
GO
ALTER TABLE [dbo].[AssessmentLevels]  WITH CHECK ADD  CONSTRAINT [fk_AssessmentLevelTranslationName] FOREIGN KEY([TranslationID])
REFERENCES [dbo].[Translations] ([ID])
GO
ALTER TABLE [dbo].[AssessmentLevels] CHECK CONSTRAINT [fk_AssessmentLevelTranslationName]
GO
ALTER TABLE [dbo].[AssessmentQuestions]  WITH CHECK ADD  CONSTRAINT [fk_AssessmentQuestionAssessmentCategory] FOREIGN KEY([AssessmentCategoryID])
REFERENCES [dbo].[AssessmentCategories] ([ID])
GO
ALTER TABLE [dbo].[AssessmentQuestions] CHECK CONSTRAINT [fk_AssessmentQuestionAssessmentCategory]
GO
ALTER TABLE [dbo].[AssessmentQuestions]  WITH CHECK ADD  CONSTRAINT [fk_AssessmentQuestionTranslationBody] FOREIGN KEY([BodyTranslationID])
REFERENCES [dbo].[Translations] ([ID])
GO
ALTER TABLE [dbo].[AssessmentQuestions] CHECK CONSTRAINT [fk_AssessmentQuestionTranslationBody]
GO
ALTER TABLE [dbo].[AssessmentQuestions]  WITH CHECK ADD  CONSTRAINT [fk_AssessmentQuestionTranslationHeading] FOREIGN KEY([HeadingTranslationID])
REFERENCES [dbo].[Translations] ([ID])
GO
ALTER TABLE [dbo].[AssessmentQuestions] CHECK CONSTRAINT [fk_AssessmentQuestionTranslationHeading]
GO
ALTER TABLE [dbo].[UserAssessmentCategories]  WITH CHECK ADD  CONSTRAINT [fk_UserAssessmentCategoryAssessmentCategory] FOREIGN KEY([AssessmentCategoryID])
REFERENCES [dbo].[AssessmentCategories] ([ID])
GO
ALTER TABLE [dbo].[UserAssessmentCategories] CHECK CONSTRAINT [fk_UserAssessmentCategoryAssessmentCategory]
GO
ALTER TABLE [dbo].[UserAssessmentCategories]  WITH CHECK ADD  CONSTRAINT [fk_UserAssessmentCategoryUserAssessmentID] FOREIGN KEY([UserAssessmentID])
REFERENCES [dbo].[UserAssessments] ([ID])
GO
ALTER TABLE [dbo].[UserAssessmentCategories] CHECK CONSTRAINT [fk_UserAssessmentCategoryUserAssessmentID]
GO
ALTER TABLE [dbo].[UserAssessmentCheckoffItems]  WITH CHECK ADD  CONSTRAINT [fk_UserAssessmentCheckoffItemAssessmentCheckoffItem] FOREIGN KEY([AssessmentCheckoffItemID])
REFERENCES [dbo].[AssessmentCheckoffItems] ([ID])
GO
ALTER TABLE [dbo].[UserAssessmentCheckoffItems] CHECK CONSTRAINT [fk_UserAssessmentCheckoffItemAssessmentCheckoffItem]
GO
ALTER TABLE [dbo].[UserAssessmentCheckoffItems]  WITH CHECK ADD  CONSTRAINT [fk_UserAssessmentCheckoffItemUserAssessmentQuestion] FOREIGN KEY([UserAssessmentQuestionID])
REFERENCES [dbo].[UserAssessmentQuestions] ([ID])
GO
ALTER TABLE [dbo].[UserAssessmentCheckoffItems] CHECK CONSTRAINT [fk_UserAssessmentCheckoffItemUserAssessmentQuestion]
GO
ALTER TABLE [dbo].[UserAssessmentQuestions]  WITH CHECK ADD  CONSTRAINT [fk_UserAssessmentQuestionAssessmentQuestion] FOREIGN KEY([AssessmentQuestionID])
REFERENCES [dbo].[AssessmentQuestions] ([ID])
GO
ALTER TABLE [dbo].[UserAssessmentQuestions] CHECK CONSTRAINT [fk_UserAssessmentQuestionAssessmentQuestion]
GO
ALTER TABLE [dbo].[UserAssessmentQuestions]  WITH CHECK ADD  CONSTRAINT [fk_UserAssessmentQuestionUserAssessmentCategory] FOREIGN KEY([UserAssessmentCategoryID])
REFERENCES [dbo].[UserAssessmentCategories] ([ID])
GO
ALTER TABLE [dbo].[UserAssessmentQuestions] CHECK CONSTRAINT [fk_UserAssessmentQuestionUserAssessmentCategory]
GO
ALTER TABLE [dbo].[UserAssessments]  WITH CHECK ADD  CONSTRAINT [fk_UserAssessmentAssessmentCollection] FOREIGN KEY([AssessmentID])
REFERENCES [dbo].[AssessmentCollections] ([ID])
GO
ALTER TABLE [dbo].[UserAssessments] CHECK CONSTRAINT [fk_UserAssessmentAssessmentCollection]
GO
ALTER TABLE [dbo].[UserAssessments]  WITH CHECK ADD  CONSTRAINT [fk_UserAssessmentUserDetail] FOREIGN KEY([UserDetailID])
REFERENCES [dbo].[UserDetails] ([ID])
GO
ALTER TABLE [dbo].[UserAssessments] CHECK CONSTRAINT [fk_UserAssessmentUserDetail]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [fk_UserDetailsAspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [fk_UserDetailsAspNetUsers]
GO
USE [master]
GO
ALTER DATABASE [assessments] SET  READ_WRITE 
GO

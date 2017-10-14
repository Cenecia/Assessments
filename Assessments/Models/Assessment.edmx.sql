
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/12/2017 23:27:25
-- Generated from EDMX file: F:\repos\Assessments\Assessments\Models\Assessment.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [assessments];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[fk_AssessmentCategoryAssessmentCollection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AssessmentCategory] DROP CONSTRAINT [fk_AssessmentCategoryAssessmentCollection];
GO
IF OBJECT_ID(N'[dbo].[fk_AssessmentCategoryTranslationName]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AssessmentCategory] DROP CONSTRAINT [fk_AssessmentCategoryTranslationName];
GO
IF OBJECT_ID(N'[dbo].[fk_AssessmentCheckoffItemAssessmentQuestion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AssessmentCheckoffItem] DROP CONSTRAINT [fk_AssessmentCheckoffItemAssessmentQuestion];
GO
IF OBJECT_ID(N'[dbo].[fk_AssessmentCheckoffItemTranslationWording]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AssessmentCheckoffItem] DROP CONSTRAINT [fk_AssessmentCheckoffItemTranslationWording];
GO
IF OBJECT_ID(N'[dbo].[fk_AssessmentCollectionTranslationTitle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AssessmentCollection] DROP CONSTRAINT [fk_AssessmentCollectionTranslationTitle];
GO
IF OBJECT_ID(N'[dbo].[fk_AssessmentLevelTranslationName]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AssessmentLevel] DROP CONSTRAINT [fk_AssessmentLevelTranslationName];
GO
IF OBJECT_ID(N'[dbo].[fk_AssessmentQuestionAssessmentCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AssessmentQuestion] DROP CONSTRAINT [fk_AssessmentQuestionAssessmentCategory];
GO
IF OBJECT_ID(N'[dbo].[fk_AssessmentQuestionAssessmentLevel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AssessmentCheckoffItem] DROP CONSTRAINT [fk_AssessmentQuestionAssessmentLevel];
GO
IF OBJECT_ID(N'[dbo].[fk_AssessmentQuestionTranslationBody]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AssessmentQuestion] DROP CONSTRAINT [fk_AssessmentQuestionTranslationBody];
GO
IF OBJECT_ID(N'[dbo].[fk_AssessmentQuestionTranslationHeading]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AssessmentQuestion] DROP CONSTRAINT [fk_AssessmentQuestionTranslationHeading];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[fk_UserAssessmentAssessmentCollection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAssessment] DROP CONSTRAINT [fk_UserAssessmentAssessmentCollection];
GO
IF OBJECT_ID(N'[dbo].[fk_UserAssessmentCategoryAssessmentCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAssessmentCategory] DROP CONSTRAINT [fk_UserAssessmentCategoryAssessmentCategory];
GO
IF OBJECT_ID(N'[dbo].[fk_UserAssessmentCategoryUserAssessmentID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAssessmentCategory] DROP CONSTRAINT [fk_UserAssessmentCategoryUserAssessmentID];
GO
IF OBJECT_ID(N'[dbo].[fk_UserAssessmentCheckoffItemAssessmentCheckoffItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAssessmentCheckoffItem] DROP CONSTRAINT [fk_UserAssessmentCheckoffItemAssessmentCheckoffItem];
GO
IF OBJECT_ID(N'[dbo].[fk_UserAssessmentCheckoffItemUserAssessmentQuestion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAssessmentCheckoffItem] DROP CONSTRAINT [fk_UserAssessmentCheckoffItemUserAssessmentQuestion];
GO
IF OBJECT_ID(N'[dbo].[fk_UserAssessmentQuestionAssessmentQuestion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAssessmentQuestion] DROP CONSTRAINT [fk_UserAssessmentQuestionAssessmentQuestion];
GO
IF OBJECT_ID(N'[dbo].[fk_UserAssessmentQuestionUserAssessmentCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAssessmentQuestion] DROP CONSTRAINT [fk_UserAssessmentQuestionUserAssessmentCategory];
GO
IF OBJECT_ID(N'[dbo].[fk_UserAssessmentUserDetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAssessment] DROP CONSTRAINT [fk_UserAssessmentUserDetail];
GO
IF OBJECT_ID(N'[dbo].[fk_UserDetailsAspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT [fk_UserDetailsAspNetUsers];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[__MigrationHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[__MigrationHistory];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[AssessmentCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AssessmentCategory];
GO
IF OBJECT_ID(N'[dbo].[AssessmentCheckoffItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AssessmentCheckoffItem];
GO
IF OBJECT_ID(N'[dbo].[AssessmentCollection]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AssessmentCollection];
GO
IF OBJECT_ID(N'[dbo].[AssessmentLevel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AssessmentLevel];
GO
IF OBJECT_ID(N'[dbo].[AssessmentQuestion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AssessmentQuestion];
GO
IF OBJECT_ID(N'[dbo].[Translation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Translation];
GO
IF OBJECT_ID(N'[dbo].[UserAssessment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserAssessment];
GO
IF OBJECT_ID(N'[dbo].[UserAssessmentCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserAssessmentCategory];
GO
IF OBJECT_ID(N'[dbo].[UserAssessmentCheckoffItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserAssessmentCheckoffItem];
GO
IF OBJECT_ID(N'[dbo].[UserAssessmentQuestion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserAssessmentQuestion];
GO
IF OBJECT_ID(N'[dbo].[UserDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserDetails];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AssessmentCategories'
CREATE TABLE [dbo].[AssessmentCategories] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [TranslationID] int  NOT NULL,
    [AssessmentCollectionID] int  NOT NULL
);
GO

-- Creating table 'AssessmentCheckoffItems'
CREATE TABLE [dbo].[AssessmentCheckoffItems] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [TranslationID] int  NOT NULL,
    [AssessmentQuestionID] int  NOT NULL,
    [AssessmentLevelID] int  NOT NULL,
    [CheckOffItemOrder] int  NOT NULL
);
GO

-- Creating table 'AssessmentCollections'
CREATE TABLE [dbo].[AssessmentCollections] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [TranslationID] int  NOT NULL,
    [Active] bit  NOT NULL,
    [AvailableDate] datetime  NULL,
    [ExpiresDate] datetime  NULL
);
GO

-- Creating table 'AssessmentLevels'
CREATE TABLE [dbo].[AssessmentLevels] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [TranslationID] int  NOT NULL,
    [LevelOrder] int  NOT NULL
);
GO

-- Creating table 'AssessmentQuestions'
CREATE TABLE [dbo].[AssessmentQuestions] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [HeadingTranslationID] int  NOT NULL,
    [AssessmentCategoryID] int  NOT NULL,
    [BodyTranslationID] int  NULL,
    [QuestionOrder] int  NOT NULL,
    [QuestionCode] nvarchar(10)  NULL
);
GO

-- Creating table 'Translations'
CREATE TABLE [dbo].[Translations] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [EN] nvarchar(max)  NULL
);
GO

-- Creating table 'UserAssessments'
CREATE TABLE [dbo].[UserAssessments] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [AssessmentID] int  NOT NULL,
    [UserDetailID] int  NOT NULL
);
GO

-- Creating table 'UserAssessmentCategories'
CREATE TABLE [dbo].[UserAssessmentCategories] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [AssessmentCategoryID] int  NOT NULL,
    [UserAssessmentID] int  NOT NULL
);
GO

-- Creating table 'UserAssessmentCheckoffItems'
CREATE TABLE [dbo].[UserAssessmentCheckoffItems] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [AssessmentCheckoffItemID] int  NOT NULL,
    [UserAssessmentQuestionID] int  NOT NULL,
    [Checked] bit  NOT NULL
);
GO

-- Creating table 'UserAssessmentQuestions'
CREATE TABLE [dbo].[UserAssessmentQuestions] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [AssessmentQuestionID] int  NOT NULL,
    [UserAssessmentCategoryID] int  NOT NULL,
    [Comments] nvarchar(max)  NULL,
    [Score] int  NULL
);
GO

-- Creating table 'UserDetails'
CREATE TABLE [dbo].[UserDetails] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NULL,
    [LastName] nvarchar(50)  NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'AssessmentCategories'
ALTER TABLE [dbo].[AssessmentCategories]
ADD CONSTRAINT [PK_AssessmentCategories]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'AssessmentCheckoffItems'
ALTER TABLE [dbo].[AssessmentCheckoffItems]
ADD CONSTRAINT [PK_AssessmentCheckoffItems]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'AssessmentCollections'
ALTER TABLE [dbo].[AssessmentCollections]
ADD CONSTRAINT [PK_AssessmentCollections]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'AssessmentLevels'
ALTER TABLE [dbo].[AssessmentLevels]
ADD CONSTRAINT [PK_AssessmentLevels]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'AssessmentQuestions'
ALTER TABLE [dbo].[AssessmentQuestions]
ADD CONSTRAINT [PK_AssessmentQuestions]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Translations'
ALTER TABLE [dbo].[Translations]
ADD CONSTRAINT [PK_Translations]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'UserAssessments'
ALTER TABLE [dbo].[UserAssessments]
ADD CONSTRAINT [PK_UserAssessments]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'UserAssessmentCategories'
ALTER TABLE [dbo].[UserAssessmentCategories]
ADD CONSTRAINT [PK_UserAssessmentCategories]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'UserAssessmentCheckoffItems'
ALTER TABLE [dbo].[UserAssessmentCheckoffItems]
ADD CONSTRAINT [PK_UserAssessmentCheckoffItems]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'UserAssessmentQuestions'
ALTER TABLE [dbo].[UserAssessmentQuestions]
ADD CONSTRAINT [PK_UserAssessmentQuestions]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'UserDetails'
ALTER TABLE [dbo].[UserDetails]
ADD CONSTRAINT [PK_UserDetails]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'UserDetails'
ALTER TABLE [dbo].[UserDetails]
ADD CONSTRAINT [fk_UserDetailsAspNetUsers]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_UserDetailsAspNetUsers'
CREATE INDEX [IX_fk_UserDetailsAspNetUsers]
ON [dbo].[UserDetails]
    ([UserId]);
GO

-- Creating foreign key on [AssessmentCollectionID] in table 'AssessmentCategories'
ALTER TABLE [dbo].[AssessmentCategories]
ADD CONSTRAINT [fk_AssessmentCategoryAssessmentCollection]
    FOREIGN KEY ([AssessmentCollectionID])
    REFERENCES [dbo].[AssessmentCollections]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_AssessmentCategoryAssessmentCollection'
CREATE INDEX [IX_fk_AssessmentCategoryAssessmentCollection]
ON [dbo].[AssessmentCategories]
    ([AssessmentCollectionID]);
GO

-- Creating foreign key on [TranslationID] in table 'AssessmentCategories'
ALTER TABLE [dbo].[AssessmentCategories]
ADD CONSTRAINT [fk_AssessmentCategoryTranslationName]
    FOREIGN KEY ([TranslationID])
    REFERENCES [dbo].[Translations]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_AssessmentCategoryTranslationName'
CREATE INDEX [IX_fk_AssessmentCategoryTranslationName]
ON [dbo].[AssessmentCategories]
    ([TranslationID]);
GO

-- Creating foreign key on [AssessmentCategoryID] in table 'AssessmentQuestions'
ALTER TABLE [dbo].[AssessmentQuestions]
ADD CONSTRAINT [fk_AssessmentQuestionAssessmentCategory]
    FOREIGN KEY ([AssessmentCategoryID])
    REFERENCES [dbo].[AssessmentCategories]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_AssessmentQuestionAssessmentCategory'
CREATE INDEX [IX_fk_AssessmentQuestionAssessmentCategory]
ON [dbo].[AssessmentQuestions]
    ([AssessmentCategoryID]);
GO

-- Creating foreign key on [AssessmentCategoryID] in table 'UserAssessmentCategories'
ALTER TABLE [dbo].[UserAssessmentCategories]
ADD CONSTRAINT [fk_UserAssessmentCategoryAssessmentCategory]
    FOREIGN KEY ([AssessmentCategoryID])
    REFERENCES [dbo].[AssessmentCategories]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_UserAssessmentCategoryAssessmentCategory'
CREATE INDEX [IX_fk_UserAssessmentCategoryAssessmentCategory]
ON [dbo].[UserAssessmentCategories]
    ([AssessmentCategoryID]);
GO

-- Creating foreign key on [AssessmentQuestionID] in table 'AssessmentCheckoffItems'
ALTER TABLE [dbo].[AssessmentCheckoffItems]
ADD CONSTRAINT [fk_AssessmentCheckoffItemAssessmentQuestion]
    FOREIGN KEY ([AssessmentQuestionID])
    REFERENCES [dbo].[AssessmentQuestions]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_AssessmentCheckoffItemAssessmentQuestion'
CREATE INDEX [IX_fk_AssessmentCheckoffItemAssessmentQuestion]
ON [dbo].[AssessmentCheckoffItems]
    ([AssessmentQuestionID]);
GO

-- Creating foreign key on [TranslationID] in table 'AssessmentCheckoffItems'
ALTER TABLE [dbo].[AssessmentCheckoffItems]
ADD CONSTRAINT [fk_AssessmentCheckoffItemTranslationWording]
    FOREIGN KEY ([TranslationID])
    REFERENCES [dbo].[Translations]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_AssessmentCheckoffItemTranslationWording'
CREATE INDEX [IX_fk_AssessmentCheckoffItemTranslationWording]
ON [dbo].[AssessmentCheckoffItems]
    ([TranslationID]);
GO

-- Creating foreign key on [AssessmentLevelID] in table 'AssessmentCheckoffItems'
ALTER TABLE [dbo].[AssessmentCheckoffItems]
ADD CONSTRAINT [fk_AssessmentQuestionAssessmentLevel]
    FOREIGN KEY ([AssessmentLevelID])
    REFERENCES [dbo].[AssessmentLevels]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_AssessmentQuestionAssessmentLevel'
CREATE INDEX [IX_fk_AssessmentQuestionAssessmentLevel]
ON [dbo].[AssessmentCheckoffItems]
    ([AssessmentLevelID]);
GO

-- Creating foreign key on [AssessmentCheckoffItemID] in table 'UserAssessmentCheckoffItems'
ALTER TABLE [dbo].[UserAssessmentCheckoffItems]
ADD CONSTRAINT [fk_UserAssessmentCheckoffItemAssessmentCheckoffItem]
    FOREIGN KEY ([AssessmentCheckoffItemID])
    REFERENCES [dbo].[AssessmentCheckoffItems]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_UserAssessmentCheckoffItemAssessmentCheckoffItem'
CREATE INDEX [IX_fk_UserAssessmentCheckoffItemAssessmentCheckoffItem]
ON [dbo].[UserAssessmentCheckoffItems]
    ([AssessmentCheckoffItemID]);
GO

-- Creating foreign key on [TranslationID] in table 'AssessmentCollections'
ALTER TABLE [dbo].[AssessmentCollections]
ADD CONSTRAINT [fk_AssessmentCollectionTranslationTitle]
    FOREIGN KEY ([TranslationID])
    REFERENCES [dbo].[Translations]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_AssessmentCollectionTranslationTitle'
CREATE INDEX [IX_fk_AssessmentCollectionTranslationTitle]
ON [dbo].[AssessmentCollections]
    ([TranslationID]);
GO

-- Creating foreign key on [AssessmentID] in table 'UserAssessments'
ALTER TABLE [dbo].[UserAssessments]
ADD CONSTRAINT [fk_UserAssessmentAssessmentCollection]
    FOREIGN KEY ([AssessmentID])
    REFERENCES [dbo].[AssessmentCollections]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_UserAssessmentAssessmentCollection'
CREATE INDEX [IX_fk_UserAssessmentAssessmentCollection]
ON [dbo].[UserAssessments]
    ([AssessmentID]);
GO

-- Creating foreign key on [TranslationID] in table 'AssessmentLevels'
ALTER TABLE [dbo].[AssessmentLevels]
ADD CONSTRAINT [fk_AssessmentLevelTranslationName]
    FOREIGN KEY ([TranslationID])
    REFERENCES [dbo].[Translations]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_AssessmentLevelTranslationName'
CREATE INDEX [IX_fk_AssessmentLevelTranslationName]
ON [dbo].[AssessmentLevels]
    ([TranslationID]);
GO

-- Creating foreign key on [BodyTranslationID] in table 'AssessmentQuestions'
ALTER TABLE [dbo].[AssessmentQuestions]
ADD CONSTRAINT [fk_AssessmentQuestionTranslationBody]
    FOREIGN KEY ([BodyTranslationID])
    REFERENCES [dbo].[Translations]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_AssessmentQuestionTranslationBody'
CREATE INDEX [IX_fk_AssessmentQuestionTranslationBody]
ON [dbo].[AssessmentQuestions]
    ([BodyTranslationID]);
GO

-- Creating foreign key on [HeadingTranslationID] in table 'AssessmentQuestions'
ALTER TABLE [dbo].[AssessmentQuestions]
ADD CONSTRAINT [fk_AssessmentQuestionTranslationHeading]
    FOREIGN KEY ([HeadingTranslationID])
    REFERENCES [dbo].[Translations]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_AssessmentQuestionTranslationHeading'
CREATE INDEX [IX_fk_AssessmentQuestionTranslationHeading]
ON [dbo].[AssessmentQuestions]
    ([HeadingTranslationID]);
GO

-- Creating foreign key on [AssessmentQuestionID] in table 'UserAssessmentQuestions'
ALTER TABLE [dbo].[UserAssessmentQuestions]
ADD CONSTRAINT [fk_UserAssessmentQuestionAssessmentQuestion]
    FOREIGN KEY ([AssessmentQuestionID])
    REFERENCES [dbo].[AssessmentQuestions]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_UserAssessmentQuestionAssessmentQuestion'
CREATE INDEX [IX_fk_UserAssessmentQuestionAssessmentQuestion]
ON [dbo].[UserAssessmentQuestions]
    ([AssessmentQuestionID]);
GO

-- Creating foreign key on [UserAssessmentID] in table 'UserAssessmentCategories'
ALTER TABLE [dbo].[UserAssessmentCategories]
ADD CONSTRAINT [fk_UserAssessmentCategoryUserAssessmentID]
    FOREIGN KEY ([UserAssessmentID])
    REFERENCES [dbo].[UserAssessments]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_UserAssessmentCategoryUserAssessmentID'
CREATE INDEX [IX_fk_UserAssessmentCategoryUserAssessmentID]
ON [dbo].[UserAssessmentCategories]
    ([UserAssessmentID]);
GO

-- Creating foreign key on [UserDetailID] in table 'UserAssessments'
ALTER TABLE [dbo].[UserAssessments]
ADD CONSTRAINT [fk_UserAssessmentUserDetail]
    FOREIGN KEY ([UserDetailID])
    REFERENCES [dbo].[UserDetails]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_UserAssessmentUserDetail'
CREATE INDEX [IX_fk_UserAssessmentUserDetail]
ON [dbo].[UserAssessments]
    ([UserDetailID]);
GO

-- Creating foreign key on [UserAssessmentCategoryID] in table 'UserAssessmentQuestions'
ALTER TABLE [dbo].[UserAssessmentQuestions]
ADD CONSTRAINT [fk_UserAssessmentQuestionUserAssessmentCategory]
    FOREIGN KEY ([UserAssessmentCategoryID])
    REFERENCES [dbo].[UserAssessmentCategories]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_UserAssessmentQuestionUserAssessmentCategory'
CREATE INDEX [IX_fk_UserAssessmentQuestionUserAssessmentCategory]
ON [dbo].[UserAssessmentQuestions]
    ([UserAssessmentCategoryID]);
GO

-- Creating foreign key on [UserAssessmentQuestionID] in table 'UserAssessmentCheckoffItems'
ALTER TABLE [dbo].[UserAssessmentCheckoffItems]
ADD CONSTRAINT [fk_UserAssessmentCheckoffItemUserAssessmentQuestion]
    FOREIGN KEY ([UserAssessmentQuestionID])
    REFERENCES [dbo].[UserAssessmentQuestions]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_UserAssessmentCheckoffItemUserAssessmentQuestion'
CREATE INDEX [IX_fk_UserAssessmentCheckoffItemUserAssessmentQuestion]
ON [dbo].[UserAssessmentCheckoffItems]
    ([UserAssessmentQuestionID]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRole]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUser]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUser]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
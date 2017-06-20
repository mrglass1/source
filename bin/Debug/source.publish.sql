﻿/*
Deployment script for dev_media

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "dev_media"
:setvar DefaultFilePrefix "dev_media"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key b44aa609-ec03-434f-9d6b-e291c237c83a is skipped, element [dbo].[Table1].[Name] (SqlSimpleColumn) will not be renamed to Name1';


GO
PRINT N'Rename refactoring operation with key 60e3fe8b-4962-41c8-9f7e-fafa330c774f is skipped, element [dbo].[Table1].[Url] (SqlSimpleColumn) will not be renamed to URL';


GO
PRINT N'Rename refactoring operation with key 021f4419-0f61-4dbb-9988-9c688fe00d75 is skipped, element [Source].[Table2].[FirstName] (SqlSimpleColumn) will not be renamed to DateAdded';


GO
PRINT N'Rename refactoring operation with key 3791cfe4-501d-42dd-ad45-9e61370a2d41 is skipped, element [Source].[Table2] (SqlTable) will not be renamed to [Site]';


GO
PRINT N'Rename refactoring operation with key c98439b5-2c3b-427a-94b6-4a1c71479b54 is skipped, element [dbo].[Table1] (SqlTable) will not be renamed to [Post]';


GO
PRINT N'Rename refactoring operation with key b196d061-f06f-4508-98a0-b0c57562b6d6 is skipped, element [Source].[Post].[Name1] (SqlSimpleColumn) will not be renamed to Title';


GO
PRINT N'Rename refactoring operation with key 636c6ec4-c163-49fb-af4d-8dcc1e9f3b6f is skipped, element [Source].[Post].[URL] (SqlSimpleColumn) will not be renamed to Url';


GO
PRINT N'Rename refactoring operation with key 6d4f955b-ad11-4684-9359-f34e68a2b47d is skipped, element [Source].[Post].[Date_Added] (SqlSimpleColumn) will not be renamed to DateAdded';


GO
PRINT N'Rename refactoring operation with key db750c7b-9e63-4fce-9887-2c97b868f366 is skipped, element [Source].[Post].[Date_Modified] (SqlSimpleColumn) will not be renamed to DateModified';


GO
PRINT N'Rename refactoring operation with key 77c807f1-8a0d-4ac5-a5f0-ca3c1829b86e is skipped, element [Source].[Resource].[ResourceName] (SqlSimpleColumn) will not be renamed to PostId';


GO
PRINT N'Rename refactoring operation with key ad62d7bf-ab8f-4e47-b22f-1cf14aa37e21 is skipped, element [Source].[ResourceType].[ResourceName] (SqlSimpleColumn) will not be renamed to ResourceTypeName';


GO
PRINT N'Creating [Media]...';


GO
CREATE SCHEMA [Media]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [Media].[Series]...';


GO
CREATE TABLE [Media].[Series] (
    [Id]           INT         NOT NULL,
    [SeriesName]   NCHAR (55)  NULL,
    [SeriesUrl]    NCHAR (255) NULL,
    [SeriesDesc]   NCHAR (155) NULL,
    [DateAdded]    DATE        NULL,
    [DateModified] DATE        NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Media].[Actor]...';


GO
CREATE TABLE [Media].[Actor] (
    [Id]        INT        IDENTITY (1, 1) NOT NULL,
    [FirstName] NCHAR (10) NULL,
    [LastName]  NCHAR (10) NULL,
    [Nickname]  NCHAR (10) NULL,
    [DOB]       NCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Media].[Studio]...';


GO
CREATE TABLE [Media].[Studio] (
    [Id]         INT        IDENTITY (1, 1) NOT NULL,
    [StudioName] NCHAR (10) NULL,
    [StudioUrl]  NCHAR (10) NULL,
    [StudioDesc] NCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Media].[ResourceCategory]...';


GO
CREATE TABLE [Media].[ResourceCategory] (
    [Id]              INT        IDENTITY (1, 1) NOT NULL,
    [ResourceCatName] NCHAR (10) NULL,
    [ResourceCatDesc] NCHAR (10) NULL,
    [DateAdded]       DATE       NULL,
    [DateModified]    DATE       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Media].[ResourceType]...';


GO
CREATE TABLE [Media].[ResourceType] (
    [Id]               INT        IDENTITY (1, 1) NOT NULL,
    [ResourceTypeName] NCHAR (15) NULL,
    [ResourceDesc]     NCHAR (55) NULL,
    [DateAdded]        DATE       NULL,
    [DateModified]     DATE       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Media].[Resource]...';


GO
CREATE TABLE [Media].[Resource] (
    [Id]               INT         NOT NULL,
    [PostId]           INT         NULL,
    [ResourceName]     NCHAR (55)  NULL,
    [ResourceLocation] NCHAR (255) NULL,
    [Filename]         NCHAR (55)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Media].[Site]...';


GO
CREATE TABLE [Media].[Site] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Title]        NCHAR (100)    NULL,
    [Url]          NVARCHAR (155) NULL,
    [DateAdded]    DATE           NULL,
    [DateModified] DATE           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Media].[Post]...';


GO
CREATE TABLE [Media].[Post] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Title]        NCHAR (155)    NULL,
    [Url]          NVARCHAR (MAX) NULL,
    [DateAdded]    DATE           NULL,
    [DateModified] DATE           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b44aa609-ec03-434f-9d6b-e291c237c83a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b44aa609-ec03-434f-9d6b-e291c237c83a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '60e3fe8b-4962-41c8-9f7e-fafa330c774f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('60e3fe8b-4962-41c8-9f7e-fafa330c774f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '021f4419-0f61-4dbb-9988-9c688fe00d75')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('021f4419-0f61-4dbb-9988-9c688fe00d75')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3791cfe4-501d-42dd-ad45-9e61370a2d41')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3791cfe4-501d-42dd-ad45-9e61370a2d41')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c98439b5-2c3b-427a-94b6-4a1c71479b54')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c98439b5-2c3b-427a-94b6-4a1c71479b54')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b196d061-f06f-4508-98a0-b0c57562b6d6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b196d061-f06f-4508-98a0-b0c57562b6d6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '636c6ec4-c163-49fb-af4d-8dcc1e9f3b6f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('636c6ec4-c163-49fb-af4d-8dcc1e9f3b6f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6d4f955b-ad11-4684-9359-f34e68a2b47d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6d4f955b-ad11-4684-9359-f34e68a2b47d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'db750c7b-9e63-4fce-9887-2c97b868f366')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('db750c7b-9e63-4fce-9887-2c97b868f366')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '77c807f1-8a0d-4ac5-a5f0-ca3c1829b86e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('77c807f1-8a0d-4ac5-a5f0-ca3c1829b86e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ad62d7bf-ab8f-4e47-b22f-1cf14aa37e21')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ad62d7bf-ab8f-4e47-b22f-1cf14aa37e21')

GO

GO
PRINT N'Update complete.';


GO

CREATE TABLE [Media].[Site]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Title] NCHAR(100) NULL, 
    [Url] NVARCHAR(155) NULL, 
    [DateAdded] DATE NULL, 
    [DateModified] DATE NULL
)

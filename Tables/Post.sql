CREATE TABLE [Media].[Post]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Title] NCHAR(155) NULL, 
    [Url] NVARCHAR(MAX) NULL, 
    [DateAdded] DATE NULL, 
    [DateModified] DATE NULL 
)

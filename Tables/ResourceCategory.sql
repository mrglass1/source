CREATE TABLE [Media].[ResourceCategory]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ResourceCatName] NCHAR(10) NULL, 
    [ResourceCatDesc] NCHAR(10) NULL, 
    [DateAdded] DATE NULL, 
    [DateModified] DATE NULL
)

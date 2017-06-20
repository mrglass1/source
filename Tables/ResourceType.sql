CREATE TABLE [Media].[ResourceType]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ResourceTypeName] NCHAR(15) NULL, 
    [ResourceDesc] NCHAR(55) NULL, 
    [DateAdded] DATE NULL, 
    [DateModified] DATE NULL
)

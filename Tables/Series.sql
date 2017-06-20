CREATE TABLE [Media].[Series]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [SeriesName] NCHAR(55) NULL, 
    [SeriesUrl] NCHAR(255) NULL, 
    [SeriesDesc] NCHAR(155) NULL, 
    [DateAdded] DATE NULL, 
    [DateModified] DATE NULL
)

CREATE TABLE [Media].[Resource]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [PostId] INT NULL, 
    [ResourceName] NCHAR(55) NULL, 
    [ResourceLocation] NCHAR(255) NULL, 
    [Filename] NCHAR(55) NULL
)

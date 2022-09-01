CREATE TABLE [dbo].[Product]
(
	[ProductId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(100) NOT NULL, 
    [Description] NVARCHAR(200) NULL, 
    [UPC] VARCHAR(12) NULL, 
    [TypeId] INT NULL, 
    [DateCreated] DATETIME2 NOT NULL DEFAULT GETUTCDATE(), 
    CONSTRAINT [FK_Product_Type] FOREIGN KEY ([TypeId]) REFERENCES [Type]([TypeId])
)

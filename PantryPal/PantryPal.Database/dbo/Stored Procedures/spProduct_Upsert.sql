CREATE PROCEDURE [dbo].[spProduct_Upsert]
    @ProductId INT,
    @Name NVARCHAR(100),
    @Description NVARCHAR(2000),
    @UPC VARCHAR(12),
    @TypeId INT
AS
BEGIN

    BEGIN TRANSACTION;
 
    INSERT dbo.[Product]
        ([Name],
        [Description],
        [UPC],
        [TypeId]) 
      SELECT 
        @Name, 
        @Description,
        @UPC,
        @TypeId
      WHERE NOT EXISTS
      (
        SELECT 1 FROM dbo.[Product] WITH (UPDLOCK, SERIALIZABLE)
          WHERE [ProductId] = @ProductId
      );
 
    IF @@ROWCOUNT = 0
    BEGIN
      UPDATE dbo.[Product] 
      SET [Name] = @Name,
      [Description] = @Description,
      [UPC] = @UPC,
      [TypeId] = @TypeId
      WHERE 
        [ProductId] = @ProductId;
    END
    ELSE
    BEGIN
        SET @ProductId = SCOPE_IDENTITY();
    END
 
    COMMIT TRANSACTION;

    SELECT @ProductId;

END

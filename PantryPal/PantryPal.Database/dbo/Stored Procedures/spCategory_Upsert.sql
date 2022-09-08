CREATE PROCEDURE [dbo].[spCategory_Upsert]
    @CategoryId INT,
    @Name NVARCHAR(100)
AS
BEGIN

    BEGIN TRANSACTION;
 
    INSERT dbo.[Category]
        ([Name])
      SELECT 
        @Name
      WHERE NOT EXISTS
      (
        SELECT 1 FROM dbo.[Category] WITH (UPDLOCK, SERIALIZABLE)
          WHERE [CategoryId] = @CategoryId
      );
 
    IF @@ROWCOUNT = 0
    BEGIN
      UPDATE dbo.[Category] 
      SET [Name] = @Name
      WHERE 
        [CategoryId] = @CategoryId;
    END
    ELSE
    BEGIN
        SET @CategoryId = SCOPE_IDENTITY();
    END
 
    COMMIT TRANSACTION;

    SELECT @CategoryId;

END

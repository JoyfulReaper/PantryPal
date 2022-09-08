CREATE PROCEDURE [dbo].[spCategory_Delete]
	@CategoryId INT
AS
BEGIN
	DELETE FROM dbo.[Category]
	WHERE
		CategoryId = @CategoryId;
END
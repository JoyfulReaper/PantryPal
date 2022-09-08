CREATE PROCEDURE [dbo].[spCategory_Load]
	@CategoryId INT
AS
BEGIN
	SELECT
		[CategoryId]
		,[Name]
		,[DateCreated]
		,[DateDeleted]
	FROM
		[Category]
	WHERE
		CategoryId = @CategoryId;
END
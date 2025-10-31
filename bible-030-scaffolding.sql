/* *************************************************************************
Bible Database: SQL Server, by Don Jewett
https://github.com/donjewett/bible-sql-mssql

bible-030-scaffolding.sql

Version: 2025.10.30

MIT License

Copyright (c) 2025 by Don Jewett

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

************************************************************************* */

----------------------------------------------------------------------------
-- add_Site
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Site')
	DROP PROCEDURE add_Site
GO

CREATE PROCEDURE add_Site
	@name nvarchar(64),
	@url varchar(255),
	@id int = NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	SET @id = (SELECT [Id] FROM [Sites] WHERE [Url] = @url)
	IF @id IS NULL
	BEGIN
		INSERT INTO [Sites] ([Name], [Url]) VALUES (@name, @url)
		SET @id = SCOPE_IDENTITY()
	END
	
END
GO


----------------------------------------------------------------------------
-- add_ResourceType
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_ResourceType')
	DROP PROCEDURE add_ResourceType
GO

CREATE PROCEDURE add_ResourceType
	@id varchar(8),
	@name nvarchar(64)
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM ResourceTypes WHERE [Id] = @id)
		INSERT INTO ResourceTypes ([Id], [Name]) VALUES (@id, @name)

END
GO


----------------------------------------------------------------------------
-- add_Resource
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Resource')
	DROP PROCEDURE add_Resource
GO

CREATE PROCEDURE add_Resource
	@version nvarchar(16),
	@type varchar(8), 
	@url varchar(255),
	@revision varchar(16) = NULL,
	@official bit = 0,
	@siteName varchar(64) = NULL,
	@siteUrl varchar(255) = NULL,
	@id int = NULL OUTPUT

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @siteId int = NULL
	IF @siteUrl IS NOT NULL AND @siteName IS NOT NULL
		EXEC add_Site @name = @siteName, @url = @siteUrl, @id = @siteId OUTPUT

	DECLARE @versionId int = (SELECT [Id] FROM [Versions] WHERE [Code] = @version)
	SET @id = (SELECT [Id] FROM Resources WHERE [VersionId] = @versionId AND [ResourceTypeId] = @type AND [Url] = @url)
	
	IF @revision IS NULL AND @id IS NULL
	BEGIN
		INSERT INTO Resources ([VersionId], [ResourceTypeId], [Url], [IsOfficial], [SiteId]) VALUES (@versionId, @type, @url, @official, @siteId)
		SET @id = SCOPE_IDENTITY()
	END

	IF @revision IS NOT NULL 
	BEGIN
		DECLARE @revisionId int = (SELECT [Id] FROM Revisions WHERE [Code] = @revision)
		SET @id = (SELECT [Id] FROM Resources WHERE [VersionId] = @versionId AND [RevisionId] = @revisionId AND [ResourceTypeId] = @type AND [Url] = @url)
		IF @id IS NULL 
		BEGIN
			INSERT INTO Resources ([VersionId], [RevisionId], [ResourceTypeId], [Url], [IsOfficial], [SiteId]) VALUES (@versionId, @revisionId, @type, @url, @official, @siteId)
			SET @id = SCOPE_IDENTITY()
		END
	END

END
GO


----------------------------------------------------------------------------
-- add_Version
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Version')
	DROP PROCEDURE add_Version
GO

CREATE PROCEDURE add_Version
	@code varchar(16), 
	@name nvarchar(64),
	@lang varchar(3),
	@year smallint,
	@parent varchar(16) = NULL, 
	@sub nvarchar(128) = NULL,
	@hebrew varchar(3) = NULL,
	@greek varchar(3) = NULL,
	@license int = NULL,
	@level [decimal](4, 2) = NULL,
	@versionUrl varchar(255) = NULL,
	@licenseUrl varchar(255) = NULL,
	@readUrl varchar(255) = NULL,
	@id int = NULL OUTPUT

AS
BEGIN
	SET NOCOUNT ON;

	SET @id = (SELECT [Id] FROM [Versions] WHERE [Code] = @code)
	
	IF NOT EXISTS (SELECT * FROM [Versions] WHERE [Code] = @code)
	BEGIN
		INSERT INTO [Versions] ([Code], [Name], [LanguageId], [YearPublished]) VALUES (@code, @name, @lang, @year)
		SET @id = SCOPE_IDENTITY()
	END

	UPDATE [Versions] SET [Subtitle] = @sub WHERE [Id] = @id AND @sub IS NOT NULL AND [Subtitle] IS NULL
	UPDATE [Versions] SET [HebrewFormId] = @hebrew WHERE [Id] = @id AND @hebrew IS NOT NULL AND [HebrewFormId] IS NULL
	UPDATE [Versions] SET [GreekFormId] = @greek WHERE [Id] = @id AND @greek IS NOT NULL AND [GreekFormId] IS NULL
	UPDATE [Versions] SET [LicenseTypeId] = @license WHERE [Id] = @id AND @license IS NOT NULL AND [LicenseTypeId] IS NULL
	UPDATE [Versions] SET [ReadingLevel] = @level WHERE [Id] = @id AND @level IS NOT NULL AND [ReadingLevel] IS NULL

	IF EXISTS (SELECT * FROM [Versions] WHERE [Code] = @parent)
	BEGIN
		DECLARE @parentId int = (SELECT [Id] FROM [Versions] WHERE [Code] = @parent)
		UPDATE [Versions] SET [ParentId] = @parentId WHERE [Id] = @id AND @parent IS NOT NULL AND [ParentId] IS NULL
	END

	IF @versionUrl IS NOT NULL EXEC add_Resource @version=@code, @type='version', @url=@versionUrl, @official=1
	IF @licenseUrl IS NOT NULL EXEC add_Resource @version=@code, @type='license', @url=@licenseUrl, @official=1
	IF @readUrl IS NOT NULL EXEC add_Resource @version=@code, @type='read', @url=@readUrl, @official=1

END
GO


----------------------------------------------------------------------------
-- add_Revision
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Revision')
	DROP PROCEDURE add_Revision
GO

CREATE PROCEDURE add_Revision
	@code varchar(16), 
	@version varchar(16),
	@year smallint,
	@sub nvarchar(128) = NULL,
	@revisionUrl varchar(255) = NULL,
	@licenseUrl varchar(255) = NULL,
	@readUrl varchar(255) = NULL,
	@id int = NULL OUTPUT

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @versionId int = (SELECT [Id] FROM [Versions] WHERE [Code] = @version)
	
	SET @id = (SELECT [Id] FROM Revisions WHERE [Code] = @code)
	IF @id IS NULL
	BEGIN
		INSERT INTO [Revisions]([Code], [VersionId], [YearPublished], [Subtitle]) VALUES (@code, @versionId, @year, @sub)
		SET @id = SCOPE_IDENTITY()
	END

	UPDATE Revisions SET [Subtitle] = @sub WHERE [Id] = @id AND @sub IS NOT NULL AND [Subtitle] IS NULL

	IF @revisionUrl IS NOT NULL EXEC add_Resource @version=@version, @revision=@id, @type='revision', @url=@revisionUrl, @official=1
	IF @licenseUrl IS NOT NULL EXEC add_Resource @version=@version, @revision=@id, @type='license', @url=@licenseUrl, @official=1
	IF @readUrl IS NOT NULL EXEC add_Resource @version=@version, @revision=@id, @type='read', @url=@readUrl, @official=1

END
GO


----------------------------------------------------------------------------
-- add_Bible
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Bible')
	DROP PROCEDURE add_Bible
GO

CREATE PROCEDURE add_Bible
	@code varchar(16), 
	@name nvarchar(64),
	@version varchar(16),
	@year smallint,
	@revision varchar(16) = NULL,
	@sub nvarchar(128) = NULL,
	@sourceUrl varchar(255) = NULL,
	@id int = NULL OUTPUT

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @versionId int = (SELECT [Id] FROM [Versions] WHERE [Code] = @version)
	DECLARE @revisionId int = (SELECT [Id] FROM Revisions WHERE [Code] = @revision)

	SET @id = (SELECT [Id] FROM Bibles WHERE [Code] = @code)
	IF @id IS NULL
	BEGIN
		INSERT INTO Bibles ([Code], [VersionId], [RevisionId], [Name], [YearPublished], [Subtitle]) VALUES (@code, @versionId, @revisionId, @name, @year, @sub)
		SET @id = SCOPE_IDENTITY()
	END

	UPDATE Bibles SET [Subtitle] = @sub WHERE [Id] = @id AND @sub IS NOT NULL AND [Subtitle] IS NULL

	DECLARE @resourceId int
	IF @sourceUrl IS NOT NULL EXEC add_Resource @version=@version, @revision=@revision, @type='file', @url=@sourceUrl, @id=@resourceId OUTPUT
	
	UPDATE Bibles SET SourceId = @resourceId WHERE Id = @id AND SourceId IS NULL
	
END
GO


----------------------------------------------------------------------------
-- add_BibleVerse
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_BibleVerse')
	DROP PROCEDURE add_BibleVerse
GO

CREATE PROCEDURE add_BibleVerse
	@bibleId int, 
	@verseId int,
	@markup nvarchar(max),
	@premarkup nvarchar(255) = NULL,
	@postmarkup nvarchar(255) = NULL,
	@notes nvarchar(255) = NULL,
	@id int = NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	SET @id = (SELECT [Id] FROM BibleVerses WHERE [BibleId] = @bibleId AND [VerseId] = @verseId)
	IF @id IS NULL
	BEGIN
		INSERT INTO BibleVerses ([BibleId], [VerseId], [Markup], [PreMarkup], [PostMarkup], [Notes]) VALUES (@bibleId, @verseId, @markup, @premarkup, @postmarkup, @notes)
		SET @id = SCOPE_IDENTITY()
	END
END
GO


----------------------------------------------------------------------------
-- add_BibleMarkup
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_BibleMarkup')
	DROP PROCEDURE add_BibleMarkup
GO

CREATE PROCEDURE add_BibleMarkup
	@bibleId int, 
	@book varchar(64),
	@chapter smallint,
	@verse smallint,
	@markup nvarchar(max),
	@id int = NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @bookId int = (SELECT [Id] FROM Books WHERE @book IN ([Name], [Code], [Abbrev], [OsisCode], [ParaText], CONVERT(varchar(3),[Book])))

	IF @bookId IS NULL SET @bookId = (SELECT [BookId] FROM BookNames WHERE [Name] = @book);

	If @bookId IS NULL THROW 51000, 'Book cannot be found', 1;
	
	DECLARE @verseId int = (SELECT [Id] FROM Verses WHERE [BookId] = @bookId AND [Chapter] = @chapter AND [Verse] = @verse)
	EXEC add_BibleVerse @bibleId=@bibleId, @verseId=@verseId, @markup=@markup, @id=@id OUTPUT

END
GO

----------------------------------------------------------------------------
-- add_VersionNote
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_VersionNote')
	DROP PROCEDURE add_VersionNote
GO

CREATE PROCEDURE add_VersionNote
	@note nvarchar(max),
	@version varchar(16) = NULL,
	@revision varchar(16) = NULL,
	@bible varchar(16) = NULL,
	@canId int = NULL,
	@bkId int = NULL,
	@chId int = NULL,
	@verseId int = NULL,
	@label varchar(64) = NULL,
	@ranking int = 0,
	@id int = NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @versionId int = (SELECT [Id] FROM [Versions] WHERE [Code] = @version)
	DECLARE @revisionId int = (SELECT [Id] FROM Revisions WHERE [Code] = @revision)
	DECLARE @bibleId int = (SELECT [Id] FROM Bibles WHERE [Code] = @bible)
	
	SET @id = (SELECT [Id] FROM VersionNotes 
		WHERE [Note] = @note
			AND ISNULL(Label,'') = ISNULL(@label,'')
			AND ISNULL(VersionId,0) = ISNULL(@versionId,0) 
			AND ISNULL(RevisionId,0) = ISNULL(@revisionId,0)
			AND ISNULL(BibleId,0) = ISNULL(@bibleId,0)
			AND ISNULL(CanonId,0) = ISNULL(@canId,0)
			AND ISNULL(BookId,0) = ISNULL(@bkId,0)
			AND ISNULL(ChapterId,0) = ISNULL(@chId,0)
			AND ISNULL(VerseId,0) = ISNULL(@verseId,0)
		)
	
	IF @id IS NULL
	BEGIN
		INSERT INTO VersionNotes ([VersionId], [RevisionId], [BibleId], [CanonId], [BookId], [ChapterId], [VerseId], [Note], [Label], [Ranking]) 
			VALUES (@versionId, @revisionId, @bibleId, @canId, @bkId, @chId, @verseId, @note, @label, @ranking)
		SET @id = SCOPE_IDENTITY()
	END
	
		   
END
GO

/* *************************************************************************
Bible Database: SQL Server, by Don Jewett
https://github.com/donjewett/bible-sql-mssql

bible-015-descriptions.sql
Version: 2025.10.31

************************************************************************* */

-- -------------------------------------------------------------------------
-- add_MetaDescription
-- -------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_MetaDescription')
	DROP PROCEDURE add_MetaDescription
GO

CREATE PROCEDURE add_MetaDescription
	@table nvarchar(128),
	@column nvarchar(128),
	@description nvarchar(512)
AS
BEGIN

	DECLARE @schema nvarchar(50) = (SELECT TABLE_SCHEMA FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @table AND COLUMN_NAME = @column)
	IF @schema IS NOT NULL
	BEGIN
		IF EXISTS (SELECT * FROM sys.extended_properties props JOIN sys.columns cols 
				ON props.minor_id = cols.column_id AND cols.name = @column AND cols.object_id = props.major_id 
				WHERE props.major_id = OBJECT_ID(@table) AND props.name = N'MS_Description')
			EXEC sp_updateextendedproperty @name = N'MS_Description', @value = @description, @level0type = N'SCHEMA', @level0name = @schema, @level1type = N'TABLE', @level1name = @table, @level2type = N'COLUMN', @level2name = @column;
		ELSE
			EXEC sp_addextendedproperty @name = N'MS_Description', @value = @description, @level0type = N'SCHEMA', @level0name = @schema, @level1type = N'TABLE', @level1name = @table, @level2type = N'COLUMN', @level2name = @column;
	END
	
	RETURN 0

END
GO

-- -------------------------------------------------------------------------
-- Languages
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Languages', N'Id', N'Three character ISO 693-1 code'
EXEC add_MetaDescription N'Languages', N'Name', N'Name of the Language in English'
EXEC add_MetaDescription N'Languages', N'HtmlCode', N'Two character html code for Language'
EXEC add_MetaDescription N'Languages', N'IsAncient', N'This language or dialect has been extinct since ancient times'


-- -------------------------------------------------------------------------
-- Canons
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Canons', N'Id', N'Canon Id following bible-sql numbering scheme'
EXEC add_MetaDescription N'Canons', N'Code', N'Short code following Protestant tradition'
EXEC add_MetaDescription N'Canons', N'Name', N'Name following Protestant tradition'
EXEC add_MetaDescription N'Canons', N'LanguageId', N'Primary Language of the Canon'


-- -------------------------------------------------------------------------
-- Sections
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Sections', N'Id', N'Section Id following bible-sql numbering scheme'
EXEC add_MetaDescription N'Sections', N'Name', N'Name of the Section following Protestant tradition'
EXEC add_MetaDescription N'Sections', N'CanonId', N'Canon of the Bible Section'


-- -------------------------------------------------------------------------
-- Books
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Books', N'Id', N'Book Id following bible-sql numbering scheme'
EXEC add_MetaDescription N'Books', N'Code', N'Short url-friendly lowercase Code for Book'
EXEC add_MetaDescription N'Books', N'Abbrev', N'Short Proper case abbreviation for Book'
EXEC add_MetaDescription N'Books', N'Name', N'Name of Book following Protestant tradition'
EXEC add_MetaDescription N'Books', N'Book', N'Index of Book following Protestant order'
EXEC add_MetaDescription N'Books', N'CanonId', N'Canon of Book following Protestant tradition'
EXEC add_MetaDescription N'Books', N'SectionId', N'Section of Book following Protestant tradition'
EXEC add_MetaDescription N'Books', N'IsSectionEnd', N'Is the final Book in the Section'
EXEC add_MetaDescription N'Books', N'ChapterCount', N'Count of chapters in this book following Protestant tradition'
EXEC add_MetaDescription N'Books', N'OsisCode', N'Osis code for the Book'
EXEC add_MetaDescription N'Books', N'Paratext', N'Paratext code for the Book'


-- -------------------------------------------------------------------------
-- BookNames
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'BookNames', N'Name', N'Altername name or code for Book'
EXEC add_MetaDescription N'BookNames', N'BookId', N'Book Id following bible-sql numbering scheme'


-- -------------------------------------------------------------------------
-- Chapters
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Chapters', N'Id', N'Chapter Id following bible-sql numbering scheme'
EXEC add_MetaDescription N'Chapters', N'Code', N'Short, url-friendly lowercase Code for chapter'
EXEC add_MetaDescription N'Chapters', N'Reference', N'Human readable reference using Book Abbrev and Chapter number'
EXEC add_MetaDescription N'Chapters', N'Chapter', N'Chapter number'
EXEC add_MetaDescription N'Chapters', N'BookId', N'Book of the Chapter'
EXEC add_MetaDescription N'Chapters', N'IsBookEnd', N'Is the final Chapter in the Book'
EXEC add_MetaDescription N'Chapters', N'VerseCount', N'Count of verses in the Chapter'


-- -------------------------------------------------------------------------
-- Verses
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Verses', N'Id', N'Verse Id following bible-sql numbering scheme'
EXEC add_MetaDescription N'Verses', N'Code', N'Short, url-friendly lowercase Code for verse'
EXEC add_MetaDescription N'Verses', N'OsisCode', N'Osis code for the Verse'
EXEC add_MetaDescription N'Verses', N'Reference', N'Human readable reference using Book Abbrev Chapter:Verse'
EXEC add_MetaDescription N'Verses', N'CanonId', N'Canon of the Verse' --denormalized
EXEC add_MetaDescription N'Verses', N'SectionId', N'Section of the Verse' --denormalized
EXEC add_MetaDescription N'Verses', N'BookId', N'Book of the Verse' --denormalized
EXEC add_MetaDescription N'Verses', N'ChapterId', N'Chapter of the Verse'
EXEC add_MetaDescription N'Verses', N'IsChapterEnd', N'Is the final Verse in the Chapter'
EXEC add_MetaDescription N'Verses', N'Book', N'Book number' --denormalized
EXEC add_MetaDescription N'Verses', N'Chapter', N'Chapter number' --denormalized
EXEC add_MetaDescription N'Verses', N'Verse', N'Verse number'


-- -------------------------------------------------------------------------
-- GreekTextForms
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'GreekTextForms', N'Id', N'One to three character code for Greek form'
EXEC add_MetaDescription N'GreekTextForms', N'Name', N'Name of the Greek form'
EXEC add_MetaDescription N'GreekTextForms', N'ParentId', N'The Greek form this one derives from'


-- -------------------------------------------------------------------------
-- HebrewTextForms
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'HebrewTextForms', N'Id', N'One to three character code for Hebrew text'
EXEC add_MetaDescription N'HebrewTextForms', N'Name', N'Name of the Hebrew form'
EXEC add_MetaDescription N'HebrewTextForms', N'ParentId', N'The Hebrew form this one derives from'


-- -------------------------------------------------------------------------
-- LicensePermissions
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'LicensePermissions', N'Id', N'Auto-incrementing Id'
EXEC add_MetaDescription N'LicensePermissions', N'Name', N'Name of the Permission'
EXEC add_MetaDescription N'LicensePermissions', N'Permissiveness', N'Permissiveness of license on a scale of 0 to 100'


-- -------------------------------------------------------------------------
-- LicenseTypes
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'LicenseTypes', N'Id', N'Auto-incrementing Id'
EXEC add_MetaDescription N'LicenseTypes', N'Name', N'Name of the License Type'
EXEC add_MetaDescription N'LicenseTypes', N'IsFree', N'True for licences allowing free quotation -- false for commercial restricting use'
EXEC add_MetaDescription N'LicenseTypes', N'PermissionId', N'Permissiveness for License Type'


-- -------------------------------------------------------------------------
-- Versions
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Versions', N'Id', N'Auto-incrementing Id'
EXEC add_MetaDescription N'Versions', N'Code', N'Version Code used for lookups. Must be unique'
EXEC add_MetaDescription N'Versions', N'Name', N'Name of the Version'
EXEC add_MetaDescription N'Versions', N'Subtitle', N'Optional Subtitle for the version'
EXEC add_MetaDescription N'Versions', N'LanguageId', N'Language of the Version'
EXEC add_MetaDescription N'Versions', N'YearPublished', N'Year first published in entirety'
EXEC add_MetaDescription N'Versions', N'HebrewFormId', N'Textual basis for the Old Testament'
EXEC add_MetaDescription N'Versions', N'GreekFormId', N'Textual basis for the New Testament'
EXEC add_MetaDescription N'Versions', N'ParentId', N'Optional Version this is derived from'
EXEC add_MetaDescription N'Versions', N'LicenseTypeId', N'Optional License Type'
EXEC add_MetaDescription N'Versions', N'ReadingLevel', N'Reading Level using U.S. school grades (8.0 = Eighth Grade)'


-- -------------------------------------------------------------------------
-- Revisions
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Revisions', N'Id', N'Auto-incrementing Id'
EXEC add_MetaDescription N'Revisions', N'Code', N'Revision Code used for lookups. Must be unique'
EXEC add_MetaDescription N'Revisions', N'VersionId', N'Version for the Revision'
EXEC add_MetaDescription N'Revisions', N'YearPublished', N'Year the Revision was first published in its entirety'
EXEC add_MetaDescription N'Revisions', N'Subtitle', N'Subtitle for the Revision, esp. if different than Version (i.e. Second Edition)'


-- -------------------------------------------------------------------------
-- Sites
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Sites', N'Id', N'Auto-incrementing Id'
EXEC add_MetaDescription N'Sites', N'Name', N'Site Name'
EXEC add_MetaDescription N'Sites', N'Url', N'Site Url'


-- -------------------------------------------------------------------------
-- ResourceTypes
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'ResourceTypes', N'Id', N'Eight character code'
EXEC add_MetaDescription N'ResourceTypes', N'Name', N'Name of the Resource Type'


-- -------------------------------------------------------------------------
-- Resources
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Resources', N'Id', N'Auto-incrementing Id'
EXEC add_MetaDescription N'Resources', N'ResourceTypeId', N'Eight character code for Resource Type'
EXEC add_MetaDescription N'Resources', N'VersionId', N'Version of the Resource'
EXEC add_MetaDescription N'Resources', N'RevisionId', N'Optional Revision of the Resource'
EXEC add_MetaDescription N'Resources', N'Url', N'Source Url for the Resource'
EXEC add_MetaDescription N'Resources', N'IsOfficial', N'True if the Resource is the official one (i.e. provided by the publisher)'
EXEC add_MetaDescription N'Resources', N'SiteId', N'Site associated with the Resource'


-- -------------------------------------------------------------------------
-- PassageTypes
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'PassageTypes', N'Id', N'Integer Id'
EXEC add_MetaDescription N'PassageTypes', N'Name', N'Passage Type Name'


-- -------------------------------------------------------------------------
-- Passages
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Passages', N'Id', N'Auto-incrementing Id'
EXEC add_MetaDescription N'Passages', N'Name', N'Passage Name'
EXEC add_MetaDescription N'Passages', N'VerseId', N'The First Verse for this Passage'
EXEC add_MetaDescription N'Passages', N'EndVerseId', N'The Last Verse for this Passage'
EXEC add_MetaDescription N'Passages', N'PassageTypeId', N'The Type of Passage'


-- -------------------------------------------------------------------------
-- Bibles
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'Bibles', N'Id', N'Auto-incrementing Id'
EXEC add_MetaDescription N'Bibles', N'Code', N'Code for lookups. Must be unique'
EXEC add_MetaDescription N'Bibles', N'Name', N'Name of this specific Bible'
EXEC add_MetaDescription N'Bibles', N'Subtitle', N'Subtitle for this specific Bible'
EXEC add_MetaDescription N'Bibles', N'VersionId', N'Version of this Bible'
EXEC add_MetaDescription N'Bibles', N'RevisionId', N'Optional Revision of this Bible'
EXEC add_MetaDescription N'Bibles', N'YearPublished', N'Year this Bible (or Revision) was published'
EXEC add_MetaDescription N'Bibles', N'TextFormat', N'Code for the format of the Content'
EXEC add_MetaDescription N'Bibles', N'SourceId', N'Optional source Resource of this Bible'


-- -------------------------------------------------------------------------
-- BibleVerses
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'BibleVerses', N'Id', N'Auto-incrementing Id'
EXEC add_MetaDescription N'BibleVerses', N'BibleId', N'The Bible for this Content'
EXEC add_MetaDescription N'BibleVerses', N'VerseId', N'The Verse for this Content'
EXEC add_MetaDescription N'BibleVerses', N'Markup', N'The Content of the Bible Verse'
EXEC add_MetaDescription N'BibleVerses', N'PreMarkup', N'Optional Markup, especially for scribal notes in the manuscripts.'
EXEC add_MetaDescription N'BibleVerses', N'PostMarkup', N'Optional Markup, especially for scribal notes in the manuscripts.'
EXEC add_MetaDescription N'BibleVerses', N'Notes', N'Optional Notes for the Bible Verse'


-- -------------------------------------------------------------------------
-- VersionNotes
-- -------------------------------------------------------------------------
EXEC add_MetaDescription N'VersionNotes', N'Id', N'Auto-incrementing Id'
EXEC add_MetaDescription N'VersionNotes', N'VersionId', N'Version for this Note'
EXEC add_MetaDescription N'VersionNotes', N'RevisionId', N'Optional Revision for this Note -- for notes specific to an Revision'
EXEC add_MetaDescription N'VersionNotes', N'BibleId', N'Optional Bible for this Note -- for notes specific to a Bible'
EXEC add_MetaDescription N'VersionNotes', N'CanonId', N'Optional Canon for this Note -- for notes that apply to the Canon as a whole'
EXEC add_MetaDescription N'VersionNotes', N'BookId', N'Optional Book for this Note -- for notes that apply to the Book as a whole'
EXEC add_MetaDescription N'VersionNotes', N'ChapterId', N'Optional Chapter for this Note -- for notes that apply to the Chapter as a whole'
EXEC add_MetaDescription N'VersionNotes', N'VerseId', N'Optional Verse for this Note -- for notes that apply to the Verse. Use BibleVerses.Notes for short notes'
EXEC add_MetaDescription N'VersionNotes', N'Note', N'Content of the Note'
EXEC add_MetaDescription N'VersionNotes', N'Label', N'Optional Label for the Note'
EXEC add_MetaDescription N'VersionNotes', N'Ranking', N'Weight (Descending Sort Order) of the Note'

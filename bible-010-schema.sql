/* *************************************************************************
Bible Database: SQL Server, by Don Jewett
https://github.com/donjewett/bible-sql-mssql

bible-010-schema.sql
Version: 2025.10.31

************************************************************************* */

-- -------------------------------------------------------------------------
-- Languages
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Languages')
CREATE TABLE Languages (
	Id char(3) NOT NULL,
	Name varchar(16) NOT NULL,
	HtmlCode char(2) NOT NULL,
	IsAncient bit NOT NULL CONSTRAINT DF_Languages_IsAncient DEFAULT (0),
	CONSTRAINT PK_Languages PRIMARY KEY CLUSTERED (Id)
)

-- -------------------------------------------------------------------------
-- Canons
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Canons')
CREATE TABLE Canons (
	Id int NOT NULL,
	Code char(2) NOT NULL,
	Name varchar(24) NOT NULL,
	LanguageId char(3) NOT NULL,
	CONSTRAINT PK_Canons PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Canons_Languages FOREIGN KEY (LanguageId) REFERENCES Languages (Id)
)

-- -------------------------------------------------------------------------
-- Sections
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Sections')
CREATE TABLE Sections (
	Id int NOT NULL,
	Name varchar(16) NOT NULL,
	CanonId int NOT NULL,
	CONSTRAINT PK_Sections PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Sections_Canons FOREIGN KEY (CanonId) REFERENCES Canons (Id)
)

-- -------------------------------------------------------------------------
-- Books
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Books')
CREATE TABLE Books (
	Id int NOT NULL,
	Code varchar(5) NOT NULL,
	Abbrev varchar(5) NOT NULL,
	Name varchar(16) NOT NULL,
	Book tinyint NOT NULL,
	CanonId int NOT NULL, -- denormalized
	SectionId int NOT NULL,
	IsSectionEnd bit NOT NULL CONSTRAINT DF_Books_IsSectionEnd DEFAULT (0), -- TO DO: add this
	ChapterCount tinyint NOT NULL,
	OsisCode varchar(6) NOT NULL,
	Paratext char(3) NOT NULL,
	CONSTRAINT PK_Books PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Books_Canons FOREIGN KEY (CanonId) REFERENCES Canons (Id),
	CONSTRAINT FK_Books_Sections FOREIGN KEY (SectionId) REFERENCES Sections (Id)
)

-- -------------------------------------------------------------------------
-- BookNames
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BookNames')
CREATE TABLE BookNames (
	Name varchar(64) NOT NULL,
	BookId int NOT NULL,
	CONSTRAINT PK_BookNames PRIMARY KEY CLUSTERED (Name),
	CONSTRAINT FK_BookNames_Books FOREIGN KEY (BookId) REFERENCES Books (Id)
)

-- -------------------------------------------------------------------------
-- Chapters
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Chapters')
CREATE TABLE Chapters (
	Id int NOT NULL,
	Code varchar(7) NOT NULL,
	Reference varchar(8) NOT NULL,
	Chapter tinyint NOT NULL,
	BookId int NOT NULL,
	IsBookEnd bit NOT NULL CONSTRAINT DF_Chapters_IsBookEnd DEFAULT (0), -- TO DO: add this,
	VerseCount int NOT NULL,
	CONSTRAINT PK_Chapters PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Chapters_Books FOREIGN KEY (BookId) REFERENCES Books (Id)
)

-- -------------------------------------------------------------------------
-- Verses
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Verses')
CREATE TABLE Verses (
	Id int NOT NULL,
	Code varchar(16) NOT NULL,
	OsisCode varchar(12) NOT NULL,
	Reference varchar(10) NOT NULL,
	CanonId int NOT NULL, -- denormalized
	SectionId int NOT NULL, -- denormalized
	BookId int NOT NULL, -- denormalized
	ChapterId int NOT NULL,
	IsChapterEnd bit NOT NULL CONSTRAINT DF_Verses_IsChapterEnd DEFAULT (0), -- TO DO: add this,
	Book tinyint NOT NULL, -- denormalized
	Chapter tinyint NOT NULL, -- denormalized
	Verse tinyint NOT NULL,
	CONSTRAINT PK_Verses PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Verses_Books FOREIGN KEY (BookId) REFERENCES Books (Id),
	CONSTRAINT FK_Verses_Chapters FOREIGN KEY (ChapterId) REFERENCES Chapters (Id),
	CONSTRAINT FK_Verses_Canons FOREIGN KEY (CanonId) REFERENCES Canons (Id),
	CONSTRAINT FK_Verses_Sections FOREIGN KEY (SectionId) REFERENCES Sections (Id)
)

-- -------------------------------------------------------------------------
-- GreekTextForms
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'GreekTextForms')
CREATE TABLE GreekTextForms (
	Id char(3) NOT NULL,
	Name varchar(48) NOT NULL,
	ParentId char(3) NULL,
	CONSTRAINT PK_GreekTextForms PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_GreekTextForms_GreekTextForms FOREIGN KEY (ParentId) REFERENCES GreekTextForms (Id)
)

-- -------------------------------------------------------------------------
-- HebrewTextForms
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'HebrewTextForms')
CREATE TABLE HebrewTextForms (
	Id char(3) NOT NULL,
	Name varchar(48) NOT NULL,
	ParentId char(3) NULL,
	CONSTRAINT PK_HebrewTextForms PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_HebrewTextForms_HebrewTextForms FOREIGN KEY (ParentId) REFERENCES HebrewTextForms (Id)
)

-- -------------------------------------------------------------------------
-- LicensePermissions
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'LicensePermissions')
CREATE TABLE LicensePermissions (
	Id int IDENTITY(1,1) NOT NULL,
	Name varchar(48) NOT NULL,
	Permissiveness int NOT NULL,
	CONSTRAINT PK_LicensePermissions PRIMARY KEY CLUSTERED (Id)
)

-- -------------------------------------------------------------------------
-- LicenseTypes
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'LicenseTypes')
CREATE TABLE LicenseTypes (
	Id int IDENTITY(1,1) NOT NULL,
	Name varchar(64) NOT NULL,
	IsFree bit NOT NULL CONSTRAINT DF_LicenseTypes_IsFree DEFAULT (0), -- TO DO: add this,
	PermissionId int NULL,
	CONSTRAINT PK_LicenseType PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_LicenseTypes_LicensePermissions FOREIGN KEY (PermissionId) REFERENCES LicensePermissions (Id)
)

-- -------------------------------------------------------------------------
-- Versions
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Versions')
CREATE TABLE Versions (
	Id int IDENTITY(1,1) NOT NULL,
	Code varchar(16) NOT NULL,
	Name nvarchar(64) NOT NULL,
	Subtitle nvarchar(128) NULL,
	LanguageId char(3) NOT NULL,
	YearPublished smallint NOT NULL,
	HebrewFormId char(3) NULL,
	GreekFormId char(3) NULL,
	ParentId int NULL,
	LicenseTypeId int NULL,
	ReadingLevel decimal(4,2) NULL,
	CONSTRAINT PK_Versions PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Versions_Languages FOREIGN KEY (LanguageId) REFERENCES Languages (Id),
	CONSTRAINT FK_Versions_Versions FOREIGN KEY (ParentId) REFERENCES Versions (Id),
	CONSTRAINT FK_Version_TextForm_Greek FOREIGN KEY (GreekFormId) REFERENCES GreekTextForms (Id),
	CONSTRAINT FK_Version_TextForm_Hebrew FOREIGN KEY (HebrewFormId) REFERENCES HebrewTextForms (Id),
	CONSTRAINT FK_Versions_LicenseTypes FOREIGN KEY (LicenseTypeId) REFERENCES LicenseTypes (Id)
)

-- -------------------------------------------------------------------------
-- Revisions
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Revisions')
CREATE TABLE Revisions (
	Id int IDENTITY(1,1) NOT NULL,
	Code varchar(16) NOT NULL,
	VersionId int NOT NULL,
	YearPublished smallint NOT NULL,
	Subtitle nvarchar(128) NULL,
	CONSTRAINT PK_Revisions PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Revisions_Versions FOREIGN KEY (VersionId) REFERENCES Versions (Id)
)

-- -------------------------------------------------------------------------
-- Sites
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Sites')
CREATE TABLE Sites (
	Id int IDENTITY(1,1) NOT NULL,
	Name varchar(64) NOT NULL, -- TODO: should this be nvarchar?
	Url varchar(255) NULL, -- TODO: why is this nullable?
	CONSTRAINT PK_Sites PRIMARY KEY CLUSTERED (Id)
)

-- -------------------------------------------------------------------------
-- ResourceTypes
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ResourceTypes')
CREATE TABLE ResourceTypes (
	Id varchar(8) NOT NULL,
	Name nvarchar(64) NOT NULL,
	CONSTRAINT PK_ResourceTypes PRIMARY KEY CLUSTERED (Id)
)

-- -------------------------------------------------------------------------
-- Resources
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Resources')
CREATE TABLE Resources (
	Id int IDENTITY(1,1) NOT NULL,
	ResourceTypeId varchar(8) NOT NULL,
	VersionId int NOT NULL,
	RevisionId int NULL,
	Url varchar(255) NULL, -- TODO: why is this nullable?
	IsOfficial bit NOT NULL CONSTRAINT DF_Resources_IsOfficial DEFAULT (0), -- TO DO: add this?
	SiteId int NULL,
	CONSTRAINT PK_Resources PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Resources_ResourceTypes FOREIGN KEY (ResourceTypeId) REFERENCES ResourceTypes (Id),
	CONSTRAINT FK_Resources_Revisions FOREIGN KEY (RevisionId) REFERENCES Revisions (Id),
	CONSTRAINT FK_Resources_Versions FOREIGN KEY (VersionId) REFERENCES Versions (Id),
	CONSTRAINT FK_Resources_Sites FOREIGN KEY (SiteId) REFERENCES Sites (Id),
)

-- -------------------------------------------------------------------------
-- PassageTypes
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PassageTypes')
CREATE TABLE PassageTypes (
	Id int NOT NULL,
	Name nvarchar(32) NOT NULL,
	CONSTRAINT PK_PassageTypes PRIMARY KEY CLUSTERED (Id)
)

-- -------------------------------------------------------------------------
-- Passages
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Passages')
CREATE TABLE Passages (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(64) NOT NULL,
	VerseId int NOT NULL,
	EndVerseId int NOT NULL,
	PassageTypeId int NULL,
	CONSTRAINT PK_Passages PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Passages_Verses FOREIGN KEY (VerseId) REFERENCES Verses (Id),
	CONSTRAINT FK_Passages_Verses_EndVerse FOREIGN KEY (EndVerseId) REFERENCES Verses (Id),
	CONSTRAINT FK_Passages_PassageTypes FOREIGN KEY (PassageTypeId) REFERENCES PassageTypes (Id)
)

-- -------------------------------------------------------------------------
-- Bibles
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Bibles')
CREATE TABLE Bibles (
	Id int IDENTITY(1,1) NOT NULL,
	Code varchar(16) NOT NULL,
	Name nvarchar(64) NOT NULL,
	Subtitle nvarchar(128) NULL,
	VersionId int NOT NULL,
	RevisionId int NULL,
	YearPublished smallint NULL,
	TextFormat varchar(6) NOT NULL CONSTRAINT DF_Bibles_TextFormat DEFAULT ('txt'),
	SourceId int NULL,
	CONSTRAINT PK_Bibles PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Bibles_Versions FOREIGN KEY (VersionId) REFERENCES Versions (Id),
	CONSTRAINT FK_Bibles_Revisions FOREIGN KEY (RevisionId) REFERENCES Revisions (Id),
	CONSTRAINT FK_Bibles_Resources FOREIGN KEY (SourceId) REFERENCES Resources (Id)
)

-- -------------------------------------------------------------------------
-- BibleVerses
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BibleVerses')
CREATE TABLE BibleVerses (
	Id int IDENTITY(1,1) NOT NULL,
	BibleId int NOT NULL,
	VerseId int NOT NULL,
	Markup nvarchar(max) NOT NULL,
	PreMarkup nvarchar(255) NULL,
	PostMarkup nvarchar(255) NULL,
	Notes nvarchar(255) NULL,
	CONSTRAINT PK_BibleVerses PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_BibleVerses_Bibles FOREIGN KEY (BibleId) REFERENCES Bibles (Id),
	CONSTRAINT FK_BibleVerses_Verses FOREIGN KEY (VerseId) REFERENCES Verses (Id)
)

IF NOT EXISTS (SELECT name FROM sys.indexes WHERE name = 'UQ_BibleVerses_Version_Verse')
CREATE UNIQUE NONCLUSTERED INDEX UQ_BibleVerses_Version_Verse ON BibleVerses
(
	BibleId,
	VerseId
)

-- -------------------------------------------------------------------------
-- VersionNotes
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'VersionNotes')
CREATE TABLE VersionNotes (
	Id int IDENTITY(1,1) NOT NULL,
	VersionId int NOT NULL,
	RevisionId int NULL,
	BibleId int NULL,
	CanonId int NULL,
	BookId int NULL,
	ChapterId int NULL,
	VerseId int NULL,
	Note nvarchar(max) NOT NULL,
	Label nvarchar(64) NULL,
	Ranking int NOT NULL CONSTRAINT DF_VersionNotes_Ranking DEFAULT 0,
	CONSTRAINT PK_VersionNotes PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_VersionNotes_Versions FOREIGN KEY (VersionId) REFERENCES Versions (Id),
	CONSTRAINT FK_VersionNotes_Canons FOREIGN KEY (CanonId) REFERENCES Canons (Id),
	CONSTRAINT FK_VersionNotes_Books FOREIGN KEY (BookId) REFERENCES Books (Id),
	CONSTRAINT FK_VersionNotes_Chapters FOREIGN KEY (ChapterId) REFERENCES Chapters (Id),
	CONSTRAINT FK_VersionNotes_Verses FOREIGN KEY (VerseId) REFERENCES Verses (Id),
	CONSTRAINT FK_VersionNotes_Bibles FOREIGN KEY (BibleId) REFERENCES Bibles (Id),
	CONSTRAINT FK_VersionNotes_Revisions FOREIGN KEY (RevisionId) REFERENCES Revisions (Id)
)

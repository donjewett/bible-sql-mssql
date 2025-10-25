/* *************************************************************************
Bible Database: SQL Server, by Don Jewett
https://github.com/donjewett/bible-sql-mssql

bible-200-xrefs.sql
Version: 2025.10.24

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
-- CrossReferences Table
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CrossReferences')
CREATE TABLE [CrossReferences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VerseId] [int] NOT NULL,
	[RefId] [int] NOT NULL,
	[Weight] [int] NULL,
 CONSTRAINT [PK_CrossReferences] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'CrossReferences' AND CONSTRAINT_NAME = 'FK_CrossReferences_Verse')
BEGIN
	ALTER TABLE [CrossReferences] WITH CHECK ADD CONSTRAINT [FK_CrossReferences_Verse] FOREIGN KEY([VerseId]) REFERENCES [Verses] ([Id])
	ALTER TABLE [CrossReferences] CHECK CONSTRAINT [FK_CrossReferences_Verse]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'CrossReferences' AND CONSTRAINT_NAME = 'FK_CrossReferences_Reference')
BEGIN
	ALTER TABLE [CrossReferences] WITH CHECK ADD CONSTRAINT [FK_CrossReferences_Reference] FOREIGN KEY([RefId]) REFERENCES [Verses] ([Id])
	ALTER TABLE [CrossReferences] CHECK CONSTRAINT [FK_CrossReferences_Reference]
END

IF NOT EXISTS (SELECT name FROM sys.indexes WHERE name = 'UQ_CrossReferences_Verses')
CREATE UNIQUE NONCLUSTERED INDEX [UQ_CrossReferences_Verses] ON [CrossReferences]
(
	[VerseId] ASC,
	[RefId] ASC
);


----------------------------------------------------------------------------
-- CrossReferences
----------------------------------------------------------------------------
EXEC add_MetaDescription N'CrossReferences', N'Id', N'Auto-incrementing Id'
EXEC add_MetaDescription N'CrossReferences', N'VerseId', N'Verse of the cross reference'
EXEC add_MetaDescription N'CrossReferences', N'RefId', N'Cross Reference of the cross reference'
EXEC add_MetaDescription N'CrossReferences', N'Weight', N'Weight of the cross reference -- to use for prioritization'


----------------------------------------------------------------------------
-- add_XRef
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_XRef')
	DROP PROCEDURE add_XRef
GO

CREATE PROCEDURE add_XRef
	@v1 int,
	@v2 int,
	@w int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM [CrossReferences] WHERE [VerseId] = @v1 AND [RefId] = @v2)
		INSERT INTO [CrossReferences]([VerseId], [RefId], [Weight]) VALUES (@v1, @v2, @w)

	IF NOT EXISTS (SELECT * FROM [CrossReferences] WHERE [VerseId] = @v2 AND [RefId] = @v1)
		INSERT INTO [CrossReferences]([VerseId], [RefId], [Weight]) VALUES (@v2, @v1, @w)

END;

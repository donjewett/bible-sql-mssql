/* *************************************************************************
Bible Database: SQL Server, by Don Jewett
https://github.com/donjewett/bible-sql-mssql

bible-020-lookups.sql
Version: 2025.10.31

************************************************************************* */

SET NOCOUNT ON;

-- -------------------------------------------------------------------------
-- Languages
-- -------------------------------------------------------------------------
IF NOT EXISTS(SELECT * FROM Languages WHERE Id = 'arc') INSERT INTO Languages VALUES('arc', 'Ancient Aramaic', 'he', 1);
IF NOT EXISTS(SELECT * FROM Languages WHERE Id = 'eng') INSERT INTO Languages VALUES('eng', 'English', 'en', 0);
IF NOT EXISTS(SELECT * FROM Languages WHERE Id = 'esp') INSERT INTO Languages VALUES('esp', 'Spanish', 'es', 0);
IF NOT EXISTS(SELECT * FROM Languages WHERE Id = 'grc') INSERT INTO Languages VALUES('grc', 'Ancient Greek', 'el', 1);
IF NOT EXISTS(SELECT * FROM Languages WHERE Id = 'hbo') INSERT INTO Languages VALUES('hbo', 'Ancient Hebrew', 'he', 1);

-- -------------------------------------------------------------------------
-- HebrewTextForms
-- -------------------------------------------------------------------------
IF NOT EXISTS(SELECT * FROM HebrewTextForms WHERE Id = 'DSS') INSERT INTO HebrewTextForms VALUES('DSS', 'Dead Sea Scrolls', NULL);
IF NOT EXISTS(SELECT * FROM HebrewTextForms WHERE Id = 'MAS') INSERT INTO HebrewTextForms VALUES('MAS', 'Masoretic', NULL);
IF NOT EXISTS(SELECT * FROM HebrewTextForms WHERE Id = 'LXX') INSERT INTO HebrewTextForms VALUES('LXX', 'Septuagint', NULL);
IF NOT EXISTS(SELECT * FROM HebrewTextForms WHERE Id = 'TRH') INSERT INTO HebrewTextForms VALUES('TRH', 'Textus Receptus', 'MAS');

-- -------------------------------------------------------------------------
-- GreekTextForms
-- -------------------------------------------------------------------------
IF NOT EXISTS(SELECT * FROM GreekTextForms WHERE Id = 'AX') INSERT INTO GreekTextForms VALUES('AX', 'Alexandrian', NULL);
IF NOT EXISTS(SELECT * FROM GreekTextForms WHERE Id = 'BYZ') INSERT INTO GreekTextForms VALUES('BYZ', 'Byzantine', NULL);
IF NOT EXISTS(SELECT * FROM GreekTextForms WHERE Id = 'WST') INSERT INTO GreekTextForms VALUES('WST', 'Western', NULL);
IF NOT EXISTS(SELECT * FROM GreekTextForms WHERE Id = 'F35') INSERT INTO GreekTextForms VALUES('F35', 'Family 35', 'BYZ');
IF NOT EXISTS(SELECT * FROM GreekTextForms WHERE Id = 'TRG') INSERT INTO GreekTextForms VALUES('TRG', 'Textus Receptus', 'BYZ');

-- -------------------------------------------------------------------------
-- LicensePermissions
-- -------------------------------------------------------------------------
SET IDENTITY_INSERT LicensePermissions ON;
IF NOT EXISTS(SELECT * FROM LicensePermissions WHERE Id = 1) INSERT INTO LicensePermissions (Id, Name, Permissiveness) VALUES(1, 'Unrestricted', 100);
IF NOT EXISTS(SELECT * FROM LicensePermissions WHERE Id = 2) INSERT INTO LicensePermissions (Id, Name, Permissiveness) VALUES(2, 'Attribution', 90);
IF NOT EXISTS(SELECT * FROM LicensePermissions WHERE Id = 3) INSERT INTO LicensePermissions (Id, Name, Permissiveness) VALUES(3, 'Attribution-ShareAlike', 80);
IF NOT EXISTS(SELECT * FROM LicensePermissions WHERE Id = 4) INSERT INTO LicensePermissions (Id, Name, Permissiveness) VALUES(4, 'Attribution-NoDerivs', 70);
IF NOT EXISTS(SELECT * FROM LicensePermissions WHERE Id = 5) INSERT INTO LicensePermissions (Id, Name, Permissiveness) VALUES(5, 'Attribution-NonCommercial', 60);
IF NOT EXISTS(SELECT * FROM LicensePermissions WHERE Id = 6) INSERT INTO LicensePermissions (Id, Name, Permissiveness) VALUES(6, 'Attribution-NonCommercial-ShareAlike', 50);
IF NOT EXISTS(SELECT * FROM LicensePermissions WHERE Id = 7) INSERT INTO LicensePermissions (Id, Name, Permissiveness) VALUES(7, 'Attribution-NonCommercial-NoDerivs', 40);
IF NOT EXISTS(SELECT * FROM LicensePermissions WHERE Id = 8) INSERT INTO LicensePermissions (Id, Name, Permissiveness) VALUES(8, 'Quote 1000+', 30);
IF NOT EXISTS(SELECT * FROM LicensePermissions WHERE Id = 9) INSERT INTO LicensePermissions (Id, Name, Permissiveness) VALUES(9, 'Quote 500+', 20);
IF NOT EXISTS(SELECT * FROM LicensePermissions WHERE Id = 10) INSERT INTO LicensePermissions (Id, Name, Permissiveness) VALUES(10, 'Quote 250+', 10);
IF NOT EXISTS(SELECT * FROM LicensePermissions WHERE Id = 11) INSERT INTO LicensePermissions (Id, Name, Permissiveness) VALUES(11, 'Restricted', 0);
SET IDENTITY_INSERT LicensePermissions OFF;

-- -------------------------------------------------------------------------
-- LicenseTypes
-- -------------------------------------------------------------------------
SET IDENTITY_INSERT LicenseTypes ON;
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 1) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(1, 'Public Domain', 1, 1);
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 2) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(2, 'Patent Letters', 1, 1);
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 3) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(3, 'Creative Commons Attribution Share-Alike', 1, 3);
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 4) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(4, 'Creative Commons Attribution-Noncommercial-No Derivatives', 1, 7);
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 5) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(5, 'Creative Commons Attribution-NoDerivs', 1, 4);
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 6) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(6, 'Free Noncommercial Distribution', 1, 7);
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 7) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(7, 'Commercial', 0, NULL);
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 8) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(8, 'Commercial Quote 1000+', 0, 8);
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 9) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(9, 'Commercial Quote 500+', 0, 9);
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 10) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(10, 'Commercial Quote 250+', 0, 10);
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 11) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(11, 'Commercial Restricted', 0, 11);
IF NOT EXISTS(SELECT * FROM LicenseTypes WHERE Id = 12) INSERT INTO LicenseTypes (Id, Name, IsFree, PermissionId) VALUES(12, 'Creative Commons Attribution', 1, 2);
SET IDENTITY_INSERT LicenseTypes OFF;

-- -------------------------------------------------------------------------
-- PassageTypes
-- -------------------------------------------------------------------------
IF NOT EXISTS(SELECT * FROM PassageTypes WHERE Id = 1) INSERT INTO PassageTypes VALUES (1, 'Pericope');

-- -------------------------------------------------------------------------
-- ResourceTypes
-- -------------------------------------------------------------------------
IF NOT EXISTS(SELECT * FROM ResourceTypes WHERE Id = 'api') INSERT INTO ResourceTypes VALUES('api', 'Bible Api');
IF NOT EXISTS(SELECT * FROM ResourceTypes WHERE Id = 'revision') INSERT INTO ResourceTypes VALUES('revision', 'Bible Revision');
IF NOT EXISTS(SELECT * FROM ResourceTypes WHERE Id = 'file') INSERT INTO ResourceTypes VALUES('file', 'Bible File');
IF NOT EXISTS(SELECT * FROM ResourceTypes WHERE Id = 'license') INSERT INTO ResourceTypes VALUES('license', 'Bible License');
IF NOT EXISTS(SELECT * FROM ResourceTypes WHERE Id = 'read') INSERT INTO ResourceTypes VALUES('read', 'Bible Browser');
IF NOT EXISTS(SELECT * FROM ResourceTypes WHERE Id = 'version') INSERT INTO ResourceTypes VALUES('version', 'Bible Version');

-- -------------------------------------------------------------------------
-- Canons
-- -------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM Canons WHERE Id = 100000000) INSERT INTO Canons VALUES(100000000, 'OT', 'Old Testament', 'hbo');
IF NOT EXISTS (SELECT * FROM Canons WHERE Id = 300000000) INSERT INTO Canons VALUES(300000000, 'NT', 'New Testament', 'grc');

-- -------------------------------------------------------------------------
-- Sections
-- -------------------------------------------------------------------------
IF NOT EXISTS(SELECT * FROM Sections WHERE Id = 101000000) INSERT INTO Sections VALUES(101000000, 'Law', 100000000) ;
IF NOT EXISTS(SELECT * FROM Sections WHERE Id = 106000000) INSERT INTO Sections VALUES(106000000, 'History', 100000000) ;
IF NOT EXISTS(SELECT * FROM Sections WHERE Id = 118000000) INSERT INTO Sections VALUES(118000000, 'Wisdom', 100000000) ;
IF NOT EXISTS(SELECT * FROM Sections WHERE Id = 123000000) INSERT INTO Sections VALUES(123000000, 'Major Prophets', 100000000) ;
IF NOT EXISTS(SELECT * FROM Sections WHERE Id = 128000000) INSERT INTO Sections VALUES(128000000, 'Minor Prophets', 100000000) ;
IF NOT EXISTS(SELECT * FROM Sections WHERE Id = 340000000) INSERT INTO Sections VALUES(340000000, 'Gospels', 300000000) ;
IF NOT EXISTS(SELECT * FROM Sections WHERE Id = 344000000) INSERT INTO Sections VALUES(344000000, 'Acts', 300000000) ;
IF NOT EXISTS(SELECT * FROM Sections WHERE Id = 345000000) INSERT INTO Sections VALUES(345000000, 'Pauline Epistles', 300000000) ;
IF NOT EXISTS(SELECT * FROM Sections WHERE Id = 358000000) INSERT INTO Sections VALUES(358000000, 'General Epistles', 300000000) ;
IF NOT EXISTS(SELECT * FROM Sections WHERE Id = 366000000) INSERT INTO Sections VALUES(366000000, 'Revelation', 300000000) ;

-- -------------------------------------------------------------------------
-- Books
-- -------------------------------------------------------------------------
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 101000000) INSERT INTO Books VALUES(101000000, 'gen', 'Gen', 'Genesis', 1, 100000000, 101000000, 0, 50, 'Gen', 'GEN');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 102000000) INSERT INTO Books VALUES(102000000, 'exo', 'Exo', 'Exodus', 2, 100000000, 101000000, 0, 40, 'Exod', 'EXO');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 103000000) INSERT INTO Books VALUES(103000000, 'lev', 'Lev', 'Leviticus', 3, 100000000, 101000000, 0, 27, 'Lev', 'LEV');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 104000000) INSERT INTO Books VALUES(104000000, 'num', 'Num', 'Numbers', 4, 100000000, 101000000, 0, 36, 'Num', 'NUM');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 105000000) INSERT INTO Books VALUES(105000000, 'deut', 'Deut', 'Deuteronomy', 5, 100000000, 101000000, 1, 34, 'Deut', 'DEU');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 106000000) INSERT INTO Books VALUES(106000000, 'josh', 'Josh', 'Joshua', 6, 100000000, 106000000, 0, 24, 'Josh', 'JOS');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 107000000) INSERT INTO Books VALUES(107000000, 'judg', 'Judg', 'Judges', 7, 100000000, 106000000, 0, 21, 'Judg', 'JDG');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 108000000) INSERT INTO Books VALUES(108000000, 'ruth', 'Ruth', 'Ruth', 8, 100000000, 106000000, 0, 4, 'Ruth', 'RUT');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 109000000) INSERT INTO Books VALUES(109000000, '1sa', '1Sa', '1 Samuel', 9, 100000000, 106000000, 0, 31, '1Sam', '1SA');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 110000000) INSERT INTO Books VALUES(110000000, '2sa', '2Sa', '2 Samuel', 10, 100000000, 106000000, 0, 24, '2Sam', '2SA');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 111000000) INSERT INTO Books VALUES(111000000, '1ki', '1Ki', '1 Kings', 11, 100000000, 106000000, 0, 22, '1Kgs', '1KI');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 112000000) INSERT INTO Books VALUES(112000000, '2ki', '2Ki', '2 Kings', 12, 100000000, 106000000, 0, 25, '2Kgs', '2KI');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 113000000) INSERT INTO Books VALUES(113000000, '1ch', '1Ch', '1 Chronicles', 13, 100000000, 106000000, 0, 29, '1Chr', '1CH');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 114000000) INSERT INTO Books VALUES(114000000, '2ch', '2Ch', '2 Chronicles', 14, 100000000, 106000000, 0, 36, '2Chr', '2CH');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 115000000) INSERT INTO Books VALUES(115000000, 'ezra', 'Ezra', 'Ezra', 15, 100000000, 106000000, 0, 10, 'Ezra', 'EZR');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 116000000) INSERT INTO Books VALUES(116000000, 'neh', 'Neh', 'Nehemiah', 16, 100000000, 106000000, 0, 13, 'Neh', 'NEH');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 117000000) INSERT INTO Books VALUES(117000000, 'est', 'Est', 'Esther', 17, 100000000, 106000000, 1, 10, 'Esth', 'EST');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 118000000) INSERT INTO Books VALUES(118000000, 'job', 'Job', 'Job', 18, 100000000, 118000000, 0, 42, 'Job', 'JOB');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 119000000) INSERT INTO Books VALUES(119000000, 'ps', 'Ps', 'Psalms', 19, 100000000, 118000000, 0, 150, 'Ps', 'PSA');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 120000000) INSERT INTO Books VALUES(120000000, 'pro', 'Pro', 'Proverbs', 20, 100000000, 118000000, 0, 31, 'Prov', 'PRO');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 121000000) INSERT INTO Books VALUES(121000000, 'ecc', 'Ecc', 'Ecclesiastes', 21, 100000000, 118000000, 0, 12, 'Eccl', 'ECC');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 122000000) INSERT INTO Books VALUES(122000000, 'song', 'Song', 'Song of Songs', 22, 100000000, 118000000, 1, 8, 'Song', 'SNG');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 123000000) INSERT INTO Books VALUES(123000000, 'isa', 'Isa', 'Isaiah', 23, 100000000, 123000000, 0, 66, 'Isa', 'ISA');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 124000000) INSERT INTO Books VALUES(124000000, 'jer', 'Jer', 'Jeremiah', 24, 100000000, 123000000, 0, 52, 'Jer', 'JER');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 125000000) INSERT INTO Books VALUES(125000000, 'lam', 'Lam', 'Lamentations', 25, 100000000, 123000000, 0, 5, 'Lam', 'LAM');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 126000000) INSERT INTO Books VALUES(126000000, 'ezek', 'Ezek', 'Ezekiel', 26, 100000000, 123000000, 0, 48, 'Ezek', 'EZK');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 127000000) INSERT INTO Books VALUES(127000000, 'dan', 'Dan', 'Daniel', 27, 100000000, 123000000, 1, 12, 'Dan', 'DAN');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 128000000) INSERT INTO Books VALUES(128000000, 'hos', 'Hos', 'Hosea', 28, 100000000, 128000000, 0, 14, 'Hos', 'HOS');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 129000000) INSERT INTO Books VALUES(129000000, 'joel', 'Joel', 'Joel', 29, 100000000, 128000000, 0, 3, 'Joel', 'JOL');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 130000000) INSERT INTO Books VALUES(130000000, 'amos', 'Amos', 'Amos', 30, 100000000, 128000000, 0, 9, 'Amos', 'AMO');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 131000000) INSERT INTO Books VALUES(131000000, 'oba', 'Oba', 'Obadiah', 31, 100000000, 128000000, 0, 1, 'Obad', 'OBA');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 132000000) INSERT INTO Books VALUES(132000000, 'jonah', 'Jonah', 'Jonah', 32, 100000000, 128000000, 0, 4, 'Jonah', 'JON');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 133000000) INSERT INTO Books VALUES(133000000, 'mic', 'Mic', 'Micah', 33, 100000000, 128000000, 0, 7, 'Mic', 'MIC');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 134000000) INSERT INTO Books VALUES(134000000, 'nah', 'Nah', 'Nahum', 34, 100000000, 128000000, 0, 3, 'Nah', 'NAM');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 135000000) INSERT INTO Books VALUES(135000000, 'hab', 'Hab', 'Habakkuk', 35, 100000000, 128000000, 0, 3, 'Hab', 'HAB');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 136000000) INSERT INTO Books VALUES(136000000, 'zeph', 'Zeph', 'Zephaniah', 36, 100000000, 128000000, 0, 3, 'Zeph', 'ZEP');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 137000000) INSERT INTO Books VALUES(137000000, 'hag', 'Hag', 'Haggai', 37, 100000000, 128000000, 0, 2, 'Hag', 'HAG');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 138000000) INSERT INTO Books VALUES(138000000, 'zec', 'Zec', 'Zechariah', 38, 100000000, 128000000, 0, 14, 'Zech', 'ZEC');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 139000000) INSERT INTO Books VALUES(139000000, 'mal', 'Mal', 'Malachi', 39, 100000000, 128000000, 1, 4, 'Mal', 'MAL');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 340000000) INSERT INTO Books VALUES(340000000, 'matt', 'Matt', 'Matthew', 40, 300000000, 340000000, 0, 28, 'Matt', 'MAT');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 341000000) INSERT INTO Books VALUES(341000000, 'mark', 'Mark', 'Mark', 41, 300000000, 340000000, 0, 16, 'Mark', 'MRK');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 342000000) INSERT INTO Books VALUES(342000000, 'luke', 'Luke', 'Luke', 42, 300000000, 340000000, 0, 24, 'Luke', 'LUK');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 343000000) INSERT INTO Books VALUES(343000000, 'john', 'John', 'John', 43, 300000000, 340000000, 1, 21, 'John', 'JHN');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 344000000) INSERT INTO Books VALUES(344000000, 'acts', 'Acts', 'Acts', 44, 300000000, 344000000, 1, 28, 'Acts', 'ACT');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 345000000) INSERT INTO Books VALUES(345000000, 'rom', 'Rom', 'Romans', 45, 300000000, 345000000, 0, 16, 'Rom', 'ROM');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 346000000) INSERT INTO Books VALUES(346000000, '1co', '1Co', '1 Corinthians', 46, 300000000, 345000000, 0, 16, '1Cor', '1CO');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 347000000) INSERT INTO Books VALUES(347000000, '2co', '2Co', '2 Corinthians', 47, 300000000, 345000000, 0, 13, '2Cor', '2CO');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 348000000) INSERT INTO Books VALUES(348000000, 'gal', 'Gal', 'Galatians', 48, 300000000, 345000000, 0, 6, 'Gal', 'GAL');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 349000000) INSERT INTO Books VALUES(349000000, 'eph', 'Eph', 'Ephesians', 49, 300000000, 345000000, 0, 6, 'Eph', 'EPH');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 350000000) INSERT INTO Books VALUES(350000000, 'php', 'Php', 'Philippians', 50, 300000000, 345000000, 0, 4, 'Phil', 'PHP');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 351000000) INSERT INTO Books VALUES(351000000, 'col', 'Col', 'Colossians', 51, 300000000, 345000000, 0, 4, 'Col', 'COL');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 352000000) INSERT INTO Books VALUES(352000000, '1th', '1Th', '1 Thessalonians', 52, 300000000, 345000000, 0, 5, '1Thess', '1TH');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 353000000) INSERT INTO Books VALUES(353000000, '2th', '2Th', '2 Thessalonians', 53, 300000000, 345000000, 1, 3, '2Thess', '2TH');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 354000000) INSERT INTO Books VALUES(354000000, '1tim', '1Tim', '1 Timothy', 54, 300000000, 345000000, 0, 6, '1Tim', '1TI');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 355000000) INSERT INTO Books VALUES(355000000, '2tim', '2Tim', '2 Timothy', 55, 300000000, 345000000, 0, 4, '2Tim', '2Ti');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 356000000) INSERT INTO Books VALUES(356000000, 'Titus', 'Titus', 'Titus', 56, 300000000, 345000000, 0, 3, 'Titus', 'TIT');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 357000000) INSERT INTO Books VALUES(357000000, 'phlm', 'Phlm', 'Philemon', 57, 300000000, 345000000, 1, 1, 'Phlm', 'PHM');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 358000000) INSERT INTO Books VALUES(358000000, 'heb', 'Heb', 'Hebrews', 58, 300000000, 358000000, 1, 13, 'Heb', 'HEB');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 359000000) INSERT INTO Books VALUES(359000000, 'james', 'James', 'James', 59, 300000000, 358000000, 0, 5, 'Jas', 'JAS');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 360000000) INSERT INTO Books VALUES(360000000, '1pe', '1Pe', '1 Peter', 60, 300000000, 358000000, 0, 5, '1Pet', '1PE');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 361000000) INSERT INTO Books VALUES(361000000, '2pe', '2Pe', '2 Peter', 61, 300000000, 358000000, 0, 3, '2Pet', '2PE');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 362000000) INSERT INTO Books VALUES(362000000, '1john', '1John', '1 John', 62, 300000000, 358000000, 0, 5, '1John', '1JN');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 363000000) INSERT INTO Books VALUES(363000000, '2john', '2John', '2 John', 63, 300000000, 358000000, 0, 1, '2John', '2JN');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 364000000) INSERT INTO Books VALUES(364000000, '3john', '3John', '3 John', 64, 300000000, 358000000, 0, 1, '3John', '3JN');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 365000000) INSERT INTO Books VALUES(365000000, 'jude', 'Jude', 'Jude', 65, 300000000, 358000000, 1, 1, 'Jude', 'JUD');
IF NOT EXISTS(SELECT * FROM Books WHERE Id = 366000000) INSERT INTO Books VALUES(366000000, 'rev', 'Rev', 'Revelation', 66, 300000000, 366000000, 0, 22, 'Rev', 'REV');

-- -------------------------------------------------------------------------
-- BookNames
-- -------------------------------------------------------------------------
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1 chronicles') INSERT INTO BookNames VALUES ('1 chronicles',113000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1 corinthians') INSERT INTO BookNames VALUES ('1 corinthians',346000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1 john') INSERT INTO BookNames VALUES ('1 john',362000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1 kings') INSERT INTO BookNames VALUES ('1 kings',111000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1 peter') INSERT INTO BookNames VALUES ('1 peter',360000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1 samuel') INSERT INTO BookNames VALUES ('1 samuel',109000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1 thessalonians') INSERT INTO BookNames VALUES ('1 thessalonians',352000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1 timothy') INSERT INTO BookNames VALUES ('1 timothy',354000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1ch') INSERT INTO BookNames VALUES ('1ch',113000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1chr') INSERT INTO BookNames VALUES ('1chr',113000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1co') INSERT INTO BookNames VALUES ('1co',346000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1cor') INSERT INTO BookNames VALUES ('1cor',346000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1j') INSERT INTO BookNames VALUES ('1j',362000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1jn') INSERT INTO BookNames VALUES ('1jn',362000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1jo') INSERT INTO BookNames VALUES ('1jo',362000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1john') INSERT INTO BookNames VALUES ('1john',362000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1kgs') INSERT INTO BookNames VALUES ('1kgs',111000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1ki') INSERT INTO BookNames VALUES ('1ki',111000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1p') INSERT INTO BookNames VALUES ('1p',360000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1pe') INSERT INTO BookNames VALUES ('1pe',360000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1pet') INSERT INTO BookNames VALUES ('1pet',360000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1sa') INSERT INTO BookNames VALUES ('1sa',109000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1sam') INSERT INTO BookNames VALUES ('1sam',109000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1sm') INSERT INTO BookNames VALUES ('1sm',109000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1th') INSERT INTO BookNames VALUES ('1th',352000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1thess') INSERT INTO BookNames VALUES ('1thess',352000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1ti') INSERT INTO BookNames VALUES ('1ti',354000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '1tim') INSERT INTO BookNames VALUES ('1tim',354000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2 chronicles') INSERT INTO BookNames VALUES ('2 chronicles',114000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2 corinthians') INSERT INTO BookNames VALUES ('2 corinthians',347000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2 john') INSERT INTO BookNames VALUES ('2 john',363000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2 kings') INSERT INTO BookNames VALUES ('2 kings',112000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2 peter') INSERT INTO BookNames VALUES ('2 peter',361000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2 samuel') INSERT INTO BookNames VALUES ('2 samuel',110000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2 thessalonians') INSERT INTO BookNames VALUES ('2 thessalonians',353000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2 timothy') INSERT INTO BookNames VALUES ('2 timothy',355000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2ch') INSERT INTO BookNames VALUES ('2ch',114000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2chr') INSERT INTO BookNames VALUES ('2chr',114000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2co') INSERT INTO BookNames VALUES ('2co',347000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2cor') INSERT INTO BookNames VALUES ('2cor',347000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2j') INSERT INTO BookNames VALUES ('2j',363000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2jn') INSERT INTO BookNames VALUES ('2jn',363000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2jo') INSERT INTO BookNames VALUES ('2jo',363000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2john') INSERT INTO BookNames VALUES ('2john',363000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2kgs') INSERT INTO BookNames VALUES ('2kgs',112000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2ki') INSERT INTO BookNames VALUES ('2ki',112000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2p') INSERT INTO BookNames VALUES ('2p',361000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2pe') INSERT INTO BookNames VALUES ('2pe',361000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2pet') INSERT INTO BookNames VALUES ('2pet',361000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2sa') INSERT INTO BookNames VALUES ('2sa',110000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2sam') INSERT INTO BookNames VALUES ('2sam',110000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2sm') INSERT INTO BookNames VALUES ('2sm',110000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2th') INSERT INTO BookNames VALUES ('2th',353000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2thess') INSERT INTO BookNames VALUES ('2thess',353000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2ti') INSERT INTO BookNames VALUES ('2ti',355000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '2tim') INSERT INTO BookNames VALUES ('2tim',355000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '3 john') INSERT INTO BookNames VALUES ('3 john',364000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '3j') INSERT INTO BookNames VALUES ('3j',364000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '3jn') INSERT INTO BookNames VALUES ('3jn',364000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '3jo') INSERT INTO BookNames VALUES ('3jo',364000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = '3john') INSERT INTO BookNames VALUES ('3john',364000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ac') INSERT INTO BookNames VALUES ('ac',344000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'act') INSERT INTO BookNames VALUES ('act',344000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'acts') INSERT INTO BookNames VALUES ('acts',344000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'am') INSERT INTO BookNames VALUES ('am',130000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'amo') INSERT INTO BookNames VALUES ('amo',130000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'amos') INSERT INTO BookNames VALUES ('amos',130000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'apocalypse') INSERT INTO BookNames VALUES ('apocalypse',366000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ca') INSERT INTO BookNames VALUES ('ca',122000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'canticles') INSERT INTO BookNames VALUES ('canticles',122000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'col') INSERT INTO BookNames VALUES ('col',351000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'colossians') INSERT INTO BookNames VALUES ('colossians',351000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'da') INSERT INTO BookNames VALUES ('da',127000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'dan') INSERT INTO BookNames VALUES ('dan',127000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'daniel') INSERT INTO BookNames VALUES ('daniel',127000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'de') INSERT INTO BookNames VALUES ('de',105000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'deu') INSERT INTO BookNames VALUES ('deu',105000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'deut') INSERT INTO BookNames VALUES ('deut',105000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'deuteronomy') INSERT INTO BookNames VALUES ('deuteronomy',105000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ec') INSERT INTO BookNames VALUES ('ec',121000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ecc') INSERT INTO BookNames VALUES ('ecc',121000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'eccl') INSERT INTO BookNames VALUES ('eccl',121000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ecclesiastes') INSERT INTO BookNames VALUES ('ecclesiastes',121000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'eph') INSERT INTO BookNames VALUES ('eph',349000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ephesians') INSERT INTO BookNames VALUES ('ephesians',349000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'es') INSERT INTO BookNames VALUES ('es',117000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'est') INSERT INTO BookNames VALUES ('est',117000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'esth') INSERT INTO BookNames VALUES ('esth',117000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'esther') INSERT INTO BookNames VALUES ('esther',117000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ex') INSERT INTO BookNames VALUES ('ex',102000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'exo') INSERT INTO BookNames VALUES ('exo',102000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'exod') INSERT INTO BookNames VALUES ('exod',102000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'exodus') INSERT INTO BookNames VALUES ('exodus',102000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ez') INSERT INTO BookNames VALUES ('ez',126000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'eze') INSERT INTO BookNames VALUES ('eze',126000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ezek') INSERT INTO BookNames VALUES ('ezek',126000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ezekiel') INSERT INTO BookNames VALUES ('ezekiel',126000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ezk') INSERT INTO BookNames VALUES ('ezk',126000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ezr') INSERT INTO BookNames VALUES ('ezr',115000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ezra') INSERT INTO BookNames VALUES ('ezra',115000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ga') INSERT INTO BookNames VALUES ('ga',348000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'gal') INSERT INTO BookNames VALUES ('gal',348000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'galatians') INSERT INTO BookNames VALUES ('galatians',348000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ge') INSERT INTO BookNames VALUES ('ge',101000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'gen') INSERT INTO BookNames VALUES ('gen',101000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'genesis') INSERT INTO BookNames VALUES ('genesis',101000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'hab') INSERT INTO BookNames VALUES ('hab',135000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'habakkuk') INSERT INTO BookNames VALUES ('habakkuk',135000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'hag') INSERT INTO BookNames VALUES ('hag',137000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'haggai') INSERT INTO BookNames VALUES ('haggai',137000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'heb') INSERT INTO BookNames VALUES ('heb',358000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'hebrews') INSERT INTO BookNames VALUES ('hebrews',358000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ho') INSERT INTO BookNames VALUES ('ho',128000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'hos') INSERT INTO BookNames VALUES ('hos',128000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'hosea') INSERT INTO BookNames VALUES ('hosea',128000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'i chronicles') INSERT INTO BookNames VALUES ('i chronicles',113000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'i corinthians') INSERT INTO BookNames VALUES ('i corinthians',346000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'i john') INSERT INTO BookNames VALUES ('i john',362000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'i kings') INSERT INTO BookNames VALUES ('i kings',111000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'i peter') INSERT INTO BookNames VALUES ('i peter',360000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'i samuel') INSERT INTO BookNames VALUES ('i samuel',109000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'i thessalonians') INSERT INTO BookNames VALUES ('i thessalonians',352000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'i timothy') INSERT INTO BookNames VALUES ('i timothy',354000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ii chronicles') INSERT INTO BookNames VALUES ('ii chronicles',114000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ii corinthians') INSERT INTO BookNames VALUES ('ii corinthians',347000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ii john') INSERT INTO BookNames VALUES ('ii john',363000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ii kings') INSERT INTO BookNames VALUES ('ii kings',112000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ii peter') INSERT INTO BookNames VALUES ('ii peter',361000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ii samuel') INSERT INTO BookNames VALUES ('ii samuel',110000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ii thessalonians') INSERT INTO BookNames VALUES ('ii thessalonians',353000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ii timothy') INSERT INTO BookNames VALUES ('ii timothy',355000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'iii john') INSERT INTO BookNames VALUES ('iii john',364000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'isa') INSERT INTO BookNames VALUES ('isa',123000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'isaiah') INSERT INTO BookNames VALUES ('isaiah',123000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jam') INSERT INTO BookNames VALUES ('jam',359000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'james') INSERT INTO BookNames VALUES ('james',359000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jas') INSERT INTO BookNames VALUES ('jas',359000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jdg') INSERT INTO BookNames VALUES ('jdg',107000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jdgs') INSERT INTO BookNames VALUES ('jdgs',107000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jer') INSERT INTO BookNames VALUES ('jer',124000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jeremiah') INSERT INTO BookNames VALUES ('jeremiah',124000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jg') INSERT INTO BookNames VALUES ('jg',107000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jhn') INSERT INTO BookNames VALUES ('jhn',343000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jms') INSERT INTO BookNames VALUES ('jms',359000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jnh') INSERT INTO BookNames VALUES ('jnh',132000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'job') INSERT INTO BookNames VALUES ('job',118000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'joe') INSERT INTO BookNames VALUES ('joe',129000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'joel') INSERT INTO BookNames VALUES ('joel',129000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'joh') INSERT INTO BookNames VALUES ('joh',343000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'john') INSERT INTO BookNames VALUES ('john',343000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jol') INSERT INTO BookNames VALUES ('jol',129000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jon') INSERT INTO BookNames VALUES ('jon',132000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jonah') INSERT INTO BookNames VALUES ('jonah',132000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jos') INSERT INTO BookNames VALUES ('jos',106000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'josh') INSERT INTO BookNames VALUES ('josh',106000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'joshua') INSERT INTO BookNames VALUES ('joshua',106000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jud') INSERT INTO BookNames VALUES ('jud',365000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'jude') INSERT INTO BookNames VALUES ('jude',365000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'judg') INSERT INTO BookNames VALUES ('judg',107000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'judges') INSERT INTO BookNames VALUES ('judges',107000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'la') INSERT INTO BookNames VALUES ('la',125000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'lam') INSERT INTO BookNames VALUES ('lam',125000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'lamentations') INSERT INTO BookNames VALUES ('lamentations',125000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'le') INSERT INTO BookNames VALUES ('le',103000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'lev') INSERT INTO BookNames VALUES ('lev',103000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'leviticus') INSERT INTO BookNames VALUES ('leviticus',103000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'lu') INSERT INTO BookNames VALUES ('lu',342000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'luk') INSERT INTO BookNames VALUES ('luk',342000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'luke') INSERT INTO BookNames VALUES ('luke',342000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'mal') INSERT INTO BookNames VALUES ('mal',139000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'malachi') INSERT INTO BookNames VALUES ('malachi',139000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'mark') INSERT INTO BookNames VALUES ('mark',341000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'mat') INSERT INTO BookNames VALUES ('mat',340000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'matt') INSERT INTO BookNames VALUES ('matt',340000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'matthew') INSERT INTO BookNames VALUES ('matthew',340000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'mic') INSERT INTO BookNames VALUES ('mic',133000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'micah') INSERT INTO BookNames VALUES ('micah',133000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'mr') INSERT INTO BookNames VALUES ('mr',341000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'mrk') INSERT INTO BookNames VALUES ('mrk',341000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'mt') INSERT INTO BookNames VALUES ('mt',340000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'na') INSERT INTO BookNames VALUES ('na',134000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'nah') INSERT INTO BookNames VALUES ('nah',134000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'nahum') INSERT INTO BookNames VALUES ('nahum',134000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'nam') INSERT INTO BookNames VALUES ('nam',134000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ne') INSERT INTO BookNames VALUES ('ne',116000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'neh') INSERT INTO BookNames VALUES ('neh',116000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'nehemiah') INSERT INTO BookNames VALUES ('nehemiah',116000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'nu') INSERT INTO BookNames VALUES ('nu',104000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'num') INSERT INTO BookNames VALUES ('num',104000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'numbers') INSERT INTO BookNames VALUES ('numbers',104000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ob') INSERT INTO BookNames VALUES ('ob',131000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'oba') INSERT INTO BookNames VALUES ('oba',131000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'obad') INSERT INTO BookNames VALUES ('obad',131000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'obadiah') INSERT INTO BookNames VALUES ('obadiah',131000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'phi') INSERT INTO BookNames VALUES ('phi',350000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'phil') INSERT INTO BookNames VALUES ('phil',350000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'philemon') INSERT INTO BookNames VALUES ('philemon',357000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'philippians') INSERT INTO BookNames VALUES ('philippians',350000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'phlm') INSERT INTO BookNames VALUES ('phlm',357000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'phm') INSERT INTO BookNames VALUES ('phm',357000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'phmn') INSERT INTO BookNames VALUES ('phmn',357000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'php') INSERT INTO BookNames VALUES ('php',350000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'pr') INSERT INTO BookNames VALUES ('pr',120000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'pro') INSERT INTO BookNames VALUES ('pro',120000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'prov') INSERT INTO BookNames VALUES ('prov',120000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'proverbs') INSERT INTO BookNames VALUES ('proverbs',120000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'prv') INSERT INTO BookNames VALUES ('prv',120000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ps') INSERT INTO BookNames VALUES ('ps',119000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'psa') INSERT INTO BookNames VALUES ('psa',119000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'psalm') INSERT INTO BookNames VALUES ('psalm',119000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'psalms') INSERT INTO BookNames VALUES ('psalms',119000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 're') INSERT INTO BookNames VALUES ('re',366000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'rev') INSERT INTO BookNames VALUES ('rev',366000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'revelation') INSERT INTO BookNames VALUES ('revelation',366000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ro') INSERT INTO BookNames VALUES ('ro',345000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'rom') INSERT INTO BookNames VALUES ('rom',345000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'romans') INSERT INTO BookNames VALUES ('romans',345000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ru') INSERT INTO BookNames VALUES ('ru',108000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'rut') INSERT INTO BookNames VALUES ('rut',108000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ruth') INSERT INTO BookNames VALUES ('ruth',108000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'sng') INSERT INTO BookNames VALUES ('sng',122000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'song') INSERT INTO BookNames VALUES ('song',122000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'song of solomon') INSERT INTO BookNames VALUES ('song of solomon',122000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'song of songs') INSERT INTO BookNames VALUES ('song of songs',122000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'songs') INSERT INTO BookNames VALUES ('songs',122000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'ti') INSERT INTO BookNames VALUES ('ti',356000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'tit') INSERT INTO BookNames VALUES ('tit',356000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'titus') INSERT INTO BookNames VALUES ('titus',356000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'zec') INSERT INTO BookNames VALUES ('zec',138000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'zech') INSERT INTO BookNames VALUES ('zech',138000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'zechariah') INSERT INTO BookNames VALUES ('zechariah',138000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'zep') INSERT INTO BookNames VALUES ('zep',136000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'zeph') INSERT INTO BookNames VALUES ('zeph',136000000);
IF NOT EXISTS(SELECT * FROM BookNames WHERE Name = 'zephaniah') INSERT INTO BookNames VALUES ('zephaniah',136000000);

-- -------------------------------------------------------------------------
-- Chapters
-- -------------------------------------------------------------------------
;WITH ChapterIndexes(Chapter) AS
(
    SELECT 1 AS Chapter
    UNION ALL 
    SELECT Chapter + 1 
	FROM ChapterIndexes 
	WHERE Chapter < 160
)
INSERT INTO Chapters (Id, Code, Reference, Chapter, BookId, IsBookEnd, VerseCount)
SELECT
	B.Id + (1000 * C.Chapter) AS Id
	, B.Code + '-' + CONVERT(varchar(3), C.Chapter) AS Code
	, B.Abbrev + ' ' + CONVERT(varchar(3), C.Chapter) AS Reference
	, C.Chapter
	, B.Id AS BookId
	, CASE WHEN C.Chapter = B.ChapterCount THEN 1 ELSE 0 END AS IsBookEnd
	, 0 AS VerseCount
 FROM Books B
	CROSS JOIN ChapterIndexes C
WHERE C.Chapter <= B.ChapterCount
	AND NOT EXISTS (SELECT * FROM Chapters C2 WHERE C2.Id = B.Id + (1000 * C.Chapter))
OPTION (MAXRECURSION 160);

UPDATE Chapters SET VerseCount = 2 WHERE VerseCount = 0 AND Id = 119117000;
UPDATE Chapters SET VerseCount = 4 WHERE VerseCount = 0 AND Id = 119123000;
UPDATE Chapters SET VerseCount = 60 WHERE VerseCount = 0 AND Id = 344007000;
UPDATE Chapters SET VerseCount = 62 WHERE VerseCount = 0 AND Id = 342009000;
UPDATE Chapters SET VerseCount = 64 WHERE VerseCount = 0 AND Id = 124051000;
UPDATE Chapters SET VerseCount = 65 WHERE VerseCount = 0 AND Id = 104026000;
UPDATE Chapters SET VerseCount = 67 WHERE VerseCount = 0 AND Id = 101024000;
UPDATE Chapters SET VerseCount = 68 WHERE VerseCount = 0 AND Id = 105028000;
UPDATE Chapters SET VerseCount = 70 WHERE VerseCount = 0 AND Id = 115002000;
UPDATE Chapters SET VerseCount = 73 WHERE VerseCount = 0 AND Id = 116007000;
UPDATE Chapters SET VerseCount = 75 WHERE VerseCount = 0 AND Id = 340026000;
UPDATE Chapters SET VerseCount = 80 WHERE VerseCount = 0 AND Id = 342001000;
UPDATE Chapters SET VerseCount = 81 WHERE VerseCount = 0 AND Id = 113006000;
UPDATE Chapters SET VerseCount = 89 WHERE VerseCount = 0 AND Id = 104007000;
UPDATE Chapters SET VerseCount = 176 WHERE VerseCount = 0 AND Id = 119119000;
UPDATE Chapters SET VerseCount = 63 WHERE VerseCount = 0 AND Id IN (106015000, 126016000);
UPDATE Chapters SET VerseCount = 71 WHERE VerseCount = 0 AND Id IN (342022000, 343006000);
UPDATE Chapters SET VerseCount = 72 WHERE VerseCount = 0 AND Id IN (119078000, 341014000);
UPDATE Chapters SET VerseCount = 55 WHERE VerseCount = 0 AND Id IN (101031000, 103025000, 113002000);
UPDATE Chapters SET VerseCount = 58 WHERE VerseCount = 0 AND Id IN (109017000, 340013000, 346015000);
UPDATE Chapters SET VerseCount = 59 WHERE VerseCount = 0 AND Id IN (103013000, 342012000, 343008000);
UPDATE Chapters SET VerseCount = 66 WHERE VerseCount = 0 AND Id IN (111008000, 125003000, 340027000);
UPDATE Chapters SET VerseCount = 3 WHERE VerseCount = 0 AND Id IN (117010000, 119131000, 119133000, 119134000);
UPDATE Chapters SET VerseCount = 53 WHERE VerseCount = 0 AND Id IN (111001000, 111022000, 342024000, 343007000);
UPDATE Chapters SET VerseCount = 56 WHERE VerseCount = 0 AND Id IN (104033000, 341006000, 342008000, 342023000);
UPDATE Chapters SET VerseCount = 57 WHERE VerseCount = 0 AND Id IN (101041000, 103014000, 107009000, 343011000);
UPDATE Chapters SET VerseCount = 45 WHERE VerseCount = 0 AND Id IN (104014000, 106021000, 119105000, 127011000, 341001000);
UPDATE Chapters SET VerseCount = 48 WHERE VerseCount = 0 AND Id IN (107020000, 119106000, 340005000, 342019000, 344010000);
UPDATE Chapters SET VerseCount = 54 WHERE VerseCount = 0 AND Id IN (104001000, 104031000, 113001000, 342011000, 343004000);
UPDATE Chapters SET VerseCount = 50 WHERE VerseCount = 0 AND Id IN (104016000, 119018000, 340012000, 341009000, 342007000, 343012000);
UPDATE Chapters SET VerseCount = 52 WHERE VerseCount = 0 AND Id IN (105032000, 109014000, 119089000, 341010000, 342002000, 344013000);
UPDATE Chapters SET VerseCount = 49 WHERE VerseCount = 0 AND Id IN (104004000, 105004000, 126020000, 126023000, 126040000, 127002000, 342006000);
UPDATE Chapters SET VerseCount = 51 WHERE VerseCount = 0 AND Id IN (102012000, 104003000, 106019000, 110022000, 111007000, 340024000, 343001000);
UPDATE Chapters SET VerseCount = 41 WHERE VerseCount = 0 AND Id IN (104015000, 104022000, 112017000, 118038000, 341004000, 343009000, 344015000, 344019000);
UPDATE Chapters SET VerseCount = 42 WHERE VerseCount = 0 AND Id IN (104032000, 109020000, 114006000, 340010000, 342010000, 343010000, 343019000, 344005000);
UPDATE Chapters SET VerseCount = 47 WHERE VerseCount = 0 AND Id IN (103011000, 113011000, 116012000, 124048000, 341015000, 342020000, 343005000, 344002000);
UPDATE Chapters SET VerseCount = 5 WHERE VerseCount = 0 AND Id IN (119015000, 119043000, 119070000, 119093000, 119100000, 119125000, 119127000, 124045000, 128003000);
UPDATE Chapters SET VerseCount = 44 WHERE VerseCount = 0 AND Id IN (103023000, 109025000, 112004000, 113009000, 115010000, 124032000, 341012000, 342004000, 344027000);
UPDATE Chapters SET VerseCount = 7 WHERE VerseCount = 0 AND Id IN (119011000, 119014000, 119054000, 119067000, 119087000, 119110000, 119120000, 119142000, 123018000, 124047000);
UPDATE Chapters SET VerseCount = 39 WHERE VerseCount = 0 AND Id IN (110003000, 110013000, 110023000, 116010000, 124049000, 340015000, 340023000, 342005000, 345008000, 358010000);
UPDATE Chapters SET VerseCount = 46 WHERE VerseCount = 0 AND Id IN (101027000, 102029000, 103026000, 105001000, 111002000, 111018000, 124050000, 340021000, 340022000, 340025000);
UPDATE Chapters SET VerseCount = 6 WHERE VerseCount = 0 AND Id IN (118025000, 119001000, 119013000, 119023000, 119053000, 119126000, 119128000, 119150000, 123004000, 123012000, 123020000, 139004000);
UPDATE Chapters SET VerseCount = 43 WHERE VerseCount = 0 AND Id IN (101030000, 101036000, 102028000, 102039000, 106010000, 110019000, 111011000, 111020000, 113004000, 113016000, 119107000, 341005000, 342018000, 344009000);
UPDATE Chapters SET VerseCount = 37 WHERE VerseCount = 0 AND Id IN (102026000, 103019000, 105002000, 110015000, 112009000, 112018000, 112019000, 112023000, 114020000, 118034000, 124002000, 127004000, 341007000, 341013000, 342017000, 344004000);
UPDATE Chapters SET VerseCount = 8 WHERE VerseCount = 0 AND Id IN (103012000, 113020000, 119003000, 119004000, 119012000, 119061000, 119082000, 119101000, 119114000, 119121000, 119124000, 119129000, 119130000, 119138000, 123039000, 126015000, 366015000);
UPDATE Chapters SET VerseCount = 9 WHERE VerseCount = 0 AND Id IN (106020000, 114027000, 119008000, 119020000, 119028000, 119047000, 119052000, 119098000, 119099000, 119113000, 119122000, 119137000, 119149000, 123015000, 123031000, 128014000, 138013000);
UPDATE Chapters SET VerseCount = 36 WHERE VerseCount = 0 AND Id IN (101037000, 102016000, 102021000, 103008000, 104010000, 107001000, 109002000, 112010000, 114029000, 115008000, 116011000, 119069000, 120008000, 126027000, 340014000, 343003000, 345011000);
UPDATE Chapters SET VerseCount = 38 WHERE VerseCount = 0 AND Id IN (101019000, 101042000, 102030000, 102036000, 102040000, 103007000, 111006000, 112015000, 116009000, 123037000, 124025000, 126036000, 340009000, 341008000, 342003000, 342021000, 343013000, 344020000);
UPDATE Chapters SET VerseCount = 40 WHERE VerseCount = 0 AND Id IN (102025000, 104029000, 107006000, 107011000, 113007000, 113008000, 113012000, 118031000, 119037000, 124023000, 124031000, 343018000, 344008000, 344016000, 344021000, 346007000, 346014000, 358011000);
UPDATE Chapters SET VerseCount = 10 WHERE VerseCount = 0 AND Id IN (102011000, 106016000, 117007000, 119006000, 119024000, 119064000, 119075000, 119111000, 119112000, 119141000, 119146000, 121011000, 123035000, 124024000, 126002000, 132002000, 132003000, 138003000, 352001000, 362001000);
UPDATE Chapters SET VerseCount = 11 WHERE VerseCount = 0 AND Id IN (109029000, 114019000, 115001000, 116001000, 119016000, 119029000, 119032000, 119042000, 119046000, 119057000, 119058000, 119063000, 119095000, 122003000, 123050000, 123061000, 126009000, 128001000, 128006000, 132004000, 138005000, 366004000, 366010000);
UPDATE Chapters SET VerseCount = 19 WHERE VerseCount = 0 AND Id IN (103005000, 105025000, 105026000, 110010000, 113019000, 113022000, 114010000, 114015000, 114017000, 116005000, 116006000, 119051000, 119080000, 119116000, 123063000, 124001000, 124035000, 128004000, 134003000, 135003000, 358003000, 360004000, 366011000);
UPDATE Chapters SET VerseCount = 32 WHERE VerseCount = 0 AND Id IN (101005000, 101010000, 101011000, 101032000, 102008000, 104018000, 105011000, 105012000, 110002000, 113023000, 113026000, 116003000, 117009000, 120010000, 123014000, 124029000, 124036000, 126018000, 126021000, 126032000, 129002000, 342015000, 344026000, 345001000, 349004000);
UPDATE Chapters SET VerseCount = 12 WHERE VerseCount = 0 AND Id IN (105034000, 109005000, 109027000, 110004000, 114022000, 119002000, 119005000, 119026000, 119030000, 119036000, 119060000, 119062000, 119076000, 119084000, 119097000, 119143000, 121006000, 123025000, 123053000, 123056000, 123062000, 123064000, 128011000, 133003000, 138010000, 353001000);
UPDATE Chapters SET VerseCount = 35 WHERE VerseCount = 0 AND Id IN (101026000, 101029000, 102009000, 102032000, 102034000, 102035000, 103004000, 104011000, 104021000, 106008000, 107008000, 109015000, 118009000, 118015000, 119068000, 119104000, 120003000, 120006000, 120014000, 120023000, 126048000, 340018000, 341003000, 342013000, 342014000, 344023000);
UPDATE Chapters SET VerseCount = 30 WHERE VerseCount = 0 AND Id IN (101038000, 102006000, 103006000, 103018000, 104023000, 105022000, 105031000, 107019000, 109018000, 112025000, 113021000, 113029000, 118006000, 118022000, 118039000, 120020000, 123005000, 124006000, 124022000, 124044000, 127003000, 340011000, 340019000, 344011000, 344022000, 350001000, 350002000);
UPDATE Chapters SET VerseCount = 34 WHERE VerseCount = 0 AND Id IN (101021000, 101025000, 101043000, 101044000, 101046000, 103016000, 103027000, 104002000, 104035000, 106022000, 111004000, 111013000, 111015000, 111016000, 113027000, 114018000, 118021000, 118041000, 120024000, 123010000, 124007000, 124052000, 340006000, 340008000, 340020000, 344017000, 346011000);
UPDATE Chapters SET VerseCount = 16 WHERE VerseCount = 0 AND Id IN (101016000, 102017000, 103002000, 103017000, 104012000, 104030000, 106023000, 114012000, 118017000, 118035000, 119081000, 119091000, 121004000, 122004000, 122005000, 123011000, 124040000, 128007000, 128013000, 130002000, 133001000, 133006000, 346002000, 347007000, 354003000, 354004000, 356001000, 358004000);
UPDATE Chapters SET VerseCount = 26 WHERE VerseCount = 0 AND Id IN (101004000, 101050000, 102020000, 104008000, 105007000, 105027000, 106007000, 110020000, 112021000, 113005000, 118003000, 119044000, 119136000, 121002000, 123003000, 123049000, 124009000, 124033000, 126028000, 126030000, 126041000, 343017000, 344001000, 344003000, 345014000, 348005000, 355002000, 359002000);
UPDATE Chapters SET VerseCount = 33 WHERE VerseCount = 0 AND Id IN (101018000, 101049000, 102023000, 103015000, 103022000, 104013000, 105005000, 106013000, 106024000, 110014000, 110018000, 111012000, 112006000, 114032000, 114034000, 118033000, 118036000, 120001000, 120015000, 120016000, 120030000, 123030000, 126033000, 341011000, 343016000, 345009000, 345015000, 346010000, 347011000, 349005000);
UPDATE Chapters SET VerseCount = 15 WHERE VerseCount = 0 AND Id IN (106005000, 106014000, 107012000, 109011000, 109021000, 114014000, 115009000, 117003000, 119017000, 119092000, 119144000, 123047000, 123052000, 124019000, 126035000, 128005000, 128010000, 130001000, 130003000, 130009000, 133005000, 134001000, 136002000, 137001000, 138006000, 344006000, 347009000, 354002000, 356002000, 356003000, 364001000, 366020000);
UPDATE Chapters SET VerseCount = 14 WHERE VerseCount = 0 AND Id IN (113010000, 113013000, 114005000, 114016000, 117005000, 117006000, 118026000, 119019000, 119027000, 119048000, 119148000, 121012000, 122008000, 123016000, 123017000, 123058000, 124021000, 126006000, 126019000, 128008000, 128012000, 130006000, 130008000, 138004000, 138007000, 138012000, 139001000, 345013000, 347013000, 358001000, 358005000, 360005000, 366005000);
UPDATE Chapters SET VerseCount = 28 WHERE VerseCount = 0 AND Id IN (101045000, 106018000, 109001000, 111003000, 111009000, 114025000, 115007000, 118013000, 118028000, 119035000, 119073000, 119102000, 120012000, 120017000, 120025000, 120026000, 120028000, 123043000, 123044000, 124038000, 124046000, 126001000, 126012000, 126037000, 127006000, 127007000, 340016000, 341002000, 344014000, 344018000, 352005000, 358007000, 358009000);
UPDATE Chapters SET VerseCount = 24 WHERE VerseCount = 0 AND Id IN (101003000, 101007000, 101014000, 101022000, 103009000, 103021000, 106002000, 106004000, 106012000, 107004000, 109019000, 111017000, 113003000, 115004000, 118037000, 118040000, 119031000, 119071000, 119139000, 120018000, 123029000, 123033000, 123066000, 124026000, 124030000, 126017000, 126046000, 346016000, 347001000, 347008000, 348001000, 349006000, 362003000, 366018000);
UPDATE Chapters SET VerseCount = 29 WHERE VerseCount = 0 AND Id IN (101009000, 101035000, 102010000, 102037000, 104020000, 104034000, 105003000, 105009000, 105014000, 105029000, 105033000, 109023000, 110007000, 110017000, 111010000, 111021000, 112008000, 112014000, 113015000, 118019000, 118020000, 119118000, 120019000, 120022000, 121007000, 123028000, 123041000, 126039000, 340007000, 345002000, 348003000, 351001000, 358012000, 362002000, 366002000);
UPDATE Chapters SET VerseCount = 13 WHERE VerseCount = 0 AND Id IN (104017000, 104036000, 107017000, 109031000, 110009000, 115003000, 118002000, 119021000, 119039000, 119041000, 119056000, 119065000, 119079000, 119085000, 119096000, 119108000, 119140000, 122006000, 122007000, 123006000, 123027000, 123046000, 123055000, 124043000, 127012000, 130004000, 133002000, 133004000, 134002000, 138002000, 346005000, 346008000, 346013000, 352003000, 358008000, 363001000, 366008000);
UPDATE Chapters SET VerseCount = 20 WHERE VerseCount = 0 AND Id IN (101012000, 101023000, 101033000, 103010000, 105008000, 105017000, 105020000, 105030000, 107014000, 107015000, 112007000, 112016000, 112022000, 112024000, 114021000, 116002000, 118011000, 119009000, 119049000, 119066000, 119072000, 119077000, 119147000, 121005000, 121010000, 123032000, 126042000, 129001000, 133007000, 135002000, 136003000, 340028000, 341016000, 346006000, 352002000, 354001000, 358006000, 359005000, 366001000, 366014000);
UPDATE Chapters SET VerseCount = 27 WHERE VerseCount = 0 AND Id IN (101017000, 102015000, 102018000, 103020000, 104006000, 106006000, 106009000, 109009000, 109010000, 110001000, 110011000, 112003000, 112005000, 113017000, 114024000, 114028000, 114030000, 114035000, 118005000, 120004000, 120007000, 120027000, 120029000, 124013000, 124017000, 126003000, 126007000, 126024000, 126043000, 127008000, 127009000, 130005000, 340017000, 343015000, 344024000, 344025000, 345016000, 346009000, 359001000, 366021000);
UPDATE Chapters SET VerseCount = 31 WHERE VerseCount = 0 AND Id IN (101001000, 101034000, 101047000, 102004000, 102014000, 102022000, 102038000, 104005000, 104028000, 107003000, 107005000, 107016000, 107018000, 109030000, 110012000, 111014000, 113024000, 113025000, 114009000, 116013000, 118030000, 119022000, 119109000, 120011000, 120021000, 120031000, 123001000, 123040000, 124004000, 124005000, 126022000, 126034000, 126044000, 127005000, 342016000, 343014000, 343020000, 344028000, 345003000, 346001000, 346012000, 348004000);
UPDATE Chapters SET VerseCount = 17 WHERE VerseCount = 0 AND Id IN (103001000, 103003000, 106003000, 109007000, 113014000, 113018000, 114001000, 114003000, 115005000, 117004000, 117008000, 118023000, 118042000, 119007000, 119040000, 119045000, 119059000, 119086000, 119090000, 121008000, 122001000, 122002000, 123021000, 123034000, 123054000, 124012000, 124028000, 126004000, 126005000, 126025000, 128009000, 130007000, 132001000, 135001000, 138009000, 138011000, 139002000, 340003000, 347002000, 353002000, 355003000, 359004000, 366006000, 366007000, 366012000);
UPDATE Chapters SET VerseCount = 23 WHERE VerseCount = 0 AND Id IN (101039000, 101040000, 102005000, 102033000, 103024000, 104009000, 104027000, 105015000, 105021000, 106011000, 107002000, 108002000, 109013000, 109016000, 109022000, 110006000, 110016000, 114011000, 114026000, 114036000, 116004000, 117002000, 118027000, 119050000, 119055000, 119074000, 119094000, 120005000, 123024000, 123051000, 124011000, 124018000, 126013000, 126014000, 126038000, 126047000, 128002000, 137002000, 138008000, 340002000, 345006000, 346003000, 349001000, 350004000, 351002000);
UPDATE Chapters SET VerseCount = 18 WHERE VerseCount = 0 AND Id IN (101013000, 101020000, 102024000, 102031000, 104025000, 105013000, 106001000, 106017000, 107010000, 108003000, 110008000, 111005000, 112001000, 114002000, 114008000, 116008000, 119010000, 119083000, 119088000, 119115000, 119132000, 120009000, 121001000, 121009000, 123023000, 124020000, 124039000, 124041000, 126008000, 126031000, 136001000, 139003000, 347003000, 347004000, 347006000, 347010000, 348006000, 351004000, 352004000, 353003000, 355001000, 358002000, 359003000, 361003000, 366013000, 366017000);
UPDATE Chapters SET VerseCount = 25 WHERE VerseCount = 0 AND Id IN (101002000, 102002000, 102007000, 102019000, 104024000, 105006000, 105023000, 107007000, 107013000, 107021000, 109012000, 109026000, 109028000, 110005000, 110024000, 112002000, 112013000, 114033000, 118012000, 118024000, 118029000, 120013000, 123007000, 123019000, 123022000, 123042000, 123045000, 123065000, 124003000, 124010000, 126011000, 126045000, 340001000, 340004000, 343002000, 343021000, 344012000, 345004000, 345007000, 351003000, 354005000, 357001000, 358013000, 360001000, 360002000, 365001000);
UPDATE Chapters SET VerseCount = 21 WHERE VerseCount = 0 AND Id IN (101015000, 102027000, 105019000, 109003000, 109006000, 111019000, 112011000, 112012000, 112020000, 113028000, 114023000, 114031000, 118004000, 118007000, 118018000, 119135000, 119145000, 123009000, 123026000, 123057000, 123059000, 124015000, 124016000, 124037000, 126026000, 126029000, 127001000, 127010000, 129003000, 131001000, 138001000, 138014000, 345005000, 345010000, 345012000, 346004000, 347005000, 347012000, 348002000, 349003000, 350003000, 354006000, 361001000, 362004000, 362005000, 366009000, 366016000, 366019000, 366022000);
UPDATE Chapters SET VerseCount = 22 WHERE VerseCount = 0;

-- -------------------------------------------------------------------------
-- Verses
-- -------------------------------------------------------------------------
;WITH VerseIndexes(Verse) AS
(
    SELECT 1 AS Verse
    UNION ALL 
    SELECT Verse + 1 
	FROM VerseIndexes 
	WHERE Verse < 180
)
INSERT INTO Verses (Id, Code, OsisCode, Reference, CanonId, SectionId, BookId, ChapterId, IsChapterEnd, Book, Chapter, Verse)
SELECT
	C.Id + V.Verse AS Id
	, C.Code + '-' + CONVERT(varchar(3), V.Verse) AS Code
	, B.OsisCode + '.' + CONVERT(varchar(3), C.Chapter) + '.' + CONVERT(varchar(3), V.Verse) AS OsisCode
	, C.Reference + ':' + CONVERT(varchar(3), V.Verse) AS Reference
	, B.CanonId 
	, B.SectionId
	, C.BookId
	, C.Id AS ChapterId
	, CASE WHEN V.Verse = C.VerseCount THEN 1 ELSE 0 END AS IsChapterEnd
	, B.Book
	, C.Chapter
	, V.Verse
 FROM Chapters C
	JOIN Books B ON B.Id = C.BookId
	CROSS JOIN VerseIndexes V
WHERE V.Verse <= C.VerseCount
	AND NOT EXISTS (SELECT * FROM Verses V2 WHERE V2.Id = C.Id + V.Verse)
OPTION (MAXRECURSION 180);


SET NOCOUNT OFF;
/* *************************************************************************
Bible Database: SQL Server, by Don Jewett
https://github.com/donjewett/bible-sql-mssql

bible-040-versions.sql

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
-- Versions
----------------------------------------------------------------------------
EXEC add_Version @code='RVA', @name='Reina-Valera Antigua', @lang='esp', @year=1569, @hebrew='MAS', @greek='TRG', @license=1
EXEC add_Version @code='RV-esp', @name='Reina Valera', @lang='esp', @year=1602, @parent='RVA', @hebrew='MAS', @greek='TRG', @license=1
EXEC add_Version @code='KJV', @name='King James Version', @lang='eng', @year=1611, @hebrew='MAS', @greek='TRG', @license=2
EXEC add_Version @code='BGS', @name='Brenton Greek Septuagint', @lang='grc', @year=1844, @hebrew='LXX', @license=1
EXEC add_Version @code='YLT', @name='Young’s Literal Translation', @lang='eng', @year=1862, @hebrew='MAS', @greek='TRG', @license=1
EXEC add_Version @code='Darby', @name='Darby Translation', @lang='eng', @year=1884, @license=1
EXEC add_Version @code='RV', @name='Revised Version', @lang='eng', @year=1885, @parent='KJV', @hebrew='MAS', @greek='AX', @license=1
EXEC add_Version @code='NRSV', @name='New Revised Standard Version', @lang='eng', @year=1889, @parent='RSV', @hebrew='MAS', @greek='AX', @license=7, @level=11.00
EXEC add_Version @code='NA', @name='Novum Testamentum Graece', @lang='grc', @year=1898, @sub='(Nestle-Aland GNT)', @greek='AX', @license=11
EXEC add_Version @code='ASV', @name='American Standard Version', @lang='eng', @year=1901, @parent='RV', @hebrew='MAS', @greek='AX', @license=1
EXEC add_Version @code='TCNT', @name='Twentieth Century New Testament', @lang='eng', @year=1904, @greek='AX', @license=1
EXEC add_Version @code='BHK', @name='Biblia Hebraica', @lang='hbo', @year=1906, @sub='(Kittel)', @hebrew='MAS', @license=1
EXEC add_Version @code='JPS', @name='Jewish Publication Society of America Version', @lang='eng', @year=1917, @hebrew='MAS', @license=1, @level=10.00
EXEC add_Version @code='RSV', @name='Revised Standard Version', @lang='eng', @year=1952, @parent='ASV', @hebrew='MAS', @greek='AX', @license=7, @level=12.00
EXEC add_Version @code='AMP', @name='Amplified Bible, The', @lang='eng', @year=1965, @parent='ASV', @hebrew='MAS', @greek='AX', @license=7, @level=11.00
EXEC add_Version @code='BBE', @name='Bible in Basic English', @lang='eng', @year=1965, @license=1
EXEC add_Version @code='UBS', @name='United Bible Societies’s Greek New Testament', @lang='grc', @year=1966, @greek='AX', @license=11
EXEC add_Version @code='BHS', @name='Biblia Hebraica Stuttgartensia', @lang='hbo', @year=1968, @parent='BHK', @hebrew='MAS'
EXEC add_Version @code='NAB', @name='New American Bible', @lang='eng', @year=1970, @hebrew='MAS', @greek='AX', @license=7, @level=9.00
EXEC add_Version @code='NASB', @name='New American Standard Bible', @lang='eng', @year=1971, @parent='ASV', @hebrew='MAS', @greek='AX', @license=7, @level=11.00
EXEC add_Version @code='TLB', @name='Living Bible, The', @lang='eng', @year=1971, @parent='ASV', @hebrew='MAS', @greek='AX', @license=7, @level=4.00
EXEC add_Version @code='NIV', @name='New International Version', @lang='eng', @year=1978, @hebrew='MAS', @greek='AX', @license=7, @level=7.80
EXEC add_Version @code='EVD', @name='English Version for the Deaf', @lang='eng', @year=1978, @hebrew='MAS', @greek='AX', @license=7, @level=3.00
EXEC add_Version @code='GNTMT', @name='Greek New Testament According to the Majority Text, The', @lang='grc', @year=1982, @sub='Zane C. Hodges and Arthur L. Farstad', @greek='BYZ'
EXEC add_Version @code='NKJV', @name='New King James Version', @lang='eng', @year=1982, @parent='KJV', @hebrew='MAS', @greek='TRG', @license=7, @level=7.00
EXEC add_Version @code='ICB', @name='International Children’s Bible', @lang='eng', @year=1986, @parent='ERVE', @hebrew='MAS', @greek='AX', @license=7, @level=3.00
EXEC add_Version @code='NCV', @name='New Century Version', @lang='eng', @year=1987, @parent='ICB', @hebrew='MAS', @greek='AX', @license=7, @level=5.00
EXEC add_Version @code='ERVE', @name='Easy-to-Read Version', @lang='eng', @year=1987, @parent='EVD', @hebrew='MAS', @greek='AX', @license=7, @level=3.00
EXEC add_Version @code='GNTBYZ', @name='New Testament in the Original Greek: Byzantine Textform, The', @lang='grc', @year=1991, @sub='Maurice A. Robinson and William G. Pierpont', @greek='BYZ', @license=1
EXEC add_Version @code='CEV', @name='Contemporary English Version', @lang='eng', @year=1995, @license=7
EXEC add_Version @code='NLT', @name='New Living Translation', @lang='eng', @year=1996, @parent='TLB', @hebrew='MAS', @greek='AX', @license=7, @level=6.00
EXEC add_Version @code='NIrV', @name='New International Reader’s Version', @lang='eng', @year=1996, @parent='NIV', @hebrew='MAS', @greek='AX', @license=7, @level=3.00
EXEC add_Version @code='NVI', @name='Nueva Versión Internacional', @lang='esp', @year=1999, @hebrew='MAS', @greek='AX', @license=7
EXEC add_Version @code='AKJV', @name='American King James Version', @lang='eng', @year=1999
EXEC add_Version @code='WEB', @name='World English Bible', @lang='eng', @year=2000, @parent='ASV', @hebrew='MAS', @greek='BYZ', @license=1, @level=11.00
EXEC add_Version @code='ESV', @name='English Standard Version', @lang='eng', @year=2001, @parent='RSV', @hebrew='MAS', @greek='AX', @license=7, @level=8.00
EXEC add_Version @code='NET', @name='New English Translation', @lang='eng', @year=2001, @hebrew='MAS', @greek='AX', @license=6, @level=7.00
EXEC add_Version @code='MSG', @name='Message, The', @lang='eng', @year=2002, @license=7, @level=5.00
EXEC add_Version @code='EMTV', @name='English Majority Text Version', @lang='eng', @year=2003, @greek='BYZ', @license=4
EXEC add_Version @code='HCSB', @name='Holman Christian Standard Bible', @lang='eng', @year=2004, @hebrew='MAS', @greek='AX', @license=7, @level=7.00
EXEC add_Version @code='TNIV', @name='Today’s New International Version', @lang='eng', @year=2005, @parent='NIV', @hebrew='MAS', @greek='AX', @license=7, @level=7.80
EXEC add_Version @code='ISV', @name='International Standard Version', @lang='eng', @year=2011, @hebrew='MAS', @greek='AX', @license=9, @level=7.00
EXEC add_Version @code='LEB', @name='Lexham English Bible', @lang='eng', @year=2011, @greek='AX', @license=6, @level=11.00
EXEC add_Version @code='CEB', @name='Common English Bible', @lang='eng', @year=2011, @hebrew='MAS', @greek='AX', @license=7, @level=7.00
EXEC add_Version @code='VOC', @name='Voice, The', @lang='eng', @year=2012, @license=7, @level=6.00
EXEC add_Version @code='MEV', @name='Modern English Version', @lang='eng', @year=2014, @hebrew='MAS', @greek='TRG', @license=7
EXEC add_Version @code='BIB', @name='Berean Interlinear Bible', @lang='eng', @year=2016, @hebrew='MAS', @greek='AX', @license=6
EXEC add_Version @code='BSB', @name='Berean Standard Bible', @lang='eng', @year=2016, @parent='BIB', @hebrew='MAS', @greek='AX', @license=6
EXEC add_Version @code='Pickering', @name='Sovereign Creator Has Spoken, The', @lang='eng', @year=2016, @parent='GNTF35', @sub='Objective Authority for Living: The New Testament Translation with Commentary', @greek='F35', @license=3
EXEC add_Version @code='CSB', @name='Christian Standard Bible', @lang='eng', @year=2017, @parent='HCSB', @hebrew='MAS', @greek='AX', @license=7, @level=7.00
EXEC add_Version @code='FBV', @name='Free Bible Version', @lang='eng', @year=2018, @license=5
EXEC add_Version @code='GNTF35', @name='Greek New Testament According to Family 35, The', @lang='grc', @year=2020, @greek='F35'
EXEC add_Version @code='LSV', @name='Literal Standard Version', @lang='eng', @year=2020, @parent='YLT', @hebrew='MAS', @greek='TRG', @license=4, @level=10.00
EXEC add_Version @code='LSB', @name='Legacy Standard Bible', @lang='eng', @year=2021, @parent='NASB', @hebrew='MAS', @greek='AX', @license=7, @level=11.00
EXEC add_Version @code='ASVBT', @name='American Standard Version Byzantine Text', @lang='eng', @year=2021, @parent='ASV', @hebrew='MAS', @greek='BYZ', @license=1
EXEC add_Version @code='TCENT', @name='Text-Critical English New Testament, The', @lang='eng', @year=2021, @parent='GNTBYZ', @sub='Byzantine Text Version', @greek='BYZ', @license=12
EXEC add_Version @code='MSB', @name='Majority Standard Bible', @lang='eng', @year=2022, @parent='BSB', @hebrew='MAS', @greek='BYZ', @license=1

----------------------------------------------------------------------------
-- Revisions
----------------------------------------------------------------------------
EXEC add_Revision @code='KJV-1611', @version='KJV', @year=1611
EXEC add_Revision @code='KJV-1769', @version='KJV', @year=1769
EXEC add_Revision @code='KJV-1900', @version='KJV', @year=1900
EXEC add_Revision @code='ASV-1901', @version='ASV', @year=1901
EXEC add_Revision @code='AMP65', @version='AMP', @year=1965
EXEC add_Revision @code='NASB77', @version='NASB', @year=1977
EXEC add_Revision @code='NIV78', @version='NIV', @year=1978
EXEC add_Revision @code='NKJV82', @version='NKJV', @year=1982
EXEC add_Revision @code='NKJV84', @version='NKJV', @year=1984
EXEC add_Revision @code='NIV84', @version='NIV', @year=1984
EXEC add_Revision @code='AMP87', @version='AMP', @year=1987
EXEC add_Revision @code='NRSV89', @version='NRSV', @year=1989
EXEC add_Revision @code='GNTBYZ-1991', @version='GNTBYZ', @year=1991
EXEC add_Revision @code='NASB95', @version='NASB', @year=1995
EXEC add_Revision @code='NIrV1996', @version='NIrV', @year=1996
EXEC add_Revision @code='NLT96', @version='NLT', @year=1996
EXEC add_Revision @code='NIrV1998', @version='NIrV', @year=1998
EXEC add_Revision @code='NET2001', @version='NET', @year=2001, @sub='Beta 1'
EXEC add_Revision @code='ESV2001', @version='ESV', @year=2001
EXEC add_Revision @code='EMTV2003', @version='EMTV', @year=2003
EXEC add_Revision @code='NET2003', @version='NET', @year=2003, @sub='Beta 2'
EXEC add_Revision @code='NLT2004', @version='NLT', @year=2004
EXEC add_Revision @code='GNTBYZ-2005', @version='GNTBYZ', @year=2005
EXEC add_Revision @code='NLT2007', @version='NLT', @year=2007
EXEC add_Revision @code='ESV2007', @version='ESV', @year=2007
EXEC add_Revision @code='EMTV2009', @version='EMTV', @year=2009
EXEC add_Revision @code='ESV2011', @version='ESV', @year=2011
EXEC add_Revision @code='NIV2011', @version='NIV', @year=2011
EXEC add_Revision @code='NA28', @version='NA', @year=2012
EXEC add_Revision @code='EMTV2012', @version='EMTV', @year=2012
EXEC add_Revision @code='NLT2013', @version='NLT', @year=2013
EXEC add_Revision @code='EMTV2014', @version='EMTV', @year=2014
EXEC add_Revision @code='NIrV2014', @version='NIrV', @year=2014
EXEC add_Revision @code='NLT2015', @version='NLT', @year=2015
EXEC add_Revision @code='AMP2015', @version='AMP', @year=2015
EXEC add_Revision @code='ESV2016', @version='ESV', @year=2016
EXEC add_Revision @code='CSB2017', @version='CSB', @year=2017
EXEC add_Revision @code='NET2005', @version='NET', @year=2017, @sub='First Revision'
EXEC add_Revision @code='NET2017', @version='NET', @year=2017, @sub='Second Revision'
EXEC add_Revision @code='GNTBYZ-2018', @version='GNTBYZ', @year=2018
EXEC add_Revision @code='NET2019', @version='NET', @year=2019
EXEC add_Revision @code='CSB2020', @version='CSB', @year=2020
EXEC add_Revision @code='NASB2020', @version='NASB', @year=2020
EXEC add_Revision @code='Pickering-2023', @version='Pickering', @year=2023
EXEC add_Revision @code='NRSV2021', @version='NRSV', @year=2021
EXEC add_Revision @code='WEB2022', @version='WEB', @year=2022
EXEC add_Revision @code='ESV2025', @version='ESV', @year=2025

----------------------------------------------------------------------------
-- Sites
----------------------------------------------------------------------------
EXEC add_Site @name='German Bible Society', @url='https://www.die-bibel.de/en'
EXEC add_Site @name='jsonBible.com', @url='https://jsonbible.com/'
EXEC add_Site @name='Lockman Foundation', @url='https://www.lockman.org/'
EXEC add_Site @name='eBible.org', @url='https://ebible.org/'
EXEC add_Site @name='New English Translation', @url='https://netbible.com/'
EXEC add_Site @name='NETBible.org', @url='https://netbible.org/'

----------------------------------------------------------------------------
-- Resources
----------------------------------------------------------------------------
EXEC add_Resource @version='NA', @type='read', @url='https://www.die-bibel.de/en/bible/NA28/', @official=1, @revision='NA28', @siteName='German Bible Society', @siteUrl='https://www.die-bibel.de/en'
EXEC add_Resource @version='NAB', @type='read', @url='https://bible.usccb.org/bible', @official=1
EXEC add_Resource @version='ERVE', @type='read', @url='https://web.archive.org/web/20051231232017/http://www.wbtc.com/downloads/english_downloads_main.htm', @official=1
EXEC add_Resource @version='VOC', @type='read', @url='https://www.biblegateway.com/versions/The-Voice-Bible/', @official=0
EXEC add_Resource @version='BSB', @type='read', @url='https://biblehub.com/bsb/genesis/1.htm', @official=1
EXEC add_Resource @version='Pickering', @type='read', @url='https://www.prunch.com.br/en/studies/new-translation-of-the-new-testament/', @official=1, @revision='Pickering-2023'
EXEC add_Resource @version='CSB', @type='read', @url='https://read.csbible.com/', @official=1
EXEC add_Resource @version='LSB', @type='read', @url='https://read.lsbible.org/', @official=1
EXEC add_Resource @version='MSB', @type='read', @url='https://biblehub.com/msb/matthew/1.htm', @official=1
EXEC add_Resource @version='RVA', @type='read', @url='https://www.biblegateway.com/versions/Reina-Valera-Antigua-RVA-Biblia/', @official=0
EXEC add_Resource @version='RV', @type='file', @url='https://ebible.org/find/show.php?id=eng-rv', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='ASVBT', @type='version', @url='https://ebible.org/find/show.php?id=engasvbt', @official=1, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='BHK', @type='version', @url='https://www.die-bibel.de/en/rudolf-kittels-biblia-hebraica-bhk', @official=1, @siteName='German Bible Society', @siteUrl='https://www.die-bibel.de/en'
EXEC add_Resource @version='BIB', @type='version', @url='https://interlinearbible.com/', @official=1
EXEC add_Resource @version='CEB', @type='version', @url='https://www.commonenglishbible.com/', @official=1
EXEC add_Resource @version='CEV', @type='version', @url='https://cev.bible/', @official=1
EXEC add_Resource @version='CSB', @type='version', @url='https://csbible.com/', @official=1
EXEC add_Resource @version='EMTV', @type='version', @url='http://www.majoritytext.com/', @official=1
EXEC add_Resource @version='ERVE', @type='version', @url='https://www.bibleleague.org/bible-translation/', @official=1
EXEC add_Resource @version='FBV', @type='version', @url='http://www.freebibleversion.org/', @official=1
EXEC add_Resource @version='GNTBYZ', @type='file', @url='https://github.com/byztxt/byzantine-majority-text', @official=1, @revision='GNTBYZ-2018'
EXEC add_Resource @version='ICB', @type='version', @url='https://www.thomasnelsonbibles.com/icb/', @official=1
EXEC add_Resource @version='ISV', @type='version', @url='https://web.archive.org/web/20181216032202/https://www.isv.org/bible/', @official=1
EXEC add_Resource @version='JPS', @type='version', @url='https://jps.org/download-the-tanakh-1917-translation/', @official=1
EXEC add_Resource @version='LEB', @type='version', @url='http://lexhamenglishbible.com/', @official=1
EXEC add_Resource @version='LSB', @type='version', @url='https://lsbible.org/', @official=1
EXEC add_Resource @version='LSV', @type='version', @url='https://www.lsvbible.com/', @official=1
EXEC add_Resource @version='MEV', @type='version', @url='https://modernenglishversion.com/', @official=1
EXEC add_Resource @version='MSB', @type='version', @url='https://majoritybible.com/', @official=1
EXEC add_Resource @version='MSG', @type='version', @url='https://messagebible.com/', @official=1
EXEC add_Resource @version='NA', @type='version', @url='https://www.die-bibel.de/en/novum-testamentum-graece-nestle-aland', @official=1, @siteName='German Bible Society', @siteUrl='https://www.die-bibel.de/en'
EXEC add_Resource @version='NAB', @type='version', @url='https://bible.usccb.org/bible', @official=1
EXEC add_Resource @version='NCV', @type='version', @url='https://www.thomasnelsonbibles.com/ncv/', @official=1
EXEC add_Resource @version='NET', @type='license', @url='https://netbible.com/copyright/', @official=1, @siteName='New English Translation', @siteUrl='https://netbible.com/'
EXEC add_Resource @version='NET', @type='version', @url='https://netbible.com/', @official=1, @siteName='New English Translation', @siteUrl='https://netbible.com/'
EXEC add_Resource @version='NET', @type='read', @url='https://netbible.org/', @official=1, @siteName='NETBible.org', @siteUrl='https://netbible.org/'
EXEC add_Resource @version='NET', @type='file', @url='https://bible.org/downloads', @official=1
EXEC add_Resource @version='NIrV', @type='version', @url='https://www.thenivbible.com/nirv/', @official=1
EXEC add_Resource @version='NIV', @type='version', @url='https://www.thenivbible.com/', @official=1
EXEC add_Resource @version='NRSV', @type='version', @url='https://friendshippress.org/nrsv-updated-revision/', @official=1
EXEC add_Resource @version='NVI', @type='version', @url='http://nuevaversioninternacional.com/', @official=1
EXEC add_Resource @version='RSV', @type='version', @url='https://friendshippress.org/our-bibles/', @official=1
EXEC add_Resource @version='VOC', @type='version', @url='https://www.thomasnelsonbibles.com/product/the-voice-bible/', @official=1
EXEC add_Resource @version='WEB', @type='version', @url='https://worldenglishbible.org/', @official=1
EXEC add_Resource @version='BIB', @type='license', @url='https://berean.bible/terms.htm', @official=1
EXEC add_Resource @version='BSB', @type='license', @url='https://berean.bible/terms.htm', @official=1
EXEC add_Resource @version='CSB', @type='license', @url='https://csbible.com/about-the-csb/faqs/#faq/may-i-use-the-christian-standard-bible-in-my-writing', @official=1
EXEC add_Resource @version='Pickering', @type='license', @url='https://ebible.org/find/show.php?id=engf35', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='FBV', @type='license', @url='https://ebible.org/find/details.php?id=engfbv', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='ISV', @type='license', @url='https://web.archive.org/web/20170418233626/https://www.isv.org/bible/legal/', @official=1
EXEC add_Resource @version='LEB', @type='license', @url='https://lexhampress.com/LEB-License', @official=1
EXEC add_Resource @version='MSB', @type='license', @url='https://berean.bible/licensing.htm', @official=1
EXEC add_Resource @version='MSG', @type='license', @url='https://www.tyndale.com/permissions', @official=1
EXEC add_Resource @version='NAB', @type='license', @url='https://www.usccb.org/offices/new-american-bible/permissions', @official=1
EXEC add_Resource @version='MSB', @type='license', @url='https://berean.bible/terms.htm', @official=1
EXEC add_Resource @version='NIrV', @type='license', @url='https://www.biblica.com/terms-of-use/', @official=1
EXEC add_Resource @version='NRSV', @type='license', @url='https://friendshippress.org/bible-licensing/licensing-and-permissions-guidelines/', @official=1
EXEC add_Resource @version='RSV', @type='license', @url='https://friendshippress.org/bible-licensing/licensing-and-permissions-guidelines/', @official=1
EXEC add_Resource @version='VOC', @type='license', @url='https://www.harpercollinschristian.com/sales-and-rights/permissions/#1', @official=1
EXEC add_Resource @version='BSB', @type='version', @url='https://berean.bible/', @official=1
EXEC add_Resource @version='GNTBYZ', @type='version', @url='https://byzantinetext.com/', @official=1
EXEC add_Resource @version='GNTBYZ', @type='license', @url='https://byzantinetext.com/study/revisions/robinson-pierpont/', @official=1
EXEC add_Resource @version='GNTBYZ', @type='file', @url='https://archive.org/details/newtestamentrobinsonpierpontbyzantine/', @official=0, @revision='GNTBYZ-2005'
EXEC add_Resource @version='KJV', @type='api', @url='https://jsonbible.com/', @official=0, @revision='KJV-1769', @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='ASV', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='NIV', @type='api', @url='https://jsonbible.com/', @official=0, @revision='NIV84', @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='NKJV', @type='api', @url='https://jsonbible.com/', @official=0, @revision='NKJV84', @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='ESV', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='NASB', @type='api', @url='https://jsonbible.com/', @official=0, @revision='NASB95', @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='AMP', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='BBE', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='Darby', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='NLT', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='WEB', @type='file', @url='https://biblehub.info/data/bibles.xlsx', @official=0
EXEC add_Resource @version='RV', @type='file', @url='https://biblehub.info/data/bibles.xlsx', @official=0
EXEC add_Resource @version='BHS', @type='read', @url='https://www.die-bibel.de/en/bible/BHS/', @official=1, @siteName='German Bible Society', @siteUrl='https://www.die-bibel.de/en'
EXEC add_Resource @version='AMP', @type='version', @url='https://www.lockman.org/amplified-bible-amp/', @official=1, @siteName='Lockman Foundation', @siteUrl='https://www.lockman.org/'
EXEC add_Resource @version='NASB', @type='version', @url='https://www.lockman.org/new-american-standard-bible-nasb/', @official=1, @siteName='Lockman Foundation', @siteUrl='https://www.lockman.org/'
EXEC add_Resource @version='NASB', @type='revision', @url='https://www.lockman.org/new-american-standard-bible-nasb/more-information-nasb-1995/', @official=1, @revision='NASB95', @siteName='Lockman Foundation', @siteUrl='https://www.lockman.org/'
EXEC add_Resource @version='NASB', @type='revision', @url='https://www.lockman.org/new-american-standard-bible-nasb/more-information-about-nasb-2020/', @official=1, @revision='NASB2020', @siteName='Lockman Foundation', @siteUrl='https://www.lockman.org/'
EXEC add_Resource @version='LSB', @type='version', @url='https://www.lockman.org/legacy-standard-bible-lsb/', @official=0, @siteName='Lockman Foundation', @siteUrl='https://www.lockman.org/'
EXEC add_Resource @version='BBE', @type='read', @url='https://o-bible.com/bbe.html', @official=0
EXEC add_Resource @version='BBE', @type='license', @url='http://www.bible-discovery.com/bible-license-bbe.php', @official=0
EXEC add_Resource @version='EMTV', @type='read', @url='https://majoritytext.com/', @official=1, @revision='EMTV2009'
EXEC add_Resource @version='EMTV', @type='read', @url='https://textusreceptusbibles.com/EMTV', @official=0, @revision='EMTV2009'
EXEC add_Resource @version='EMTV', @type='read', @url='https://ebible.org/engemtv/INT01.htm', @official=0, @revision='EMTV2014', @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='EMTV', @type='file', @url='https://ebible.org/find/show.php?id=engemtv', @official=0, @revision='EMTV2014', @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='EMTV', @type='read', @url='https://nocr.net/hbm/english/engemt/index.php', @official=0, @revision='EMTV2003'
EXEC add_Resource @version='EMTV', @type='file', @url='https://www.crosswire.org/sword/modules/ModInfo.jsp?modName=EMTV', @official=0, @revision='EMTV2012'
EXEC add_Resource @version='FBV', @type='file', @url='https://ebible.org/find/show.php?id=engfbv', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='FBV', @type='read', @url='https://ebible.org/study/?w1=bible&t1=local%3Aengfbv&v1=JN1_1', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='FBV', @type='read', @url='https://ebible.org/engfbv/', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='NET', @type='file', @url='https://bible.org/downloads', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='ESV', @type='read', @url='https://netbible.org/', @official=0, @siteName='NETBible.org', @siteUrl='https://netbible.org/'
EXEC add_Resource @version='HCSB', @type='read', @url='https://netbible.org/', @official=0, @siteName='NETBible.org', @siteUrl='https://netbible.org/'
EXEC add_Resource @version='ISV', @type='read', @url='https://netbible.org/', @official=0, @siteName='NETBible.org', @siteUrl='https://netbible.org/'
EXEC add_Resource @version='MSB', @type='read', @url='https://netbible.org/', @official=0, @siteName='NETBible.org', @siteUrl='https://netbible.org/'
EXEC add_Resource @version='KJV', @type='read', @url='https://netbible.org/', @official=0, @siteName='NETBible.org', @siteUrl='https://netbible.org/'
EXEC add_Resource @version='NASB', @type='read', @url='https://netbible.org/', @official=0, @siteName='NETBible.org', @siteUrl='https://netbible.org/'


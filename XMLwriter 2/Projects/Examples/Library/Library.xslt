<?xml version="1.0"?>

<!--See LibraryXslt.xml for details on how to use this XSLT stylesheet for transformation-->

<!--XSL Stylesheet declaration.
	'xmlns:xsl="http://www.w3.org/1999/XSL/Transform"' indicates that elements with the
	namespace prefix 'xsl:' belong to the http://www.w3.org/1999/XSL/Transform namespace.
	'version="1.0"' indicates the current version of the XSLT W3C specification.-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">

<!--The root template specifies the root node of the output document, in this case 'html'.-->
<xsl:template match="/">

<!--Build the output document, in this case a HTML page.-->
<html>
	<head>
		<!--Create a 'title' element using the contents of 'name'
			(which is a child element of 'library').-->
		<title><xsl:value-of select="/library/name"/></title>
	</head>
	<body>
		<!--Create a 'h1' element using the contents of 'name'
			(which is a child element of 'library').-->
		<h1><xsl:value-of select="/library/name"/></h1>
		<h2>Catalog Listing</h2>
		<blockquote>
			<h3>Books:</h3>
			<blockquote>
				<!--Process the 'book' element (which is a child element of 'library')
					according to its template.-->
				<xsl:apply-templates select="/library/book"/>
			</blockquote>
			<h3>Journals:</h3>
			<blockquote>
				<!--Process the 'journal' element (which is a child element of 'library')
					according to its template.-->
				<xsl:apply-templates select="/library/journal"/>
			</blockquote>
			<h3>Videos:</h3>
			<blockquote>
				<!--Process the 'video' element (which is a child element of 'library')
					according to its template.-->
				<xsl:apply-templates select="/library/video"/>
			</blockquote>
		</blockquote>
	</body>
</html>
</xsl:template>

<!--The following template information applies to 'book' elements.-->
<xsl:template match="book">
	<!--Create a link 'a' with an attribute ="href" which uses the
		content of 'online_url' as the attribute value.-->
	<em><a>
		<xsl:attribute name="href">
			<xsl:value-of select="online_url"/>
		</xsl:attribute>
		<!--Process the 'title' element according to its template.-->
		<xsl:apply-templates select="title"/>
	</a></em>
	<br/><br/>
	<!--Create a table for the 'author' and 'callno' elements.-->
	<table border="1" cellpadding="10">
		<tr>
			<td><b>Author(s):</b></td>
			<!--Process the 'author' element according to its template.-->
			<td><xsl:apply-templates select="author"/></td>
		</tr>
		<tr bgcolor="#CCCCFF">
			<td><b>Call No:</b></td>
			<!--Process the 'callno' element according to its template.-->
			<td><xsl:apply-templates select="callno"/></td>
		</tr>
	</table>
	<br/>
</xsl:template>

<!--The following template information applies to 'video' elements.-->
<xsl:template match="video">
	<em>
		<!--Process the 'title' element according to its template.-->
		<xsl:apply-templates select="title"/>
	</em>
	<br/>
	<br/>
	<!--Create a table for the 'director' and 'callno' elements.-->
	<table border="1" cellpadding="10">
		<tr>
			<td><b>Director:</b></td>
			<!--Process the 'director' element according to its template.-->
			<td><xsl:apply-templates select="director"/></td>
		</tr>
		<tr bgcolor="#CCCCFF">
			<td><b>Call No:</b></td>
			<!--Process the 'callno' element according to its template.-->
			<td><xsl:apply-templates select="callno"/></td>
		</tr>
	</table>
</xsl:template>

<!--The following template information applies to 'journal' elements.-->
<xsl:template match="journal">
	<em>
		<!--Process the 'title' element according to its template.-->
		<xsl:apply-templates select="title"/>
	</em>
	<br/><br/>
	<!--Process the 'date' element according to its template.-->
	Date of Publication: <xsl:apply-templates select="date"/>
	<br/><br/>
	<!--Create a table for the 'callno' element.-->
	<table border="1" cellpadding="10">
		<tr bgcolor="#CCCCFF">
			<td><b>Call No:</b></td>
			<!--Process the 'callno' element according to its template.-->
			<td align="center"><xsl:apply-templates select="callno"/></td>
		</tr>
	</table>
</xsl:template>

<!--Template for 'title' which is a child element of 'book'.-->
<xsl:template match="book/title">
	<!--Apply the following style to 'title'.-->
	<font color="blue">
		<!--Insert the contents of the 'title' element.-->
		<xsl:value-of select="."/>
	</font>
</xsl:template>

<!--Template for 'title' which is a child element of 'journal'.-->
<xsl:template match="journal/title">
	<!--Insert the contents of the 'title' element.-->
	<xsl:value-of select="."/>
</xsl:template>

<!--Template for 'title' which is a child element of 'video'.-->
<xsl:template match="video/title">
	<!--Apply the following style to 'title'.-->
	<font color="green">
		<!--Insert the contents of the 'title' element.-->
		<xsl:value-of select="."/>
	</font>
</xsl:template>

<xsl:template match="first-name">
	<!--Insert the contents of the 'first-name' element.-->
	<xsl:value-of select="."/>
	<!--Insert white space.-->
	<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="last-name">
	<!--Apply the following style to 'last-name'.-->
	<b>
		<!--Insert the contents of the 'last-name' element.-->
		<xsl:value-of select="."/>
	</b>
	<br/>
</xsl:template>

<xsl:template match="callno">
	<!--Apply the following style to 'callno'.-->
	<font face="courier new" color="gray">
		<!--Insert the contents of the 'callno' element.-->
		<xsl:value-of select="."/>
	</font>
</xsl:template>

<xsl:template match="director">
	<!--Insert the contents of the 'director' element.-->
	<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="date">
	<!--Insert the contents of the 'date' element.-->
	<xsl:value-of select="."/>
</xsl:template>

</xsl:stylesheet>

<!--This file was created using XMLwriter v2.0 Beta 2.
	Copyright Wattle Software 2002. All rights reserved.
	http://XMLwriter.net/-->

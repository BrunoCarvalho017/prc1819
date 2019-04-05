<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//inbook"/>
        <xsl:apply-templates select="//inproceedings"/>
        <xsl:apply-templates select="//article"/>
        <xsl:apply-templates select="//misc"/>
        <xsl:apply-templates select="//masterthesis"/>
        <xsl:apply-templates select="//phdthesis"/>
        <xsl:apply-templates select="//book"/>
        <xsl:apply-templates select="//proceedings"/>
    </xsl:template>
    
    <xsl:template match="bibliography/*">
        
    </xsl:template>
    
    <xsl:template match="//inbook">
        <xsl:variable name="id" select="@id"/>
    ### http://www.jrcpubs.org/bibliography/inbook#<xsl:value-of select="$id"/>
        :<xsl:value-of select="$id"/> rdf:type owl:NamedInfividual,
        :title "<xsl:value-of select="title"/>";
        :chapter "<xsl:value-of select="chapter"/>";
        :pages "<xsl:value-of select="pages"/>";
        :publisher "<xsl:value-of select="publisher"/>";
        :year "<xsl:value-of select="year"/>";
        :month "<xsl:value-of select="month"/>"<xsl:choose>
            <xsl:when test="doi">; 
        :doi "<xsl:value-of select="doi"/>".</xsl:when>
            <xsl:otherwise>.</xsl:otherwise>
        </xsl:choose>    
        <xsl:for-each select="author-ref">
        :<xsl:value-of select="$id"/> hasAuthor :<xsl:value-of select="@authorid"/>.
        </xsl:for-each>
        <xsl:for-each select="editor-ref">
        :<xsl:value-of select="$id"/> hasEditor :<xsl:value-of select="@authorid"/>.
        </xsl:for-each>
        <xsl:choose>
            <xsl:when test="editor">
        :<xsl:value-of select="$id"/> :hasEditor :<xsl:value-of select="editor/@id"/>.
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//inproceedings">
        <xsl:variable name="id" select="@id"/>
    ### http://www.jrcpubs.org/bibliography/inproceedings#<xsl:value-of select="$id"/>
        :<xsl:value-of select="$id"/> rdf:type owl:NamedInfividual,
        :year "<xsl:value-of select="year"/>";
        <xsl:choose>
            <xsl:when test="address">; 
        :address "<xsl:value-of select="address"/>";
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="month">
        :month "<xsl:value-of select="month"/>";
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="uri">
        :uri "<xsl:value-of select="uri"/>";
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="isbn">
        :isbn "<xsl:value-of select="isbn"/>";
            </xsl:when>
        </xsl:choose>
        :title "<xsl:value-of select="title"/>";
        :booktitle "<xsl:value-of select="booktitle"/>".
        <xsl:for-each select="author-ref">
        :<xsl:value-of select="$id"/> hasAuthor :<xsl:value-of select="@authorid"/>.
        </xsl:for-each>
        <xsl:for-each select="author">
        :<xsl:value-of select="$id"/> hasAuthor :<xsl:value-of select="@id"/>.
        </xsl:for-each>
        <xsl:for-each select="editor-ref">
        :<xsl:value-of select="$id"/> hasEditor :<xsl:value-of select="@authorid"/>.
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="//misc">
        <xsl:variable name="id" select="@id"/>
    ### http://www.jrcpubs.org/bibliography/misc#<xsl:value-of select="$id"/>
        :<xsl:value-of select="$id"/> rdf:type owl:NamedInfividual,
        <xsl:choose>
            <xsl:when test="doi">
        :doi "<xsl:value-of select="doi"/>";        
            </xsl:when>
        </xsl:choose>
        :howpublished "<xsl:value-of select="howpublished"/>";
        :title "<xsl:value-of select="title"/>";
        :year "<xsl:value-of select="year"/>".
        <xsl:for-each select="author-ref">
        :<xsl:value-of select="$id"/> hasAuthor :<xsl:value-of select="@authorid"/>.
        </xsl:for-each>    
    </xsl:template>
    
    <xsl:template match="//article">
        <xsl:variable name="id" select="@id"/>
    ### http://www.jrcpubs.org/bibliography/article#<xsl:value-of select="$id"/>
        :<xsl:value-of select="$id"/> rdf:type owl:NamedInfividual,
        :journal "<xsl:value-of select="journal"/>";
        <xsl:choose>
            <xsl:when test="volume">
        :volume "<xsl:value-of select="volume"/>";
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="uri">
        :uri "<xsl:value-of select="uri"/>";
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="publisher">
        :publisher "<xsl:value-of select="publisher"/>";
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="issn">
        :issn "<xsl:value-of select="issn"/>";
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="month">
        :month "<xsl:value-of select="month"/>";
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="doi">
        :doi "<xsl:value-of select="doi"/>";
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="number">
        :number "<xsl:value-of select="number"/>";
            </xsl:when>
        </xsl:choose>
        :title "<xsl:value-of select="title"/>";
        :year "<xsl:value-of select="year"/>".
        <xsl:for-each select="author-ref">
        :<xsl:value-of select="$id"/> hasAuthor :<xsl:value-of select="@authorid"/>.
        </xsl:for-each> 
        <xsl:for-each select="author">
        :<xsl:value-of select="$id"/> hasAuthor :<xsl:value-of select="@id"/>.
        </xsl:for-each> 
    </xsl:template>
    
    <xsl:template match="//masterthesis">
        <xsl:variable name="id" select="@id"/>
    ### http://www.jrcpubs.org/bibliography/masterthesis#<xsl:value-of select="$id"/>
        :<xsl:value-of select="$id"/> rdf:type owl:NamedInfividual,
        :title "<xsl:value-of select="title"/>";
        :school "<xsl:value-of select="school"/>;
        :year "<xsl:value-of select="year"/>";
        :month "<xsl:value-of select="month"/>";
        
    </xsl:template>
    
    <xsl:template match="//phdthesis">
        <xsl:variable name="id" select="@id"/>
    ### http://www.jrcpubs.org/bibliography/phdthesis#<xsl:value-of select="$id"/>
        :<xsl:value-of select="$id"/> rdf:type owl:NamedInfividual,
        :title "<xsl:value-of select="title"/>";
        :school "<xsl:value-of select="school"/>";
        :year "<xsl:value-of select="year"/>";
        :address "<xsl:value-of select="address"/>";
        :month "<xsl:value-of select="month"/>";
        :doi "<xsl:value-of select="doi"/>".
        <xsl:for-each select="author-ref">
        :<xsl:value-of select="$id"/> hasAuthor :<xsl:value-of select="@authorid"/>.
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="//book">
        <xsl:variable name="id" select="@id"/>
    ### http://www.jrcpubs.org/bibliography/book#<xsl:value-of select="$id"/>
        :<xsl:value-of select="$id"/> rdf:type owl:NamedInfividual,
        :publisher "<xsl:value-of select="publisher"/>";
        <xsl:choose>
            <xsl:when test="isbn">
        :isbn "<xsl:value-of select="isbn"/>";
            </xsl:when>
        </xsl:choose>
        :title "<xsl:value-of select="title"/>";
        :year "<xsl:value-of select="year"/>";
        :address "<xsl:value-of select="address"/>";
        :month "<xsl:value-of select="month"/>".
        <xsl:for-each select="author">
        :<xsl:value-of select="$id"/> hasAuthor :<xsl:value-of select="@id"/>.
        </xsl:for-each> 
        <xsl:for-each select="author-ref">
        :<xsl:value-of select="$id"/> hasAuthor :<xsl:value-of select="@authorid"/>.
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="//inbook">
        <xsl:variable name="id" select="@id"/>
    ### http://www.jrcpubs.org/bibliography/proceeding#<xsl:value-of select="$id"/>
        :<xsl:value-of select="$id"/> rdf:type owl:NamedInfividual,
        :title "<xsl:value-of select="title"/>";
        <xsl:choose>
            <xsl:when test="isbn">
        :isbn "<xsl:value-of select="isbn"/>";
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="doi">
        :doi "<xsl:value-of select="doi"/>";
            </xsl:when>
        </xsl:choose>
        :publisher "<xsl:value-of select="publisher"/>";
        :chapter "<xsl:value-of select="chapter"/>";
        :pages "<xsl:value-of select="pages"/>";
        :month "<xsl:value-of select="month"/>";
        :year "<xsl:value-of select="year"/>".
        <xsl:for-each select="author-ref">
        :<xsl:value-of select="$id"/> hasAuthor :<xsl:value-of select="@authorid"/>.
        </xsl:for-each>
        <xsl:for-each select="editor-ref">
        :<xsl:value-of select="$id"/> hasEditor :<xsl:value-of select="@authorid"/>.
        </xsl:for-each>
        <xsl:for-each select="editor">
        :<xsl:value-of select="$id"/> hasEditor :<xsl:value-of select="@id"/>.
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
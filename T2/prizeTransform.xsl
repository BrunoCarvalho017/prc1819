<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="prizes/*"/>
        <xsl:apply-templates select="//laureate"/>
    </xsl:template>
    
    <xsl:template match="prizes/*">
        <xsl:variable name="idNobel" select="concat(category,year)"/>
        ### http://www.prizes.org/prize/nobel#<xsl:value-of select="$idNobel"/>
        :<xsl:value-of select="$idNobel"/> rdf:type owl:NamedIndividual ,
        :Prize ;
        :category "<xsl:value-of select="category"/>";
        :year "<xsl:value-of select="year"/>" <xsl:choose>
            <xsl:when test="overallMotivation">; :overallMotivation "<xsl:value-of select="overallMotivation"/>".</xsl:when><xsl:otherwise>.</xsl:otherwise>
        </xsl:choose>
        
        <xsl:for-each select="laureates/laureate">
            :<xsl:value-of select="$idNobel"/> :hasLaureate :<xsl:value-of select="id"/>.
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="//laureate">
        :<xsl:value-of select="id"/> rdf:type owl:NamedInfividual,
        :Author ;
        :firstName ":<xsl:value-of select="firstName"/>";
        :surname ":<xsl:value-of select="surname"/>";
        :share ":<xsl:value-of select="share"/>" <xsl:choose><xsl:when test="motivation">; 
        :motivation <xsl:value-of select="motivation"/>.</xsl:when><xsl:otherwise>.</xsl:otherwise>
        </xsl:choose> 
    </xsl:template>
    
</xsl:stylesheet>
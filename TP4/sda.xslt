<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/lord-of-the-rings">
        <html lang="fr">
            <head>
                <link href="style.css" rel="stylesheet" type="text/css" />
                <title>Le seigneur des Anneaux</title>
            </head>
            <body>
                <h1>Le seigneur des Anneaux</h1>
                <xsl:apply-templates select="./films/film" />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="film">
        <div class="film-div">
            <div class="film-title-div">
                <h2>
                    <xsl:value-of select="./title" />
                </h2>
            </div>
            <div class="film-content-div">
                <div class="film-left-div">
                    <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="./img-source/attribute::value" />
                        </xsl:attribute>
                        <xsl:attribute name="width">200</xsl:attribute>
                    </img>
                    <!-- <img src="..." width="200" /> -->
                </div>
                <div class="film-right-div">
                    <p>
                        <b>Réalisateur : </b><xsl:value-of select="./director"/> 
                    </p>
                    <p>
                        <b>Date de sortie : </b><xsl:value-of select="./release-date"/>
                    </p>
                    <p>
                        <b>Box-office : </b>
                            <xsl:variable name="gain" select="./box-office"/>
                            <!-- <xsl:variable name="gain" select="number($gain)"/> -->
                            <xsl:value-of select="$gain div 1000000"/> Millions USD
                            
                            <!-- <xsl:text> Millions USD</xsl:text>  -->

                            <xsl:choose>
                                <xsl:when test="$gain > 1000000000"> 
                                    <img src="star.png" width="20" />
                                    <img src="star.png" width="20" />
                                    <img src="star.png" width="20" />
                                    <img src="star.png" width="20" />
                                    <img src="star.png" width="20" />
                                </xsl:when>    
                                <xsl:when test="$gain > 500000000"> 
                                    <img src="star.png" width="20" />
                                    <img src="star.png" width="20" />
                                    <img src="star.png" width="20" />
                                    <img src="star.png" width="20" />
                                </xsl:when>    
                                <xsl:when test="$gain > 100000000"> 
                                    <img src="star.png" width="20" />
                                    <img src="star.png" width="20" />
                                    <img src="star.png" width="20" />
                                </xsl:when>    
                                <xsl:when test="$gain > 50000000"> 
                                    <img src="star.png" width="20" />
                                    <img src="star.png" width="20" />
                                </xsl:when>    
                                <xsl:otherwise> 
                                    <img src="star.png" width="20" />
                                </xsl:otherwise>
                            </xsl:choose>   
                            
                     </p>
                    <b>Role principaux :</b>
                    <ul>
                        <xsl:apply-templates select="./roles/role" />
                        <!-- <li><i>...</i> - <a href="...">...</a></li>
                        <li><i>...</i> - <a href="...">...</a></li>
                        <li><i>...</i> - <a href="...">...</a></li>
                        <li><i>...</i> - <a href="...">...</a></li>
                        <li><i>...</i> - <a href="...">...</a></li> -->
                    </ul>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="role">
        <li>
            <i>
                <xsl:value-of select="./attribute::character" />
            </i> - 
            <a>
                <xsl:variable name="id" select="./attribute::actor" />
                <xsl:variable name="actor" select="//actor[./@id=$id]" />
                <xsl:attribute name="href">
                    <xsl:value-of select="$actor/wiki-page" />
                </xsl:attribute>
                 <xsl:value-of select="$actor/name" /> 
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>
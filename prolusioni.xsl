<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="html" encoding="UTF-8" indent="yes" />

<xsl:template match="/"> <!-- Espressione che fa match con tutto il documento -->
    <html>
        <head>
            <title>Progetto Codifica di Testi - Pagg. 4-5 Prolusioni 2</title>
            <link rel="stylesheet" type="text/css" href="style.css" /> 
            <script src="prolusioni.js"></script>           
        </head>
        <body>
            <header>
                <!--Navbar-->
                <div class="navbar">
                    
                    <div class="subnav">
                        <button class="subnavbtn">Introduzione</button>
                        <div class="subnav-content">
                            <a href="#info">Informazioni</a>
                            <a href="#desc">Descrizione</a>
                            <a href="#orig">Origine</a>
                        </div>
                    </div> 
                  
                    <div>
                        <a class="nav" href="#4trasc">Pagina 4</a>
                    </div>

                    <div>
                        <a class="nav" href="#5trasc">Pagina 5</a>
                    </div>

                    <div class="subnav">
                        <button class="subnavbtn">Terminologia</button>
                        <div class="subnav-content">
                            <a href="#legenda">Legenda</a>
                            <a href="#esling">Esempi linguistici</a>
                            <a href="#antro">Antroponimi</a>
                            <a href="#eventi">Date o eventi</a>
                            <a href="#glotto">Glottonimi</a>
                            <a href="#term">Elementi terminologici</a>
                        </div>
                    </div>
                    <div>
                        <a id="bibli" href="#bibl">Bibliografia</a>
                    </div> 
                    <!--Immagine header-->
                    <img id="header" src="immagini/fds.png"></img>
                </div>
                                    
                <!--Titolo che ruota e corrispondente traduzione in italiano-->
                <div class="flip-title">
                    <div class="flip-title-inner">
                        <div class="flip-title-fr">
                            <h1><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" /></h1>
                            <h2><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='sub']" /></h2>
                        </div>
                        <div class="flip-title-it">
                            <h1><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='it']" /></h1>
                            <h2><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='translation-sub']" /></h2>
                        </div>
                    </div>
                </div>
                        
            </header>
            <!--Bottone che permette di tornare all'inizio della pagina-->
            <button onclick="topFunction()" id="myBtn" title="Torna in alto">Torna in alto</button>
            <!--Introduzione al manoscritto -->
            <div class="intro">
                <h1>Introduzione</h1>
                
                <div class="container" id="info">
                    <h2>Informazioni generali sul manoscritto originale</h2>   
                    <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
                    <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc"/>
                </div>       

                <div class="container" id="desc">
                    <h2>Descrizione fisica</h2>   
                    <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc"/>  
                </div>      

                <div class="container" id="orig">
                    <h2>Origine</h2>   
                    <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:history/tei:origin"/>  
                </div> 
            </div> 
            <!--Pagina 4, suddivisa in 3 colonne contenenti img del manoscritto, lente d'ingrandimento e trascrizione/traduzione-->
            <h1 id="4trasc">Pagina 4</h1>

            <div class="container" id="pg4">
                <div class="imgf">
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="//tei:graphic[@xml:id='pag4f']/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="id">pag4f</xsl:attribute>
                    </xsl:element>
                </div>    
                <div id="myresult4" class="img-zoom-result"></div>
                
                <div class="trasc4" id="trasc4">
                    <xsl:apply-templates select="//tei:text//tei:div[@n = '4']/tei:ab[@xml:id!='Per3_Pag4']"/>
                    <p><b>Questa pericope si trova in posizione ruotata di 180°. Si tratta della prima redazione dell'incipit, poi abbandonata.</b><br/>
                    <xsl:apply-templates select="//tei:text//tei:div[@n = '4']/tei:ab[@xml:id='Per3_Pag4']"/>
                    </p>         
                </div>

                <div id="trad4"> 
                    <p id="traduzione4" style="display: none">
                        <xsl:value-of select="//tei:text/tei:body/tei:div/tei:div[@xml:id = 'trad4']"/>
                    </p>
                    <button id="button-trad4" onclick="traduzione4()">Mostra traduzione</button>
                </div>
            </div>    

            <!--Pagina 5, suddivisa in 3 colonne contenenti img del manoscritto, lente d'ingrandimento e trascrizione/traduzione-->
            <h1 id="5trasc">Pagina 5</h1>

            <div class="container" id="pg5">
                <div id="imgfronte" class="imgf">
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="//tei:graphic[@xml:id='pag5f']/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="id">pag5f</xsl:attribute>
                    </xsl:element>   
                </div>  
                
                <div id="imgretro" style="display: none">
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="//tei:graphic[@xml:id='pag5r']/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="id">pag5r</xsl:attribute>
                    </xsl:element>
                    
                </div>  
                
                <div id="myresult5" class="img-zoom-result"></div>
                
                <div class="trasc5" id="trasc5">
                    <xsl:apply-templates select="//tei:text//tei:div[@n = '5']"/>
                </div>

                <div id="trad5">
                    <p id="traduzione5" style="display: none">
                        <xsl:value-of select="//tei:text/tei:body/tei:div/tei:div[@xml:id = 'trad5']"/>
                    </p>
                    <button id="button-trad5" onclick="traduzione5()">Mostra traduzione</button>
                </div>
                <!--Bottone per mostrare il retro di pagina 5-->
                <button id="mostraretro" onclick="mostraRetro()">Mostra retro</button>
            </div> 

            <!--Terminologia-->
            <h1>Terminologia</h1>

            <div class="container" id="legenda">
                <h2>Legenda</h2>
                <ul>   
                    <li><a href="#esling"><mark id="es">Esempi linguistici</mark></a></li><br/>
                    <li><a href="#antro"><mark id="an">Antroponimi</mark></a></li><br/>
                    <li><a href="#eventi"><mark id="ev">Date o eventi databili</mark></a></li><br/>
                    <li><a href="#glotto"><mark id="gl">Glottonimi</mark></a></li><br/>
                    <li><a href="#term"><mark class="termini">Elementi terminologici</mark></a></li><br/>
                    <li style="text-decoration: line-through"> Cancellature </li><br/>
                    <li>( ) = Espansioni e regolarizzazioni dei trascrittori/codificatori</li><br/>
                    <li style="text-decoration: underline; text-decoration-color: red"> Aggiunte </li><br/>
                    <li><b style="color: orange">Sostituzioni</b></li>
                </ul>
            </div>

            <div class="container" id="esling">
                <h2>Esempi linguistici</h2>
                <ul>
                    <xsl:for-each select="//tei:foreign"> 
                        <xsl:sort data-type="text" order="ascending" select="."/>      
                        <li><xsl:apply-templates/></li>                           
                    </xsl:for-each>
                </ul>                 
            </div>

            <div class="container" id="antro">
                <h2>Antroponimi</h2>
                <ul>
                    <xsl:apply-templates select="//tei:list[@type='Antroponimi']"/>
                </ul>
            </div>

            <div class="container" id="eventi">
                <h2>Date o eventi databili</h2>
                <ul>      
                    <li>
                        <xsl:variable name="x" select="//tei:text/tei:body//tei:date/text()"/>
                        <xsl:variable name="y" select="//tei:text/tei:body//tei:date/tei:subst//tei:add"/>
                        <xsl:variable name="j" select="//tei:text/tei:body//tei:date/text()[2]"/>
                        <xsl:variable name="z" select="//tei:text/tei:body//tei:date/tei:subst[2]//tei:add"/>
                        <xsl:variable name="w" select="//tei:text/tei:body//tei:date/text()[3]"/>
                        <xsl:value-of select="concat($x, $y, $j, $z, $w)"/> 
                    </li>                           
                </ul>                 
            </div>  
            
            <div class="container" id="glotto">
                <h2>Glottonimi</h2>
                <ul>
                    <xsl:apply-templates select="//tei:list[@type='Glottonimi']"/>
                </ul>
            </div>

            <div class="container" id="term">
                <h2>Elementi terminologici</h2>
                <ul>
                    <xsl:apply-templates select="//tei:list[@type='ElementiTerminologici']"/>
                </ul>
            </div>

            <!--Bibliografia-->
            <h1>Bibliografia</h1>
            <div class="container" id="bibl">
                <ul>
                    <xsl:apply-templates select="//tei:listBibl"/>
                </ul>
            </div>
            <!--Footer-->
            <footer>
                <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt"/>
            </footer>

        </body>
        
    </html>
</xsl:template>

<!--Templates-->

<!--Introduzione al manoscritto-->
<xsl:template match="tei:titleStmt">
    <p> Il titolo originale del manoscritto è
        <xsl:value-of select="tei:title[@type='main']"/>
        <xsl:value-of select="tei:title[@type='sub']"/>.     
    </p>
    <p> L'autore del documento è
        <xsl:value-of select="tei:author"/>.
    </p>
</xsl:template>

<xsl:template match="tei:sourceDesc">
    <p> Il manoscritto si trova attualmente presso la <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:repository"/>,
     in <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:placeName/tei:country"/>, nella collezione degli <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:collection"/>.
    </p>
    <p>
    Il codice di inventario del manoscritto è <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:idno"/>.
    </p>
</xsl:template>

<xsl:template match="tei:physDesc">
    <p> Il documento è composto da <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:support"/>, 
        <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:extent/text()"/>
    </p>
    <p> <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:foliation"/>
        <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:condition"/>
    </p>   
    <p><xsl:value-of select="tei:handDesc/tei:p[last()]"/>
    </p>
</xsl:template>

<xsl:template match="tei:history">
    <p><xsl:value-of select="tei:origin"/></p>      
</xsl:template>

<!--divisione in righe-->
<xsl:template match="//tei:lb">
    <xsl:for-each select="self::node()">
        <br/>
    </xsl:for-each>
</xsl:template>

<!--Regolarizzazioni messe tra parentesi-->
<xsl:template match="//tei:reg[text()]">
    <span class="reg"> (<xsl:apply-templates/>)</span>
</xsl:template>

<!-- Evidenzio termini -->
<xsl:template match="//tei:term">
    <span class="termini"><xsl:apply-templates/></span>
</xsl:template>

<!-- Evidenzio esempi linguistici -->
<xsl:template match="//tei:foreign">
    <span class="esling"><xsl:apply-templates/></span>
</xsl:template>

<!-- Evidenzio antroponimi -->
<xsl:template match="//tei:name[@type='anthroponym']">
    <span class="antroponimi"><xsl:apply-templates/></span>
</xsl:template>

<!-- Evidenzio date e eventi -->
<xsl:template match="//tei:date[@xml:id='data']">
    <span class="date"><xsl:apply-templates/></span>
</xsl:template>

<!-- Evidenzio glottonimi -->
<xsl:template match="//tei:lang">
    <span class="glott"><xsl:apply-templates/></span>
</xsl:template>

<!-- Cancellature -->
<xsl:template match="//tei:del">
    <span class="del"><xsl:apply-templates/></span>
</xsl:template>

<!-- Espansioni messe tra parentesi -->
<xsl:template match="//tei:expan">
    <span class="expan"> (<xsl:apply-templates/>)</span>
</xsl:template>

<!-- Aggiunte -->
<xsl:template match="//tei:add">
    <span class="add"><xsl:apply-templates/></span>
</xsl:template>

<!-- Sostituzioni -->
<xsl:template match="//tei:subst">
    <span class="subst"><b><xsl:apply-templates/></b></span>
</xsl:template>

<!--Lista di Antroponimi-->
<xsl:template match="//tei:list[@type='Antroponimi']"> 
    <xsl:for-each select="tei:item">
        <xsl:sort data-type="text" order="ascending" select="."/>
        <xsl:element name="li">
            <b><xsl:value-of select="tei:label/tei:name[@xml:lang='fr']"/></b>
            <xsl:text> : </xsl:text>    
            <xsl:value-of select="tei:desc"/>        
        </xsl:element>           
    </xsl:for-each>   
</xsl:template>


<!--Lista di Glottonimi-->
<xsl:template match="//tei:list[@type='Glottonimi']"> 
    <xsl:for-each select="tei:item">
        <xsl:sort data-type="text" order="ascending" select="."/>
        <xsl:element name="li">
            <b><xsl:value-of select="tei:label/tei:lang[@xml:lang='fr']"/></b>
            <xsl:text> : </xsl:text>    
            <xsl:value-of select="tei:desc"/>        
        </xsl:element>           
    </xsl:for-each>   
</xsl:template> 

<!--Lista di Elementi terminologici-->
<xsl:template match="//tei:list[@type='ElementiTerminologici']"> 
    <xsl:for-each select="tei:item">
        <xsl:sort data-type="text" order="ascending" select="."/>
        <xsl:element name="li">
            <b><xsl:value-of select="tei:label/tei:term[@xml:lang='fr']"/></b>
            <xsl:text> : </xsl:text>    
            <xsl:value-of select="tei:gloss"/>        
        </xsl:element>           
    </xsl:for-each>   
</xsl:template> 

<!--Bibliografia-->
<xsl:template match="//tei:listBibl"> 
    <xsl:for-each select="tei:bibl">
        <xsl:sort data-type="text" order="ascending" select="."/>
        <xsl:element name="li">
            <xsl:for-each select="tei:author">
                <xsl:apply-templates />
                <xsl:text> , </xsl:text>
            </xsl:for-each>   
            <xsl:for-each select="tei:title">
            <i>
                <xsl:apply-templates />
                <xsl:text> , </xsl:text>
            </i> 
            </xsl:for-each>
            <xsl:for-each select="tei:pubPlace">
                <xsl:apply-templates />
                <xsl:text> , </xsl:text>
            </xsl:for-each> 
            <xsl:value-of select="tei:publisher"/>
            <xsl:text> , </xsl:text>  
            <xsl:value-of select="tei:date"/> 
            <xsl:text> . </xsl:text>     
        </xsl:element>           
    </xsl:for-each>   
</xsl:template> 

<!--Footer-->
<xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt">
    <xsl:value-of select="tei:edition"/><br/>
    <xsl:for-each select="tei:respStmt"> 
        <xsl:apply-templates/><br/>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>



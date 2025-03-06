<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<xsl:output encoding="UTF-8" method="html" doctype-system="about:legacy-compat"/>

<!-- Plantilla ppal de gastrobar -->
<xsl:template match="/gestionParque">    
    <html lang="es">
        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <meta name="description" content="Página principal" />
            <title>Gastrobar</title>
        </head>

        <body>
            <header>
                <img src= "../img/logotipo.png" alt= "Reservas" />
                <a href="gastrobar.xml">Gastrobar</a>
                <a href="atracciones.xml">Atracciones</a>
                <a href="eventos.xml">Eventos</a>
            </header>
            
            <main id="gastrobar">
                <h1>ENTRANTES</h1>

                <xsl:apply-templates select="gastrobar/platos/plato[@categoria='Entrante']"/>
                
            </main>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>

<!-- Plantilla: platos -->
<xsl:template match="plato">
    <xsl:variable name="urlFoto" select="concat('../img/', foto)"/>
    <article class="articulo">
        <img class="imagen">
            <xsl:attribute name="src">
                <xsl:value-of select="$urlFoto"/>
            </xsl:attribute>
        </img>
            
        <xsl:if test="starts-with(@codigo, 'A')">
            <img src="../img/icono-novedad.png" class="novedad-icono"/>		
        </xsl:if>

        <h2><xsl:value-of select="nom_plato"/></h2>
        <h3><xsl:value-of select="precio"/>€</h3>
    </article>
</xsl:template>


</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<xsl:output encoding="UTF-8" method="html" doctype-system="about:legacy-compat"/>

<!-- Plantilla ppal de eventos -->
<xsl:template match="/gestionParque">
    
    <html lang="es">
        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <meta name="description" content="Página principal" />
            <title>Eventos</title>
        </head>

        <body>
            <header>
                <img src= "../img/logotipo.png" alt= "Reservas" />
                <a href="gastrobar.xml">Gastrobar</a>
                <a href="atracciones.xml">Atracciones</a>
                <a href="eventos.xml">Eventos</a>
            </header>
            
            <main>
            <xsl:variable name="year" select="2024"/>
                <h1>Eventos del <xsl:value-of select="$year"/></h1>

                <xsl:apply-templates select="eventos/evento[starts-with(./fechaHora, '2024')]">
                     <xsl:sort select="fechaHora" order="descending" data-type="text"/>
                </xsl:apply-templates>
            </main>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>

<!-- Plantilla: eventos -->
<xsl:template match="evento">
    <article class="eventos">
    <xsl:variable name="numEventos" select="count(comentarios/comentario)"/>
        <h4><xsl:value-of select="descripcion"/> - <xsl:value-of select="$numEventos"/> Comentarios</h4>
        <ul>
            <xsl:apply-templates select="comentarios/comentario"/>
        </ul>
    </article>
</xsl:template>

<!-- Plantilla: comentario del evento -->
<xsl:template match="comentario">
    <li><xsl:value-of select="."/></li>
</xsl:template>


</xsl:stylesheet>

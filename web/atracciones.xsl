<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    * Nombre: Zuriñe Galán 
    * Fecha: 06/03/2025 
    * Modulo: LMSGI. 
    * UD: UD4 Transformación de datos. 
    * Tarea: LMSGI04 Tarea de evaluación 02 - XSLT 
    * Descripción: Plantilla de atracciones. Muestra en un página html la información correspondiente a las atracciones del archivo xml.

    * Enlace a la página: https://zurige.github.io/lmsgi_ud04
    * Enlace a la autoevaluación: 
    https://docs.google.com/document/d/13jelUVwhXHtS1Go8iKn7TOns3itz1j1Cc_CG1kwwhJo/edit?usp=sharing
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<xsl:output encoding="UTF-8" method="html" doctype-system="about:legacy-compat"/>

<!-- Plantilla ppal de atracciones -->
<xsl:template match="/gestionParque">
    
    <html lang="es">
        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <meta name="description" content="Página principal" />
            <title>Atracciones</title>
        </head>

        <body>
            <header>
                <img src= "../img/logotipo.png" alt= "Reservas" />
                <a href="gastrobar.xml">Gastrobar</a>
                <a href="atracciones.xml">Atracciones</a>
                <a href="eventos.xml">Eventos</a>
            </header>
            
            <main>
                <h1>ATRACCIONES</h1>

                <table>
                    <tr>
                        <th>ATRACCION</th>
                        <th>EDAD MINIMA</th>
                        <th>PESO MAXIMO</th>
                    </tr>
				
                    <xsl:apply-templates select="atracciones/atraccion"/>
			    </table>

                
            </main>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>

<!-- Plantilla: atracciones -->
<xsl:template match="atraccion">
    <xsl:variable name="url" select="concat('https://es.wikipedia.org/wiki/', translate(nombre, ' ', '_'))"/>
    <tr>
        <td>
            <a target="_blank">
                <xsl:attribute name="href">
                    <xsl:value-of select="$url"/>
                </xsl:attribute>
                <xsl:value-of select="nombre"/>
            </a>
        </td>
        <td> <xsl:value-of select="restricciones/edadMinima"/></td>
        <td> <xsl:value-of select="restricciones/pesoMaximo"/></td>
    </tr>
</xsl:template>


</xsl:stylesheet>

<?xml version='1.0' encoding='ISO-8859-1'?>

<!-- 
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 -->

<!-- 
  Simple transform of Solr query results to HTML
 -->
<xsl:stylesheet version='1.0'
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
>
<xsl:variable name="link"></xsl:variable>
<xsl:param name="query"></xsl:param>

  <xsl:output media-type="text/html; charset=ISO-8859-1" encoding="ISO-8859-1"/> 

  <xsl:variable name="nres" select="concat(' (',response/result/@numFound,' documenti)')"/>
  
  <xsl:template match='/'>
        <h2>Risultato della ricerca: <b><xsl:value-of select="$query"/></b> <xsl:value-of select="$nres"/></h2>
		<xsl:if test="response/result/@numFound > 10">
			(vengono visualizzati i primi 10 risultati più rilevanti)
		</xsl:if>
		<ul>
			<xsl:apply-templates select="response/result/doc"/>
		</ul>
  </xsl:template>
  
  
  <xsl:template match="doc">
	<li>
	<xsl:element name="a">
    <xsl:attribute name="href">
        <xsl:value-of select="str[@name='url']"/>
    </xsl:attribute>
    <xsl:value-of select="arr[@name='title']/str"/>
	</xsl:element>	
	<xsl:variable name="link" select="str[@name='url']"/>
	<xsl:apply-templates select="/response/lst/lst[@name=$link]"/>
	</li>
  </xsl:template>
  
  <xsl:template match="lst">
	<p>
	 <xsl:apply-templates/>
	</p>
  </xsl:template>
  
  <xsl:template match="b">
	<b>
	 <xsl:apply-templates/>
	</b>
  </xsl:template>
    
</xsl:stylesheet>

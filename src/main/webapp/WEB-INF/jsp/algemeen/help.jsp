<%--
Copyright 2007-2011 B3Partners BV.

This program is distributed under the terms
of the GNU General Public License.

You should have received a copy of the GNU General Public License
along with this software. If not, see http://www.gnu.org/licenses/gpl.html

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--%>
<%@include file="/WEB-INF/jsp/taglibs.jsp" %>

<c:if test="${not empty tekstBlokken}">
    <!-- Loop door tekstblokken heen -->
    <div class="tegels">
        <c:forEach var="tb" varStatus="status" items="${tekstBlokken}">
            <div class="blockwrapper" title="${tb.titel}">
                <c:set var="style" value="" />
                <c:if test="${!empty tb.kleur}">
                    <c:set var="style" value="${style}background-color:${tb.kleur};" />
                </c:if>

                <c:if test="${!empty tb.hoogte && tb.hoogte != 0}">
                    <c:set var="style" value="${style}height:${tb.hoogte}px;" />
                </c:if>

                <c:if test="${!empty style}">
                    <c:set var="style" value=" style=\"${style}\"" />
                </c:if>
                <div class="tegel"${style}>
                    <c:choose>
                        <c:when test="${tb.toonUrl}">
                            <iframe class="iframe_tekstblok" id="iframe_${tb.titel}" name="iframe_${tb.titel}" frameborder="0" src="${tb.url}"></iframe>
                        </c:when>
                        <c:otherwise>
                            ${tb.tekst}
                            <c:if test="${!empty tb.url}">
                                <a href="${tb.url}" target="_new">${tb.url}</a>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:forEach>
    </div>
</c:if>

<div id="content_style">

    <!-- Gewone help pagina tonen als er geen tekstblokken zijn -->
    <c:if test="${empty tekstBlokken}">
        <div class="content_block">
            <div class="content_title">B3P Gisviewer configuratie Help</div>
            
            <div class="inleiding_body">
                <p>
                Via de gisviewerconfig webapplicatie kunt u bepalen hoe de
                kaartlagen getoond worden aan de gisviewer gebruiker. Deze gebruiker
                ziet alleen de kaarten waar hij/zij rechten op heeft gekregen via
                kaartenbalie.
                <p/>
                
                <table>
                    <tr>
                        <td><img style="border: 0;" src="images/pdf.png" border="0" alt="PDF icon" title="PDF icon"></td>
                        <td><a href="http://source.b3partners.nl/docs/4.0/Beheerhandleiding_Datastorelinker_4.0.pdf" target="_blank">Beheerhandleiding Datastorelinker</a></td>
                    </tr>
                    <tr>
                        <td><img style="border: 0;" src="images/pdf.png" border="0" alt="PDF icon" title="PDF icon"></td>
                        <td><a href="http://source.b3partners.nl/docs/4.0/Beheerhandleiding_FAQ_en_Uitleg_4.0.pdf" target="_blank">Veelgestelde vragen en uitleg B3P GIS Suite</a></td>
                    </tr>
                    <tr>
                        <td><img style="border: 0;" src="images/pdf.png" border="0" alt="PDF icon" title="PDF icon"></td>
                        <td><a href="http://source.b3partners.nl/docs/4.0/Beheerhandleiding_Gisviewer_4.0.pdf" target="_blank">Beheerhandleiding Gisviewer</a></td>
                    </tr>
                    <tr>
                        <td><img style="border: 0;" src="images/pdf.png" border="0" alt="PDF icon" title="PDF icon"></td>
                        <td><a href="http://source.b3partners.nl/docs/4.0/Beheerhandleiding_Gisviewerconfig_4.0.pdf" target="_blank">Beheerhandleiding Gisviewerconfig</a></td>
                    </tr>
                    <tr>
                        <td><img style="border: 0;" src="images/pdf.png" border="0" alt="PDF icon" title="PDF icon"></td>
                        <td><a href="http://source.b3partners.nl/docs/4.0/Beheerhandleiding_Kaartenbalie_4.0.pdf" target="_blank">Beheerhandleiding Kaartenbalie</a></td>
                    </tr>
                </table>
                
            </div>
        </div>
    </c:if>
</div>
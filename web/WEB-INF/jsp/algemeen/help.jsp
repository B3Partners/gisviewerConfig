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

<div id="content_style">

    <!-- Loop door tekstblokken heen -->
    <c:forEach var="tb" varStatus="status" items="${tekstBlokken}">
        <div class="content_block">
            <div class="content_title"><c:out value="${tb.titel}"/></div>

            <!-- Indien toonUrl aangevinkt is dan inhoud van url in iFrame tonen -->
            <c:if test="${tb.toonUrl}">
                <iframe class="iframe_tekstblok" id="iframe_${tb.titel}" name="iframe_${tb.titel}" frameborder="0" src="${tb.url}"></iframe>
            </c:if>

            <!-- Anders gewoon de tekst tonen van tekstblok -->
            <c:if test="${!tb.toonUrl}">
            <div class="inleiding_body">
                ${tb.tekst}

                <c:if test="${!empty tb.url}">
                Meer informatie: <a href="${tb.url}" target="_new">${tb.url}</a>
                </c:if>

                <c:if test="${tb.toonUrl}">
                    <iframe id="iframe_${tb.titel}" name="iframe_${tb.titel}" frameborder="0" src="${tb.url}"></iframe>
                </c:if>
            </div>
            </c:if>
        </div>
    </c:forEach>

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
                        <td><a href="http://source.b3partners.nl/docs/Beheerhandleiding_GIS_Suite_30.pdf" target="_blank">Bekijk de Beheerhandleiding voor GIS Suite 3.0</a></td>
                    </tr>
                </table>
                
            </div>
        </div>
    </c:if>
</div>
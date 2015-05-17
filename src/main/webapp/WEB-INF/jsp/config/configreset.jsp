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

<div class="content_block">
    <tiles:insert definition="actionMessages"/>

    <div class="content_body">

        <div id="rechten_block">
            <div class="content_title">Reset rechten</div>

            <h3>Wanneer de rechten resetten ?</h3>

            <ul>
                <li>Na toevoegen van een WMS via Kaartenbalie;</li>
                <li>Na bewerken van een WMS via Kaartenbalie;</li>
                <li>Na bewerken van individuele rechten via Kaartenbalie;</li>
            </ul>
            
            <p style="font-size: 1.3em; color: blue;">
                Indien de rechten op de harde schijf worden opgslagen is 1x 
                resetten via een van deze twee links voldoende.
            </p>
            
            <p>
                <html:link page="/reset.do?configCache=t&amp;cachelifecycle=0"><fmt:message key="rechtenconfig.label"/></html:link>
                    <a href="#" onclick="return showHelpDialog('help_rechtenconfig');">(?)</a>
                <div id="help_rechtenconfig" style="display: none;" title="<fmt:message key="rechtenconfig.label"/>">
                <p><fmt:message key="rechtenconfig.uitleg"/></p>
            </div>
            </p>

            <c:set var="requestURI" value="${fn:split(requestScope['javax.servlet.forward.request_uri'], '/')}" />
            <p>
                <a href="${absoluteURIPrefix}/gisviewer/reset.do?cache=t&amp;cachelifecycle=0"><fmt:message key="rechtenviewer.label"/></a>
                <a href="#" onclick="return showHelpDialog('help_rechtenviewer');">(?)</a>
            <div id="help_rechtenviewer" style="display: none;" title="<fmt:message key="rechtenviewer.label"/>">
                <p><fmt:message key="rechtenviewer.uitleg"/></p>
            </div>
            </p>
            
            <h3>Wanneer opzoeklijsten rechten resetten ?</h3>

            <ul>
                <li>Indien een opzoeklijst wordt gebruikt in een zoekingang;</li>  
                <li>Als het resultaat van een opzoeklijst is gewijzigd;</li>
            </ul>

            <p>
                <a href="${absoluteURIPrefix}/gisviewer/reset.do?opzoeklijst=t"><fmt:message key="rechtenopzoeklijst.label"/></a>
                <a href="#" onclick="return showHelpDialog('help_rechtenopzoeklijst');">(?)</a>
            <div id="help_rechtenopzoeklijst" style="display: none;" title="<fmt:message key="rechtenopzoeklijst.label"/>">
                <p><fmt:message key="rechtenopzoeklijst.uitleg"/></p>
            </div>
            </p>

        </div>
    </div>
</div>

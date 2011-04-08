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
    <div class="content_title">Reset</div>

    <tiles:insert definition="actionMessages"/>

<div class="content_body">

    <div id="rechten_block">
        <div class="content_title">Rechten</div>
        <p>
            <p>
                <html:link page="/reset.do?configCache=t&amp;cachelifecycle=0">Rechten opnieuw ophalen voor configuratie</html:link>
                <a href="#" onclick="return showHelpDialog('help_rechtenconfig');">(?)</a>
                <div id="help_rechtenconfig" style="display: none;" title="<fmt:message key="rechtenconfig.label"/>">
                    <p><fmt:message key="rechtenconfig.uitleg"/></p>
                </div>
            </p>
            <c:set var="requestURI" value="${fn:split(requestScope['javax.servlet.forward.request_uri'], '/')}" />
            <p>
                <a href="${absoluteURIPrefix}/gisviewer/reset.do?cache=t&amp;cachelifecycle=0">Reset cache voor de gisviewer</a>
                <a href="#" onclick="return showHelpDialog('help_rechtenviewer');">(?)</a>
                <div id="help_rechtenviewer" style="display: none;" title="<fmt:message key="rechtenviewer.label"/>">
                    <p><fmt:message key="rechtenviewer.uitleg"/></p>
                </div>
            </p>
            <p>
                <a href="${absoluteURIPrefix}/gisviewer/reset.do?opzoeklijst=t">Reset opzoeklijsten voor de gisviewer</a>
                <a href="#" onclick="return showHelpDialog('help_rechtenopzoeklijst');">(?)</a>
                <div id="help_rechtenopzoeklijst" style="display: none;" title="<fmt:message key="rechtenopzoeklijst.label"/>">
                    <p><fmt:message key="rechtenopzoeklijst.uitleg"/></p>
                </div>
            </p>
       <p/>
        </div>
    </div>
</div>

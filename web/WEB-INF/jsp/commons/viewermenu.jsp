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

<c:set var="requestURI" value="${fn:split(requestScope['javax.servlet.forward.request_uri'], '/')}" />
<c:set var="requestJSP" value="${requestURI[fn:length(requestURI) - 1]}" />
<div id="topmenu">
    <ul class="menu">
        <c:set var="stijlklasse" value="menulink" />
        <c:if test="${requestJSP eq 'index.do' || requestJSP eq ''}">
            <c:set var="stijlklasse" value="activemenulink" />
        </c:if>
        <li><html:link page="/index.do" module="" styleClass="${stijlklasse}"><fmt:message key="commons.configmenu.home"/></html:link></li>

        <c:set var="stijlklasse" value="menulink" />
         <c:if test="${requestJSP eq 'reset.do' || requestJSP eq ''}">
            <c:set var="stijlklasse" value="activemenulink" />
        </c:if>
        <li><html:link page="/reset.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.topmenu.reset"/></html:link></li>
        
        <c:set var="stijlklasse" value="menulink" />
        <c:if test="${requestJSP eq 'configApplicatie.do'}">
            <c:set var="stijlklasse" value="activemenulink" />
        </c:if>
        <li><html:link page="/configApplicatie.do" module="" styleClass="${stijlklasse}"><fmt:message key="commons.configmenu.applicatie"/></html:link></li>

        <c:set var="stijlklasse" value="menulink" />
        <c:if test="${requestJSP eq 'configCMS.do'}">
            <c:set var="stijlklasse" value="activemenulink" />
        </c:if>
        <li><html:link page="/configCMS.do" module="" styleClass="${stijlklasse}"><fmt:message key="commons.configmenu.cms"/></html:link></li>

        <c:set var="stijlklasse" value="menulink" />
        <c:if test="${requestJSP eq 'configThema.do'}">
            <c:set var="stijlklasse" value="activemenulink" />
        </c:if>
        <li><html:link page="/configThema.do" module="" styleClass="${stijlklasse}"><fmt:message key="commons.topmenu.kaartbib"/></html:link></li>

        <c:set var="stijlklasse" value="menulink" />
        <c:if test="${requestJSP eq 'help.do'}">
            <c:set var="stijlklasse" value="activemenulink" />
        </c:if>
        <li><html:link target="_blank" page="/help.do" module="" styleClass="${stijlklasse}"><fmt:message key="commons.configmenu.help"/></html:link></li>
    </ul>
</div>
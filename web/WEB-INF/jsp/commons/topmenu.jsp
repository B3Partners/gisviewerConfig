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
<%@ page isELIgnored="false"%>

<div id="topmenu">
    <c:set var="requestURI" value="${fn:split(requestScope['javax.servlet.forward.request_uri'], '/')}" />
    <c:set var="requestJSP" value="${requestURI[fn:length(requestURI) - 1]}" />

    <c:if test="${pageContext.request.remoteUser != null}">
        <c:set var="stijlklasse" value="menulink" />
        <html:link page="/configThema.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.topmenu.kaartbib"/></html:link>
        
        <c:set var="stijlklasse" value="menulink" />
        <html:link page="/configRolPrio.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.topmenu.configuratie"/></html:link>
        
        <c:set var="stijlklasse" value="menulink" />
        <html:link page="/index.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.topmenu.reset"/></html:link>
    </c:if>

    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'index.do' or requestJSP eq 'indexlist.do' or requestJSP eq ''}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link page="/index.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.topmenu.home"/></html:link>
</div>
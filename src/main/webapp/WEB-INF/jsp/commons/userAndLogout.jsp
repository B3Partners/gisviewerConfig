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

<c:choose>
    <c:when test="${pageContext.request.remoteUser != null}">
        <script type="text/javascript">
            function logout() {
                var kburl = '${kburl}';
                var logoutLocation = '/kaartenbalie/logout.do'
                if (kburl!='') {
                    var pos = kburl.lastIndexOf("services");
                    if (pos>=0) {
                        logoutLocation = kburl.substring(0,pos) + "logout.do";
                    }
                }
                lof = document.getElementById('logoutframe');
                lof.src=logoutLocation;
                location.href = '<html:rewrite page="/logout.do" module=""/>';
            };
        </script>
        <div id="logoutvak" style="display: none;">
            <iframe src="" id="logoutframe" name="logoutframe"></iframe>
        </div>
        <fmt:message key="commons.userandlogout.ingelogdals"/><c:out value="${pageContext.request.remoteUser}"/> | <a href="#"  onclick="javascript:logout();"><fmt:message key="commons.userandlogout.uitloggen"/></a>
    </c:when>
    <c:otherwise>
        <html:link page="/login.do" module=""><fmt:message key="commons.userandlogout.inloggen"/></html:link>
    </c:otherwise>
</c:choose>

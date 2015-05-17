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
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

<%@taglib uri="http://commons.b3p.nl/jstl-functions" prefix="f" %>

<%@page import="java.net.URL"%>

<c:set var="absoluteURIPrefix">
<%
    boolean needPort = "http".equals(request.getScheme()) && request.getServerPort() != 80
    || "https".equals(request.getScheme()) && request.getServerPort() != 443;

    URL u;

    if (needPort) {
        u = new URL(request.getScheme(), request.getServerName(), request.getServerPort(), "");
    } else {
        u = new URL(request.getScheme(), request.getServerName(), "");
    }

    out.print(u.toString());
%>
</c:set>

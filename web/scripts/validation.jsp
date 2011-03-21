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
<%@page pageEncoding="UTF-8"%>
<%@page contentType="text/javascript" %>
<%@page session="false"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%-- Zorg ervoor dat deze pagina wordt gecached door de browser door een expires 
     header te zetten voor 24 uur na de huidige tijd. 
--%>
<% response.setDateHeader("Expires", System.currentTimeMillis() + (1000 * 60 * 60 * 24));%>

<html:javascript dynamicJavascript="false" />
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
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html:html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Expires" content="-1">
        <meta http-equiv="Cache-Control" content="max-age=0, no-store">

        <title><tiles:insert name='title'/> - B3P GIS Viewer</title>
        <link href="styles/gisviewer_popup.css" rel="stylesheet" type="text/css">
        <link href="styles/jquery-ui-1.8.10.custom.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="<html:rewrite page='/scripts/validation.jsp' module=''/>"></script>
        <script type="text/javascript" src="scripts/jquery-1.5.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script type="text/javascript" src="<html:rewrite page='/scripts/commonfunctions.js' module=''/>"></script>     
    </head>
    <body style="background-color: #ffffff;">
        <div id="content">            
            <tiles:insert attribute="content" />
        </div>
    </body>
</html:html>
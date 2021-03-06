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
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html> <!--<![endif]-->
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Expires" content="-1">
        <meta http-equiv="Cache-Control" content="max-age=0, no-store">

        <title><tiles:insert name='title'/> - B3P GIS Viewer</title>
        <link href="styles/jquery.dataTables.css" rel="stylesheet" type="text/css">
        <link href="styles/gisviewer_base.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="<html:rewrite page='/scripts/validation.jsp' module=''/>"></script>
        <script type="text/javascript" src="scripts/jquery-1.5.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.qtip.min.js"></script>
        <script type="text/javascript" src="<html:rewrite page='/scripts/jquery.bgiframe.min.js' module=''/>"></script>
        <script type="text/javascript" src="<html:rewrite page="/scripts/jquery.dataTables.min.js"/>"></script>
        <script type="text/javascript" src="<html:rewrite page='/scripts/commonfunctions.js' module=''/>"></script>
        <script type="text/javascript">
            attachOnload(checkLocation);
        </script>

    </head>
    <body class="configbody">
        <div id="wrapper">
            <div id="header"><div id="header_content"><tiles:insert attribute="menu" /></div></div>
            <div id="content_normal">
                <div id="content">
                    <tiles:insert attribute="content" />
                </div>
            </div>
        </div>
        <div id="footer"><div id="footer_content">
                <div id="footer_tekst_links" class="footer_tekst">This program is distributed under the terms of the <a class="gpl_link" href="http://www.gnu.org/licenses/gpl.html">GNU General Public License</a></div>
                <div id="footer_tekst_rechts" class="footer_tekst">B3P GIS Suite 4.2</div>
        </div></div>
        <!--[if lte IE 7]>
        <script type="text/javascript">
            $j("#header_content").find(".menu").children('li').each(function() {
                $j(this).width($j(this).find("a").outerWidth());
            });
            $j("#header_content").find(".menu").css('visibility', 'visible');
            $j("#header").css({"position": "relative", "z-index": 300});
            $j("#content_normal").css({"z-index": 200});
        </script>
        <![endif]-->
    </body>
</html>
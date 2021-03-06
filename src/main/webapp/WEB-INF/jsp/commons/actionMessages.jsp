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

<div class="messages"> 
    <html:messages id="message" message="true" >
        <div id="error">
            <c:out value="${message}" escapeXml="false"/>
        </div>
    </html:messages> 
    <html:messages id="message" name="acknowledgeMessages">
        <div id="acknowledge">
          <c:out value="${message}"/>
        </div>
    </html:messages>
</div>
<div style="clear: both;"></div>


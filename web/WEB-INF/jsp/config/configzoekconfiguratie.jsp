<%--
B3P Gisviewer is an extension to Flamingo MapComponents making      
it a complete webbased GIS viewer and configuration tool that    
works in cooperation with B3P Kaartenbalie.  

Copyright 2006, 2007, 2008 B3Partners BV

This file is part of B3P Gisviewer.

B3P Gisviewer is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

B3P Gisviewer is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with B3P Gisviewer.  If not, see <http://www.gnu.org/licenses/>.
--%>
<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<%@ page isELIgnored="false"%>

<script type="text/javascript">
    var attribuutFormUrl="<html:rewrite page='/configZoekConfiguratieVeld.do' module=''/>";
</script>
<script type='text/javascript' src="<html:rewrite page='/dwr/interface/JZoekConfiguratieUtil.js' module=''/>">
</script>
<script type='text/javascript' src="<html:rewrite page='/dwr/engine.js' module=''/>"></script>
<script type="text/javascript" src="<html:rewrite page='/scripts/zoekConfiguratie.js' module=''/>"></script>

<c:set var="form" value="${zoekConfiguratieForm}"/>

<div class="infobalk">
    <div class="infobalk_description">ZOEKINGANG CONFIGURATIE</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>    
<c:if test="${!empty zoekConfiguraties}">
    <div class="tablesortercontainer">
        <table id="zoekconfiguratieTable" class="tablesorter">
            <thead>
                <tr>
                    <th style="width: 5%;" class="{sorter:'digit'}">ID</th>
                    <th style="width: 25%;"><fmt:message key="configzoekconfiguratie.naam"/></th>
                    <th style="width: 25%;"><fmt:message key="configzoekconfiguratie.featuretype"/></th>
                    <th style="width: 25%;"><fmt:message key="configzoekconfiguratie.parentbron"/></th>
                    <th style="width: 20%;"><fmt:message key="configzoekconfiguratie.parentzoekconfiguratie"/></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="zc" varStatus="status" items="${zoekConfiguraties}">
                    <c:set var="id_selected" value="" />
                    <c:if test="${zc.id == form.map.zoekConfiguratieId}"><c:set var="id_selected" value='selected' /></c:if>
                    <c:url var="link" value="/wizardZoekConfiguratie.do?step2=submit&zoekConfiguratieId=${zc.id}"/>
                    <tr>
                        <td><c:out value="${zc.id}"/><input type="hidden" name="link" value="${link}" /><input type="hidden" name="selected" value="${id_selected}" /></td>
                        <td><c:out value="${zc.naam}"/></td>
                        <td><c:out value="${zc.featureType}"/></td>
                        <td><c:out value="${zc.parentBron}"/></td>
                        <td><c:out value="${zc.parentZoekConfiguratie}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>

<html:form>
    <input type="button" onclick="window.location='<html:rewrite page='/wizardZoekConfiguratie.do'/>'" value="<fmt:message key='button.new'/>"/>
</html:form>



<div id="content_style" style="float: left; clear: left;">
    <div class="berichtenbalk" style="margin-top: 5px;">
            <tiles:insert definition="actionMessages"/>
    </div>
    <c:if test="${not empty form.map.zoekConfiguratieId}">
        <div class="maintable" style="margin-top: 5px;">
            <html:javascript formName="zoekConfiguratieForm" staticJavascript="false"/>
            <html:form action="/configZoekConfiguratie" onsubmit="return validateZoekConfiguratieForm(this)" focus="${focus}">
                <table style="float: left; width: 500px;">
                    <tr>
                        <td><fmt:message key="configzoekconfiguratie.id"/>
                        </td>
                        <td><c:out value="${form.map.zoekConfiguratieId}"/><html:hidden property="zoekConfiguratieId"/>
                        </td>
                    </tr>
                    <tr>
                        <td><fmt:message key="configzoekconfiguratie.naam"/></td>
                        <td><html:text property="naam"/></td>
                    </tr>
                    <tr>
                        <td><fmt:message key="configzoekconfiguratie.featuretype"/></td>
                        <td><c:out value="${form.map.featureType}"/>
                        </td>
                    </tr>
                    <tr>
                        <td><fmt:message key="configzoekconfiguratie.parentbron"/></td>
                        <td><c:out value="${form.map.parentBron}"/>
                        </td>
                    </tr>
                    <tr>
                        <td><fmt:message key="configzoekconfiguratie.parentzoekconfiguratie"/></td>
                        <td><html:select property="parentZoekConfiguratie">
                                <html:option value="">
                                    Geen
                                </html:option>
                                <c:forEach var="z" items="${zoekConfiguratieList}">
                                    <html:option value="${z.id}">
                                        <c:out value="${z}"/>
                                    </html:option>
                                </c:forEach>
                            </html:select>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td><td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><fmt:message key="configzoekconfiguratie.zoekattribuut"/>
                        </td>
                        <td valign="top">
                            <div class="zoekConfiguratieVeldenContainer">
                                <table>
                                    <c:forEach var="z" items="${zoekVelden}">
                                        <tr title="Wijzig: <c:out value='${z}'/>">
                                            <td class="zoekConfiguratieAttribuutNaam" onclick="openZoekAttribuutForm(${z.id})">
                                                
                                                <c:out value="${z.attribuutnaam}"/>
                                            </td>
                                            <td>
                                                <div style="cursor: pointer;" title="Delete: <c:out value='${z}'/>" onclick="removeZoekAttribuut(${z.id})">delete</div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <div class="zoekConfiguratieVeldenButtons"><div onclick="addAttribuut(${form.map.zoekConfiguratieId},'zoek')">Nieuw</div></div>
                        </td>
                    </tr>
                    <tr>
                        <td><fmt:message key="configzoekconfiguratie.resultaatattribuut"/>
                        </td>
                        <td valign="top">
                            <div class="zoekConfiguratieVeldenContainer">
                                <table>
                                    <c:forEach var="r" items="${resultaatVelden}">
                                        <tr title="Wijzig: <c:out value='${r}'/>">
                                            <td class="zoekConfiguratieAttribuutNaam" onclick="openResultaatAttribuutForm(${r.id})">
                                                <c:out value="${r.attribuutnaam}"/>
                                            </td>
                                            <td>
                                                <div style="cursor: pointer;" title="Delete: <c:out value='${r}'/>" onclick="removeResultaatAttribuut(${r.id})">delete</div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <div class="zoekConfiguratieVeldenButtons"><div onclick="addAttribuut(${form.map.zoekConfiguratieId},'resultaat')">Nieuw</div> <%--zoekConfiguratieId en attribuutType mee geven--%></div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><html:submit property="save"><fmt:message key="button.ok"/></html:submit></td>
                    </tr>
                    <%--
                    <tr>
                        <td><fmt:message key="configzoekconfiguratie.featuretype"/></td>
                        <td><html:select property="featureType">
                                <html:option value="">
                                    Geen
                                </html:option>
                                <c:forEach var="f" items="${featureTypes}">
                                    <html:option value="${f}">
                                        <c:out value="${f}"/>
                                    </html:option>
                                </c:forEach>
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td><fmt:message key="configzoekconfiguratie.parentbron"/></td>
                        <td><html:select property="parentBron">
                                <html:option value="">
                                    Geen
                                </html:option>
                                <c:forEach var="b" items="${bronnen}">
                                    <html:option value="${b.id}">
                                        <c:out value="${b}"/>
                                    </html:option>
                                </c:forEach>
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td><fmt:message key="configzoekconfiguratie.parentzoekconfiguratie"/></td>
                        <td><html:select property="parentZoekConfiguratie">
                                <html:option value="">
                                    Geen
                                </html:option>
                                <c:forEach var="z" items="${zoekConfiguratieList}">
                                    <html:option value="${z.id}">
                                        <c:out value="${z}"/>
                                    </html:option>
                                </c:forEach>
                            </html:select>
                        </td>
                    </tr>
                    --%>
                </table>

                <div style="margin-top: 150px;float: left; width: 400px; height: 200px;">
                    <iframe style="height: 100%; width: 100%;"id="iframeZoekConfiguratieVeld"/>
                </div>
            </html:form>
        </div>
    </c:if>
</div>
<script type="text/javascript">
    tablepager(
        'zoekconfiguratieTable',
        '900',
        '14',
        false // display numberOfPages dropdown
    );
</script>
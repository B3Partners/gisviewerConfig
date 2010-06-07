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
<script type='text/javascript' src="<html:rewrite page='/dwr/util.js' module=''/>">
</script>

<c:set var="form" value="${zoekConfiguratieVeldForm}"/>
<c:set var="doClose" value="${doClose}"/>
<div>
    <div class="berichtenbalk">
        <html:messages id="error" message="true">
            <div class="messages">&#8594; <c:out value="${error}" escapeXml="false"/>&#160;&#160;</div>
        </html:messages>
    </div>
    <c:choose>
    <c:when test="${doClose == 'false' || empty doClose}">
    <html:javascript formName="zoekConfiguratieVeldForm" staticJavascript="false"/>
    <html:form action="/configZoekConfiguratieVeld" onsubmit="return validateZoekConfiguratieVeldForm(this)" focus="${focus}">
        <table style="float: left;">
            <html:hidden property="resultaatAttribuutId"/>
            <html:hidden property="zoekAttribuutId"/>
            <input type="hidden" name="zoekConfiguratieId" value="${zoekConfiguratieId}"/>
            <input type="hidden" name="attribuutType" value="${attribuutType}"/>
            <tr>
                <td><fmt:message key="configzoekconfiguratieveld.attribuutnaam"/>
                </td>
                <td><html:select styleId="attribuutNaam" property="attribuutnaam" onchange="attribuutChanged(this)">
                        <c:forEach items="${attribuutNamen}" var="a">
                            <html:option value="${a[0]}"><c:out value="${a[0]}"/></html:option>
                        </c:forEach>
                    </html:select>
                </td>
            </tr>
            <tr>
                <td><fmt:message key="configzoekconfiguratieveld.label"/>
                </td>
                <td><html:text styleId="label" property="label"></html:text>
                </td>
            </tr>
            <%--tr>
                <td><fmt:message key="configzoekconfiguratieveld.naam"/>
                </td>
                <td><html:text property="naam"></html:text>
                </td>
            </tr--%>
            <tr>
                <td><fmt:message key="configzoekconfiguratieveld.type"/>
                </td>
                <td>
                    <html:select styleId="type" property="type">
                        
                    </html:select>
                </td>
            </tr>
            <tr>
                <td><fmt:message key="configzoekconfiguratieveld.volgorde"/>
                </td>
                <td><html:text property="volgorde"></html:text>
                </td>
            </tr>            
            <tr>
                <td></td>
                <td><html:submit property="save"><fmt:message key="button.save"/></html:submit></td>
            </tr>
        </table>
    </html:form>
    </c:when>
        <c:otherwise>
            <script>   
                setTimeout("window.parent.refreshPage()",500);
            </script>
        </c:otherwise>
    </c:choose>
</div>
<script>
    var bindings= new Object();
    <c:forEach items="${attribuutNamen}" var="a">
        bindings["${a[0]}"]="${a[1]}";
    </c:forEach>

    var zoekConfiguratieAttribuutType="${attribuutType}";
    
/*Lijst met mogelijke types.
 *types[index].option = de optie die wordt toegevoegd aan de select box;
 *types[index].forZoek= bij undefined en true wordt deze getoond voor een zoekAttribuut
 *types[index].forResultaat= bij undefined en true wordt deze getoond voor een zoekResultaat
 *types[index].allowedBindings= een commaseperated list met class namen die betrekking hebben op dit type
 *     als undefined is dan is dit type voor alle bindings toegankelijk
 *types[index]disallowedBindings=De bindings die niet zijn toegestaan in combinatie met dit type.
 **/
    var types = new Array();
    var index=0;
    types[index]=new Object();
    types[index].option={"2" : "Toon"};
    types[index].forZoek=false;
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine";

    index++;
    types[index]=new Object();
    types[index].option={"0":"Geen"};//new Option("Geen","0");//
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine";
    types[index].forZoek=false;

    index++;
    types[index]=new Object();
    types[index].option={"0":"Lijkt op"};//new Option("Geen","0");//
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine";
    types[index].forResultaat=false;

    index++;
    types[index]=new Object();
    types[index].option={"1" : "Id"};
    types[index].forZoek=false;
    types[index].forResultaat=false;
    
    index++;
    types[index]=new Object();
    types[index].option={"3" : "Geometry"};
    types[index].allowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine";
    
    index++;
    types[index]=new Object();
    types[index].option={"4" : "Kleiner dan"};
    types[index].forResultaat=false;
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine";

    index++;
    types[index]=new Object();
    types[index].option={"5" : "Groter dan"};
    types[index].forResultaat=false;
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine";

    index++
    types[index]=new Object();
    types[index].option={"100" : "Binnen een straal van geometry"};
    types[index].forResultaat=false;
    types[index].allowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine";

    var previousValueSet="";
    function attribuutChanged(element){
        rebuildTypeSelect(element.value);
        var labelValue=document.getElementById("label").value;
        if (labelValue=="" || previousValueSet==labelValue){
            previousValueSet= element.value;
            document.getElementById("label").value=element.value;
        }
    }
    function rebuildTypeSelect(attribuutNaam){
        //$j('#type').children().remove()
        dwr.util.removeAllOptions("type");
        for (var i=0; i < types.length; i ++){
            var type=types[i];
            var pastType=false;
            if (zoekConfiguratieAttribuutType=="zoek" &&
                (type.forZoek==undefined || type.forZoek==true)){
                pastType=true;
            }else if(zoekConfiguratieAttribuutType=="resultaat" &&
                (type.forResultaat==undefined || type.forResultaat==true)){
                pastType=true;
            }
            if (pastType){
                var pastBinding=true;
                if (type.allowedBindings!=undefined &&
                    type.allowedBindings.toLowerCase().indexOf(bindings[attribuutNaam].toLowerCase())<0){
                    pastBinding=false;
                }else if(type.disallowedBindings!=undefined &&
                    type.disallowedBindings.toLowerCase().indexOf(bindings[attribuutNaam].toLowerCase())>=0){
                    pastBinding=false;
                }
                if (pastBinding){
                    dwr.util.addOptions("type",type.option);
                }
            }
        }
    }
    //init type box:
    attribuutChanged(document.getElementById("attribuutNaam"));
</script>




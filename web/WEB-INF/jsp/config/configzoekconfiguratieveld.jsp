<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<%@ page isELIgnored="false"%>
<script type='text/javascript' src="<html:rewrite page='/dwr/util.js' module=''/>">
</script>

<c:set var="form" value="${zoekConfiguratieVeldForm}"/>
<c:set var="doClose" value="${doClose}"/>
<div>
    <div class="berichtenbalk">
            <tiles:insert definition="actionMessages"/>
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
                        <html:option value="DUMMY">-Dummy veld-</html:option>
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

            <!-- Attributen alleen bij een zoekveld -->
            <c:if test="${attribuutType == 'zoek'}">
            <tr>
                <td><fmt:message key="configzoekconfiguratieveld.inputtype"/></td>
                <td>
                    <html:select styleId="type" property="inputtype">
                        <html:option value="1">Dropdown</html:option>
                        <html:option value="2">Tekst</html:option>
                    </html:select>
                </td>
            </tr>
            <tr>
                <td><fmt:message key="configzoekconfiguratieveld.inputsize"/></td>
                <td><html:text property="inputsize"></html:text></td>
            </tr>
            <tr>
                <td>Opzoeklijst</td>
                <td><html:select property="inputzoekconfiguratie">
                        <html:option value="">
                            Geen
                        </html:option>
                        <c:forEach var="z" items="${inputZoekConfigList}">
                            <html:option value="${z.id}">
                                <c:out value="${z.naam}"/>
                            </html:option>
                        </c:forEach>
                    </html:select>
                </td>
            </tr>
            </c:if>

            <tr>
                <td></td>
                <td><html:submit property="save"><fmt:message key="button.save"/></html:submit></td>
            </tr>
        </table>
    </html:form>
    </c:when>
        <c:otherwise>
            <script type='text/javascript'>
                setTimeout("window.parent.refreshPage()",500);
            </script>
        </c:otherwise>
    </c:choose>
</div>
<script type='text/javascript'>
    var bindings= new Object();
    <c:forEach items="${attribuutNamen}" var="a">
        bindings["${a[0]}"]="${a[1]}";
    </c:forEach>

    /* DUMMY Binding zodat types die niet geen attribuutveld nodig hebben
     * kunnen worden gebruikt. Bijvoorbeeld straal en XY coord */
    bindings["DUMMY"]='DUMMY';

    var zoekConfiguratieAttribuutType="${attribuutType}";
    
/*
 * Lijst met mogelijke types.
 *
 * types[index].option = de optie die wordt toegevoegd aan de select box;
 * types[index].forZoek = bij undefined en true wordt deze getoond voor een zoekAttribuut;
 * types[index].forResultaat = bij undefined en true wordt deze getoond voor een zoekResultaat;
 * types[index].allowedBindings = een commaseperated list met class namen die betrekking hebben op dit type
 * als undefined is dan wordt er niet op toegestaan gecontroleerd;
 *
 * types[index]disallowedBindings = De bindings die niet zijn toegestaan in combinatie met dit type.
 * als undefined is dan wordt er niet op niet toegestaan gecontroleerd;
 *
 * Als je wilt dat het nieuwe type niet mag voorkomen als je de gebruiker een dummyveld kiest
 * moet je DUMMY in de disallowedBindings erbij zetten.
 *
 * Als je wilt dat het nieuwe type wel mag voorkomen als je de gebruiker een dummyveld kiest
 * moet je deze disallowedBindings erbij zetten:
 * types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,String";
*/

    var types = new Array();
    var index=0;
    types[index]=new Object();
    types[index].option={"-1" : "Alleen tonen"};
    types[index].forZoek=true;
    types[index].forResultaat=true;
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,DUMMY";

    index++;
    types[index]=new Object();
    types[index].option={"2" : "Tonen en doorgeven"};
    types[index].forZoek=false;
    types[index].forResultaat=true;
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,DUMMY";

    index++;
    types[index]=new Object();
    types[index].option={"0":"Alleen doorgeven"};//new Option("Geen","0");//
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,DUMMY";
    types[index].forZoek=false;
    types[index].forResultaat=true;

    index++;
    types[index]=new Object();
    types[index].option={"0":"Lijkt op"};//new Option("Geen","0");//
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,DUMMY";
    types[index].forResultaat=false;

    index++;
    types[index]=new Object();
    types[index].option={"1" : "Id"};
    types[index].forZoek=false;
    types[index].forResultaat=true;
    types[index].disallowedBindings="DUMMY";
    
    index++;
    types[index]=new Object();
    types[index].option={"3" : "Geometry"};
    types[index].forResultaat=true;
    types[index].allowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine";
    types[index].disallowedBindings="DUMMY";
    
    index++;
    types[index]=new Object();
    types[index].option={"4" : "Kleiner dan"};
    types[index].forResultaat=false;
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,DUMMY";

    index++;
    types[index]=new Object();
    types[index].option={"5" : "Groter dan"};
    types[index].forResultaat=false;
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,DUMMY";

    index++;
    types[index]=new Object();
    types[index].option={"40" : "Kleiner dan datum"};
    types[index].forResultaat=false;
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,DUMMY";

    index++;
    types[index]=new Object();
    types[index].option={"50" : "Groter dan datum"};
    types[index].forResultaat=false;
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,DUMMY";

    index++;
    types[index]=new Object();
    types[index].option={"6" : "Gelijk aan"};
    types[index].forResultaat=false;
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,DUMMY";

    /* Straal heeft geen attribuutveld nodig. */
    index++
    types[index]=new Object();
    types[index].option={"100" : "Straal"};
    types[index].forZoek=true;
    types[index].forResultaat=false; 
    types[index].allowBindings="DUMMY";
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,String";

    /* XY coord heeft geen attribuutveld nodig. */
    index++
    types[index]=new Object();
    types[index].option={"80" : "XY coord"};
    types[index].forZoek=true;
    types[index].forResultaat=false;
    types[index].allowBindings="DUMMY";
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,String";

    /* Schaalveld. */
    index++
    types[index]=new Object();
    types[index].option={"90" : "Schaal"};
    types[index].forZoek=true;
    types[index].forResultaat=false;
    types[index].allowBindings="DUMMY";
    types[index].disallowedBindings="Geometry,Point,Polygon,Line,MultiPoint,MultiPolygon,MultiLine,String";

    var previousValueSet="";
    /*Wordt aangeroepen als het attribuut veld wordt gewijzigd.*/
    function attribuutChanged(element){
        rebuildTypeSelect(element.value);
        var labelValue=document.getElementById("label").value;
        if (labelValue=="" || previousValueSet==labelValue){
            previousValueSet = element.value;
            document.getElementById("label").value=element.value;
        }
    }

    /*Herbouw het drop down 'type' component.*/
    function rebuildTypeSelect(attribuutNaam) {
        
        dwr.util.removeAllOptions("type");

        for (var i=0; i < types.length; i ++) {
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

                    
                    <c:if test="${!empty selType}">
                        dwr.util.setValue("type", ${selType});
                    </c:if>
                }

            }
        }
    }

    //init type box:
    attribuutChanged(document.getElementById("attribuutNaam"));
</script>




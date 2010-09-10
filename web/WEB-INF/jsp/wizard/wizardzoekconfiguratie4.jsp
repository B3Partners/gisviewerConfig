<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<%@ page isELIgnored="false"%>

<script type='text/javascript' src="<html:rewrite page='/dwr/interface/JZoekConfiguratieUtil.js' module=''/>"></script>
<script type='text/javascript' src="<html:rewrite page='/dwr/engine.js' module=''/>"></script>
<script type="text/javascript" src="<html:rewrite page='/scripts/wizardZoekConfiguratie.js' module=''/>"></script>

<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="wizardzoekconfiguratie.step4"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<script type="text/javascript">
    var attribuutFormUrl="<html:rewrite page='/configZoekConfiguratieVeld.do' module=''/>";
    var startPage="<html:rewrite page='/configZoekConfiguratie.do' module=''/>";
</script>

<html:form action="/wizardZoekConfiguratie">

<input type="hidden" name="step3" id="stepElement"/>
<input type="hidden" name="bronId" value="${bronId}"/>
<input type="hidden" name="featureType" value="${featureType}"/>
<input type="hidden" id="zoekConfiguratieId" name="zoekConfiguratieId" value="${zoekConfiguratieId}"/>

<div class="berichtenbalk">
            <tiles:insert definition="actionMessages"/>
</div>

<div style="margin-left: 5px;">
    <div class="wizardQuestionBlock">
        <p>
            <fmt:message key="wizardzoekconfiguratie.vraag.geefattributen"/>
        </p>
        <table>
            <tr>
                <td><fmt:message key="configzoekconfiguratie.zoekattribuut"/>
                </td>
                <td>
                    <fmt:message key="configzoekconfiguratie.resultaatattribuut"/>
                </td>
            </tr>
            <tr>
                <td><div class="zoekConfiguratieVeldenContainer">
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
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <div class="addZoekerVeld" onclick="addAttribuut(${zoekConfiguratieId},'zoek')">+ Nieuw zoekveld</div>
                </td>

                <td valign="top">
                    <div class="addZoekerVeld" onclick="addAttribuut(${zoekConfiguratieId},'resultaat')">+ Nieuw resultaatveld</div>
                </td>
            </tr>
        </table>
        <c:if test="${not empty parentResultaatVelden}">
            <div class="tipsContainer">
                <fmt:message key="wizardzoekconfiguratie.parentresultaatvelden"/>
                <ul>
                    <c:forEach items="${parentResultaatVelden}" var="r">
                        <c:set value="Tekst of nummer" var="type"/>
                        <c:if test="${r.type == 3}">
                            <c:set var="type" value="Geometry"/>
                        </c:if>
                        <li>
                            <c:out value="${r.attribuutnaam}"/>(<c:out value="${type}"/>)
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        <c:if test="${not empty tips}">
            <div class="tipsContainer">
                <fmt:message key="wizardzoekconfiguratie.tip"/>
                <ul>
                    <c:forEach items="${tips}" var="tip">
                        <li><fmt:message key="${tip}"/></li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div> <!-- einde div wizardQuestionBlock -->

    <div class="knoppenbalk">
        <html:submit property="step2"><fmt:message key='button.previous'/></html:submit>
        <input type="button" onclick="openStartPage()"value="<fmt:message key='button.ok'/>"/>
    </div>
    
</div> <!-- einde div content -->

</html:form>

<!-- Als je /> gebruikt om iframe tag af te sluiten wordt footer niet getoont ? -->
<div id="dialogPopUp">
    <iframe id="iframeZoekConfiguratieVeld"></iframe>
</div>

/*
 * B3P Gisviewer is an extension to Flamingo MapComponents making
 * it a complete webbased GIS viewer and configuration tool that
 * works in cooperation with B3P Kaartenbalie.
 *
 * Copyright 2006, 2007, 2008 B3Partners BV
 *
 * This file is part of B3P Gisviewer.
 *
 * B3P Gisviewer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * B3P Gisviewer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with B3P Gisviewer.  If not, see <http://www.gnu.org/licenses/>.
 */
dwr.engine.setErrorHandler(errorHandler);
function errorHandler(exception){
    alert(exception);
}

function removeZoekAttribuut(id){
    if(confirm('Weet u zeker dat u dit zoek attribuut wilt verwijderen?')){
        JZoekConfiguratieUtil.removeZoekAttribuut(id,handleRemove);
    }
}
function removeResultaatAttribuut (id){
    if (confirm("Weet u zeker dat u dit resultaatveld wilt verwijderen?")){
        JZoekConfiguratieUtil.removeResultaatAttribuut(id,handleRemove);
    }
}
function handleRemove(){
    refreshPage();
}
/*Reload de pagina als er een stepElement aanwezig is.(met als naam de naam van de step)*/
function refreshPage(){    
    if (document.getElementById("stepElement")){
        document.getElementById("stepElement").value="submit";
        document.forms[0].submit();
    }
    
    //window.location.refresh();
}

/*Voor het muteren van de attributen*/
/**
 * Open zoekAttribuut met id
 */
function openZoekAttribuutForm(id){
    openAttribuutForm(id,"zoekAttribuutId");
}
/**
 * Open resultaatAttribuut met id
 */
function openResultaatAttribuutForm(id){
    openAttribuutForm(id,"resultaatAttribuutId");
}
/**
 * Open attribuut met id
 */
function openAttribuutForm(id,paramName){
    var url=attribuutFormUrl+"?"+paramName+"="+id;
    document.getElementById("iframeZoekConfiguratieVeld").src=url;
    
    var dialogdiv = $j("#dialogPopUp");
    openAsDialog(dialogdiv);

    dialogdiv.dialog("option", "height", 270);
    dialogdiv.dialog("option", "title", "");
}
/**
 *Open een nieuw attribuut in het form
 */
function addAttribuut(zoekConfigid,paramName){
    var url=attribuutFormUrl+"?attribuutType="+paramName+"&zoekConfiguratieId="+zoekConfigid;

    var dialogdiv = $j("#dialogPopUp");
    $j("#iframeZoekConfiguratieVeld").attr("src", url);
    openAsDialog(dialogdiv);
    
    dialogdiv.dialog("option", "height", 270);
    dialogdiv.dialog("option", "title", "Nieuw " + paramName + "veld");
}

function openAsDialog(dialogdiv){
    dialogdiv.dialog({
        height: 270,
        width: 350,
        resizable: false,
        draggable: true,
        modal: true
    });
    dialogdiv.dialog('open');
}

/*Return naar het begin van de wizard/lijst*/
function openStartPage(){
    window.location=startPage;
}

function deleteZoekConfiguratie(id){
    var answer = confirm("Weet u zeker dat u dit record wilt verwijderen?")
    if(answer){
        if (document.getElementById("hiddenDelete")){
            document.getElementById("hiddenDelete").value="submit";
            document.forms[0].submit();
        }
    }
}
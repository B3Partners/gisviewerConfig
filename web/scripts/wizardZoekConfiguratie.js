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
function refreshPage(){
    //alert("refresh page");
    window.location=window.location;
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
}
/**
 *Open een nieuw attribuut in het form
 */
function addAttribuut(zoekConfigid,paramName){
    var url=attribuutFormUrl+"?attribuutType="+paramName+"&zoekConfiguratieId="+zoekConfigid;
    document.getElementById("iframeZoekConfiguratieVeld").src=url;    
    openAsDialog("dialogPopUp")
}
function openAsDialog(divid){
    $j("#" + divid).dialog({
        resizable: false,
        draggable: true,
        modal: true,
        show: 'slide',
        hide: 'slide'
    });
    $j("#" + divid).dialog('open');
}
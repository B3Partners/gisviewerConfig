/*
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
*/

function hoverRow(obj) {
    obj.className += ' regel_over';
}
var pattern = new RegExp("\\bregel_over\\b");
function hoverRowOut(obj) {
    obj.className = obj.className.replace(pattern, '');
}
function refreshFeatureList(element){
    if (connectionTypes){
        if (connectionTypes[element.value]){
            currentConnectionType=connectionTypes[element.value];
        }
    }
    var value=element.value;
    JConfigListsUtil.getPossibleFeaturesById(value,handleFeatureList);
}
function handleFeatureList(list){
    showHideJDBC();
    dwr.util.removeAllOptions('admin_tabel_select');
    dwr.util.removeAllOptions('admin_pk_select');

    dwr.util.addOptions("admin_tabel_select",[""]);
    dwr.util.addOptions("admin_tabel_select",list,"0","1");

    var data = [ { value:"", label:"Kies eerst tabel of feature...." } ];
    
    dwr.util.addOptions("admin_pk_select", data, "value", "label");
}
function refreshAdminAttributeList(element){
    var connid=document.getElementById('connectie_select').value;
    JConfigListsUtil.getPossibleAttributesById(connid,element.value,handleAdminAttributeList);
    if (element.value!=undefined && element.value.length > 0){
        document.getElementById("wms_querylayers_real").disabled=true;
        document.getElementById("wms_querylayers_real").value="";
    }else{
        document.getElementById("wms_querylayers_real").disabled=false;
    }
}
function handleAdminAttributeList(list){
    dwr.util.removeAllOptions('admin_pk_select');
    dwr.util.addOptions("admin_pk_select",[""]);
    dwr.util.addOptions("admin_pk_select",list,"0","1");
}
function refreshSpatialAttributeList(element){
    var connid=document.getElementById('connectie_select').value;
    JConfigListsUtil.getPossibleAttributesById(connid,element.value,handleSpatialAttributeList);
}
function refreshTheLists(){
    document.forms[0].refreshLists.value="do";
    document.forms[0].submit();
}

$j(document).ready(function(){
    //Alleen automatisch vullen als ook het layerObject bestaat.
    if(layersObject){        
        $j('select[name="wms_layers_real"]').change(function (){
            var layerObject=layersObject[$j('select[name="wms_layers_real"]').val()];
            if (layerObject){
                if (layerObject.legend &&                    
                    $j('select[name="wms_legendlayer_real"]').val()==""){
                    $j('select[name="wms_legendlayer_real"]').val(layerObject.name);
                }
                if (layerObject.title &&
                    $j('input[name="naam"]').val()==""){
                    $j('input[name="naam"]').val(layerObject.title);
                }
                if (layerObject.metadata &&
                    $j('input[name="metadatalink"]').val()==""){
                    $j('input[name="metadatalink"]').val(layerObject.metadata);
                }
            }
        });
    }
});
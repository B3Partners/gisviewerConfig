
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
function showHideJDBC() {
    //Er voor zorgen dat het tabblad geavanceerd wordt gehide
    //als thema wfs is (!="jdbc" )
    if (currentConnectionType=="jdbc"){
        document.getElementById('tab-geavanceerd-header').style.display = "block";
    } else {
        document.getElementById('tab-geavanceerd-header').style.display = "none";
    }
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
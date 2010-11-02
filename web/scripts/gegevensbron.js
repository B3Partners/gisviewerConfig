dwr.engine.setErrorHandler(handler);

function handler(msg) {
    var message = msg;

    if (message != '')
    {
        alert(message);
    }
}

function createLeaf(container, item) {
    container.appendChild(createFolderIcon());
    container.appendChild(document.createTextNode(' '));
    container.appendChild(createEditLink(item));

    return false;
}

function createEditLink(item){
    var lnk = document.createElement('a');

    lnk.innerHTML = item.title ? item.title : item.id;
    lnk.className='gbEditLink';
    lnk.href = 'configGegevensbron.do?edit=submit&gegevensbronID='+item.id;

    return lnk;
}

function createFolderIcon() {
    var folderIcon = document.createElement("img");

    folderIcon.src = "images/treeview/folder.png";
    folderIcon.style.border = '0px none White';
    folderIcon.alt = "edit";
    folderIcon.title = "edit";
    folderIcon.className = 'folderIcon';

    return folderIcon;
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
    dwr.util.removeAllOptions('admin_tabel_select');
    dwr.util.removeAllOptions('spatial_tabel_select');
    dwr.util.removeAllOptions('admin_pk_select');
    dwr.util.removeAllOptions('spatial_pk_select');
    dwr.util.removeAllOptions('spatial_adminref_select');
    dwr.util.addOptions("admin_tabel_select",[""]);
    dwr.util.addOptions("spatial_tabel_select",[""]);
    dwr.util.addOptions("admin_tabel_select",list,"0","1");
    dwr.util.addOptions("spatial_tabel_select",list,"0","1");

    var data = [ { value:"", label:"Kies eerst tabel of feature...." } ];
    var data2 = [ { value:"", label:"Kies eerst spatialtabel...." } ];
    
    dwr.util.addOptions("admin_pk_select", data, "value", "label");
    dwr.util.addOptions("spatial_pk_select", data2, "value", "label");
    dwr.util.addOptions("spatial_adminref_select", data2, "value", "label");
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

function refreshTheLists(){
    document.forms[0].refreshLists.value="do";
    document.forms[0].submit();
}
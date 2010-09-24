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
    lnk.className='clusterEditLink';
    lnk.href = 'configKaartGroep.do?edit=submit&clusterID='+item.id;
    
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
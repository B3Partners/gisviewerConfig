dwr.engine.setErrorHandler(handler);

function handler(msg) {
    var message = msg;

    if (message != '')
    {
        alert(message);
    }
}

function createLeaf(container, item) {
    if(item.cluster) {
        //if callable
        if (item.callable) {
            var checkboxChecked = false;
            var clusterPos = getClusterPosition(item);
            if(clusterPos!=0) {
                checkboxChecked = true;
            }
            var checkbox = createCheckboxCluster(item, checkboxChecked );

            checkbox.theItem=item;
            container.appendChild(checkbox);

            if (checkboxChecked){
                clustersAan.push(checkbox);
            }

            // alleen een callable item kan active zijn
            if (item.active){
                setActiveCluster(item, true);
            }
        }
        if (item.hide_tree && item.callable){
            // hack om toggle plaatje uit te zetten als
            // cluster onzichtbare onderliggende kaartlagen heeft
            var img = document.createElement("img");
            img.setAttribute("border", "0");
            img.src = globalTreeOptions["layermaindiv"].toggleImages["leaf"]
            img.theItem=item;
            container.togglea = img;
        }
        if (!item.hide_tree || item.callable){
            container.appendChild(document.createTextNode('  '));
            container.appendChild(createMetadatLink(item));
        } else {
            return true; //hide
        }

    } else if (!item.hide_tree) {

        if(item.wmslayers){
            var checkboxChecked = false;
            var layerPos = getLayerPosition(item);
            if(layerPos!=0) {
                checkboxChecked = true;
            }
            var labelCheckbox = createCheckboxThema(item, checkboxChecked);

            if (checkboxChecked) {
                if (layerPos<0) {
                    layersAan.unshift(labelCheckbox);
                } else {
                    layersAan.push(labelCheckbox);
                }
            }

            if(item.analyse=="on" || item.analyse=="active"){
                if (!multipleActiveThemas){
                    var labelRadio = createRadioThema(item);
                    container.appendChild(labelRadio);
                } else {
                    isActiveItem(item);
                }
            }
            container.appendChild(labelCheckbox);
        }

        if (item.legendurl != undefined && showLegendInTree) {
            container.appendChild(document.createTextNode('  '));
            container.appendChild(createTreeLegendIcon());
        }

        container.appendChild(document.createTextNode('  '));
        container.appendChild(createMetadatLink(item));

        if (item.legendurl != undefined && showLegendInTree) {
            container.appendChild(createTreeLegendDiv(item));
        }

    } else {
        var divje = createInvisibleThemaDiv(item);
        divje.theItem=item;
        container.appendChild(divje);
        if(item.visible=="on" && item.wmslayers){
            addItemAsLayer(item,true);
        }
        return true;//hide
    }

    return false;
}
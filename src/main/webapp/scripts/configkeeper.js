var filtered = false;
function itemFilter($input, listselector, itemselector) {
    var searchTimeout;
    $input.keyup( function () {
        var filter = $j(this).val();
        window.clearTimeout(searchTimeout);
        searchTimeout = window.setTimeout(function() {
            if(filter) {
                filterList($origList, listselector, itemselector, filter);
                $j("#kaartlagenmessage").hide();
                filtered = true;
            } else {
                if(filtered) {
                    $j(listselector).replaceWith($origList);
                    filtered = false;
                }
                $j(listselector).hide();
                $j("#kaartlagenmessage").show();

            }
        }, 500);
        return false;
    });
}

function filterList($origList, listselector, itemselector, query) {
    var regex = new RegExp(query, "i"), temp = $origList.clone(), hide = [];
    $j(itemselector, temp).each(function() {
        if(!regex.test($j(this).text())) $j(this).hide();
    });
    $j(listselector).replaceWith(temp.show());
}

function layerClick(obj) {
    var itemselector = '#' + $j(obj).attr("id");
    var $itemParent = $j(itemselector).parent();
    if(obj.checked) {
        $itemParent.detach().appendTo("#selectedkaartlagenlist");
        $j(itemselector, $origList).parent().remove();
    }
    else {
        $itemParent.detach().appendTo("#kaartlagenlist");
        $origList.append($itemParent);
        if(filtered) $j("#inputfilter").keyup();
    }
    return true;
}

/* Toon juiste module bij het selecteren van een tabblad. Wanneer er geen instellingen zijn, toon leeg tabblad met melding */
function showModules() {
    $j(".sublabel").hide();
    $j(".tabblad_select").each(function() {
        var labelselect = $j(this).val();

        /* Check of een tabblad is geselecteerd (!=leeg) */
        if(labelselect != "leeg") {
            var module = $j("#label_" + labelselect);
            if(module && module.hasClass("sublabel")) {
                /* Wanneer een label wordt gevonden met id #label_ + geselecteerde waarde, toon deze */
                module.show();
            } else {
                /* Wanneer er geen label wordt gevonden, zijn hiervoor geen configuratie instellingen */
                /* Maak dan een nieuwe label + content aan met de melding dat er geen config instellingen zijn */
                var $label = $j('<div class="tablabel sublabel" id="label_'+labelselect+'">'+$j("option:selected", this).text()+'</div>');
                $label.click(function() {
                    labelClick($j(this));
                }).css({
                    "background-color": "#D3D3D3",
                    "color": "#000000"
                });
                $j(".tablabels").append($label);

                var $content = $j('<div class="tabcontent content_'+labelselect+'"><div class="configrow">Geen configuratie instellingen mogelijk</div></div>');
                $content.hide().css("min-height", contentMinHeight);
                $j(".tabcontents").append($content);
            }
        }
    });
}

function gpsBufferVisible(visible){
    document.getElementById("gpsbuffer").style.display = visible.checked ? "block" : "none";
}

// element id's from module dropdowns
var moduleElementIds = new Array(
    "cfg_tab1_left",
    "cfg_tab2_left",
    "cfg_tab3_left",
    "cfg_tab4_left",
    "cfg_tab5_left",
    "cfg_tab1",
    "cfg_tab2",
    "cfg_tab3",
    "cfg_tab4",
    "cfg_tab5"
);
      
// current selected values from dropdowns
// needed to set if newly selected value already exists
var currentModuleValues = {
    "cfg_tab1_left" : "",
    "cfg_tab2_left" : "",
    "cfg_tab3_left" : "",
    "cfg_tab4_left" : "",
    "cfg_tab5_left" : "",
    "cfg_tab1" : "",
    "cfg_tab2" : "",
    "cfg_tab3" : "",
    "cfg_tab4" : "",
    "cfg_tab5" : ""
};

function fillSelectedModuleValues() {
    for (var i = 0; i < moduleElementIds.length; i++) {
        var value = $j("#" + moduleElementIds[i] + " option:selected").val();
        
        currentModuleValues[moduleElementIds[i]] = value;
    }
}

// checks if other module dropdown already has the selected value
function checkModuleAvailable(element) {    
    var oldValue = currentModuleValues[element.id];
    
    var id = element.id;
    var value = element.value;
            
    for (var i = 0; i < moduleElementIds.length; i++) {        
        if (moduleElementIds[i] !== id && value !== 'leeg') {            
            if ($j("#" + moduleElementIds[i]).val() == value) {  
                $j("#" + id).val(oldValue);
                
                alert("Module mag niet meerdere malen gekozen worden.");
            }
        }           
    }
    
    fillSelectedModuleValues();
}

// resets all module dropdowns for user
function resetModuleElements() {
    for (var i = 0; i < moduleElementIds.length; i++) {
        $j("#" + moduleElementIds[i]).val('leeg');
    }
    
    fillSelectedModuleValues();
}

var $origList = null;
$j(document).ready(function() {
    $j("#kaartlagenlist").find("input:checked").each(function() {
        $j(this).parent().detach().appendTo("#selectedkaartlagenlist");
    });
    $origList = $j("#kaartlagenlist").clone();
    itemFilter($j("#inputfilter"), "#kaartlagenlist", "div");
    var showedAll = false;
    $j("#showAllLayers").click(function() {
        if(!showedAll) {
            if(filtered) {
                $j("#inputfilter").val('');
                $j("#kaartlagenlist").replaceWith($origList);
                filtered = false;
            }
            $j("#kaartlagenlist").show();
            $j("#kaartlagenmessage").hide();
            $j(this).html('Verberg alle lagen');
            showedAll = true;
        } else {
            $j("#kaartlagenlist").hide();
            $j("#kaartlagenmessage").show();
            $j(this).html('Toon alle lagen');
            showedAll = false;
        }
        return false;
    });
    showModules();
    $j(".tabblad_select").change(showModules);
    document.getElementById("gpsbuffer").style.display = $j("[name=cfg_showGPSTool]")[0].checked ? "block" : "none";

    fillSelectedModuleValues();
});
$(document).ready(function(){
    activateTab('Posts');
});

function activateTab(tab){
    $('.nav-pills a[href"#' + tab + '"]').tab('show');
}
$(document).ready(function(){
    activatetab('Posts');
});

function activateTab(tab){
    $('.nav-pills a[href"#' + tab + '"]').tab('show');
}
var BREWERIES = {};

BREWERIES.show = function(){
    $("#brewerytable tr:gt(0)").remove();

    var table = $("#brewerytable");

    $.each(BREWERIES.list, function (index, brewery) {
        table.append('<tr>'
            +'<td>'+brewery['name']+'</td>'
            +'<td>'+brewery['year']+'</td>'
            +'<td>'+brewery['beers']['size']+'</td>'
            +'<td>'+brewery['active']+'</td>'
            +'</tr>');
    });
};

BREWERIES.sort_by_name = function(){
    BREWERIES.list.sort( function(a,b){
        return a.name.toUpperCase().localeCompare(b.name.toUpperCase());
    });
};

BREWERIES.sort_by_year = function(){
    BREWERIES.list.sort( function(a,b){
        return a.year - b.year;
    });
};

BREWERIES.sort_by_beers = function(){
    BREWERIES.list.sort( function(a,b){
        return b.beers.size - a.beers.size;
    });
};

$(document).ready(function () {
    if ( $("#brewerytable").length>0 ) {

        $("#name").click(function (e) {
            BREWERIES.sort_by_name();
            BREWERIES.show();
            e.preventDefault();
        });

        $("#year").click(function (e) {
            BREWERIES.sort_by_year();
            BREWERIES.show();
            e.preventDefault();
        });

        $("#beers").click(function (e) {
            BREWERIES.sort_by_beers();
            BREWERIES.show();
            e.preventDefault();
        });

        $("#active").click(function (e) {
            BREWERIES.show();
            e.preventDefault();
        });


        $.getJSON('breweries.json', function (brewries) {
            BREWERIES.list = brewries;
            BREWERIES.sort_by_name();
            BREWERIES.show();
        });

    }
});
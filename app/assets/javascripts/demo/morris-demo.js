function morris_area(data, xkey, ykeys){
    $('#morris-area-chart').html('');

    Morris.Area({
        element: 'morris-area-chart',
        data: data,
        xkey: xkey,
        ykeys: ykeys,
        labels: ykeys,
        pointSize: 2,
        hideHover: 'auto',
        lineColors: ['#EB1E1E', '#D5EE20', '#4da74d'],
        resize: true
    });

}

function donut(data){
    Morris.Donut({
        element: 'morris-donut-chart',
        data: data,
        colors: ['#D5EE20', '#4da74d', '#EB1E1E'],
        resize: true
    });
}

function bar(data, xkey, ykeys) {
    Morris.Bar({
        element: 'morris-bar-chart',
        data: data,
        xkey: xkey,
        ykeys: ykeys,
        labels: ykeys,
        hideHover: 'auto',
        barColors: ['#EB1E1E', '#D5EE20', '#4da74d'],
        resize: true
    });
}

function line(data, xkey, ykeys){
    Morris.Line({
        element: 'morris-line-chart',
        data: data,
        xkey: xkey,
        ykeys: ykeys,
        labels: ykeys,
        hideHover: 'auto',
        lineColors: ['#EB1E1E', '#D5EE20', '#4da74d'],
        resize: true
    });
}

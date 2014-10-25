// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require jquery.dataTables.min
//= require dataTables.foundation
//= require pickadate/picker
//= require pickadate/picker.date
//= require pickadate/picker.time
//= require highcharts
//= require highcharts/highcharts-more
//= require_tree .

$(function(){
  $(document).foundation();
  $('#transaction_date').pickadate();
  $('#budget_item_date').pickadate();

  $('#transactions').dataTable({
    "ajax": $('#transactions').data('source')
  });

  $('#budget-items').dataTable({
    "aoColumnDefs": [
      {"bSortable": false, "aTargets": [ 4, 5, 6 ]}
    ]
  });

  $(function () {
    $('.budget_items_chart').highcharts({
        colors: ['#E60000', '#009933'],
        title: {
            text: 'Budget vs Actual Spending'+' ('+ gon.category +')',
            x: -20
        },
        xAxis: {
          categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'Dollars ($)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valuePrefix: '$'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: gon.category,
            data: gon.transactions
          }, {
            name: 'Budget',
            data: gon.budget
        }]
    });
  });
  $(function () {
    $('.pie-chart').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 1,//null,
            plotShadow: false
        },
        title: {
            text: 'Budget Categories'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Budget Share',
            data: gon.pie_budget
        }]
    });
});
});

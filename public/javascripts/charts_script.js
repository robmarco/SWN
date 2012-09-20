/*
 * File:        charts_script.js
 * Version:     1.0
 * Author:      Roberto Marco
 * Info:        Call for create a new chart using jQuery/HighStock
 * 
  * This source file is free software
 * 
 * This source file is distributed in the hope that it will be useful, but 
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
 * or FITNESS FOR A PARTICULAR PURPOSE. See the license files for details.
 */

function double_bar_chart(data, chart_title, yAxis_title1, yAxis_title2, serie_name1, serie_name2){
  // split data
	var volumen = [],
		carga = [],
		dataLength = data.length;
		
	for (i = 0; i < dataLength; i++) {
		volumen.push([
			data[i][0], // the date
			data[i][1], // volumen
		]);
		
		carga.push([
			data[i][0], // the date
			data[i][2] // carga
		])
	}

	// set the allowed units for data grouping
	var groupingUnits = [[
		'week',
		[1]
	], [
		'month',
		[1, 2, 3, 4, 6]
	]];

	// create the chart
	chart = new Highcharts.StockChart({
    chart: {
      renderTo: 'orders_chart',
      alignTicks: false
    },

    rangeSelector: {
      selected: 1
    },

    title: {
      text: chart_title
    },

    yAxis: [{
      title: {
        text: yAxis_title1
      },
      height: 200,
      lineWidth: 2
    }, {
      title: {
      	text: yAxis_title2
      },
      top: 300,
      height: 100,
      offset: 0,
      lineWidth: 2
    }],
	    
    series: [{
        type: 'column',
        name: serie_name1,
        data: volumen,
	    	dataGrouping: {
					units: groupingUnits
	      }
    	}, {
        type: 'column',
        name: serie_name2,
        data: carga,
        yAxis: 1,
        dataGrouping: {
					units: groupingUnits
        }
    	}
    ]
	});
}

function single_bar_chart(class_selector, data, title, yAxis_title, series_name){
  new Highcharts.StockChart({
  	chart: {
    	renderTo: class_selector,
      alignTicks: false
    },

    rangeSelector: {
        selected: 1
    },

    title: {
      text: title
    },

    yAxis: {
      title: {
        text: yAxis_title
      }
    },

    series: [{
      type: 'column',
      //color: color,
      name: series_name,
      data: data,
      dataGrouping: {
				units: [[
					'week', // unit name
					[1] // allowed multiples
				], [
					'month',
					[1, 2, 3, 4, 6]
				]]
      }
    }]
  });
}
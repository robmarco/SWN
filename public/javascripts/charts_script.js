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

/* ==========================================================
 # NAME: chart_lines
 # RETURNS: chart (HighStock) for volumen/carga
 # PARAMETERS:
 #   data - source; max_volumen/max_carga - upper limits
# ========================================================== */
function chart_lines(data, max_volumen, max_carga){
  /* Data split by exercise type
   * data[i][j][1] = AL
   * data[i][j][2] = AM
   * data[i][j][3] = AI
   * data[i][j][4] = TEC
   * data[i][j][5] = VEL */
   
  var volumen = [],
      carga   = [],
      vol_al  = [],
      vol_am  = [],
      vol_ai  = [],
      vol_tec = [],
      vol_vel = [], 
      car_al  = [],
      car_am  = [],
      car_ai  = [],
      car_tec = [],
      car_vel = [], 
      dataLength = data.length;
    
  for (i = 0; i < dataLength; i++) {
    volumen.push([ 
      data[i][0], // the date
      data[i][1], // volumen
    ]);
    
    carga.push([
      data[i][0], // the date
      data[i][2] // carga
    ]);

    vol_al.push([
      data[i][0], //the date
      data[i][3][1] //volumen - tec
    ]);

    vol_am.push([
      data[i][0], //the date
      data[i][3][2] //volumen - tec
    ]);

    vol_ai.push([
      data[i][0], //the date
      data[i][3][3] //volumen - tec
    ]);

    vol_tec.push([
      data[i][0], //the date
      data[i][3][4] //volumen - tec
    ]);

    vol_vel.push([
      data[i][0], //the date
      data[i][3][5] //volumen - tec
    ]);

    //------------

    car_al.push([
      data[i][0], //the date
      data[i][4][1] //carga - tec
    ]);

    car_am.push([
      data[i][0], //the date
      data[i][4][2] //carga - tec
    ]);

    car_ai.push([
      data[i][0], //the date
      data[i][4][3] //carga - tec
    ]);

    car_tec.push([
      data[i][0], //the date
      data[i][4][4] //carga - tec
    ]);

    car_vel.push([
      data[i][0], //the date
      data[i][4][5] //carga - tec
    ]);

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
      selected: 0
    },

    title: {
      text: "Análisis Volumen/Carga por Microciclo"
    },

    yAxis: [{
      title: {
        text: "Volumen"
      },
      height: 200,
      lineWidth: 2,
      plotLines : [{
        value : max_volumen,
        color : 'red',
        dashStyle : 'shortdash',
        width : 2,
        label : {
            text : "Máximo Volumen" 
        }
      }]
    }, {
      title: {
        text: "Carga"
      },
      top: 300,
      height: 100,
      offset: 0,
      lineWidth: 2,
      plotLines : [{
        value : max_carga,
        color : 'green',
        dashStyle : 'shortdash',
        width : 2,
        label : {
            text : "Máxima Carga" 
        }
      }]
    }],

    xAxis: {
      tickInterval: 24*3600*7*1000
    },
      
    series: [
      {
        type: 'area',
        name: "Volumen total",
        data: volumen,
        fillColor : {
          linearGradient : {
            x1: 0, 
            y1: 0, 
            x2: 0, 
            y2: 1
          },
          stops : [[0, Highcharts.getOptions().colors[0]], [1, 'rgba(0,0,0,0)']]
        }
      },
      {
        type: 'line',
        name: "AL",
        data: vol_al
      },
      {
        type: 'line',
        name: "AM",
        data: vol_am
      },
      {
        type: 'line',
        name: "AI",
        data: vol_ai
      },
      {
        type: 'line',
        name: "Téc",
        data: vol_tec
      },
      {
        type: 'line',
        name: "Vel",
        data: vol_vel
      },
      {
        type: 'area',
        name: "Carga total",
        data: carga,
        yAxis: 1,
        fillColor : {
          linearGradient : {
            x1: 0, 
            y1: 0, 
            x2: 0, 
            y2: 1
          },
          stops : [[0, Highcharts.getOptions().colors[0]], [1, 'rgba(0,0,0,0)']]
        }
      },
      {
        type: 'line',
        name: 'AL',
        data: car_al,
        yAxis: 1
      },
      {
        type: 'line',
        name: 'AM',
        data: car_am,
        yAxis: 1
      },
      {
        type: 'line',
        name: 'AI',
        data: car_ai,
        yAxis: 1
      },
      {
        type: 'line',
        name: 'Téc',
        data: car_tec,
        yAxis: 1
      },
      {
        type: 'line',
        name: 'Vel',
        data: car_vel,
        yAxis: 1
      }
    ]
  });
};

/*  ==========================================================
 # NAME: micro_stacked_bar
 # RETURNS: HighChart with stacked bars containing volumy by
 #          exercise and by day
 # PARAMETERS: data
 # ========================================================== */
function micro_stacked_bar(data){
  /* Data split by exercise type
   * data[i][2][1] = AL
   * data[i][2][2] = AM
   * data[i][2][3] = AI
   * data[i][2][4] = TEC
   * data[i][2][5] = VEL */

  var al = [0,0,0,0,0,0,0],
      am = [0,0,0,0,0,0,0],
      ai = [0,0,0,0,0,0,0],
      tec = [0,0,0,0,0,0,0],
      vel = [0,0,0,0,0,0,0]

  for (i = 0; i < data.length; i++) {
    al[data[i][0]-1]=data[i][2][1] // data[i][0]-1 => Date of week - 1 to calc position in vector
    am[data[i][0]-1]=data[i][2][2]
    ai[data[i][0]-1]=data[i][2][3]
    tec[data[i][0]-1]=data[i][2][4]
    vel[data[i][0]-1]=data[i][2][5]
  }

  chart = new Highcharts.Chart({
    chart: {
      renderTo: 'orders_chart_2',
      type: 'bar'
    },
    title: {
      text: 'Análisis Volumen del Microciclo por Zona Energética'
    },
    xAxis: {
      categories: ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo']
    },
    yAxis: {
      min: 0,
      title: {
          text: 'Volumen'
      },
      stackLabels: {
        formatter: function() {
          return this.total + 'm';
        },
        enabled: true,
        style: {
          fontWeight: 'bold',
          color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
        }
      }
    },
    legend: {
      backgroundColor: '#FFFFFF',
      reversed: true
    },
    tooltip: {
      formatter: function() {
        return ''+
          '<b>'+this.series.name +':</b> '+ this.y + 'm (' + Math.round(this.y/this.point.stackTotal*100*100)/100 + '%)' ;
      }
    },
    plotOptions: {
      series: {
        stacking: 'normal'
      }
    },
    series: [
    {
      name: 'AL',
      data: al
    },{
      name: 'AM',
      data: am
    },
    {
      name: 'AI',
      data: ai
    },{
      name: 'Técnica',
      data: tec
    },{
      name: 'Velocidad',
      data: vel
    }]
  });
};

/* ==========================================================
 # NAME: {1:this}
 # RETURNS: {2}
 # PARAMETERS: {3}
 # ========================================================== */
function category_chart(categories, male, female, total_swimmers){
  chart = new Highcharts.Chart({
    chart: {
      renderTo: 'swimmers_chart',
      type: 'bar'
    },
    title: {
      text: 'Nadadores por categoría y género'
    },
    xAxis: [{
      categories: categories,
      reversed: false
    }, { // mirror axis on right side
      opposite: true,
      reversed: false,
      categories: categories,
      linkedTo: 0
    }],
    yAxis: {
      title: {
        text: null
      },
      //allowDecimals: false,
      labels: {
        formatter: function(){
          return ( Math.abs(this.value) );
        }
      }      
    },

    plotOptions: {
      series: {
        stacking: 'normal'
      }
    },

    tooltip: {
      formatter: function(){
        return '<b>'+ this.series.name +', edad '+ this.point.category +'</b><br/>'+
          'Cantidad: '+ Highcharts.numberFormat(Math.abs(this.point.y), 0) + ' (' + Math.round(Math.abs(this.point.y)/total_swimmers*1000)/10 + '%)';
      }
    },

    series: [{
      name: 'Masculino',
      data: male
    }, {
      name: 'Femenino',
      data: female
    }]
  });
};
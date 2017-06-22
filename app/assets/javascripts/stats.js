var ctx = document.getElementById("statChart");

function newDateString(days) {
          return moment().add(days, 'd').format();
}

function randomScalingFactor() {
          return Math.round(Math.random() * 100 * (Math.random() > 0.5 ? 1 : 1));
}

function newDate(days) {
          return moment().add(days, 'd').toDate();
}

var config = {
			type: 'line',
			data: {
				datasets: points_dataset
			},
			options: {
				responsive: false,
                                        maintainAspectRatio: true,
	            title:{
	                display:true,
	                text:"Response Time Chart"
	            },
				scales: {
					xAxes: [{
						type: "time",
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'Date'
						}
					}],
					yAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'time (ms)'
						}
					}]
				},
				tooltips: {
          titleFontSize : 16,
          callbacks: {
            title: function(tooltipItems, data) {
                return "Point description";
            },

            label: function(tooltipItem, data) {
                return "Response time: "+tooltipItem.yLabel;
            },
            afterLabel: function(tooltipItem, data) {
                return "Date: "+tooltipItem.xLabel;
            }
          }
        }
			}
		};


var myChart = new Chart(ctx, config);

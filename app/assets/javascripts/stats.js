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
				datasets: [
                                                  dataset1
                                        ]
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
				}
			}
		};


var myChart = new Chart(ctx, config);
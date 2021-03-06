function newDateString(days) {
          return moment().add(days, 'd').format();
}

function randomScalingFactor() {
          return Math.round(Math.random() * 100 * (Math.random() > 0.5 ? 1 : 1));
}

function newDate(days) {
          return moment().add(days, 'd').toDate();
}

function getPoint(tooltipItem,data) {
          let datasets=data["datasets"];
          let dataset= datasets[tooltipItem.datasetIndex];
          return dataset.data[tooltipItem.index];
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
            time: {
							displayFormats: {
                minute: "h:mm"
              }
						}
					}],
					yAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'response time (ms)'
						}
					}]
				},
				tooltips: {
          titleFontSize : 16,
          callbacks: {
            title: function(tooltipItems, data) {
                return "";
            },
            label: function(tooltipItem, data) {
              let point = getPoint(tooltipItem, data)
              return point["location"];
            },
            afterLabel: function(tooltipItem, data) {
                let datasets=data["datasets"];
                let dataset= datasets[tooltipItem.datasetIndex];
                let point= dataset.data[tooltipItem.index];
                let result=[];
                result.push("Response time: "+tooltipItem.yLabel);
                result.push("Time: "+point["time"]);
                result.push("Status: "+point["status"]);
                if (point["error"]!="") {
                  result.push("Error: "+point["error"]);
                }
                return result;
            }
          }
        }
			}
		};


var myChart = new Chart(document.getElementById("statChart"), config);

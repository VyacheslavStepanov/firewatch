var ctx = document.getElementById("statChart");

function getPoint(tooltipItem,data) {
  var datasets=data["datasets"];
  var dataset= datasets[tooltipItem.datasetIndex];
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
    title: {
      display:true,
      text:"Response Time Chart"
    },
		scales: {
			xAxes: [{
				type: "time",
				display: true,
        time: {
					displayFormats: {
            minute: "hh:mm"
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
      titleFontSize: 16,
      callbacks: {
        title: function(tooltipItems, data) {
          return "";
        },
        label: function(tooltipItem, data) {
          var point = getPoint(tooltipItem, data);
          return point["location"];
        },
        afterLabel: function(tooltipItem, data) {
          var point = getPoint(tooltipItem, data);
          var result=[];
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

var myChart = new Chart(ctx, config);

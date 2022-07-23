import ReactECharts from 'echarts-for-react';

function FishDataChart() {
  const minValue = 100
  const maxValue = 450

  const option = {
    tooltip: {
      trigger: 'axis'
    },
    xAxis: {
      name: 'Time',
      type: 'time',
    },
    yAxis: {
      name: 'pH',
      type: 'value',
    },
    series: [
      {
        name: 'pH Value',
        data: [
          ['2019-10-10', 200],
          ['2019-10-11', 560],
          ['2019-10-12', 750],
          ['2019-10-13', 580],
          ['2019-10-14', 250],
          ['2019-10-15', 300],
          ['2019-10-16', 450],
          ['2019-10-17', 300],
          ['2019-10-18', 100],
        ],
        type: 'line',
        markLine: {
          symbol: 'none',
          silent: true,
          animation: false,
          data: [
            { name: 'min', yAxis: minValue, lineStyle: { color: 'red', width: 2 } },
            { name: 'max', yAxis: maxValue, lineStyle: { color: 'red', width: 2 } },
          ],
        },
      },
    ],
  };
  return <ReactECharts option={option} />;
}

export default FishDataChart;

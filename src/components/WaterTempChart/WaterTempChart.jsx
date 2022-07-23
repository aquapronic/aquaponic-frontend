import ReactECharts from 'echarts-for-react';
import { Header } from 'semantic-ui-react';
import styles from './WaterTempChart.module.scss';

function WaterTempChart() {
  const minValue = 100;
  const maxValue = 450;

  const option = {
    grid: { top: '18%', left: '12%', right: '15%', bottom: '15%' },
    tooltip: {
      trigger: 'axis',
    },
    xAxis: {
      name: 'Time',
      type: 'time',
    },
    yAxis: {
      name: 'Temp (°C)',
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
  return (
    <div className={styles.container}>
      <Header size="large">Water Temperature</Header>
      <ReactECharts className={styles.chart} option={option} />
    </div>
  );
}

export default WaterTempChart;

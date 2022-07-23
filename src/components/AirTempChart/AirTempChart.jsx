import ReactECharts from 'echarts-for-react';
import { Header } from 'semantic-ui-react';
import styles from './AirTempChart.module.scss';

function AirTempChart() {
  const minValue = 100;
  const maxValue = 150;

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
          ['2019-10-10', 100],
          ['2019-10-11', 160],
          ['2019-10-12', 150],
          ['2019-10-13', 180],
          ['2019-10-14', 150],
          ['2019-10-15', 100],
          ['2019-10-16', 150],
          ['2019-10-17', 100],
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
      <Header size="large">Air Temperature</Header>
      <ReactECharts className={styles.chart} option={option} />
    </div>
  );
}

export default AirTempChart;

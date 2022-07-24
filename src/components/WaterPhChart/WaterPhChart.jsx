import ReactECharts from 'echarts-for-react';
import { Header } from 'semantic-ui-react';
import styles from './WaterPhChart.module.scss';

function WaterPhChart({ data }) {
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
      name: 'pH',
      type: 'value',
    },
    series: [
      {
        name: 'Water pH',
        data: data,
        type: 'line',
        markLine: {
          symbol: 'none',
          silent: true,
          animation: false,
          data: [
            { name: 'min', yAxis: 6.4, lineStyle: { color: 'red', width: 2 } },
            { name: 'max', yAxis: 7.4, lineStyle: { color: 'red', width: 2 } },
          ],
        },
      },
    ],
  };
  return (
    <div className={styles.container}>
      <Header size="large">Water pH</Header>
      <ReactECharts className={styles.chart} option={option} />
    </div>
  );
}

export default WaterPhChart;

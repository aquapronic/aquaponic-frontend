import ReactECharts from 'echarts-for-react';
import { Header } from 'semantic-ui-react';
import styles from './WaterTempChart.module.scss';

function WaterTempChart({ data }) {
  const option = {
    grid: { top: '18%', left: '15%', right: '15%', bottom: '15%' },
    tooltip: {
      trigger: 'axis',
    },
    xAxis: {
      name: 'Time',
      type: 'time',
    },
    yAxis: {
      name: 'Temperature',
      type: 'value',
      axisLabel: {
        formatter: '{value} °C',
      },
    },
    series: [
      {
        name: 'pH Value',
        data,
        type: 'line',
        markLine: {
          symbol: 'none',
          silent: true,
          animation: false,
          data: [
            { name: 'min', yAxis: 18.3, lineStyle: { color: 'red', width: 2 } },
            { name: 'max', yAxis: 29.4, lineStyle: { color: 'red', width: 2 } },
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

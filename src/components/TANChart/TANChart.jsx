import ReactECharts from 'echarts-for-react';
import { Header } from 'semantic-ui-react';
import styles from './TANChart.module.scss';

function TANChart({ data }) {
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
      name: 'Concentration',
      type: 'value',
      axisLabel: {
        formatter: '{value} ppm',
      },
    },
    series: [
      {
        name: 'TAN',
        data,
        type: 'line',
        markLine: {
          symbol: 'none',
          silent: true,
          animation: false,
          data: [{ name: 'max', yAxis: 1, lineStyle: { color: 'red', width: 2 } }],
        },
      },
    ],
  };
  return (
    <div className={styles.container}>
      <Header size="large">Total Ammonia Nitrogen</Header>
      <ReactECharts className={styles.chart} option={option} />
    </div>
  );
}

export default TANChart;

import { useMemo } from 'react';
import { useTable } from 'react-table';
import { Header, Table } from 'semantic-ui-react';
import styles from './WaterChangeTable.module.scss';

function WaterChangeTable({ data }) {
  const tableOptions = useMemo(
    () => ({
      columns: [
        {
          Header: 'Index',
          accessor: 'id',
        },
        {
          Header: 'Timestamp',
          accessor: 'timestamp',
        },
      ],
      data,
    }),
    [data]
  );

  const { getTableProps, getTableBodyProps, headerGroups, rows, prepareRow } = useTable(tableOptions);

  return (
    <div className={styles.container}>
      <Header size="large">Water Change Records</Header>
      <div className={styles.tableContainer}>
        <Table {...getTableProps()} celled className={styles.table}>
          <Table.Header>
            {headerGroups.map((headerGroup) => (
              <Table.Row {...headerGroup.getHeaderGroupProps()}>
                {headerGroup.headers.map((column) => (
                  <Table.HeaderCell {...column.getHeaderProps()}>{column.render('Header')}</Table.HeaderCell>
                ))}
              </Table.Row>
            ))}
          </Table.Header>
          <Table.Body {...getTableBodyProps()}>
            {rows.map((row, i) => {
              prepareRow(row);
              return (
                <Table.Row {...row.getRowProps()}>
                  {row.cells.map((cell) => {
                    return <Table.Cell {...cell.getCellProps()}>{cell.render('Cell')}</Table.Cell>;
                  })}
                </Table.Row>
              );
            })}
          </Table.Body>
        </Table>
      </div>
    </div>
  );
}

export default WaterChangeTable;

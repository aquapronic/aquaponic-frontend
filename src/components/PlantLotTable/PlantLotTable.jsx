import { useMemo } from 'react';
import { useTable } from 'react-table';
import { Table } from 'semantic-ui-react';
import styles from './PlantLotTable.module.scss';

function PlantLotTable({ data }) {
  const tableOptions = useMemo(
    () => ({
      columns: [
        {
          Header: 'Lot No.',
          accessor: 'lotNumber',
        },
        {
          Header: 'Type',
          accessor: 'plantType',
        },
        {
          Header: 'Farm',
          accessor: 'farmName',
        },
        {
          Header: 'Quantity',
          accessor: 'harvestedQuantity',
        },
        {
          Header: 'Price',
          accessor: 'unitPrice',
        },
        {
          Header: 'Started At',
          accessor: 'startDatetime',
        },
        {
          Header: 'Harvested At',
          accessor: 'harvestDatetime',
        },
      ],
      data,
    }),
    [data]
  );
  const { getTableProps, getTableBodyProps, headerGroups, rows, prepareRow } = useTable(tableOptions);

  return (
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
                {row.cells.map((cell) => (
                  <Table.Cell {...cell.getCellProps()}>{cell.render('Cell')}</Table.Cell>
                ))}
              </Table.Row>
            );
          })}
        </Table.Body>
      </Table>
    </div>
  );
}

export default PlantLotTable;

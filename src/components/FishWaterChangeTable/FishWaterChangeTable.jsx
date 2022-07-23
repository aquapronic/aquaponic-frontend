import { useMemo } from 'react';
import { useTable } from 'react-table';
import { Table, TableBody, TableCell, TableHeader, TableHeaderCell, TableRow } from 'semantic-ui-react';

function FishWaterChangeTable() {
  const data = useMemo(
    () => [
      {
        firstName: 'rain',
        lastName: 'pie',
        age: 21,
        visits: 96,
        progress: 12,
        status: 'relationship',
      },
      {
        firstName: 'father',
        lastName: 'insect',
        age: 19,
        visits: 43,
        progress: 37,
        status: 'complicated',
      },
      {
        firstName: 'slope',
        lastName: 'waves',
        age: 9,
        visits: 5,
        progress: 97,
        status: 'relationship',
      },
      {
        firstName: 'bun',
        lastName: 'piano',
        age: 29,
        visits: 82,
        progress: 44,
        status: 'relationship',
      },
      {
        firstName: 'debt',
        lastName: 'produce',
        age: 8,
        visits: 19,
        progress: 40,
        status: 'complicated',
      },
      {
        firstName: 'championship',
        lastName: 'slave',
        age: 28,
        visits: 43,
        progress: 84,
        status: 'single',
      },
      {
        firstName: 'ants',
        lastName: 'nail',
        age: 13,
        visits: 16,
        progress: 42,
        status: 'relationship',
      },
      {
        firstName: 'stamp',
        lastName: 'corn',
        age: 22,
        visits: 53,
        progress: 85,
        status: 'relationship',
      },
      {
        firstName: 'committee',
        lastName: 'mode',
        age: 8,
        visits: 20,
        progress: 41,
        status: 'relationship',
      },
      {
        firstName: 'drawer',
        lastName: 'loss',
        age: 19,
        visits: 60,
        progress: 7,
        status: 'relationship',
      },
      {
        firstName: 'cancer',
        lastName: 'lip',
        age: 21,
        visits: 44,
        progress: 75,
        status: 'relationship',
      },
      {
        firstName: 'creature',
        lastName: 'vase',
        age: 16,
        visits: 78,
        progress: 54,
        status: 'complicated',
      },
      {
        firstName: 'knot',
        lastName: 'oven',
        age: 4,
        visits: 8,
        progress: 31,
        status: 'complicated',
      },
      {
        firstName: 'maid',
        lastName: 'grocery',
        age: 11,
        visits: 21,
        progress: 73,
        status: 'single',
      },
      {
        firstName: 'adjustment',
        lastName: 'sand',
        age: 0,
        visits: 44,
        progress: 33,
        status: 'complicated',
      },
      {
        firstName: 'slave',
        lastName: 'dealer',
        age: 8,
        visits: 65,
        progress: 43,
        status: 'relationship',
      },
      {
        firstName: 'gun',
        lastName: 'fly',
        age: 20,
        visits: 63,
        progress: 19,
        status: 'relationship',
      },
      {
        firstName: 'balance',
        lastName: 'minister',
        age: 26,
        visits: 11,
        progress: 64,
        status: 'complicated',
      },
      {
        firstName: 'screw',
        lastName: 'analysis',
        age: 0,
        visits: 87,
        progress: 79,
        status: 'complicated',
      },
      {
        firstName: 'hospital',
        lastName: 'professor',
        age: 0,
        visits: 93,
        progress: 58,
        status: 'single',
      },
    ],
    []
  );
  const tableOptions = useMemo(
    () => ({
      columns: [
        {
          Header: 'First Name',
          accessor: 'firstName',
        },
        {
          Header: 'Last Name',
          accessor: 'lastName',
        },
      ],
      data,
    }),
    [data]
  );

  const { getTableProps, getTableBodyProps, headerGroups, rows, prepareRow } = useTable(tableOptions);

  return (
    <Table {...getTableProps()} celled>
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
  );
}

export default FishWaterChangeTable;

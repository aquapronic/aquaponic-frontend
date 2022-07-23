import { Container, Grid, Header, Segment } from 'semantic-ui-react';
import styles from './App.module.scss';

function App() {
  return (
    <Container className={styles.container}>
      <Segment vertical>
        <Grid container stackable>
          <Grid.Row>
            <Grid.Column width={16}>
              <Header size="huge">Aquaponic Dashboard</Header>
            </Grid.Column>
          </Grid.Row>
          <Grid.Row>
            <Grid.Column width={16}>
            </Grid.Column>
          </Grid.Row>
        </Grid>
      </Segment>
    </Container>
  );
}

export default App;

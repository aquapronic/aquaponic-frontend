import { Segment } from 'semantic-ui-react';
import styles from './Placeholder.module.scss';

function Placeholder({ content }) {
  return <Segment className={styles.container}>{content || 'No results found'}</Segment>;
}

export default Placeholder;

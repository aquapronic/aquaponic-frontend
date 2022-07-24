import classNames from 'classnames';
import { Segment } from 'semantic-ui-react';
import styles from './HomePage.module.scss';

function HomePage() {
  return (
    <Segment basic className={classNames(styles.container, 'page-root')}>
      <img className={styles.logo} src="/img/aquapronic_logo.svg" alt="Aquapronic Logo" />
      <div className={styles.paragraph}>
        <p>
          Aquaponic is a farming method that benefits from the symbiosis of fish and plant growing together in harmony. This environmental friendly
          technique benefits the adopter and the world in many ways including water efficiency, climate adaptive, potentially chemical free, and
          economically viable. AQUAPRONIC is a blockchain based aquaponic farming aid decentralized app that will take aquaponic farming to its full
          potential. By strengthening the main benefits of the aquaponic farming methodology namely being very efficient with water usage, AQUAPRONIC
          integrates the uses of sensors and web technology to detect, record, and notify the user when there is a need to do so e.g. maintaining the
          pH level of the water, keeping the level of the air and water temperature to the appropriate level according to the growing vegetation and
          fish in the tank etc. This will ensure that both the vegetation and fish are in optimal condition at all time and will be kept so under the
          watchful eyes of AQUAPRONIC.
        </p>
        <p>
          AQUAPRONIC platform takes your farming workflow to the next level by allowing the promotion of your harvested good in its marketplace area.
          Potential customers can now browse through your harvested goods in this area once it is ready to be sold. AQUAPRONIC ensures your potential
          customers by allowing the traceability of your harvested goods without any additional effort. The customers can now be ensured of the
          quality of your harvested goods by checking the history of care taken for each lot of goods before it is harvested. This also allow the
          possibility of quality assurance for certification by certification authorities. AQUAPRONIC fits all sizes of business, whether you wanted
          to start small with one hobby farm, or you already have a number of farms at hand already, AQUAPRONIC is very easy to scale.
        </p>
        <p>Farming with aquaponic like a pro with AQUAPRONIC!</p>
      </div>
    </Segment>
  );
}

export default HomePage;

import React, { useState, useEffect, useCallback } from "react";
import { Container, Row, Col, Button, Form, Card } from "react-bootstrap";
import "./automobiles.css";

const Automobiles = () => {
  const [cars, setCars] = useState([]);
  const [filters, setFilters] = useState({
    priceRangeLeft: 0,
    priceRangeRight: 100000,
    mileageLeft: 0,
    mileageRight: 200000,
    yearLeft: 1980,
    yearRight: 2024,
  });

  // État pour suivre si le panneau de filtre est ouvert
  const [isFilterPanelOpen, setIsFilterPanelOpen] = useState(false);

  // Fonction pour récupérer les données des véhicules depuis l'API
  // Utilisation de useCallback pour mémoriser fetchData
  const fetchData = useCallback(async () => {
    try {
      const response = await fetch(
        "https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/api/vehicules-api.php",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(filters),
        }
      );

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json();
      setCars(data);
    } catch (error) {
      console.error(error);
    }
  }, [filters]); // Les dépendances de fetchData

  // Appel de fetchData au montage du composant et lorsque les filtres changent
  useEffect(() => {
    fetchData();
  }, [fetchData]); // fetchData est maintenant une dépendance

  // Gestionnaire pour les changements de filtre
  const handleFilterChange = (e) => {
    const { name, value } = e.target;
    setFilters((prevFilters) => ({
      ...prevFilters,
      [name]: Number(value), // Assurez-vous que les valeurs numériques sont traitées correctement
    }));
  };

  // Gestionnaire pour la soumission du formulaire de filtre
  const handleSubmit = (e) => {
    e.preventDefault();
    fetchData();
  };

  // Fonction pour réinitialiser les filtres
  const resetFilters = () => {
    setFilters({
      priceRangeLeft: 0,
      priceRangeRight: 100000,
      mileageLeft: 0,
      mileageRight: 200000,
      yearLeft: 1980,
      yearRight: 2024,
    });
  };

  // Gestionnaire pour l'ouverture/fermeture du panneau de filtre
  const toggleFilterPanel = () => {
    setIsFilterPanelOpen(!isFilterPanelOpen);
  };

  return (
    <Container>
      <h1 className="cars">Nos véhicules neufs et occasions</h1>
      <div className="separateur"></div>

      {/* Bouton et panneau de filtre */}
      <Button
        id="filterButton"
        className="filter-button"
        onClick={toggleFilterPanel}
      >
        <img
          src="https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/images/filtre.png"
          alt="Filtrer"
        />
      </Button>

      <div id="filterPanel" className={isFilterPanelOpen ? "shown" : "hidden"}>
        <h2>Filtres</h2>
        {/* Formulaire pour les filtres */}
        <Form id="filterForm" onSubmit={handleSubmit}>
          <Form.Label htmlFor="priceRangeLeft">Fourchette de prix :</Form.Label>
          {/* Input pour le prix minimum */}
          <input
            type="range"
            id="priceRangeLeft"
            name="priceRangeLeft"
            value={filters.priceRangeLeft}
            onChange={handleFilterChange}
            min="0"
            max="50000"
            step="1000"
          />
          {/* Input pour le prix maximum */}
          <Form.Label htmlFor="priceRangeRight"></Form.Label>
          <input
            type="range"
            id="priceRangeRight"
            name="priceRangeRight"
            value={filters.priceRangeRight}
            onChange={handleFilterChange}
            min="50000"
            max="100000"
            step="1000"
          />
          <div className="leftValue">{filters.priceRangeLeft} €</div>
          <div className="rightValue">{filters.priceRangeRight} €</div>

          <Form.Label htmlFor="mileageLeft">Nombre de kilomètres :</Form.Label>
          <input
            type="range"
            id="mileageLeft"
            name="mileageLeft"
            value={filters.mileageLeft}
            onChange={handleFilterChange}
            min="0"
            max="50000"
            step="1000"
          />

          <Form.Label htmlFor="mileageRight"></Form.Label>

          <input
            type="range"
            id="mileageRight"
            name="mileageRight"
            value={filters.mileageRight}
            onChange={handleFilterChange}
            min="50000"
            max="200000"
            step="1000"
          />

          <div className="leftValueKm">{filters.mileageLeft} km</div>
          <div className="rightValueKm">{filters.mileageRight} km</div>

          <Form.Label htmlFor="yearLeft">
            Année de mise en circulation :
          </Form.Label>

          <input
            type="range"
            id="yearLeft"
            name="yearLeft"
            value={filters.yearLeft}
            onChange={handleFilterChange}
            min="1980"
            max="2000"
            step="1"
          />

          <Form.Label htmlFor="yearRight"></Form.Label>

          <input
            type="range"
            id="yearRight"
            name="yearRight"
            value={filters.yearRight}
            onChange={handleFilterChange}
            min="2000"
            max="2024"
            step="1"
          />

          <div className="leftValueYear">{filters.yearLeft}</div>
          <div className="rightValueYear">{filters.yearRight}</div>

          {/* Bouton pour appliquer les filtres */}
          <Button className="filter" type="submit">
            Appliquer le filtre
          </Button>
          <Button className="reset" type="button" onClick={resetFilters}>
            Réinitialiser<span className="resetFilters resetIcon"></span>
          </Button>
        </Form>
      </div>
      {/* Section des vignettes de véhicules */}
      <Row>
        {cars.map((car) => (
          <Col xs={12} sm={6} md={4} lg={3} key={car.id}>
            <Card>
              <Card.Img
                variant="top"
                src={`https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/images/${car.pictures}`}
              />
              <Card.Body>
                <span className="price">{car.price} €</span>
                <div className="details">
                  <div className="features">
                    <span className="marques">{car.brand} </span>
                    <span className="modeles">{car.model} </span>
                    <div className="info-cat">{car.category}</div>
                  </div>
                  <div className="features">
                    <span className="year">Années : </span>
                    <span className="release">{car.year_of_circulation}</span>
                  </div>
                  <div className="features-list">
                    <span className="energy">Energie : </span>
                    <span className="fuel">{car.fuel}</span>
                    <span className="km">{car.mileage} km</span>
                    <span className="icoKM">
                      <img
                        src="https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/images/ico-km.png"
                        alt="Icône KM"
                      />
                    </span>
                  </div>
                </div>
                <Button className="button">
                  
                  <a href={`/caracteristiques/${car.id}`}>VOIR PLUS</a>
                </Button>
              </Card.Body>
            </Card>
          </Col>
        ))}
      </Row>
    </Container>
  );
};

export default Automobiles;

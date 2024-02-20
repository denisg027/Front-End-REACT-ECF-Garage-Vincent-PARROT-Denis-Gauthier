import React, { useEffect, useState } from "react";
import { Container, Row, Col, Image, Card } from "react-bootstrap";
import "./prestations.css";

const Prestations = () => {
  const [prestations, setPrestations] = useState([]);

  useEffect(() => {
    const fetchPrestations = async () => {
      try {
        const response = await fetch(
          "https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/Api/services-api.php"
        );
        const data = await response.json();
        setPrestations(data);
      } catch (error) {
        console.error("Error fetching prestations:", error);
      }
    };

    fetchPrestations();
  }, []);

  return (
    <main id="main">
      <Container>
        <Row>
          <Col>
            <h1 className="prestations">
              Bienvenue au Garage Vincent Parrot : <br /> Expert en Réparation
              Automobile
            </h1>
          </Col>
        </Row>

        <Row>
          <Col>
            <p className="prestations">
              Fort de ses 15 années d'expérience dans le domaine de la
              réparation automobile, le Garage Vincent Parrot est votre
              partenaire de confiance pour tous vos besoins en matière de
              véhicules. Nous sommes fiers de mettre notre expertise au service
              de votre tranquillité d'esprit, en vous offrant une gamme complète
              de prestations de haute qualité.
            </p>
          </Col>
        </Row>

        <Row>
          <Col>
            <h3>Nos Prestations Incluent :</h3>
            {prestations.map((service, index) => {
              const imageUrl = `https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/images/${service.service_picture}`;
              console.log(imageUrl); // Afficher l'URL de l'image dans la console pour la vérifier
              return (
                <Card key={index} className="mb-3">
                  <Row noGutters>
                    <Col md={6}>
                      <Image
                        src={`https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/images/${service.service_picture}`}
                        alt={service.service_name}
                        fluid
                      />
                    </Col>
                    <Col md={6}>
                      <Card.Body>
                        <Card.Title>{service.service_name}</Card.Title>
                        <Card.Text>{service.service_description}</Card.Text>
                      </Card.Body>
                    </Col>
                  </Row>
                </Card>
              );
            })}
          </Col>
        </Row>

        <Row>
          <Col>
            <p className="prestations">
              Chez le Garage Vincent Parrot, nous nous engageons à fournir un
              service fiable, efficace et transparent pour tous les
              propriétaires de véhicules. Votre satisfaction est notre priorité
              absolue. Faites confiance à notre expérience et à notre
              savoir-faire pour prendre soin de votre voiture. Contactez-nous
              dès aujourd'hui pour planifier un rendez-vous ou pour en savoir
              plus sur nos prestations exceptionnelles. Nous sommes là pour vous
              aider à prendre la route en toute confiance.
            </p>
          </Col>
        </Row>

        <Row>
          {[
            "Services.png",
            "Services1.png",
            "Services2.png",
            "Services3.png",
          ].map((imageName, index) => (
            <Col md={3} key={index}>
              <Image
                className="d-block mb-4 h-100"
                src={`https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/images/${imageName}`}
                alt={`prestations${index}`}
                fluid
              />
            </Col>
          ))}
        </Row>
      </Container>
    </main>
  );
};

export default Prestations;

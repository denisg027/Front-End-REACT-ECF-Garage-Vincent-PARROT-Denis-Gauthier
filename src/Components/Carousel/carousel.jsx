import React from "react";
import { Carousel } from "react-bootstrap";
import "./carousel.css";
import sliderImages from "./carouselSlider.jsx";

function CarouselServices() {
  return (
    <>
      <h2 className="text-center">
        <a href="/Services">
          <span>Découvrez nos services : </span>
          <br />
          Réparation, entretien, décalaminage, climatisation, pare-brise, nos
          véhicules neufs et d'occasions
        </a>
      </h2>
      <div className="separateur"></div>
      <div className="carousel-container">
        <Carousel>
          {sliderImages.map((image, index) => (
            <Carousel.Item key={index}>
              <img
                className="d-block w-100"
                src={image.link}
                alt={`Slide ${index}`}
              />
              <Carousel.Caption className="position-absolute custom-caption">
                <div className="af-position-lg af-bg-dark-transparent py-3">
                  <h3>{image.title}</h3>
                  <p>{image.description}</p>
                </div>
              </Carousel.Caption>
            </Carousel.Item>
          ))}
        </Carousel>
      </div>
      <div className="separateur"></div>
    </>
  );
}

export default CarouselServices;

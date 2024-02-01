import React from "react";
import Bienvenue from "../../Components/Bienvenue/bienvenue.jsx";
import CarouselServices from "../../Components/Carousel/carousel.jsx";
import CallToAction from "../../Components/CallToAction/callToAction.jsx";
import Temoignages from "../../Components/Temoignages/temoignages.jsx";
import "./accueil.css";

const Accueil = () => {
  return (
    <div>
      <Bienvenue />
      <CarouselServices />
      <CallToAction />
      <Temoignages />
    </div>
  );
};

export default Accueil;

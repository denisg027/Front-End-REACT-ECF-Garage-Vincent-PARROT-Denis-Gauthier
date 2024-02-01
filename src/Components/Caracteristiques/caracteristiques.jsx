import React, { useState, useEffect } from "react";
import { useParams, Link } from "react-router-dom";
import "./caracteristiques.css";

function Caracteristiques() {
  const [car, setCar] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);
  const { id } = useParams(); // Récupération de l'ID depuis l'URL

  useEffect(() => {
    if (id) {
      fetch(
        `https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/api/caracteristiques-api.php?id=${id}`
      )
        .then((response) => {
          if (!response.ok) {
            throw new Error("La réponse du réseau n'était pas correcte");
          }
          return response.json();
        })
        .then((data) => {
          // Vérifiez si l'API a renvoyé une erreur
          if (data.error) {
            throw new Error(data.error);
          }
          setCar(data);
          setIsLoading(false);
        })
        .catch((error) => {
          console.error(
            "Il y a eu un problème avec l'opération de récupération:",
            error
          );
          setError(error.message);
          setIsLoading(false);
        });
    }
  }, [id]);

  if (isLoading) {
    return <div>Chargement...</div>;
  }

  if (error) {
    return <div>Erreur: {error}</div>;
  }

  if (!car) {
    return <div>Aucune voiture trouvée avec l'ID fournie.</div>;
  }

  // Convertir les chaînes de caractéristiques, d'équipements et d'options en tableaux
  const features = car.features ? car.features.split(", ") : [];
  const equipments = car.equipments ? car.equipments.split(", ") : [];
  const options = car.options ? car.options.split(", ") : [];

  return (
    <main id="main" className="main">
      <Link to="/vehicules" className="btn-retour">
        <img className="icon-retour"
          src={`https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/images/retour.png`}
          alt="icône retour"
        />
        Retour
      </Link>
      <h1 className="cars">
        {car.brand} {car.model}
      </h1>
      <div className="separateur"></div>
      <div className="car-details-container">
        <div className="car-images">
          <img
            src={`https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/images/${car.pictures}`}
            alt={`${car.brand} ${car.model}`}
          />
          <div className="image-slider">
            {/* Slider mini photos du véhicule */}
            {Array.from({ length: 5 }).map(
              (_, index) =>
                car[`pictures${index + 1}`] && (
                  <img
                    key={index}
                    src={`https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/images/${
                      car[`pictures${index + 1}`]
                    }`}
                    alt={`${car.brand} ${car.model} - Additional View ${
                      index + 1
                    }`}
                  />
                )
            )}
          </div>
        </div>

        <div className="car-specs">
          <h2>Caractéristiques</h2>
          <ul>
            {features.map((feature, index) => (
              <li key={index}>{feature}</li>
            ))}
          </ul>
        </div>
      </div>

      <div className="car-description-container">
        <div className="car-equipements">
          <h2>Equipements</h2>
          <div className="equipment-list">
            <ul>
              {equipments.map((equipment, index) => (
                <li key={index}>{equipment}</li>
              ))}
            </ul>
          </div>
        </div>
        <div className="car-options">
          <h2>Options</h2>
          <div className="equipment-list">
            <ul>
              {options.length > 0 ? (
                options.map((option, index) => <li key={index}>{option}</li>)
              ) : (
                <li>Aucune option sur un véhicule d'occasion</li>
              )}
            </ul>
          </div>
        </div>
      </div>

      {/* Ici, vous pouvez ajouter le formulaire de contact en gérant l'état des champs et la soumission du formulaire */}
      {/* ... */}
    </main>
  );
}

export default Caracteristiques;

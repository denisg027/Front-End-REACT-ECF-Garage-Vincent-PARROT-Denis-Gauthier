import React, { useState, useEffect } from "react";
import { useParams, Link } from "react-router-dom";
import "./caracteristiques.css";

function Caracteristiques() {
  const [car, setCar] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);
  const { id } = useParams();

  useEffect(() => {
    if (id) {
      fetch(
        `https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/Api/caracteristiques-api.php?id=${id}`
      )
        .then((response) => {
          if (!response.ok) {
            throw new Error("La réponse du réseau n'était pas correcte");
          }
          return response.json();
        })
        .then((data) => {
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
    return <div className="text-center">Chargement...</div>;
  }

  if (error) {
    return (
      <div className="alert alert-danger" role="alert">
        Erreur: {error}
      </div>
    );
  }

  if (!car) {
    return (
      <div className="alert alert-warning" role="alert">
        Aucune voiture trouvée avec l'ID fournie.
      </div>
    );
  }

  const features = car.features ? car.features.split(", ") : [];
  const equipments = car.equipments ? car.equipments.split(", ") : [];
  const options = car.options ? car.options.split(", ") : [];

  return (
    <main className="container py-4">
      <Link to="/vehicules" className="btn btn-secondary mb-3">
        Retour
      </Link>
      <h1 className="text-center mb-4">
        {car.brand} {car.model}
      </h1>
      <div className="row">
        <div className="col-md-6">
          <img
            src={`https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/Public/images/${car.pictures}`}
            alt={`${car.brand} ${car.model}`}
            className="img-fluid"
          />
          <div className="d-flex justify-content-center mt-2">
            {Array.from({ length: 5 }).map(
              (_, index) =>
                car[`pictures${index + 1}`] && (
                  <img
                    key={index}
                    src={`https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/Public/images/${
                      car[`pictures${index + 1}`]
                    }`}
                    alt={`${car.brand} ${car.model} - Additional View ${
                      index + 1
                    }`}
                    className="img-thumbnail mx-1"
                    style={{ width: "100px", height: "auto" }}
                  />
                )
            )}
          </div>
        </div>
        <div className="col-md-6">
          <h2>Caractéristiques</h2>
          <ul className="list-group list-group-flush">
            {features.map((feature, index) => (
              <li key={index} className="list-group-item">
                {feature}
              </li>
            ))}
          </ul>
          <h2 className="mt-4">Equipements</h2>
          <ul className="list-group list-group-flush">
            {equipments.map((equipment, index) => (
              <li key={index} className="list-group-item">
                {equipment}
              </li>
            ))}
          </ul>
          <h2 className="mt-4">Options</h2>
          <ul className="list-group list-group-flush">
            {options.length > 0 ? (
              options.map((option, index) => (
                <li key={index} className="list-group-item">
                  {option}
                </li>
              ))
            ) : (
              <li className="list-group-item">
                Aucune option sur un véhicule d'occasion
              </li>
            )}
          </ul>
        </div>
      </div>
    </main>
  );
}

export default Caracteristiques;

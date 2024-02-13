import React from 'react';
import './reservationAtelier.css';

function ReservationAtelier() {
    const handleSubmit = (event) => {
        event.preventDefault();
        // Add your logic for handling form submission here
    };

    return (
      <>
        <main id="main">
          <h1 className="booking">Réservez un rendez-vous en atelier</h1>
          <div className="container">
            <form onSubmit={handleSubmit}>
              <label htmlFor="nom">Nom :</label>
              <input type="text" id="nom" name="nom" required />

              <label htmlFor="prenom">Prénom :</label>
              <input type="text" id="prenom" name="prenom" required />

              <label htmlFor="email">Adresse e-mail :</label>
              <input type="email" id="email" name="email" required />

              <label htmlFor="telephone">Numéro de téléphone :</label>
              <input type="tel" id="telephone" name="telephone" required />

              <label htmlFor="message">Message :</label>
              <textarea id="message" name="message" required></textarea>

              <input type="submit" value="Réserver" />
            </form>
          </div>
        </main>
        <footer></footer>
      </>
    );
}

export default ReservationAtelier;

import React, { useState } from "react";
import "./temoignages.css";

const Temoignages = () => {
  const [nom, setNom] = useState("");
  const [commentaire, setCommentaire] = useState("");
  const [note, setNote] = useState("");
  const [message, setMessage] = useState(""); // Pour afficher les messages de succès ou d'erreur

  const handleSubmit = (e) => {
    e.preventDefault();

    // Validation simple côté client
    if (!nom.trim() || !commentaire.trim() || !note) {
      setMessage("Veuillez remplir tous les champs correctement.");
      return;
    }

    // Réinitialiser le message
    setMessage("");

    // You can add validation here to prevent SQL injections

    // Insertion du témoignage dans la base de données
    fetch("/api/temoignages", {
      method: "POST",
      body: JSON.stringify({ nom, commentaire, note }),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("Problème lors de l'envoi du témoignage");
        }
        return response.json();
      })
      .then((data) => {
        console.log(data);
        setMessage("Votre témoignage a été envoyé avec succès.");
        // Réinitialiser le formulaire
        setNom("");
        setCommentaire("");
        setNote("");
      })
      .catch((error) => {
        console.error(error);
        setMessage("Erreur lors de l'envoi du témoignage.");
      });
  };

  return (
    <div>
      <section id="temoignages">
        <h2>Témoignages de nos clients</h2>
        {/* Ici, vous pourriez afficher les témoignages récupérés de la base de données */}
      </section>

      <section id="ajouter-temoignage">
        <h2>Laissez-nous votre témoignage</h2>
        {message && <p>{message}</p>}{" "}
        {/* Affichage des messages de succès ou d'erreur */}
        <form onSubmit={handleSubmit}>
          <label htmlFor="nom">Nom :</label>
          <input
            type="text"
            name="nom"
            value={nom}
            onChange={(e) => setNom(e.target.value)}
            required
          />
          <br />

          <label htmlFor="commentaire">Commentaire :</label>
          <textarea
            name="commentaire"
            value={commentaire}
            onChange={(e) => setCommentaire(e.target.value)}
            required
          ></textarea>
          <br />

          <label htmlFor="note">Note :</label>
          <input
            type="number"
            name="note"
            min="1"
            max="5"
            value={note}
            onChange={(e) => setNote(e.target.value)}
            required
          />
          <br />

          <input type="submit" value="Envoyer" />
        </form>
      </section>
    </div>
  );
};

export default Temoignages;

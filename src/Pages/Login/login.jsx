import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./login.css";

const Login = () => {
  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  // Gestion de la connexion
  const handleLogin = async (e) => {
    e.preventDefault();

    try {
        // Requête POST pour se connecter
      const response = await fetch("/api/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email, password }),
      });

      if (!response.ok) {
        throw new Error("Réponse réseau non ok");
      }

      const user = await response.json();

      // Redirection basée sur le rôle de l'utilisateur
      if (user.role === "admin") {
        navigate.push("/Admin/DashboardAdmin");
      } else {
        navigate.push("/profil");
      }
    } catch (error) {
      setError("Mauvais login ou mot de passe!");
    }
  };

  return (
    <div className="form-container">
      <form onSubmit={handleLogin}>
        <h3>Se connecter</h3>
        {/* Inputs pour email et mot de passe */}
        <input
          type="email"
          id="email"
          name="email"
          required
          placeholder="Votre Email"
          autoComplete="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
        <input
          type="password"
          id="password"
          name="password"
          required
          placeholder="Votre Mot de Passe"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <input
          type="submit"
          name="submit"
          value="Se connecter"
          className="form-btn"
        />
      </form>
      {error && <p className="error-msg">{error}</p>}
    </div>
  );
};

export default Login;

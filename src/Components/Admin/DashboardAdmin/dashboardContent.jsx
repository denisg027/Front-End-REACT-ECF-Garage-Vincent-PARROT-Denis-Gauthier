import React from "react";
import { Routes, Route } from "react-router-dom";
import Users from "../Users/users"; // Composant pour la gestion des utilisateurs
import Services from "../Services/services"; // Composant pour la gestion des services
import Others from "../Others/others"; // Autre composant pour la gestion
import "./dashboardAdmin.css"; // Importation du fichier CSS pour le style


// Composant pour le contenu principal du tableau de bord
const DashboardContent = () => {
  return (
    <div className="content">
      <Routes>
        <Route path="/Admin/Users" element={<Users />} />
        <Route path="/Admin/Services" element={<Services />} />
        <Route path="/Admin/Others" element={<Others />} />
      </Routes>
    </div>
  );
};

export default DashboardContent;

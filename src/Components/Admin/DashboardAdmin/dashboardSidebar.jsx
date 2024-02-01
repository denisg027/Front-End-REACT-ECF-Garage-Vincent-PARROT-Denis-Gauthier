import React from "react";
import { Link } from "react-router-dom";
import "./dashboardAdmin.css"; 


// Composant pour la barre latérale du tableau de bord
const DashboardSidebar = () => {
  return (
    <div className="sidebar">
      <h2>Admin Dashboard</h2>
      <ul>
        <li>
          <Link to="/Admin/Users">Gérer les Utilisateurs</Link>
        </li>
        <li>
          <Link to="/Admin/Services">Gérer les Services</Link>
        </li>
        <li>
          <Link to="/Admin/Others">Autres</Link>
        </li>
      </ul>
    </div>
  );
};


export default DashboardSidebar;

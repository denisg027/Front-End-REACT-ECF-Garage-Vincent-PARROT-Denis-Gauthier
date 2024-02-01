import React from "react";
import "./dashboardAdmin.css"; 
import DashboardSidebar from "./dashboardSidebar"; // Importation du composant dashboardSidebar
import DashboardContent from "./dashboardContent"; // Importation du composant dashboardContent

// Composant principal du tableau de bord administrateur
const DashboardAdmin = () => {
  return (
    <div className="dashboard">
      <DashboardSidebar />
      <DashboardContent />
    </div>
  );
};

export default DashboardAdmin;

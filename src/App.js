import "bootstrap/dist/css/bootstrap.min.css";
import "./Assets/css/style.css";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import CustomNavbar from "./Components/CustomNavbar/customNavbar.jsx";
import Accueil from "./Pages/Accueil/accueil.jsx";
import Vehicules from "./Pages/Vehicules/vehicules.jsx";
import Footer from "./Components/Footer/footer.jsx";
import Services from "./Pages/Services/services.jsx";
import Caracteristiques from "./Components/Caracteristiques/caracteristiques.jsx";
import DashboardAdmin from "./Components/Admin/DashboardAdmin/dashboardAdmin.jsx";


// Composant principal de l'application
function App() {
  return (
    <>
      <Router>
        <CustomNavbar />
        <div>
          <Routes>
            <Route path="/" element={<Accueil />} />
            <Route path="/Services" element={<Services />} />
            <Route path="/Vehicules" element={<Vehicules />} />
            <Route path="/Caracteristiques/:id" element={<Caracteristiques />} />
            <Route path="/Admin/*" element={<DashboardAdmin />} />
          </Routes>
        </div>
      </Router>
      <Footer />
    </>
  );
}

export default App;

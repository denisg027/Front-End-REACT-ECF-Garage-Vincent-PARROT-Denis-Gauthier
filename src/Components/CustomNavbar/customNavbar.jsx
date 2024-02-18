import React, { useState } from "react";
import "./customNavbar.css";
import { Navbar, Nav, Container } from "react-bootstrap";
import { LinkContainer } from "react-router-bootstrap";

function CustomNavbar({ loggedIn, firstname, lastname }) {
  const [expanded, setExpanded] = useState(false);

  // Fonction pour fermer le menu hamburger
  const closeMenu = () => {
    setExpanded(false);
  };

  return (
    <Navbar expanded={expanded} bg="light" expand="lg" fixed="top">
      <Container>
        <Navbar.Brand href="/">
          <img
            className="logo"
            src="https://retz-o-lution-informatique.fr/Garage-Vincent-Parrot.com/Public/images/Logo.png"
            alt="Garage Vincent Parrot"
          />
        </Navbar.Brand>
        <Navbar.Toggle
          aria-controls="basic-navbar-nav"
          onClick={() => setExpanded(expanded ? false : "expanded")}
        />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            <LinkContainer to="/">
              <Nav.Link onClick={closeMenu}>Accueil</Nav.Link>
            </LinkContainer>
            <LinkContainer to="/Services">
              <Nav.Link onClick={closeMenu}>Services</Nav.Link>
            </LinkContainer>
            <LinkContainer to="/Vehicules">
              <Nav.Link onClick={closeMenu}>Véhicules</Nav.Link>
            </LinkContainer>
            {loggedIn ? (
              <>
                <Nav.Link
                  onClick={closeMenu}
                >{`Bonjour, ${firstname} ${lastname}`}</Nav.Link>
                <LinkContainer to="/logout">
                  <Nav.Link onClick={closeMenu}>Déconnexion</Nav.Link>
                </LinkContainer>
              </>
            ) : (
              <LinkContainer to="/router.php?page=login">
                <Nav.Link onClick={closeMenu}>Connexion</Nav.Link>
              </LinkContainer>
            )}
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
}

export default CustomNavbar;

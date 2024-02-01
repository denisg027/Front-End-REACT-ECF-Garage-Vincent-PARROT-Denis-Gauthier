import "./callToAction.css";

const CallToAction = () => {
  return (
    <>
      <div className="button-wrapper">
        <a href="/Vehicules" className="btn-reza">
          Véhicules occasions
        </a>
        <a href="./booking.php" className="btn-reza">
          RDV en Atelier
        </a>
      </div>
      <div className="separateur"></div>
    </>
  );
};

export default CallToAction;

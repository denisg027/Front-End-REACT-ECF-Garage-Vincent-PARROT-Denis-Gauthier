import "./footer.css";

const Footer = () => {
  return (
    <div id="footer">
      <div className="container">
        <div className="row-footer">
          <div className="col-md-6">
            <div id="block-left">
              <p className="text-left">
                <span>Contactez-nous :</span>
                <br />
                <br />
                Garage Vincent Parrot
                <br />
                32, rue commandeant Cousteau 31000 Toulouse
                <br />
                Tél. 05 79 60 20 00
                <br />
                E-mail : contact@garage-vparrot.fr
              </p>
            </div>
          </div>
          <div className="col-md-6">
            <div id="block-right">
              <p className="text-right">
                Propulsé par : {"  "}
                <a
                  href="https://www.retz-o-lution-informatique.fr/"
                  target="_blank"
                  rel="noreferrer"
                >
                  <strong>Retz-o-lution-informatique</strong>
                </a>
                <br />
                <a href="../Assets/mentions-légales/mentions.html">
                  Mentions légales
                </a>{" "}
                <br />
                Ouvert du lundi au vendredi de <br />
                8h00 à 12h00 et de 14h00 à 18h00,
                <br /> le samedi de 8h à 12h00
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Footer;

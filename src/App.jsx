import { useEffect, useState } from "react";

const mapsUrl =
  "https://www.google.com/maps/dir//Poornima+Jewellers,+1st+Main+Rd,+Hosahalli+Extension,+Vijayanagar,+Bengaluru,+Karnataka+560104/@12.96662,77.467714,13z/data=!4m18!1m8!3m7!1s0x3bae3de191a1beed:0xe02a9c7ef2fda275!2sPoornima+Jewellers!8m2!3d12.96662!4d77.5439317!15sChxQb29ybmltYSBKZXdlbGxlcnMgQmVuZ2FsdXJ1kgENamV3ZWxyeV9zdG9yZeABAA!16s%2Fg%2F12607v9ld!4m8!1m0!1m5!1m1!1s0x3bae3de191a1beed:0xe02a9c7ef2fda275!2m2!1d77.5439317!2d12.96662!3e0?entry=ttu&g_ep=EgoyMDI2MDkwOS4wIKXMDSoASAFQAw%3D%3D";

const instagramUrl =
  "https://www.instagram.com/popular/poornima-jewellers-vijayanagar/";

const phoneNumber = "+919000000000";
const whatsappNumber = "919000000000";

const address =
  "#10, 1st Main Rd, Hosahalli Extension, Vijayanagar, Bengaluru, Karnataka 560104";

const heroImages = [
  "https://images.unsplash.com/photo-1786052338245-f64eb727c37c?auto=format&fit=crop&fm=jpg&q=90&w=2400",
  "https://images.unsplash.com/photo-1781758333991-c5c59ca7673d?auto=format&fit=crop&fm=jpg&q=90&w=2400",
  "https://images.unsplash.com/photo-1786310146649-283be8896b36?auto=format&fit=crop&fm=jpg&q=90&w=2400",
  "https://images.unsplash.com/photo-1705326454933-9685fc6888e1?auto=format&fit=crop&fm=jpg&q=90&w=2400",
];

const collections = [
  [
    "Gold Jewellery",
    "Tradition in every detail",
    heroImages[0],
  ],
  [
    "Diamond Jewellery",
    "Brilliance for every occasion",
    heroImages[1],
  ],
  [
    "Silver Jewellery",
    "Grace for everyday",
    heroImages[2],
  ],
  [
    "Bridal Collection",
    "For your special day",
    heroImages[3],
  ],
];

const gallery = [
  heroImages[0],
  heroImages[1],
  heroImages[2],
  heroImages[3],
  "https://images.unsplash.com/photo-1705326454933-9685fc6888e1?auto=format&fit=crop&fm=jpg&q=90&w=1800",
  "https://images.unsplash.com/photo-1781795534086-05daeb464da1?auto=format&fit=crop&fm=jpg&q=90&w=1800",
  "https://images.unsplash.com/photo-1586884681801-52599e77e7eb?fm=jpg&q=90&w=1800",
  "https://images.unsplash.com/photo-1786052352796-04a29e4634e4?auto=format&fit=crop&fm=jpg&q=90&w=1800",
];

function Header() {
  const [menuOpen, setMenuOpen] = useState(false);

  const links = [
    ["Collections", "#collections"],
    ["About", "#about"],
    ["Gallery", "#gallery"],
    ["Appointment", "#appointment"],
  ];

  return (
    <header className="header">
      <div className="wrap nav">
        <a className="brand" href="#">
          <b>✦ Poornima Jewellers</b>
          <small>Elegance · Trust · Tradition</small>
        </a>

        <nav>
          {links.map(([label, href]) => (
            <a key={label} href={href}>
              {label}
            </a>
          ))}
        </nav>

        <button
          className="hamb"
          type="button"
          onClick={() => setMenuOpen(!menuOpen)}
          aria-label="Toggle menu"
          aria-expanded={menuOpen}
        >
          {menuOpen ? "✕" : "☰"}
        </button>
      </div>

      {menuOpen && (
        <div className="mobile">
          <div className="wrap mobile-inner">
            {links.map(([label, href]) => (
              <a
                key={label}
                href={href}
                onClick={() => setMenuOpen(false)}
              >
                {label}
              </a>
            ))}
          </div>
        </div>
      )}
    </header>
  );
}

function Hero() {
  const [index, setIndex] = useState(0);

  useEffect(() => {
    const timer = setInterval(() => {
      setIndex((current) => (current + 1) % heroImages.length);
    }, 5000);

    return () => clearInterval(timer);
  }, []);

  return (
    <section className="hero">
      <div className="slides">
        {heroImages.map((image, i) => (
          <div
            key={image}
            className={`slide ${i === index ? "active" : ""}`}
            style={{ backgroundImage: `url("${image}")` }}
          />
        ))}
      </div>

      <div className="shade" />

      <div className="wrap heroText">
        <small>POORNIMA JEWELLERS</small>

        <h1>
          Jewellery that feels{" "}
          <span>beautifully yours.</span>
        </h1>

        <p>
          Timeless gold, diamond and silver jewellery for weddings,
          celebrations and everyday elegance.
        </p>

        <div className="actions">
          <a className="btn gold" href="#collections">
            Explore Collections
          </a>

          <a className="btn outline" href="#appointment">
            Book a Consultation
          </a>
        </div>

        <div className="hero-notes">
          <span>✦ Crafted with care</span>
          <span>✦ Designed for generations</span>
        </div>
      </div>

      <div className="dots">
        {heroImages.map((_, i) => (
          <button
            key={i}
            type="button"
            className={i === index ? "on" : ""}
            onClick={() => setIndex(i)}
            aria-label={`Show image ${i + 1}`}
          />
        ))}
      </div>
    </section>
  );
}

function TrustSection() {
  const items = [
    ["💎", "Certified Quality", "Hallmarked jewellery"],
    ["🤝", "Trusted Service", "Personal guidance"],
    ["✨", "Wide Collection", "Gold, diamond & silver"],
    ["❤️", "Made for Moments", "Bridal & gifting"],
  ];

  return (
    <section className="trust wrap">
      {items.map(([icon, title, subtitle]) => (
        <div key={title}>
          <span style={{ fontSize: "22px" }}>{icon}</span>
          <b>{title}</b>
          <small>{subtitle}</small>
        </div>
      ))}
    </section>
  );
}

function Collections() {
  return (
    <section className="section wrap" id="collections">
      <small className="eyebrow">OUR COLLECTIONS</small>

      <h2>A piece for every precious moment.</h2>

      <p style={{ color: "var(--muted)", maxWidth: 650 }}>
        Explore jewellery designed to make every celebration feel special.
      </p>

      <div className="grid cards">
        {collections.map(([title, subtitle, image]) => (
          <article className="card" key={title}>
            <img
              src={image}
              alt={title}
              loading="lazy"
            />

            <div>
              <b>{title}</b>
              <small>{subtitle}</small>
            </div>
          </article>
        ))}
      </div>
    </section>
  );
}

function About() {
  return (
    <section className="section alt" id="about">
      <div className="about wrap">
        <img
          src={gallery[4]}
          alt="Poornima Jewellers jewellery"
          loading="lazy"
        />

        <div>
          <small className="eyebrow">
            THE POORNIMA EXPERIENCE
          </small>

          <h2>
            More than jewellery. A memory you keep forever.
          </h2>

          <p>
            Every piece is chosen to feel personal — from the first
            sparkle you love to the jewellery you pass down one day.
          </p>

          <div className="feature-list">
            <div>
              <span>✦</span>
              <b>Curated collections</b>
              <small>
                Traditional artistry with modern style.
              </small>
            </div>

            <div>
              <span>♡</span>
              <b>Personal service</b>
              <small>
                Thoughtful guidance for every purchase.
              </small>
            </div>

            <div>
              <span>◈</span>
              <b>Made for milestones</b>
              <small>
                Weddings, gifting and everyday elegance.
              </small>
            </div>
          </div>

          <a className="btn gold" href="#appointment">
            Book a Consultation
          </a>
        </div>
      </div>
    </section>
  );
}

function Gallery() {
  return (
    <section className="section wrap" id="gallery">
      <small className="eyebrow">FEATURED GALLERY</small>

      <h2>Moments that sparkle.</h2>

      <p style={{ color: "var(--muted)", maxWidth: 650 }}>
        Browse a selection of jewellery highlights.
      </p>

      <div className="grid gallery">
        {gallery.map((image, index) => (
          <img
            key={`${image}-${index}`}
            src={image}
            alt={`Poornima jewellery ${index + 1}`}
            loading="lazy"
          />
        ))}
      </div>
    </section>
  );
}

function Appointment() {
  const [form, setForm] = useState({
    name: "",
    phone: "",
    interest: "Gold Jewellery",
    message: "",
  });

  const submit = (event) => {
    event.preventDefault();

    const text = `Hello Poornima Jewellers,

Name: ${form.name}
Phone: ${form.phone}
Looking for: ${form.interest}
Message: ${form.message}`;

    window.open(
      `https://wa.me/${whatsappNumber}?text=${encodeURIComponent(text)}`,
      "_blank",
      "noopener,noreferrer"
    );
  };

  return (
    <section className="section alt" id="appointment">
      <div className="appointment wrap">
        <div>
          <small className="eyebrow">
            PRIVATE CONSULTATION
          </small>

          <h2>Make your visit memorable.</h2>

          <p>
            Tell us what you are looking for and send your
            requirements directly to WhatsApp.
          </p>

          <div className="steps">
            <div>
              <b>1</b>
              <span>Share your requirement</span>
            </div>

            <div>
              <b>2</b>
              <span>Choose a convenient time</span>
            </div>

            <div>
              <b>3</b>
              <span>Explore your favourites</span>
            </div>
          </div>
        </div>

        <form onSubmit={submit}>
          <input
            name="name"
            value={form.name}
            onChange={(e) =>
              setForm({
                ...form,
                name: e.target.value,
              })
            }
            placeholder="Your Name"
            required
          />

          <input
            name="phone"
            value={form.phone}
            onChange={(e) =>
              setForm({
                ...form,
                phone: e.target.value,
              })
            }
            placeholder="Phone Number"
            required
          />

          <select
            name="interest"
            value={form.interest}
            onChange={(e) =>
              setForm({
                ...form,
                interest: e.target.value,
              })
            }
          >
            <option>Gold Jewellery</option>
            <option>Diamond Jewellery</option>
            <option>Silver Jewellery</option>
            <option>Bridal Collection</option>
            <option>Gifting</option>
          </select>

          <textarea
            name="message"
            value={form.message}
            onChange={(e) =>
              setForm({
                ...form,
                message: e.target.value,
              })
            }
            placeholder="What are you looking for?"
          />

          <button className="btn gold" type="submit">
            💬 Send on WhatsApp
          </button>
        </form>
      </div>
    </section>
  );
}

function Contact() {
  return (
    <section className="section wrap contact" id="contact">
      <div>
        <small className="eyebrow">VISIT US</small>

        <h2>Poornima Jewellers</h2>

        <p>
          <strong>Showroom Address:</strong>
          <br />
          {address}
        </p>
      </div>

      <div className="actions">
        <a
          className="btn gold"
          href={mapsUrl}
          target="_blank"
          rel="noreferrer"
        >
          📍 Directions
        </a>

        <a
          className="btn outlineDark"
          href={`tel:${phoneNumber}`}
        >
          📞 Call
        </a>

        <a
          className="btn wa"
          href={`https://wa.me/${whatsappNumber}`}
          target="_blank"
          rel="noreferrer"
        >
          💬 WhatsApp
        </a>

        <a
          className="btn outlineDark"
          href={instagramUrl}
          target="_blank"
          rel="noreferrer"
        >
          📷 Instagram
        </a>
      </div>
    </section>
  );
}

function Footer() {
  return (
    <footer>
      <div className="wrap">
        <h3>Poornima Jewellers</h3>

        <p>
          Timeless jewellery for celebrations,
          milestones and everyday moments.
        </p>

        <p>
          <strong>📍 Showroom Address</strong>
        </p>

        <p>
          <a
            href={mapsUrl}
            target="_blank"
            rel="noreferrer"
          >
            {address}
          </a>
        </p>

        <p>
          <a
            href={mapsUrl}
            target="_blank"
            rel="noreferrer"
          >
            📍 Get Directions
          </a>
        </p>

        <p>
          <a href={`tel:${phoneNumber}`}>
            📞 Call Poornima Jewellers
          </a>
        </p>

        <p>
          <a
            href={`https://wa.me/${whatsappNumber}`}
            target="_blank"
            rel="noreferrer"
          >
            💬 WhatsApp
          </a>
        </p>

        <p>
          <a
            href={instagramUrl}
            target="_blank"
            rel="noreferrer"
          >
            📷 Follow us on Instagram
          </a>
        </p>

        <small>
          © 2026 Poornima Jewellers. All rights reserved.
        </small>
      </div>
    </footer>
  );
}

function App() {
  return (
    <>
      <Header />

      <main>
        <Hero />
        <TrustSection />
        <Collections />
        <About />
        <Gallery />
        <Appointment />
        <Contact />
      </main>

      <Footer />

      <a
        className="floating-whatsapp"
        href={`https://wa.me/${whatsappNumber}`}
        target="_blank"
        rel="noreferrer"
        aria-label="WhatsApp"
      >
        💬
      </a>
    </>
  );
}

export default App;

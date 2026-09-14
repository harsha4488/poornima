import React, { useEffect, useMemo, useState } from "react";

const slides = [
  {
    image: "/products/001.jpg",
    eyebrow: "THE SIGNATURE EDIT",
    title: "Jewellery that",
    emphasis: "feels like you.",
    text: "Refined gold, diamond brilliance and heirloom-inspired designs for life's most beautiful moments.",
    cta: "Explore Gold",
  },
  {
    image: "/products/004.jpg",
    eyebrow: "BRIDAL COLLECTION",
    title: "Made for your",
    emphasis: "most precious day.",
    text: "Statement bridal jewellery designed around tradition, celebration and unforgettable details.",
    cta: "Explore Bridal",
  },
  {
    image: "/products/002.jpg",
    eyebrow: "DIAMOND COLLECTION",
    title: "Quiet brilliance.",
    emphasis: "Forever.",
    text: "Elegant diamond silhouettes with a timeless glow, curated for moments worth remembering.",
    cta: "Explore Diamonds",
  },
  {
    image: "/products/003.jpg",
    eyebrow: "TRADITIONAL COLLECTION",
    title: "Rooted in heritage.",
    emphasis: "Reimagined today.",
    text: "Temple-inspired craftsmanship and timeless forms, created for the modern celebration.",
    cta: "Explore Traditional",
  },
];

const categories = [
  { title: "Gold", text: "Timeless craftsmanship", image: "/products/005.jpg" },
  { title: "Diamond", text: "Brilliance for every moment", image: "/products/002.jpg" },
  { title: "Traditional", text: "Heritage redefined", image: "/products/003.jpg" },
  { title: "Bridal", text: "For life's biggest moments", image: "/products/004.jpg" },
];

const products = [
  { name: "Emerald Signature Necklace", kind: "Gold", image: "/products/001.jpg", price: "₹1,85,000" },
  { name: "Diamond Floral Studs", kind: "Diamond", image: "/products/007.jpg", price: "₹98,000" },
  { name: "Classic Gold Bangles", kind: "Gold", image: "/products/006.jpg", price: "₹76,500" },
  { name: "Emerald Pendant", kind: "Gold", image: "/products/005.jpg", price: "₹54,000" },
  { name: "Diamond Statement Ring", kind: "Diamond", image: "/products/008.jpg", price: "₹1,25,000" },
  { name: "Bridal Jhumkas", kind: "Bridal", image: "/products/003.jpg", price: "₹78,000" },
  { name: "Ruby Celebration Ring", kind: "Bridal", image: "/products/009.jpg", price: "₹68,500" },
  { name: "Mangalsutra Pendant", kind: "Traditional", image: "/products/011.jpg", price: "₹52,000" },
];

const filters = ["All", "Gold", "Diamond", "Bridal", "Traditional"];

function App() {
  const [slide, setSlide] = useState(0);
  const [filter, setFilter] = useState("All");
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 20);
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  useEffect(() => {
    const timer = window.setInterval(() => {
      setSlide((value) => (value + 1) % slides.length);
    }, 5500);
    return () => window.clearInterval(timer);
  }, []);

  const filtered = useMemo(
    () => filter === "All" ? products : products.filter((p) => p.kind === filter),
    [filter]
  );

  const previous = () => setSlide((value) => (value - 1 + slides.length) % slides.length);
  const next = () => setSlide((value) => (value + 1) % slides.length);
  const current = slides[slide];

  return (
    <div className="app">
      <div className="announcement">
        <span>Vijayanagar, Bengaluru</span>
        <span>TRUST · PURITY · CRAFTSMANSHIP</span>
        <span>Private appointments available</span>
      </div>

      <header className={scrolled ? "header scrolled" : "header"}>
        <a href="#home" className="brand" aria-label="Poornima Jewellers">
          <span className="brand-icon">✦</span>
          <span className="brand-word">
            <strong>POORNIMA</strong>
            <small>JEWELLERS</small>
          </span>
        </a>

        <nav className="nav">
          <a className="active" href="#home">Home</a>
          <a href="#collections">Collections</a>
          <a href="#featured">Jewellery</a>
          <a href="#story">Our Story</a>
          <a href="#visit">Visit Us</a>
          <a href="https://www.instagram.com/popular/poornima-jewellers-vijayanagar/" target="_blank" rel="noreferrer">Instagram</a>
        </nav>

        <div className="header-actions">
          <button aria-label="Search">⌕</button>
          <button aria-label="Wishlist">♡</button>
          <a href="#visit" className="header-cta">Book Appointment</a>
        </div>
      </header>

      <main>
        <section id="home" className="hero">
          <div className="hero-media">
            <img key={current.image} src={current.image} alt="" />
          </div>
          <div className="hero-shade" />
          <div className="hero-grain" />

          <button className="hero-arrow hero-left" onClick={previous} aria-label="Previous slide">←</button>
          <button className="hero-arrow hero-right" onClick={next} aria-label="Next slide">→</button>

          <div className="hero-content">
            <div className="hero-copy">
              <span className="eyebrow">{current.eyebrow}</span>
              <h1>{current.title}<em>{current.emphasis}</em></h1>
              <p>{current.text}</p>
              <div className="hero-buttons">
                <a href="#featured" className="btn gold">{current.cta} <span>↗</span></a>
                <a href="#visit" className="btn ghost">Visit Showroom</a>
              </div>
            </div>

            <div className="hero-side-note">
              <span>MORE THAN</span>
              <strong>JEWELLERY</strong>
              <i />
              <small>A part of your story</small>
            </div>
          </div>

          <div className="hero-footer">
            <div className="slide-count">
              <b>{String(slide + 1).padStart(2, "0")}</b>
              <span>/</span>
              <span>{String(slides.length).padStart(2, "0")}</span>
            </div>
            <div className="slide-progress">
              {slides.map((item, index) => (
                <button
                  key={item.image}
                  onClick={() => setSlide(index)}
                  className={index === slide ? "progress active" : "progress"}
                  aria-label={`Open slide ${index + 1}`}
                />
              ))}
            </div>
            <div className="hero-caption">TIMELESS BEAUTY · FOR EVERY GENERATION</div>
          </div>
        </section>

        <section id="collections" className="collection-section section">
          <div className="section-top">
            <div>
              <span className="kicker">CURATED FOR YOU</span>
              <h2>Shop by collection</h2>
              <p>Discover pieces selected to make everyday moments feel extraordinary.</p>
            </div>
            <a href="#featured" className="text-link">View all jewellery →</a>
          </div>

          <div className="collection-grid">
            {categories.map((item, index) => (
              <a className="collection-tile" href="#featured" key={item.title}>
                <img src={item.image} alt="" />
                <div className="tile-shade" />
                <div className="tile-number">0{index + 1}</div>
                <div className="tile-content">
                  <span>{item.text}</span>
                  <h3>{item.title}</h3>
                  <b>Explore <i>→</i></b>
                </div>
              </a>
            ))}
          </div>
        </section>

        <section className="promise-bar">
          <div><span>◇</span><b>Certified Jewellery</b><small>Carefully curated</small></div>
          <div><span>✓</span><b>Trusted Craft</b><small>Detail in every piece</small></div>
          <div><span>◌</span><b>Secure Service</b><small>Personalised assistance</small></div>
          <div><span>♡</span><b>Showroom Experience</b><small>Visit us in Vijayanagar</small></div>
        </section>

        <section id="featured" className="section featured">
          <div className="section-top">
            <div>
              <span className="kicker">THE POORNIMA EDIT</span>
              <h2>Featured jewellery</h2>
              <p>Signature pieces across gold, diamond, bridal and traditional collections.</p>
            </div>
            <div className="filter-row">
              {filters.map((item) => (
                <button className={filter === item ? "filter active" : "filter"} key={item} onClick={() => setFilter(item)}>
                  {item}
                </button>
              ))}
            </div>
          </div>

          <div className="product-grid">
            {filtered.map((product) => (
              <article className="product" key={product.name}>
                <div className="product-image">
                  <img src={product.image} alt={product.name} loading="lazy" />
                  <span className="product-badge">{product.kind}</span>
                  <button className="heart" aria-label={`Save ${product.name}`}>♡</button>
                </div>
                <div className="product-details">
                  <small>{product.kind.toUpperCase()}</small>
                  <h3>{product.name}</h3>
                  <div className="product-bottom">
                    <strong>{product.price}</strong>
                    <button>View details →</button>
                  </div>
                </div>
              </article>
            ))}
          </div>
        </section>

        <section id="story" className="story">
          <div className="story-image"><img src="/products/010.jpg" alt="" loading="lazy" /></div>
          <div className="story-copy">
            <span className="kicker light">MORE THAN JEWELLERY</span>
            <h2>A legacy of trust.</h2>
            <p>At Poornima Jewellers, every piece is chosen to carry more than beauty. It carries celebration, heritage and memories that stay with you.</p>
            <p>Visit our Vijayanagar showroom to experience the collection in person and receive personalised assistance.</p>
            <a className="btn gold" href="#visit">Discover our story <span>↗</span></a>
          </div>
        </section>

        <section id="visit" className="visit">
          <div className="visit-copy">
            <span className="kicker">VISIT POORNIMA</span>
            <h2>Your next favourite piece is waiting.</h2>
            <p>#10, 1st Main Rd, Hosahalli Extension, Vijayanagar, Bengaluru, Karnataka 560104</p>
            <a
              className="btn gold"
              href="https://www.google.com/maps/dir//Poornima+Jewellers,+1st+Main+Rd,+Hosahalli+Extension,+Vijayanagar,+Bengaluru,+Karnataka+560104/"
              target="_blank"
              rel="noreferrer"
            >
              Get directions <span>↗</span>
            </a>
          </div>
          <div className="visit-card">
            <span>POORNIMA</span>
            <strong>JEWELLERS</strong>
            <small>VIJAYANAGAR · BENGALURU</small>
          </div>
        </section>
      </main>

      <footer className="footer">
        <div>
          <div className="footer-brand">POORNIMA</div>
          <span>JEWELLERS</span>
          <small>A legacy of trust.</small>
        </div>
        <div className="footer-links">
          <a href="#home">Home</a>
          <a href="#collections">Collections</a>
          <a href="#featured">Jewellery</a>
          <a href="#story">Our Story</a>
          <a href="#visit">Visit Us</a>
        </div>
        <div className="footer-right">
          <a href="https://www.instagram.com/popular/poornima-jewellers-vijayanagar/" target="_blank" rel="noreferrer">Instagram ↗</a>
          <small>© 2026 Poornima Jewellers</small>
        </div>
      </footer>
    </div>
  );
}

export default App;

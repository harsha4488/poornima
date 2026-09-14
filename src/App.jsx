import React, { useEffect, useMemo, useState } from 'react';

const MAPS_URL = 'https://www.google.com/maps/dir//Poornima+Jewellers,+1st+Main+Rd,+Hosahalli+Extension,+Vijayanagar,+Bengaluru,+Karnataka+560104/@12.96662,77.467714,13z/data=!4m18!1m8!3m7!1s0x3bae3de191a1beed:0xe02a9c7ef2fda275!2sPoornima+Jewellers!8m2!3d12.96662!4d77.5439317!15sChxQb29ybmltYSBKZXdlbGxlcnMgQmVuZ2FsdXJ1kgENamV3ZWxsZXJ5X3N0b3JlkgENamV3ZWxsZXJ5X3N0b3Jl4m0?entry=ttu&g_ep=EgoyMDI2MDkwOS4wIKXMDSoASAFQAw%3D%3D';
const INSTAGRAM_URL = 'https://www.instagram.com/popular/poornima-jewellers-vijayanagar/';

const categories = [
  { key: 'Gold', title: 'Gold Jewellery', subtitle: 'Classic silhouettes, refined for today.', image: '/products/001.jpg' },
  { key: 'Diamond', title: 'Diamond Jewellery', subtitle: 'Quiet brilliance for unforgettable moments.', image: '/products/004.jpg' },
  { key: 'Silver', title: 'Silver Jewellery', subtitle: 'Elegant accents for every day.', image: '/products/007.jpg' },
  { key: 'Bridal', title: 'Bridal Collection', subtitle: 'Heritage details for your once-in-a-lifetime day.', image: '/products/010.jpg' },
];

const products = [
  { id: 'PJ-001', name: 'Heritage Temple Necklace', category: 'Gold', price: 'Enquire', image: '/products/001.jpg', tag: 'Signature' },
  { id: 'PJ-002', name: 'Lotus Layered Necklace', category: 'Gold', price: 'Enquire', image: '/products/002.jpg', tag: 'New' },
  { id: 'PJ-003', name: 'Ruby Drop Earrings', category: 'Gold', price: 'Enquire', image: '/products/003.jpg', tag: 'Bestseller' },
  { id: 'PJ-004', name: 'Solitaire-inspired Ring', category: 'Diamond', price: 'Enquire', image: '/products/004.jpg', tag: 'Signature' },
  { id: 'PJ-005', name: 'Petal Diamond Studs', category: 'Diamond', price: 'Enquire', image: '/products/005.jpg', tag: 'New' },
  { id: 'PJ-006', name: 'Rose Gold Pendant', category: 'Diamond', price: 'Enquire', image: '/products/006.jpg', tag: 'Edit' },
  { id: 'PJ-007', name: 'Silver Filigree Jhumkas', category: 'Silver', price: 'Enquire', image: '/products/007.jpg', tag: 'Everyday' },
  { id: 'PJ-008', name: 'Silver Leaf Bracelet', category: 'Silver', price: 'Enquire', image: '/products/008.jpg', tag: 'New' },
  { id: 'PJ-009', name: 'Classic Silver Anklet', category: 'Silver', price: 'Enquire', image: '/products/009.jpg', tag: 'Everyday' },
  { id: 'PJ-010', name: 'Bridal Rani Haar Set', category: 'Bridal', price: 'Enquire', image: '/products/010.jpg', tag: 'Bridal' },
  { id: 'PJ-011', name: 'Kemp Stone Bridal Choker', category: 'Bridal', price: 'Enquire', image: '/products/011.jpg', tag: 'Bridal' },
  { id: 'PJ-012', name: 'Antique Bridal Jhumkas', category: 'Bridal', price: 'Enquire', image: '/products/012.jpg', tag: 'Bridal' },
];

const testimonials = [
  { quote: 'A beautiful collection and a very warm shopping experience. The team made choosing the right piece feel effortless.', name: 'Poornima customer', meta: 'Vijayanagar, Bengaluru' },
  { quote: 'The traditional designs feel special without looking dated. There is something for everyday wear as well as celebrations.', name: 'Poornima customer', meta: 'Bengaluru' },
  { quote: 'Lovely presentation, elegant pieces and genuinely helpful service. A jeweller we are happy to return to.', name: 'Poornima customer', meta: 'Vijayanagar, Bengaluru' },
];

function App() {
  const [menuOpen, setMenuOpen] = useState(false);
  const [activeCategory, setActiveCategory] = useState('All');
  const [search, setSearch] = useState('');
  const [modalProduct, setModalProduct] = useState(null);
  const [toast, setToast] = useState('');
  const [testimonial, setTestimonial] = useState(0);

  useEffect(() => {
    document.title = 'Poornima Jewellers — Timeless Jewellery, Bengaluru';
  }, []);

  useEffect(() => {
    const onKey = (event) => event.key === 'Escape' && setModalProduct(null);
    window.addEventListener('keydown', onKey);
    return () => window.removeEventListener('keydown', onKey);
  }, []);

  useEffect(() => {
    if (!toast) return undefined;
    const timer = setTimeout(() => setToast(''), 2400);
    return () => clearTimeout(timer);
  }, [toast]);

  const filteredProducts = useMemo(() => products.filter((p) => {
    const categoryMatch = activeCategory === 'All' || p.category === activeCategory;
    const query = search.trim().toLowerCase();
    const searchMatch = !query || `${p.name} ${p.category} ${p.id}`.toLowerCase().includes(query);
    return categoryMatch && searchMatch;
  }), [activeCategory, search]);

  const scrollTo = (id) => {
    setMenuOpen(false);
    document.getElementById(id)?.scrollIntoView({ behavior: 'smooth', block: 'start' });
  };

  const enquire = (product) => {
    setModalProduct(null);
    setToast(`${product.name} added to your enquiry list`);
    scrollTo('contact');
  };

  return (
    <div className="site-shell">
      <div className="announcement">
        <div className="announcement-inner">
          <span>POORNIMA JEWELLERS</span>
          <span className="announcement-divider" />
          <span>Gold · Diamond · Silver · Bridal</span>
          <span className="announcement-location">Vijayanagar, Bengaluru</span>
        </div>
      </div>

      <header className={`site-header ${menuOpen ? 'menu-open' : ''}`}>
        <div className="nav-wrap">
          <button className="mobile-menu" aria-label="Toggle menu" onClick={() => setMenuOpen((v) => !v)}>
            <span /> <span /> <span />
          </button>
          <button className="brand" onClick={() => scrollTo('home')} aria-label="Poornima Jewellers home">
            <span className="brand-mark">P</span>
            <span className="brand-copy"><strong>POORNIMA</strong><small>JEWELLERS</small></span>
          </button>
          <nav className="main-nav" aria-label="Primary navigation">
            <button onClick={() => scrollTo('home')}>Home</button>
            <button onClick={() => scrollTo('collections')}>Collections</button>
            <button onClick={() => scrollTo('featured')}>Featured</button>
            <button onClick={() => scrollTo('story')}>Our Story</button>
            <button onClick={() => scrollTo('contact')}>Visit Us</button>
          </nav>
          <div className="header-actions">
            <button className="icon-button" onClick={() => scrollTo('featured')} aria-label="Search jewellery">⌕</button>
            <button className="gold-button small" onClick={() => scrollTo('contact')}>Book Appointment</button>
          </div>
        </div>
      </header>

      <main>
        <section className="hero section" id="home">
          <div className="hero-copy">
            <div className="eyebrow">TIMELESS BEAUTY · PERSONAL STORIES</div>
            <h1>Jewellery that<br /><em>feels like you.</em></h1>
            <p className="hero-lede">Discover thoughtfully selected gold, diamond, silver and bridal jewellery at Poornima Jewellers, Vijayanagar.</p>
            <div className="hero-ctas">
              <button className="gold-button" onClick={() => scrollTo('collections')}>Explore Collections <span>↗</span></button>
              <a className="outline-button" href={MAPS_URL} target="_blank" rel="noreferrer">Visit Our Showroom</a>
            </div>
            <div className="hero-trust">
              <div><span>✦</span><strong>Curated collections</strong><small>Traditional + contemporary</small></div>
              <div><span>◇</span><strong>Showroom experience</strong><small>Personalised assistance</small></div>
              <div><span>◌</span><strong>Vijayanagar, Bengaluru</strong><small>Easy to find · Easy to visit</small></div>
            </div>
          </div>
          <div className="hero-visual">
            <div className="hero-card back-card"><img src="/products/006.jpg" alt="Poornima jewellery detail" /></div>
            <div className="hero-card main-card"><img src="/products/001.jpg" alt="Poornima gold jewellery" /></div>
            <div className="hero-orbit">MORE THAN<br /><span>JEWELLERY</span><br />A PART OF<br />YOUR STORY</div>
            <div className="hero-pill">EST. · POORNIMA JEWELLERS</div>
          </div>
        </section>

        <section className="marquee" aria-label="Store promise">
          <div className="marquee-track">
            <span>CRAFTED WITH CHARACTER</span><b>✦</b><span>WORN FOR MEMORIES</span><b>✦</b><span>GOLD · DIAMOND · SILVER</span><b>✦</b><span>TIMELESS BY DESIGN</span><b>✦</b>
            <span>CRAFTED WITH CHARACTER</span><b>✦</b><span>WORN FOR MEMORIES</span><b>✦</b>
          </div>
        </section>

        <section className="collections section" id="collections">
          <div className="section-heading centered">
            <div className="eyebrow">EXPLORE THE EDIT</div>
            <h2>A piece for every precious moment.</h2>
            <p>From heirloom-inspired classics to understated everyday pieces, find your next favourite.</p>
          </div>
          <div className="collection-grid">
            {categories.map((category, index) => (
              <button className={`collection-card card-${index + 1}`} key={category.key} onClick={() => { setActiveCategory(category.key); scrollTo('featured'); }}>
                <img src={category.image} alt={category.title} />
                <div className="collection-overlay" />
                <div className="collection-copy"><small>{String(index + 1).padStart(2, '0')}</small><h3>{category.title}</h3><p>{category.subtitle}</p><span>View collection →</span></div>
              </button>
            ))}
          </div>
        </section>

        <section className="feature-strip">
          <div><span>916</span><strong>Gold</strong><small>Thoughtfully curated</small></div>
          <div><span>◇</span><strong>Diamonds</strong><small>Made to celebrate</small></div>
          <div><span>◐</span><strong>Silver</strong><small>Elegant, effortless</small></div>
          <div><span>♡</span><strong>Personal service</strong><small>Here when you need us</small></div>
        </section>

        <section className="featured section" id="featured">
          <div className="section-heading split-heading">
            <div><div className="eyebrow">THE POORNIMA EDIT</div><h2>Featured jewellery</h2></div>
            <div className="featured-tools">
              <div className="search-box"><span>⌕</span><input value={search} onChange={(e) => setSearch(e.target.value)} placeholder="Search pieces" aria-label="Search jewellery" /></div>
              <div className="filter-row">{['All', 'Gold', 'Diamond', 'Silver', 'Bridal'].map((category) => <button className={activeCategory === category ? 'active' : ''} key={category} onClick={() => setActiveCategory(category)}>{category}</button>)}</div>
            </div>
          </div>
          <div className="product-grid">
            {filteredProducts.map((product) => (
              <article className="product-card" key={product.id}>
                <button className="product-image" onClick={() => setModalProduct(product)} aria-label={`View ${product.name}`}>
                  <img src={product.image} alt={product.name} />
                  <span className="product-tag">{product.tag}</span>
                  <span className="product-view">View ↗</span>
                </button>
                <div className="product-meta"><div><small>{product.category} · {product.id}</small><h3>{product.name}</h3></div><strong>{product.price}</strong></div>
              </article>
            ))}
          </div>
        </section>

        <section className="story section" id="story">
          <div className="story-image"><img src="/products/009.jpg" alt="Silver jewellery detail" /><div className="story-stamp">POORNIMA<br /><span>JEWELLERS</span></div></div>
          <div className="story-copy">
            <div className="eyebrow">OUR STORY</div>
            <h2>More than an ornament.<br /><em>A memory you can wear.</em></h2>
            <p>At Poornima Jewellers, jewellery is part of how we mark the moments that matter — celebrations, milestones, family traditions and everyday expressions of self.</p>
            <p>Our showroom in Vijayanagar brings together gold, diamond, silver and bridal selections with a calm, personal approach to choosing what feels right for you.</p>
            <div className="story-points"><span>01</span><div><strong>Personalised guidance</strong><small>Take your time. Compare, ask, discover.</small></div><span>02</span><div><strong>Heritage-inspired design</strong><small>Classic Indian character with a fresh finish.</small></div></div>
            <a className="text-link" href={MAPS_URL} target="_blank" rel="noreferrer">Find the showroom <span>↗</span></a>
          </div>
        </section>

        <section className="gallery section">
          <div className="section-heading split-heading"><div><div className="eyebrow">MOMENTS OF BRILLIANCE</div><h2>From our visual diary</h2></div><a className="text-link" href={INSTAGRAM_URL} target="_blank" rel="noreferrer">Follow on Instagram <span>↗</span></a></div>
          <div className="gallery-grid">
            {products.slice(0, 6).map((product, i) => <button className={`gallery-tile g-${i + 1}`} key={product.id} onClick={() => setModalProduct(product)}><img src={product.image} alt={product.name} /><span>{product.category}</span></button>)}
          </div>
        </section>

        <section className="testimonial-band">
          <div className="section testimonial-inner">
            <div><div className="eyebrow">WHAT CUSTOMERS SAY</div><h2>Chosen for the piece.<br /><em>Remembered for the experience.</em></h2><div className="stars">★★★★★</div></div>
            <div className="testimonial-card"><p>“{testimonials[testimonial].quote}”</p><strong>{testimonials[testimonial].name}</strong><small>{testimonials[testimonial].meta}</small><div className="testimonial-controls">{testimonials.map((_, i) => <button className={testimonial === i ? 'active' : ''} key={i} onClick={() => setTestimonial(i)} aria-label={`Show review ${i + 1}`} />)}</div></div>
          </div>
        </section>

        <section className="visit section" id="contact">
          <div className="visit-card">
            <div><div className="eyebrow">COME SAY HELLO</div><h2>Your next favourite piece<br /><em>could be waiting.</em></h2><p>Visit Poornima Jewellers in Vijayanagar for a relaxed, personal showroom experience.</p></div>
            <div className="visit-actions"><a className="gold-button" href={MAPS_URL} target="_blank" rel="noreferrer">Get Directions ↗</a><a className="outline-button light" href={INSTAGRAM_URL} target="_blank" rel="noreferrer">View Instagram</a></div>
          </div>
          <div className="contact-grid"><div><small>SHOWROOM</small><strong>#10, 1st Main Rd</strong><p>Hosahalli Extension, Vijayanagar<br />Bengaluru, Karnataka 560104</p></div><div><small>COLLECTIONS</small><strong>Gold · Diamond · Silver</strong><p>Bridal & traditional selections<br />Contemporary everyday pieces</p></div><div><small>ONLINE</small><strong>Instagram</strong><p><a href={INSTAGRAM_URL} target="_blank" rel="noreferrer">Open Poornima Jewellers ↗</a></p></div></div>
        </section>
      </main>

      <footer className="footer">
        <div className="section footer-grid">
          <div><div className="footer-brand"><span className="brand-mark">P</span><span><strong>POORNIMA</strong><small>JEWELLERS</small></span></div><p>Timeless jewellery for modern stories.</p></div>
          <div><small>EXPLORE</small><button onClick={() => scrollTo('collections')}>Collections</button><button onClick={() => scrollTo('featured')}>Featured</button><button onClick={() => scrollTo('story')}>Our Story</button></div>
          <div><small>VISIT</small><p>#10, 1st Main Rd<br />Hosahalli Extension, Vijayanagar<br />Bengaluru 560104</p><a href={MAPS_URL} target="_blank" rel="noreferrer">Directions ↗</a></div>
          <div><small>CONNECT</small><a href={INSTAGRAM_URL} target="_blank" rel="noreferrer">Instagram ↗</a><button onClick={() => scrollTo('contact')}>Book an appointment</button></div>
        </div>
        <div className="footer-bottom section"><span>© 2026 Poornima Jewellers</span><span>Designed with intention in India</span></div>
      </footer>

      <a className="floating-contact" href={MAPS_URL} target="_blank" rel="noreferrer" aria-label="Open directions">↗</a>

      {modalProduct && <div className="modal-backdrop" onClick={() => setModalProduct(null)}><div className="product-modal" onClick={(e) => e.stopPropagation()}><button className="modal-close" onClick={() => setModalProduct(null)} aria-label="Close">×</button><div className="modal-image"><img src={modalProduct.image} alt={modalProduct.name} /></div><div className="modal-copy"><div className="eyebrow">{modalProduct.category} · {modalProduct.id}</div><h2>{modalProduct.name}</h2><p>Explore this piece in the showroom. Our team can help with details, variations and availability.</p><button className="gold-button" onClick={() => enquire(modalProduct)}>Enquire in store <span>↗</span></button><a className="outline-button" href={MAPS_URL} target="_blank" rel="noreferrer">Get directions</a></div></div></div>}
      {toast && <div className="toast">{toast}</div>}
    </div>
  );
}

export default App;

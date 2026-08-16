/* =====================================================================
   WAX & GROOVE — SCRIPT
   Functional only. No motion.
   - Scrollspy
   - Hours pill (M closed, Tu-Th 12-8, F-Sa 12-9, Su 12-6)
   ===================================================================== */

(function () {
  "use strict";

  const navLinks = Array.from(document.querySelectorAll(".nav-link[data-section]"));
  if (navLinks.length) {
    const sections = navLinks
      .map((a) => document.getElementById(a.dataset.section))
      .filter(Boolean);

    if ("IntersectionObserver" in window && sections.length) {
      const observer = new IntersectionObserver(
        (entries) => {
          const visible = entries
            .filter((e) => e.isIntersecting)
            .sort((a, b) => b.intersectionRatio - a.intersectionRatio)[0];
          if (visible) {
            navLinks.forEach((a) =>
              a.classList.toggle("is-active", a.dataset.section === visible.target.id)
            );
          }
        },
        { rootMargin: "-25% 0px -35% 0px", threshold: [0, 0.25, 0.5, 0.75, 1] }
      );
      sections.forEach((s) => observer.observe(s));
    }
  }

  const pill = document.querySelector(".hours-pill");
  if (pill) {
    const dot = pill.querySelector(".dot");
    const now = new Date();
    const day = now.getDay();
    const time = now.getHours() + now.getMinutes() / 60;

    let openHour, closeHour, isOpen;
    if (day === 1) {
      isOpen = false;
    } else if (day === 5 || day === 6) {
      openHour = 12; closeHour = 21;
      isOpen = time >= openHour && time < closeHour;
    } else if (day === 0) {
      openHour = 12; closeHour = 18;
      isOpen = time >= openHour && time < closeHour;
    } else {
      openHour = 12; closeHour = 20;
      isOpen = time >= openHour && time < closeHour;
    }

    if (!isOpen) {
      if (day === 1) {
        pill.querySelector(".hours-text").textContent = "Closed today · opens Tu noon";
      } else {
        const ampm = openHour < 12 ? openHour + "am" : (openHour === 12 ? "noon" : (openHour - 12) + "pm");
        pill.querySelector(".hours-text").textContent = "Closed · opens " + ampm;
      }
      if (dot) dot.style.background = "var(--c-text-mute)";
    }
  }
})();

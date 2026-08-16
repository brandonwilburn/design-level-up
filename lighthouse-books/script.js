/* =====================================================================
   LIGHTHOUSE BOOKS — SCRIPT
   Functional only. No motion.
   - Scrollspy
   - Hours pill (M-W 10-7, Th-Sa 10-8, Su 11-5)
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
    if (day === 0) {
      openHour = 11; closeHour = 17;
    } else if (day === 4 || day === 5 || day === 6) {
      openHour = 10; closeHour = 20;
    } else {
      openHour = 10; closeHour = 19;
    }
    isOpen = time >= openHour && time < closeHour;

    if (!isOpen) {
      pill.querySelector(".hours-text").textContent =
        "Closed · opens " + openHour + "am";
      if (dot) dot.style.background = "var(--c-text-mute)";
    }
  }
})();

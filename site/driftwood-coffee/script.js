/* =====================================================================
   DRIFTWOOD — SCRIPT
   Functional only. No motion.
   - Scrollspy
   - Hours pill (Tu-Sa 7-5, F-Sa 7-6, Su 8-2; closed Monday)
   ===================================================================== */

(function () {
  "use strict";

  /* --- 1. Scrollspy ------------------------------------------------ */
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

  /* --- 2. Hours pill ---------------------------------------------- */
  const pill = document.querySelector(".hours-pill");
  if (pill) {
    const dot = pill.querySelector(".dot");
    const now = new Date();
    const day = now.getDay();   // 0 = Sun
    const hour = now.getHours();
    const minute = now.getMinutes();
    const time = hour + minute / 60;

    let openHour, closeHour, isOpen;
    if (day === 1) {
      isOpen = false;   // Monday closed
    } else if (day === 0) {
      openHour = 8; closeHour = 14;
      isOpen = time >= openHour && time < closeHour;
    } else if (day === 5 || day === 6) {
      openHour = 7; closeHour = 18;
      isOpen = time >= openHour && time < closeHour;
    } else {
      openHour = 7; closeHour = 17;
      isOpen = time >= openHour && time < closeHour;
    }

    if (!isOpen) {
      if (day === 1) {
        pill.querySelector(".hours-text").textContent = "Closed today · opens Tu 7am";
      } else {
        pill.querySelector(".hours-text").textContent =
          "Closed · opens " + openHour + "am";
      }
      if (dot) dot.style.background = "var(--c-text-mute)";
    }
  }
})();

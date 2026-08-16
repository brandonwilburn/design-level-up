/* =====================================================================
   YARD & LARDER — SCRIPT
   Functional only. No motion. The motion grammar in PRINCIPLES.md
   forbids JS-driven animation; this file is purely stateful.

   Two responsibilities:
     1. Scrollspy: highlight the nav link for the section in view.
     2. Hours pill: show "Open" / "Closed" based on the current
        local time. Sunday is 11–4; M–Sa is 9–6 (or 9–7 Friday).
   ===================================================================== */

(function () {
  "use strict";

  /* --- 1. Scrollspy ------------------------------------------------ */
  const navLinks = Array.from(document.querySelectorAll(".nav-link[data-section]"));
  if (navLinks.length) {
    const sectionIds = navLinks.map((a) => a.dataset.section);
    const sections = sectionIds
      .map((id) => document.getElementById(id))
      .filter(Boolean);

    if ("IntersectionObserver" in window && sections.length) {
      const linkById = new Map(navLinks.map((a) => [a.dataset.section, a]));

      const setActive = (id) => {
        navLinks.forEach((a) => a.classList.toggle("is-active", a.dataset.section === id));
      };

      const observer = new IntersectionObserver(
        (entries) => {
          // Pick the entry with the largest intersectionRatio
          // currently intersecting.
          const visible = entries
            .filter((e) => e.isIntersecting)
            .sort((a, b) => b.intersectionRatio - a.intersectionRatio)[0];
          if (visible) setActive(visible.target.id);
        },
        {
          // A "feels right" viewport band: top 25% off, bottom 35% off.
          // Sections compete for the middle of the screen.
          rootMargin: "-25% 0px -35% 0px",
          threshold: [0, 0.25, 0.5, 0.75, 1],
        }
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

    let openHour, closeHour;
    if (day === 0) {
      openHour = 11; closeHour = 16;
    } else if (day === 5) {
      openHour = 9;  closeHour = 19;
    } else if (day >= 1 && day <= 4) {
      openHour = 9;  closeHour = 18;
    } else {
      // Saturday
      openHour = 9;  closeHour = 18;
    }

    const isOpen = time >= openHour && time < closeHour;
    if (!isOpen) {
      pill.lastChild.textContent = " Closed · opens " + openHour + "am";
      if (dot) dot.style.background = "var(--c-text-mute)";
    }
  }
})();

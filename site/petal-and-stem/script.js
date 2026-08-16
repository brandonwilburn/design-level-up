/* =====================================================================
   PETAL & STEM — SCRIPT
   Functional only. No motion.
   - Scrollspy
   - Hours pill (M-W 10-6, Th-F 10-7, Sa 9-6, Su 10-4)
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

  /* No hours pill for Petal & Stem (the season pill is static).
     The script intentionally does nothing more. */
})();

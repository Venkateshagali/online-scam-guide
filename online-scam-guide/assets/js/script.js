document.addEventListener("DOMContentLoaded", function () {
    // Smooth scrolling for navigation links
    document.querySelectorAll("nav ul li a").forEach(anchor => {
        anchor.addEventListener("click", function (e) {
            e.preventDefault();
            const targetId = this.getAttribute("href").substring(0);
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 60,
                    behavior: "smooth"
                });
            }
        });
    });

    // Button hover effects
    document.querySelectorAll(".btn").forEach(button => {
        button.addEventListener("mouseover", function () {
            this.style.transform = "scale(1.05)";
            this.style.transition = "0.3s";
        });
        button.addEventListener("mouseout", function () {
            this.style.transform = "scale(1)";
        });
    });

    // Feature box animation
    document.querySelectorAll(".feature-box").forEach(box => {
        box.style.opacity = "0";
        box.style.transform = "translateY(20px)";
    });

    window.addEventListener("scroll", function () {
        document.querySelectorAll(".feature-box").forEach(box => {
            if (box.getBoundingClientRect().top < window.innerHeight - 50) {
                box.style.opacity = "1";
                box.style.transform = "translateY(0)";
                box.style.transition = "0.6s ease-in-out";
            }
        });
    });
});
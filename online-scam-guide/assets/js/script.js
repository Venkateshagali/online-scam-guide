document.addEventListener("DOMContentLoaded", function () {
    // SEO Optimization: Adding dynamic meta tags
    const metaDescription = document.createElement("meta");
    metaDescription.name = "description";
    metaDescription.content = "Stay informed about the latest online scams. Report fraud, learn prevention tips, and protect yourself from phishing, identity theft, and more.";
    document.head.appendChild(metaDescription);

    const metaKeywords = document.createElement("meta");
    metaKeywords.name = "keywords";
    metaKeywords.content = "online scams, fraud prevention, phishing, identity theft, scam alerts";
    document.head.appendChild(metaKeywords);

    // Structured Data for better search engine visibility
    const structuredData = {
        "@context": "https://schema.org",
        "@type": "WebSite",
        "name": "Online Scam Guide",
        "url": window.location.href,
        "description": "A comprehensive guide to detecting, preventing, and reporting online scams.",
        "publisher": {
            "@type": "Organization",
            "name": "Online Scam Protection"
        }
    };
    const scriptTag = document.createElement("script");
    scriptTag.type = "application/ld+json";
    scriptTag.textContent = JSON.stringify(structuredData);
    document.head.appendChild(scriptTag);

    // Security Enhancements: Input Validation & Sanitization
    function validateInput(input) {
        return input.replace(/</g, "&lt;").replace(/>/g, "&gt;");
    }

    const reportForm = document.getElementById("fraud-report-form");
    if (reportForm) {
        reportForm.addEventListener("submit", function (e) {
            const inputs = reportForm.querySelectorAll("input, textarea");
            inputs.forEach(input => {
                input.value = validateInput(input.value);
            });
        });
    }

    // Secure Fetch Requests
    function secureFetch(url, options = {}) {
        return fetch(url, {
            ...options,
            headers: {
                ...options.headers,
                "Content-Security-Policy": "default-src 'self'",
                "X-Content-Type-Options": "nosniff",
                "X-Frame-Options": "DENY"
            }
        });
    }

    // Performance Optimizations
    if ('loading' in HTMLImageElement.prototype) {
        document.querySelectorAll('img[data-src]').forEach(img => {
            img.src = img.getAttribute('data-src');
        });
    } else {
        const lazyLoadScript = document.createElement("script");
        lazyLoadScript.src = "https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.3.2/lazysizes.min.js";
        document.body.appendChild(lazyLoadScript);
    }

    // Minimize reflows by batching DOM updates
    requestAnimationFrame(() => {
        document.querySelectorAll(".scam-box").forEach(box => {
            box.style.willChange = "transform, opacity";
        });
    });

    // ✅ Fetch Latest Scam Reports from Database and Display on Page
    function fetchLatestReports() {
        fetch("backend/fetch-alerts.php")
            .then(response => response.json())
            .then(data => {
                let reportsContainer = document.getElementById("reports-container");
                reportsContainer.innerHTML = ""; // Clear existing content

                if (data.length === 0) {
                    reportsContainer.innerHTML = "<p>No recent scam reports available.</p>";
                    return;
                }

                data.forEach(report => {
                    let reportCard = `
                        <div class="report-card">
                            <h3 class="report-title">${report.name || "Anonymous"}</h3>
                            <p><strong>Fraud Type:</strong> ${report.fraud_type}</p>
                            <p>${report.description}</p>
                            <p><strong>📅 Date:</strong> ${new Date(report.date).toLocaleString()}</p>
                        </div>
                    `;
                    reportsContainer.innerHTML += reportCard;
                });
            })
            .catch(error => console.error("Error fetching reports:", error));
    }

    // Call the function when page loads
    fetchLatestReports();

    console.log("SEO, security, performance, and latest alerts fetching applied successfully.");
});

document.addEventListener('DOMContentLoaded', function () {
    // Add smooth scrolling to all links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();

            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Initialize lightbox for image gallery
    document.querySelectorAll('.carousel-item img').forEach(img => {
        img.addEventListener('click', function () {
            const src = this.getAttribute('src');
            const lightbox = document.createElement('div');
            lightbox.classList.add('lightbox');
            lightbox.innerHTML = `
                <div class="lightbox-content">
                    <img src="${src}" alt="Gallery Image">
                </div>
            `;
            document.body.appendChild(lightbox);

            lightbox.addEventListener('click', function () {
                document.body.removeChild(lightbox);
            });
        });
    });
});

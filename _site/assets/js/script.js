// pleasant-painting/assets/js/script.js

document.addEventListener('DOMContentLoaded', function() {
    const log = console.log;
    log('Document loaded');

    let images = Array.from(document.querySelectorAll('#image-carousel img'));
    let currentIndex = 0;
    
    function showNextImage() {
        images[currentIndex].classList.remove('active');
        currentIndex = (currentIndex + 1) % images.length;
        images[currentIndex].classList.add('active');
        log(`Image ${currentIndex + 1} displayed`);
    }

    setInterval(showNextImage, 5000);

    let contactForm = document.getElementById('contact-form');
    contactForm.addEventListener('submit', function(event) {
        event.preventDefault();
        alert('Contact form submitted. You will be redirected to the home page.');
        window.location.href = '/';
    });

    let referralForm = document.getElementById('referral-form');
    referralForm.addEventListener('submit', function(event) {
        event.preventDefault();
        alert('Referral form submitted. You will be redirected to the home page.');
        window.location.href = '/';
    });
    
    const colors = ['#5D6D7E', '#85929E', '#A9CCE3', '#D4E6F1'];
    let colorIndex = 0;

    setInterval(() => {
        document.body.style.backgroundColor = colors[colorIndex];
        colorIndex = (colorIndex + 1) % colors.length;
        log(`Background color changed to ${colors[colorIndex]}`);
    }, 15000);
});

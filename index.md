---
layout: default
title: Home
---

<div id="splash-screen" class="text-center p-5" style="position: relative; background: url('/assets/images/splash-bg.jpg') center/cover no-repeat;">
    <div class="overlay" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5);"></div>
    <div class="content" style="position: relative; z-index: 1; color: white;">
        <h1>{{ site.title }}</h1>
        <p>{{ site.description }}</p>
        <a class="btn btn-primary" href="#quote-form" style="background-color: #ff6b6b; border: none; padding: 10px 20px; font-size: 1.2em;">Let's Paint</a>
    </div>
</div>

<section id="services" class="my-5">
    <div class="container">
        <h2 class="text-center">Our Services</h2>
        <div class="row text-center">
            <div class="col-md-4">
                <div class="card mb-4">
                    <img class="card-img-top" src="/assets/images/services/residential-painting.jpg" alt="Residential Painting">
                    <div class="card-body">
                        <h5 class="card-title">Residential Painting</h5>
                        <p class="card-text">Transform your home with our expert touch.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img class="card-img-top" src="/assets/images/services/commercial-painting.jpg" alt="Commercial Painting">
                    <div class="card-body">
                        <h5 class="card-title">Commercial Painting</h5>
                        <p class="card-text">Professional results for your business.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img class="card-img-top" src="/assets/images/services/custom-painting.jpg" alt="Custom Painting">
                    <div class="card-body">
                        <h5 class="card-title">Custom Painting</h5>
                        <p class="card-text">Your vision, our canvas.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img class="card-img-top" src="/assets/images/services/restoration.jpg" alt="Restoration">
                    <div class="card-body">
                        <h5 class="card-title">Restoration</h5>
                        <p class="card-text">Reviving the beauty of your space.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img class="card-img-top" src="/assets/images/services/driveway-painting.jpg" alt="Driveway Painting">
                    <div class="card-body">
                        <h5 class="card-title">Driveway Painting</h5>
                        <p class="card-text">A fresh look for your driveway.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img class="card-img-top" src="/assets/images/services/pressure-cleaning.jpg" alt="Pressure Cleaning">
                    <div class="card-body">
                        <h5 class="card-title">Pressure Cleaning</h5>
                        <p class="card-text">Spotless results, every time.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img class="card-img-top" src="/assets/images/services/color-matching.jpg" alt="Color Matching">
                    <div class="card-body">
                        <h5 class="card-title">Color Matching</h5>
                        <p class="card-text">Perfect shades, perfect harmony.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img class="card-img-top" src="/assets/images/services/free-estimates.jpg" alt="Free Estimates">
                    <div class="card-body">
                        <h5 class="card-title">Free Estimates</h5>
                        <p class="card-text">Get a quote, no strings attached.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img class="card-img-top" src="/assets/images/services/virtual-consults.jpg" alt="Virtual Consults">
                    <div class="card-body">
                        <h5 class="card-title">Virtual Consults</h5>
                        <p class="card-text">Consult with us from anywhere.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img class="card-img-top" src="/assets/images/services/tech-tools.jpg" alt="Tech Tools">
                    <div class="card-body">
                        <h5 class="card-title">Tech Tools for Visualization</h5>
                        <p class="card-text">Visualize your project with ease.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="gallery" class="my-5">
    <div class="container">
        <h2 class="text-center">Our Work</h2>
        <div id="image-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                {% for image in site.data.images %}
                <div class="carousel-item {% if forloop.first %}active{% endif %}">
                    <img src="{{ image }}" class="d-block w-100" alt="Painting Image {{ forloop.index }}">
                </div>
                {% endfor %}
            </div>
            <a class="carousel-control-prev" href="#image-carousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#image-carousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</section>

{% include testimonials.html %}
{% include incentives.html %}
{% include affiliate-marketing.html %}
{% include cta.html %}

<section id="quote-form" class="my-5">
    <div class="container">
        <h2 class="text-center">Get a Quote</h2>
        <form class="container" method="POST" action="https://formspree.io/f/{your-form-id}" enctype="multipart/form-data">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="name">Your Name</label>
                    <input type="text" class="form-control" name="name" placeholder="Your Name" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="email">Your Email</label>
                    <input type="email" class="form-control" name="email" placeholder="Your Email" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="phone">Your Phone</label>
                    <input type="text" class="form-control" name="phone" placeholder="Your Phone" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="contact-method">Preferred Contact Method</label>
                    <select class="form-control" name="contact-method">
                        <option value="appointment">Appointment</option>
                        <option value="video-call">Video Call</option>
                        <option value="phone-call">Phone Call</option>
                        <option value="text">Text</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="message">Your Message</label>
                <textarea class="form-control" name="message" placeholder="Your Message" required></textarea>
            </div>
            <div class="form-group">
                <label for="images">Upload Images (up to 3)</label>
                <input type="file" class="form-control" name="images" accept="image/*" multiple required>
                <small class="form-text text-muted">Please upload up to three images to help us understand your requirements better.</small>
            </div>
            <button type="submit" class="btn btn-primary">Send</button>
        </form>
    </div>
</section>

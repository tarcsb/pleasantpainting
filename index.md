---
layout: default
title: Home
---

<div id="splash-screen" class="text-center p-5" style="position: relative; background: url('/assets/images/splash-bg.jpg') center/cover no-repeat;">
    <div class="overlay" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5);"></div>
    <div class="content" style="position: relative; z-index: 1; color: white;">
        <h1>{{ site.title }}</h1>
        <p>{{ site.description }}</p>
        <a class="btn btn-primary" href="#quote-form" style="background-color: var(--primary-color); border: none; padding: 10px 20px; font-size: 1.2em; border-radius: 25px;">Let's Paint</a>
    </div>
</div>

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

<section id="services" class="my-5">
    <div class="container">
        <h2 class="text-center">Our Services</h2>
        <div class="row text-center">
            {% for service in site.data.services.services %}
            <div class="col-md-4 mb-4">
                <div class="service-button">
                    <span class="service-label">{{ service.name }}</span>
                </div>
            </div>
            {% endfor %}
        </div>
    </div>
</section>

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
            <button type="submit" class="btn btn-primary" style="background-color: var(--primary-color); border-radius: 25px;">Send</button>
        </form>
    </div>
</section>

---
layout: default
title: Home
---

<div id="splash-screen">
    <h1>Pleasant Painting LLC</h1>
    <p>Offering referral bonuses and free estimates</p>
</div>

<nav id="navbar">
    <ul>
        <li><a href="#home">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#contact">Contact</a></li>
    </ul>
</nav>

<section id="home">
    <h2>Welcome to Pleasant Painting LLC</h2>
    <div id="image-carousel">
        {% for image in site.data.images %}
            <img src="{{ image }}" alt="Painting Image {{ forloop.index }}" class="{% if forloop.first %}active{% endif %}">
        {% endfor %}
    </div>
</section>

<section id="about">
    <h2>About Us</h2>
    <p>{{ site.description }}</p>
    <p>Location: 3972 Saranac Ave, West Palm Beach, FL 33409</p>
    <p>Phone: <a href="tel:+15615744550">+1 561-574-4550</a></p>
    <p>Email: <a href="mailto:{{ site.email }}">{{ site.email }}</a></p>
</section>

<section id="contact">
    <h2>Contact Us</h2>
    <form id="contact-form">
        <input type="text" name="name" placeholder="Your Name" required>
        <input type="email" name="email" placeholder="Your Email" required>
        <textarea name="message" placeholder="Your Message" required></textarea>
        <button type="submit">Send</button>
    </form>
</section>

<section id="referral">
    <h2>Referral Bonus</h2>
    <p>Refer a friend and get a bonus! Fill out the form below to refer someone:</p>
    <form id="referral-form">
        <input type="text" name="referrer-name" placeholder="Your Name" required>
        <input type="email" name="referrer-email" placeholder="Your Email" required>
        <input type="text" name="friend-name" placeholder="Friend's Name" required>
        <input type="email" name="friend-email" placeholder="Friend's Email" required>
        <button type="submit">Refer</button>
    </form>
</section>

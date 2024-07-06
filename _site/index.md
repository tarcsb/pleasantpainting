<!-- pleasant-painting/index.md -->
---
layout: default
title: Home
---

<div id="splash-screen">
    <h1>Pleasant Painting LLC</h1>
    <p>Offering referral bonuses and free estimates</p>
</div>

<section id="home">
    <h2>Welcome to Pleasant Painting LLC</h2>
    <div id="image-carousel">
        {% for image in site.data.images %}
            <img src="{{ image }}" alt="Painting Image {{ forloop.index }}" class="{% if forloop.first %}active{% endif %}">
        {% endfor %}
    </div>
</section>

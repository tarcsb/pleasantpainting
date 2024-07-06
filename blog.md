---
layout: default
title: Blog
---

<section id="blog" class="my-5">
    <div class="container">
        <h2 class="text-center">Blog</h2>
        <div class="row">
            {% for post in site.posts %}
            <div class="col-md-4 mb-4">
                <div class="card">
                    {% if post.image %}
                    <img class="card-img-top" src="{{ post.image }}" alt="{{ post.title }}">
                    {% endif %}
                    <div class="card-body">
                        <h3 class="card-title">{{ post.title }}</h3>
                        <p class="card-text">{{ post.excerpt }}</p>
                        <a href="{{ post.url }}" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>
            {% endfor %}
        </div>
    </div>
</section>

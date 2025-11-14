---
title: "📅 Agenda"
permalink: /pages/agenda/
layout: archive
entries_layout: grid
---

<h2>Événements à venir</h2>

{% assign now = site.time | date: '%s' | plus: 0 %}
{% assign sorted = site.events | sort: 'event_start' %}
{% assign shown = 0 %}

<ul class="events">
{% for e in sorted %}
  {% if e.event_start %}
    {% assign event_ts = e.event_start | date: '%s' | plus: 0 %}
    {% if event_ts >= now %}
      <li style="margin-bottom:1.5em;">
        <strong>
          {% if e.external_url %}
            <a href="{{ e.external_url }}">{{ e.title }}</a>
          {% else %}
            {{ e.title }}
          {% endif %}
        </strong><br>
        {{ e.event_start | date: "%d %b %Y, %H:%M" }}
        {% if e.location %} — {{ e.location }}{% endif %}<br>
        {% if e.excerpt %}
          <em>{{ e.excerpt }}</em>
        {% endif %}
      </li>
      {% assign shown = shown | plus: 1 %}
    {% endif %}
  {% endif %}
{% endfor %}
</ul>

{% if shown == 0 %}
<p>Aucun événement à venir pour le moment.</p>
{% endif %}

<h2>Événements passés</h2>

{%- comment -%}
Filtrer les événements passés puis les trier du plus récent au plus ancien.
{%- endcomment -%}
{% assign past_events = "" | split: "" %}
{% for e in sorted %}
  {% if e.event_start %}
    {% assign ts = e.event_start | date: "%s" | plus: 0 %}
    {% if ts < now %}
      {% assign past_events = past_events | push: e %}
    {% endif %}
  {% endif %}
{% endfor %}

{% assign past_sorted = past_events | sort: "event_start" | reverse %}
{% assign last_5 = past_sorted %}

<ul class="events">
{% for e in last_5 %}
  <li style="margin-bottom:1.5em;">
    <strong>
      {% if e.external_url %}
        <a href="{{ e.external_url }}">{{ e.title }}</a>
      {% else %}
        {{ e.title }}
      {% endif %}
    </strong><br>
    {{ e.event_start | date: "%d %b %Y, %H:%M" }}
    {% if e.location %} — {{ e.location }}{% endif %}<br>
    {% if e.excerpt %}
      <em>{{ e.excerpt }}</em>
    {% endif %}
  </li>
{% endfor %}
</ul>

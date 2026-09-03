---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

Education
======
* Ph.D in Computer Science, UNamur, Belgium, 2025
  * Title: <i>ASGARD: An Abstract Model for Adaptive Self-guarded honeypots</i>
* Master of research in Computer Science, INSA-Lyon, France, 2006
* Engineer in Computer Science, ITC, Cambodia, 2003

Work experience
======
* Oct. 2024 - Oct. 2025: Postdoctoral researcher
  * Faculty of Computer Science / University of Namur
  * Topic: Industrialize adaptive self-guarded honeypots
  * Released software:
    * [Asgard honeypot system](https://github.com/sereysethy/asgard)
    * [Command Risk Assessment](https://github.com/sereysethy/cmd_risk_assessment)
  * Docker Images:
    * https://hub.docker.com/repository/docker/stouch/asgard
    * https://hub.docker.com/repository/docker/stouch/cmd_risk_assessment
  * Publications:
    * Touch, S., Colin, JN. (2026). An Adaptive Self-guarded and Risk-Aware Honeypot Using DRL. In: Laborde, R., et al. Computer Security. *ESORICS 2025 International Workshops*. ESORICS 2025. Lecture Notes in Computer Science, vol 16232. Springer, Cham. [https://doi.org/10.1007/978-3-032-16092-8_11](https://doi.org/10.1007/978-3-032-16092-8_11)
    * Touch, S., Fink, J., Colin, JN. (2025). Automated Risk Assessment of Shell-Based Attacks Using a LLM. In: Collart-Dutilleul, S., Ouchani, S., Cuppens, N., Cuppens, F. (eds) *Risks and Security of Internet and Systems*. CRiSIS 2024. Lecture Notes in Computer Science, vol 15456. Springer, Cham. [https://doi.org/10.1007/978-3-031-89350-6_11](https://doi.org/10.1007/978-3-031-89350-6_11)

* Sept. 2017 - Sept. 2024: Teaching assistant / PhD student
  * Faculty of Computer Science / University of Namur
  * Responsibilities:
    * Practical sessions for following courses:
      * Information security: design CTF-based exercises focusing on different types of vulnerabilities and exploits: steganography, network, crytography, pen testing, web attack & defense.
      * Operating systems: Linux system programming in C language (IPC)
      * Web technologies
      * Programming assigment
      * Information system: methods and technology
    * Network and system administration
      * Maintain hyper-visors servers
      * [pfSense](https://www.pfsense.org/) firewall
      * OpenVPN
      * Systems: Linux-based VMs, Gitlab, OAuth

* Oct. 2014 - Aug. 2017: Development manager
  * Responsibilities:
    * Served as project manager, overseeing planning and execution.
    * Led a development team in maintaining and developing mobile and web applications.
  * Technologies Used:
    * Frontend: EmberJS, AngularJS, jQuery, HTML5, CSS3
    * Backend: PHP (Laravel 5), WebSocket, Ruby, Node.js, Erlang, RabbitMQ, gRPC, MySQL, Redis, Docker

* Aug. 2011 - Sept. 2014: Director of an IT department

* Aug. 2007 - Aug. 2008: Manager	of Information Technology	school at
  NGO Pour un Sourire d'Enfant (PSE)

Teaching experience
======
From 2003 until 2017, I delivered lectures to engineering students
in Computer Science at ITC, Cambodia on a variety of subjects,
including but not limited to:
* Introduction to AI
* Operating Systems
* Algorithms and Programming
* Data Structures and Algorithms
* Computer Architecture
* System Analysis and Design
* System Programming on Linux
* C Language
* XML

Skills
======
* Information security: ISO 27001:2022 foundation
* Security tools: Nmap, Metasploit, Wireshark
* ML technologies:
  * [Numpy](https://numpy.org/)
  * [PyTorch](https://pytorch.org/)
  * [Tranformers](https://huggingface.co/docs/transformers/index)
  * [scikit-learn](https://scikit-learn.org/stable/)
  * RL [Gymnasium environment](https://gymnasium.farama.org/)
* Programming languages: C, Python, PHP, Ruby and Java
* Scripting languages: bash and perl
* Web technologies:
  * Python: [Flask](https://flask.palletsprojects.com/en/stable/) and [FastAPI](https://fastapi.tiangolo.com/)
  * [React](https://react.dev/)
  * [EmberJS](https://emberjs.com/)
  * [Laravel PHP](https://laravel.com/)
  * [CakePHP](https://cakephp.org/)
* Web semantic ontology: XML Schema RDF(S) / OWL / SPARQL
* Web server: [Nginx](https://nginx.org/), [Apache](https://httpd.apache.org/), [node.js](https://nodejs.org) and [gunicorn](https://gunicorn.org/)
* SQL Databases: MySQL, Postgres and Oracle (10g and 12g)
* NoSQL: [MongoDB](https://www.mongodb.com/) and [CouchDB](https://couchdb.apache.org/)
* System administrations: Linux, [Proxmox](https://www.proxmox.com/en/), pfSense firewall, Samba, OpenLDAP
* Operating systems: Linux-based systems (CentOS, Debian, Ubuntu, PiOS), MacOS, and Windows
* Cloud services: AWS, Google Cloud
* Software development and deployment: Docker
* Messaging technologies: MQTT, RabbitMQ (AMQP) and Redis

Recent Publications
======
  <ul>{% for post in site.publications reversed %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>

Talks
======
  <ul>{% for post in site.talks reversed %}
    {% include archive-single-talk-cv.html  %}
  {% endfor %}</ul>

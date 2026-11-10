---
title: Comment un honeypot adaptatif et auto-défensif pourrait-il détecter ou limiter une cyberattaque contre les équipements frigorifiques ?
date: 2026-11-10
permalink: /fr/asgard-contre-cyberattaque-equipements-frigorifiques/
categories:
  - fr
excerpt: "Selon l’alerte du CERT-FR, de nombreux contrôleurs de réfrigération (Danfoss AK-SM et AK-SC, Copeland xweb, Dixell xweb) ont été compromis, et des campagnes d’attaques sont probablement toujours en cours. L’alerte ne détaille pas les vecteurs d’accès, mais l’exposition sur Internet, l’absence de correctifs et les mots de passe par défaut sont des hypothèses plausibles. En plus des mesures de base recommandées par CERT-FR, les honeypots peuvent compléter ces mesures. Le modèle abstrait ASGARD, fondé sur un proxy, peut être placé devant le système de contrôle ou les contrôleurs, en émulant leurs protocoles. Grâce à l’apprentissage par renforcement, il laisse passer le trafic légitime ou à faible risque, et bloque ou substitue une réponse inoffensive au trafic suspect, tout en continuant à observer l’attaquant."
header:
  image: "blog/cover-asgard-cyberattaque-frigo.png"

tags: 
  - honeypot
  - OT
  - ICS
  - modbus
  - cybersecurity
---

Des contrôleurs de réfrigération de magasins compromis en nombre, selon le CERT-FR.

D’après l’alerte CERTFR-2026-ALE-012 du CERT-FR (publiée le 12 octobre 2026), de nombreux contrôleurs à distance d’installations de réfrigération ont été compromis, notamment des équipements des séries Danfoss AK-SM et AK-SC, ainsi que des Copeland xweb et Dixell xweb. Selon la dernière mise à jour de l’alerte (16 octobre 2026), des campagnes d’attaques sont probablement toujours en cours. Ces contrôleurs supervisent les installations frigorifiques des magasins et autres commerces ; le System Manager AK-SM 800A appartient à la série AK-SM.

L’AK-SM 800A offre une interface Web donnant une vue d’ensemble des équipements frigorifiques contrôlés, et il peut être accessible depuis l’extérieur s’il est connecté à Internet ou à un réseau non sécurisé. Selon le CERT-FR, l’exposition d’une interface de gestion sur Internet est contraire aux bonnes pratiques, et un équipement sans correctif ainsi exposé a de fortes chances d’être compromis. L’alerte ne détaille pas les vecteurs d’accès. Plusieurs hypothèses sont plausibles : l’exposition sur Internet, l’absence de mises à jour ou des identifiants par défaut non modifiés.

Les mesures de sécurité de base recommandées par le CERT-FR (supprimer l’exposition Internet, passer par un VPN, mettre à jour le firmware, changer les mots de passe par défaut) restent prioritaires. Les honeypots peuvent les compléter, ainsi que les outils de défense (firwall, antivirus) et de détection (IDS/IPS, SIEM). Un honeypot est un leurre informatique conçu pour être sondé, attaqué et compromis et observer leurs méthodes. S’il est correctement déployé, il peut même leur faire croire que leur objectif est atteint, ce qui permet de continuer à observer leur activité malveillante.

Concrètement, comment le modèle abstrait de honeypots adaptatifs et auto-défensifs nommé ASGARD, que j’ai développé, peut-il aider dans la détection, la prévention et la défense ?

Comme le modèle repose sur un système de proxy, il peut être instancié à plusieurs endroits du réseau. Les instances d’ASGARD interceptent et gèrent les communications entre un attaquant et un système cible réel. Dans le cas de ce type d’attaque, et selon les ressources disponibles, une instance d’ASGARD peut être placée devant le système de contrôle. D’autres instances peuvent être placées devant les contrôleurs ou les équipements. Dans chaque déploiement, chaque instance d’ASGARD doit implémenter fidèlement les protocoles de communication utilisés par le système ou l’équipement protégé. Pour l’AK-SM 800A, le honeypot pourrait être un serveur Web. Pour les contrôleurs, chaque instance doit implémenter le protocole propre à chaque contrôleur. S’il s’agit de Modbus, très utilisé dans le domaine des systèmes de contrôle industriels (ICS), le honeypot doit en implémenter les PDU (Protocol Data Units), qui contiennent un code fonction et les données associées. À ce jour, ASGARD a été évalué sur des honeypots SSH ; son application aux équipements frigorifiques reste une piste de déploiement.

Dans tous les cas, les honeypots peuvent jouer un rôle crucial dans la détection des intrusions. Un honeypot n’a par définition aucune valeur légitime, donc toute interaction avec lui est au minimum suspecte et signale une attaque potentielle. Dans une configuration en proxy devant un système réel, il faut en plus distinguer le trafic légitime du trafic malveillant. C’est le rôle du mécanisme adaptatif (intelligent) d’ASGARD : grâce à l’apprentissage par renforcement, il laisse passer le trafic légitime ou à faible risque vers le système réel, et traite le trafic suspect de manière appropriée (par exemple en le bloquant ou en substituant une réponse inoffensive). Un blocage seul ne met toutefois pas fin à l’attaque : l’attaquant cherchera un autre chemin pour atteindre son objectif. Le mécanisme d’ASGARD doit donc continuer à surveiller l’activité de l’attaquant et s’adapter à ses nouvelles tentatives.

Ces honeypots peuvent être déployés dans un réseau séparé ou dans le réseau de production, selon plusieurs facteurs. Dans le premier cas, ils servent à collecter des données sur les attaques, qui pourront ensuite être utilisées pour corriger les vulnérabilités exploitées. Dans le second cas, ils risquent d’affecter le fonctionnement du système de production, mais ils peuvent limiter le degré de compromission, voire bloquer les attaques, grâce au mécanisme d’auto-défense intelligent qui permet de gérer le risque de compromission.

Dans vos environnements, certaines interfaces de gestion restent-elles exposées sur Internet ?

*Cet article est également publié sur [Linkedin](https://www.linkedin.com/pulse/comment-un-honeypot-adaptatif-et-auto-d%25C3%25A9fensif-d%25C3%25A9tecter-touch-i2rze)*.

Sources:

* [CERT-FR, alerte CERTFR-2026-ALE-012](https://www.cert.cyber.gouv.fr/alerte/CERTFR-2026-ALE-012/)
* [Danfoss, AK-SM 800A series (documentation)](https://www.danfoss.com/en/service-and-support/downloads/dcs/adap-kool-software/ak-sm-800a/)
* Touch, S. et Colin, J.-N., An Adaptive Self-guarded and Risk-aware Honeypot using DRL, ESORICS 2025 Workshops, LNCS 16232, 2025.
[https://doi.org/10.1007/978-3-032-16092-8_11](https://doi.org/10.1007/978-3-032-16092-8_11)
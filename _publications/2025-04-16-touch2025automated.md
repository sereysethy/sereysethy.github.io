---
title: "Automated Risk Assessment of Shell-Based Attacks Using a LLM"
collection: publications
category: chapters
permalink: /publication/2025-04-16-automated-risk-assessment-of-shell-based-attacks-using-a-llm
excerpt: 'We propose a novel approach to assess the risk of shell commands by classifying them into five risk levels ranging from very low risk (R0) to extremely high risk (R4), evaluating the potential adversarial impact of executing them on a system. The proposed approach is then used to build a classification model using a large-language model (LLM), RoBERTa, to automatically assess commands based on their defined risk levels.'
date: 2025-04-16
venue: 'LNCS, vol 15456. Springer, Cham'
paperurl: 'https://doi.org/10.1007/978-3-031-89350-6_11'
citation: 'Touch, S., Fink, J., Colin, JN. (2025). Automated Risk Assessment of Shell-Based Attacks Using a LLM. In: Collart-Dutilleul, S., Ouchani, S., Cuppens, N., Cuppens, F. (eds) Risks and Security of Internet and Systems. CRiSIS 2024. Lecture Notes in Computer Science, vol 15456. Springer, Cham.'
---

A honeypot is an effective tool for luring attackers and collecting information on their methods. However, honeypots are vulnerable to exploitation and can become attack vectors, necessitating enhanced security. One way to improve security is by analyzing input submitted to the honeypot and assigning a risk level to determine execution, especially important for SSH adaptive honeypots. However, in the literature, only a simple binary classification is used to classify commands as either severe or non-severe. Motivated by this gap, we propose a novel approach to assess the risk of shell commands by classifying them into five risk levels ranging from very low risk (R0) to extremely high risk (R4), evaluating the potential adversarial impact of executing them on a system. The proposed approach is then used to build a classification model using a large-language model (LLM), RoBERTa, to automatically assess commands based on their defined risk levels. We evaluate this model against two other classifiers using two different embeddings: Bag-of-Words and Word2Vec. The evaluation result shows that the LLM-based classifier outperforms the other models in accurately assessing the risk levels of shell commands.
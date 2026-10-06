---
title: "An Adaptive Self-guarded and Risk-Aware Honeypot using DRL"
collection: talks
type: "Conference proceedings talk"
permalink: /talks/2025-09-25-26-ESORICS
venue: "ESORICS 2025 International Workshops, Toulouse, France 25-26th September 2025"
date: 2025-09-25,28
location: "Toulouse, FRANCE"
---

We propose a novel adaptive self-guarded honeypot called Asgard2.0, designed to capture shell-based attacks on real Linux-based systems via remote SSH access and to automatically recover when severely compromised. Asgard2.0 leverages Deep Q-Networks (DQN), a Deep Reinforcement Learning (DRL) algorithm, to balance two often conflicting objectives: (i) Collecting attack data and (ii) Preventing deep compromise of the honeypot itself. By employing a rich environmental state representation and risk-aware reward functions, Asgard2.0 develops a nuanced understanding of its operational context, enabling informed and flexible decision-making to learn its objectives. Asgard2.0 was evaluated in a real-world deployment alongside its predecessor Asgard1.0 (a more restricted version), as well as two conventional honeypots: Cowrie, a medium-interaction honeypot (MiHP), and a non-filtered Linux-based system serving as a high-interaction honeypot (HiHP). Experimental results demonstrate that Asgard2.0 effectively collects attack data while significantly reducing the risk of deep compromise compared to the other systems. These findings highlight its ability to strike a well-balanced trade-off between MiHP and HiHP approaches.

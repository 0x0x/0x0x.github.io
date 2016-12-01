---
layout: post
title: "\"Bitter Java\". The main goals"
description: "Quick overview and main ideas of the \"Bitter Java\" book"
tags: [java, bookoverview]
---

{% include image.html path="bitterjava/bitter_java.jpg" path-detail="bitterjava/bitter_java.jpg" alt="Bitter Java" %}

Main ideas of book. I'll try to make a structure with main advices.

# Part 1


### Before creating a new layer the next points should be answered
  1. What does each layer bring to the table? We should understand the value of each additional layer.
  2. What is the *__cost__*? We need to be insistent about establishing cost
  3. Under what circumstances are those layers likely to break? What is our *__risk__*? In essence, we want to find the traps.
  4. What can we do to protect ourselves from the trap, and how can we extricate ourselves once we’ve fallen in?
  5. Finally, we want to establish our *__risk mitigation__*. This is the realm of the antipattern.
  
### [DMZ](https://en.wikipedia.org/wiki/DMZ_(computing))
DMZ - demilitarized zone is a physical or logical subnetwork that contains and exposes an organization's external-facing services to a usually larger and untrusted network, usually the Internet. The purpose of a DMZ is to add an additional layer of security to an organization's local area network (LAN); an external network node can access only what is exposed in the DMZ, while the rest of the organization's network is firewalled.

DMZ network diagram with 1 firewall
{% include image.html path="bitterjava/part01/DMZ_network_diagram_1_firewall.svg" path-detail="bitterjava/part01/DMZ_network_diagram_1_firewall.svg" alt="DMZ network diagram with 1 firewall" %}

DMZ network diagram with 2 firewalls
{% include image.html path="bitterjava/part01/DMZ_network_diagram_2_firewall.svg" path-detail="bitterjava/part01/DMZ_network_diagram_2_firewall.svg" alt="DMZ network diagram with 2 firewalls" %}

### Mini-antipatterns
  1. Too Many Web Page Items (HTTP 1/1 opens new connection for any element at page e. g. images, videos, GIFs)
  2. **Excessive Layering**. <br />
     Object-oriented systems are easy to layer with excessive complexity that is not required to adequately describe the relationships and behavior in the model. The complexity of the software can easily outpace the capabilities of the hardware platform.     
  3. **Incomplete Process Transitions**. <br />
       Analysis paralysis. New teams without complete education or experienced leadership can overanalyze solutions to the point of stagnation.
  * Poorly defined iterations
  * Poorly defined stopping points
  * Overmanagement of the artifact set
  * Poor teams or inadequate education

### Extreme programming principles
  1. Choose simple solutions.
  2. Ensure that the customers are on site.
  3. Write user stories.
  4. Divide larger projects into measured, planned, small releases.
  5. Refactor early and often.
  6. Program in pairs.
  7. Code test cases before the rest of the system.
  8. Do not use overtime.
  
# Part 2



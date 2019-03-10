---
layout: post
title: Comment choisir le meilleur DNS ?
description: Le DNS est sollicité chaque fois que votre navigateur cherche à accéder à un site Internet. Comment bien le choisir ?
tags: [dns, internet, web, astuce, guide]
---

# Qu'est-ce qu'un DNS ?

Le DNS (Domain Name Server / Serveur de nom de domaine) est sollicité chaque fois que votre navigateur cherche à accéder à un site Internet. Sur le web, les serveurs sont identifiés par leur adresse IP (par exemple ``185.199.108.153``). C'est certes efficace pour permettre à des machines de communiquer, mais ce n'est pas très intuitif pour le commun des mortels. Ainsi, le DNS est une sorte d'annuaire mettant en correspondance des IPs avec des noms de domaines (par exemple ``matospc.fr``), et ainsi faciliter notre orientation sur le Web. 

Si vous n'avez pas modifié ce paramétrage sur votre ordinateur, ce sont ceux définis dans votre routeur qui priment. En l'occurrence, il s'agit certainement de ceux de votre fournisseur d'accès Internet. Ils remplissent leur rôle, mais ne proposent généralement pas les meilleures performances, ni le plus grand respect de votre vie privée. 

En effet, un serveur DNS a connaissance de tous les sites Web que vous visitez et certains fournisseurs peuvent également abuser de cette situation en censurant ou en vous redirigeant vers des sites leur appartenant. 

En termes de performances, le temps de réponse est important car, tant que votre navigateur ne connait pas l'IP du site Web qui vous intéresse, il ne peut pas commencer à charger la page. Ainsi, utiliser un DNS lent implique de ralentir l'ensemble de votre expérience de navigation. 


# Quelles alternatives existent ?

### Google

**Google** a été un des premiers (2009) à promouvoir un service DNS réputé performant, en proposant deux adresses IP : ``8.8.8.8`` et ``8.8.4.4``, mais la controverse reigne sur leurs tendances à vouloir collecter les données personnelles. Malgré tout, selon [leurs déclarations](https://developers.google.com/speed/public-dns/privacy), ils ne conservent pas les données permettant de vous identifier plus de 48h et stockent de manière permanente des données anonymes. 

### Cloudflare

**Cloudflare** propose un [service équivalent](https://blog.cloudflare.com/announcing-1111/) depuis 2018, en se revendiquant comme le DNS le plus rapide au monde et en proclamant un respect total de la vie privée de leurs utilisateurs (certainement aussi en réponse à l'image négative dont souffre **Google** à ce sujet.). Ainsi, on peut lire sur [leur page](https://developers.cloudflare.com/1.1.1.1/commitment-to-privacy/) qu'ils s'engagent à ne jamais utiliser les données de leurs utilisateurs à des fins commerciales, à ne retenir aucune donnée permettant d'identifier un utilisateur et à ne pas conserver la journalisation nécessaire au fonctionnement du service plus de 24h. Les deux serveurs DNS sont disponibles aux adresses : ``1.1.1.1`` et ``1.0.0.1``.

Le navigateur **Firefox** propose également une fonctionnalité spécifique en partenariat avec **Cloudflare** : [un résolveur DNS](https://developers.cloudflare.com/1.1.1.1/commitment-to-privacy/privacy-policy/firefox/), qui est le logiciel présent sur votre machine permettant d'interroger le serveur DNS. Ainsi, toutes vos requêtes passent par ce logiciel qui voit donc passer beaucoup de vos informations personnelles et peut être susceptible aux intrusions. Il en existe un dans votre système d'exploitation mais **Firefox** en intègre un pour le remplacer et réduire ces risques. 


### Quad9

Le dernier service dont je vous parlerai aujourd'hui est [Quad9](https://www.quad9.net/), disponible depuis 2016.

Ce DNS est géré par une association à but non lucratif, compte **IBM** parmi ses partenaires. Ce DNS est un peu différent, car il vous empêchera d'accéder à des sites Internet potentiellement dangereux, tout en restant un des DNS les plus rapides. 

Ils revendiquent également [une politique de confidentialité stricte](https://www.quad9.net/policy/), en ne stockant pas les adresses IP utilisateurs et en se limitant à la conservation seule d'informations anonymes nécessaires au bon fonctionnement du service. 

Il est disponible à l'adresse ``9.9.9.9``.


### C'est tout ?

Il existe encore bien d'autres services équivalents, chacun présentant sa spécificité, sur lesquels je ne m'attarderai pas ici, mais qui peuvent représenter autant de choix valides pour vous. On compte parmi eux : [OpenDNS](https://www.opendns.com/), [DNS.Watch](https://dns.watch/), [UncensoredDNS](https://blog.uncensoreddns.org/), etc.


# Quel DNS est le plus performant pour moi ?

Les performances d'un DNS peuvent dépendre de votre distance au serveur, donc de votre position géographique. Les meilleurs services disposent de nombreux serveurs répartis sur l'ensemble du globe, pour proposer de bonnes performances partout, mais des variations locales peuvent quand même apparaitre. Il est possible de tester vous-même cette performance avec une simple ligne de commande.

Sous Windows, exécutez cette commande sous PowerShell, en renseignant le DNS que vous souhaitez tester.

Voici un exemple : ``Measure-Command {nslookup matospc.fr 9.9.9.9}|select TotalSeconds``

![Commande Powershell](/assets/images/articles/2018/dns/powershell.png)

Répéter ce test plusieurs fois, sur des DNS différents vous permettra de voir lequel est le plus rapide pour vous. 

Concernant **Cloudflare**, le service a rencontré [quelques problèmes d'accès à ses débuts](https://blog.cloudflare.com/fixing-reachability-to-1-1-1-1-globally/), car l'IP ``1.1.1.1`` était utilisée pour le fonctionnement interne de certains routeurs ou fournisseurs d'accès Internet. La très grande majorité de ces problèmes a été réglée depuis, mais il est toujours bon de s'assurer que ça fonctionne par un test en conditions réelles. Ainsi, la commande ci-dessus vous permettra également de tester que vous pouvez bien accéder au service. 

### Cache DNS

Lorsque vous allez régulièrement sur les mêmes sites Internet, leurs adresses IP sont stockées sur votre machine pour une durée définie, ce qui évite de refaire en permanence les mêmes requêtes pour une information déjà connue. 

C'est ce qu'on appelle le cache DNS. Ce système mitige énormément la lenteur potentielle d'un serveur DNS de mauvaise qualité, surtout chez les utilisateurs aux habitudes de navigation bien ancrées. 

![Cache DNS](/assets/images/articles/2018/dns/displaydns.png)


# Finalement, lequel choisir ?

Nous avons donc vu que la performance, ce n'est pas tout. Et, de toute façon, chacun des trois services présentés ici devraient offrir des performances correctes, quelque soit votre localisation ou votre configuration personnelle. 

Ainsi, si par exemple le DNS **Cloudflare** propose les meilleures performances, mais que la protection de **Quad9** vous séduit, il serait dommage de s'en passer, pour une différence de vitesse probablement imperceptible à l'usage. 

Finalement, ce seront peut-être plus les *à-côtés* proposés par le fournisseur de service qui détermineront votre choix. À vous de faire la part des choses entre les différentes promesses de toutes ces offres et de jauger le niveau de confiance que vous leur attribuez. 


### Comment changer mon DNS ?

Maintenant que le choix est fait, il est temps de paramétrer votre ordinateur. 

Sous Windows, allez dans les connexions réseau (le chemin est différent selon votre version de Windows, mais le paramétrage lui-même est toujours pareil). 

Double-cliquez sur la connexion vous reliant à Internet, cliquez sur ``Propriétés``, puis sur ``Protocole Internet version 4 (TCP/IP)`` et à nouveau sur ``Propriétés``. 

Sélectionnez ``Utiliser l'adresse de serveur DNS suivante`` et insérez la ou les adresses IP de votre nouveau DNS.

![Paramétrage du DNS sous Windows](/assets/images/articles/2018/dns/parametrage.png)

Allez ensuite tester ce nouveau paramétrage en ouvrant votre navigateur préféré. Selon la qualité de votre DNS précédent, vous pourriez ressentir une navigation Internet plus fluide... et peut-être plus sereine.
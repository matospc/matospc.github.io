---
layout: post
title: Bien mener une upgrade matérielle en conservant son installation Windows
description: La flemme de réinstaller Windows après une upgrade ? C'est possible, mais pas forcément plus simple.
tags: [upgrade, windows, processeur, regedit, registre, 10]
---

Si d'aventure il vous prend l'idée d'investir dans du matériel (carte-mère et processeur en particulier) tout en conservant votre installation Windows, c'est possible... mais il vous faudra prendre quelques précautions. 

Je vise ici **Windows 7** en particulier, avec lequel j'ai eu quelques déboires cette semaine sur la machine d'un ami. Cela a été heureusement l'occasion d'apprendre plusieurs choses sur ce qu'il faut prévoir pour éviter les mauvaises surprises.

Si vous mettez les mains sur une vieille bécane à laquelle vous souhaitez donner un coup de jeune, mon retour d'expérience vous permettra peut-être d'économiser un peu de temps (et d'agacement).

# Sauvegardez vos données

Avant toute chose, trouvez un emplacement pour mettre vos données importantes en sécurité. (Ce conseil s'applique en tous temps, même sans prévoir de modification sur son ordinateur.)

En fonction du volume de données à sauvegarder, un service de stockage en ligne (tel [Dropbox](https://www.dropbox.com/individual) ou [Google Drive](https://www.google.com/drive/)) peuvent suffire pour vos documents personnels, même avec une offre gratuite. Pour le reste, un [disque dur externe](https://amzn.to/2UGf0EB) (ou un [disque interne](https://amzn.to/2UC2K82) stocké dans une [boîte de protection](https://amzn.to/2HiJLMA)) est une bonne alternative. 

Pour vos photos, [Flickr](https://www.flickr.com/) vous permet d'en stocker 1000 gratuitement en haute qualité. Google Photo vous permet d'en [stocker un nombre illimité](https://support.google.com/photos/answer/6220791?co=GENIE.Platform%3DAndroid&hl=en), si vous choisissez leur option *haute qualité* (qui est en fait un mode compressé, qui réduit les photos à un maximum de 16 megapixels).

Il existe encore bien d'autres alternatives pour mettre vos données en sécurité, mais ce sera le sujet d'un autre article. Le point important à retenir est que vous pouvez rencontrer une panne à tout moment et qu'il ne faut pas attendre qu'il soit trop tard pour se poser la question de la sauvegarde de vos données. 

# Changer le mode SATA des disques durs

Une première chose à vérifier est dans quel mode SATA sont configurés vos disques durs (et SSD). Le mode [AHCI](https://fr.wikipedia.org/wiki/Advanced_Host_Controller_Interface) est l'option à préférer aujourd'hui mais, sur d'anciennes machines, c'est parfois le mode IDE qui est paramétré. La bonne nouvelle, c'est que cette modification vous permettra de profiter de meilleures performances sur vos disques durs et SSD. 

Si on tente de démarrer en mode AHCI sur un Windows paramétré en IDE, c'est l'[écran bleu de la mort](https://fr.wikipedia.org/wiki/%C3%89cran_bleu_de_la_mort) garanti. Il n'est pourtant pas nécessaire de réinstaller Windows pour pouvoir le faire fonctionner dans ce mode. Sous Windows 7, ce n'est pas très compliqué, il suffit de modifier deux clés de registre. 

Par contre, si vous changez de carte mère, la nouvelle ne gèrera pas forcément le mode IDE, vous empêchant complètement de démarrer et de modifier votre registre. Il faut donc faire la modification avant de changer le matériel.

Lancez l'éditeur de registre en écrivant ``regedit`` dans votre menu démarrer.

![Regedit](/assets/images/articles/2019/conseils-upgrade/regedit.png)

Naviguez vers ces deux clés et donnez-leur la valeur 0 : 

 * ``HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\msahci\Start``
 * ``HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\pciide\Start``

![Regedit: modification de la clé Start dans PCIIDE](/assets/images/articles/2019/conseils-upgrade/regedit-pciide.png)

Ensuite, ça se joue sous le BIOS (ou UEFI) pour activer le mode AHCI au niveau matériel. La méthode pour y accéder peut dépendre de votre carte-mère, mais marteler la touche ``suppr`` au démarrage du PC fonctionne souvent. 

Voici un exemple, avec ma carte mère (qui ne propose pas le mode IDE) : 

![Regedit](/assets/images/articles/2019/conseils-upgrade/uefi-sata-mode.png)

Suite à ces deux modifications, votre Windows devrait démarrer normalement. 

Mais attention à bien les faire dans l'ordre !

# Conserver la connectivité des lecteurs internes

De paire avec l'obsolescence de son "mode SATA", le connecteur IDE lui-même disparaît progressivement de nos cartes mères. 

Ainsi, si vous souhaitez absolument conserver un lecteur DVD ou un disque dur IDE, accrochez-vous car il sera difficile de trouver ce connecteur désuet sur une carte mère récente. Il existe néanmoins des [adapteurs IDE vers SATA](https://amzn.to/2HzhuR6) qui pourront vous dépanner... mais un [lecteur DVD](https://amzn.to/2OgRifJ) neuf n'est pas beaucoup plus cher. 

Mon conseil personnel serait de mettre les deux pieds en 2019 et d'investir dans du matériel connecté en SATA (ou M.2, pourquoi pas). 

# Renouveller son processeur quand on est sous Windows 7

Si vous investissez dans un nouveau processeur et que vous possédez une installation de Windows 7, vous n'échapperez probablement pas à une mise à niveau vers Windows 10. 

En effet, si vous vous décidez quand même à installer vos nouveaux processeur et carte mère, le système s'exécutera mais sera incapable de faire une quelconque mise à jour ou de télécharger les pilotes de votre matériel. Typiquement, vous pourriez vous retrouver avec une carte mère toute neuve dont les ports USB ou réseau sont inutilisables car Windows ne les reconnaitra pas (ce fut mon cas). Besoin de mettre la main sur une vieille souris PS/2 et d'utiliser le clavier virtuel pour naviguer sur ce pauvre ordinateur...

Vous trouverez tous les détails de ce problème et les processeurs concernés sur [la page de support officielle Microsoft](https://support.microsoft.com/fr-fr/help/4012982/the-processor-is-not-supported-together-with-the-windows-version-that). On trouve parmi eux tous les processeurs Intel à partir de la génération 7 (tel que le [i5 7600K](https://amzn.to/2F3q9Zp)) et les processeurs AMD tournant sur AM4 ([Ryzen 5 2600](https://amzn.to/2TlkAL1), par exemple)... en somme, tous les processeurs grand public depuis 2017.

# Mise à niveau gratuite vers Windows 10

Heureusement, si vous possédez une license valide pour Windows 7 ou 8, vous devriez pouvoir faire une mise à niveau vers Windows 10 sans débourser un centime. 

En avance de phase, prévoyez une visite sur [cette page](https://www.microsoft.com/fr-fr/software-download/windows10) pour obtenir l'utilitaire de téléchargement. 

Notez également que cette mise à niveau ne peut se faire que sous Windows. Il reste possible d'utiliser une clé USB ou un DVD pour cette installation, mais démarrer directement dessus ne vous servira à rien. Il vous sera gentiment demandé de relancer la procédure depuis votre session Windows.


# Mise à jour des pilotes graphiques

Il est à souligner que lors de la mise à niveau vers **Windows 10**, j'ai reçu un avertissement m'indiquant que la **GTX 760** risquait de poser des problèmes d'affichage sous Windows 10. J'ai transpiré un peu, mais je me suis quand même lancé dans l'aventure... à un moment, quand le processeur est trop récent pour Windows 7 mais que la carte graphique est trop ancienne pour Windows 10, il faut choisir le moindre des deux maux. 

Alors en effet, la carte graphique n'a pas fonctionné tout de suite. J'ai tenté en vain de lancer [Overwatch](https://playoverwatch.com/fr-fr/) après la mise à niveau. Écran noir et message d'erreur... Je tente alors une bête mise à jour du pilote graphique. L'opération est courronnée de succès. Les jeux tournent. Hourra ! 

# Finalement...


Ainsi, si comme moi vous mettez les mains sur du matos (pas si) ancien, prenez garde à l'obsolescence programmée. Avec un peu de prévoyance et de persévérence, le résultat, même s'il s'est fait désirer, était au rendez-vous. 

Le système de mise à niveau vers Windows 10 fonctionne bien et peu vous sortir de l'embarras, surtout si vous avez la flemme de repartir de zéro sur une installation toute fraîche de Windows. 
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E38348C7C
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785005445; cv=none; b=Sunp/2mAFgWRu7KjPSlNuMJscZJTjHVY18SfVGFC7LZhHvYvmgXlmppI+ekagPHXhU6PIBkOMNSw19XO3ZL3Zglac0FnF0Sna5Gr9aHrcn5SeDk9+jQdDCTFEOPh8Kx6JnfSczgyDlhNFSt7E9pdzZoTuxUEUt0zDTt5CrXhryk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785005445; c=relaxed/simple;
	bh=xxhGfncc5vq2tP1MHuN50PdgPQftJ6g3Ji414z/P6jM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IsoOuWG04R3u8C97BTeg73w5Sa6ALLNgEQ9TgzJ7LF5aItxB1j1D8WNYX6uJySykpSstLeClXj84dNC4mlFv2hrZ0+IfwiaHz3Z+AxkvwC6qDFnbPEM+CQ+uKBOx0+S9NGj9tAXzh3PkZ1Kt2E8Yvy2DG9rtUwN+C1LxWChU+xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it; spf=pass smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b=aqyl7oWh; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b="aqyl7oWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail; t=1785005421; x=1785264621;
	bh=UlM8MQJ81YfiH+mQBlFnFoJ9CoqqBkVFr1PpZpjiH3Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aqyl7oWhrYWjextAdrWMltNxc6qGuTTqE3XLoOt0MXN9HrVGZNNCTd2h28Sm6WfdE
	 xrk0GH3ypqkX4Fw0HkbPUJOaLkGW5Alk22TKrnqbP2d7A+rRGtkxpDVgFr/vY8d3co
	 shiKaAMCnBLtIhoQMkA1lMIoBWUfiUE4G+tvcUcLaIKUcJNZEjL0aatsVaCIvSGzts
	 Re4Zo2JElOLicQHnqmw+LVD8xItVMuotpi9E0r8U/I9i2qFlL4ALdaYAp88qr6TEVi
	 V58kOtxIxrBcfbNOYyZIY83LjbATuMxGXGkfKM4Eb63IwbSM2d0ikbIzUCNvUG538o
	 9yUozxi3GFqvg==
Date: Sat, 25 Jul 2026 18:50:13 +0000
To: Jonathan Corbet <corbet@lwn.net>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Federico Vaga <federico.vaga@vaga.pv.it>
Subject: [PATCH] doc:it_IT: align doc-guide translation
Message-ID: <20260725185005.138887-1-federico.vaga@vaga.pv.it>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: b6d70391112532eb6dfe23dd968c71619ef8a7d5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Update the Italian translation of Documentation/doc-guide to catch up
with the following upstream commits:

doc-guide/index.rst:
  commit a592a36e4937 ("Documentation: use a source-read extension for the =
index link boilerplate")
  commit d40981350844 ("doc-guide: add help documentation checktransupdate.=
rst")

doc-guide/sphinx.rst:
  commit f1c2db1f145b ("docs: move test_doc_build.py to tools/docs")
  commit abd61d1ff8f0 ("scripts: sphinx-pre-install: move it to tools/docs"=
)
  commit 9322af5e6557 ("docs: sphinx: add a file with the requirements for =
lowest version")
  commit d6d886005d32 ("Docs: doc-guide: update sphinx.rst Sphinx version n=
umber")
  commit 5ccab49c104c ("docs: doc-guide: clarify latest theme usage")
  commit b31274d58d21 ("docs: drop the version constraints for sphinx and d=
ependencies")
  commit 40be2369dc0e ("Documentation: multiple .rst files: Fix grammar and=
 more consistent formatting")
  commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement to 2.4.4=
")
  commit 86b17aaf2e88 ("docs: automarkup: linkify git revs")
  commit 35d4a3c67eb5 ("docs/doc-guide: Clarify how to write tables")
  commit 26d797ffc1c0 ("docs: update sphinx.rst to reflect the default them=
e change")
  commit 679b4bc25fc7 ("docs/doc-guide: Add documentation on SPHINX_IMGMATH=
")
  commit 4d627ef12b40 ("docs/doc-guide: Mention make variable SPHINXDIRS")
  commit 7c43214dddfd ("docs/doc-guide: Add footnote on Inkscape for better=
 images in PDF documents")

doc-guide/kernel-doc.rst:
  commit 827b9458c933 ("docs: kernel-doc.rst: document private: scope propa=
gation")
  commit eba6ffd126cd ("docs: kdoc: move kernel-doc to tools/docs")
  commit 90f1d896d59f ("doc-guide: kernel-doc: specify that W=3Dn does not =
check header files")
  commit b580fa304c85 ("docs: kernel-doc.rst: document the new "var" kernel=
-doc markup")
  commit 8deb5d725b48 ("docs: kernel-doc.rst: don't let automarkup mangle w=
ith consts")
  commit dd3e817e879c ("doc-guide: kernel-doc: add %CONST examples")
  commit 7e8a8143ecc3 ("docs: add support to build manpages from kerneldoc =
output")
  commit 9e6c5870bb44 ("Documentation: kernel-doc: enumerate identifier *ty=
pe*s")
  commit 23a0bc285159 ("doc-guide: kernel-doc: document Returns: spelling")

doc-guide/parse-headers.rst:
  commit 6ae0f2072768 ("docs: parse-headers.rst: Fix a typo")
  commit 68f3d40ea0ce ("docs: parse-headers.rst: remove uneeded parenthesis=
")
  commit d69a03a97a2d ("docs: doc-guide: parse-headers.rst update its docum=
entation")

Also add the translations for the following pages, which had none:

doc-guide/contributing.rst:
  commit d96574b0b49d ("Add a document on how to contri

doc-guide/maintainer-profile.rst:
  commit 53b7f3aa411b ("Add a maintainer entry profile for documentation")

doc-guide/checktransupdate.rst:
  commit d40981350844 ("doc-guide: add help documentation checktransupdate.=
rst")

Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
---
 .../it_IT/doc-guide/checktransupdate.rst      |  59 ++++
 .../it_IT/doc-guide/contributing.rst          | 319 ++++++++++++++++++
 .../translations/it_IT/doc-guide/index.rst    |  13 +-
 .../it_IT/doc-guide/kernel-doc.rst            |  88 +++--
 .../it_IT/doc-guide/maintainer-profile.rst    |  60 ++++
 .../it_IT/doc-guide/parse-headers.rst         | 220 ++++++------
 .../translations/it_IT/doc-guide/sphinx.rst   | 178 +++++++---
 7 files changed, 757 insertions(+), 180 deletions(-)
 create mode 100644 Documentation/translations/it_IT/doc-guide/checktransup=
date.rst
 create mode 100644 Documentation/translations/it_IT/doc-guide/contributing=
.rst
 create mode 100644 Documentation/translations/it_IT/doc-guide/maintainer-p=
rofile.rst

diff --git a/Documentation/translations/it_IT/doc-guide/checktransupdate.rs=
t b/Documentation/translations/it_IT/doc-guide/checktransupdate.rst
new file mode 100644
index 000000000000..5171c24e8b52
--- /dev/null
+++ b/Documentation/translations/it_IT/doc-guide/checktransupdate.rst
@@ -0,0 +1,59 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-ita.rst
+
+Verificare la necessit=C3=A0 di aggiornare le traduzioni
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+Questo script aiuta a tracciare lo stato delle traduzioni della
+documentazione nelle diverse lingue, ovvero se la documentazione =C3=A8
+allineata con la controparte inglese.
+
+Come funziona
+-------------
+
+Lo script usa il comando ``git log`` per individuare l'ultimo commit in in=
glese
+a partire dal commit della traduzione (in ordine di data dell'autore) e gl=
i
+ultimi commit in inglese a partire da HEAD. Se emergono delle differenze, =
il
+file viene considerato non aggiornato, e vengono quindi raccolti e segnala=
ti i
+commit che necessitano di un aggiornamento.
+
+Funzionalit=C3=A0 implementate
+
+-  verifica di tutti i file in una determinata lingua
+-  verifica di un singolo file o di un insieme di file
+-  opzioni per modificare il formato dell'output
+-  tracciamento dello stato di traduzione dei file che non hanno alcuna
+   traduzione
+
+Utilizzo
+--------
+
+::
+
+   tools/docs/checktransupdate.py --help
+
+Fate riferimento all'output del messaggio d'aiuto per i dettagli sull'util=
izzo.
+
+Esempi
+
+-  ``tools/docs/checktransupdate.py -l zh_CN``
+   Questo stamper=C3=A0 tutti i file che necessitano di un aggiornamento n=
ella
+   lingua zh_CN.
+-  ``tools/docs/checktransupdate.py Documentation/translations/zh_CN/dev-t=
ools/testing-overview.rst``
+   Questo stamper=C3=A0 solamente lo stato del file specificato.
+
+L'output sar=C3=A0 quindi qualcosa del genere:
+
+::
+
+    Documentation/dev-tools/kfence.rst
+    No translation in the locale of zh_CN
+
+    Documentation/translations/zh_CN/dev-tools/testing-overview.rst
+    commit 42fb9cfd5b18 ("Documentation: dev-tools: Add link to RV docs")
+    1 commits needs resolving in total
+
+Funzionalit=C3=A0 ancora da implementare
+
+- specificare cartelle in aggiunta ai singoli file
diff --git a/Documentation/translations/it_IT/doc-guide/contributing.rst b/=
Documentation/translations/it_IT/doc-guide/contributing.rst
new file mode 100644
index 000000000000..b6bb3fae22d7
--- /dev/null
+++ b/Documentation/translations/it_IT/doc-guide/contributing.rst
@@ -0,0 +1,319 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-ita.rst
+
+Come contribuire al miglioramento della documentazione del kernel
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+La documentazione =C3=A8 una parte importante di ogni progetto di sviluppo
+software. Una buona documentazione aiuta ad attirare nuovi sviluppatori e
+permette a quelli gi=C3=A0 presenti di lavorare in modo pi=C3=B9 efficace.=
 Senza una
+documentazione di qualit=C3=A0, si spreca molto tempo nel decifrare il cod=
ice a
+ritroso e si commettono errori altrimenti evitabili.
+
+Sfortunatamente, al momento la documentazione del kernel =C3=A8 ben lontan=
a da
+quello che dovrebbe essere per sostenere un progetto di queste dimensioni =
e
+importanza.
+
+Questa guida =C3=A8 per chi vuole contribuire a migliorare questa situazio=
ne. I
+miglioramenti alla documentazione del kernel possono essere fatti da
+sviluppatori con diversi livelli di esperienza; sono un modo relativamente
+semplice per imparare il processo di sviluppo del kernel in generale e
+trovare il proprio posto nella comunit=C3=A0. Quello che segue =C3=A8, per=
 la maggior
+parte, l'elenco dei compiti che il manutentore della documentazione ritien=
e
+pi=C3=B9 urgenti.
+
+Le cose da fare nella documentazione
+------------------------------------
+
+C'=C3=A8 un elenco infinito di compiti da svolgere per portare la nostra
+documentazione al livello in cui dovrebbe essere. Questo elenco contiene
+alcuni punti importanti, ma =C3=A8 lungi dall'essere esaustivo; se trovate=
 un
+modo diverso per migliorare la documentazione, non esitate!
+
+Correzione degli avvisi
+~~~~~~~~~~~~~~~~~~~~~~~
+
+Al momento, la generazione della documentazione produce un numero
+incredibile di avvisi. Quando ce ne sono cos=C3=AC tanti, =C3=A8 come se n=
on ce ne
+fosse nessuno: le persone li ignorano e non si accorgeranno mai quando il
+loro lavoro ne aggiunge di nuovi. Per questo motivo, eliminare gli avvisi =
=C3=A8
+uno dei compiti a pi=C3=B9 alta priorit=C3=A0 nell'elenco delle cose da fa=
re per la
+documentazione. Il compito in s=C3=A9 =C3=A8 ragionevolmente semplice, ma =
va
+affrontato nel modo giusto per avere successo.
+
+Gli avvisi emessi da un compilatore per il codice C possono spesso essere
+scartati come falsi positivi, portando a patch il cui unico scopo =C3=
=A8 zittire
+il compilatore. Gli avvisi generati dalla documentazione, invece, indicano
+quasi sempre un problema reale; farli sparire richiede di comprendere il
+problema e correggerlo alla radice. Per questo motivo, le patch che
+correggono avvisi nella documentazione non dovrebbero limitarsi a dire "fi=
x
+a warning" nel titolo del changelog; dovrebbero invece indicare il problem=
a
+reale che =C3=A8 stato corretto.
+
+Un altro punto importante =C3=A8 che gli avvisi nella documentazione sono =
spesso
+generati da problemi nei commenti kerneldoc all'interno del codice C. Anch=
e se
+il manutentore della documentazione apprezza l'essere messo in copia sulle
+correzioni di questo tipo, in realt=C3=A0 spesso rivolgersi al sottosistem=
a di
+documentazione non =C3=A8 il modo migliore di apportare queste modifiche; =
queste
+dovrebbero invece essere inviate al manutentore del sottosistema in questi=
one.
+
+Per esempio, in una generazione della documentazione ho preso, quasi a
+caso, un paio di avvisi::
+
+  ./drivers/devfreq/devfreq.c:1818: warning: bad line:
+  =09- Resource-managed devfreq_register_notifier()
+  ./drivers/devfreq/devfreq.c:1854: warning: bad line:
+=09- Resource-managed devfreq_unregister_notifier()
+
+(Le righe sono state divise per essere pi=C3=B9 leggibili).
+
+Una rapida occhiata al file sorgente indicato sopra ha rivelato un paio di
+commenti kerneldoc con questo aspetto::
+
+  /**
+   * devm_devfreq_register_notifier()
+=09  - Resource-managed devfreq_register_notifier()
+   * @dev:=09The devfreq user device. (parent of devfreq)
+   * @devfreq:=09The devfreq object.
+   * @nb:=09=09The notifier block to be unregistered.
+   * @list:=09DEVFREQ_TRANSITION_NOTIFIER.
+   */
+
+Il problema =C3=A8 l'asterisco mancante, che confonde l'idea semplicistica=
 che il
+sistema di generazione abbia idea di come debba essere fatto un blocco di
+commento C. Questo problema era presente fin da quando quel commento venne
+aggiunto nel 2016, quindi da diversi anni. Correggerlo =C3=A8 stata solo q=
uestione di
+aggiungere gli asterischi mancanti. Una rapida occhiata alla cronologia di=
 quel
+file ha mostrato quale fosse il formato usuale per la riga dell'oggetto, e
+``scripts/get_maintainer.pl`` mi ha detto chi dovesse riceverla (basta pas=
sare
+il percorso delle vostre patch come argomento a scripts/get_maintainer.pl)=
. La
+patch risultante era questa::
+
+  [PATCH] PM / devfreq: Fix two malformed kerneldoc comments
+
+  Two kerneldoc comments in devfreq.c fail to adhere to the required forma=
t,
+  resulting in these doc-build warnings:
+
+    ./drivers/devfreq/devfreq.c:1818: warning: bad line:
+  =09  - Resource-managed devfreq_register_notifier()
+    ./drivers/devfreq/devfreq.c:1854: warning: bad line:
+=09  - Resource-managed devfreq_unregister_notifier()
+
+  Add a couple of missing asterisks and make kerneldoc a little happier.
+
+  Signed-off-by: Jonathan Corbet <corbet@lwn.net>
+  ---
+   drivers/devfreq/devfreq.c | 4 ++--
+   1 file changed, 2 insertions(+), 2 deletions(-)
+
+  diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
+  index 57f6944d65a6..00c9b80b3d33 100644
+  --- a/drivers/devfreq/devfreq.c
+  +++ b/drivers/devfreq/devfreq.c
+  @@ -1814,7 +1814,7 @@ static void devm_devfreq_notifier_release(struct d=
evice *dev, void *res)
+
+   /**
+    * devm_devfreq_register_notifier()
+  -=09- Resource-managed devfreq_register_notifier()
+  + *=09- Resource-managed devfreq_register_notifier()
+    * @dev:=09The devfreq user device. (parent of devfreq)
+    * @devfreq:=09The devfreq object.
+    * @nb:=09=09The notifier block to be unregistered.
+  @@ -1850,7 +1850,7 @@ EXPORT_SYMBOL(devm_devfreq_register_notifier);
+
+   /**
+    * devm_devfreq_unregister_notifier()
+  -=09- Resource-managed devfreq_unregister_notifier()
+  + *=09- Resource-managed devfreq_unregister_notifier()
+    * @dev:=09The devfreq user device. (parent of devfreq)
+    * @devfreq:=09The devfreq object.
+    * @nb:=09=09The notifier block to be unregistered.
+  --
+  2.24.1
+
+L'intero procedimento ha richiesto solo pochi minuti. Naturalmente, ho poi
+scoperto che qualcun altro l'aveva gi=C3=A0 corretto in un altro albero,
+mettendo in luce un'altra lezione: controllate sempre linux-next per
+vedere se un problema =C3=A8 gi=C3=A0 stato risolto prima di mettervici so=
pra.
+
+Altre correzioni richiederanno pi=C3=B9 tempo, specialmente quelle relativ=
e ai
+campi di una struttura o ai parametri di una funzione privi di
+documentazione. In questi casi, =C3=A8 necessario capire quale sia il ruol=
o di
+questi campi o parametri e descriverli correttamente. Nel complesso, quest=
o
+compito diventa un po' tedioso a volte, ma =C3=A8 molto importante. Se riu=
sciamo
+davvero ad eliminare gli avvisi dalla generazione della documentazione,
+allora potremo iniziare a pretendere che gli sviluppatori evitino di
+aggiungerne di nuovi.
+
+Oltre ai normali avvisi durante la generazione della documentazione, potet=
e
+ottenerne di pi=C3=B9 eseguendo ``make refcheckdocs`` per trovare riferime=
nti a file
+di documentazione inesistenti.
+
+Commenti kerneldoc dimenticati
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Gli sviluppatori sono incoraggiati a scrivere commenti kerneldoc per il
+loro codice, ma molti di questi commenti non vengono mai inclusi nella
+generazione della documentazione. Questo rende tale informazione pi=C3=
=B9
+difficile da trovare e, per esempio, impedisce a Sphinx di generare
+collegamenti verso quella documentazione. Aggiungere le direttive
+``kernel-doc`` alla documentazione per includere quei commenti pu=C3=B2 ai=
utare
+la comunit=C3=A0 a ottenere il pieno valore del lavoro speso per crearli.
+
+Lo strumento ``tools/docs/find-unused-docs.sh`` pu=C3=B2 essere usato per
+trovare questi commenti dimenticati.
+
+Da notare che il valore maggiore deriva dall'includere la documentazione
+per le funzioni e le strutture dati esportate. Molti sottosistemi hanno
+anche commenti kerneldoc per uso interno; questi non dovrebbero essere
+inclusi nella generazione della documentazione a meno che non vengano
+posti in un documento specificamente rivolto agli sviluppatori che
+lavorano all'interno del sottosistema in questione.
+
+
+Correzione dei refusi
+~~~~~~~~~~~~~~~~~~~~~
+
+Correggere errori di battitura o di formattazione nella documentazione =
=C3=A8
+un modo rapido per imparare come creare e inviare patch, ed =C3=A8 un serv=
izio
+utile. Sono sempre disposto ad accettare questo tipo di patch. Detto
+questo, una volta che ne avete corretti alcuni, considerate di passare a
+compiti pi=C3=B9 avanzati, lasciando qualche refuso per il prossimo princi=
piante
+che vorr=C3=A0 occuparsene.
+
+Da notare che alcune cose *non* sono refusi e non dovrebbero essere
+"corrette":
+
+ - Sia la grafia americana che quella britannica dell'inglese sono
+   ammesse nella documentazione del kernel. Non c'=C3=A8 bisogno di sostit=
uire
+   l'una con l'altra.
+
+ - La questione se un punto debba essere seguito da uno o due spazi non
+   va dibattuta nel contesto della documentazione del kernel. Anche
+   altri argomenti di legittimo disaccordo, come la "virgola di Oxford",
+   non sono pertinenti qui.
+
+Come per qualsiasi patch a qualsiasi progetto, considerate se la vostra
+modifica sta davvero migliorando le cose.
+
+Documentazione datata
+~~~~~~~~~~~~~~~~~~~~~
+
+Parte della documentazione del kernel =C3=A8 attuale, mantenuta e utile.
+Un'altra parte... non lo =C3=A8. Documentazione impolverata, vecchia e
+imprecisa pu=C3=B2 fuorviare i lettori e gettare discredito sulla nostra
+documentazione nel suo complesso. Qualsiasi cosa si possa fare per
+affrontare questi problemi =C3=A8 pi=C3=B9 che benvenuta.
+
+Ogni volta che lavorate su un documento, considerate se =C3=A8 attuale, se=
 ha
+bisogno di essere aggiornato, o se forse dovrebbe essere rimosso del
+tutto. Ci sono alcuni segnali d'allarme a cui potete prestare attenzione:
+
+ - Riferimenti a kernel della serie 2.x
+ - Rimandi a repositori su SourceForge
+ - Nella cronologia, negli ultimi anni, solo correzioni di refusi
+ - Discussioni su modi di lavorare precedenti a Git
+
+La cosa migliore da fare, ovviamente, sarebbe portare la documentazione a
+essere attuale, aggiungendo qualsiasi informazione necessaria. Un lavoro
+simile spesso richiede la collaborazione di sviluppatori che conoscono ben=
e
+il sottosistema in questione. Gli sviluppatori, quando viene chiesto loro
+gentilmente, e quando le loro risposte vengono ascoltate e messe in
+pratica, sono spesso pi=C3=B9 che disposti a collaborare con chi lavora pe=
r
+migliorare la documentazione.
+
+Alcuni documenti sono senza speranza; a volte troviamo documenti che fanno
+riferimento a codice rimosso dal kernel molto tempo fa, per esempio. C'=
=C3=A8
+una sorprendente resistenza a rimuovere la documentazione obsoleta, ma
+dovremmo farlo comunque. Il materiale superfluo nella nostra documentazion=
e
+non =C3=A8 d'aiuto a nessuno.
+
+Nei casi in cui, forse, ci sono informazioni utili in un documento
+gravemente datato, e non siete in grado di aggiornarlo, la cosa migliore
+da fare potrebbe essere aggiungere un avviso all'inizio. Si raccomanda il
+seguente testo::
+
+  .. warning ::
+  =09This document is outdated and in need of attention.  Please use
+=09this information with caution, and please consider sending patches
+=09to update it.
+
+In questo modo, almeno i nostri pazientissimi lettori sono stati avvisati
+che il documento potrebbe portarli fuori strada.
+
+Coerenza della documentazione
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+I veterani di qui ricorderanno i libri su Linux che comparvero sugli
+scaffali negli anni '90. Erano semplicemente raccolte di file di
+documentazione racimolati da varie fonti in rete. I libri sono (per lo
+pi=C3=B9) migliorati da allora, ma la documentazione del kernel =C3=A8 anc=
ora per lo
+pi=C3=B9 costruita su quel modello. Sono migliaia di file, quasi ognuno de=
i
+quali =C3=A8 stato scritto in isolamento da tutti gli altri. Non abbiamo u=
n
+corpo coerente di documentazione del kernel; abbiamo migliaia di documenti
+individuali.
+
+Abbiamo cercato di migliorare la situazione creando un insieme di "libri"
+che raggruppano la documentazione per specifici lettori. Questi
+includono:
+
+ - Documentation/admin-guide/index.rst
+ - Documentation/core-api/index.rst
+ - Documentation/driver-api/index.rst
+ - Documentation/userspace-api/index.rst
+
+Cos=C3=AC come questo libro sulla documentazione stessa.
+
+Spostare i documenti nei libri appropriati =C3=A8 un compito importante e =
deve
+continuare. Ci sono, tuttavia, un paio di sfide associate a questo lavoro.
+Spostare i file della documentazione, nel breve termine, infastidisce chi =
vi
+lavora; comprensibilmente, non sono entusiasti di questi cambiamenti. Di s=
olito
+li si pu=C3=B2 convincere a spostarli una volta; tuttavia, non vogliamo co=
ntinuare a
+spostarli in giro.
+
+Anche quando tutti i documenti sono al posto giusto, per=C3=B2, siamo solo
+riusciti a trasformare un grande cumulo in un gruppo di cumuli pi=C3=B9
+piccoli. Il lavoro di cercare di tessere insieme tutti quei documenti in
+un unico insieme non =C3=A8 ancora iniziato. Se avete idee brillanti su co=
me
+potremmo procedere su questo fronte, saremmo pi=C3=B9 che felici di sentir=
le.
+
+Miglioramenti al foglio di stile
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Con l'adozione di Sphinx abbiamo un output HTML dall'aspetto molto pi=
=C3=B9 gradevole
+di quanto avessimo un tempo. Ma =C3=A8 ancora migliorabile; Donald Knuth e=
 Edward
+Tufte non ne sarebbero impressionati. Questo richiede di modificare i nost=
ri
+fogli di stile per creare un output tipograficamente pi=C3=B9 solido, acce=
ssibile e
+leggibile.
+
+Attenzione: se vi assumete questo compito, vi state addentrando nel
+classico territorio del "bikeshed". Aspettatevi molte opinioni e
+discussioni anche per cambiamenti relativamente ovvi. Questa =C3=A8, ahim=
=C3=A8, la
+natura del mondo in cui viviamo.
+
+Generazione di PDF senza LaTeX
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Questo =C3=A8 un compito decisamente non banale per qualcuno con molto tem=
po a
+disposizione e competenze in Python. La catena di strumenti di Sphinx =
=C3=A8
+relativamente piccola e ben contenuta; =C3=A8 facile da aggiungere a un si=
stema
+di sviluppo. Ma generare output in PDF o EPUB richiede l'installazione di
+LaTeX, che non =C3=A8 affatto piccolo o ben contenuto. Sarebbe una bella c=
osa
+da eliminare.
+
+La speranza originale era di usare lo strumento rst2pdf (https://rst2pdf.o=
rg/)
+per la generazione dei PDF, ma si =C3=A8 scoperto che non era all'altezza =
del
+compito. Il lavoro di sviluppo su rst2pdf sembra per=C3=B2 essere ripreso =
di recente,
+il che =C3=A8 un segno di speranza. Se uno sviluppatore adeguatamente moti=
vato lo
+migliorasse per far funzionare rst2pdf con la documentazione del kernel, i=
l
+mondo gli sarebbe eternamente grato.
+
+Scrivere pi=C3=B9 documentazione
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Naturalmente, ci sono vaste parti del kernel che sono gravemente prive di
+documentazione. Se avete la conoscenza per documentare uno specifico
+sottosistema del kernel e il desiderio di farlo, non esitate a scrivere e
+inviare il lavoro al kernel. Un numero incalcolabile di
+sviluppatori e utenti del kernel vi ringrazier=C3=A0.
diff --git a/Documentation/translations/it_IT/doc-guide/index.rst b/Documen=
tation/translations/it_IT/doc-guide/index.rst
index 9fffff626711..04df7e550f6b 100644
--- a/Documentation/translations/it_IT/doc-guide/index.rst
+++ b/Documentation/translations/it_IT/doc-guide/index.rst
@@ -1,8 +1,5 @@
 .. include:: ../disclaimer-ita.rst
=20
-.. note:: Per leggere la documentazione originale in inglese:
-=09  :ref:`Documentation/doc-guide/index.rst <doc_guide>`
-
 .. _it_doc_guide:
=20
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -15,10 +12,6 @@ Come scrivere la documentazione del kernel
    sphinx
    kernel-doc
    parse-headers
-
-.. only::  subproject and html
-
-   Indices
-   =3D=3D=3D=3D=3D=3D=3D
-
-   * :ref:`genindex`
+   contributing
+   maintainer-profile
+   checktransupdate
diff --git a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst b/Do=
cumentation/translations/it_IT/doc-guide/kernel-doc.rst
index bac959b8b7b9..7e8981d5f464 100644
--- a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
+++ b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
@@ -1,12 +1,7 @@
 .. include:: ../disclaimer-ita.rst
=20
-.. note:: Per leggere la documentazione originale in inglese:
-=09  :ref:`Documentation/doc-guide/index.rst <doc_guide>`
-
 .. title:: Commenti in kernel-doc
=20
-.. _it_kernel_doc:
-
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
 Scrivere i commenti in kernel-doc
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -82,11 +77,15 @@ che questo produca alcuna documentazione. Per esempio::
=20
 =09tools/docs/kernel-doc -v -none drivers/foo/bar.c
=20
-Il formato della documentazione =C3=A8 verificato della procedura di gener=
azione
-del kernel quando viene richiesto di effettuare dei controlli extra con GC=
C::
+Il formato della documentazione dei file ``.c`` =C3=A8 verificato anche da=
lla
+procedura di generazione del kernel quando viene richiesto di effettuare d=
ei
+controlli extra con GCC::
=20
 =09make W=3Dn
=20
+Tuttavia, il comando precedente non verifica i file d'intestazione. Questi
+devono essere controllati separatamente utilizzando ``kernel-doc``.
+
 Documentare le funzioni
 ------------------------
=20
@@ -172,7 +171,7 @@ Valore di ritorno
 ~~~~~~~~~~~~~~~~~
=20
 Il valore di ritorno, se c'=C3=A8, viene descritto in una sezione dedicata=
 di nome
-``Return``.
+``Return`` (o ``Returns``).
=20
 .. note::
=20
@@ -202,7 +201,8 @@ Il valore di ritorno, se c'=C3=A8, viene descritto in u=
na sezione dedicata di nome
 Documentare strutture, unioni ed enumerazioni
 ---------------------------------------------
=20
-Generalmente il formato di un commento kernel-doc per struct, union ed enu=
m =C3=A8::
+Generalmente il formato di un commento kernel-doc per ``struct``, ``union`=
`
+ed ``enum`` =C3=A8::
=20
   /**
    * struct struct_name - Brief description.
@@ -237,6 +237,10 @@ Le etichette ``private:`` e ``public:`` devono essere =
messe subito dopo
 il marcatore di un commento ``/*``. Opzionalmente, possono includere comme=
nti
 fra ``:`` e il marcatore di fine commento ``*/``.
=20
+Quando ``private:`` viene usata su strutture annidate, si propaga solo all=
e
+strutture/unioni interne.
+
+
 Esempio::
=20
   /**
@@ -280,13 +284,15 @@ Strutture ed unioni annidate
         union {
           struct {
             int memb1;
+            /* private: nasconde memb2 dalla documentazione */
             int memb2;
-        }
+          };
+          /* Qui torna tutto pubblico, l'ambito private =C3=A8 terminato *=
/
           struct {
             void *memb3;
             int memb4;
-          }
-        }
+          };
+        };
         union {
           struct {
             int memb1;
@@ -366,10 +372,23 @@ Anche i tipi di dato per prototipi di funzione posson=
o essere documentati::
    * Description of the type.
    *
    * Context: Locking context.
-   * Return: Meaning of the return value.
+   * Returns: Meaning of the return value.
    */
    typedef void (*type_name)(struct v4l2_ctrl *arg1, void *arg2);
=20
+Documentazione delle variabili
+-------------------------------
+
+Generalmente il formato di un commento kernel-doc per una variabile =C3=
=A8
+il seguente::
+
+  /**
+   * var var_name - Brief description.
+   *
+   * Description of the var_name variable.
+   */
+   extern int var_name;
+
 Documentazione di macro simili a oggetti
 ----------------------------------------
=20
@@ -433,6 +452,10 @@ del `dominio Sphinx per il C`_.
 ``%CONST``
   Il nome di una costante (nessun riferimento, solo formattazione)
=20
+  Esempi::
+
+    %0    %NULL    %-1    %-EFAULT    %-EINVAL    %-ENOMEM
+
 ````literal````
   Un blocco di testo che deve essere riportato cos=C3=AC com'=C3=A8. La ra=
ppresentazione
   finale utilizzer=C3=A0 caratteri a ``spaziatura fissa``.
@@ -484,15 +507,22 @@ la seguente sintassi::
   See :c:func:`my custom link text for function foo <foo>`.
   See :c:type:`my custom link text for struct bar <bar>`.
=20
+Per ulteriori dettagli, consultate la documentazione del `dominio Sphinx p=
er
+il C`_.
+
+.. note::
+   Le variabili non vengono automaticamente collegate tramite riferimenti
+   incrociati. Per queste, dovete aggiungere esplicitamente un riferimento
+   incrociato del dominio C.
=20
 Commenti per una documentazione generale
 ----------------------------------------
=20
 Al fine d'avere il codice ed i commenti nello stesso file, potete includer=
e
 dei blocchi di documentazione kernel-doc con un formato libero invece
-che nel formato specifico per funzioni, strutture, unioni, enumerati o tip=
i
-di dato. Per esempio, questo tipo di commento potrebbe essere usato per la
-spiegazione delle operazioni di un driver o di una libreria
+che nel formato specifico per funzioni, strutture, unioni, enumerati, tipi
+di dato o variabili. Per esempio, questo tipo di commento potrebbe essere
+usato per la spiegazione delle operazioni di un driver o di una libreria
=20
 Questo s'ottiene utilizzando la parola chiave ``DOC:`` a cui viene associa=
to
 un titolo.
@@ -565,6 +595,8 @@ identifiers: *[ function/type ...]*
   Include la documentazione per ogni *function* e *type*  in *source*.
   Se non vengono esplicitamente specificate le funzioni da includere, allo=
ra
   verranno incluse tutte quelle disponibili in *source*.
+  *type* pu=C3=B2 essere un identificatore di tipo ``struct``, ``union``,
+  ``enum``, ``typedef`` o ``var``.
=20
   Esempi::
=20
@@ -601,7 +633,25 @@ dai file sorgenti.
 Come utilizzare kernel-doc per generare pagine man
 --------------------------------------------------
=20
-Se volete utilizzare kernel-doc solo per generare delle pagine man, potete
-farlo direttamente dai sorgenti del kernel::
+Per generare le pagine man di tutti i file che contengono marcatori
+kernel-doc, eseguite::
+
+  $ make mandocs
+
+Oppure, chiamando direttamente ``script-build-wrapper``::
+
+  $ ./tools/docs/sphinx-build-wrapper mandocs
+
+Il risultato sar=C3=A0 disponibile nella cartella ``/man`` dentro la carte=
lla
+di output (predefinita: ``Documentation/output``).
+
+Opzionalmente, =C3=A8 possibile generare un sottoinsieme di pagine man usa=
ndo
+SPHINXDIRS:
+
+  $ make SPHINXDIRS=3Ddriver-api/media mandocs
+
+.. note::
=20
-  $ tools/docs/kernel-doc -man $(git grep -l '/\*\*' -- :^Documentation :^=
tools) | scripts/split-man.pl /tmp/man
+   Quando si usa SPHINXDIRS=3D{subdir}, verranno generate le pagine man so=
lo
+   per i file che si trovano esplicitamente all'interno di un file
+   ``Documentation/{subdir}/.../*.rst``.
diff --git a/Documentation/translations/it_IT/doc-guide/maintainer-profile.=
rst b/Documentation/translations/it_IT/doc-guide/maintainer-profile.rst
new file mode 100644
index 000000000000..02eb9d1c796c
--- /dev/null
+++ b/Documentation/translations/it_IT/doc-guide/maintainer-profile.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-ita.rst
+
+Profilo del manutentore del sottosistema di documentazione
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Il "sottosistema" della documentazione =C3=A8 il punto di coordinamento
+centrale per la documentazione del kernel e la relativa infrastruttura.
+Copre la gerarchia sotto Documentation/ (con l'eccezione di
+Documentation/devicetree), diverse utilit=C3=A0 sotto scripts/ e, almeno i=
n
+parte, LICENSES/.
+
+Vale la pena notare, per=C3=B2, che i confini di questo sottosistema sono =
pi=C3=B9 sfumati
+del normale. Molti altri manutentori di sottosistemi preferiscono mantener=
e il
+controllo di alcune parti di Documentation/, e molti altri ancora vi appli=
cano
+liberamente delle modifiche quando =C3=A8 conveniente. Oltre a ci=C3=B2, b=
uona parte della
+documentazione del kernel si trova nel codice sorgente sotto forma di comm=
enti
+kerneldoc; questi sono solitamente (ma non sempre) mantenuti dal manutento=
re del
+sottosistema pertinente.
+
+La lista di discussione per la documentazione =C3=A8 linux-doc@vger.kernel=
.org.
+Le patch dovrebbero essere inviate contro l'albero docs-next quando
+possibile.
+
+Aggiunta alla checklist di invio
+--------------------------------
+
+Quando si apportano modifiche alla documentazione, dovreste generare
+effettivamente la documentazione e assicurarvi che non siano stati
+introdotti nuovi errori o avvisi. Generare i documenti in HTML e osservare
+il risultato aiuter=C3=A0 a evitare fraintendimenti spiacevoli su come le =
cose
+verranno rappresentate.
+
+Tutta la nuova documentazione (incluse le aggiunte a documenti esistenti)
+dovrebbe idealmente giustificare, da qualche parte nel changelog, chi sia
+il pubblico a cui =C3=A8 destinata; in questo modo, ci assicuriamo che la
+documentazione finisca nel posto giusto. Alcune categorie possibili
+sono: sviluppatori del kernel (esperti o principianti), programmatori
+dello spazio utente, utenti finali e/o amministratori di sistema, e
+distributori.
+
+Date chiave del ciclo
+---------------------
+
+Le patch possono essere inviate in qualsiasi momento, ma la risposta sar=
=C3=A0
+pi=C3=B9 lenta del solito durante la finestra d'integrazione. L'albero del=
la
+documentazione tende a chiudersi tardi, prima dell'apertura della finestra
+d'integrazione, poich=C3=A9 il rischio di regressioni dovute a patch sulla
+documentazione =C3=A8 basso.
+
+Cadenza di revisione
+--------------------
+
+Sono (Jonathan Corbet) l'unico manutentore del sottosistema di documentazi=
one, e
+svolgo questo lavoro nel mio tempo libero, quindi la risposta alle patch s=
ar=C3=A0 a
+volte lenta. Cerco sempre di inviare una notifica quando una patch viene
+integrata (o quando decido che non pu=C3=B2 esserlo). Non esitate a inviar=
e un
+sollecito se non avete ricevuto risposta entro una settimana dall'invio di=
 una
+patch.
diff --git a/Documentation/translations/it_IT/doc-guide/parse-headers.rst b=
/Documentation/translations/it_IT/doc-guide/parse-headers.rst
index b0caa40fe1e9..9276b9ebe9bd 100644
--- a/Documentation/translations/it_IT/doc-guide/parse-headers.rst
+++ b/Documentation/translations/it_IT/doc-guide/parse-headers.rst
@@ -1,195 +1,195 @@
 .. include:: ../disclaimer-ita.rst
=20
-:Original: Documentation/doc-guide/index.rst
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Includere gli i file di intestazione uAPI
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Includere i file di intestazione uAPI
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Qualche volta =C3=A8 utile includere dei file di intestazione e degli esem=
pi di codice C
 al fine di descrivere l'API per lo spazio utente e per generare dei riferi=
menti
 fra il codice e la documentazione. Aggiungere i riferimenti ai file dell'A=
PI
-dello spazio utente ha ulteriori vantaggi: Sphinx generer=C3=A0 dei messag=
gi
+dello spazio utente ha un ulteriore vantaggio: Sphinx generer=C3=A0 dei me=
ssaggi
 d'avviso se un simbolo non viene trovato nella documentazione. Questo perm=
ette
 di mantenere allineate la documentazione della uAPI (API spazio utente)
 con le modifiche del kernel.
-Il programma :ref:`parse_headers.py <it_parse_headers>` genera questi rife=
rimenti.
-Esso dev'essere invocato attraverso un Makefile, mentre si genera la
-documentazione. Per avere un esempio su come utilizzarlo all'interno del k=
ernel
-consultate ``Documentation/userspace-api/media/Makefile``.
+Il programma :ref:`parse_headers.py <it_parse_headers>` genera questi
+riferimenti. Esso dev'essere invocato attraverso un Makefile, mentre si ge=
nera
+la documentazione. Per avere un esempio su come utilizzarlo all'interno de=
l
+kernel consultate ``Documentation/userspace-api/media/Makefile``.
=20
 .. _it_parse_headers:
=20
-parse_headers.py
-^^^^^^^^^^^^^^^^
+tools/docs/parse_headers.py
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
=20
 NOME
 ****
=20
+parse_headers.py - analizza un file C al fine di identificare funzioni,
+strutture, enumerati e definizioni, e creare riferimenti per un libro Sphi=
nx.
=20
-parse_headers.py - analizza i file C al fine di identificare funzioni,
-strutture, enumerati e definizioni, e creare riferimenti per Sphinx
+USO
+***
=20
-SINTASSI
-********
+parse-headers.py [-h] [-d] [-t] ``FILE_IN`` ``FILE_OUT`` ``FILE_RULES``
=20
+SINOSSI
+*******
=20
-\ **parse_headers.py**\  [<options>] <C_FILE> <OUT_FILE> [<EXCEPTIONS_FILE=
>]
+Converte un file d'intestazione o un file sorgente C ``FILE_IN`` in un tes=
to
+ReStructured Text incluso mediante il blocco ..parsed-literal con riferime=
nti
+alla documentazione che descrive l'API. Accetta opzionalmente un file
+``FILE_RULES`` che descrive quali elementi debbano essere ignorati o il cu=
i
+riferimento debba puntare ad un tipo/nome diverso da quello predefinito.
=20
-Dove <options> pu=C3=B2 essere: --debug, --usage o --help.
+Il file generato viene scritto in ``FILE_OUT``.
=20
+Il programma =C3=A8 capace di identificare ``define``, ``struct``, ``typed=
ef``,
+``enum`` e ``symbol`` di un enumerato, creando i riferimenti per ognuno di
+loro.
=20
-OPZIONI
-*******
+Inoltre, esso =C3=A8 capace di distinguere le ``#define`` utilizzate per
+specificare le macro specifiche di Linux usate per definire gli ``ioctl``.
=20
+Il file ``FILE_RULES``, opzionale, contiene un insieme di regole come le
+seguenti::
=20
+    ignore ioctl VIDIOC_ENUM_FMT
+    replace ioctl VIDIOC_DQBUF vidioc_qbuf
+    replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_mot=
ion_det`
=20
-\ **--debug**\
+ARGOMENTI POSIZIONALI
+*********************
=20
- Lo script viene messo in modalit=C3=A0 verbosa, utile per il debugging.
+  ``FILE_IN``
+      File C d'ingresso
=20
+  ``FILE_OUT``
+      File RST generato
=20
-\ **--usage**\
+  ``FILE_RULES``
+      File delle eccezioni (opzionale)
=20
- Mostra un messaggio d'aiuto breve e termina.
-
-
-\ **--help**\
+OPZIONI
+*******
=20
- Mostra un messaggio d'aiuto dettagliato e termina.
+  ``-h``, ``--help``
+      mostra un messaggio d'aiuto e termina
+  ``-d``, ``--debug``
+      aumenta il livello di debug. Pu=C3=B2 essere usato pi=C3=B9 volte
+  ``-t``, ``--toc``
+      invece di un blocco letterale, genera nel file RST una tabella
+      dell'indice (TOC)
=20
=20
 DESCRIZIONE
 ***********
=20
-Converte un file d'intestazione o un file sorgente C (C_FILE) in un testo
-reStructuredText incluso mediante il blocco ..parsed-literal
-con riferimenti alla documentazione che descrive l'API. Opzionalmente,
-il programma accetta anche un altro file (EXCEPTIONS_FILE) che
-descrive quali elementi debbano essere ignorati o il cui riferimento
-deve puntare ad elemento diverso dal predefinito.
-
-Il file generato sar=C3=A0 disponibile in (OUT_FILE).
-
-Il programma =C3=A8 capace di identificare *define*, funzioni, strutture,
-tipi di dato, enumerati e valori di enumerati, e di creare i riferimenti
-per ognuno di loro. Inoltre, esso =C3=A8 capace di distinguere le #define
-utilizzate per specificare i comandi ioctl di Linux.
-
-Il file EXCEPTIONS_FILE contiene due tipi di dichiarazioni:
-\ **ignore**\  o \ **replace**\ .
-
-La sintassi per ignore =C3=A8:
-
-ignore \ **tipo**\  \ **nome**\
-
-La dichiarazione \ **ignore**\  significa che non verr=C3=A0 generato alcu=
n
-riferimento per il simbolo \ **name**\  di tipo \ **tipo**\ .
+Crea, a partire da ``FILE_IN``, una versione arricchita di un file
+d'intestazione del kernel con collegamenti incrociati verso ogni tipo di
+struttura dati C, formattandola con la notazione reStructuredText, sia
+come blocco letterale che come tabella dell'indice.
=20
+Accetta opzionalmente un file ``FILE_RULES`` che descrive quali elementi
+debbano essere ignorati o il cui riferimento debba puntare ad un valore
+diverso da quello predefinito, e che pu=C3=B2 opzionalmente definire lo sp=
azio
+dei nomi C da utilizzare.
=20
-La sintassi per replace =C3=A8:
+Ha lo scopo di permettere una documentazione pi=C3=B9 completa, in cui i f=
ile
+d'intestazione della uAPI creino collegamenti incrociati verso il codice.
=20
-replace \ **tipo**\  \ **nome**\  \ **nuovo_valore**\
+Il file generato viene scritto in ``FILE_OUT``.
=20
-La dichiarazione \ **replace**\  significa che verr=C3=A0 generato un
-riferimento per il simbolo \ **name**\ di tipo \ **tipo**\ , ma, invece
-di utilizzare il valore predefinito, verr=C3=A0 utilizzato il valore
-\ **nuovo_valore**\ .
+Il file ``FILE_RULES`` pu=C3=B2 contenere tre tipi di dichiarazioni:
+**ignore**, **replace** e **namespace**.
=20
-Per entrambe le dichiarazioni, il \ **tipo**\  pu=C3=B2 essere uno dei seg=
uenti:
+Per impostazione predefinita, vengono create regole per tutti i simboli e
+le definizioni, ma =C3=A8 anche possibile fornire un file di eccezioni. Qu=
esto
+file contiene un insieme di regole che seguono la sintassi descritta di
+seguito:
=20
+1. Regole ignore:
=20
-\ **ioctl**\
+    ignore *tipo* *simbolo*
=20
- La dichiarazione ignore o replace verr=C3=A0 applicata su definizioni di =
ioctl
- come la seguente:
+Rimuove il simbolo dalla generazione dei riferimenti.
=20
- #define=09VIDIOC_DBG_S_REGISTER =09 _IOW('V', 79, struct v4l2_dbg_registe=
r)
+2. Regole replace:
=20
+    replace *tipo* *vecchio_simbolo* *nuovo_riferimento*
=20
+    Sostituisce *vecchio_simbolo* con *nuovo_riferimento*.
+    *nuovo_riferimento* pu=C3=B2 essere:
=20
-\ **define**\
+    - un semplice nome di simbolo;
+    - un riferimento Sphinx completo.
=20
- La dichiarazione ignore o replace verr=C3=A0 applicata su una qualsiasi #=
define
- trovata in C_FILE.
+3. Regole namespace
=20
+    namespace *spazio_dei_nomi*
=20
+    Imposta lo *spazio_dei_nomi* C da utilizzare durante la generazione de=
i
+    riferimenti incrociati. Pu=C3=B2 essere sovrascritto dalle regole repl=
ace.
=20
-\ **typedef**\
+Nelle regole ignore e replace, *tipo* pu=C3=B2 essere:
=20
- La dichiarazione ignore o replace verr=C3=A0 applicata ad una dichiarazio=
ne typedef
- in C_FILE.
+    - ioctl:
+        per le definizioni della forma ``_IO*``, per esempio le definizion=
i
+        di ioctl
=20
+    - define:
+        per le altre definizioni
=20
+    - symbol:
+        per i simboli definiti all'interno di enumerati;
=20
-\ **struct**\
+    - typedef:
+        per i typedef;
=20
- La dichiarazione ignore o replace verr=C3=A0 applicata ai nomi di struttu=
re
- in C_FILE.
+    - enum:
+        per il nome di un enumerato non anonimo;
=20
-
-
-\ **enum**\
-
- La dichiarazione ignore o replace verr=C3=A0 applicata ai nomi di enumera=
ti
- in C_FILE.
-
-
-
-\ **symbol**\
-
- La dichiarazione ignore o replace verr=C3=A0 applicata ai nomi di valori =
di
- enumerati in C_FILE.
-
- Per le dichiarazioni di tipo replace, il campo \ **new_value**\  utilizze=
r=C3=A0
- automaticamente i riferimenti :c:type: per \ **typedef**\ , \ **enum**\  =
e
- \ **struct**\. Invece, utilizzer=C3=A0 :ref: per \ **ioctl**\ , \ **defin=
e**\  e
- \ **symbol**\. Il tipo di riferimento pu=C3=B2 essere definito esplicitam=
ente
- nella dichiarazione stessa.
+    - struct:
+        per le strutture.
=20
=20
 ESEMPI
 ******
=20
+- Ignora una definizione ``_VIDEODEV2_H`` in ``FILE_IN``::
=20
-ignore define _VIDEODEV2_H
-
-
-Ignora una definizione #define _VIDEODEV2_H nel file C_FILE.
-
-ignore symbol PRIVATE
+    ignore define _VIDEODEV2_H
=20
+- In una struttura dati come questo enumerato::
=20
-In un enumerato come il seguente:
+    enum foo { BAR1, BAR2, PRIVATE };
=20
-enum foo { BAR1, BAR2, PRIVATE };
+  Non generer=C3=A0 alcun riferimento incrociato per ``PRIVATE``::
=20
-Non generer=C3=A0 alcun riferimento per \ **PRIVATE**\ .
+    ignore symbol PRIVATE
=20
-replace symbol BAR1 :c:type:\`foo\`
-replace symbol BAR2 :c:type:\`foo\`
+  Nello stesso enumerato, invece di creare un riferimento incrociato per
+  ogni simbolo, si pu=C3=B2 far si che tutti puntino al tipo C ``enum foo`=
`::
=20
+    replace symbol BAR1 :c:type:\`foo\`
+    replace symbol BAR2 :c:type:\`foo\`
=20
-In un enumerato come il seguente:
=20
-enum foo { BAR1, BAR2, PRIVATE };
-
-Generer=C3=A0 un riferimento ai valori BAR1 e BAR2 dal simbolo foo nel dom=
inio C.
+- Usa lo spazio dei nomi C ``MC`` per tutti i simboli in ``FILE_IN``::
=20
+    namespace MC
=20
 BUGS
 ****
=20
-Riferire ogni malfunzionamento a Mauro Carvalho Chehab <mchehab@s-opensour=
ce.com>
-
+Segnalate qualsiasi malfunzionamento a Mauro Carvalho Chehab
+<mchehab@kernel.org>
=20
 COPYRIGHT
 *********
=20
+Copyright (c) 2016, 2025 di Mauro Carvalho Chehab <mchehab+huawei@kernel.o=
rg>.
=20
-Copyright (c) 2016 by Mauro Carvalho Chehab <mchehab@s-opensource.com>.
-
-Licenza GPLv2: GNU GPL version 2 <https://gnu.org/licenses/gpl.html>.
+Licenza GPLv2: GNU GPL versione 2 <https://gnu.org/licenses/gpl.html>.
=20
 Questo =C3=A8 software libero: siete liberi di cambiarlo e ridistribuirlo.
 Non c'=C3=A8 alcuna garanzia, nei limiti permessi dalla legge.
diff --git a/Documentation/translations/it_IT/doc-guide/sphinx.rst b/Docume=
ntation/translations/it_IT/doc-guide/sphinx.rst
index a5c5d935febf..70f5b24b6407 100644
--- a/Documentation/translations/it_IT/doc-guide/sphinx.rst
+++ b/Documentation/translations/it_IT/doc-guide/sphinx.rst
@@ -1,8 +1,5 @@
 .. include:: ../disclaimer-ita.rst
=20
-.. note:: Per leggere la documentazione originale in inglese:
-=09  :ref:`Documentation/doc-guide/index.rst <doc_guide>`
-
 .. _it_sphinxdoc:
=20
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -36,7 +33,7 @@ Installazione Sphinx
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 I marcatori ReST utilizzati nei file in Documentation/ sono pensati per es=
sere
-processati da ``Sphinx`` nella versione 1.7 o superiore.
+processati da ``Sphinx`` nella versione 3.4.3 o superiore.
=20
 Esiste uno script che verifica i requisiti Sphinx. Per ulteriori dettagli
 consultate :ref:`it_sphinx-pre-install`.
@@ -52,24 +49,14 @@ vi raccomandiamo di installare Sphinx dentro ad un ambi=
ente virtuale usando
 ``virtualenv-3`` o ``virtualenv`` a seconda di come Python 3 =C3=A8 stato
 pacchettizzato dalla vostra distribuzione.
=20
-.. note::
-
-   #) Viene raccomandato l'uso del tema RTD per la documentazione in HTML.
-      A seconda della versione di Sphinx, potrebbe essere necessaria
-      l'installazione tramite il comando ``pip install sphinx_rtd_theme``.
-
-   #) Alcune pagine ReST contengono delle formule matematiche. A causa del
-      modo in cui Sphinx funziona, queste espressioni sono scritte
-      utilizzando LaTeX. Per una corretta interpretazione, =C3=A8 necessar=
io aver
-      installato texlive con i pacchetti amdfonts e amsmath.
-
-Riassumendo, se volete installare la versione 2.4.4 di Sphinx dovete esegu=
ire::
+Riassumendo, se volete installare l'ultima versione di Sphinx, dovete
+eseguire::
=20
-       $ virtualenv sphinx_2.4.4
-       $ . sphinx_2.4.4/bin/activate
-       (sphinx_2.4.4) $ pip install -r Documentation/sphinx/requirements.t=
xt
+       $ virtualenv sphinx_latest
+       $ . sphinx_latest/bin/activate
+       (sphinx_latest) $ pip install -r Documentation/sphinx/requirements.=
txt
=20
-Dopo aver eseguito ``. sphinx_2.4.4/bin/activate``, il prompt cambier=
=C3=A0 per
+Dopo aver eseguito ``. sphinx_latest/bin/activate``, il prompt cambier=
=C3=A0 per
 indicare che state usando il nuovo ambiente. Se aprite un nuova sessione,
 prima di generare la documentazione, dovrete rieseguire questo comando per
 rientrare nell'ambiente virtuale.
@@ -99,6 +86,27 @@ Per alcune distribuzioni Linux potrebbe essere necessari=
o installare
 anche una serie di pacchetti ``texlive`` in modo da fornire il supporto
 minimo per il funzionamento di ``XeLaTeX``.
=20
+Espressioni matematiche in HTML
+-------------------------------
+
+Alcune pagine ReST contengono delle formule matematiche. Per come funziona
+Sphinx, queste espressioni sono scritte utilizzando la notazione LaTeX. Es=
istono
+due opzioni per far si che Sphinx rappresenti le espressioni matematiche
+nell'output HTML. La prima =C3=A8 un'estensione chiamata `imgmath`_ che co=
nverte le
+espressioni matematiche in immagini e le integra nelle pagine HTML. L'altr=
a =C3=A8
+un'estensione chiamata `mathjax`_ che delega la rappresentazione delle for=
mule
+matematiche ai browser web capaci di eseguire JavaScript. La prima era l'u=
nica
+opzione per la documentazione del kernel precedente alla versione 6.1 e ri=
chiede
+diversi pacchetti texlive, fra cui amsfonts e amsmath.
+
+A partire dalla versione 6.1 del kernel, le pagine HTML con espressioni
+matematiche possono essere generate senza dover installare alcun pacchetto
+texlive. Per maggiori informazioni consultate `Scelta della libreria per l=
e
+formule matematiche`_.
+
+.. _imgmath: https://www.sphinx-doc.org/en/master/usage/extensions/math.ht=
ml#module-sphinx.ext.imgmath
+.. _mathjax: https://www.sphinx-doc.org/en/master/usage/extensions/math.ht=
ml#module-sphinx.ext.mathjax
+
 .. _it_sphinx-pre-install:
=20
 Verificare le dipendenze Sphinx
@@ -136,6 +144,30 @@ Questo script ha i seguenti parametri:
 =09Utilizza l'ambiente predefinito dal sistema operativo invece che
 =09l'ambiente virtuale per Python;
=20
+Installare la versione minima di Sphinx
+---------------------------------------
+
+Quando si modifica il sistema di generazione di Sphinx, =C3=A8 importante
+assicurarsi che la versione minima sia ancora supportata. Al giorno d'oggi=
,
+sta diventando sempre pi=C3=B9 difficile farlo sulle distribuzioni moderne=
, dato
+che non =C3=A8 possibile installarla con Python 3.13 e versioni successive=
.
+
+Potete verificare la versione minima di Python supportata, cos=C3=AC come
+definita in Documentation/process/changes.rst, creando un venv con quella
+versione e installando i requisiti minimi con::
+
+=09/usr/bin/python3.9 -m venv sphinx_min
+=09. sphinx_min/bin/activate
+=09pip install -r Documentation/sphinx/min_requirements.txt
+
+Un test pi=C3=B9 completo pu=C3=B2 essere eseguito utilizzando:
+
+=09tools/docs/test_doc_build.py
+
+Questo script crea un venv Python per ogni versione supportata, generando
+facoltativamente la documentazione per un intervallo di versioni di
+Sphinx.
+
=20
 Generazione della documentazione Sphinx
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -143,39 +175,82 @@ Generazione della documentazione Sphinx
 Per generare la documentazione in formato HTML o PDF si eseguono i rispett=
ivi
 comandi ``make htmldocs`` o ``make pdfdocs``. Esistono anche altri formati
 in cui =C3=A8 possibile generare la documentazione; per maggiori informazi=
oni
-potere eseguire il comando ``make help``.
+potete eseguire il comando ``make help``.
 La documentazione cos=C3=AC generata sar=C3=A0 disponibile nella sottocart=
ella
 ``Documentation/output``.
=20
 Ovviamente, per generare la documentazione, Sphinx (``sphinx-build``)
-dev'essere installato. Se disponibile, il tema *Read the Docs* per Sphinx
-verr=C3=A0 utilizzato per ottenere una documentazione HTML pi=C3=B9 gradev=
ole.
-Per la documentazione in formato PDF, invece, avrete bisogno di ``XeLaTeX`
-e di ``convert(1)`` disponibile in ImageMagick
-(https://www.imagemagick.org). \ [#ink]_
-Tipicamente, tutti questi pacchetti sono disponibili e pacchettizzati nell=
e
-distribuzioni Linux.
+dev'essere installato. Per la documentazione in formato PDF, invece,
+avrete bisogno di ``XeLaTeX`` e di ``convert(1)`` disponibile in
+ImageMagick (https://www.imagemagick.org).\ [#ink]_ Tutti questi pacchetti
+sono ampiamente disponibili e pacchettizzati nelle distribuzioni.
=20
 Per poter passare ulteriori opzioni a Sphinx potete utilizzare la variabil=
e
-make ``SPHINXOPTS``. Per esempio, se volete che Sphinx sia pi=C3=B9 verbos=
o durante
-la generazione potete usare il seguente comando ``make SPHINXOPTS=3D-v htm=
ldocs``.
+make ``SPHINXOPTS``. Per esempio, se volete che Sphinx sia pi=C3=B9 prolis=
so
+durante la generazione potete usare il comando
+``make SPHINXOPTS=3D-v htmldocs``.
=20
-Potete anche personalizzare l'ouptut html passando un livello aggiuntivo
+Potete anche personalizzare l'output html passando un livello aggiuntivo
 DOCS_CSS usando la rispettiva variabile d'ambiente ``DOCS_CSS``.
=20
-La variable make ``SPHINXDIRS`` =C3=A8 utile quando si vuole generare solo=
 una parte
-della documentazione. Per esempio, si possono generare solo di documenti i=
n
-``Documentation/doc-guide`` eseguendo ``make SPHINXDIRS=3Ddoc-guide htmldo=
cs``. La
-sezione dedicata alla documentazione di ``make help`` vi mostrer=C3=A0 qua=
li sotto
-cartelle potete specificare.
+Il tema di base per generare la documentazione HTML viene =C3=A8 "Alabaste=
r"; questo
+tema =C3=A8 distribuito assieme a Sphinx e non necessita di un'installazio=
ne
+separata. Il tema di Sphinx pu=C3=B2 essere sostituito usando la variabile=
 make
+``DOCS_THEME``.
+
+.. note::
+
+   Alcuni potrebbero preferire il tema RTD per l'output in HTML. A seconda
+   della versione di Sphinx, dev'essere installato separatamente, con il
+   comando ``pip install sphinx_rtd_theme``.
+
+Esiste un'altra variabile make, ``SPHINXDIRS``, utile quando si vuole
+generare, a scopo di test, solo una parte della documentazione. Per
+esempio, potete generare i documenti in ``Documentation/doc-guide``
+eseguendo ``make SPHINXDIRS=3Ddoc-guide htmldocs``. La sezione dedicata al=
la
+documentazione di ``make help`` vi mostrer=C3=A0 l'elenco delle sottocarte=
lle
+che potete specificare.
=20
 Potete eliminare la documentazione generata tramite il comando
 ``make cleandocs``.
=20
-.. [#ink] Avere installato anche ``inkscape(1)`` dal progetto Inkscape ()
-          potrebbe aumentare la qualit=C3=A0 delle immagini che verranno i=
ntegrate
-          nel documento PDF, specialmente per quando si usando rilasci del
-          kernel uguali o superiori a 5.18
+.. [#ink] Avere installato anche ``inkscape(1)`` dal progetto Inkscape
+=09  (https://inkscape.org) potrebbe aumentare la qualit=C3=A0 delle
+=09  immagini integrate nei documenti PDF, specialmente per i rilasci
+=09  del kernel dalla versione 5.18 in poi.
+
+Scelta della libreria per le formule matematiche
+------------------------------------------------
+
+A partire dalla versione 6.1 del kernel, mathjax funge da libreria di
+ripiego per le formule matematiche nell'output HTML.\ [#sph1_8]_
+
+La libreria matematica viene scelta in base ai comandi disponibili, come
+mostrato di seguito:
+
+.. table:: Scelta della libreria matematica per l'HTML
+
+    =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    Libreria Comandi richiesti Formato immagine
+    =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    imgmath  latex, dvipng     PNG (raster)
+    mathjax
+    =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+La scelta pu=C3=B2 essere sovrascritta impostando la variabile d'ambiente
+``SPHINX_IMGMATH`` come mostrato di seguito:
+
+.. table:: Effetto dell'impostazione di ``SPHINX_IMGMATH``
+
+    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D
+    Impostazione           Libreria
+    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D
+    ``SPHINX_IMGMATH=3Dyes`` imgmath
+    ``SPHINX_IMGMATH=3Dno``  mathjax
+    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D
+
+.. [#sph1_8] La libreria di ripiego richiede Sphinx >=3D1.8.
+
=20
 Scrivere la documentazione
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
@@ -289,8 +364,19 @@ incrociato quando questa ha una voce nell'indice.  Se =
trovate degli usi di
 ``c:func:`` nella documentazione del kernel, sentitevi liberi di rimuoverl=
i.
=20
=20
+Tabelle
+-------
+
+Il formato reStructuredText offre diverse opzioni per la sintassi delle ta=
belle.
+Lo stile del kernel per le tabelle preferisce la sintassi delle *tabelle
+semplici* o delle *tabelle a griglia*. Per maggiori dettagli consultate il
+`manuale di riferimento reStructuredText per la sintassi delle tabelle`_.
+
+.. _manuale di riferimento reStructuredText per la sintassi delle tabelle:
+   https://docutils.sourceforge.io/docs/user/rst/quickref.html#tables
+
 Tabelle a liste
----------------
+~~~~~~~~~~~~~~~
=20
 Il formato ``list-table`` pu=C3=B2 essere utile per tutte quelle tabelle c=
he non
 possono essere facilmente scritte usando il formato ASCII-art di Sphinx. P=
er=C3=B2,
@@ -403,6 +489,16 @@ percorso al documento.
=20
 Per informazioni riguardo ai riferimenti incrociati ai commenti
 kernel-doc per funzioni o tipi, consultate
+Documentation/translations/it_IT/doc-guide/kernel-doc.rst.
+
+Riferimenti ai commit
+~~~~~~~~~~~~~~~~~~~~~
+
+I riferimenti ai commit di git vengono trasformati automaticamente in
+collegamenti ipertestuali quando sono scritti in uno di questi formati::
+
+    commit 72bf4f1767f0
+    commit 72bf4f1767f0 ("net: do not leave an empty skb in write queue")
=20
 .. _it_sphinx_kfigure:
=20
--=20
2.47.3



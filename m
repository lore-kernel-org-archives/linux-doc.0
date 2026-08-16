Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D23C9454
	for <linux-doc@vger.kernel.org>; Sun, 16 Aug 2026 19:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909197; cv=none; b=CinJazxZhK6IdHEz8lgBjyINx8BwdWyr0IsbT1UcXGo/i65dpwY1wDc6gvL07uwo4u5sF4XD5sjdzfJ9y2sMJzONS1co1phbCgNz1R5ZxMDD36ucyF4BtGj6jgoIUlqfpyXfzu0v65icXO8t/d5pLGr0wk7XHTr1uBc/raUF7GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909197; c=relaxed/simple;
	bh=vBna+ZUiZ+dkPB0GDvK9j0ptpOflz6XLS8bHpEIuzWY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EZMJP4+NGZlrNEm3DIdWuNPiAZak8H5fNjR2bXc0y1jUtSLZwfqfPLFtNcSp3+q+lw1niii/DnUUNN4D1D5Sf2O7m+YO/We8mDrrCpAGItX68nueXhpLAskR9xv2x3/u8wmvM6PWJSGsWddBO3a99N4lyax2NqVRWnmEMYh6mOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it; spf=pass smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b=OYei30bE; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b="OYei30bE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail; t=1786909172; x=1787168372;
	bh=9Ps/Qft80kW2kJFgwi6meZQ7LvYcwEH/sJWs9cHPpps=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OYei30bE5boXT8dl4XwHBiKmOKIYtwK03QQIqObvY3N92c9EfShM6KqxIkPX1bZWQ
	 ii5IoZJ9RIZvLchEbOiMc8OJ+aJ0fQsREN6vHYukbcVqC3DcUcB234m1c6bDvz0xpK
	 r9qjOqrlPyO/Gg1XO/48D8gYN0GUsB1+zowGBoeAtKwcbS91TbbPbCCYLFqetzLVC8
	 kpXzkTKOqRWvWHcnKdqxICFlo7zRunVZ4LiK9ZN5v0rvJVnwxmmjAPZWnGsr3YHwJn
	 4TW6F7kwBbJnkufwsPSBK4fsBZ+78WSVfAReC/6Hll275M7ue/UsJ+SzQofYSTsxKy
	 Vaea6odYKwUwA==
Date: Sun, 16 Aug 2026 19:39:28 +0000
To: Jonathan Corbet <corbet@lwn.net>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>
Subject: [PATCH] doc:it_IT: align Italian documentation in process
Message-ID: <20260816193906.68808-1-federico.vaga@vaga.pv.it>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: 809ac4ce14e0c8f93e647113110b9061492ac434
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This commit updates the Italian translation in `process/` following
these changes:

commit 44abc8fcbff2 ("Documentation: process: Arbitrarily bump kernel major=
 version number")
commit ba2457109d5b ("Documentation: process: Also mention Sasha Levin as s=
table tree maintainer")
commit 5ce70894f6ca ("Doc: correct spelling and wording mistakes")
commit 46298375477b ("linux-next: update maintainer info.")
commit 43e9076a00b1 ("docs: Fix conflicting contributor identity info")
commit b27f9e8079bf ("docs: remove Documentation/dontdiff")
commit 9734b3e753ad ("docs: 5.Posting: mentioned Suggested-by: tag")
commit 4e6b7141d169 ("docs: clarify rules wrt tagging other people")
commit 944df7a31452 ("docs: update the guidance for Link: tags")
commit 0a83293322fd ("doc: development-process: add notice on testing")
commit a037699da0a1 ("docs: Add debugging section to process")
commit 78d979db6cef ("docs: add AI Coding Assistants documentation")
commit a66437c27979 ("Documentation: Provide guidelines for tool-generated =
content")
commit a592a36e4937 ("Documentation: use a source-read extension for the in=
dex link boilerplate")
commit 102606402f4f ("Documentation: Project continuity")
commit a03ef333fbd6 ("Documentation: security-bugs: explain what is and is =
not a security bug")
commit d0b343605f1b ("kernel-docs: Add new section for Rust learning materi=
als")
commit 57937eac1f78 ("kernel-docs: Add book to process/kernel-docs.rst")
commit d8c949c577b5 ("docs/licensing: Clarify wording about "GPL" and "Prop=
rietary"")
commit ebf1bafd0907 ("LICENSES: Explicitly allow SPDX-FileCopyrightText")
commit 9fa7153c31a3 ("rust: conclude the Rust experiment")
commit 47cb33cedf47 ("docs: clarify wording in programming-language.rst")
commit 45a92c0b91d7 ("docs: maintainers: add SPDX license to the file")
commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")
commit e4c8b46b924e ("slab: Introduce kmalloc_flex() and family")
commit d957b4184aee ("Documentation: deprecated.rst: kmalloc-family: mark a=
rgument as optional")
commit 120a64c8021d ("Documentation: process: fix brackets")
commit 079a028d6327 ("string: Remove strncpy() from the kernel")
commit e551bd4109d2 ("Documentation: remove :kyb: tags")
commit 4971ca2007e3 ("docs: process: email-client: add Thunderbird "Toggle =
Line Wrap" extension")
commit f44a29784f68 ("Documentation: update maintainer-pgp-guide for latest=
 best practices")
commit 273aa250f138 ("Documentation: Improve wording on requirements for a =
free Nitrokey")
commit 6c5c07bc8589 ("docs: process: maintainer-pgp-guide: update kernel.or=
g docs link")
commit 54857c52452a ("docs: maintainer-pgp-guide.rst: add a reference for k=
ernel.org sign")
commit a556bd882b94 ("docs: align with scripts/syscall.tbl migration")
commit e5b1c0fa4ff2 ("Documentation: Remove :manpage: from non-existing man=
 pages")
commit 78a00cac1e96 ("docs: fix 're-use' -> 'reuse' in documentation")
commit ec6fd28baf61 ("docs: remove unneeded maintainer_handbooks_main label=
")
commit 8eae6da5f56c ("docs: auto-generate maintainer entry profile links")
commit bda185c30593 ("docs: maintainers_include: Only show main entry for p=
rofiles")
commit 2783096fb1dd ("docs: submit-checklist: Expand on build tests against=
 different word sizes")
commit fb12098d8ee4 ("docs: submit-checklist: Allow creating cross-referenc=
es for ABI README")
commit 5a63f0369bda ("docs/.../submit-checklist: Use Documentation/admin-gu=
ide/abi.rst for cross-ref of README")
commit e5880f95a979 ("docs: process: discourage pointless boilerplate kdoc"=
)
commit 2c62e2e874d1 ("coding-style: fix verb typo")
commit 197bbebd2581 ("docs: Update documentation to avoid mentioning of ker=
nel.h")
commit eba6ffd126cd ("docs: kdoc: move kernel-doc to tools/docs")
commit 7c6d969d5349 ("Documentation: adopt new coding style of type-aware k=
malloc-family")
commit 323fa4b9608b ("Documentation: Fix syntax of kmalloc_objs example in =
coding style doc")
commit d49172bbd7eb ("Documentation: clarify the expected collaboration wit=
h security bugs reporters")
commit 3a68841d1d9b ("Documentation: smooth the text flow in the security b=
ug reporting process")
commit ceddb2c001d9 ("Documentation: insist on the plain-text requirement f=
or security reports")
commit f2b1cbef1536 ("Documentation: minor updates to the security contacts=
")
commit a72b832a4823 ("Documentation: explain how to find maintainers addres=
ses for security reports")
commit 496fa1befba1 ("Documentation: clarify the mandatory and desirable in=
fo for security reports")
commit f387e2e2b9d3 ("Documentation: fix two typos in latest update to the =
security report howto")
commit aed3c3346765 ("Documentation: security-bugs: do not systematically C=
c the security team")
commit 4bf85afb9f3e ("Documentation: security-bugs: clarify requirements fo=
r AI-assisted reports")
commit 561458db0d6b ("docs: security-bugs: add a link to the threat-model d=
ocumentation")
commit 5f5e7344322f ("kbuild: generate offset range data for builtin module=
s")
commit 41047d53bcff ("docs:process:changes: fix version command for btrfs-p=
rogs")
commit 82a1978d0fdc ("kheaders: use 'tar' instead of 'cpio' for copying fil=
es")
commit d2b239099cf0 ("docs: changes: update Sphinx minimal version to 3.4.3=
")
commit 5e25b972a22b ("docs: changes: update Python minimal version")
commit 118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30")
commit 28d51df0dbaa ("Documentation: update binutils-2.30 version reference=
")
commit fc6edeea53f4 ("docs: Remove reiserfsprogs from dependencies.")
commit bc20c56e98e0 ("docs: changes: better document Python needs")
commit 20c098928356 ("kbuild: Bump minimum version of LLVM for building the=
 kernel to 15.0.0")
commit 903922cfa0e6 ("lib/Kconfig.debug: Set the minimum required pahole ve=
rsion to v1.22")
commit 8913632998fc ("Documentation: Fix typos and grammatical errors")
commit c99fcb58501e ("docs: Fix an erroneous reference to sphinx.rst")
commit d8a224f519c6 ("docs: changes/ver_linux: fix entries and add several =
tools")
commit ece7e57afd51 ("docs: changes.rst and ver_linux: sort the lists")
commit f32fb9c58a5b ("rust: bump Rust minimum supported version to 1.85.0 (=
Debian Trixie)")
commit c3a00a3f31ff ("rust: bump `bindgen` minimum supported version to 0.7=
1.1 (Debian Trixie)")
commit ce3267a39a92 ("kbuild: Bump minimum version of LLVM for building the=
 kernel to 17.0.1")
commit 2c1ccd9a1d78 ("docs: changes.rst: restore pahole 1.26 minimum (regre=
ssed by sort)")
commit 3f997cbf676b ("docs: process: submitting-patches: split canonical pa=
tch format section")
commit 6356f18f09dc ("Align git commit ID abbreviation guidelines and check=
s")
commit cd9123eeb224 ("docs: submitting-patches: clarify Acked-by and introd=
uce "# Suffix"")
commit 25fb101385f7 ("docs: submitting-patches: clarify difference between =
Acked-by and Reviewed-by")
commit 08c035da54a3 ("docs: submitting-patches: clarify that signers may us=
e their discretion on tags")
commit 95767a592dc9 ("docs: submitting-patches: document the format for aff=
iliation")
commit dc896f853e1a ("docs: submitting-patches: adjust Fixes definition sli=
ghtly")
commit 22014a230093 ("Documentation/process: submitting-patches: fix typo i=
n "were do"")
commit e36a7b1e1734 ("docs: submitting-patches: Clarify that removal of Ack=
s needs explanation too")
commit 8a12e3fbf2c3 ("docs: submitting-patches: suggest adding previous ver=
sion links")
commit 6252e5c1c20e ("docs: add an Assisted-by mention to submitting-patche=
s.rst")
commit 48c3876a6a6f ("docs: submitting-patches: Clarify that "reviewer" is =
a person")
commit 83f71fbc66fb ("docs: submitting-patches: Fix section structure aroun=
d DCO")

Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
---
 .../translations/it_IT/process/1.Intro.rst    |  14 +-
 .../translations/it_IT/process/2.Process.rst  |  59 +++--
 .../translations/it_IT/process/5.Posting.rst  |  34 ++-
 .../it_IT/process/7.AdvancedTopics.rst        |   2 +-
 .../it_IT/process/adding-syscalls.rst         |  94 ++++++++
 .../it_IT/process/coding-style.rst            |  33 +--
 .../translations/it_IT/process/deprecated.rst |  85 +++++--
 .../it_IT/process/email-clients.rst           |   9 +-
 .../translations/it_IT/process/index.rst      |   8 +
 .../it_IT/process/license-rules.rst           |  16 +-
 .../it_IT/process/maintainer-handbooks.rst    |  15 +-
 .../it_IT/process/maintainer-pgp-guide.rst    | 172 +++++++-------
 .../it_IT/process/maintainers.rst             |   2 +
 .../it_IT/process/programming-language.rst    |   6 +-
 .../it_IT/process/submit-checklist.rst        |   9 +-
 .../it_IT/process/submitting-patches.rst      | 214 ++++++++++++------
 16 files changed, 523 insertions(+), 249 deletions(-)

diff --git a/Documentation/translations/it_IT/process/1.Intro.rst b/Documen=
tation/translations/it_IT/process/1.Intro.rst
index c1be6dc398a7..03b61ccf5882 100644
--- a/Documentation/translations/it_IT/process/1.Intro.rst
+++ b/Documentation/translations/it_IT/process/1.Intro.rst
@@ -279,13 +279,13 @@ una versione 3 della licenza GPL nel prossimo futuro.
=20
 =C3=88 imperativo che tutto il codice che contribuisce al kernel sia legit=
timamente
 software libero.  Per questa ragione, un codice proveniente da un contribu=
tore
-anonimo (o sotto pseudonimo) non verr=C3=A0 accettato.  =C3=88 richiesto a=
 tutti i
-contributori di firmare il proprio codice, attestando cos=C3=AC che quest'=
ultimo
-pu=C3=B2 essere distribuito insieme al kernel sotto la licenza GPL.  Il co=
dice che
-non =C3=A8 stato licenziato come software libero dal proprio creatore, o c=
he
-potrebbe creare problemi di copyright per il kernel (come il codice deriva=
nte
-da processi di ingegneria inversa senza le opportune tutele), non pu=C3=
=B2 essere
-diffuso.
+la cui identit=C3=A0 non =C3=A8 nota, o da un contributore anonimo, non ve=
rr=C3=A0 accettato.
+=C3=88 richiesto a tutti i contributori di firmare il proprio codice, atte=
stando
+cos=C3=AC che quest'ultimo pu=C3=B2 essere distribuito insieme al kernel s=
otto la licenza
+GPL.  Il codice che non =C3=A8 stato licenziato come software libero dal p=
roprio
+creatore, o che potrebbe creare problemi di copyright per il kernel (come =
il
+codice derivante da processi di ingegneria inversa senza le opportune tute=
le),
+non pu=C3=B2 essere diffuso.
=20
 Domande relative a questioni legate al copyright sono frequenti nelle list=
e
 di discussione dedicate allo sviluppo di Linux.  Tali quesiti, normalmente=
,
diff --git a/Documentation/translations/it_IT/process/2.Process.rst b/Docum=
entation/translations/it_IT/process/2.Process.rst
index 6262c3908665..5da70c6f39a7 100644
--- a/Documentation/translations/it_IT/process/2.Process.rst
+++ b/Documentation/translations/it_IT/process/2.Process.rst
@@ -18,25 +18,22 @@ processo si svolge per poter esserne parte attiva.
 Il quadro d'insieme
 -------------------
=20
-Gli sviluppatori kernel utilizzano un calendario di rilascio generico, dov=
e
-ogni due o tre mesi viene effettuata un rilascio importante del kernel.
-I rilasci pi=C3=B9 recenti sono stati:
-
-=09=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-=095.0     3 marzo, 2019
-=095.1     5 maggio, 2019
-=095.2     7 luglio, 2019
-=095.3     15 settembre, 2019
-=095.4     24 novembre, 2019
-=095.5     6 gennaio, 2020
-=09=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Ciascun rilascio 5.x =C3=A8 un importante rilascio del kernel con nuove
-funzionalit=C3=A0, modifiche interne dell'API, e molto altro.  Un tipico
-rilascio contiene quasi 13,000 gruppi di modifiche con ulteriori
-modifiche a parecchie migliaia di linee di codice.  La 5.x. =C3=A8 pertant=
o la
-linea di confine nello sviluppo del kernel Linux; il kernel utilizza un si=
stema
-di sviluppo continuo che integra costantemente nuove importanti modifiche.
+Il kernel Linux utilizza un modello di sviluppo a rilascio continuo,
+vagamente basato sul tempo.  Un nuovo rilascio principale del kernel (che
+chiameremo, come esempio, 9.x) [1]_ avviene ogni due o tre mesi, e porta
+con s=C3=A9 nuove funzionalit=C3=A0, modifiche interne alle API e molto al=
tro. Un
+tipico rilascio pu=C3=B2 contenere circa 13.000 gruppi di modifiche che to=
ccano
+diverse centinaia di migliaia di righe di codice. I rilasci pi=C3=B9 recen=
ti,
+assieme alle rispettive date, si possono trovare su `Wikipedia
+<https://en.wikipedia.org/wiki/Linux_kernel_version_history>`_.
+
+.. [1] A rigor di termini, il kernel Linux non utilizza uno schema di
+       numerazione semantica delle versioni (semantic versioning), bens=
=C3=AC
+       la coppia 9.x identifica la versione del rilascio principale come
+       numero intero. Per ogni rilascio, x viene incrementato, mentre
+       9 viene incrementato solo quando x =C3=A8 ritenuto sufficientemente
+       grande (per esempio, Linux 5.0 =C3=A8 stato rilasciato dopo Linux
+       4.20).
=20
 Viene seguita una disciplina abbastanza lineare per l'inclusione delle
 patch di ogni rilascio. All'inizio di ogni ciclo di sviluppo, la
@@ -55,8 +52,8 @@ verr=C3=A0 descritto dettagliatamente pi=C3=B9 avanti).
 La finestra di inclusione resta attiva approssimativamente per due settima=
ne.
 Al termine di questo periodo, Linus Torvald dichiarer=C3=A0 che la finestr=
a =C3=A8
 chiusa e rilascer=C3=A0 il primo degli "rc" del kernel.
-Per il kernel che =C3=A8 destinato ad essere 5.6, per esempio, il rilascio
-che emerge al termine della finestra d'inclusione si chiamer=C3=A0 5.6-rc1=
.
+Per il kernel che =C3=A8 destinato ad essere 9.x, per esempio, il rilascio
+che emerge al termine della finestra d'inclusione si chiamer=C3=A0 9.x-rc1=
.
 Questo rilascio indica che il momento di aggiungere nuovi componenti =
=C3=A8
 passato, e che =C3=A8 iniziato il periodo di stabilizzazione del prossimo =
kernel.
=20
@@ -109,17 +106,19 @@ tipo di perfezione difficilmente viene raggiunta; esi=
stono troppe variabili
 in un progetto di questa portata.  Arriva un punto dove ritardare il rilas=
cio
 finale peggiora la situazione; la quantit=C3=A0 di modifiche in attesa del=
la
 prossima finestra di inclusione crescer=C3=A0 enormemente, creando ancor p=
i=C3=B9
-regressioni al giro successivo.  Quindi molti kernel 5.x escono con una
+regressioni al giro successivo.  Quindi molti kernel escono con una
 manciata di regressioni delle quali, si spera, nessuna =C3=A8 grave.
=20
 Una volta che un rilascio stabile =C3=A8 fatto, il suo costante mantenimen=
to =C3=A8
-affidato al "squadra stabilit=C3=A0", attualmente composta da Greg Kroah-H=
artman.
-Questa squadra rilascia occasionalmente degli aggiornamenti relativi al
-rilascio stabile usando la numerazione 5.x.y.  Per essere presa in
-considerazione per un rilascio d'aggiornamento, una modifica deve:
-(1) correggere un baco importante (2) essere gi=C3=A0 inserita nel ramo pr=
incipale
-per il prossimo sviluppo del kernel.  Solitamente, passato il loro rilasci=
o
-iniziale, i kernel ricevono aggiornamenti per pi=C3=B9 di un ciclo di svil=
uppo.
+affidato alla "squadra stabilit=C3=A0", attualmente composta da Greg Kroah=
-Hartman
+e Sasha Levin. Questa squadra rilascia occasionalmente degli aggiornamenti
+relativi al rilascio stabile usando la numerazione 9.x.y.
+
+Per essere presa in considerazione per un rilascio d'aggiornamento, una
+modifica deve: (1) correggere un baco importante (2) essere gi=C3=A0 inser=
ita nel
+ramo principale per il prossimo sviluppo del kernel.  Solitamente, passato=
 il
+loro rilascio iniziale, i kernel ricevono aggiornamenti per pi=C3=B9 di un=
 ciclo di
+sviluppo.
 Quindi, per esempio, la storia del kernel 5.2 appare cos=C3=AC (anno 2019)=
:
=20
 =09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -314,7 +313,7 @@ the moment) all'indirizzo:
 frustrante; ci sono buone probabilit=C3=A0 che non compili nemmeno.
=20
 I sorgenti principali per il prossimo ciclo d'integrazione delle patch
-=C3=A8 linux-next, gestito da Stephen Rothwell.  I sorgenti linux-next son=
o, per
+=C3=A8 linux-next, gestito da Mark Brown.  I sorgenti linux-next sono, per
 definizione, un'istantanea di come dovr=C3=A0 apparire il ramo principale =
dopo che
 la prossima finestra di inclusione si chiuder=C3=A0.  I linux-next sono an=
nunciati
 sulla lista di discussione linux-kernel e linux-next nel momento in cui
diff --git a/Documentation/translations/it_IT/process/5.Posting.rst b/Docum=
entation/translations/it_IT/process/5.Posting.rst
index 3b9b4db6fb9a..c4cf311e09b9 100644
--- a/Documentation/translations/it_IT/process/5.Posting.rst
+++ b/Documentation/translations/it_IT/process/5.Posting.rst
@@ -48,7 +48,14 @@ l'invio delle patch alla comunit=C3=A0 di sviluppo.  Que=
ste cose includono:
  - Verificare il codice fino al massimo che vi =C3=A8 consentito. Usate gl=
i
    strumenti di debug del kernel, assicuratevi che il kernel compili con
    tutte le pi=C3=B9 ragionevoli combinazioni d'opzioni, usate cross-compi=
latori
-   per compilare il codice per differenti architetture, eccetera.
+   per compilare il codice per differenti architetture, eccetera. Aggiunge=
te
+   dei test, preferibilmente usando un framework di test gi=C3=A0 esistent=
e come
+   KUnit, e includeteli come un elemento separato della vostra serie (per
+   maggiori informazioni sulle serie di patch, vedere la sezione successiv=
a).
+   Da notare che questo pu=C3=B2 essere obbligatorio quando si toccano alc=
uni
+   sottosistemi. Per esempio, le funzioni di libreria (che risiedono in
+   lib/) sono usate estensivamente quasi ovunque, e ci si aspetta che sian=
o
+   testate adeguatamente.
=20
  - Assicuratevi che il vostro codice sia conforme alla linee guida del
    kernel sullo stile del codice.
@@ -224,10 +231,9 @@ implementate dalla patch::
=20
        Link: https://example.com/somewhere.html  optional-other-stuff
=20
-Alcuni manutentori aggiungono quest'etichetta alla patch per fare riferime=
nto
-alla pi=C3=B9 recente discussione pubblica. A volte questo =C3=A8 fatto au=
tomaticamente da
-alcuni strumenti come b4 or un *hook* git come quello descritto qui
-'Documentation/translations/it_IT/maintainer/configure-git.rst'
+Come indicato dal "Chief Penguin" (soprannome di Linus Torvalds), un'etich=
etta
+Link: dovrebbe essere aggiunta ad un commit solo se conduce a informazioni
+utili che non si trovano gi=C3=A0 nel commit stesso.
=20
=20
 Se il collegamento indirizza verso un rapporto su un baco risolto dalla pa=
tch,
@@ -284,13 +290,23 @@ Le etichette in uso pi=C3=B9 comuni sono:
    Se esiste un rapporto disponibile sul web, allora
    L'etichetta dovrebbe essere seguita da un collegamento al suddetto rapp=
orto.
=20
+ - Suggested-by: indica che l'idea della patch =C3=A8 stata suggerita dall=
a persona
+   menzionata, ed assicura che le venga dato credito per l'idea.  Questo, =
si
+   spera, la inviter=C3=A0 ad aiutarci ancora in futuro.
+
  - Cc: la persona menzionata ha ricevuto una copia della patch ed ha avuto
    l'opportunit=C3=A0 di commentarla.
=20
-State attenti ad aggiungere queste etichette alla vostra patch: solo "Cc:"=
 pu=C3=B2
-essere aggiunta senza il permesso esplicito della persona menzionata. Il p=
i=C3=B9
-delle volte anche Reported-by: va bene, ma =C3=A8 sempre meglio chiedere s=
pecialmente
-se il baco =C3=A8 stato riportato in una comunicazione privata.
+State attenti ad aggiungere le suddette etichette alla vostra patch: tutte=
,
+tranne Cc:, Reported-by: e Suggested-by:, richiedono il permesso esplicito
+della persona menzionata.  Per queste tre =C3=A8 sufficiente un permesso i=
mplicito,
+se la persona ha contribuito al kernel Linux usando quel nome e quell'indi=
rizzo
+email secondo gli archivi di lore o la cronologia dei commit -- e, nel cas=
o di
+Reported-by: e Suggested-by:, se la segnalazione o il suggerimento sono
+avvenuti pubblicamente.  Da notare che bugzilla.kernel.org =C3=A8, in ques=
to senso,
+un luogo pubblico, ma gli indirizzi email usati l=C3=AC sono privati; quin=
di non
+esponeteli nelle etichette, a meno che la persona non li abbia gi=C3=A0 us=
ati in
+contributi precedenti.
=20
 Inviare la modifica
 -------------------
diff --git a/Documentation/translations/it_IT/process/7.AdvancedTopics.rst =
b/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
index b3d8b62f3b57..592de7de4d99 100644
--- a/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
@@ -60,7 +60,7 @@ Quando sarete in grado di creare rami git che siano guard=
abili da altri,
 vi servir=C3=A0, ovviamente, un server dal quale sia possibile attingere l=
e vostre
 modifiche.  Se avete un server accessibile da Internet, configurarlo per
 eseguire git-daemon =C3=A8 relativamente semplice .  Altrimenti, iniziano =
a
-svilupparsi piattaforme che offrono spazi pubblici, e gratuiti (Github,
+svilupparsi piattaforme che offrono spazi pubblici, e gratuiti (GitHub,
 per esempio).  Gli sviluppatori permanenti possono ottenere un account
 su kernel.org, ma non =C3=A8 proprio facile da ottenere; per maggiori info=
rmazioni
 consultate la pagina web https://kernel.org/faq/.
diff --git a/Documentation/translations/it_IT/process/adding-syscalls.rst b=
/Documentation/translations/it_IT/process/adding-syscalls.rst
index c4ed6dbf5f05..a21c9af1e2cb 100644
--- a/Documentation/translations/it_IT/process/adding-syscalls.rst
+++ b/Documentation/translations/it_IT/process/adding-syscalls.rst
@@ -278,6 +278,56 @@ Per riassumere, vi serve un *commit* che includa:
  - *stub* di ripiego in ``kernel/sys_ni.c``
=20
=20
+.. _it_syscall_generic_6_11:
+
+Dalla versione 6.11
+~~~~~~~~~~~~~~~~~~~~
+
+A partire dalla versione 6.11 del kernel, l'implementazione generica delle
+chiamate di sistema per le seguenti architetture non richiede pi=C3=B9 mod=
ifiche
+a ``include/uapi/asm-generic/unistd.h``:
+
+ - arc
+ - arm64
+ - csky
+ - hexagon
+ - loongarch
+ - nios2
+ - openrisc
+ - riscv
+
+Al suo posto, dovete aggiornare ``scripts/syscall.tbl`` e, se necessario,
+modificare ``arch/*/kernel/Makefile.syscalls``.
+
+Dato che ``scripts/syscall.tbl`` funge da tabella comune delle chiamate di
+sistema condivisa fra pi=C3=B9 architetture, in questa tabella =C3=A8 rich=
iesto un
+nuovo elemento::
+
+    468   common   xyzzy     sys_xyzzy
+
+Da notare che l'aggiunta di un elemento a ``scripts/syscall.tbl`` con l'AB=
I
+"common" influisce anche su tutte le architetture che condividono questa
+tabella. Per modifiche pi=C3=B9 limitate o specifiche di un'architettura,
+considerate l'uso di un'ABI specifica per l'architettura, o la definizione
+di una nuova.
+
+Se viene introdotta una nuova ABI, per esempio ``xyz``, andranno fatti i
+corrispondenti aggiornamenti anche in ``arch/*/kernel/Makefile.syscalls``:=
:
+
+    syscall_abis_{32,64} +=3D xyz (...)
+
+Per riassumere, vi serve un *commit* che includa:
+
+ - un'opzione ``CONFIG`` per la nuova funzione, normalmente in
+   ``init/Kconfig``
+ - ``SYSCALL_DEFINEn(xyzzy, ...)`` per il punto d'accesso
+ - il corrispondente prototipo in ``include/linux/syscalls.h``
+ - un nuovo elemento in ``scripts/syscall.tbl``
+ - (se necessario) aggiornamenti al Makefile in
+   ``arch/*/kernel/Makefile.syscalls``
+ - *stub* di ripiego in ``kernel/sys_ni.c``
+
+
 Implementazione delle chiamate di sistema x86
 ---------------------------------------------
=20
@@ -396,6 +446,47 @@ Riassumendo, vi serve:
  - una voce ``__SC_COMP``, e non ``__SYSCALL``, in
    ``include/uapi/asm-generic/unistd.h``
=20
+
+Dalla versione 6.11
+~~~~~~~~~~~~~~~~~~~~
+
+Questo si applica a tutte le architetture elencate in
+:ref:`Dalla versione 6.11<it_syscall_generic_6_11>` sotto "Implementazione
+di chiamate di sistema generiche", eccetto arm64. Vedere
+:ref:`Chiamate di sistema compatibili (arm64)<it_compat_arm64>` per maggio=
ri
+informazioni.
+
+Dovete estendere la voce in ``scripts/syscall.tbl`` con una colonna
+aggiuntiva per indicare che un programma in spazio utente a 32-bit in
+esecuzione su un kernel a 64-bit deve invocare il punto d'accesso
+*compatibile*::
+
+    468   common     xyzzy     sys_xyzzy    compat_sys_xyzzy
+
+Riassumendo, vi serve:
+
+ - un ``COMPAT_SYSCALL_DEFINEn(xyzzy, ...)`` per il punto d'accesso
+   *compatibile*
+ - il corrispondente prototipo in ``include/linux/compat.h``
+ - la modifica della voce in ``scripts/syscall.tbl`` per includere una
+   colonna "compat" aggiuntiva
+ - (se necessario) una struttura di mappatura a 32-bit in
+   ``include/linux/compat.h``
+
+
+.. _it_compat_arm64:
+
+Chiamate di sistema compatibili (arm64)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Su arm64 esiste una tabella delle chiamate di sistema dedicata per le
+chiamate di sistema compatibili rivolte allo spazio utente a 32-bit
+(AArch32): ``arch/arm64/tools/syscall_32.tbl``. Dovete aggiungere una riga
+aggiuntiva a questa tabella specificando il punto d'accesso *compatibile*:=
:
+
+    468   common     xyzzy     sys_xyzzy    compat_sys_xyzzy
+
+
 Compatibilit=C3=A0 delle chiamate di sistema (x86)
 ---------------------------------------------
=20
@@ -641,3 +732,6 @@ Riferimenti e fonti
  - Raccomandazioni da Linus Torvalds che le chiamate di sistema x32 dovreb=
bero
    favorire la compatibilit=C3=A0 con le versioni a 64-bit piuttosto che q=
uelle a 32-bit:
    https://lore.kernel.org/r/CA+55aFxfmwfB7jbbrXxa=3DK7VBYPfAvmu3XOkGrLbB1=
UFjX1+Ew@mail.gmail.com
+ - Serie di patch che revisiona l'infrastruttura della tabella delle chiam=
ate
+   di sistema per usare scripts/syscall.tbl su pi=C3=B9 architetture:
+   https://lore.kernel.org/lkml/20240704143611.2979589-1-arnd@kernel.org
diff --git a/Documentation/translations/it_IT/process/coding-style.rst b/Do=
cumentation/translations/it_IT/process/coding-style.rst
index 2a499412a2e3..b0cf138249c2 100644
--- a/Documentation/translations/it_IT/process/coding-style.rst
+++ b/Documentation/translations/it_IT/process/coding-style.rst
@@ -604,8 +604,11 @@ il PERCH=C3=89.
=20
 Per favore, quando commentate una funzione dell'API del kernel usate il
 formato kernel-doc.  Per maggiori dettagli, leggete i file in
-:ref::ref:`Documentation/translations/it_IT/doc-guide/ <it_doc_guide>` e i=
n
-``script/kernel-doc``.
+:ref:`Documentation/translations/it_IT/doc-guide/ <it_doc_guide>` e in
+``tools/docs/kernel-doc``. Da notare che il pericolo di commentare troppo
+si applica anche ai commenti kernel-doc. Non aggiungete kernel-doc
+superfluo che si limita a ripetere quanto gi=C3=A0 ovvio dalla firma della
+funzione.
=20
 Lo stile preferito per i commenti pi=C3=B9 lunghi (multi-riga) =C3=A8:
=20
@@ -935,7 +938,7 @@ racchiusa in #ifdef, potete usare printk(KERN_DEBUG ...=
).
 ---------------------
=20
 Il kernel fornisce i seguenti assegnatori ad uso generico:
-kmalloc(), kzalloc(), kmalloc_array(), kcalloc(), vmalloc(), e vzalloc().
+kmalloc(), kzalloc(), kmalloc_objs(), kzalloc_objs(), vmalloc(), e vzalloc=
().
 Per maggiori informazioni, consultate la documentazione dell'API:
 :ref:`Documentation/translations/it_IT/core-api/memory-allocation.rst <it_=
memory_allocation>`
=20
@@ -957,13 +960,13 @@ Il modo preferito per assegnare un vettore =C3=A8 il =
seguente:
=20
 .. code-block:: c
=20
-=09p =3D kmalloc_array(n, sizeof(...), ...);
+=09p =3D kmalloc_objs(*p, n, ...);
=20
 Il modo preferito per assegnare un vettore a zero =C3=A8 il seguente:
=20
 .. code-block:: c
=20
-=09p =3D kcalloc(n, sizeof(...), ...);
+=09p =3D kzalloc_objs(*p, n, ...);
=20
 Entrambe verificano la condizione di overflow per la dimensione
 d'assegnamento n * sizeof(...), se accade ritorneranno NULL.
@@ -1068,15 +1071,17 @@ pu=C3=B2 migliorare la leggibilit=C3=A0.
 18) Non reinventate le macro del kernel
 ---------------------------------------
=20
-Il file di intestazione include/linux/kernel.h contiene un certo numero
-di macro che dovreste usare piuttosto che implementarne una qualche varian=
te.
-Per esempio, se dovete calcolare la lunghezza di un vettore, sfruttate la
-macro:
+Ci sono molti file d'intestazione in include/linux/ che contengono un cert=
o
+numero di macro che dovreste usare piuttosto che implementarne una qualche
+variante. Per esempio, se dovete calcolare la lunghezza di un vettore,
+sfruttate la macro:
=20
 .. code-block:: c
=20
 =09#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
=20
+che =C3=A8 definita in array_size.h.
+
 Analogamente, se dovete calcolare la dimensione di un qualche campo di una
 struttura, usate
=20
@@ -1084,10 +1089,12 @@ struttura, usate
=20
 =09#define sizeof_field(t, f) (sizeof(((t*)0)->f))
=20
-Ci sono anche le macro min() e max() che, se vi serve, effettuano un contr=
ollo
-rigido sui tipi.  Sentitevi liberi di leggere attentamente questo file
-d'intestazione per scoprire cos'altro =C3=A8 stato definito che non dovres=
te
-reinventare nel vostro codice.
+che =C3=A8 definita in stddef.h.
+
+Ci sono anche le macro min() e max(), definite in minmax.h, che, se vi
+serve, effettuano un controllo rigido sui tipi. Sentitevi liberi di
+leggere attentamente questi file d'intestazione per scoprire cos'altro =
=C3=A8
+stato definito che non dovreste reinventare nel vostro codice.
=20
 19) Linee di configurazione degli editor e altre schifezze
 -----------------------------------------------------------
diff --git a/Documentation/translations/it_IT/process/deprecated.rst b/Docu=
mentation/translations/it_IT/process/deprecated.rst
index d4ab76e9be49..64b7bf40057f 100644
--- a/Documentation/translations/it_IT/process/deprecated.rst
+++ b/Documentation/translations/it_IT/process/deprecated.rst
@@ -141,26 +141,37 @@ ritorno di strcpy().  La funzione strscpy() non ritor=
na un puntatore
 alla destinazione, ma un contatore dei byte non NUL copiati (oppure
 un errno negativo se la stringa =C3=A8 stata troncata).
=20
-strncpy() su stringe terminate con NUL
---------------------------------------
-L'utilizzo di strncpy() non fornisce alcuna garanzia sul fatto che
-il buffer di destinazione verr=C3=A0 terminato con il carattere NUL. Quest=
o
-potrebbe portare a diversi overflow di lettura o altri malfunzionamenti
-causati, appunto, dalla mancanza del terminatore. Questa estende la
-terminazione nel buffer di destinazione quando la stringa d'origine =C3=
=A8 pi=C3=B9
-corta; questo potrebbe portare ad una penalizzazione delle prestazioni per
-chi usa solo stringe terminate. La versione sicura da usare =C3=A8
-strscpy(), tuttavia va prestata attenzione a tutti quei casi dove
-viene usato il valore di ritorno di strncpy().  La funzione strscpy()
-non ritorna un puntatore alla destinazione, ma un contatore dei byte
-non NUL copiati (oppure un errno negativo se la stringa =C3=A8 stata
-troncata). Tutti i casi che necessitano di estendere la
-terminazione con NUL dovrebbero usare strscpy_pad().
-
-Se il chiamate no usa stringhe terminate con NUL, allore strncpy()
-pu=C3=B2 continuare ad essere usata, ma i buffer di destinazione devono es=
sere
-marchiati con l'attributo `__nonstring <https://gcc.gnu.org/onlinedocs/gcc=
/Common-Variable-Attributes.html>`_
-per evitare avvisi durante la compilazione.
+strncpy()
+---------
+La funzione strncpy() =C3=A8 stata rimossa dal kernel. Tutti i chiamanti c=
he
+la usavano sono stati migrati verso alternative pi=C3=B9 sicure.
+
+strncpy() non garantiva che il buffer di destinazione venisse terminato
+con il carattere NUL, causando overflow di lettura lineari e altri
+malfunzionamenti. Inoltre estendeva incondizionatamente la terminazione
+NUL nel buffer di destinazione, il che era una penalizzazione delle
+prestazioni superflua per i chiamanti che usavano solo stringhe
+terminate con NUL. A causa dei suoi vari comportamenti, si trattava di
+un'API ambigua per determinare quale fosse la reale intenzione
+dell'autore per la copia.
+
+I sostituti di strncpy() sono:
+
+- strscpy(), quando la destinazione deve essere terminata con NUL.
+- strscpy_pad(), quando la destinazione deve essere terminata con NUL
+  ed estesa con zeri (per esempio, strutture che attraversano i confini
+  dei privilegi).
+- memtostr(), per destinazioni terminate con NUL a partire da sorgenti
+  a larghezza fissa non terminate con NUL (con l'attributo
+  `__nonstring` sulla sorgente).
+- memtostr_pad(), per lo stesso caso, ma con estensione tramite zeri.
+- strtomem(), per destinazioni a larghezza fissa non terminate con NUL,
+  con l'attributo `__nonstring` sulla destinazione.
+- strtomem_pad(), per destinazioni non terminate con NUL che
+  necessitano anche di estensione tramite zeri.
+- memcpy_and_pad(), per copie limitate da sorgenti potenzialmente non
+  terminate, quando la dimensione della destinazione =C3=A8 un valore
+  determinato a runtime.
=20
 strlcpy()
 ---------
@@ -407,3 +418,37 @@ La macro di supporto dev'essere usata::
             DECLARE_FLEX_ARRAY(struct type2, two);
         };
     };
+
+Assegnazioni kmalloc con codice esplicito per oggetti struct
+--------------------------------------------------------------
+Eseguire assegnazioni con codice esplicito per le allocazioni della
+famiglia kmalloc() impedisce al kernel (e al compilatore) di poter
+esaminare il tipo della variabile a cui viene fatta l'assegnazione, il
+che limita ogni possibile introspezione utile per l'allineamento, per
+l'overflow, o per un ulteriore irrobustimento. Le macro della famiglia
+kmalloc_obj() forniscono questa introspezione, e possono essere usate
+per i pi=C3=B9 comuni schemi di codice per l'allocazione di un singolo
+oggetto, di un vettore di oggetti, o di un oggetto con un array
+flessibile. Per esempio, queste assegnazioni con codice esplicito::
+
+=09ptr =3D kmalloc(sizeof(*ptr), gfp);
+=09ptr =3D kzalloc(sizeof(*ptr), gfp);
+=09ptr =3D kmalloc_array(count, sizeof(*ptr), gfp);
+=09ptr =3D kcalloc(count, sizeof(*ptr), gfp);
+=09ptr =3D kmalloc(struct_size(ptr, flex_member, count), gfp);
+=09ptr =3D kmalloc(sizeof(struct foo), gfp);
+
+diventano, rispettivamente::
+
+=09ptr =3D kmalloc_obj(*ptr [, gfp] );
+=09ptr =3D kzalloc_obj(*ptr [, gfp] );
+=09ptr =3D kmalloc_objs(*ptr, count [, gfp] );
+=09ptr =3D kzalloc_objs(*ptr, count [, gfp] );
+=09ptr =3D kmalloc_flex(*ptr, flex_member, count [, gfp] );
+=09__auto_type ptr =3D kmalloc_obj(struct foo [, gfp] );
+
+L'argomento gfp =C3=A8 opzionale, e il suo valore predefinito =C3=A8 GFP_K=
ERNEL.
+Se `ptr->flex_member` =C3=A8 annotato con __counted_by(), l'allocazione
+fallir=C3=A0 automaticamente se `count` =C3=A8 pi=C3=B9 grande del valore =
massimo
+rappresentabile che pu=C3=B2 essere memorizzato nel membro contatore
+associato a `flex_member`.
diff --git a/Documentation/translations/it_IT/process/email-clients.rst b/D=
ocumentation/translations/it_IT/process/email-clients.rst
index 9f8fe8abab4a..677b6715b8b1 100644
--- a/Documentation/translations/it_IT/process/email-clients.rst
+++ b/Documentation/translations/it_IT/process/email-clients.rst
@@ -335,7 +335,14 @@ Per rendere l'editor interno un po' pi=C3=B9 sensato, =
fate cos=C3=AC:
=20
   - impostate ``mailnews.send_plaintext_flowed`` a ``false``
=20
-  - impostate ``mailnews.wraplength`` da ``72`` a ``0``
+  - impostate ``mailnews.wraplength`` da ``72`` a ``0`` **oppure** install=
ate
+    l'estensione "Toggle Line Wrap"
+
+    https://github.com/jan-kiszka/togglelinewrap
+
+    https://addons.thunderbird.net/thunderbird/addon/toggle-line-wrap
+
+    per controllare questo registro al volo.
=20
 - Non scrivete messaggi HTML! Andate sulla finestra principale ed aprite l=
a
   schermata :menuselection:`Menu principale-->Impostazioni account-->nome@=
unserver.ovunque-->Composizioni e indirizzi`.
diff --git a/Documentation/translations/it_IT/process/index.rst b/Documenta=
tion/translations/it_IT/process/index.rst
index 5a5214f5fd72..dd88c1140cf2 100644
--- a/Documentation/translations/it_IT/process/index.rst
+++ b/Documentation/translations/it_IT/process/index.rst
@@ -63,6 +63,7 @@ della comunit=C3=A0 del kernel (e oltre).
 .. toctree::
    :maxdepth: 1
=20
+   license-rules
    code-of-conduct
    kernel-enforcement-statement
    kernel-driver-statement
@@ -78,6 +79,11 @@ con riguardo. I documenti che seguono descrivono le nost=
re politiche riguardo al
 trattamento di alcune classi particolari di bachi: le regressioni e i prob=
lemi
 di sicurezza.
=20
+.. toctree::
+   :maxdepth: 1
+
+   security-bugs
+
 Informazioni per i manutentori
 ------------------------------
=20
@@ -86,6 +92,7 @@ Come trovare le persone che accetteranno le vostre modifi=
che.
 .. toctree::
    :maxdepth: 1
=20
+   maintainer-handbooks
    maintainers
=20
 Altri documenti
@@ -98,6 +105,7 @@ degli sviluppatori:
    :maxdepth: 1
=20
    kernel-docs
+   deprecated
=20
 .. only::  subproject and html
=20
diff --git a/Documentation/translations/it_IT/process/license-rules.rst b/D=
ocumentation/translations/it_IT/process/license-rules.rst
index 4cd87a3a7bf9..50e49146d66c 100644
--- a/Documentation/translations/it_IT/process/license-rules.rst
+++ b/Documentation/translations/it_IT/process/license-rules.rst
@@ -75,7 +75,10 @@ Sintassi degli identificatori di licenza
    possibile di un file che possa contenere commenti.  Per la maggior part=
e
    dei file questa =C3=A8 la prima riga, fanno eccezione gli script che ri=
chiedono
    come prima riga '#!PATH_TO_INTERPRETER'.  Per questi script l'identific=
ativo
-   SPDX finisce nella seconda riga.
+   di licenza SPDX finisce nella seconda riga.
+
+   Alla riga dell'identificativo di licenza possono seguire, se lo si
+   desidera, una o pi=C3=B9 righe SPDX-FileCopyrightText.
=20
 |
=20
@@ -486,10 +489,13 @@ _`MODULE_LICENSE`
 =09=09=09=09  file sorgenti.
=20
     "Proprietary"=09=09  Questo modulo =C3=A8 rilasciato con licenza
-=09=09=09=09  proprietaria. Questa stringa =C3=A8 solo per i
-=09=09=09=09  moduli proprietari di terze parti e non pu=C3=B2
-=09=09=09=09  essere usata per quelli che risiedono nei
-=09=09=09=09  sorgenti del kernel. I moduli etichettati in
+=09=09=09=09  proprietaria. "Proprietary" va inteso
+=09=09=09=09  unicamente come "la licenza non =C3=A8 compatibile
+=09=09=09=09  con la GPLv2". Questa stringa =C3=A8 solo per i
+=09=09=09=09  moduli di terze parti non compatibili con la
+=09=09=09=09  GPLv2 e non pu=C3=B2 essere usata per quelli che
+=09=09=09=09  risiedono nei sorgenti del kernel. I moduli
+=09=09=09=09  etichettati in
 =09=09=09=09  questo modo stanno contaminando il kernel e
 =09=09=09=09  gli viene assegnato un flag 'P'; quando
 =09=09=09=09  vengono caricati, il caricatore di moduli del
diff --git a/Documentation/translations/it_IT/process/maintainer-handbooks.=
rst b/Documentation/translations/it_IT/process/maintainer-handbooks.rst
index d840145bcceb..cc901809bbfa 100644
--- a/Documentation/translations/it_IT/process/maintainer-handbooks.rst
+++ b/Documentation/translations/it_IT/process/maintainer-handbooks.rst
@@ -5,8 +5,6 @@
 :Original: Documentation/process/maintainer-handbooks.rst
 :Translator: Federico Vaga <federico.vaga@vaga.pv.it>
=20
-.. _it_maintainer_handbooks_main:
-
 Note sul processo di sviluppo dei sottosistemi e dei sorgenti dei manutent=
ori
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=20
@@ -15,10 +13,13 @@ sviluppo dedicate ai sottosistemi che vanno ad integrar=
e quelle pi=C3=B9 generali
 descritte in :ref:`Documentation/translations/it_IT/process
 <it_development_process_main>`.
=20
-Indice:
+Per gli sviluppatori, qui di seguito sono elencate tutte le guide specific=
he
+per i sottosistemi conosciute. Se il sottosistema al quale state contribue=
ndo
+non ha una guida elencata qui, =C3=A8 lecito chiedere chiarimenti sulle do=
mande
+sollevate in Documentation/maintainer/maintainer-entry-profile.rst.
=20
-.. toctree::
-   :numbered:
-   :maxdepth: 2
+Per i manutentori, si consiglia di documentare ulteriori requisiti ed
+aspettative se le sottomissioni trascurano sistematicamente specifici crit=
eri
+di sottomissione. Vedere Documentation/maintainer/maintainer-entry-profile=
.rst.
=20
-   maintainer-tip
+.. maintainers-profile-toc::
diff --git a/Documentation/translations/it_IT/process/maintainer-pgp-guide.=
rst b/Documentation/translations/it_IT/process/maintainer-pgp-guide.rst
index cdc43c4a9b0b..8a9c8bd8a62d 100644
--- a/Documentation/translations/it_IT/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/it_IT/process/maintainer-pgp-guide.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. include:: ../disclaimer-ita.rst
=20
 :Original: :ref:`Documentation/process/maintainer-pgp-guide.rst <pgpguide>=
`
@@ -57,7 +59,7 @@ pratiche di sicurezza messe in atto.
=20
 Il principio sopra indicato =C3=A8 la ragione per la quale =C3=A8 necessar=
ia questa
 guida. Vogliamo essere sicuri che il riporre la fiducia negli sviluppatori
-non sia fatto semplicemente per incolpare qualcun'altro per future falle d=
i
+non sia fatto unicamente per incolpare qualcun'altro per future falle di
 sicurezza. L'obiettivo =C3=A8 quello di fornire una serie di linee guida c=
he gli
 sviluppatori possano seguire per creare un ambiente di lavoro sicuro e
 salvaguardare le chiavi PGP usate nello stabilire l'integrit=C3=A0 del ker=
nel Linux
@@ -68,7 +70,7 @@ stesso.
 Strumenti PGP
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Usare GnuPG 2.2 o successivo
+Usare GnuPG 2.4 o successivo
 ----------------------------
=20
 La vostra distribuzione potrebbe avere gi=C3=A0 installato GnuPG, dovete s=
olo
@@ -77,9 +79,10 @@ usate::
=20
     $ gpg --version | head -n1
=20
-Se state utilizzando la version 2.2 o successiva, allora siete pronti a pa=
rtire.
-Se invece state usando una versione precedente, allora alcuni comandi elen=
cati
-in questa guida potrebbero non funzionare.
+Se state utilizzando la versione 2.4 o successiva, allora siete pronti a
+partire. Se invece state usando una versione precedente, allora si tratta
+di una versione di GnuPG non pi=C3=B9 mantenuta, e alcuni comandi elencati=
 in
+questa guida potrebbero non funzionare.
=20
 Configurare le opzioni di gpg-agent
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -214,12 +217,6 @@ possano ricevere la vostra nuova sottochiave::
=20
     $ gpg --send-key [fpr]
=20
-.. note:: Supporto ECC in GnuPG
-
-   Tenete presente che se avete intenzione di usare un dispositivo che non
-   supporta chiavi ED25519 ECC, allora dovreste usare "nistp256" al posto =
di
-   "ed25519". Pi=C3=B9 avanti ci sono alcune raccomandazioni per i disposi=
tivi.
-
 Copia di riserva della chiave primaria per gestire il recupero da disastro
 --------------------------------------------------------------------------
=20
@@ -227,7 +224,7 @@ Maggiori sono le firme di altri sviluppatori che vengon=
o applicate alla vostra,
 maggiori saranno i motivi per avere una copia di riserva che non sia digit=
ale,
 al fine di effettuare un recupero da disastro.
=20
-Il modo migliore per creare una copia fisica della vostra chiave privata =
=C3=A8
+Un buon modo per creare una copia fisica della vostra chiave privata =
=C3=A8
 l'uso del programma ``paperkey``. Consultate ``man paperkey`` per maggiori
 dettagli sul formato dell'output ed i suoi punti di forza rispetto ad altr=
e
 soluzioni. Paperkey dovrebbe essere gi=C3=A0 pacchettizzato per la maggior=
 parte
@@ -238,11 +235,11 @@ vostra chiave privata::
=20
     $ gpg --export-secret-key [fpr] | paperkey -o /tmp/key-backup.txt
=20
-Stampate il file (o fate un pipe direttamente verso lpr), poi prendete
-una penna e scrivete la passphare sul margine del foglio.  **Questo =C3=
=A8
-caldamente consigliato** perch=C3=A9 la copia cartacea =C3=A8 comunque cri=
ptata con
-la passphrase, e se mai doveste cambiarla non vi ricorderete qual'era al
-momento della creazione di quella copia -- *garantito*.
+Stampate il file, poi prendete una penna e scrivete la passphare sul
+margine del foglio.  **Questo =C3=A8 caldamente consigliato** perch=C3=
=A9 la copia
+cartacea =C3=A8 comunque criptata con la passphrase, e se mai doveste
+cambiarla non vi ricorderete qual'era al momento della creazione di
+quella copia -- *garantito*.
=20
 Mettete la copia cartacea e la passphrase scritta a mano in una busta e
 mettetela in un posto sicuro e ben protetto, preferibilmente fuori casa,
@@ -250,10 +247,9 @@ magari in una cassetta di sicurezza in banca.
=20
 .. note::
=20
-    Probabilmente la vostra stampante non =C3=A8 pi=C3=B9 quello stupido d=
ispositivo
-    connesso alla porta parallela, ma dato che il suo output =C3=A8 comunq=
ue
-    criptato con la passphrase, eseguire la stampa in un sistema "cloud"
-    moderno dovrebbe essere comunque relativamente sicuro.
+    La chiave =C3=A8 comunque criptata con la vostra passphrase, quindi
+    stampare anche con stampanti moderne "integrate nel cloud" dovrebbe
+    rimanere un'operazione relativamente sicura.
=20
 Copia di riserva di tutta la cartella GnuPG
 -------------------------------------------
@@ -269,17 +265,17 @@ prontezza rispetto al recupero da disastro che abbiam=
o risolto con
 vostra chiave Certify -- ovvero quando fate modifiche alle vostre chiavi o
 firmate le chiavi di altre persone ad una conferenza o ad un gruppo d'inco=
ntro.
=20
-Incominciate con una piccola chiavetta di memoria USB (preferibilmente due=
)
-che userete per le copie di riserva. Dovrete criptarle usando LUKS -- fate
-riferimento alla documentazione della vostra distribuzione per capire come
-fare.
+Incominciate con un supporto di memoria esterno (preferibilmente due) che
+userete per le copie di riserva. Dovrete creare su questo dispositivo una
+partizione criptata usando LUKS -- fate riferimento alla documentazione
+della vostra distribuzione per capire come fare.
=20
 Per la passphrase di criptazione, potete usare la stessa della vostra chia=
ve
 primaria.
=20
-Una volta che il processo di criptazione =C3=A8 finito, reinserite il disc=
o USB ed
-assicurativi che venga montato correttamente. Copiate interamente la carte=
lla
-``.gnugp`` nel disco criptato::
+Una volta che il processo di criptazione =C3=A8 finito, reinserite il vost=
ro
+dispositivo ed assicurativi che venga montato correttamente. Copiate
+interamente la cartella ``.gnugp`` nel disco criptato::
=20
     $ cp -a ~/.gnupg /media/disk/foo/gnupg-backup
=20
@@ -288,11 +284,11 @@ Ora dovreste verificare che tutto continui a funziona=
re::
     $ gpg --homedir=3D/media/disk/foo/gnupg-backup --list-key [fpr]
=20
 Se non vedete errori, allora dovreste avere fatto tutto con successo.
-Smontate il disco USB, etichettatelo per bene di modo da evitare di
-distruggerne il contenuto non appena vi serve una chiavetta USB a caso, ed
-infine mettetelo in un posto sicuro -- ma non troppo lontano, perch=C3=
=A9 vi servir=C3=A0
-di tanto in tanto per modificare le identit=C3=A0, aggiungere o revocare
-sottochiavi, o firmare le chiavi di altre persone.
+Smontate il dispositivo, etichettatelo per bene di modo da evitare di
+sovrascriverlo per errore, ed infine mettetelo in un posto sicuro -- ma no=
n
+troppo lontano, perch=C3=A9 vi servir=C3=A0 di tanto in tanto per modifica=
re le
+identit=C3=A0, aggiungere o revocare sottochiavi, o firmare le chiavi di a=
ltre
+persone.
=20
 Togliete la chiave primaria dalla vostra home
 ---------------------------------------------
@@ -321,7 +317,7 @@ cartella home e la si archivia su un dispositivo discon=
nesso.
     che stiamo per fare render=C3=A0 la vostra chiave inutile se non avete=
 delle
     copie di riserva utilizzabili!
=20
-Per prima cosa, identificate il keygrip della vostra chiave primaria::
+Per prima cosa, identificate il "keygrip" della vostra chiave primaria::
=20
     $ gpg --with-keygrip --list-key [fpr]
=20
@@ -346,7 +342,7 @@ ad un file nella cartella ``~/.gnupg``::
     2222000000000000000000000000000000000000.key
     3333000000000000000000000000000000000000.key
=20
-Quello che dovrete fare =C3=A8 rimuovere il file .key che corrisponde al k=
eygrip
+=C3=88 sufficiente rimuovere il file .key che corrisponde al keygrip
 della chiave primaria::
=20
     $ cd ~/.gnupg/private-keys-v1.d
@@ -391,8 +387,9 @@ Inoltre, ogni volta che viene fatta un'operazione con G=
nuPG, le chiavi vengono
 caricate nella memoria di sistema e potrebbero essere rubate con l'uso di
 malware sofisticati (pensate a Meltdown e a Spectre).
=20
-Il miglior modo per proteggere le proprie chiave =C3=A8 di spostarle su un
-dispositivo specializzato in grado di effettuare operazioni smartcard.
+Un buon modo per proteggere completamente le vostre chiavi =C3=A8 di spost=
arle
+su un dispositivo specializzato in grado di effettuare operazioni
+smartcard.
=20
 I benefici di una smartcard
 ---------------------------
@@ -401,12 +398,13 @@ Una smartcard contiene un chip crittografico che =
=C3=A8 capace di immagazzinare
 le chiavi private ed effettuare operazioni crittografiche direttamente sul=
la
 carta stessa. Dato che la chiave non lascia mai la smartcard, il sistema
 operativo usato sul computer non sar=C3=A0 in grado di accedere alle chiav=
i.
-Questo =C3=A8 molto diverso dai dischi USB criptati che abbiamo usato allo=
 scopo di
-avere una copia di riserva sicura -- quando il dispositivo USB =C3=A8 conn=
esso e
-montato, il sistema operativo potr=C3=A0 accedere al contenuto delle chiav=
i private.
+Questo =C3=A8 molto diverso dal dispositivo di memoria criptato che abbiam=
o usato
+allo scopo di avere una copia di riserva sicura -- quando quel dispositivo
+=C3=A8 connesso e montato, il sistema operativo potr=C3=A0 accedere al con=
tenuto
+delle chiavi private.
=20
-L'uso di un disco USB criptato non pu=C3=B2 sostituire le funzioni di un d=
ispositivo
-capace di operazioni di tipo smartcard.
+L'uso di un dispositivo di memoria esterno criptato non pu=C3=B2 sostituir=
e le
+funzioni di un dispositivo capace di operazioni di tipo smartcard.
=20
 Dispositivi smartcard disponibili
 ---------------------------------
@@ -417,28 +415,27 @@ implementi le funzionalit=C3=A0 delle smartcard.  Sul=
 mercato ci sono diverse
 soluzioni disponibili:
=20
 - `Nitrokey Start`_: =C3=A8 Open hardware e Free Software, =C3=A8 basata s=
ul progetto
-  `GnuK`_ della FSIJ. Questo =C3=A8 uno dei pochi dispositivi a supportare=
 le chiavi
-  ECC ED25519, ma offre meno funzionalit=C3=A0 di sicurezza (come la resis=
tenza
-  alla manomissione o alcuni attacchi ad un canale laterale).
-- `Nitrokey Pro 2`_: =C3=A8 simile alla Nitrokey Start, ma =C3=A8 pi=C3=
=B9 resistente alla
-  manomissione e offre pi=C3=B9 funzionalit=C3=A0 di sicurezza. La Pro 2 s=
upporta la
-  crittografia ECC (NISTP).
+  `GnuK`_ della FSIJ. =C3=88 una delle opzioni pi=C3=B9 economiche, ma off=
re meno
+  funzionalit=C3=A0 di sicurezza (come la resistenza alla manomissione o a=
lcuni
+  attacchi ad un canale laterale).
+- `Nitrokey 3`_: =C3=A8 simile alla Nitrokey Start, ma =C3=A8 pi=C3=B9 res=
istente alla
+  manomissione, offre pi=C3=B9 funzionalit=C3=A0 di sicurezza e diverse fo=
rme USB.
+  Supporta la crittografia ECC (ED25519 e NISTP).
 - `Yubikey 5`_: l'hardware e il software sono proprietari, ma =C3=A8 pi=
=C3=B9 economica
-  della  Nitrokey Pro ed =C3=A8 venduta anche con porta USB-C il che =
=C3=A8 utile con i
-  computer portatili pi=C3=B9 recenti. In aggiunta, offre altre funzionali=
t=C3=A0 di
-  sicurezza come FIDO, U2F, e ora supporta anche le chiavi ECC (NISTP)
+  della Nitrokey a parit=C3=A0 di funzionalit=C3=A0. Supporta la crittogra=
fia ECC
+  (ED25519 e NISTP).
=20
 La vostra scelta dipender=C3=A0 dal costo, la disponibilit=C3=A0 nella vos=
tra regione, e
 sulla scelta fra dispositivi aperti e proprietari.
=20
 .. note::
=20
-    Se siete nella lista MAINTAINERS o avete un profilo su kernel.org, all=
ora
-    `potrete avere gratuitamente una Nitrokey Start`_ grazie alla fondazio=
ne
-    Linux.
+    Se siete elencati in una voce `M:` nel file MAINTAINERS o avete un
+    profilo su kernel.org, allora `potrete avere gratuitamente una
+    Nitrokey Start`_ grazie alla fondazione Linux.
=20
-.. _`Nitrokey Start`: https://shop.nitrokey.com/shop/product/nitrokey-star=
t-6
-.. _`Nitrokey Pro 2`: https://shop.nitrokey.com/shop/product/nitrokey-pro-=
2-3
+.. _`Nitrokey Start`: https://www.nitrokey.com/products/nitrokeys
+.. _`Nitrokey 3`: https://www.nitrokey.com/products/nitrokeys
 .. _`Yubikey 5`: https://www.yubico.com/product/yubikey-5-overview/
 .. _Gnuk: https://www.fsij.org/doc-gnuk/
 .. _`potrete avere gratuitamente una Nitrokey Start`: https://www.kernel.o=
rg/nitrokey-digital-tokens-for-kernel-developers.html
@@ -474,7 +471,7 @@ dell'amministratore viene usato cos=C3=AC raramente che=
 =C3=A8 inevitabile dimenticarsel
 se non lo si annota.
=20
 Tornando al nostro menu, potete impostare anche altri valori (come il nome=
,
-il sesso, informazioni d'accesso, eccetera), ma non sono necessari e aggiu=
nge
+il genere, informazioni d'accesso, eccetera), ma non sono necessari e aggi=
unge
 altre informazioni sulla carta che potrebbero trapelare in caso di smarrim=
ento.
=20
 .. note::
@@ -636,7 +633,7 @@ eseguite::
 Se per voi =C3=A8 pi=C3=B9 facile da memorizzare, potete anche utilizzare =
una data
 specifica (per esempio, il vostro compleanno o capodanno)::
=20
-    $ gpg --quick-set-expire [fpr] 2025-07-01
+    $ gpg --quick-set-expire [fpr] 2038-07-01
=20
 Ricordatevi di inviare l'aggiornamento ai keyserver::
=20
@@ -676,8 +673,8 @@ storia completa del progetto, inclusi i suoi tag, i com=
mit ed i rami. Tuttavia,
 con i centinaia di repositori clonati che ci sono in giro, come si fa a
 verificare che la loro copia di linux.git non =C3=A8 stata manomessa da qu=
alcuno?
=20
-Oppure, cosa succede se viene scoperta una backdoor nel codice e la riga
-"Autore" dice che sei stato tu, mentre tu sei abbastanza sicuro di
+Oppure, cosa succede se viene scoperto del codice malevolo nel kernel e la
+riga "Autore" dice che sei stato tu, mentre tu sei abbastanza sicuro di
 `non averci niente a che fare`_?
=20
 Per risolvere entrambi i problemi, Git ha introdotto l'integrazione con PG=
P.
@@ -732,9 +729,9 @@ Il merge conterr=C3=A0 qualcosa di simile::
     # gpg: Signature made [...]
     # gpg: Good signature from [...]
=20
-Se state verificando il tag di qualcun altro, allora dovrete importare
-la loro chiave PGP. Fate riferimento alla sezione ":ref:`it_verify_identit=
ies`"
-che troverete pi=C3=B9 avanti.
+Se state verificando il tag di qualcun altro, allora dovrete prima
+importare la loro chiave PGP. Fate riferimento alla sezione
+":ref:`it_verify_identities`" che troverete pi=C3=B9 avanti.
=20
 Configurare git per firmare sempre i tag con annotazione
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -748,16 +745,17 @@ dovete impostare la seguente opzione globale::
 Come usare commit firmati
 -------------------------
=20
-Creare dei commit firmati =C3=A8 facile, ma =C3=A8 molto pi=C3=B9 difficil=
e utilizzarli
-nello sviluppo del kernel linux per via del fatto che ci si affida alle
-liste di discussione e questo modo di procedere non mantiene le firme PGP
-nei commit. In aggiunta, quando si usa *rebase* nel proprio repositorio
-locale per allinearsi al kernel anche le proprie firme PGP verranno scarta=
te.
-Per questo motivo, la maggior parte degli sviluppatori del kernel non si
-preoccupano troppo di firmare i propri commit ed ignoreranno quelli firmat=
i
-che si trovano in altri repositori usati per il proprio lavoro.
-
-Tuttavia, se avete il vostro repositorio di lavoro disponibile al pubblico
+=C3=88 anche possibile creare dei commit firmati, ma la loro utilit=C3=
=A0 nello
+sviluppo del kernel Linux =C3=A8 limitata. Il flusso di lavoro per contrib=
uire
+al kernel si basa sull'invio di patch, e la conversione dei commit in
+patch non preserva le firme PGP dei commit. Inoltre, quando si esegue il
+*rebase* del proprio repositorio su un ramo principale pi=C3=B9 recente, l=
e
+firme PGP dei commit verranno scartate. Per questo motivo, la maggior
+parte degli sviluppatori del kernel non si preoccupano troppo di firmare
+i propri commit ed ignoreranno quelli firmati che si trovano in altri
+repositori usati per il proprio lavoro.
+
+Detto ci=C3=B2, se avete il vostro repositorio di lavoro disponibile al pu=
bblico
 su un qualche servizio di hosting git (kernel.org, infradead.org, ozlabs.o=
rg,
 o altri), allora la raccomandazione =C3=A8 di firmare tutti i vostri commi=
t
 anche se gli sviluppatori non ne beneficeranno direttamente.
@@ -769,17 +767,18 @@ Vi raccomandiamo di farlo per i seguenti motivi:
    esternamente che hanno firme PGP sui commit avranno un certo valore a
    questo scopo.
 2. Se dovesse mai capitarvi di clonare il vostro repositorio locale (per
-   esempio dopo un danneggiamento del disco), la firma vi permetter=C3=
=A0 di
-   verificare l'integrit=C3=A0 del repositorio prima di riprendere il lavo=
ro.
+   esempio dopo aver reinstallato il vostro sistema), la firma vi
+   permetter=C3=A0 di verificare l'integrit=C3=A0 del repositorio prima di
+   riprendere il lavoro.
 3. Se qualcuno volesse usare *cherry-pick* sui vostri commit, allora la fi=
rma
    permetter=C3=A0 di verificare l'integrit=C3=A0 dei commit prima di appl=
icarli.
=20
 Creare commit firmati
 ~~~~~~~~~~~~~~~~~~~~~
=20
-Per creare un commit firmato, dovete solamente aggiungere l'opzione ``-S``
-al comando ``git commit`` (si usa la lettera maiuscola per evitare
-conflitti con un'altra opzione)::
+Per creare un commit firmato, aggiungete l'opzione ``-S`` al comando
+``git commit`` (si usa la lettera maiuscola per evitare conflitti con
+un'altra opzione)::
=20
     $ git commit -S
=20
@@ -814,6 +813,11 @@ un'attestazione delle firme crittografiche (tipo DKIM)=
:
 Installare e configurate patatt
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
+.. note::
+
+    Se usate B4 per inviare le vostre patch, patatt =C3=A8 gi=C3=A0 instal=
lato ed
+    integrato nel vostro flusso di lavoro.
+
 Lo strumento patatt =C3=A8 disponibile per diverse distribuzioni, dunque c=
ercatelo
 prima l=C3=AC. Oppure potete installarlo usano pypi "``pip install patatt`=
`"
=20
@@ -855,7 +859,7 @@ esempio::
 Come verificare l'identit=C3=A0 degli sviluppatori del kernel
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
=20
-Firmare i tag e i commit =C3=A8 facile, ma come si fa a verificare che la =
chiave
+Firmare tag e commit =C3=A8 semplice, ma come si fa a verificare che la ch=
iave
 usata per firmare qualcosa appartenga davvero allo sviluppatore e non ad u=
n
 impostore?
=20
@@ -892,7 +896,7 @@ Se avete un account kernel.org, al fine di rendere pi=
=C3=B9 utile l'uso di WKD
 da parte di altri sviluppatori del kernel, dovreste `aggiungere alla vostr=
a
 chiave lo UID di kernel.org`_.
=20
-.. _`aggiungere alla vostra chiave lo UID di kernel.org`: https://korg.wik=
i.kernel.org/userdoc/mail#adding_a_kernelorg_uid_to_your_pgp_key
+.. _`aggiungere alla vostra chiave lo UID di kernel.org`: https://korg.doc=
s.kernel.org/mail.html#adding-a-kernel-org-uid-to-your-pgp-key
=20
 Web of Trust (WOT) o Trust on First Use (TOFU)
 ----------------------------------------------
@@ -905,7 +909,7 @@ essere le entit=C3=A0 di certificazione di cui dovreste=
 fidarvi, PGP lascia
 la responsabilit=C3=A0 ad ogni singolo utente.
=20
 Sfortunatamente, solo poche persone capiscono come funziona la rete di fid=
ucia.
-Nonostante sia un importante aspetto della specifica OpenPGP, recentemente
+Nonostante sia tuttora una parte importante della specifica OpenPGP, recen=
temente
 le versioni di GnuPG (2.2 e successive) hanno implementato un meccanisco
 alternativo chiamato "Trust on First Use" (TOFU). Potete pensare a TOFU co=
me
 "ad un approccio all fidicia simile ad SSH". In SSH, la prima volta che vi
@@ -915,8 +919,8 @@ SSH vi avviser=C3=A0 e si rifiuter=C3=A0 di connettersi=
, obbligandovi a prendere una
 decisione circa la fiducia che riponete nella nuova chiave. In modo simile=
,
 la prima volta che importate la chiave PGP di qualcuno, si assume sia vali=
da.
 Se ad un certo punto GnuPG trova un'altra chiave con la stessa identit=
=C3=A0,
-entrambe, la vecchia e la nuova, verranno segnate come invalide e dovrete
-verificare manualmente quale tenere.
+entrambe, la vecchia e la nuova, verranno segnate per la verifica e dovret=
e
+controllare manualmente quale tenere.
=20
 Vi raccomandiamo di usare il meccanisco TOFU+PGP (che =C3=A8 la nuova conf=
igurazione
 di base di GnuPG v2). Per farlo, aggiungete (o modificate) l'impostazione
@@ -924,6 +928,8 @@ di base di GnuPG v2). Per farlo, aggiungete (o modifica=
te) l'impostazione
=20
     trust-model tofu+pgp
=20
+.. _it_kernel_org_trust_repository:
+
 Usare il repositorio kernel.org per il web of trust
 ---------------------------------------------------
=20
diff --git a/Documentation/translations/it_IT/process/maintainers.rst b/Doc=
umentation/translations/it_IT/process/maintainers.rst
index 3225f7c89fda..95916bc8e346 100644
--- a/Documentation/translations/it_IT/process/maintainers.rst
+++ b/Documentation/translations/it_IT/process/maintainers.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 :Original: Documentation/process/maintainers.rst
=20
 Lista dei manutentori e come inviare modifiche al kernel
diff --git a/Documentation/translations/it_IT/process/programming-language.=
rst b/Documentation/translations/it_IT/process/programming-language.rst
index 5bc5b9d42f31..623675f3b623 100644
--- a/Documentation/translations/it_IT/process/programming-language.rst
+++ b/Documentation/translations/it_IT/process/programming-language.rst
@@ -8,8 +8,8 @@
 Linguaggio di programmazione
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
-Il kernel =C3=A8 scritto nel linguaggio di programmazione C [it-c-language=
]_.
-Pi=C3=B9 precisamente, il kernel viene compilato con ``gcc`` [it-gcc]_ usa=
ndo
+Il kernel Linux =C3=A8 scritto nel linguaggio di programmazione C [it-c-la=
nguage]_.
+Pi=C3=B9 precisamente, viene compilato con ``gcc`` [it-gcc]_ usando
 l'opzione ``-std=3Dgnu11`` [it-gcc-c-dialect-options]_: il dialetto GNU
 dello standard ISO C11.
 Linux supporta anche ``clang`` [it-clang]_, leggete la documentazione
@@ -42,7 +42,7 @@ Per maggiori informazioni consultate il file d'intestazio=
ne
 Rust
 ----
=20
-Il kernel supporta sperimentalmente il linguaggio di programmazione Rust
+Il kernel supporta il linguaggio di programmazione Rust
 [it-rust-language]_ abilitando l'opzione di configurazione ``CONFIG_RUST``=
. Il
 codice verr=C3=A0 compilato usando ``rustc`` [it-rustc]_ con l'opzione
 ``--edition=3D2021`` [it-rust-editions]_. Le edizioni Rust sono un modo pe=
r
diff --git a/Documentation/translations/it_IT/process/submit-checklist.rst =
b/Documentation/translations/it_IT/process/submit-checklist.rst
index c58d773fd297..229e219a6f9a 100644
--- a/Documentation/translations/it_IT/process/submit-checklist.rst
+++ b/Documentation/translations/it_IT/process/submit-checklist.rst
@@ -98,9 +98,12 @@ Compilare il codice
      e correggere i problemi
=20
 2) Compilare per diverse architetture di processore usando strumenti per l=
a
-   cross-compilazione o altri. Una buona architettura per la verifica dell=
a
-   cross-compilazione =C3=A8 la ppc64 perch=C3=A9 tende ad usare ``unsigne=
d long`` per le
-   quantit=C3=A0 a 64-bit.
+   cross-compilazione o altri.
+   Da notare che testare su architetture con diverse dimensioni delle paro=
le
+   (32 e 64 bit) e diverso ordinamento dei byte (*big-* e *little-endian*)=
 =C3=A8
+   efficace nell'individuare vari problemi di portabilit=C3=A0 dovuti ad
+   assunzioni errate sull'intervallo di valori rappresentabili, l'allineam=
ento
+   dei dati, o l'ordinamento dei byte, fra le altre cose.
=20
 3) Il nuovo codice =C3=A8 stato compilato con ``gcc -W`` (usate
     ``make KCFLAGS=3D-W``).  Questo generer=C3=A0 molti avvisi, ma =C3=
=A8 ottimo
diff --git a/Documentation/translations/it_IT/process/submitting-patches.rs=
t b/Documentation/translations/it_IT/process/submitting-patches.rst
index 1cc4808139ce..a742610cb070 100644
--- a/Documentation/translations/it_IT/process/submitting-patches.rst
+++ b/Documentation/translations/it_IT/process/submitting-patches.rst
@@ -28,7 +28,7 @@ render=C3=A0 la vostra vita di sviluppatore del kernel mo=
lto pi=C3=B9 semplice.
=20
 I sorgenti di alcuni sottosistemi e manutentori contengono pi=C3=B9 inform=
azioni
 riguardo al loro modo di lavorare ed aspettative. Consultate
-:ref:`Documentation/translations/it_IT/process/maintainer-handbooks.rst <i=
t_maintainer_handbooks_main>`
+Documentation/translations/it_IT/process/maintainer-handbooks.rst
=20
 Ottenere i sorgenti attuali
 ---------------------------
@@ -162,8 +162,8 @@ proibiti.
=20
 Se la vostra patch corregge un baco in un commit specifico, per esempio av=
ete
 trovato un problema usando ``git bisect``, per favore usate l'etichetta
-'Fixes:' indicando i primi 12 caratteri dell'identificativo SHA-1 seguiti
-dalla riga riassuntiva.  Per esempio::
+'Fixes:' indicando almeno i primi 12 caratteri dell'identificativo SHA-1
+seguiti dalla riga riassuntiva.  Per esempio::
=20
 =09Fixes: e21d2170f366 ("video: remove unnecessary platform_set_drvdata()"=
)
=20
@@ -444,12 +444,11 @@ delle patch che vengono inviate per e-mail.
 La firma =C3=A8 una semplice riga alla fine della descrizione della patch =
che
 certifica che l'avete scritta voi o che avete il diritto di pubblicarla
 come patch open-source.  Le regole sono abbastanza semplici: se potete
-certificare quanto segue:
+certificare quanto segue::
=20
-Il certificato d'origine dello sviluppatore 1.1
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+        Il certificato d'origine dello sviluppatore 1.1
=20
-Contribuendo a questo progetto, io certifico che:
+        Contribuendo a questo progetto, io certifico che:
=20
         (a) Il contributo =C3=A8 stato creato interamente, o in parte, da =
me e che
             ho il diritto di inviarlo in accordo con la licenza open-sourc=
e
@@ -505,27 +504,48 @@ della patch ma desidera firmare e mettere agli atti l=
a loro approvazione,
 allora queste persone possono chiedere di aggiungere al changelog della pa=
tch
 una riga Acked-by:.
=20
-Acked-by: viene spesso utilizzato dai manutentori del sottosistema in ogge=
tto
-quando quello stesso manutentore non ha contribuito n=C3=A9 trasmesso la p=
atch.
+Acked-by: =C3=A8 pensata per essere usata da coloro che sono responsabili,=
 o
+comunque coinvolti, con il codice interessato in un modo o nell'altro. Pi=
=C3=B9
+comunemente, dal manutentore, quando quello stesso manutentore non ha
+contribuito n=C3=A9 trasmesso la patch.
+
+Acked-by: pu=C3=B2 anche essere usata da altre parti interessate, come per=
sone con
+conoscenza specifica dell'argomento (per esempio l'autore originale del
+codice modificato), revisori lato spazio-utente per una patch che tocca la
+uAPI del kernel, o utenti chiave di una funzionalit=C3=A0.  Opzionalmente,=
 in
+questi casi, pu=C3=B2 essere utile aggiungere un "# Suffisso" per chiarirn=
e il
+significato::
+
+=09Acked-by: The Stakeholder <stakeholder@example.org> # Come utente prima=
rio
=20
 Acked-by: non =C3=A8 formale come Signed-off-by:.  Questo indica che la pe=
rsona ha
 revisionato la patch e l'ha trovata accettabile.  Per cui, a volte, chi
 integra le patch convertir=C3=A0 un "s=C3=AC, mi sembra che vada bene" in =
un Acked-by:
 (ma tenete presente che solitamente =C3=A8 meglio chiedere esplicitamente)=
.
=20
+Acked-by: =C3=A8 anche meno formale di Reviewed-by:.  Per esempio, un manu=
tentore
+potrebbe usarla per indicare che =C3=A8 d'accordo con l'integrazione della=
 patch,
+pur non avendola revisionata con lo stesso livello d'approfondimento che
+avrebbe richiesto un Reviewed-by:.  Allo stesso modo, un utente chiave
+potrebbe non aver effettuato una revisione tecnica della patch, ma potrebb=
e
+comunque essere soddisfatto dell'approccio generale, della funzionalit=
=C3=A0 o
+dell'interfaccia rivolta all'utente.
+
 Acked-by: non indica l'accettazione di un'intera patch.  Per esempio, quan=
do
 una patch ha effetti su diversi sottosistemi e ha un Acked-by: da un
 manutentore di uno di questi, significa che il manutentore accetta quella
 parte di codice relativa al sottosistema che mantiene.  Qui dovremmo esser=
e
 giudiziosi.  Quando si hanno dei dubbi si dovrebbe far riferimento alla
-discussione originale negli archivi della lista di discussione.
+discussione originale negli archivi della lista di discussione.  Anche in
+questo caso si pu=C3=B2 usare un "# Suffisso" per chiarire.
=20
 Se una persona ha avuto l'opportunit=C3=A0 di commentare la patch, ma non =
lo ha
-fatto, potete aggiungere l'etichetta ``Cc:`` alla patch.  Questa =C3=A8 l'=
unica
-etichetta che pu=C3=B2 essere aggiunta senza che la persona in questione f=
accia
-alcunch=C3=A9 - ma dovrebbe indicare che la persona ha ricevuto una copia =
della
-patch.  Questa etichetta documenta che terzi potenzialmente interessati so=
no
-stati inclusi nella discussione.
+fatto, potete aggiungere l'etichetta ``Cc:`` alla patch.  Questa etichetta
+documenta che terzi potenzialmente interessati sono stati inclusi nella
+discussione.  Da notare che questa =C3=A8 una delle sole tre etichette che
+potreste poter usare senza il permesso esplicito della persona nominata (p=
er
+i dettagli, vedere pi=C3=B9 avanti "Etichettare le persone richiede un
+permesso").
=20
 Co-developed-by: indica che la patch =C3=A8 stata cosviluppata da diversi
 sviluppatori; viene usato per assegnare pi=C3=B9 autori (in aggiunta a que=
llo
@@ -569,13 +589,14 @@ Utilizzare Reported-by:, Tested-by:, Reviewed-by:, Su=
ggested-by: e Fixes:
=20
 L'etichetta Reported-by da credito alle persone che trovano e riportano i =
bachi
 e si spera che questo possa ispirarli ad aiutarci nuovamente in futuro.
-Rammentate che se il baco =C3=A8 stato riportato in privato, dovrete chied=
ere il
-permesso prima di poter utilizzare l'etichetta Reported-by. Questa etichet=
ta va
-usata per i bachi, dunque non usatela per richieste di nuove funzionalit=
=C3=A0.
-Questa etichetta dovrebbe essere seguita da quella Closes: con un indirizz=
o al
-rapporto, a meno che questo non sia disponibile sul web. L'etichetta Link:=
 pu=C3=B2
-essere usata in alternativa a Closes: se la patch corregge solo in parte i=
l
-problema riportato nel rapporto.
+Questa etichetta va usata per i bachi, dunque non usatela per richieste di
+nuove funzionalit=C3=A0. Questa etichetta dovrebbe essere seguita da quell=
a Closes:
+con un indirizzo al rapporto, a meno che questo non sia disponibile sul we=
b.
+L'etichetta Link: pu=C3=B2 essere usata in alternativa a Closes: se la pat=
ch
+corregge solo in parte il problema riportato nel rapporto. Da notare che
+l'etichetta Reported-by =C3=A8 una delle sole tre etichette che potreste p=
oter
+usare senza il permesso esplicito della persona nominata (per i dettagli,
+vedere pi=C3=B9 avanti "Etichettare le persone richiede un permesso").
=20
 L'etichetta Tested-by: indica che la patch =C3=A8 stata verificata con suc=
cesso
 (su un qualche sistema) dalla persona citata.  Questa etichetta informa i
@@ -584,12 +605,11 @@ persone che possano verificare il codice in futuro, e=
 garantisce che queste
 stesse persone ricevano credito per il loro lavoro.
=20
 Reviewed-by:, invece, indica che la patch =C3=A8 stata revisionata ed =
=C3=A8 stata
-considerata accettabile in accordo con la dichiarazione dei revisori:
+considerata accettabile in accordo con la dichiarazione dei revisori::
=20
-Dichiarazione di svista dei revisori
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+=09Dichiarazione di svista dei revisori
=20
-Offrendo la mia etichetta Reviewed-by, dichiaro quanto segue:
+=09Offrendo la mia etichetta Reviewed-by, dichiaro quanto segue:
=20
 =09 (a) Ho effettuato una revisione tecnica di questa patch per valutarne
 =09     l'adeguatezza ai fini dell'inclusione nel ramo principale del
@@ -611,8 +631,9 @@ Offrendo la mia etichetta Reviewed-by, dichiaro quanto =
segue:
=20
 L'etichetta Reviewed-by =C3=A8 la dichiarazione di un parere sulla bont=
=C3=A0 di
 una modifica che si ritiene appropriata e senza alcun problema tecnico
-importante.  Qualsiasi revisore interessato (quelli che lo hanno fatto)
-possono offrire il proprio Reviewed-by per la patch.  Questa etichetta ser=
ve
+importante.  Qualsiasi revisore interessato (che lo abbia fatto e che sia
+una persona dall'identit=C3=A0 nota) pu=C3=B2 offrire il proprio Reviewed-=
by per la
+patch.  Questa etichetta serve
 a dare credito ai revisori e a informare i manutentori sul livello di revi=
sione
 che =C3=A8 stato fatto sulla patch.  L'etichetta Reviewed-by, quando forni=
ta da
 revisori conosciuti per la loro conoscenza sulla materia in oggetto e per =
la
@@ -623,28 +644,63 @@ Quando si riceve una email sulla lista di discussione=
 da un tester o
 un revisore, le etichette Tested-by o Reviewed-by devono essere
 aggiunte dall'autore quando invier=C3=A0 nuovamente la patch. Tuttavia, se
 la patch =C3=A8 cambiata in modo significativo, queste etichette potrebber=
o
-non avere pi=C3=B9 senso e quindi andrebbero rimosse. Solitamente si tiene=
 traccia
-della rimozione nel changelog della patch (subito dopo il separatore '---'=
).
+non avere pi=C3=B9 senso e quindi andrebbero rimosse. Solitamente si tiene
+traccia della rimozione di un'etichetta Acked-by, Tested-by o Reviewed-by
+nel changelog della patch, con una spiegazione, (subito dopo il
+separatore '---').
=20
 L'etichetta Suggested-by: indica che l'idea della patch =C3=A8 stata sugge=
rita
-dalla persona nominata e le da credito. Tenete a mente che questa etichett=
a
-non dovrebbe essere aggiunta senza un permesso esplicito, specialmente se
-l'idea non =C3=A8 stata pubblicata in un forum pubblico.  Detto ci=C3=
=B2, dando credito
-a chi ci fornisce delle idee, si spera di poterli ispirare ad aiutarci
-nuovamente in futuro.
-
-L'etichetta Fixes: indica che la patch corregge un problema in un commit
-precedente.  Serve a chiarire l'origine di un baco, il che aiuta la revisi=
one
-del baco stesso.  Questa etichetta =C3=A8 di aiuto anche per i manutentori=
 dei
-kernel stabili al fine di capire quale kernel deve ricevere la correzione.
-Questo =C3=A8 il modo suggerito per indicare che un baco =C3=A8 stato corr=
etto nella
-patch. Per maggiori dettagli leggete :ref:`it_describe_changes`
+dalla persona nominata e le da credito: se diamo diligentemente credito a
+chi ci fornisce delle idee, si spera di poterli ispirare ad aiutarci
+nuovamente in futuro. Da notare che questa =C3=A8 una delle sole tre etich=
ette
+che potreste poter usare senza il permesso esplicito della persona
+nominata (per i dettagli, vedere pi=C3=B9 avanti "Etichettare le persone
+richiede un permesso").
+
+L'etichetta Fixes: indica che la patch corregge un baco in un commit
+precedente.  Serve a rendere facile determinare dove abbia avuto origine
+un problema, il che pu=C3=B2 aiutare la revisione di una correzione.  Ques=
ta
+etichetta =C3=A8 di aiuto anche per i manutentori dei kernel stabili al fi=
ne
+di capire quale kernel deve ricevere la correzione.  Questo =C3=A8 il modo
+suggerito per indicare che un baco =C3=A8 stato corretto nella patch. Per
+maggiori dettagli leggete :ref:`it_describe_changes`
=20
 Da notare che aggiungere un tag "Fixes:" non esime dalle regole
 previste per i kernel stabili, e nemmeno dalla necessit=C3=A0 di aggiunger=
e
 in copia conoscenza stable@vger.kernel.org su tutte le patch per
 suddetti kernel.
=20
+Infine, sebbene fornire le etichette sia gradito e generalmente molto
+apprezzato, tenete presente che i firmatari (cio=C3=A8 chi sottomette e i
+manutentori) potrebbero usare la propria discrezione nell'applicare le
+etichette proposte.
+
+.. _it_tagging_people:
+
+Etichettare le persone richiede un permesso
+--------------------------------------------
+
+State attenti ad aggiungere le suddette etichette alla vostra patch: tutte=
,
+tranne Cc:, Reported-by: e Suggested-by:, richiedono il permesso esplicito
+della persona nominata.  Per queste tre =C3=A8 sufficiente un permesso imp=
licito,
+se la persona ha contribuito al kernel Linux usando quel nome e quell'indi=
rizzo
+email secondo gli archivi di lore o la cronologia dei commit -- e, nel cas=
o di
+Reported-by: e Suggested-by:, se la segnalazione o il suggerimento sono
+avvenuti pubblicamente.  Da notare che bugzilla.kernel.org =C3=A8, in ques=
to senso,
+un luogo pubblico, ma gli indirizzi email usati l=C3=AC sono privati; quin=
di non
+esponeteli nelle etichette, a meno che la persona non li abbia gi=C3=A0 us=
ati in
+contributi precedenti.
+
+Usare Assisted-by:
+-------------------
+
+Se avete usato un qualsiasi tipo di strumento di assistenza avanzata alla
+scrittura del codice per la creazione della vostra patch, dovete darne att=
o
+aggiungendo un'etichetta Assisted-by.  Non farlo pu=C3=B2 ostacolare
+l'accettazione del vostro lavoro.  Fate riferimento a
+Documentation/process/coding-assistants.rst per i dettagli su come dare
+atto dell'uso di assistenti alla scrittura del codice.
+
 .. _it_the_canonical_patch_format:
=20
 Il formato canonico delle patch
@@ -656,6 +712,9 @@ potere usare il comando ``git format-patch`` per ottene=
re patch nel formato
 appropriato.  Lo strumento non crea il testo necessario, per cui, leggete
 le seguenti istruzioni.
=20
+Oggetto
+^^^^^^^
+
 L'oggetto di una patch canonica =C3=A8 la riga::
=20
     Subject: [PATCH 001/123] subsystem: summary phrase
@@ -729,6 +788,9 @@ Un paio di esempi di oggetti::
     Subject: [PATCH v2] sub/sys: Condensed patch summary
     Subject: [PATCH v2 M/N] sub/sys: Condensed patch summary
=20
+Riga From
+^^^^^^^^^
+
 La riga ``from`` dev'essere la prima nel corpo del messaggio ed =C3=A8 nel
 formato:
=20
@@ -739,6 +801,15 @@ l'autore della patch.  Se la riga ``from`` =C3=A8 manc=
ante, allora per determinare
 l'autore da inserire nel changelog verr=C3=A0 usata la riga ``From``
 nell'intestazione dell'email.
=20
+L'autore pu=C3=B2 indicare la propria affiliazione o lo sponsor del lavoro
+aggiungendo il nome di un'organizzazione alle righe ``from`` e ``SoB``,
+per esempio:
+
+=09From: Patch Author (Azienda) <author@example.com>
+
+Corpo della spiegazione
+^^^^^^^^^^^^^^^^^^^^^^^^
+
 Il corpo della spiegazione verr=C3=A0 incluso nel changelog permanente, pe=
r cui
 deve aver senso per un lettore esperto che =C3=A8 ha dimenticato i dettagl=
i della
 discussione che hanno portato alla patch.  L'inclusione di informazioni
@@ -755,6 +826,33 @@ aggiungete solo quello che =C3=A8 necessario per far s=
i che la vostra patch
 venga trovata.  Come nella ``summary phrase``, =C3=A8 importante essere si=
a
 brevi che descrittivi.
=20
+.. _it_backtraces:
+
+Aggiungere i *backtrace* nei messaggi di commit
+""""""""""""""""""""""""""""""""""""""""""""""""
+
+I *backtrace* aiutano a documentare la sequenza di chiamate a funzione
+che portano ad un problema. Tuttavia, non tutti i *backtrace* sono
+davvero utili. Per esempio, le sequenze iniziali di avvio sono uniche
+e ovvie. Copiare integralmente l'output di ``dmesg`` aggiunge tante
+informazioni che distraggono dal vero problema (per esempio, i
+marcatori temporali, la lista dei moduli, la lista dei registri, lo
+stato dello stack).
+
+Quindi, per rendere utile un *backtrace* dovreste eliminare le
+informazioni inutili, cosicch=C3=A9 ci si possa focalizzare sul
+problema. Ecco un esempio di un *backtrace* essenziale::
+
+  unchecked MSR access error: WRMSR to 0xd51 (tried to write 0x00000000000=
00064)
+  at rIP: 0xffffffffae059994 (native_write_msr+0x4/0x20)
+  Call Trace:
+  mba_wrmsr
+  update_domains
+  rdtgroup_mkdir
+
+Commento
+^^^^^^^^
+
 La linea di demarcazione ``---`` serve essenzialmente a segnare dove finis=
ce
 il messaggio di changelog.
=20
@@ -778,7 +876,10 @@ versione di una patch non sono parte del *chagelog* ch=
e viene incluso
 in git. Queste sono informazioni utili solo ai revisori. Se venissero
 messe sopra la riga, qualcuno dovr=C3=A0 fare del lavoro manuale per
 rimuoverle; cosa che invece viene fatta automaticamente quando vengono
-messe correttamente oltre la riga.::
+messe correttamente oltre la riga. Se disponibili, si consiglia di
+aggiungere anche i collegamenti alle versioni precedenti della patch
+(per esempio, un collegamento all'archivio di lore.kernel.org) per
+aiutare i revisori::
=20
   <commit message>
   ...
@@ -787,35 +888,14 @@ messe correttamente oltre la riga.::
   V2 -> V3: Removed redundant helper function
   V1 -> V2: Cleaned up coding style and addressed review comments
=20
+  v2: https://lore.kernel.org/bar
+  v1: https://lore.kernel.org/foo
+
   path/to/file | 5+++--
   ...
=20
 Maggiori dettagli sul formato delle patch nei riferimenti qui di seguito.
=20
-.. _it_backtraces:
-
-Aggiungere i *backtrace* nei messaggi di commit
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-I *backtrace* aiutano a documentare la sequenza di chiamate a funzione
-che portano ad un problema. Tuttavia, non tutti i *backtrace* sono
-davvero utili. Per esempio, le sequenze iniziali di avvio sono uniche
-e ovvie. Copiare integralmente l'output di ``dmesg`` aggiunge tante
-informazioni che distraggono dal vero problema (per esempio, i
-marcatori temporali, la lista dei moduli, la lista dei registri, lo
-stato dello stack).
-
-Quindi, per rendere utile un *backtrace* dovreste eliminare le
-informazioni inutili, cosicch=C3=A9 ci si possa focalizzare sul
-problema. Ecco un esempio di un *backtrace* essenziale::
-
-  unchecked MSR access error: WRMSR to 0xd51 (tried to write 0x00000000000=
00064)
-  at rIP: 0xffffffffae059994 (native_write_msr+0x4/0x20)
-  Call Trace:
-  mba_wrmsr
-  update_domains
-  rdtgroup_mkdir
-
 .. _it_explicit_in_reply_to:
=20
 Usare esplicitamente In-Reply-To nell'intestazione
--=20
2.47.3



Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD153F1047
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 14:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928942; cv=none; b=QnthHk7b87K+DCzkKlUMalDC53Bp3cOA/wgs9zvAy6RYi/gZECcy8sO+AAb+zzSEOISHePeRpWLNKN6Zfj1kYSxjTFqX26D3ouvk8vKBF0RdIqnG8c/ywiGskPbfem/cBQf5dgrBMt/gIrRcbjWNdd8lcTLMdNPIhIyI4nHKXQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928942; c=relaxed/simple;
	bh=Ov8NVQEXcy9rj5BMzVzmuFiISvUzIKlZ6UGfBO3Adfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pptpIT8jDMWLI+JhnHB2bMj2JACqr+97QhB0WFCaGnyHadrCidTT1xbMgE1vi0v9lIHFFvgs57Z0az178iWiH7iZPqPAgd3XeCsL0ZH/71o1OdlsIw6DORcwpO84KPrzPGGGfXi65OX9ngx8+h9UFR/maGlWXpoOkwVqaM/tW5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4+Pyep5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4+Pyep5"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so616811f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 07:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787928939; x=1788533739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhQeshPW5Emp15I17NYA78rqWHEcwLTPzJHZpx8OGN8=;
        b=i4+Pyep5GwmpqGPcSWVkmhCE6jCN2sPVCMcq9Zc7dueCDoLIHZOgp2rtUq+anyRnqM
         drbueFcuEDuaDNbDQenSj43uwuHNxHdvoSE03W7dwCN1JvSyjZXB5d7YFie1M9WUSvXi
         Bfo+jnbbTuDPlsJIt1AKlIax+CmSeBQy2yOxxj5dof10EBTFxST374cnCYNgI84VIqn/
         uF7gLnORiIhLhRkP/xYM+WIkF1/gjMJAuAyPeHTYFMi4305IlEeSQ0B6zFKvVBal6Obp
         rRCoh2yN8EwZbU9PiWX9dB1AlwZoRkMV4DkDPHJ94frcSrmOOjOpk3bUwfZohGMCj1Rf
         mkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928939; x=1788533739;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uhQeshPW5Emp15I17NYA78rqWHEcwLTPzJHZpx8OGN8=;
        b=HAVfdatwK1qnHs/a5QLsjjidDV18c4PFbjdGlsQ7I+VSawSCTiTwEgR70t9TXpWJeU
         Pbs+KLtlT0cG9nLZwei69DZ15a6iwPfeMYoo34S1delJw8kBAceAiHEd7Q559+WwWxzs
         zEPM8BhiPgj/bdLBPLFMISQzYl+8bHHeK0S5sHGcN0seLuOnMkdmxtvNHB2Fnytr0jqJ
         b1jZ1KIHnQXMrxRdCwtHS2cF0G99Xdvi/SI1R0hsfrumkL5lqLfg9awSqoIS4n7mxP4c
         D6D6DThxnOjsgBhYtN5eOJh0dEko7S1YRkRIvcYJYvkVVYFe0cCWXDWM+SYSDpSi4IEZ
         ki/Q==
X-Gm-Message-State: AFuF++lZf6/64MEoPpOonZxZJOnRVNYr9RleqapQ24gLlpVYmQBHZKOd
	bydCForGk73d8Na8mZxAAREfpqjQ7SFM6BY6VCpOYuSa1CPTWAbgYEo8BfuISFtO
X-Gm-Gg: AR+sD120+Pef93tuMXL+fj/ebKQ1/QphrBY2ACeflx+EvzsPle0rX1v7ybAX+uc7NjQ
	0d/H2uGGtol9dEh9IoSzCpsCaeZH0GUL972XYmJjg/3cntzpgqCAX7ggL8UW/l/SDTOUwkf6GfL
	bSZt164vK6GGEeOn8D8ZGxusiFZyGoWkO67OQfeqMZ4OvvupPXNhthE2fCzeaDk8vLWJuW/EYB2
	Mh7aZfc+c+Sk6L7dC7izk3ZRn/gTeBW4bkStgHDZLLS1Fvg/v42ei0IOo2ga08oehIkn5As7REM
	jTbaXVKY7ZFmA+OD34w8a3/DarCoG7doEaBUInrEJJlBSF/2XcTMBSqkGKGNk6XBiu9+f/UoPdL
	gQ8Q9uq52gJLLJxZgsN0RCDeEo26iXSA55z7M/OQI5uftRxgIMHbcCGupO9UPXq6l1I6zVPvisY
	0PcV/iZPIRY2XPZSbDHKL5XUeCQHoy566hoyKECPP7avHTLOxgIoRzuES3pwxjcBYa3mpGpyPlX
	shUA0p6fLGx1Lh2npTYo8RU7dY+yI3EB2026k/3mB9QDU1nHWFjhVHtWvxJBumqA1+eK4dultpK
	Npm6fw==
X-Received: by 2002:a05:600c:a03:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-49b91c5096dmr98741205e9.15.1787928938279;
        Fri, 28 Aug 2026 07:55:38 -0700 (PDT)
Received: from 12-castle.cable.virginm.net (sotn-17-b2-v4wan-170624-cust457.vm36.cable.virginm.net. [82.14.17.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm65801135e9.2.2026.08.28.07.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:55:37 -0700 (PDT)
From: Martin Kavasi <martin.kavasi3@gmail.com>
X-Google-Original-From: Martin Kavasi <1ai1d7wbz@proton.me>
To: linux-doc@vger.kernel.org
Cc: Martin Kavasi <1ai1d7wbz@proton.me>
Subject: [PATCH] docs: hu_HU: add Hungarian translation of howto.rst
Date: Fri, 28 Aug 2026 15:55:22 +0100
Message-ID: <20260828145523.126668-1-1ai1d7wbz@proton.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an initial Hungarian translation of Documentation/process/howto.rst.

Also add the Hungarian documentation translation infrastructure,
including the hu_HU index and disclaimer, register the translation
directory in Documentation/translations/index.rst, and add a
MAINTAINERS entry for Hungarian documentation.

Signed-off-by: Martin Kavasi <1ai1d7wbz@proton.me>
---
 Documentation/sphinx/translations.py          |  1 +
 .../translations/hu_HU/disclaimer-hu.rst      |  8 +++
 Documentation/translations/hu_HU/index.rst    | 55 +++++++++++++++++
 .../translations/hu_HU/process/howto.rst      | 61 +++++++++++++++++++
 Documentation/translations/index.rst          |  1 +
 MAINTAINERS                                   |  5 ++
 6 files changed, 131 insertions(+)
 create mode 100644 Documentation/translations/hu_HU/disclaimer-hu.rst
 create mode 100644 Documentation/translations/hu_HU/index.rst
 create mode 100644 Documentation/translations/hu_HU/process/howto.rst

diff --git a/Documentation/sphinx/translations.py b/Documentation/sphinx/translations.py
index a03d4402b4f1..feb8b2cf69ef 100644
--- a/Documentation/sphinx/translations.py
+++ b/Documentation/sphinx/translations.py
@@ -22,6 +22,7 @@ all_languages = {
     # Keep the rest sorted alphabetically
     'zh_CN': 'Chinese (Simplified)',
     'zh_TW': 'Chinese (Traditional)',
+    'hu_HU': 'Hungarian',
     'it_IT': 'Italian',
     'ja_JP': 'Japanese',
     'ko_KR': 'Korean',
diff --git a/Documentation/translations/hu_HU/disclaimer-hu.rst b/Documentation/translations/hu_HU/disclaimer-hu.rst
new file mode 100644
index 000000000000..c2ad4695a982
--- /dev/null
+++ b/Documentation/translations/hu_HU/disclaimer-hu.rst
@@ -0,0 +1,8 @@
+:orphan:
+
+.. warning::
+
+    Ha bármilyen kételye van a fordítás tartalmának pontosságával kapcsolatban,
+    az egyetlen hivatalos dokumentáció az angol nyelvű dokumentáció.
+    Ezen felül alapértelmezés szerint a dokumentumokhoz vezető hivatkozások az angol nyelvű dokumentációra irányíthatók, még akkor is, ha van fordított változata.
+    További információért lásd az indexet.
diff --git a/Documentation/translations/hu_HU/index.rst b/Documentation/translations/hu_HU/index.rst
new file mode 100644
index 000000000000..ca38d20b0ba5
--- /dev/null
+++ b/Documentation/translations/hu_HU/index.rst
@@ -0,0 +1,55 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+
+
+======================
+Magyar fordítás
+======================
+.. raw:: latex
+
+    \kerneldocCJKoff
+
+.. _hu_translations_disclaimer:
+
+:maintainer: Martin Kavasi <1ai1d7wbz@proton.me>
+
+Figyelmeztetés
+--------------
+
+
+
+A fordítás célja, hogy megkönnyítse az angoltól eltérő nyelveken történő
+olvasást és megértést. Célja, hogy segítséget nyújtson azoknak, akik nem
+értik az angol nyelvet, vagy bizonytalanok annak értelmezésében. Emellett
+vannak, akik egyszerűen az anyanyelvükön szeretnék olvasni a dokumentációt.
+Kérjük azonban, tartsa szem előtt, hogy az egyetlen hivatalos dokumentáció
+az angol nyelvű dokumentáció: :ref:`linux_doc`.
+
+Nagyon valószínűtlen, hogy a ::ref:`linux_doc` frissítései azonnal
+megjelennek valamennyi fordításban. A fordítások karbantartói és
+közreműködői figyelemmel kísérik a hivatalos dokumentáció változásait, és
+amennyire lehetséges, naprakészen tartják a fordításokat. Emiatt nincs
+garancia arra, hogy egy fordítás mindig naprakész. Ha egy fordításban
+olvasott szöveg nincs összhangban a forráskódban olvasottakkal, kérjük,
+értesítse a fordítás karbantartóját, és ha lehetséges, ellenőrizze az angol
+nyelvű dokumentációt is.
+
+A fordítás nem a hivatalos dokumentáció elágazása, ezért a fordítások
+felhasználói nem találhatnak a hivatalos angol nyelvű dokumentációtól
+eltérő információkat. Bármilyen tartalom hozzáadását, eltávolítását vagy
+frissítését először az angol nyelvű dokumentumokon kell elvégezni.
+Ezt követően, amennyiben lehetséges, ugyanazt a változtatást a fordításokon
+is alkalmazni kell. A fordítások karbantartói csak olyan közreműködéseket
+fogadnak el, amelyek kizárólag fordítással kapcsolatosak (például új
+fordítások, frissítések és javítások).
+
+A fordítások a lehető legpontosabbak próbálnak lenni, azonban egy nyelvet
+nem lehet közvetlenül minden más nyelvre leképezni. Minden nyelvnek megvan
+a saját nyelvtana és kultúrája, ezért egy angol nyelvű kijelentés fordítását
+szükség lehet a célnyelvhez igazítani. Emiatt a fordítások olvasásakor
+előfordulhatnak olyan kisebb eltérések, amelyek ugyanazt az üzenetet más
+formában adják át.
+
+Ha kapcsolatba szeretne lépni a Linux közösségével, de nem érzi magát
+magabiztosnak az angol nyelvű írásban, segítségért fordulhat a fordítás
+karbantartóihoz.
diff --git a/Documentation/translations/hu_HU/process/howto.rst b/Documentation/translations/hu_HU/process/howto.rst
new file mode 100644
index 000000000000..f0d1efa37f9c
--- /dev/null
+++ b/Documentation/translations/hu_HU/process/howto.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _process_howto:
+
+.. include:: ../disclaimer-hu.rst
+
+:Original: :ref:`Documentation/process/howto.rst <process_howto>`
+:Translator: Martin Kavasi <1ai1d7wbz@proton.me>
+
+HOGYAN fejlesszünk Linux-kernelt
+================================
+
+Ez a témával kapcsolatos legátfogóbb dokumentum. Útmutatást ad ahhoz,
+hogyan válhat valaki Linux-kernel fejlesztővé, valamint hogyan sajátíthatja
+el a Linux-kernel fejlesztői közösséggel való együttműködéshez szükséges
+ismereteket. Nem próbálja a kernelprogramozás technikai részleteit
+bemutatni, hanem abban segít, hogy megtaláld a megfelelő kiindulópontot.
+
+Ha a dokumentumban található információk elavulnak, kérjük, küldj javítást
+a fájl karbantartójának, akinek a neve a dokumentum alján található.
+
+
+Bevezetés
+---------
+
+Tehát szeretnéd megtanulni, hogyan válhatsz Linux-kernel fejlesztővé?
+Vagy a vezetőd azt mondta: „Írj egy Linux-illesztőprogramot ehhez az
+eszközhöz.” Ennek a dokumentumnak az a célja, hogy megtanítson mindarra,
+amire ennek eléréséhez szükséged van: bemutatja a követendő folyamatot,
+és tanácsokat ad a közösséggel való együttműködéshez. Megpróbálja azt is
+elmagyarázni, hogy a közösség miért úgy működik, ahogyan működik.
+A kernel többnyire C nyelven íródik, néhány architektúrafüggő része pedig assembly nyelven. A kernel fejlesztéséhez elengedhetetlen a C nyelv alapos ismerete. Az assembly nyelv ismerete — bármely architektúra esetében — nem szükséges, kivéve, ha az adott architektúrához alacsony szintű fejlesztést tervezel.
+
+Bár az alábbi könyvek nem helyettesítik a megfelelő C nyelvű képzést és/vagy a többéves tapasztalatot, referenciaanyagként hasznosak lehetnek:
+
+    "The C Programming Language" — Kernighan és Ritchie [Prentice Hall]
+    "Practical C Programming" — Steve Oualline [O'Reilly]
+    "C: A Reference Manual" — Harbison és Steele [Prentice Hall]
+
+A kernel a GNU C-t és a GNU eszközláncot használja. Bár megfelel az ISO C11 szabványnak, számos olyan kiterjesztést használ, amelyek nem részei a szabványnak. A kernel önálló C-környezetként működik, és nem támaszkodik a szabványos C-könyvtárra, ezért a C szabvány bizonyos részei nem támogatottak.
+
+Tetszőleges long long típusú osztás és lebegőpontos műveletek nem engedélyezettek. Időnként nehéz lehet megérteni, milyen feltételezéseket tesz a kernel az eszközlánccal kapcsolatban, illetve milyen kiterjesztéseket használ. Sajnos ezekhez nincs egyetlen, mindenre kiterjedő referencia. További információért kérjük, tekintsd meg a GCC információs oldalait (info gcc).
+
+Ne feledd, hogy azt próbálod megtanulni, hogyan működj együtt a már
+létező fejlesztői közösséggel. Ez egy sokszínű közösség, amely magas
+elvárásokat támaszt a kódolással, a stílussal és a munkafolyamatokkal
+szemben. Ezek a szabályok és elvárások idővel alakultak ki, annak
+tapasztalatai alapján, hogy mi működik a legjobban egy ilyen nagy és
+földrajzilag szétszórt csapat esetében.
+
+Próbálj meg előre minél többet megtanulni ezekről az elvárásokról, mivel
+jól dokumentáltak; ne várd el, hogy mások alkalmazkodjanak hozzád vagy a
+céged munkamódszereihez.
+
+Jogi kérdések
+
+A Linux kernel forráskódja a GPL licenc alatt kerül kiadásra. Kérjük, tekintsd meg a forrásfa főkönyvtárában található COPYING fájlt. A Linux kernel licencelési szabályait, valamint az SPDX <https://spdx.org/>_ azonosítók forráskódban történő használatát a :ref:`Documentation/process/license-rules.rst <kernel_licensing>` dokumentum ismerteti. Ha további kérdéseid vannak a licenccel kapcsolatban, fordulj ügyvédhez, és ne tedd fel ezeket a Linux kernel levelezőlistáján. A levelezőlisták résztvevői nem ügyvédek, ezért jogi kérdésekben ne hagyatkozz a kijelentéseikre.
+
+A GPL-lel kapcsolatos gyakori kérdésekre és válaszokra vonatkozóan lásd:
+
+https://www.gnu.org/licenses/gpl-faq.html
diff --git a/Documentation/translations/index.rst b/Documentation/translations/index.rst
index b6d24f6f17d1..5f85388a83d9 100644
--- a/Documentation/translations/index.rst
+++ b/Documentation/translations/index.rst
@@ -14,6 +14,7 @@ Translations
    ko_KR/index
    pt_BR/index
    sp_SP/index
+   hu_HU/index
 
 .. _translations_disclaimer:
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 55b3c2d7a78a..708773408215 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12110,6 +12110,11 @@ F:	mm/hugetlb_vmemmap.c
 F:	mm/hugetlb_vmemmap.h
 F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 
+HUNGARIAN DOCUMENTATION
+M:	Martin Kavasi <1ai1d7wbz@proton.me>
+S:	Maintained
+F:	Documentation/translations/hu_HU/
+
 HVA ST MEDIA DRIVER
 M:	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
 L:	linux-media@vger.kernel.org
-- 
2.55.0


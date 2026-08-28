Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168A42049A
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 14:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928969; cv=none; b=T0lqW++vfQl0PA1iAl2SQXw/tVPTwRFatbyqTaiFuFLBjAmLaCw0S9t/ZPq5tx9baHoo3IABgOUmBd1488vSlvMuHK4QlV4YgOyDs4+zv1WngdRygI+M+AYg5b3cGthbJj7TIq72bQpr8PhpA9UThh1RspiRVW/Eg9LskV6628A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928969; c=relaxed/simple;
	bh=Ov8NVQEXcy9rj5BMzVzmuFiISvUzIKlZ6UGfBO3Adfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tgz2TiiKlhMhbwQqnyRhzCdeSigABNnpDnv4ve60J6/ZLcgOd1vfvtnOyuTKAmvsa3Fi8d6VClWWi8qBXXtmDOHdA4vCv+eMElY38Kee7xWqCAY/kGFoH7MyQN8qv0S0TtIz2+YiUV2Ql7+l/jMjV64DRXiXK0jqWo3A3HeJTG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=obFZHp8b; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obFZHp8b"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e1bfcc63so807475f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 07:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787928965; x=1788533765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhQeshPW5Emp15I17NYA78rqWHEcwLTPzJHZpx8OGN8=;
        b=obFZHp8bjxEozdpNUrLFVyntoHoOVRcR8y53Yk04EMLhxj/0eR9fFz8o022lLbu41D
         TImgSbvhmjO9QJthB0SkDKKomMA849PXhehvCUcUh86SjQxYNcDwIw4o+e78JtpwOX39
         6C/dvNHfTR/k91p4igQVL2xyYAJvV1dD5VG8+JWFQ8Anktwze5ts7N08vlNlt2+Av1Mb
         z7BpoC/VJebgASS8DYg2N3G5mSqfJkNT+qaG3DN1jLz/yBh2aLuBGC0rNcxD5fZnT1mG
         QRFz5d11zNjc4dWVcImLf6xzrJkKHrzUH4WV3gi24RETk33FEwPJ4m1F6iXZjlor+3sk
         lgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928965; x=1788533765;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uhQeshPW5Emp15I17NYA78rqWHEcwLTPzJHZpx8OGN8=;
        b=fYpkRBP3Ikucv2pZM+zP7kRc1m+jNtJRIfFVOPY0eT5+YLQhTaW3XDeScSvXfOZCrK
         bb4b+VbsJzjNrYIcPbRvOL9AWJybeG+7sKkZ/KyWbMf67LzBi0FZrB2T6MFjSnDyK6em
         TUXKQ4/T4wswc8YgXBIH2mtpKqWlXPLMaqfsbZe8Zaj4Tjxw2Me61541Gyu5oAs392Ox
         T+wIWysChJE9rRJnXclEgGHoPT2qtP5HU3+xOEl+hd+qWp59s224WI+iRthWYhap/YJ9
         ceas4FDMCxoWxIDXAGIB5VunmgfISb6DASe6HO+EIYFAPhDlGeOJuU2Je2eBDt/Q5o1r
         WrTw==
X-Gm-Message-State: AFuF++l+IoJkB7FsqbgXV3x74FaKdrFW3bjHapNBQiMkesCkdz28ck4a
	EpbZF7wlR1FyC5QXGTVO6Yp0YH73NXP8JeNTBiOeoQIKUDL7W4Jn+Kq3nxDM//Im
X-Gm-Gg: AR+sD13RRRy3lCJDdLJjKW4KVUaU3X/YiuE0xAradYw6uG46n/AT+2Mb1v5Lvqx/zKl
	iWXOUMx7vS24Z4qDEqi9aTNjye/qztw6ya/we2ifj43Dw6kSrGJASl6KqhPHfSl9V6KuThHyRNz
	uoGu5D9S0ITn3O3EV6yL3K5f6jf5KD7DtEf4aB4tnn2i+XRo6DR+kEfEppAQyDdYig+4XKi4yum
	GwdPzNykVEHxyAGEp5AEnCqtFvgL+PqSx1r5d/DQHoQHWSot+owbJKjt6b5ow03jGZori6964Ef
	JIGEnU+rGzht2ccQMInbXKl1n6tR3ESJDbT0X3Od0DAZImwoiviTj+2KcWEVIhVzYh/JkQfALh8
	rTrXNR0HJ5+OUJawXRmBWGN6N88k/vMMLXWKWRjn4Yj+SSf+jrOw1aoNPXica/BXGoUbhfnzH6/
	V+ysSnY8zf26/5XGz0oL02GpOTC566+o7IIIeXlgA6XCb0wbvmJgVXSmE6vRRq3qqLsSvJA2Om1
	VikGpwaWxcrOyiLM2uj++aBdjkdhERmWqNlrEj/s5VI2wT2QZJzt5eCBj9hkPTtOCysOc0=
X-Received: by 2002:a05:6000:3105:b0:481:562d:6fb1 with SMTP id ffacd0b85a97d-483008190b4mr686543f8f.6.1787928964854;
        Fri, 28 Aug 2026 07:56:04 -0700 (PDT)
Received: from 12-castle.cable.virginm.net (sotn-17-b2-v4wan-170624-cust457.vm36.cable.virginm.net. [82.14.17.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm4647561f8f.3.2026.08.28.07.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:56:04 -0700 (PDT)
From: Martin Kavasi <martin.kavasi3@gmail.com>
X-Google-Original-From: Martin Kavasi <1ai1d7wbz@proton.me>
To: linux-doc@vger.kernel.org
Cc: Martin Kavasi <1ai1d7wbz@proton.me>
Subject: [PATCH] docs: hu_HU: add Hungarian translation of howto.rst
Date: Fri, 28 Aug 2026 15:56:00 +0100
Message-ID: <20260828145601.126769-1-1ai1d7wbz@proton.me>
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


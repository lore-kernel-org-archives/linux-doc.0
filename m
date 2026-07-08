Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7EE246770
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516021; cv=none; b=h0X6DwqFPtK1iAB6DcA09IPeRS28JorosEJ5LPIZREC1q6Ma+GrUCsgSsjLP+6Hn6kYXwfc68BSrlRbrgWlu8vyvkYvnaiDr0ynZ16R/FZ4SoZRptZOigHY4rRxWYgrITcYzQO9SMCh+MUVyj9qnwMPvwDrp/POUhgHhLhYMZ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516021; c=relaxed/simple;
	bh=ypK3AIpxQwm8fclgl/LYM7JWfJS+m8PZmdWHNPnhXAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r79rznU7e6KG/jdiM6O4yse2RjIionGWnUt06tEBuxZxGReRwjqRkIQmuVV6buYrcs687FPb7CLHxYCV87sD11QjzDpUiKGVeq3NBS+McibYjfs9FphB0ldFHAw0NhH/xD+BPw6chILP4ts6nNlU7LT13o3QKgXeiDjN2QRIrVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mm1n6pxp; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mm1n6pxp"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso367607a12.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 06:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783516019; x=1784120819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s74v2avsJlcuWUXv/SP6LYjG4ujBbKcJtdg+IdFhrXc=;
        b=mm1n6pxpPkrTBNi0SU2DOy2cktsmzA92GMxAiTuxxfc6853g8xAbFimUL16x6pPTDQ
         QqPHQEHXNkK4V3A+lEmF3OKMkN+2Av7r3eDSlaBiI1/F+1MODfc7KHcI5lWoVPW5Xwm1
         xNNb6lH3ENrtCOD6xWkUCcpinBSRNkIcDouA7tGph6TfHvgTCe6BXYROKC4borUEPVkm
         K1lACSBS4iCB4WjdeDBtVQ+N/iL+39GQXwDaQbfI6ZGOIeWBhdT9vekrLv9VpEBc13NJ
         7wAaw1ZF5HoRhcgQHEC5qSKYHDmdV7jxJUs0zd9Tu3Dji9TR9vfkh0GSpfihmA1M2reg
         Ya4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516019; x=1784120819;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s74v2avsJlcuWUXv/SP6LYjG4ujBbKcJtdg+IdFhrXc=;
        b=gNWcw3j/wy4TDdo2KPFnQTDcKahjjASU6GB0YItYdJsCANzbObRq2mjZS2EWs0k9Lm
         b+Gk1tbF5lySnaRu7tkbzZnnbMvQfdGV6UHXUnsNM4YCEfuSaAyRLJ0wA9U0ISedt1Xk
         3ZX2As07rTOstVyI4pkETgEGGvpTcvM3ZFokTTk6VO7u7hFokkwFbN2JhvvGr02WstZG
         260gQOxq45QRDBtKkfzln6ibwlgMn7wusD/Qk1OS7UqlEyoP33CKIaVh86pXIEOvjiK+
         FfMUh2Xq4OlZhTRUNkUjI9LiFddiKe4U4BQEMKdnT93rlNY8Ti3TANkyVbDRIBBcHsxY
         OVrA==
X-Gm-Message-State: AOJu0YzmlVOjarV6Z+CGFknH+fZvZOCG8qiRG+1mbtjsPKqCiAgYg9jE
	z6DZ5ocFTji0DtVEwOSFcGs+zScYSefQ4tJxHuSSSeevgFAHg52LgbKyo46GIIf4192xgyk5
X-Gm-Gg: AfdE7ckHfyOcvD9BjkQ13D2vBL3C64lHauqxyd3Aew8cOgAOoynn9PDG7D4loLZarP3
	L9lkR95omxYXuhfqKY7b7FkkG3qobv+HjWOyxJbF9mSLriYS+C9PBl6sb8RYto9sZ9Z0eutYUth
	jdfiVM0DKnVvYnPdIHt0teZ7gqG6mMCipqvAt1t9Iqocdcvo/SbVukPZ+8nV+QFqKM9/N/Y2WGS
	6gUsrP3cDogYmGTkQ2gR7lj+wkPaNSb9cI1SXN9jB6CSmqTqUaXTtIRH52nB5E5nZm+Pq/mvqOo
	lZaBzKZe1s22gb+T18l5MI91IdUK2SI6RV9qhZ3n1Nu4xxfbPOtUsuCgguQzKKB6W9HdXA0kPtz
	izPillGIxBAIBCs8+nBNBFXw2FlZ+LTxKzdG0jnhNbHmOncwHSg03cmSUoEkpTFAqSPOu7d78lb
	J1E/TVplWPr6LFzmiREXCM8S7hkwR5NVYSniN3n0MUvwxK3r20wqfvSpI=
X-Received: by 2002:a05:6a20:c996:b0:3bf:65b7:22d9 with SMTP id adf61e73a8af0-3c0bcb7e30bmr3442031637.41.1783516019356;
        Wed, 08 Jul 2026 06:06:59 -0700 (PDT)
Received: from fedora ([2804:14c:a8:965f::1f2c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8572sm20305843c88.9.2026.07.08.06.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:06:58 -0700 (PDT)
From: Igor Giamoniano <igorgphotoarte@gmail.com>
To: danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org,
	Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: [PATCH] docs: pt_BR: process: Translate the kernel driver statement
Date: Wed,  8 Jul 2026 10:05:56 -0300
Message-ID: <20260708130558.12604-1-igorgphotoarte@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/kernel-driver-statement.rst into Brazilian
Portuguese, keeping the reStructuredText formatting and the list of
signatories unchanged.

Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>
---
 .../pt_BR/process/kernel-driver-statement.rst | 205 ++++++++++++++++++
 1 file changed, 205 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/kernel-driver-statement.rst

diff --git a/Documentation/translations/pt_BR/process/kernel-driver-statement.rst b/Documentation/translations/pt_BR/process/kernel-driver-statement.rst
new file mode 100644
index 000000000..5a8a8f41d
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/kernel-driver-statement.rst
@@ -0,0 +1,205 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Declaração sobre Drivers do Kernel
+----------------------------------
+
+Posicionamento sobre os Módulos do Kernel Linux
+===============================================
+
+
+Nós, os desenvolvedores do kernel Linux abaixo assinados, consideramos
+qualquer módulo ou driver de código fechado para o kernel Linux
+prejudicial e indesejável. Repetidamente, constatamos que eles são
+nocivos aos usuários do Linux, às empresas e ao ecossistema Linux como
+um todo. Tais módulos negam a abertura, a estabilidade, a flexibilidade
+e a manutenibilidade do modelo de desenvolvimento do Linux e privam
+seus usuários do conhecimento da comunidade Linux. Fornecedores que
+oferecem módulos de kernel de código fechado forçam seus clientes a
+abrir mão de vantagens fundamentais do Linux ou a escolher novos
+fornecedores. Portanto, para aproveitar plenamente a economia de custos
+e os benefícios de suporte compartilhado que o código aberto tem a
+oferecer, incentivamos fortemente para que os fornecedores adotem uma
+política de dar suporte a seus clientes no Linux com código de kernel
+de código aberto.
+
+Falamos apenas por nós mesmos, e não por qualquer empresa para a qual
+possamos trabalhar hoje, tenhamos trabalhado no passado ou venhamos a
+trabalhar no futuro.
+
+ - Dave Airlie
+ - Nick Andrew
+ - Jens Axboe
+ - Ralf Baechle
+ - Felipe Balbi
+ - Ohad Ben-Cohen
+ - Muli Ben-Yehuda
+ - Jiri Benc
+ - Arnd Bergmann
+ - Thomas Bogendoerfer
+ - Vitaly Bordug
+ - James Bottomley
+ - Josh Boyer
+ - Neil Brown
+ - Mark Brown
+ - David Brownell
+ - Michael Buesch
+ - Franck Bui-Huu
+ - Adrian Bunk
+ - François Cami
+ - Ralph Campbell
+ - Luiz Fernando N. Capitulino
+ - Mauro Carvalho Chehab
+ - Denis Cheng
+ - Jonathan Corbet
+ - Glauber Costa
+ - Alan Cox
+ - Magnus Damm
+ - Ahmed S. Darwish
+ - Robert P. J. Day
+ - Hans de Goede
+ - Arnaldo Carvalho de Melo
+ - Helge Deller
+ - Jean Delvare
+ - Mathieu Desnoyers
+ - Sven-Thorsten Dietrich
+ - Alexey Dobriyan
+ - Daniel Drake
+ - Alex Dubov
+ - Randy Dunlap
+ - Michael Ellerman
+ - Pekka Enberg
+ - Jan Engelhardt
+ - Mark Fasheh
+ - J. Bruce Fields
+ - Larry Finger
+ - Jeremy Fitzhardinge
+ - Mike Frysinger
+ - Kumar Gala
+ - Robin Getz
+ - Liam Girdwood
+ - Jan-Benedict Glaw
+ - Thomas Gleixner
+ - Brice Goglin
+ - Cyrill Gorcunov
+ - Andy Gospodarek
+ - Thomas Graf
+ - Krzysztof Halasa
+ - Harvey Harrison
+ - Stephen Hemminger
+ - Michael Hennerich
+ - Tejun Heo
+ - Benjamin Herrenschmidt
+ - Kristian Høgsberg
+ - Henrique de Moraes Holschuh
+ - Marcel Holtmann
+ - Mike Isely
+ - Takashi Iwai
+ - Olof Johansson
+ - Dave Jones
+ - Jesper Juhl
+ - Matthias Kaehlcke
+ - Kenji Kaneshige
+ - Jan Kara
+ - Jeremy Kerr
+ - Russell King
+ - Olaf Kirch
+ - Roel Kluin
+ - Hans-Jürgen Koch
+ - Auke Kok
+ - Peter Korsgaard
+ - Jiri Kosina
+ - Aaro Koskinen
+ - Mariusz Kozlowski
+ - Greg Kroah-Hartman
+ - Michael Krufky
+ - Aneesh Kumar
+ - Clemens Ladisch
+ - Christoph Lameter
+ - Gunnar Larisch
+ - Anders Larsen
+ - Grant Likely
+ - John W. Linville
+ - Yinghai Lu
+ - Tony Luck
+ - Pavel Machek
+ - Matt Mackall
+ - Paul Mackerras
+ - Roland McGrath
+ - Patrick McHardy
+ - Kyle McMartin
+ - Paul Menage
+ - Thierry Merle
+ - Eric Miao
+ - Akinobu Mita
+ - Ingo Molnar
+ - James Morris
+ - Andrew Morton
+ - Paul Mundt
+ - Oleg Nesterov
+ - Luca Olivetti
+ - S.Çağlar Onur
+ - Pierre Ossman
+ - Keith Owens
+ - Venkatesh Pallipadi
+ - Nick Piggin
+ - Nicolas Pitre
+ - Evgeniy Polyakov
+ - Richard Purdie
+ - Mike Rapoport
+ - Sam Ravnborg
+ - Gerrit Renker
+ - Stefan Richter
+ - David Rientjes
+ - Luis R. Rodriguez
+ - Stefan Roese
+ - Francois Romieu
+ - Rami Rosen
+ - Stephen Rothwell
+ - Maciej W. Rozycki
+ - Mark Salyzyn
+ - Yoshinori Sato
+ - Deepak Saxena
+ - Holger Schurig
+ - Amit Shah
+ - Yoshihiro Shimoda
+ - Sergei Shtylyov
+ - Kay Sievers
+ - Sebastian Siewior
+ - Rik Snel
+ - Jes Sorensen
+ - Alexey Starikovskiy
+ - Alan Stern
+ - Timur Tabi
+ - Hirokazu Takata
+ - Eliezer Tamir
+ - Eugene Teo
+ - Doug Thompson
+ - FUJITA Tomonori
+ - Dmitry Torokhov
+ - Marcelo Tosatti
+ - Steven Toth
+ - Theodore Tso
+ - Matthias Urlichs
+ - Geert Uytterhoeven
+ - Arjan van de Ven
+ - Ivo van Doorn
+ - Rik van Riel
+ - Wim Van Sebroeck
+ - Hans Verkuil
+ - Horst H. von Brand
+ - Dmitri Vorobiev
+ - Anton Vorontsov
+ - Daniel Walker
+ - Johannes Weiner
+ - Harald Welte
+ - Matthew Wilcox
+ - Dan J. Williams
+ - Darrick J. Wong
+ - David Woodhouse
+ - Chris Wright
+ - Bryan Wu
+ - Rafael J. Wysocki
+ - Herbert Xu
+ - Vlad Yasevich
+ - Peter Zijlstra
+ - Bartlomiej Zolnierkiewicz
-- 
2.55.0


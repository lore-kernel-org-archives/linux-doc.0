Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3399C3E0C7B
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 22:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783636201; cv=none; b=PEus1aQYA5wzw3oDc5uUGW2fregUjajYzJ9x8Y5/HTBk8ztR9MZPldDgCW2utZr6ghz1MPbK1wtWQDUhIeWhH0+bSsdv4JHM4HgcW3q05v919F/VdWVh7rOOkrwG8n+V2gWAkesrSRLidA9k7vg5FXM8vgenOhA0fvKeQ5g3bb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783636201; c=relaxed/simple;
	bh=bcR5dYh8iZpgFZFxX0g11L+N1uVm+iChOGVLF9xcbDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d2F2dVwwDeg0Owta9zDnYB5sfe7AXMasRYO6lH70ZnHnVnUgRoIAihtKbMh6SW+2M2hGZD7cDE1nrY2zJtFZcWmPYHlAMjE1QBBotX+31TSi+gQF0vKy0msOOcVuQBGvyfoCWVLVLjG+FVpJfoSvYJky5wm5KI5xNUv3bS3VSwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWpBv2eK; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWpBv2eK"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-80a123ef90aso6433137b3.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 15:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783636199; x=1784240999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UbldS1xxbRB4979IQVoN62m+o5/K8lDZ7Nq+UDTK0rk=;
        b=mWpBv2eK/WRyTH84aEnieJ2jeVw8z81IPLSu6U8m7tEGrDMdNHnOaYkVH1MXBrt7Vd
         zkoN30QQUgIYvFU8rrSHCQf1TMQiLFrHzstLp3lKmCyNa8wExyKHA+5yb+9jgPURRVX1
         TQjGd4CvXBgcanEhuYJ39DDA5hg4MZhVhQec/2c4gf/whsuOBTl46EsFTRE+Vv4xCOiN
         A1m0mHKtVW2Unz4lIj/4YK0QrrHZgSnl8M74lBi6exEgeTpkY4h751/FeRU+fxLt7suN
         9kk8ylGy4mRq68VaFWqeBMq2+EpObUt1Hxa8A9Kh2mNGpYBmsJeYn8dF4CENpqF7l1gk
         tIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783636199; x=1784240999;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbldS1xxbRB4979IQVoN62m+o5/K8lDZ7Nq+UDTK0rk=;
        b=sjuQBcXaoUz/hCsk1Koqe5WFiCRqe0OhwjW86OfmDOFXoexOmS0WKgoly8W9k1wGSz
         ovcJWjuB1pcWwPRk/tt6STM2UBIbjQAagvK5HIeDgM6mACz0h+8LRKOyVZwO0PCsUs2v
         Hua6HGwCh3D1EMscxZ+epOgCgbBcAp2Oy/oyE4wS1jb+TQjJ4SLUPwKs08qgehaMKIXk
         EqsJIOmzBXCLoelBFWB271y0Jc33UdnAcu/q8FS0USv5ZT5VM30VkNoSyWDDIeKysML3
         W9iqPO4kkzL7Ng3efZ31fLWdci4UDEWbvEbl+i4pvbdihPXmlcR45KM7aYlR29/DM2nF
         Fjqw==
X-Gm-Message-State: AOJu0YwV3GqzcbIuVou5EOCwf3eNniQBTLGMX1decaKWuDNZPjVH7n6g
	iUYW0mxWzXtQezwlqhKjy5lXKQ/0+ALRZIyTd9yqEExq1I0nE3Htse18y5Ks9EnJbnF4iQ==
X-Gm-Gg: AfdE7cnFVhSYhrjROjYcxDTmN7xyUWetZYfPQkMZyON8jnkHS+jvDzA7UszPDISh2rh
	nx4gCOr2AkNok2zAKrN2V44LLSvR9GGTCbisLwiuCHWDCXzlus1XWLskxCf7JyDhaopBsgfyv6+
	IrOuHhKqzUme5YvfPNBvOTtO1KiR0ZzUnYPezHTDbNwiwK8IYEhiV8AuUhSOzS/77W0LPPhyni/
	gCo7/cneye7YziisBr+VOl1HF1b4Qn9AtskaJNTnRCgt/p5mqidVy6KiFLJJnTrCa3SlBCe/6+W
	nk/uviHPnHXzEjpNtdHeu6VCNvZdln2uvbEiycJxL04jip+8gEGdammelgfDzFeR86TvbxMqwXl
	m2q/bept3dLpi39/IzFbIT+BnT7FBHTAeGNf2kJKYcDCMgzDnr43FYJxTlsTIqyUDw7shK/vM1X
	S6ZTKQKVYF93CkJiFyuRsEcNvd6YULZB6YfOgb8MB6mnFPFEmFjLVHshs=
X-Received: by 2002:a05:690c:4a0a:b0:81e:6b13:445f with SMTP id 00721157ae682-81e7c021359mr9317177b3.23.1783636199010;
        Thu, 09 Jul 2026 15:29:59 -0700 (PDT)
Received: from fedora ([2804:14c:a8:965f::1f2c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bf653desm31232837b3.17.2026.07.09.15.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 15:29:58 -0700 (PDT)
From: Igor Giamoniano <igorgphotoarte@gmail.com>
To: danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org,
	Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: [PATCH v2] docs: pt_BR: process: Translate the kernel driver statement
Date: Thu,  9 Jul 2026 19:29:51 -0300
Message-ID: <20260709222953.9900-1-igorgphotoarte@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708130558.12604-1-igorgphotoarte@gmail.com>
References: <20260708130558.12604-1-igorgphotoarte@gmail.com>
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
Changes since v1:
 - Add the translated file to Documentation/translations/pt_BR/index.rst
   so the document is linked from the main pt_BR index (fixes the
   "document isn't included in any toctree" build warning).

 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/kernel-driver-statement.rst | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/kernel-driver-statement.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 7a488f662..dab5324a6 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -78,3 +78,4 @@ kernel e sobre como ver seu trabalho integrado.
    Processo do subsistema SoC <process/maintainer-soc>
    Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
    Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
+   Declaração sobre Drivers do Kernel <process/kernel-driver-statement>
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


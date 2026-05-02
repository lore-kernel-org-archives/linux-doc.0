Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E62231A21;
	Sat,  2 May 2026 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777727511; cv=none; b=OSRkUg7nYAevOeG5lyH/uQhABaty2LMTFXhK3M5wjZ0qBnhz2aHboQSBqjSZgGajxScXDPpRpDRtoR538pHJb6HjCqkRw7iCjNQjj0BKsXHE83Z7FT6X96Z8UjraMA8fCx7FCDbtecM2wmYOImQzzAlUJ9RhpCkU6YM7wD0ErX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777727511; c=relaxed/simple;
	bh=e1N4m6u1RXhHEgrMbRL5Hit2PwQ/PnnbyhfX4OfIy94=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=Zc+VNq6w4jSLl7wVaJX+wAt4aN8QcRy3IZCVZCHedgH/F9WafWXcvVnKdpmu63F6ZMZ8VqhiayjyVXNqr6BqR/esBgvRliHRdjpTVXy+eCzx74NVArUM6b/FcVfR7PVs3ti9DNMrMYUEuR01m/vcck7/ne32Mn3/5yKa3hxIQzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zCh1lT/R; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zCh1lT/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777727506; bh=Rs6PH5xORtpvAnLVunLuwWCadyaJ9F0pzWFrt8AjOew=;
	h=From:To:Cc:Subject:Date;
	b=zCh1lT/R/Rl4sZx6stje9AgOzqG+kKWTiv9oqkNMZF6/zuniL44erzdSnH0v02aw+
	 hNq33am8ZLkv6bwdGqpkFx/VzYDCTId0KnFD0z0+ZEH0FARAiNbdq5mf1Z4Rs7GePv
	 Q/2EpuWbyUGM/DbywGEga1EqwLLXfDSGrfkL1n6A=
Received: from Lang.smartont.net ([2409:8a44:2312:14e1:56d8:1e1e:3f0b:d0f3])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 2E98561F; Sat, 02 May 2026 21:11:41 +0800
X-QQ-mid: xmsmtpt1777727501tam3rjmow
Message-ID: <tencent_B98271DD90AC356719E15C06ACE473BB820A@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuqFe3eCViNrhg78vMOwGNq069yhzN5EJe0BOF18VDF915siN3cb
	 RA8Ka4h/q12sM3zXPWEVlv0L3Okzg0jMY8r6UgRHA18tka5K7QTfT0SkzDIfmwbzyolb1INFEZ9v
	 bC5C3TsiVu/Z4MLUctPg4YyRLYnals1EXoEj9XhbQkb3sUzAvkRzBRzS1BUUxVPDV1w+c6TrXnOV
	 NcWzWQKk/l3ZY+IdtjAkldvSz+QWiYZ3zyeyyruxxsY2SNhkfK4i4+D3e4NnENDtkXf8JW7eEI+/
	 nxwb01lF9sUM+LgskaQRB9BKzpy3yaFiu5PYkBdQgX1e2m4ee4QJ2bBCSKW5b0PPio7A+sHIQra/
	 6JorD0sxkSBrWGSt6F5lh+EmmZlp+gNcxv3MHIEAi9WOmJjbR7AtFnwXRj0KdDIyCJbbdf46O8eP
	 rHSdfwOORALO7Q/uz2FLUi+Upax4GAZdADC8ZNYAH11VeWQPJErJVeTsy3NmOotoxDefmVCrwgu5
	 jEgKlYMrnZ4eymMUmYzs5VfwG01956BW7f3Bwt1KGN/bLT7GRNhwf9vpPLcqO02YbexmXX6UQam3
	 Eix7kNTUlxGS6pmvgM/lkBu4+nyvzRbGQbgBXlUJgRyZOf5zvRb/F6BUSiZK+oXPRZrCUawZ5oVZ
	 box6HAkJ5iqjucgvVUtycYyg3uZREu/nUorW2qQfbf8rkXOAucWQKAbQek7f0T0CUfVOfH/CgT0/
	 nFzVAng/Pf2gAoS/f5pShgdMdtb1xQXs53v4pdfHoCVWtJhy9DgJsbJdIIZ6Xrs3j3Uc4LvY/P3h
	 YUl6dOlCA/GXX+TRPkGz/CLvzUzhUYvO7jFmM0utjE+Fxzmbah9IiGBe5jnmiHvdhFRIw+SllRiQ
	 syOQLEb/+/DdXPYcYUJB3tP2c/l4aSHU6CsDCH1ajwjvDXtD3kI8rhror0WDY7Wja3dKb5YlIM22
	 h/nBUdBXehY8sCnqn/U+1C8Gqbgwsvr13ib2jHnWOskRPCKiZLnNKmFbH+tXVSdVbwNYzMXSvDjL
	 NIX/cauAqvAk7M6aCUioJHhGkPb+uhqdDkC0wYlt5utVNugr5MiCZR3Pp0jTvkd5TOmcvcEm8LXF
	 oFWdOveBo9X46rRiWXMIPw3DZEnctzCpLhgVuxlf368Oi20fs=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Wang Zihan <jiyu03@qq.com>
To: linux-doc@vger.kernel.org
Cc: federico.vaga@vaga.pv.it,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	carlos.bilbao@kernel.org,
	avadhut.naik@amd.com,
	linux-kernel@vger.kernel.org,
	Wang Zihan <jiyu03@qq.com>
Subject: [PATCH] Documentation: translations: Fix "Linux Torvalds" -> "Linus Torvalds"
Date: Sat,  2 May 2026 21:11:41 +0800
X-OQ-MSGID: <20260502131141.671435-1-jiyu03@qq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the misspelling of Linus Torvalds' first name in Italian
and Spanish translations.

Also fix "Linus Torvald" -> "Linus Torvalds" (missing 's') in
Italian translations.

Found by Christian Marillat.

Signed-off-by: Wang Zihan <jiyu03@qq.com>
---
 Documentation/translations/it_IT/process/2.Process.rst        | 2 +-
 Documentation/translations/it_IT/process/adding-syscalls.rst  | 2 +-
 Documentation/translations/it_IT/process/howto.rst            | 2 +-
 .../translations/it_IT/process/submitting-patches.rst         | 2 +-
 Documentation/translations/sp_SP/process/2.Process.rst        | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/translations/it_IT/process/2.Process.rst b/Documentation/translations/it_IT/process/2.Process.rst
index 6262c3908..38e1a154d 100644
--- a/Documentation/translations/it_IT/process/2.Process.rst
+++ b/Documentation/translations/it_IT/process/2.Process.rst
@@ -53,7 +53,7 @@ raccolti e, verificati in anticipo.  Il funzionamento di tale procedimento
 verrà descritto dettagliatamente più avanti).
 
 La finestra di inclusione resta attiva approssimativamente per due settimane.
-Al termine di questo periodo, Linus Torvald dichiarerà che la finestra è
+Al termine di questo periodo, Linus Torvalds dichiarerà che la finestra è
 chiusa e rilascerà il primo degli "rc" del kernel.
 Per il kernel che è destinato ad essere 5.6, per esempio, il rilascio
 che emerge al termine della finestra d'inclusione si chiamerà 5.6-rc1.
diff --git a/Documentation/translations/it_IT/process/adding-syscalls.rst b/Documentation/translations/it_IT/process/adding-syscalls.rst
index c4ed6dbf5..1361778ed 100644
--- a/Documentation/translations/it_IT/process/adding-syscalls.rst
+++ b/Documentation/translations/it_IT/process/adding-syscalls.rst
@@ -603,7 +603,7 @@ Riferimenti e fonti
  - Requisiti specifici alle architetture sono discussi nella pagina man
    :manpage:`syscall(2)` :
    http://man7.org/linux/man-pages/man2/syscall.2.html#NOTES
- - Collezione di email di Linux Torvalds sui problemi relativi a ``ioctl()``:
+ - Collezione di email di Linus Torvalds sui problemi relativi a ``ioctl()``:
    http://yarchive.net/comp/linux/ioctl.html
  - "Come non inventare interfacce del kernel", Arnd Bergmann,
    http://www.ukuug.org/events/linux2007/2007/papers/Bergmann.pdf
diff --git a/Documentation/translations/it_IT/process/howto.rst b/Documentation/translations/it_IT/process/howto.rst
index f51288602..c9120095c 100644
--- a/Documentation/translations/it_IT/process/howto.rst
+++ b/Documentation/translations/it_IT/process/howto.rst
@@ -249,7 +249,7 @@ e di molti altri rami per specifici sottosistemi. Questi rami sono:
 I sorgenti kernel 4.x
 ~~~~~~~~~~~~~~~~~~~~~
 
-I kernel 4.x sono amministrati da Linus Torvald, e possono essere trovati
+I kernel 4.x sono amministrati da Linus Torvalds, e possono essere trovati
 su https://kernel.org nella cartella pub/linux/kernel/v4.x/. Il processo
 di sviluppo è il seguente:
 
diff --git a/Documentation/translations/it_IT/process/submitting-patches.rst b/Documentation/translations/it_IT/process/submitting-patches.rst
index 1cc480813..48ac4916d 100644
--- a/Documentation/translations/it_IT/process/submitting-patches.rst
+++ b/Documentation/translations/it_IT/process/submitting-patches.rst
@@ -280,7 +280,7 @@ https://subspace.kernel.org. Tuttavia, ci sono altre liste di discussione
 ospitate altrove.
 
 L'ultimo giudizio sull'integrazione delle modifiche accettate spetta a
-Linux Torvalds.  Il suo indirizzo e-mail è <torvalds@linux-foundation.org>.
+Linus Torvalds.  Il suo indirizzo e-mail è <torvalds@linux-foundation.org>.
 Riceve moltissime e-mail, e, a questo punto, solo poche patch passano
 direttamente attraverso il suo giudizio; quindi, dovreste fare del vostro
 meglio per -evitare di- inviargli e-mail.
diff --git a/Documentation/translations/sp_SP/process/2.Process.rst b/Documentation/translations/sp_SP/process/2.Process.rst
index c21b0134c..9e26eb8c6 100644
--- a/Documentation/translations/sp_SP/process/2.Process.rst
+++ b/Documentation/translations/sp_SP/process/2.Process.rst
@@ -56,7 +56,7 @@ y montados con anticipación. Como funciona ese proceso se describirá en
 detalle más adelante).
 
 La ventana de fusión dura aproximadamente dos semanas. Al final de este
-tiempo, Linux Torvalds declarará que la ventana está cerrada y publicará
+tiempo, Linus Torvalds declarará que la ventana está cerrada y publicará
 el primero de los kernels “rc”. Para el kernel destinado a ser 5.6, por
 ejemplo, el lanzamiento al final de la ventana de fusión se llamará
 5.6-rc1. El lanzamiento -rc1 señala que el tiempo para fusionar nuevas
@@ -202,7 +202,7 @@ Las etapas por las que pasa un parche son, generalmente:
    para su revisión y fusión.
 
  - Fusión en el mainline. Eventualmente, un parche exitoso se fusionará
-   en el repositorio mainline administrado por Linux Torvalds. Mas
+   en el repositorio mainline administrado por Linus Torvalds. Mas
    comentarios y/o problemas pueden surgir en este momento; es importante
    que el desarrollador responda a estos y solucione cualquier problema
    que surja.
-- 
2.54.0


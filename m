Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795090929;
	b=ljXA+ivORt9/pbwnhSNKIyBSvuKyzRxzj14LjpAyvr9BHuMj5ahOUQwxow0BRs/1w+9a
	 ROW0RotIune/8Cr1RQd5qORQrTUSXK90abZFLwCzjnIyks7zSGkHdlvMJOTtknrTrhPCh
	 2p+80BQk9sobPKdEpuTP5MswxeeroGFAb7OPmIp3or5ZOheMT29Imw+voKdxOPGBo0YCK
	 34Qj/Qx6AMQ4BxtNQwD62LVe+5R9OJ0SODWcmQv+vjuXKUegPWVwhMle6nYB6Nvcz4qWh
	 qXxiBY6f2exqqvL7DVxhffmjqoqGSz+7LGDOXXlfbfwkvGmKujitd/aL0qEwQiQ+5Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090929;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8IT8R3AxUgxvLIScCyfvrIoCl9YjfITJ5KR3ZJEu7v0=;
	b=2hYRzLUxmE2l/P2HRpUl5QrSWujIFDj6+g81d0PXe79Cmq+mLxn9gY5O+n+kOxqkACyI
	 ORq2rWwTDwhTrsEtb7rxd9P6kSy/HcXnCJzak6ub1X/TtaLuiscJzs/bHDD7eI+2/PyKC
	 9ohMek2UxJNh9cZwy86FvlLNFWpSe+TFb7McSHHtVpacmPLPjmt6mcoggKFvojeH8cYzu
	 BcRqSg6AlzJUnT7Ur3v5JkOOYvUJk7IPyui/jGwdrbq0VUQWYMcZGvDhwonGRZFqTXCgt
	 dMTaJL2s184zsjQ/WtvtXfUTYKAkH59RRTJWgFwL9EI0gzb9v1LOMHDBW0ktRD4PnUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=itTQOwZw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265E0606A320
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=itTQOwZw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795090928;
	b=xakniblOoFvASP9e1XcBZs1o7Bcr6gcLEryBM2mO/e8uqezHfbkqrOCfdkFPyG9HF72E
	 d2yeaRPSPr/EO3nf1t2fLwhPL7xurSfLGPjidobUVd4wKbs0NIPRZP8tZliTg3Ole3BwQ
	 m2i95X7506u5fzCSFJMP/JW3Lyvcxin398QMppgP9TOjyjz51EIXRMQwv8IgLY2LSzrus
	 Dn2dxL4XErogJ1Rn4Kkr3o2wPPxrS6eD4yOjTYxNy4D/fa+/G4LVjDk7gkr1UkwNnx/A7
	 tQe/wbHhWav7B0DJG8c0fAf3AyNCjk8ELnUsWugdS74Es0/oCOAngc1XVXIhOVAwzyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795090928;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8IT8R3AxUgxvLIScCyfvrIoCl9YjfITJ5KR3ZJEu7v0=;
	b=LPJ0hPeVuHgVF/97MoEMofS9Tg64c2uq1OuEfdKXSpgTWVLjd3w9Xp4hcWeaZ9Mz+BiN
	 Bn4Ahj0n/9VKORyaGbOtu5SkXctrnCuAeSXwK9HXkbaHHs9uXA5iQD4jYHENSnPeEAfmc
	 9ndqdxqT9RSwpRcgNCl9MJxA2xdJ+JWPKFBSBOxokFTdGwMJGyhw0pE9VSdjtjEPOZdv0
	 Kkr3BNC12DY0mQl2NQXJcAvETs0s8NbV+3wCPJX8KxdLmgUc7yh8CPGBAiBo+FmnrWiJi
	 wj5FUDOnGHS43cc9tiNfnE7gzbx7cUE+mHpL6nD+tDKk4uRevt7pmhVFnh/djvJqHtA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43C7C1F000C5;
	Thu, 19 Nov 2026 12:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795090928;
	bh=8IT8R3AxUgxvLIScCyfvrIoCl9YjfITJ5KR3ZJEu7v0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=itTQOwZwiR77FlX5a8X0cu7ra9fqRSIzZK++NB0V4uYxBr0rBd0ApNdCT7sdHTyEk
	 YYnMmtlWCk3naCI6usZElH7CYXkiiVkgYYelrZYtWnD9JNThhlQfsHTY6DxYy1/HTm
	 WPu9iHTOD5lpj2b3mdUxiHSI9rCukiNELhLvazIl/BI4Eo9RxeH+xuJv+ylUI6YWbw
	 HYVWg1hRX8hlJs+HvYhI82EjAXDhzTmdNsbMdIO4tRxE2BtVCvwzgjVDI142piqU6a
	 O1y8+Mk/Ep1xM/ahll0S6vfa8AcX5AcqdhZY7r4XEP9u2VFuAyGU4Ui7AmItG+R8J9
	 LUBCSscd2yQ5g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C87114B298;
	Thu, 19 Nov 2026 12:22:07 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 09:22:04 -0300
Subject: [PATCH] docs: pt_BR: submitting-patches: update LKML role as last
 resort
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-pt-br-submitting-patches-lkml-v1-1-1c7170de926f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdvE1cQMX8V4gFGgCnNZiyEhv
 DtTj9/h/zdQzsIKt2qDzB9ReccCd6ogjE0cGKUrBjrT1TlXYzJsM+rSzmImccDUWBhZcXrNE3p
 /IU81c98RlEfK3Mv6+98ff5f0ycG+U9j3A1y+ZzyBAAAA
X-Change-ID: 20261119-pt-br-submitting-patches-lkml-8832829eefd2
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
 Eduardo Pereira Cruz <dreduardocruz@gmail.com>, 
 Daniel Pereira <danielmaraboo@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795090927; l=3887;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=GcKCZ7A9qSK4VpwFufllbUosGCXBesddh9epOSyJAXo=;
 b=bFL+aH959aRdVBG+RhE2Vj24tH3JmNAvAUCteRUYQxSzjmJ1eOVbGTQxxBC1xKLWzXmk4FCOY
 6//oC7TjuBHBC0AbGVbCKVn/p6mWofmuXJpSTNOgTih7dnem75x6+FP
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com
Content-Transfer-Encoding: 8bit

From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>

Update the Brazilian Portuguese translation of submitting-patches.rst to reflect commit 3a198413bb71 ("docs: submitting-patches: make LKML a list of last resort again"), advising contributors to send patches to a subsystem-specific mailing list first and use linux-kernel@vger.kernel.org only as a list of last resort.

Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Cc: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org
---
 .../translations/pt_BR/process/submitting-patches.rst | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/submitting-patches.rst b/Documentation/translations/pt_BR/process/submitting-patches.rst
index 4d1e75935745..3b77363ded18 100644
--- a/Documentation/translations/pt_BR/process/submitting-patches.rst
+++ b/Documentation/translations/pt_BR/process/submitting-patches.rst
@@ -118,10 +118,10 @@ mudar daqui a cinco anos.
 
 Se discussões relacionadas ou qualquer outra informação de contexto por trás da mudança
 puderem ser encontradas na web, adicione tags 'Link:' apontando para isso. Se o patch é o
-resultado de algumas discussões anteriores na lista de e-mails ou algo documentado na
+resultado de algumas discussões anteriores na lista de discussão ou algo documentado na
 web, aponte para ele.
 
-Ao criar links para arquivos de listas de e-mails, de preferência use o serviço
+Ao criar links para arquivos de listas de discussão, de preferência use o serviço
 de arquivo de mensagens lore.kernel.org. Para criar a URL do link, use o
 conteúdo do cabeçalho ``Message-ID`` da mensagem, sem os colchetes angulares
 circundantes. Por exemplo::
@@ -132,11 +132,11 @@ Por favor, verifique o link para se certificar de que ele está realmente
 funcionando e aponta para a mensagem relevante.
 
 No entanto, tente tornar a sua explicação compreensível sem recursos
-externos. Além de fornecer um URL para um arquivo da lista de e-mails ou bug,
+externos. Além de fornecer um URL para um arquivo da lista de discussão ou bug,
 resuma os pontos relevantes da discussão que levaram ao patch conforme enviado.
 
 Caso o seu patch corrija um bug, use a tag 'Closes:' com um URL que referencie o
-relato nos arquivos da lista de e-mails ou em um rastreador público de bugs. Por exemplo::
+relato nos arquivos da lista de discussão ou em um rastreador público de bugs. Por exemplo::
 
 	Closes: https://example.com/issues/1234
 
@@ -244,10 +244,13 @@ encontrar um mantenedor para o subsistema em que está trabalhando,
 Andrew Morton (akpm@linux-foundation.org) serve como um mantenedor de
 último recurso.
 
-linux-kernel@vger.kernel.org deve ser usado por padrão para todos os
-patches, mas o volume dessa lista fez com que vários desenvolvedores a
-ignorassem. Por favor, não envie spam para listas e pessoas não
-relacionadas.
+Você também deve normalmente escolher pelo menos uma lista de discussão para
+receber uma cópia do seu conjunto de patches. Procure no arquivo MAINTAINERS
+por uma lista específica do subsistema; seu patch provavelmente receberá mais
+atenção lá.
+linux-kernel@vger.kernel.org funciona como uma lista de último recurso para
+patches que não possuem uma lista específica do subsistema. Por favor, não
+envie spam para listas e pessoas não relacionadas.
 
 Muitas listas relacionadas ao kernel estão hospedadas em kernel.org;
 você pode encontrar uma lista delas em https://subspace.kernel.org.

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261119-pt-br-submitting-patches-lkml-8832829eefd2

Best regards,
--  
Eduardo Pereira Cruz <dreduardocruz@gmail.com>



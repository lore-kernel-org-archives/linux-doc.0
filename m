Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795363730;
	b=xVM/ONzqXg87+BiHFrA6PVMb8aaZAsIciqSwSpyQh4WXRyXWwsr3syb7mmAJBNiKK94t
	 twyZSwKOatEeC48c8n4IgegXOZ7MC38im5CAe5V/r15KuuPLAZOoxSFYhRy+JCTr/xV/A
	 StoPilrYyJCPEgWx0jYw2OXtEn3uc4NH5TJUsJDafNeR42MwOtr9I0wy2hdqK9aiLvLgy
	 Fx1Qb/xQWPC+I8NTKiwHkTEODraOY7+jfhRSSHHE3x2lQld6rXWRGHpH/7gtGFh/Dfzx7
	 PUtzje9vv0Qr0ZuOL7AdR5OTU3qXRcnSZANbUddBOqfM5ESPwnF2/6dvTSQACznRdqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363730;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=trhUbqVsibVGUA2FMcg4mpCZ8JKkQNk7Iq36Ah5CrpY=;
	b=kcdI33hWM9G0jEN0FJ2YTXa9Mks0h61xQV+yZmE7oFW6jSdc/0Nf2AltnG83+vkQ4rsZ
	 xcQgSyx/JIgOAMzCm9wtcpNioUnANn3jqQi8I1Rco5cWf1JkK6lApcqLmKdU2AGOGeZZt
	 fTFAHROZE3OBfd7cOj+gs+gKFMO7ro/cUsxdVALx6WQENC98qNn5aLpGr58AJu1ChIhRe
	 +AKQdWouYEWTepBWaan7zH2E0I6QrNR4YywrF6QJEWWD60C5+n2shzOJZ6OLR//zGOLkE
	 8Ddx04OzW7wxDQvXaDO+bJoh+D4cnRtEFjEribiRefEJSFNm8Ra0+ymVs4aJEKmB5XA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JK2zds2I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7812606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JK2zds2I
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795363729;
	b=t3YHo2PVtYQZ3u6qNf5WUMlGV5/5HQN112G89/SvCzeUGoAQtExzcSbfNYeePhlkv0/8
	 Vleq73QUh92DeVg4PYN8isDFpQbJzcSZ7fR723r/ofK6k9KfYNHjzdMLk8xh6aYUDkt9Z
	 NfBXMfPzBIwiye46LlpXP61Fpi/yfoExmOIMoE1H4uDYLC/rtFE96eVltxkOApRJeM6TP
	 Kywvm5F/0OyCX5H6pMEvbzBn+WcOeHhkXf7IN+qk9j8g7S+XWisnbcXnrv0pA4GSB98ua
	 btiSZ/iAvLFSxI/2Asbhl8jrFnw1uhGofEIbG7rEogBZl74pogKsbdPxYjQMmYboe2Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795363729;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=trhUbqVsibVGUA2FMcg4mpCZ8JKkQNk7Iq36Ah5CrpY=;
	b=RaS+oG1NW4MFEM3181yR/FW3yHVqR3hzIAEmOsSjEJBA0/FFufp6vahI0pVLKHwX2bC8
	 2cFGhtYWx7xbxj2cWwAdDWpzCn+CBXnGm16Up4nMe9ec7o0HIiLejoPXYbSI4y4hOLsm9
	 MkGQpqOsntKmhqmWauyxxTaOh9CaRCz+GWNtjOlWgB8jsd35ZrFdepfVujubuhRXy8y2Y
	 HUvfH1L/hGyvhv8SPnVmKNenweROYO8WlT/basClNbmU4gUFoQsR5UE1dwxOVH1OEp6lU
	 K0mw7UwHrO0sJWzzaDIj0U7DOLGXCLG0AAZ1UZcJDWairXdivJ8QyybvLcz7/Wuq1Ew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3ADF1F000C4;
	Sun, 22 Nov 2026 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363729;
	bh=trhUbqVsibVGUA2FMcg4mpCZ8JKkQNk7Iq36Ah5CrpY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JK2zds2Iw8TdEROMhbHpOjCWrpOio5fQnQI7rt8IoPl/fWYkqdyI0WNg4xiAcbVFf
	 o5w1LU4h7/HR+w8atKHju9uma2dNLaLTTHdJ+nNS0PHkV384kua/kdj9YgsUJW1uwV
	 OEVdyboXA2IwsQES1C6iXEx6bOqn0IeHCjK8OaIcDxMWfgTMLUfOuJP1+OQxlQ4Hbu
	 51Jhp7ZlZvnKXr4lgfoR5PjCwH2SseM1H5VCy2e07rEnmyLTKoe3drNiTScO9auEUf
	 dE7AXzVGBwU2yHrXtbe5z6CWZ1DANNmDKtfZqYDsZsahn4rLqd5zBDu/qmgCpMDXsG
	 Fxp7S1qwIhHaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 668734C101;
	Sun, 22 Nov 2026 16:08:43 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 13:08:43 -0300
Subject: [PATCH 1/4] docs/translations/pt_BR: process: add
 maintainer-pgp-guide.rst (1/4)
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
Message-Id: <20261122-maintainer-pgp-guide-pt-br-v1-1-01ce5941c5c2@gmail.com>
References: <20261122-maintainer-pgp-guide-pt-br-v1-0-01ce5941c5c2@gmail.com>
In-Reply-To: <20261122-maintainer-pgp-guide-pt-br-v1-0-01ce5941c5c2@gmail.com>
To: linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org, 
 rdunlap@infradead.org, Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795363722; l=5954;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=EJlrJWgTSTNQ8VVVl0iv3PrJ05mnog12cuiU3VTLIX4=;
 b=cI7J4agvajgR8hVBUlHDZwoqI3+8wdMqRZRhrDOrMbjL0yZgJWwAWyypDesWYAJD35OTijzM4
 pTRjzMa/ZN1DJG/dF3COmSKSIPqM41B0rt19k3Ulx+I5w8YVlTtzQtp
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com
Content-Transfer-Encoding: 8bit

From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>

Start the Brazilian Portuguese translation of the maintainer PGP guide:
the introduction, the role of PGP in kernel development, the recommended
GnuPG setup and the first part of key protection.

The translation follows the English original as last changed by commit
fdd100ee60a0 ("docs: process: use gender-neutral pronouns") and keeps
the cross-reference labels, the note and warning directives, and every
command and key listing verbatim.

Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
---
 .../pt_BR/process/maintainer-pgp-guide.rst         | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
new file mode 100644
index 000000000000..a4ec5c5ef83b
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pgpguide:
+
+=======================================
+
+Guia de PGP para mantenedores do kernel
+=======================================
+
+:Author: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
+
+Este documento é destinado aos desenvolvedores do kernel Linux e,
+especialmente, aos mantenedores de subsistema. Ele contém um subconjunto das
+informações discutidas no guia mais geral "`Protecting Code Integrity`_",
+publicado pela Linux Foundation. Leia aquele documento para uma discussão mais
+aprofundada sobre alguns dos tópicos mencionados neste guia.
+
+.. _`Protecting Code Integrity`: https://github.com/lfit/itpol/blob/master/protecting-code-integrity.md
+
+O papel do PGP no desenvolvimento do kernel Linux
+=================================================
+
+O PGP ajuda a garantir a integridade do código produzido pela comunidade de
+desenvolvimento do kernel Linux e, em menor grau, a estabelecer canais de
+comunicação confiáveis entre desenvolvedores por meio de troca de e-mails
+assinados com PGP.
+
+O código-fonte do kernel Linux está disponível em dois formatos principais:
+
+- Repositórios de código distribuídos (Git)
+- Instantâneos periódicos de versões (tarballs)
+
+Tanto os repositórios Git quanto os tarballs carregam assinaturas PGP dos
+desenvolvedores do kernel que criam as versões oficiais. Essas assinaturas
+oferecem uma garantia criptográfica de que as versões baixáveis
+disponibilizadas via kernel.org ou qualquer outro espelho são idênticas ao que
+esses desenvolvedores têm em suas estações de trabalho. Para isso:
+
+- Repositórios Git fornecem assinaturas PGP em todas as tags
+- tarballs fornecem assinaturas PGP destacadas junto com todos os downloads
+
+.. _devs_not_infra:
+
+Confiar nos desenvolvedores, não na infraestrutura
+--------------------------------------------------
+
+Desde o comprometimento dos sistemas centrais do kernel.org em 2011, o
+princípio operacional principal do projeto Kernel Archives tem sido assumir que
+qualquer parte da infraestrutura pode ser comprometida a qualquer momento. Por
+essa razão, os administradores tomaram medidas deliberadas para enfatizar que a
+confiança deve sempre ser depositada nos desenvolvedores e nunca na
+infraestrutura de hospedagem de código, independentemente de quão boas sejam as
+práticas de segurança desta última.
+
+O princípio orientador acima é a razão pela qual este guia é necessário.
+Queremos garantir que, ao depositar confiança nos desenvolvedores, não
+estejamos apenas transferindo a culpa por potenciais incidentes futuros de
+segurança para outra pessoa. O objetivo é fornecer um conjunto de diretrizes
+que os desenvolvedores possam usar para criar um ambiente de trabalho seguro e
+proteger as chaves PGP usadas para estabelecer a integridade do próprio kernel
+Linux.
+
+.. _pgp_tools:
+
+Ferramentas PGP
+===============
+
+Use GnuPG 2.4 ou mais recente
+-----------------------------
+
+Sua distro já deve ter o GnuPG instalado por padrão; você só precisa verificar
+se está usando uma versão razoavelmente recente. Para conferir, execute::
+
+    $ gpg --version | head -n1
+
+Se você tem a versão 2.4 ou superior, está tudo certo. Se tiver uma versão
+anterior, você está usando uma versão do GnuPG que não é mais mantida e alguns
+comandos deste guia podem não funcionar.
+
+Configure as opções do gpg-agent
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+O agente do GnuPG é uma ferramenta auxiliar que inicia automaticamente sempre
+que você usa o comando ``gpg`` e roda em segundo plano com o propósito de
+guardar em cache a passphrase da chave privada. Há duas opções que você deve
+conhecer para ajustar quando a passphrase deve expirar do cache:
+
+- ``default-cache-ttl`` (segundos): se você usar a mesma chave novamente antes
+  de o tempo de vida expirar, a contagem regressiva reinicia por outro período.
+  O padrão é 600 (10 minutos).
+- ``max-cache-ttl`` (segundos): independentemente de quão recentemente você usou
+  a chave desde a primeira entrada da passphrase, se a contagem do tempo de
+  vida máximo expirar, você terá de digitar a passphrase novamente. O padrão
+  é 30 minutos.
+
+Se você achar qualquer um desses padrões curto (ou longo) demais, pode editar
+o arquivo ``~/.gnupg/gpg-agent.conf`` para definir os seus próprios valores::
+
+    # set to 30 minutes for regular ttl, and 2 hours for max ttl
+    default-cache-ttl 1800
+    max-cache-ttl 7200
+
+.. note::
+
+    Não é mais necessário iniciar o gpg-agent manualmente no começo da sua
+    sessão de shell. Você pode querer verificar os seus arquivos rc para
+    remover qualquer coisa que tivesse para versões anteriores do GnuPG, pois
+    pode não estar mais fazendo a coisa certa.
+
+.. _protect_your_key:
+

-- 
2.53.0



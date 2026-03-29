Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E346140DFC2
	for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 16:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774803068; cv=none; b=mcPeXlGxYxnA0DOuGH+VsZYmlow0VVT1oT8LOPUQQNP4hX+cpmtCFhkXyDMzGmA1/w4//kOaQcFZNA+Hk8cvpaen4MHxiUMb54DE+iw1yLQNekK3wa2Ie2qLJtMMJLUhrmGWKuZ4Iyw1tC0hZxwxPPB4HamovO8Cep3EXeClAJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774803068; c=relaxed/simple;
	bh=icB1Sw9/7VRiUgWyCMgKU44GHUWBvGn8//NdHD2ybEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=URua3ZPx2wlKaKRaegpoHfyOM6lK5nCMoZLo5sDa56PlH0Z2qt+ivppHsN4DXyrYnMUuL/7di6UIUXFrec3pUws7kAfFl63iPWn1yoThrAMHg8hdAy8nRd8wI82cKAaCX0EExZZZch3IUSsB6snIktyuTVxAb85xEf/KIaVxdH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/ed8YOK; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/ed8YOK"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5637886c92aso1772696e0c.0
        for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 09:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774803066; x=1775407866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5XWKFSIRwVaqftW5IQqoF2ph6XI0OgONN8UNx0wKok=;
        b=C/ed8YOKrAVSj6vFumAQlEf6BAA5VgiSljlVTnS6nN0qMTJvzyBR2imCbtJUZJt7zo
         OP6FrkXG20asLiQqBWUjxCBLjuyOLj4DMapGThpVlk2/cq6/oSXdSkOmFYnwQwtRQEZN
         ifr7TlHAg55r6jlFY4BoHArzmfqJqwIj77QlWLuzQ8F7RkjbmAJT//kF3TUr3QSotnLj
         oEZId5I/d0uI0rQG++HYJdQu+UVW84SVFMVzNLcqaNwzECAEAsOpv8FfIpL/u/+HE122
         GN2Sc7CnvKQua/gsnysQv/lpDjx/1gwgyZ8dDRJB199wEcWm2gsjm+Ubid1YW1/waILM
         ZexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774803066; x=1775407866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5XWKFSIRwVaqftW5IQqoF2ph6XI0OgONN8UNx0wKok=;
        b=b3K78KUULZ9E9lb/utkOED7dXcOe0jg6nanZmf0xx4z4w0awIwsX1/KLNT8yAt7nS9
         LKZf3eKmgyeo/zhKOc2XFJrxalG/Dty2I0ydZwznyw7VaUt4s2/DlmJJ0fdARm3NDzI4
         YbkbKS0uu/0D68O2eTQApSwuNzSNRUgXGXlQBtbaXl89bsK1WRshEUpQGeRextx/mIWN
         p3a2RjlggMf81NSnrtohMakrYvqRFM8JZHBInHYjICFL6aorw/W142XAcD6zzd6re1G2
         zpxdL1MnWviR4aZM99eKIX9fbDKDSa0MQlvMJN39UsdXqxXA0Wb4IWqRFeTxGvYdlKwu
         nufA==
X-Gm-Message-State: AOJu0YznXcaYPrZGW41ZEFciv5Kv77pXoL1hBBFdtK1MVc2pVJpNwJxP
	THhoyXGYh/c7Dr75QzYP53HebxbppwTgQcuil9mGT+lEgzpBw7N74PSsZ/fcyA==
X-Gm-Gg: ATEYQzzNYWDnHMViDUEfLF9K2+emQiEsJ5PBcf7Uar41CLTO8XP78G2HoKQVC/b9p+d
	rU9eIvK7yQdPXOJd3gzCpdMpRH1zn0miA6ijwMRhl0wcUYYqGqINi4N9ccJocYj5073x0xuZzqO
	5fY1/3t7UPrc9VK9XnZ3zPZheymGAVYm1Xz9fAdVStBQvA1O3vKjxXJawbkhH6vPX84umWPBQAU
	eHyC6DuSdfOI9qc2G5xhchMoVXPR+78XvF+8KoXKvH9Pnq2KP5ofuKUqfNCP2wLHR3en03BZ5JZ
	PKKw4w8FJyQka52upvIeV3zCgrILyy031JRY24ELRBFhl1zHKdGGpmdV2qulZ8D5vw/Snqx5dtI
	4+QidoMGWzdimD8rQ8SJ6s81wYTg+EH+faX9rXO2BosJ+jM6O3/fLCAL8JhUUGkt5ddkWMdE02B
	9Gcdz9SStNyL4h/6DzY9bVBWTFuDIz2exKOnwhUfWKtPCTw0hZSQCDEL2nB8CrpUfQzOCygsuTh
	7MBgKt7MV3KzGc=
X-Received: by 2002:a05:6122:2517:b0:55f:c318:1afa with SMTP id 71dfb90a1353d-56d4a52942fmr3574547e0c.6.1774803065362;
        Sun, 29 Mar 2026 09:51:05 -0700 (PDT)
Received: from localhost.localdomain ([2804:1690:81f:ccbb:2e4d:21dc:8ad9:527c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a7ba96sm5549740e0c.17.2026.03.29.09.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:51:05 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v2 2/5] docs: pt_BR: start translation of the PGP maintainer guide
Date: Sun, 29 Mar 2026 13:50:36 -0300
Message-ID: <20260329165041.831369-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260329165041.831369-1-danielmaraboo@gmail.com>
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the initial sections of the Kernel Maintainer PGP guide
into Brazilian Portuguese.

This first part covers:
- The role of PGP in Linux kernel development.
- The principle of trusting developers instead of infrastructure.
- GnuPG tool requirements and gpg-agent configuration.
- Understanding PGP subkeys and their specific capabilities (S, E, A, C).
- Guidelines for strong passphrases and creating separate signing subkeys.

The translation maintains the 80-column limit and adheres to the
standard cryptographic terminology used in the Portuguese documentation
subsystem.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/maintainer-pgp-guide.rst    | 202 ++++++++++++++++++
 2 files changed, 203 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 4a094d8b7..3d3d42388 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -75,3 +75,4 @@ kernel e sobre como ver seu trabalho integrado.
    Processo do subsistema SoC <process/maintainer-soc>
    Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
    Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
+   Guia de PGP para mantenedores <process/maintainer-pgp-guide>
diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
new file mode 100644
index 000000000..93f0759e9
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
@@ -0,0 +1,202 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================================
+Guia de PGP para Mantenedores do Kernel Linux
+=============================================
+
+:Autor: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
+
+Este documento é voltado para desenvolvedores do kernel Linux, e especialmente
+para mantenedores de subsistemas. Ele contém um subconjunto das informações
+discutidas no guia mais geral "`Protegendo a Integridade do Código`_" publicado pela
+Linux Foundation. Leia esse documento para uma discussão mais aprofundada sobre
+alguns dos tópicos mencionados neste guia.
+
+.. _`Protegendo a Integridade do Código`: https://github.com/lfit/itpol/blob/master/protecting-code-integrity.md
+
+O papel do PGP no desenvolvimento do Kernel Linux
+=================================================
+
+O PGP ajuda a garantir a integridade do código que é produzido pela comunidade
+de desenvolvimento do kernel Linux e, em menor grau, a estabelecer canais de
+comunicação confiáveis entre desenvolvedores por meio da troca de e-mails
+assinados com PGP.
+
+O código-fonte do kernel Linux está disponível em dois formatos principais:
+
+- Repositórios de fontes distribuídos (git)
+- Arquivos tarballs por release
+
+Tanto os repositórios git quanto os tarballs carregam assinaturas PGP dos
+desenvolvedores do kernel que criam os lançamentos oficiais. Essas assinaturas
+oferecem uma garantia criptográfica de que as versões para download
+disponibilizadas via kernel.org ou em quaisquer outros espelhos são idênticas ao
+que esses desenvolvedores têm em suas estações de trabalho. Para esse fim:
+
+- repositórios git fornecem assinaturas PGP em todas as tags
+- tarballs fornecem assinaturas PGP avulsas com todos os downloads
+
+Confiar nos desenvolvedores, não na infraestrutura
+--------------------------------------------------
+
+Desde o comprometimento dos sistemas centrais do kernel.org em 2011, o
+princípio operacional principal do projeto Kernel Archives tem sido assumir
+que qualquer parte da infraestrutura pode ser comprometida a qualquer momento.
+Por este motivo, os administradores tomaram medidas deliberadas para enfatizar
+que a confiança deve ser sempre depositada nos desenvolvedores e nunca na
+infraestrutura de hospedagem de código, independentemente de quão boas sejam
+as práticas de segurança desta última.
+
+O princípio orientador acima é a razão pela qual este guia é necessário.
+Queremos garantir que, ao depositar confiança nos desenvolvedores, não
+estejamos meramente transferindo a culpa por potenciais incidentes de
+segurança futuros para outra pessoa. O objetivo é fornecer um conjunto de
+diretrizes que os desenvolvedores possam usar para criar um ambiente de
+trabalho seguro e proteger as chaves PGP usadas para estabelecer a integridade
+do próprio kernel Linux.
+
+Ferramentas PGP
+===============
+
+Use GnuPG 2.4 ou superior
+-------------------------
+
+Sua distribuição já deve ter o GnuPG instalado por padrão; você só precisa
+verificar se está usando uma versão razoavelmente recente dele. Para verificar,
+execute::
+
+    $ gpg --version | head -n1
+
+Se você tiver a versão 2.4 ou superior, está tudo pronto. Se tiver uma versão
+anterior, você está usando um lançamento do GnuPG que não é mais mantido e
+alguns comandos deste guia podem não funcionar.
+
+Configurar as opções do gpg-agent
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+O agente GnuPG é uma ferramenta auxiliar que iniciará automaticamente sempre
+que você usar o comando ``gpg`` e rodará em segundo plano com o propósito de
+armazenar em cache a frase secreta (passphrase) da chave privada. Existem duas
+opções que você deve conhecer para ajustar quando a frase secreta deve expirar
+do cache:
+
+- ``default-cache-ttl`` (segundos): Se você usar a mesma chave novamente antes
+  que o tempo de vida expire, a contagem regressiva será reiniciada por outro
+  período. O padrão é 600 (10 minutos).
+- ``max-cache-ttl`` (segundos): Independentemente de quão recentemente você
+  tenha usado a chave desde a entrada inicial da frase secreta, se a contagem
+  regressiva do tempo de vida máximo expirar, você terá que digitar a frase
+  secreta novamente. O padrão é 30 minutos.
+
+Se você achar que qualquer um desses padrões é muito curto (ou muito longo),
+você pode editar seu arquivo ``~/.gnupg/gpg-agent.conf`` para definir seus
+próprios valores::
+
+    # definir 30 minutos para ttl regular, e 2 horas para o ttl máximo
+    default-cache-ttl 1800
+    max-cache-ttl 7200
+
+.. note::
+
+    Não é mais necessário iniciar o gpg-agent manualmente no início de sua
+    sessão de shell. Você pode querer verificar seus arquivos rc para remover
+    qualquer coisa que tenha configurado para versões mais antigas do GnuPG,
+    pois elas podem não estar mais agindo da forma correta.
+
+Proteja sua chave PGP
+=====================
+
+Este guia assume que você já possui uma chave PGP que utiliza para fins de
+desenvolvimento do kernel Linux. Se você ainda não possui uma, consulte o
+documento "`Protegendo a Integridade do Código`_" mencionado anteriormente para
+obter orientações sobre como criar uma nova.
+
+Você também deve criar uma nova chave se a sua atual for inferior a 2048
+bits (RSA).
+
+Você também deve criar uma nova chave se a sua atual for inferior a 2048
+bits (RSA).
+
+Entendendo as Subchaves PGP
+---------------------------
+
+Uma chave PGP raramente consiste em um único par de chaves -- geralmente é uma
+coleção de subchaves independentes que podem ser usadas para diferentes
+propósitos com base em suas capacidades, atribuídas no momento de sua criação.
+O PGP define quatro capacidades que uma chave pode ter:
+
+- As chaves **[S]** podem ser usadas para assinatura (*signing*)
+- As chaves **[E]** podem ser usadas para criptografia (*encryption*)
+- As chaves **[A]** podem ser usadas para autenticação (*authentication*)
+- As chaves **[C]** podem ser usadas para certificação de outras chaves
+  (*certifying*)
+
+A chave com a capacidade **[C]** é frequentemente chamada de chave "mestra",
+mas esta terminologia é enganosa porque implica que a chave de Certificação
+pode ser usada no lugar de qualquer outra subchave na mesma cadeia (como uma
+"chave mestra" física pode ser usada para abrir fechaduras feitas para outras
+chaves). Como este não é o caso, este guia irá referir-se a ela como "a chave
+de Certificação" para evitar qualquer ambiguidade.
+
+É fundamental compreender plenamente o seguinte:
+
+1. Todas as subchaves são totalmente independentes umas das outras. Se você
+   perder uma subchave privada, ela não poderá ser restaurada ou recriada a
+   partir de qualquer outra chave privada em sua cadeia.
+2. Com exceção da chave de Certificação, pode haver várias subchaves com
+   capacidades idênticas (ex: você pode ter 2 subchaves de criptografia
+   válidas, 3 subchaves de assinatura válidas, mas apenas uma subchave de
+   certificação válida). Todas as subchaves são totalmente independentes -- uma
+   mensagem criptografada para uma subchave **[E]** não pode ser
+   descriptografada com qualquer outra subchave **[E]** que você também possa
+   ter.
+3. Uma única subchave pode ter múltiplas capacidades (ex: sua chave **[C]**
+   também pode ser sua chave **[S]**).
+
+A chave que carrega a capacidade **[C]** (certificação) é a única chave que
+pode ser usada para indicar relacionamento com outras chaves. Apenas a chave
+**[C]** pode ser usada para:
+
+- adicionar ou revogar outras chaves (subchaves) com capacidades S/E/A
+- adicionar, alterar ou revogar identidades (uids) associadas à chave
+- adicionar ou alterar a data de expiração em si mesma ou em qualquer subchave
+- assinar chaves de outras pessoas para fins de rede de confiança (web of trust)
+
+Por padrão, o GnuPG cria o seguinte ao gerar novas chaves:
+
+- Uma subchave carregando as capacidades de Certificação e Assinatura (**[SC]**)
+- Uma subchave separada com a capacidade de Criptografia (**[E]**)
+
+Se você usou os parâmetros padrão ao gerar sua chave, então é isso que você
+terá. Você pode verificar executando ``gpg --list-secret-keys``, por exemplo::
+
+    sec   ed25519 2022-12-20 [SC] [expires: 2024-12-19]
+          000000000000000000000000AAAABBBBCCCCDDDD
+    uid           [ultimate] Alice Dev <adev@kernel.org>
+    ssb   cv25519 2022-12-20 [E] [expires: 2024-12-19]
+
+A linha longa abaixo da entrada ``sec`` é o "fingerprint" (impressão digital)
+da sua chave -- sempre que você vir ``[fpr]`` nos exemplos abaixo, é a essa
+string de 40 caracteres que ele se refere.
+
+Certifique-se de que sua frase secreta seja forte
+-------------------------------------------------
+
+O GnuPG usa frases secretas para criptografar suas chaves privadas antes de
+armazená-las no disco. Dessa forma, mesmo que seu diretório ``.gnupg`` seja
+vazado ou roubado em sua totalidade, os invasores não poderão usar suas chaves
+privadas sem primeiro obter a frase secreta para descriptografá-las.
+
+É absolutamente essencial que suas chaves privadas sejam protegidas por uma
+frase secreta forte. Para defini-la ou alterá-la, use::
+
+    $ gpg --change-passphrase [fpr]
+
+Crie uma subchave de assinatura separada
+----------------------------------------
+
+Nosso objetivo é proteger sua chave de Certificação movendo-a para uma mídia
+offline; portanto, se você tiver apenas uma chave **[SC]** combinada, você deve
+criar uma subchave de assinatura separada::
+
+    $ gpg --quick-addkey [fpr] ed25519 sign
-- 
2.47.3


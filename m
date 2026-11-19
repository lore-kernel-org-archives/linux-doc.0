Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795061569;
	b=nONmIZWLHhBikI9/prfEDkcaBP7PcL26z3qvM8PDqzPG5/t9nAT58At+0kcXKjJwLhPy
	 ysdupoDS4H7nnER+SY0k+4mBSDAusXEEaul9QHQ/X31LUDwv0MmOjl3CHwRUmRFy0/1ae
	 l2QagVumZjQ3KHaK8Sl7NXarY3HSZotof9eDdqiu+xeadFrqcTZczlE3i96Ccu4DlWnJL
	 n7YwRPvyB9okbbRDk0j68JsUrlJdW0LtBcB7HtGyEVodMHecjrLLhY0/Xp8yXC2kZ+6u/
	 c809dA98CeklzRP0YYRAReBaE4UENJWeWMTSSdMiGDdsipkEHDYIdi/rtN4B33K23fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795061569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=759tB6oYCiSWBTdD0yIsdrUsB/ry10LrWbBBgyptYCE=;
	b=ju2qzqMz66BM9VpcjePNlQeFNuTQypXlrImuQr7JvubEP8beLobUpKNZCW5PTIcUFeWM
	 acWxKYWnbAJWJwPmC03lATcBcYkKe+ZpTR2SA8odtamAd5a08L0s3cXM0pgAl1K3FGg/o
	 HDymjBbCFtq3jurRoWD/G6HMJSwdzoP1oZqP16fQ9jcx46YLqgmW2MfIGRNAsUFJswGyy
	 eI1H4NsBYb+st+36NItTEG0MEht753pRAy+dyEPMPF5B/0Dyn0zYrl5cq8oC0iKLTtggM
	 D631HUyNJxi9YRUae6uSJL2g5+9S3id5abFGn0BUyz6BUQXa+Z361r7nTcUL5iBfOqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D288zh2v;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D2B60A2614
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 04:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D2B60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D288zh2v
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36dbde64409so3141081eec.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 20:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795061566; x=1795666366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=759tB6oYCiSWBTdD0yIsdrUsB/ry10LrWbBBgyptYCE=;
        b=D288zh2v9RP2KU8hP537t9VfBkQ2PpSqS0mmkuU15edmH37D8yD0KhbajPZn8kLf7S
         2r5vWiCMcbdZkml8wYyKzeV0SFilE/D6Y6XVkj7gbIUy1JPVaRo2m4U77uiArx0faSJe
         SOWUg0CBU++mgN6eDCuru8/KoMLbVteJJaGeI3ZlJQmxvmobJ5oPOH2cGWAiOd7Lm2VC
         lUqBsGbfY+lXMI89GaCH0cyAjYwI95eGhW+sL984QClOsnrw39y9duGxaptzgoZrbHHi
         9lT3rcOJYZNc8Un4DPsrOL+MxfCfOnoJhyj5pMg90KgPwRV31ZY3aTjqqi+HGyzCOft+
         DGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795061566; x=1795666366;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=759tB6oYCiSWBTdD0yIsdrUsB/ry10LrWbBBgyptYCE=;
        b=YIqhGEtABJcICMmUYFB6UScoUBTVS6z3YQsU7Zu19meWFhcAK4fRZkGMzr8h0kHgiL
         4gLYprP1hY/e3W/QtzsxDbQ0l/5/3zUB4c0ilkiT/n7sihZ7MXA/dKnoqBKjS58UZyl6
         20hj6BdvzuEiPUBWO9sruXBFIRNhl0U5DAZPopCPgsoLulnHRiePSaXNCO3g8esMHug+
         bSpfDpUaEOIizL+w5C5xeNdPViHWEGV/ZpJZ4te0fapUlmcukBAGper0V4A4jjIn3RYQ
         g1k+3x+FUPgyfTiOVcNrtXemHaHe+xcmCVREM8RhRK0u/7XC6Wvxal00s4F8ni8++A6y
         G7AA==
X-Forwarded-Encrypted: i=1; AL+hErHZ39bPpV2pu16HOfI77xj37HfqkTuWj/okmD6+xuOySh/ou0FoejpqkVDn5q0SUXiQgXMUrVKQ/Is=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SMPRLEyq7Wfdg9uGGaltQbDDKmc/4Bb94yfw5MqVYYqzUDIuc
	tSbJoUgfm1eY+w8DkFDcMXTs2J+ov7JCBzBUkbMg/WiR5brqUnniT0kx
X-Gm-Gg: AZFdTZfi/JV6/g7aAzjBP4aNdY3qbw+PAbUcL/w8AfIq75R8ezLZXKXVzFZ/hq8/gpd
	mWaTFaJhl30MviAOAdEgIfNvcdRJDPeWNNFQS0lFgk3iAg+/K4AldCuWup0frtz/x0zI86/wk8n
	F34k9G/99ClKamizuybJtmR61dXSH9djtjDwlcZ8zEki/XAngt+2p/SUA6ipm3A6KBXiiu14Owx
	MbUu2ReC0I2DYCMkhwxlZUpeAGbyuhF+iKB8YWpwRcsdtZQjiIkB//wtceoAzne6m+loSpOfSlc
	AtenpVKnmQhA7lWbS10GFFL3YBxVdEIrELPZbhVQKqpbDAaRi6ImpRdtU8aqNkj3zawMqr9kh7D
	phtVTJnnBObn1TH7XUOR4ktI+OUkz3y1zKH3RcnzVIdf40qMcJWWG/Cekyd/fkqIU6ZjSfq6lB1
	KDNKjyJ7KB5McJtpVr7/e9tq0Hwvgcx//XvK66SMxV2Ex8/jfXwptfbhQbGMp770eUiGBxRkqER
	lj1klLTzBgiXgszLOk/s9QOg8kOuMbxMPAid99dUYVJpW3MVp11Ec8EPoc3MWnCDTnII0BzZtY8
	vW3bybHPm06rtaGKSY2wOd1teveV1j3N40k/WJcL6+IPcFdBjSGBr5E67lpftNkGypYpqSZQrVB
	YwbS3Ce6Ruumvko70vJxLW4DbveoDSvA+TyqiS8x+dlkLGoNqXXCZw0k87WFjts/L8dsPvaiB3u
	gCdgqn1BJVUfpVGBlMfTLTYAOOyajwfQo=
X-Received: by 2002:a05:693c:880f:20b0:376:552d:402d with SMTP id 5a478bee46e88-3828121ab02mr4152503eec.34.1795061565803;
        Wed, 18 Nov 2026 20:12:45 -0800 (PST)
Received: from Daniel ([187.15.85.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm12779716eec.29.2026.11.18.20.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:12:45 -0800 (PST)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Weijie Yuan <wy@wyuan.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v3 2/2] docs: pt_BR: translate doc-guide/translations.rst
Date: Thu, 19 Nov 2026 01:10:09 -0300
Message-ID: <20261119041009.63651-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119041009.63651-1-danielmaraboo@gmail.com>
References: <20261119041009.63651-1-danielmaraboo@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the new guide for translators, added in the previous patch,
into Brazilian Portuguese. The translation is based on the original as
added by that patch; since its commit hash is only known once the
series is applied, it does not carry the "Update the translation
through commit" line that the guide suggests.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>
---
Changes in v3:
- Follow the same cuts and rule changes made to the English original in
  patch 1/2 (path-mirroring rule and exemption, optional ":Original:",
  dropped generic sections, encouragement to fix the English original,
  mention of b4).
- Drop avadhut.naik@amd.com from the recipients; the address bounced
  twice on v2.

v2: https://lore.kernel.org/linux-doc/20261015125644.12908-1-danielmaraboo@gmail.com/
v1: https://lore.kernel.org/linux-doc/20261013003702.5824-2-danielmaraboo@gmail.com/
---
 .../translations/pt_BR/doc-guide/index.rst    |  19 +
 .../pt_BR/doc-guide/translations.rst          | 666 ++++++++++++++++++
 Documentation/translations/pt_BR/index.rst    |  11 +
 3 files changed, 696 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/doc-guide/index.rst
 create mode 100644 Documentation/translations/pt_BR/doc-guide/translations.rst

diff --git a/Documentation/translations/pt_BR/doc-guide/index.rst b/Documentation/translations/pt_BR/doc-guide/index.rst
new file mode 100644
index 000000000..557feb762
--- /dev/null
+++ b/Documentation/translations/pt_BR/doc-guide/index.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Como escrever a documentação do kernel
+======================================
+
+.. toctree::
+   :maxdepth: 1
+
+   translations
+
+Todolist:
+
+*   sphinx
+*   kernel-doc
+*   parse-headers
+*   contributing
+*   maintainer-profile
+*   checktransupdate
diff --git a/Documentation/translations/pt_BR/doc-guide/translations.rst b/Documentation/translations/pt_BR/doc-guide/translations.rst
new file mode 100644
index 000000000..7fe392cac
--- /dev/null
+++ b/Documentation/translations/pt_BR/doc-guide/translations.rst
@@ -0,0 +1,666 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+Traduzindo a documentação do kernel
+===================================
+
+A documentação do kernel é escrita em inglês, e o inglês é a única versão
+oficial dela. As traduções existem para tornar essa documentação acessível
+a quem se sente mais à vontade lendo em outro idioma; elas ficam em
+``Documentation/translations/``, com um diretório por idioma.
+
+Este documento explica como contribuir com essas traduções: como escolher
+o que traduzir, como um documento traduzido é organizado, como verificar
+o seu trabalho, como enviá-lo, o que esperar da revisão e como manter uma
+tradução atualizada depois que ela for integrada. Ele também descreve o
+que é necessário para iniciar a tradução para um novo idioma.
+
+Ele não substitui os documentos gerais sobre como contribuir com o kernel;
+um patch de tradução é um patch do kernel, e tudo o que está descrito em
+:doc:`../process/submitting-patches` se aplica a ele. O que segue se
+concentra nos detalhes específicos das traduções e nos erros que mais
+frequentemente fazem com que patches de tradução sejam devolvidos.
+
+Algumas traduções têm orientações adicionais, específicas do idioma e
+escritas nele; por exemplo, a equipe do chinês simplificado mantém
+Documentation/translations/zh_CN/how-to.rst. Onde existir um guia assim,
+leia-o também.
+
+
+Princípios
+==========
+
+Antes de começar, leia o aviso em
+:ref:`Documentation/translations/index.rst <translations_disclaimer>`.
+Seus pontos principais orientam todo o restante deste documento:
+
+- **O inglês é a referência.** Quando uma tradução e o original em inglês
+  divergem, a versão em inglês é a correta.
+
+- **Uma tradução não é um fork.** Ela não deve acrescentar, remover nem
+  alterar informações. Se você encontrar um erro, uma omissão ou uma
+  afirmação desatualizada no original, corrija primeiro o documento em
+  inglês, com um patch separado enviado aos mantenedores da documentação.
+  Depois que essa alteração for integrada, a tradução pode acompanhá-la.
+
+  Traduzir com atenção também é uma boa forma de encontrar problemas no
+  original: uma frase pouco clara, uma referência desatualizada, uma
+  palavra faltando. Envie uma correção para esses casos também; isso
+  melhora a documentação para todos os leitores, não só para os do seu
+  idioma.
+
+- **Os mantenedores das traduções só aceitam trabalho de tradução**: novas
+  traduções, atualizações que acompanham mudanças no original e correções
+  em traduções existentes.
+
+- **Adaptar é permitido; mudar o sentido, não.** Cada idioma tem sua
+  própria gramática e suas expressões, e uma tradução literal, palavra por
+  palavra, muitas vezes fica errada. Reformule o quanto o seu idioma
+  exigir, desde que o leitor termine com a mesma informação que um leitor
+  do original.
+
+
+Antes de começar
+================
+
+Encontre a equipe da tradução
+-----------------------------
+
+Cada tradução está listada no arquivo MAINTAINERS, com uma linha ``F:``
+apontando para o seu diretório. Você pode encontrar os responsáveis por
+uma tradução com::
+
+  $ scripts/get_maintainer.pl -f Documentation/translations/<lang>/
+
+Acompanhe as discussões recentes na lista de discussão linux-doc
+(https://lore.kernel.org/linux-doc/) para ter uma ideia de como a equipe
+trabalha, quais convenções segue e o que os revisores costumam pedir. Se
+estiver em dúvida sobre algo, pergunte na lista antes de investir muito
+trabalho; os mantenedores das traduções costumam ficar contentes em ajudar
+quem está começando.
+
+Escolha o que traduzir
+----------------------
+
+Bons candidatos são os documentos que muita gente lê: os documentos sobre
+o processo de desenvolvimento em ``Documentation/process/``, o guia do
+administrador e os guias sobre como escrever documentação. Documentos
+longos, que mudam com frequência ou muito especializados são mais difíceis
+de manter atualizados e é melhor deixá-los para depois.
+
+Verifique se o documento ainda não foi traduzido e se ninguém mais está
+trabalhando nele:
+
+- procure em ``Documentation/translations/<lang>/``;
+
+- pesquise o nome do arquivo no arquivo da linux-doc em lore.kernel.org;
+  um patch pendente, ou uma revisão recente, significa que alguém já está
+  cuidando dele;
+
+- use o ``tools/docs/checktransupdate.py`` para listar os documentos que
+  ainda não têm tradução::
+
+    $ tools/docs/checktransupdate.py -l <lang> --print-missing-translations
+
+  Veja Documentation/doc-guide/checktransupdate.rst para mais detalhes.
+
+Evite que várias pessoas traduzam arquivos do mesmo diretório ao mesmo
+tempo. Nesse caso, os patches tendem a alterar o mesmo ``index.rst`` e
+acabam entrando em conflito entre si. Se você pretende traduzir um
+diretório inteiro, avise na lista.
+
+Se você é novo no desenvolvimento do kernel, comece com um documento
+curto. É no primeiro patch que aparece a maioria dos problemas de
+processo, e eles são muito mais fáceis de corrigir em um arquivo de 60
+linhas do que em um de 2000.
+
+Prepare o seu ambiente
+----------------------
+
+As traduções são integradas pela árvore da documentação, então baseie o
+seu trabalho no branch ``docs-next`` dela (a linha ``T:`` da entrada
+DOCUMENTATION no MAINTAINERS indica onde ela fica)::
+
+  $ git remote add docs git://git.lwn.net/linux.git
+  $ git fetch docs
+  $ git switch -c minha-traducao docs/docs-next
+
+Algumas traduções são reunidas primeiro em uma árvore própria; se a
+entrada do MAINTAINERS do seu idioma tiver a sua própria linha ``T:``,
+pergunte aos mantenedores da tradução qual branch usar.
+
+Você vai precisar de uma instalação do Sphinx funcionando para compilar a
+documentação. O ``tools/docs/sphinx-pre-install`` verifica o seu sistema e
+informa o que está faltando; Documentation/doc-guide/sphinx.rst traz os
+detalhes.
+
+Você também vai precisar conseguir enviar e-mails em texto puro com o
+``git send-email`` ou com um cliente de e-mail configurado como descrito
+em :doc:`../process/email-clients`. As listas de discussão do
+vger.kernel.org rejeitam e-mails em HTML, então respostas enviadas por uma
+interface de webmail na configuração padrão nunca chegam à lista.
+
+
+Anatomia de um documento traduzido
+==================================
+
+Localização e nome do arquivo
+-----------------------------
+
+Uma tradução reproduz o caminho do seu original dentro do diretório do
+idioma e mantém o mesmo nome de arquivo::
+
+  Documentation/process/howto.rst
+  Documentation/translations/<lang>/process/howto.rst
+
+Isso é uma regra, não uma convenção: não traduza nomes de arquivos nem de
+diretórios. A compilação da documentação usa essa correspondência para
+adicionar, no topo de cada página, links para a mesma página nos outros
+idiomas, e o ``tools/docs/checktransupdate.py`` depende dela para
+encontrar os commits que faltam numa tradução; os dois param de funcionar
+silenciosamente para um arquivo cujo caminho não corresponde. Mantenha a
+tradução no caminho correspondente quando o original for movido ou
+renomeado (veja "Mantendo as traduções atualizadas" abaixo).
+
+Um documento que existe só na tradução, como um glossário ou um "como
+fazer" específico do idioma, não tem original para reproduzir e está
+isento dessa regra.
+
+O cabeçalho do arquivo
+----------------------
+
+Comece o arquivo com o mesmo identificador de licença SPDX do original.
+A maioria das traduções inclui em seguida, de alguma forma, o aviso do
+idioma. Por exemplo, a tradução para o italiano usa::
+
+  .. include:: ../disclaimer-ita.rst
+
+Algumas traduções também têm um campo ``:Original:`` com o caminho em
+inglês, por exemplo
+``:Original: Documentation/core-api/symbol-namespaces.rst``. Ele só é
+útil quando esse caminho não coincide com o da tradução, já que a
+compilação da documentação já liga cada página ao seu original através
+da correspondência de caminhos descrita acima; acrescente-o só nesse
+caso. Um caminho simples basta: a compilação transforma os caminhos
+``Documentation/...`` em links automaticamente.
+
+O cabeçalho exato varia de um idioma para outro: alguns incluem o aviso em
+todos os arquivos, outros apenas na página de índice, e alguns listam os
+tradutores enquanto outros deixam as informações de contato para o
+MAINTAINERS. Copie o cabeçalho de um documento integrado recentemente no
+seu idioma, em vez de inventar o seu, e ajuste o caminho relativo de
+qualquer diretiva ``include::`` à profundidade do seu arquivo.
+
+Se o seu idioma lista os tradutores em cada arquivo, evite duplicar
+informações que já estão no MAINTAINERS. Endereços de e-mail em documentos
+ficam desatualizados; o MAINTAINERS é o lugar onde eles são mantidos em
+dia.
+
+Rótulos
+-------
+
+Os rótulos do Sphinx (``.. _rotulo:``) são globais para toda a compilação
+da documentação. Um rótulo copiado sem alteração do original, portanto,
+define o mesmo nome duas vezes, o que quebra a compilação ou, na melhor
+das hipóteses, faz as referências apontarem para o documento errado.
+
+- Os rótulos colocados bem no início de um arquivo normalmente não são
+  necessários na tradução; basta removê-los.
+
+- Os rótulos necessários, por exemplo porque outras partes do documento
+  traduzido se referem a eles, devem se tornar únicos com o acréscimo de
+  um prefixo do idioma. Cada tradução já usa um; veja os arquivos
+  existentes para descobrir qual (``it_``, ``sp_``, ``cn_``, ``tw_``,
+  ``pt_``, ...)::
+
+    .. _it_process_howto:
+
+- Referências a rótulos da documentação em inglês são aceitáveis e
+  esperadas. Quando o documento de destino ainda não foi traduzido, criar
+  o link para a versão em inglês é a coisa certa a fazer.
+
+Citações e outros alvos com nome
+--------------------------------
+
+As citações com nome também são globais. Se o original contém::
+
+  ... the C programming language [c-language]_ ...
+
+  .. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
+
+então uma tradução que mantém o nome ``c-language`` gera um aviso de
+"duplicate citation" para cada citação do arquivo. Acrescente o prefixo do
+idioma tanto às definições quanto aos seus usos::
+
+  ... a linguagem de programação C [pt-c-language]_ ...
+
+  .. [pt-c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
+
+O mesmo vale para qualquer outra construção que defina um nome visível
+fora do arquivo.
+
+Referências cruzadas
+--------------------
+
+Mantenha todas as referências cruzadas do original e decida, para cada
+uma, para onde ela deve apontar:
+
+- se o documento de destino já estiver traduzido para o seu idioma, aponte
+  para a tradução, para que os leitores continuem no seu idioma;
+
+- caso contrário, mantenha a referência ao documento em inglês.
+
+Dentro do diretório da tradução, o ``:doc:`` aceita caminhos relativos ao
+arquivo atual; assim, um documento em
+``Documentation/translations/<lang>/process/`` pode se referir ao
+``howto.rst`` traduzido com ``:doc:`howto```. Caminhos absolutos, como
+``:doc:`/process/howto```, sempre apontam para a documentação em inglês.
+
+Traduza o texto visível de uma referência quando for adequado, mas nunca o
+seu destino::
+
+  :ref:`Criando um tracepoint <process/debugging/driver_development_debugging_guide:ftrace>`
+
+O que não deve ser traduzido
+----------------------------
+
+Alguns conteúdos precisam permanecer exatamente como estão no original:
+
+- blocos literais (``::``), diretivas ``code-block``, linhas de comando e
+  suas saídas, mensagens de log e exemplos de código; eles são copiados
+  sem alteração, incluindo a indentação e os caracteres de tabulação;
+
+- identificadores: nomes de funções, estruturas, variáveis e macros,
+  opções do Kconfig, nomes e caminhos de arquivos, nomes de comandos e
+  suas opções, entradas do sysfs e do procfs;
+
+- os destinos das referências, as URLs e os argumentos de diretivas como
+  ``kernel-doc``, ``include`` ou ``toctree``;
+
+- os nomes das tags e outros textos fixos que as pessoas precisam digitar,
+  como ``Signed-off-by:`` ou ``Reviewed-by:``.
+
+O texto ao redor desses elementos é traduzido normalmente. Quando uma
+frase cita um identificador, mantenha o identificador e a sua marcação e
+traduza o restante da frase.
+
+Estrutura e formatação do documento
+-----------------------------------
+
+Mantenha a estrutura do original: as mesmas seções, na mesma ordem, com os
+mesmos níveis de título e, de preferência, os mesmos parágrafos. Isso
+torna a tradução muito mais fácil de revisar, e muito mais fácil de
+atualizar depois, porque uma mudança no original corresponde a um lugar
+óbvio na tradução.
+
+Siga as regras habituais da documentação do kernel:
+
+- quebre as linhas em 80 colunas; blocos literais, tabelas e URLs longas
+  são as exceções habituais;
+
+- faça o sublinhado (e o sobrelinhado) dos títulos pelo menos tão longo
+  quanto o texto do título, levando em conta que os caracteres do leste
+  asiático ocupam duas colunas;
+
+- use UTF-8, sem marca de ordem de bytes (BOM) e sem espaços em branco no
+  fim das linhas;
+
+- mantenha a marcação reStructuredText válida. A marcação inline, como a
+  ênfase ou os literais inline, precisa estar separada do texto ao redor
+  por espaços ou pontuação, e a ordem das palavras de uma tradução pode
+  mudar o que fica ao redor dela. Quando a marcação precisar ser seguida
+  diretamente por texto, separe-os com um espaço escapado (uma barra
+  invertida seguida de um espaço), que não aparece na saída::
+
+    ``vmstat``\ *, mas por processo*
+
+Se algo realmente precisar ser explicado aos leitores da tradução, como um
+termo que não tem um equivalente estabelecido, marque-o claramente como
+uma nota do tradutor (``.. note::``) em vez de misturá-lo ao texto
+traduzido. Use essas notas com moderação; elas não são uma forma de
+acrescentar conteúdo.
+
+
+Qualidade da tradução
+=====================
+
+Fidelidade
+----------
+
+Compare a sua tradução com o original, parágrafo por parágrafo, antes de
+enviá-la. Procure por:
+
+- frases ou itens de lista que foram omitidos ou acrescentados;
+
+- afirmações cujo sentido mudou, por exemplo um pronome relativo que,
+  depois da tradução, passa a se referir a outro substantivo, ou um
+  "should" que virou um "must";
+
+- números, versões, nomes de opções e caminhos que mudaram ao serem
+  redigitados.
+
+Terminologia
+------------
+
+Use os mesmos termos que o restante da tradução para o seu idioma. Antes
+de escolher uma tradução para um termo técnico, pesquise nos documentos
+existentes::
+
+  $ git grep -i "<termo>" Documentation/translations/<lang>/
+
+Algumas equipes mantêm um glossário (por exemplo,
+Documentation/translations/zh_CN/glossary.rst); siga-o, se houver um.
+Muitos termos em inglês (kernel, patch, commit, driver, ...) costumam ser
+usados como estão por desenvolvedores que falam outros idiomas, e a
+tradução deve seguir o uso estabelecido pela comunidade em vez de impor um
+equivalente literal.
+
+Se você discorda de um termo estabelecido, proponha a mudança
+separadamente, para toda a tradução, em vez de introduzir um segundo termo
+em um documento novo.
+
+Idioma
+------
+
+Escreva um texto natural e gramaticalmente correto no seu idioma. Um
+revisor que precisa corrigir concordância, pontuação ou ordem das
+palavras em cada parágrafo não consegue prestar atenção ao conteúdo. Ler a
+página HTML gerada, em vez do arquivo-fonte, é uma boa forma de perceber
+frases estranhas.
+
+Tradução automática e ferramentas de IA
+---------------------------------------
+
+Você é responsável por cada palavra que envia. Se usar tradução automática
+ou um assistente de IA, revise e corrija o resultado com o mesmo cuidado
+que teria se o tivesse escrito; traduções enviadas sem esse trabalho
+dificilmente são aceitas, e os revisores podem perguntar como uma tradução
+foi produzida.
+
+As regras de :doc:`../process/coding-assistants` valem para as traduções
+como para qualquer outra contribuição; em particular, a tag
+``Signed-off-by:`` só pode ser adicionada pela pessoa que certifica a
+contribuição.
+
+
+Adicionando o documento à compilação
+====================================
+
+Um documento novo precisa estar listado em um ``toctree``; caso contrário,
+o Sphinx avisa que ele "isn't included in any toctree" e os leitores não
+conseguem encontrá-lo.
+
+Adicione-o ao ``index.rst`` do diretório no seu idioma, na mesma posição
+que ele ocupa no ``index.rst`` em inglês. Se o diretório ainda não existir
+na sua tradução, crie-o com um ``index.rst`` próprio e crie o link para
+esse índice a partir do índice do diretório acima.
+
+Algumas traduções mantêm, nos seus arquivos de índice, uma lista dos
+documentos que ainda não foram traduzidos. Se a sua mantiver, remova o
+documento dessa lista no mesmo patch.
+
+
+Compilando e verificando o seu trabalho
+=======================================
+
+Siga Documentation/doc-guide/sphinx.rst para preparar e rodar a
+compilação, e para olhar a página gerada. A única coisa específica de
+traduções é qual compilação rodar: compile a documentação completa com
+``make htmldocs``, não só o seu idioma com ``SPHINXDIRS``::
+
+  $ make SPHINXDIRS=translations/<lang> htmldocs   # ok enquanto trabalha
+  $ make htmldocs                                  # necessário antes do envio
+
+Uma compilação parcial não contém os documentos em inglês; por isso, não
+consegue detectar rótulos ou citações que colidem com eles, e informa
+como desconhecida toda referência a um documento em inglês, o que esconde
+os problemas reais no meio do ruído.
+
+A compilação completa já gera alguns avisos que não têm relação com a sua
+mudança. Compare os avisos antes e depois do seu patch para verificar que
+você não acrescentou nenhum, lembrando que o ``make cleandocs`` é
+necessário antes, já que uma compilação incremental não repete os avisos
+dos arquivos que não recompilou::
+
+  $ make cleandocs && make htmldocs 2>&1 | tee ../antes.log
+  $ git am minha-traducao.patch      # ou mude para o seu branch
+  $ make cleandocs && make htmldocs 2>&1 | tee ../depois.log
+  $ diff <(grep -E 'WARNING|ERROR' ../antes.log | sort) \
+         <(grep -E 'WARNING|ERROR' ../depois.log | sort)
+
+Rode também o ``tools/docs/checktransupdate.py`` no seu arquivo, para
+confirmar que ele reconhece a tradução, e o ``scripts/checkpatch.pl
+--strict -g HEAD``, como em qualquer outro patch do kernel (veja
+:doc:`../process/submitting-patches`). Os avisos do checkpatch mais
+comuns em patches de tradução são:
+
+- a falta do identificador de licença SPDX;
+
+- linhas mais longas que o limite;
+
+- a falta da descrição do commit;
+
+- "added, moved or deleted file(s), does MAINTAINERS need updating?";
+  este pode ser ignorado quando o diretório da tradução já é coberto por
+  uma entrada do MAINTAINERS, o que acontece com todas as traduções
+  existentes.
+
+
+Preparando o patch
+==================
+
+Escopo
+------
+
+Envie um documento por patch. Vários documentos relacionados podem ser
+enviados como uma série de patches, com um patch por documento.
+
+Nunca misture alterações na documentação em inglês e em uma tradução no
+mesmo patch. Elas são revisadas por pessoas diferentes, e a alteração em
+inglês pode precisar de várias revisões antes que a tradução possa
+acompanhá-la.
+
+Linha de assunto
+----------------
+
+Use o prefixo que a sua tradução já usa; ``git log --oneline --
+Documentation/translations/<lang>/`` o mostra. Exemplos de prefixos em uso
+atualmente são ``docs/zh_CN:``, ``docs/zh_TW:``, ``doc:it_IT:`` e
+``docs: pt_BR:``. Em seguida, descreva a mudança de forma breve::
+
+  docs: pt_BR: translate process/programming-language.rst
+
+Mensagem de commit
+------------------
+
+Escreva a mensagem de commit em inglês, para que todos os envolvidos na
+integração do patch possam lê-la. Diga qual documento foi traduzido ou
+atualizado e em qual estado do original a tradução se baseia. O script
+``checktransupdate.py`` reconhece a frase abaixo, seguida do hash
+abreviado (12 caracteres) e do assunto do último commit que alterou o
+original::
+
+  Update the translation through commit 1234567890ab
+  ("docs: some subject of the last change to the original")
+
+Com ela, o script consegue dizer exatamente quais mudanças do original
+ainda faltam na tradução, mesmo que a tradução tenha sido escrita muito
+depois desse commit. O hash e o assunto são mostrados por::
+
+  $ git log -1 --format='%h ("%s")' --abbrev=12 -- Documentation/<caminho>.rst
+
+Tags
+----
+
+As tags ficam em um único bloco no fim da mensagem de commit, como
+descrito em :doc:`../process/submitting-patches`. O ``Signed-off-by:``
+deve trazer o seu nome real.
+
+Quando você enviar uma nova versão de um patch, mantenha as tags
+``Reviewed-by:`` e ``Acked-by:`` que recebeu, a menos que o patch tenha
+mudado significativamente desde que elas foram dadas.
+
+
+Enviando o patch
+================
+
+Destinatários
+-------------
+
+Rode o ``scripts/get_maintainer.pl`` no patch para obter a lista de
+destinatários::
+
+  $ scripts/get_maintainer.pl 0001-docs-pt_BR-translate-something.patch
+
+Para uma tradução, isso normalmente inclui os mantenedores da tradução, o
+mantenedor da documentação e a lista de discussão linux-doc. Envie o patch
+para todos eles; deixar de fora o mantenedor da documentação, que aplica a
+maioria dos patches de tradução, é uma forma comum de ter um patch
+ignorado.
+
+Enviando
+--------
+
+Siga :doc:`../process/submitting-patches` para enviar o patch, e qualquer
+nova versão que a revisão peça, do mesmo jeito que para qualquer outro
+patch do kernel. Muitos contribuidores usam ``b4 prep`` e ``b4 send`` para
+preparar e enviar uma série de patches; eles cuidam automaticamente do
+encadeamento e da numeração de versão, o que ajuda a evitar linhas de
+assunto duplicadas e threads quebradas ao reenviar.
+
+
+O processo de revisão
+=====================
+
+Os patches de tradução são revisados pelos mantenedores da tradução e por
+outros falantes do idioma, e normalmente são aplicados pelo mantenedor da
+documentação depois que o mantenedor da tradução fica satisfeito. Um
+``Reviewed-by:`` do mantenedor da tradução costuma ser o sinal de que o
+patch está pronto.
+
+Os revisores normalmente verificam:
+
+- se o patch se aplica e compila sem avisos novos;
+
+- o cabeçalho do arquivo, os rótulos, as citações e as entradas de índice
+  descritos acima;
+
+- a fidelidade ao original;
+
+- a gramática, o estilo e a consistência da terminologia;
+
+- a mensagem de commit e as tags.
+
+Todos são bem-vindos para revisar patches de tradução. Revisões de outros
+falantes do idioma são valiosas, e revisar o trabalho de outras pessoas é
+também uma das melhores formas de aprender as convenções de uma tradução.
+Se você revisou um patch com cuidado e concorda com ele, diga isso com uma
+tag ``Reviewed-by:``.
+
+Tenha paciência. Os mantenedores das traduções são voluntários, e pode
+levar uma ou duas semanas para receber uma resposta, mais durante a janela
+de merge.
+
+
+Mantendo as traduções atualizadas
+=================================
+
+A documentação em inglês muda o tempo todo, e uma tradução desatualizada
+pode ser pior do que nenhuma. O ``tools/docs/checktransupdate.py`` lista,
+para cada arquivo traduzido, os commits no original que ainda não estão
+refletidos na tradução::
+
+  $ tools/docs/checktransupdate.py -l <lang>
+  $ tools/docs/checktransupdate.py Documentation/translations/<lang>/process/howto.rst
+
+Para atualizar uma tradução, aplique as mesmas mudanças que os commits
+listados fizeram no original, e nada além disso. Mencione esses commits na
+mensagem de commit, terminando com a frase "Update the translation through
+commit" descrita acima, para que a próxima execução do script comece do
+ponto certo.
+
+Quando um documento original for movido ou renomeado, mova a tradução da
+mesma forma, para que os caminhos continuem coincidindo. Quando um
+original for removido, remova também a tradução.
+
+
+Iniciando uma nova tradução
+===========================
+
+Um novo idioma é um compromisso de longo prazo: alguém precisa revisar as
+contribuições e manter os documentos existentes atualizados por anos.
+Antes de iniciar um, discuta a ideia na lista de discussão linux-doc.
+
+A primeira série de patches de uma nova tradução deve conter um pequeno
+número de documentos traduzidos com cuidado, que compilem sem avisos, além
+da infraestrutura de que toda tradução precisa:
+
+- um diretório ``Documentation/translations/<ll_CC>/``, com o nome formado
+  pelos códigos do idioma e do país (por exemplo, ``pt_BR``);
+
+- um ``index.rst`` para o idioma, com uma tradução do aviso de
+  :ref:`Documentation/translations/index.rst <translations_disclaimer>`,
+  normalmente em um arquivo separado incluído pelo índice;
+
+- uma entrada no ``toctree`` de Documentation/translations/index.rst;
+
+- uma entrada no dicionário ``all_languages`` de
+  ``Documentation/sphinx/translations.py``, que gera os links de idioma no
+  topo de cada página.
+
+Essas duas últimas listas são ordenadas alfabeticamente pelo nome do
+idioma em inglês; mantenha-as assim.
+
+Use o índice de uma tradução existente como modelo. Note que as diretivas
+``raw:: latex`` encontradas nesses arquivos selecionam as fontes usadas na
+saída em PDF, e que os idiomas escritos com caracteres do leste asiático
+precisam de configurações diferentes das dos outros.
+
+Uma entrada no MAINTAINERS para a nova tradução não faz parte do primeiro
+envio. Ela é algo que se conquista com um esforço demonstrado e
+contínuo, e é melhor discuti-la com o mantenedor da documentação depois
+que a tradução já existir há algum tempo.
+
+
+Lista de verificação
+====================
+
+Antes de enviar um patch de tradução, verifique se:
+
+- o documento original ainda não foi traduzido e ninguém mais está
+  trabalhando nele;
+
+- o arquivo reproduz o caminho e o nome do original;
+
+- o cabeçalho segue as convenções do seu idioma, começando pelo
+  identificador SPDX;
+
+- os rótulos do início do arquivo original foram removidos, e todos os
+  rótulos e nomes de citações restantes têm o prefixo do idioma;
+
+- as referências apontam para os documentos traduzidos, quando existirem,
+  e para os documentos em inglês, caso contrário;
+
+- os blocos literais, o código, os identificadores e os destinos das
+  referências estão inalterados;
+
+- a estrutura do original foi preservada e as linhas cabem em 80 colunas;
+
+- a tradução é fiel, gramaticalmente correta e usa a terminologia
+  estabelecida;
+
+- o documento está listado no ``index.rst`` correto;
+
+- a compilação completa com ``make htmldocs`` não acrescenta nenhum aviso,
+  e a página HTML aparece corretamente;
+
+- o ``scripts/checkpatch.pl --strict`` não aponta nenhum problema;
+
+- a mensagem de commit está em inglês, descreve a mudança e diz em qual
+  commit do original a tradução se baseia;
+
+- todas as tags estão em um único bloco e o ``Signed-off-by:`` usa o seu
+  nome real;
+
+- o patch é enviado, em texto puro, para todos os listados pelo
+  ``scripts/get_maintainer.pl``.
diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 5557c5e4e..23d27813d 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -68,6 +68,17 @@ kernel e sobre como ver seu trabalho integrado.
 
    process/index
 
+Ferramentas e processos de desenvolvimento
+==========================================
+
+Vários outros manuais com informações úteis para todos os desenvolvedores
+do kernel.
+
+.. toctree::
+   :maxdepth: 1
+
+   doc-guide/index
+
 Guias do usuário e do administrador
 ===================================
 
-- 
2.56.1


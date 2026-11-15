Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751658;
	b=gsuNUueDTeHmqDXvQ+WTxaSFQK1McTe6BWEf+HOG6vjnkTb/QRkTZjpeCtgjRRr/0LNA
	 VLoZN8rpPgZ0X5Zg2MLIvplpmZZBzWyajqhDAy55qk9XGxz5tF4bB7iAtfNaDcsQwRBlX
	 2sPBdnGHbQS6d8eXeSs4OdkTWS3NbJkd+xp6d+OGgMUqvhyukf/tyfr+pMlHTLWA+e0on
	 jVWtjce4hWneU3z14ySIJTHR03YtCznWSvi2cpBCRUcGOyYxksKvji4xA6YVT47mjyp7n
	 /7O9pdrOK/0hhbWmIQDsGY9ABiKc+7sYEWk4nvmbQmTHnE6twTl6SLbG+IlFG+GrY3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=OJFca1IrqJCommukdO3n/0kB3WMoRrx3bWcK3Wr+F+o=;
	b=vWUX/Mgwg7WrM99T1Y2qroxWBro1a8Ly5QPDAfam7lNqt9WK6x8+n4I4v6o1jdW/mGMO
	 48VdAk9oWlN+5rTUsxzGxo59RAq0/M8m4VHs3e5EHa1BX43ht2w3AjYY/KIvW/3fYjY45
	 lpFvzHgVRdPaVW1NBqKc+/5yymSSi5BQ0qXom5TnKNXxXlwRcYyMwtZVBYqnfEQ/HzJKT
	 2YciYwRoSgJmnVshb8cs0N85rLCB3109lNAayvmGkqCXMSoQz94ZU3zE5wrMXuES9ZEFV
	 IhBDkYkaM1vqwWTbfYsQmpNUQ+ISyd/80ARHYFvy31dVTYoqNt3KhIbPL8ZcXrH5dyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRllI1j2;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7315606A31D
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 14:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7315606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRllI1j2
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67daffde88dso97584d50.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 06:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794751657; x=1795356457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJFca1IrqJCommukdO3n/0kB3WMoRrx3bWcK3Wr+F+o=;
        b=XRllI1j2D4IJt+1KAWnjJHVgfb+UGZCF71XzMYbXVcj1KlGxMSNlFsIUu8T6YI3K1R
         tGCFkKzE80GqHEW0eEHf7fVrwTbwEtOLEZ4LxWwHbq6A9UoVkAqY/CofeKnbjY2PUFs3
         T0/0rzkoCGYHCbhgSqoqWhkPDa3B/S6ULoA7tadpSXaUaFcwH2PBBNHIfY8t9ufDPEJn
         v7Iiey04zospMH7HEWDVbVFgqvQvL3U7zQnn3vmA7U80VrRmWdTh5xMsTsvJs31ov4S7
         f4w0QVoONTbn+ApcXNosPJYwLvW39juGtMQVf9Xpn5NJ3HMw/be9kwE42T/43OrMnhH9
         DwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794751657; x=1795356457;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJFca1IrqJCommukdO3n/0kB3WMoRrx3bWcK3Wr+F+o=;
        b=Dq3IJk0YH9BPJbwhvpQUmXirNFAqN7QnX0uuexKi5dRAVrbgW3bUKLpgySOQhpfBwl
         yd2UDb1lLBgJ3Fi2VEd/JlbEajVi13IxeRPUsE2e/I5WmmjHmfAW+a7OSgQ3Auo8gVHt
         BZ45aKOiZYZBdm5QDVV4v9Js3mfr7JHZtVMhKjn1/U+5wDHJX1ZoLZ2rTAdRJDWFFLUF
         5agAtddfVy00JPYLxDgDCgU+sCUDvEKS/hyqdlD+uiVa6QXtPk8wn1AVxdDNNe6fnxzg
         5z5r/qjwFNOZnYq/9Lci+reDVsWqdpBjN77fbN3XytepogBsgvlE5kSXXnVSA48U+87C
         703Q==
X-Gm-Message-State: APuU4Z/gHWhjLrZbVFr9VxRtBhwu9PyYBpARXgulhlrvPtct56D7KPeC
	qw/t9iYURg5O2981Vsh8JYxClLsdZSXbVwDIM17Ef5pPUEJxoczsyDF9x1Mr+nRx
X-Gm-Gg: AYBFou0TgaT7+r75XvyJskE46i8JOnmccDauZl1SFc5mNkUSW1sUZnmxGe2SwPiaXeb
	PdWvo5zECQPAe6G33PjG3sScFn+IOHJoIoZ32cl0DGieKIqiARpvdNlT4gD+nRBDx2hBeCHm37W
	vxdoCh4AqUyAYf672tyaOggh5DRhqoxKYswythd6/LLvgVqcHz6CeAymKHLySGpIqLysAdSKMCB
	XUFgnvjubMVd/i8paTDBoAwETHSu2Q28TARre8DPTbh2Y4X3dK7qPf+WLS0CPQCy0cCn96HL/rI
	MnQRtVl0XpSVC9z4iwtiMibUekttw68AiVdAyWi4ZfmrSb5WFl/X9XBbLDwAv66gQ73SNjleQob
	k4qsTalAv56u/QhjXtnxI17ZjbPgnQH8VHCFZa3VcdgpYD13K3/588N5ulpQoK/pAaMk15w/3Sz
	SePpiVnfc3uk7Ldkh3e3AqjPbheKndasi5D/vXs1CBHj6rLR+Zm8hGiuDZs2bxKjms2ru2QYrCx
	L4mYyFxIKFZF6JEEMYACkxNjf21/axHyj0gELeB2/G5pIi6iTGQJgEDQetnLtFp4Z7B6mYradUt
	LqKhlkwlCrUEqOkBnG17jRV4kc1eP9LVnljkRtz9K7UELyuDn8Icl1UTXXfXF8Rp4mv5B7tGt6S
	sQL8=
X-Received: by 2002:a05:690e:12c2:b0:67c:1907:922c with SMTP id 956f58d0204a3-67d895e627amr3639209d50.44.1794751656403;
        Sun, 15 Nov 2026 06:07:36 -0800 (PST)
Received: from dell-pro-plus ([2804:29b8:5080:dd51:39c5:770e:6bea:512e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a629a2dsm7453937d50.21.2026.11.15.06.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:07:35 -0800 (PST)
From: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
To: linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Subject: [PATCH v2] docs: translations: pt_BR: add researcher guidelines
Date: Sun, 15 Nov 2026 11:06:31 -0300
Message-ID: <20261115140631.70601-1-ic.gabrielribeiro@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Translate the kernel researcher guidelines into Brazilian Portuguese and
link the page from the pt_BR process index.

Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
---
Changes in v2:
- Preserve the existing toctree indentation when adding the new entry.

 Documentation/translations/pt_BR/process/index.rst |   1 +
 .../pt_BR/process/researcher-guidelines.rst         | 176 ++++++++++++++++++
 2 files changed, 177 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index da92a7026e..cb9724b5f0 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -66,6 +66,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
    A interface de drivers do kernel Linux <stable-api-nonsense>
    Estilo de gerenciamento do kernel Linux <management-style>
+   Diretrizes para pesquisadores <researcher-guidelines>
    Assistentes de código <coding-assistants>
    O manual da árvore tip <maintainer-tip>
    Conclave (Continuidade do projeto) <conclave>
diff --git a/Documentation/translations/pt_BR/process/researcher-guidelines.rst b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
new file mode 100644
index 0000000000..5ebc72cd2d
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
@@ -0,0 +1,176 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_BR_researcher_guidelines:
+
+Diretrizes para pesquisadores
++++++++++++++++++++++++++++++
+
+A comunidade do kernel Linux dá boas-vindas à pesquisa transparente sobre o
+kernel Linux, as atividades envolvidas em sua produção e quaisquer outros
+subprodutos de seu desenvolvimento. O Linux se beneficia muito desse tipo de
+pesquisa, e a maioria de seus aspectos é impulsionada por pesquisas de uma
+forma ou de outra.
+
+A comunidade agradece muito quando pesquisadores compartilham resultados
+preliminares antes de torná-los públicos, especialmente se a pesquisa envolver
+segurança. O envolvimento antecipado ajuda a melhorar a qualidade da pesquisa
+e também a capacidade do Linux de melhorar a partir dela. Em qualquer caso,
+recomenda-se compartilhar com a comunidade cópias de acesso aberto dos
+trabalhos publicados.
+
+Este documento busca esclarecer quais práticas a comunidade do kernel Linux
+considera aceitáveis e inaceitáveis na realização desse tipo de pesquisa. No
+mínimo, essas pesquisas e atividades relacionadas devem seguir as regras
+padrão de ética em pesquisa. Para saber mais sobre ética em pesquisa em geral,
+ética em tecnologia e, em particular, pesquisa sobre comunidades de
+desenvolvedores, consulte:
+
+* `História da ética em pesquisa <https://www.unlv.edu/research/ORI-HSR/history-ethics>`_
+* `Ética da IEEE <https://www.ieee.org/about/ethics/index.html>`_
+* `Perspectivas de desenvolvedores e pesquisadores sobre a ética de experimentos em projetos de código aberto <https://arxiv.org/pdf/2112.13217.pdf>`_
+
+A comunidade do kernel Linux espera que todos que interagem com o projeto
+estejam agindo de boa-fé para tornar o Linux melhor. Pesquisas sobre qualquer
+artefato produzido pela comunidade do kernel Linux que esteja disponível
+publicamente (incluindo, mas não se limitando ao código-fonte) são bem-vindas;
+pesquisas sobre desenvolvedores, porém, devem ocorrer somente mediante adesão
+explícita dos próprios desenvolvedores.
+
+Pesquisas passivas baseadas inteiramente em fontes disponíveis publicamente,
+incluindo publicações em listas de discussão públicas e commits em
+repositórios públicos, são claramente permitidas. Ainda assim, como em
+qualquer pesquisa, a ética padrão deve ser respeitada.
+
+Pesquisas ativas sobre o comportamento de desenvolvedores, por outro lado,
+devem ser realizadas com o acordo explícito dos desenvolvedores envolvidos e
+com plena divulgação a cada um deles. Não se pode interagir com
+desenvolvedores nem realizar experimentos com eles sem consentimento; isso
+também faz parte da ética padrão em pesquisa.
+
+Questionários
+=============
+
+Pesquisas frequentemente assumem a forma de questionários enviados a
+mantenedores ou colaboradores. Como regra geral, porém, a comunidade do kernel
+obtém pouco valor desses questionários. O processo de desenvolvimento do
+kernel funciona porque todos os desenvolvedores se beneficiam de sua
+participação, inclusive ao trabalhar com outros que têm objetivos diferentes.
+Responder a um questionário, porém, é uma demanda unilateral imposta a
+desenvolvedores ocupados, sem benefício correspondente para eles ou para a
+comunidade do kernel como um todo. Por esse motivo, esse método de pesquisa
+é desencorajado.
+
+Os membros da comunidade do kernel já recebem emails em excesso e
+provavelmente verão pedidos para responder a questionários como mais uma
+demanda por seu tempo. Enviar esses pedidos priva a comunidade do tempo
+valioso de seus colaboradores e dificilmente produzirá respostas
+estatisticamente úteis.
+
+Como alternativa, pesquisadores devem considerar participar de eventos para
+desenvolvedores, organizar sessões em que possam explicar o projeto de
+pesquisa e seus benefícios para os participantes e interagir diretamente com
+a comunidade nesses eventos. As informações obtidas serão muito mais ricas
+que as de um questionário por email, e a comunidade também poderá aprender
+com as percepções dos pesquisadores.
+
+Patches
+=======
+
+Para esclarecer: enviar patches aos desenvolvedores *é* interagir com eles,
+mas eles já consentiram em receber *contribuições de boa-fé*. Não há
+consentimento para enviar patches intencionalmente defeituosos ou vulneráveis,
+nem para contribuir com informações enganosas nas discussões. Esse tipo de
+comunicação pode prejudicar o desenvolvedor (por exemplo, consumindo tempo,
+esforço e ânimo) e o projeto, ao corroer a confiança de toda a comunidade de
+desenvolvimento no colaborador (e também na organização à qual ele pertence),
+prejudicar os esforços para oferecer feedback construtivo aos colaboradores
+e expor os usuários finais ao risco de falhas de software.
+
+A participação de pesquisadores no próprio desenvolvimento do Linux, assim
+como a de qualquer pessoa, é bem-vinda e incentivada. Pesquisar o código do
+Linux é uma prática comum, especialmente ao desenvolver ou executar
+ferramentas de análise que produzam resultados acionáveis.
+
+Ao interagir com a comunidade de desenvolvimento, enviar um patch tem sido
+tradicionalmente a melhor maneira de causar impacto. O Linux já tem muitos
+bugs conhecidos — o que é muito mais útil são correções verificadas. Antes de
+contribuir, leia atentamente a documentação apropriada:
+
+* Documentation/process/development-process.rst
+* Documentation/process/submitting-patches.rst
+* Documentation/admin-guide/reporting-issues.rst
+* Documentation/process/security-bugs.rst
+
+Em seguida, envie um patch (incluindo uma mensagem de commit com todos os
+detalhes listados abaixo) e acompanhe qualquer feedback de outros
+desenvolvedores.
+
+Ao enviar patches produzidos a partir de pesquisas, as mensagens de commit
+devem conter pelo menos os detalhes a seguir, para que os desenvolvedores
+tenham contexto suficiente para entender a contribuição. Responda:
+
+* Qual é o problema específico encontrado?
+* Como se pode chegar a esse problema em um sistema em execução?
+* Que efeito a ocorrência do problema teria no sistema?
+* Como o problema foi encontrado? Especificamente, inclua detalhes sobre
+  quaisquer testes, programas de análise estática ou dinâmica e outras
+  ferramentas ou métodos usados no trabalho.
+* Em qual versão do Linux o problema foi encontrado? Recomenda-se fortemente
+  usar a versão mais recente ou um branch recente do linux-next (veja
+  Documentation/process/howto.rst).
+* O que foi alterado para corrigir o problema e por que se acredita que a
+  correção está correta?
+* Como a alteração foi testada em compilação e em tempo de execução?
+* Qual commit anterior esta alteração corrige? Isso deve constar em uma tag
+  "Fixes:", conforme descrito na documentação.
+* Quem mais revisou este patch? Isso deve constar nas tags "Reviewed-by:"
+  apropriadas; veja abaixo.
+
+Por exemplo::
+
+  From: Author <author@email>
+  Subject: [PATCH] drivers/foo_bar: Add missing kfree()
+
+  The error path in foo_bar driver does not correctly free the allocated
+  struct foo_bar_info. This can happen if the attached foo_bar device
+  rejects the initialization packets sent during foo_bar_probe(). This
+  would result in a 64 byte slab memory leak once per device attach,
+  wasting memory resources over time.
+
+  This flaw was found using an experimental static analysis tool we are
+  developing, LeakMagic[1], which reported the following warning when
+  analyzing the v5.15 kernel release:
+
+   path/to/foo_bar.c:187: missing kfree() call?
+
+  Add the missing kfree() to the error path. No other references to
+  this memory exist outside the probe function, so this is the only
+  place it can be freed.
+
+  x86_64 and arm64 defconfig builds with CONFIG_FOO_BAR=y using GCC
+  11.2 show no new warnings, and LeakMagic no longer warns about this
+  code path. As we don't have a FooBar device to test with, no runtime
+  testing was able to be performed.
+
+  [1] https://url/to/leakmagic/details
+
+  Reported-by: Researcher <researcher@email>
+  Fixes: aaaabbbbccccdddd ("Introduce support for FooBar")
+  Signed-off-by: Author <author@email>
+  Reviewed-by: Reviewer <reviewer@email>
+
+Se você está contribuindo pela primeira vez, recomenda-se que o patch seja
+revisado por outras pessoas em caráter privado antes de ser enviado às listas
+públicas. (Isso é obrigatório se tiverem lhe dito explicitamente que seus
+patches precisam de uma revisão interna mais cuidadosa.) Espera-se que essas
+pessoas tenham a tag "Reviewed-by" incluída no patch resultante. Encontrar
+outro desenvolvedor familiarizado com contribuições ao Linux, especialmente
+na sua própria organização, e pedir ajuda para revisar antes do envio às
+listas públicas tende a melhorar significativamente a qualidade dos patches
+e, assim, reduzir a carga de trabalho de outros desenvolvedores.
+
+Se não for possível encontrar alguém para revisar os patches internamente e
+você precisar de ajuda para encontrar essa pessoa, ou se tiver outras dúvidas
+sobre este documento e as expectativas da comunidade de desenvolvimento,
+entre em contato com a lista privada de emails do Conselho Consultivo
+Técnico: <tech-board@groups.linuxfoundation.org>.

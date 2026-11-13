Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585753;
	b=a4SnXx9gbprxS2zk3IyYXF/gdtLY2Hh6Ng1/0AEIzFMKNR7KHFOC0k5Dq/s3uKNIbj7V
	 4SBQOzr7gLXL2WjJ1hxSryrggp/QGQrcuxiWq83I7xXiKo39Ovlv444j32i39dcWTD3iG
	 yfrDUOMFyNfQRmNWzfLCEKJz3aczJjYBsfyXQOw0qQfzZpKvJt6ULx1x87xo54IOfaknB
	 Dpl15gKEXjcXW01v0gyIukrGifHG0RceOGNkLj819dYQ8ZPLr6/N7/3ZGttQdctKrtPKX
	 wDoOQ+sW1RB3fyFDLuNybtHnFvldEw+cs5BsSgOWcsKz7wTdd20xAVcs15fnXmhLfTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MNUoIzyeaKo/uF6h8gon1B39RII7Y8clZOK5xI9vBmY=;
	b=0qTHODO8DYT8JyYK9m8hqDkPcucnZkRX4SvizvKK1ZQ1SDxR/nEJI7aDAeJyIcEB9Ej2
	 qWNBTTL1hXxDbEQEEYlo258RHh4BUAcdmDjpsalJnmnki6rEtte6P1N4nlAi/t3ls1mcL
	 JhITUvYYg9RCJrLVXfpLOxWS1ZTswXUWEnd0scofnlLu/76XSsfXzlq1/3c1n+9f/QvgA
	 W0rtZV0S0Z0Gsmdf1G2hsLjrbG8Eo3h5sqT8h0peHGgXwNCEeqgy7R5Hs4Gpn0d82N4P6
	 Wbc1Jqhyy3kAA5IwzX18t9jjfl6fv+c6vq5AaeTPOZWj/erfT3i97ZQeA2KqN4l9jhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxsPxteg;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB56606AE1F
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 16:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB56606AE1F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxsPxteg
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b3a332105bso10487357b3.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585752; x=1795190552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MNUoIzyeaKo/uF6h8gon1B39RII7Y8clZOK5xI9vBmY=;
        b=pxsPxteg6J3nI56+e5asagA9q3vTZM5YhhZlkV2F4SsuwFvU51T4jtC3vKKohuDyQw
         YM77XieyG9GMoUorWhwmeup/er3NomA+z9optgxaMApBvGiFLSd3Ru9Oe5JLK64YFdnE
         gLXLcFzeywCLM2HGxyPXID2fFXZf+8kK5k1e/sPgwEcVGIkYUN1vlur8psdUs35dydf4
         nHBrgh6BH9Bbx7BrWOG1rW4RH6AFLXufp52eZ6+C9lNa0DolxqVk+b5zdDa6/3sP3pyG
         VIkLX7DvBoVdUsWhpapVrq2Z9ypl/wFKiYf2I/e7CrvDHOcSYNC5hya7VGHA0q3mN6rJ
         AwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585752; x=1795190552;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MNUoIzyeaKo/uF6h8gon1B39RII7Y8clZOK5xI9vBmY=;
        b=1cUc95QkyHNhnBlFopR/pxpJkwpGWqWHG4vs65qXZILD2txKWJ3oiWgp8dFOTKowKG
         C9RfHRnOwe8GYyqj0YRJqDAKygQjr3s1Yz15cdOKvmmnZ1swl6c4t5T/v/FKMsgpy77K
         S+kQ30jOqsy8/URmhfi8iZAJxjErd+SG3UZD8eHXOIk6qC5Zxxx7HASMflJhbVpqLtXt
         QQ4brfMVn0H5GaNm7i6fwqpB5ZlDzybkwak+NIXhvIZPv0jjSGzXiqvHuPvAlOd0+Ks7
         KNNKhPXtjcd/FT8LbWxgxy6hGrskdqVY0cV4w9sH0FbXxkhs1q420z9uUes7PBXDH8/a
         OwUg==
X-Gm-Message-State: APuU4Z9U9eikOe2Z14AfEJN4TNTrYjNtTMoMXJwly8wNIU+pPs5TM0x9
	ubWWBFfUlSfqRh6b37oTQJIyalN/hZCC0WZF7UrWEKZ+7r0xrJdZLbN+Ge2VW0Q8
X-Gm-Gg: AYBFou3OEjZhWHL6Fh1c8r2letCbWY0J2ixVtAp+RiunFZ1GQDLjft/CCsmQEWk2pPy
	gczQD7NT0d0WuwgpaPyLJYucsI85e1sPR/QCSMDk1iQY1v1mh2P+K8CcdlaPEfMOVJ5kbgjQbvF
	n8W8ZRwgtMmtBAIoClFTZWuVmIVU6HnblAziMIok78s/A3xrY1O+BQLkovlNcpfZa6hV/ifwOFL
	NsEi9Mq0kKQfubZYW05uHTn1xE5AJD3ZNv60cfY2AaGbX+GxaYiWwcG2NeIPcm437ikeZt7pi55
	OfDCksdQPRhbUBGrO7bq5jnCv22fYOrOoDNS889InKYDlTIznPDzlJkei8N1somfv9PMt9WlDYH
	mRb3u19dwh06D3NC6fEJECkFkmnG1GySZdW26tEXyDoAclpO2L6ANbgKHEYe0T+DdH+nGZioCiT
	Qff/mYFEQ7imPHngTzhZtBfZoe/WBUHNcZ2cOlmYTKzkpPPExK/675CwcS+oIJ+UZyWvV18qqjJ
	4reyDqRO65DJQ/2sAXy5R0/qUISu1xXMnkiTVwTaOOkkOsWplZtgmkSX5+EotoR0c2iJo+Sl0Lq
	JbbfpPXCxtbNgQlC+jU818FVeAnweINH41hCPOIrEOz6/FmxqUW6r+2uX/sKefee9igXMXV8pvP
	6h3s=
X-Received: by 2002:a05:690c:e20b:10b0:8b1:60a0:c311 with SMTP id 00721157ae682-8b4aa2fa74dmr11913577b3.33.1794585750867;
        Fri, 13 Nov 2026 08:02:30 -0800 (PST)
Received: from dell-pro-plus ([2804:29b8:5080:dd51:39c5:770e:6bea:512e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm23456747b3.1.2026.11.13.08.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:02:29 -0800 (PST)
From: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
To: linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: add researcher guidelines
Date: Fri, 13 Nov 2026 13:01:53 -0300
Message-ID: <20261113160153.216027-1-ic.gabrielribeiro@gmail.com>
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

---
 Documentation/translations/pt_BR/process/index.rst |   1 +
 .../pt_BR/process/researcher-guidelines.rst         | 176 ++++++++++++++++++
 2 files changed, 177 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index da92a7026e..05f4cd7915 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -63,10 +63,11 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Interpretação do Código de Conduta do Kernel Linux <code-of-conduct-interpretation>
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
    Declaração de Aplicação do Kernel Linux <kernel-enforcement-statement>
-   Declaração sobre Drivers do Kernel <kernel-driver-statement>
-   A interface de drivers do kernel Linux <stable-api-nonsense>
-   Estilo de gerenciamento do kernel Linux <management-style>
-   Assistentes de código <coding-assistants>
+    Declaração sobre Drivers do Kernel <kernel-driver-statement>
+    A interface de drivers do kernel Linux <stable-api-nonsense>
+    Estilo de gerenciamento do kernel Linux <management-style>
+    Diretrizes para pesquisadores <researcher-guidelines>
+    Assistentes de código <coding-assistants>
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

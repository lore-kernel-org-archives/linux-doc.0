Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8246D4A2070
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 19:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069888; cv=none; b=XlzmltRXb1IWBK3eZeDvn51FR8JnEeaL11rEKSjAMfclYFCX79kbFo7lhjKpv1MTUBDKfxeJCTB73WqyOd0bU4zrY/YazA7oCI3DfaLRpyPu60MtwrYLj0LWs94UrsQMChuACGlFXSDs4+abvtEEZShGwG0qWaBJZTB8YGxbK40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069888; c=relaxed/simple;
	bh=rRtqvl8JgFS0JvZRF+E5yuj0Hcgy+tOlPjvYDSVC1Io=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cSm7qZinPRhcgEj0LhbKDsGQUlZmTzi+MvvMx8GR8pucYAqWEvF5X8QQxwWEpIJhFvyts6nzfLFTs1WeG849QGbSwvNiAXKM9Zl8ij/Gy+xEqemP41U+fapB5zJCjt4XRR0gatvOHZ+UU8OecDZyS6j9YGJ04pO5FEpcooEWDXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7cOVNPh; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7cOVNPh"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e51697aso123953e0c.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 12:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789069881; x=1789674681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1prNGuzBOvDSsBnqEYWG62Rgw7LFhz/O8cWhOWk4Zdc=;
        b=o7cOVNPhTxxH7EDZFJoIHKidK3YMhJPpC9oADnI+dRkdazSRaiVR7txJC6nad0nXPN
         RGuCM8AWM5fVyUdroxxJbnkOAYse1Cj4uKRxSlwKSKoqjJq1MyjX92HF3Oe+csaBXEfJ
         TltzcW2lL63lwUKlpvE/RH/5XqRmaSDYOhFz610lF7feJ76aO7i79lHJ9K668zH9OOHo
         6X2KTmZNLWuO3iy8QTW01K5SyoUoaIU0CjkVx2DrNnI7ne6KE5ePeJq3zD9XEV2KCB0l
         0nIMk2yzE+s6KyyqCZho7uNDkWgjWmEMZYYP9MLJFJlxtnJHHNjvF0Q7peBy8PkR3qk2
         ffWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069881; x=1789674681;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1prNGuzBOvDSsBnqEYWG62Rgw7LFhz/O8cWhOWk4Zdc=;
        b=hH9wVCI14dVtlCxwQGHCFlb7O4MWqT229avku4XTVRTQdsa8NoMAtfp3lHIL1ZnrFi
         JeITtZ4bBpplO2tB5S4/0CYH8ej1vnAskxbenccLZoitKgxqiHgWLEDX6IRL6bI1ge21
         +lrD/tzNj4pM5KcDbfGJlBi9wFX+T4R/vbAw8602q/VB3KT0DhBRtTYWlWlB04Gdt3Ru
         xofEMCfH9k/hoQusdJ848FcMt1dJiVgD4pmiQcyPemHH9oti4fmh63M78hqFthWuNq9g
         H00cfTfQ4stt4kX5Q5Kehjy2ORRn/j9i/QW3weB7BSpZpKqd/VUEftWImJTtpBffZC9r
         r9Kg==
X-Gm-Message-State: AFuF++niO2OcFVFX4CDfdJpvrJj117yad8G62ZOw71IS4WiQhhbBRUOE
	DScPZbLnf7BenvqXpNGwmrjKQt7i1klsVEtIAtUXCH1L1JMjeiOmgsAe
X-Gm-Gg: AYBFou3My7rRouY4G1u8n3c/17c2K9+TBqMrhlB9esL/qab26k2+ZeCj6qCBp1NvICk
	RMhGNlve50HyBXPs9VR9QXaBX929NTKXPkLimp4+FdjaQiBtbfI2KW1U0q8aK7K9MR+WDcWRslt
	Ap6GC0gfbBLrZFzMpgcaNB0w+r4bzjemzGKAcf676XhUlMeNCfEAb0Pq3eSg40UUEI8prvMUL0U
	+jXRHGBek72vnxk2+6bjSWQtFgWk69fnLSXuNXOe7eDF07tqgBnUmi5DLTLzly5Pedsswczt7JQ
	RlPXcLZzt/AnuZyJQVJAZQBw9I46Qh7FP6HYQdBof2t6CZDg6s47eGRYiXLgxxQAp/qjEGWWd4Y
	Rb5CyWQAgE8qR7femU3LQ1FcRbEkspWNdRp7Pd3RyzBIxU4vLbGXDBxtFYtnsZxJWItOEYIbVW7
	cbUYIV28QhyxGX71f5ttehM+2sOVv14AtOM2Em6MEP8+H3qykoFM2ax9LSTtjq49bqEVUQb1shb
	1CuNxKT2cgV
X-Received: by 2002:a05:6102:3a13:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-792ab142031mr1518974137.9.1789069876095;
        Thu, 10 Sep 2026 12:51:16 -0700 (PDT)
Received: from x-wing ([2804:14d:78b6:4583:ad1c:1455:3098:a6a8])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9a297edsm616354241.0.2026.09.10.12.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:51:15 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: [PATCH v3] docs: translations: pt_BR: translate researcher-guidelines.rst
Date: Thu, 10 Sep 2026 16:51:09 -0300
Message-ID: <20260910195109.1712-1-silvapfabio@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate researcher-guidelines.rst into Brazilian Portuguese and add it
to the pt_BR process documentation index.

Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
---
Changes in v3:
- Remove Assisted-by trailer.

Changes in v2:
- Add document to Documentation/translations/pt_BR/process/index.rst
  instead of the top-level index.
- Remove top-of-file Sphinx label to prevent cross-reference and build conflict.
- Fix trailing newline at end of file.

v2: https://lore.kernel.org/r/20260910190745.1676-1-silvapfabio@gmail.com
v1: https://lore.kernel.org/r/20260910151155.1237-1-silvapfabio@gmail.com

 .../translations/pt_BR/process/index.rst      |   1 +
 .../pt_BR/process/researcher-guidelines.rst   | 173 ++++++++++++++++++
 2 files changed, 174 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/researcher-guidelines.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index 7841eca..edef9b5 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -60,6 +60,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
    Estilo de gerenciamento do kernel Linux <management-style>
+   Diretrizes para pesquisadores <researcher-guidelines>
    Assistentes de código <coding-assistants>
    Conclave (Continuidade do projeto) <conclave>
 
diff --git a/Documentation/translations/pt_BR/process/researcher-guidelines.rst b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
new file mode 100644
index 0000000..5daf25d
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
@@ -0,0 +1,173 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Diretrizes para pesquisadores
++++++++++++++++++++++++++++++
+
+A comunidade do kernel Linux dá boas-vindas a pesquisas transparentes sobre o
+kernel Linux, as atividades envolvidas em sua produção e quaisquer outros
+subprodutos de seu desenvolvimento. O Linux se beneficia muito desse tipo de
+pesquisa, e a maioria dos aspectos do Linux é orientada por pesquisa de uma
+forma ou de outra.
+
+A comunidade aprecia muito quando pesquisadores compartilham descobertas
+preliminares antes de tornar seus resultados públicos, especialmente quando a
+pesquisa envolve segurança. Envolver-se cedo ajuda a melhorar tanto a
+qualidade da pesquisa quanto a capacidade do Linux de se beneficiar dela. Em
+qualquer caso, recomenda-se compartilhar com a comunidade cópias de acesso
+aberto das pesquisas publicadas.
+
+Este documento procura esclarecer quais práticas a comunidade do kernel Linux
+considera aceitáveis e não aceitáveis ao realizar esse tipo de pesquisa. No
+mínimo, essa pesquisa e as atividades relacionadas devem seguir as regras
+éticas padrão de pesquisa. Para obter mais informações sobre ética em pesquisa
+em geral, ética na tecnologia e pesquisas sobre comunidades de desenvolvedores
+em particular, consulte:
+
+* `História da ética em pesquisa <https://www.unlv.edu/research/ORI-HSR/history-ethics>`_
+* `Ética do IEEE <https://www.ieee.org/about/ethics/index.html>`_
+* `Visões de desenvolvedores e pesquisadores sobre a ética de experimentos em projetos de código aberto <https://arxiv.org/pdf/2112.13217.pdf>`_
+
+A comunidade do kernel Linux espera que todos que interagem com o projeto
+participem de boa-fé para tornar o Linux melhor. Pesquisas sobre qualquer
+artefato disponível publicamente (incluindo, entre outros, o código-fonte)
+produzido pela comunidade do kernel Linux são bem-vindas, embora pesquisas
+sobre desenvolvedores devam ser explicitamente opcionais.
+
+Pesquisas passivas baseadas inteiramente em fontes disponíveis publicamente,
+incluindo publicações em listas de discussão públicas e commits em
+repositórios públicos, são claramente permitidas. No entanto, como em
+qualquer pesquisa, a ética padrão ainda deve ser seguida.
+
+Pesquisas ativas sobre o comportamento de desenvolvedores, por outro lado,
+devem ser realizadas com a concordância explícita e a divulgação completa aos
+desenvolvedores envolvidos. Desenvolvedores não podem ser envolvidos ou
+submetidos a experimentos sem consentimento; isso também faz parte da ética
+padrão de pesquisa.
+
+Pesquisas
+=========
+
+Frequentemente, pesquisas assumem a forma de questionários enviados a
+mantenedores ou colaboradores. Como regra geral, porém, a comunidade do
+kernel obtém pouco valor desses questionários. O processo de desenvolvimento
+do kernel funciona porque cada desenvolvedor se beneficia de sua participação,
+mesmo trabalhando com outras pessoas que têm objetivos diferentes. Responder
+a um questionário, no entanto, é uma exigência unilateral colocada sobre
+desenvolvedores ocupados, sem benefício correspondente para eles ou para a
+comunidade do kernel como um todo. Por esse motivo, esse método de pesquisa é
+desencorajado.
+
+Os membros da comunidade do kernel já recebem e-mails demais e provavelmente
+perceberão solicitações de questionário como mais uma exigência sobre seu
+tempo. Enviar essas solicitações priva a comunidade de um tempo valioso dos
+colaboradores e dificilmente produzirá uma resposta estatisticamente útil.
+
+Como alternativa, pesquisadores devem considerar participar de eventos de
+desenvolvedores, organizar sessões nas quais o projeto de pesquisa e seus
+benefícios para os participantes possam ser explicados e interagir diretamente
+com a comunidade nesses espaços. As informações recebidas serão muito mais
+ricas do que as obtidas em uma pesquisa por e-mail, e a comunidade se
+beneficiará da oportunidade de aprender com seus conhecimentos.
+
+Patches
+=======
+
+Para esclarecer: enviar patches aos desenvolvedores *é* interagir com eles,
+mas eles já consentiram em receber *contribuições de boa-fé*. O envio de
+patches intencionalmente defeituosos ou vulneráveis, ou a contribuição de
+informações enganosas para discussões, não é algo consentido. Essa
+comunicação pode prejudicar o desenvolvedor (por exemplo, consumindo tempo,
+esforço e motivação) e prejudicar o projeto ao erodir toda a confiança da
+comunidade de desenvolvedores no colaborador (e em sua organização como um
+todo), enfraquecendo os esforços para fornecer feedback construtivo aos
+colaboradores e colocando usuários finais em risco de falhas de software.
+
+A participação no próprio desenvolvimento do Linux por pesquisadores, assim
+como por qualquer outra pessoa, é bem-vinda e incentivada. Pesquisar o código
+do Linux é uma prática comum, especialmente no desenvolvimento ou na execução
+de ferramentas de análise que produzem resultados acionáveis.
+
+Ao interagir com a comunidade de desenvolvedores, enviar um patch tem sido
+tradicionalmente a melhor forma de causar impacto. O Linux já tem muitos bugs
+conhecidos; o que é muito mais útil é ter correções examinadas. Antes de
+contribuir, leia atentamente a documentação apropriada:
+
+* Documentation/process/development-process.rst
+* Documentation/process/submitting-patches.rst
+* Documentation/admin-guide/reporting-issues.rst
+* Documentation/process/security-bugs.rst
+
+Em seguida, envie um patch (incluindo um registro do commit com todos os
+detalhes listados abaixo) e acompanhe qualquer feedback de outros
+desenvolvedores.
+
+Ao enviar patches produzidos a partir de pesquisas, os registros dos commits
+devem conter pelo menos os detalhes a seguir, para que os desenvolvedores
+tenham o contexto apropriado para entender a contribuição. Responda:
+
+* Qual é o problema específico encontrado?
+* Como o problema poderia ser alcançado em um sistema em execução?
+* Que efeito o encontro do problema teria sobre o sistema?
+* Como o problema foi encontrado? Inclua especificamente detalhes sobre
+  quaisquer programas de teste, análise estática ou dinâmica e quaisquer
+  outras ferramentas ou métodos usados no trabalho.
+* Em qual versão do Linux o problema foi encontrado? É fortemente preferível
+  usar a versão mais recente ou uma branch linux-next recente (consulte
+  Documentation/process/howto.rst).
+* O que foi alterado para corrigir o problema e por que se acredita que a
+  correção está correta?
+* Como a alteração foi testada na compilação e em tempo de execução?
+* Qual commit anterior esta alteração corrige? Isso deve constar em uma tag
+  `Fixes:`, conforme descrito na documentação.
+* Quem mais revisou este patch? Isso deve constar nas tags `Reviewed-by:`
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
+Se você é um colaborador de primeira viagem, recomenda-se que o próprio patch
+seja avaliado por outras pessoas em particular antes de ser publicado nas
+listas públicas. (Isso é obrigatório se tiver sido explicitamente informado
+de que seus patches precisam de uma revisão interna mais cuidadosa.) Espera-se
+que essas pessoas incluam sua tag `Reviewed-by` no patch resultante. Encontrar
+outro desenvolvedor familiarizado com a contribuição para o Linux, especialmente
+dentro da sua própria organização, e pedir ajuda para revisar antes de enviar
+os patches às listas públicas tende a melhorar significativamente a qualidade
+dos patches resultantes e, com isso, reduzir a carga sobre os demais
+desenvolvedores.
+
+Se ninguém puder revisar os patches internamente e você precisar de ajuda para
+encontrar alguém, ou se tiver outras perguntas relacionadas a este documento e
+às expectativas da comunidade de desenvolvedores, entre em contato com a lista
+de discussão privada do Technical Advisory Board:
+<tech-board@groups.linuxfoundation.org>.
\ No newline at end of file
-- 
2.43.0


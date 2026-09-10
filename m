Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12FF53D0BB
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 19:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067275; cv=none; b=fvpAYHc9CLnR2U9RXbseSq1UKBWnhuDqqVfEZq27kwCKnctdD3HB2t25/OYquCN02mv3N85bC+ewrVKxaH6tx1BnfdfqaCqTsWQE6AF4Avvu6Z87x7uwpeyd/6xpj2U7Tl2/y8hwQnB9AfK6QwzEcijguqmzGh+o3gzHJzZ3BT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067275; c=relaxed/simple;
	bh=55fNjsL0YzhBBXh/8ifYNriAC2d51UMaI8TZmEGTnac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fz/plytabeOVrWOOTAPxbn8XFlRWVSyTSkN4Fvzhh+jJmXxiqOB2stFlN7YrAVGZ8B4/GWL/wUQZesStQRvtrIKGOfhbv6YDgl/5XJv9w5EBMuH13h57u60CFFm7nkqUNsxgZARWq6qjvGx/Roe1B7Uq1aFdXCgK3/ySL+/dFwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqTQ+O2b; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqTQ+O2b"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e529da9so79023e0c.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 12:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789067272; x=1789672072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMobSeq0Oh4543STo+E8eGV9sAEro05LNNhcKN2dLi8=;
        b=BqTQ+O2b9LQyIupAe7ImgmUD64dOfk1rkY3wnejqN+BL8RiRripq+9MdK8GSaOMnZ8
         Nw/gj+9cIMda4kGTVF+HoJvao77gl5rq68W9zJ/4fEFgzsEMVhZBcOMRMsVf6LP6Tykw
         No0Uu1iLXMn/EZdpVrd75cyRhB+IscVT8ryx/kt2mpUG752sbcwgsC08Tpo2OrWCUvgj
         gz1r6//hnN72l6cCJveY3SOYq4x04fVN0karY1FVFYFhkTW0anUo8vxh4tLXtmX0oQ4r
         0c2v7rAuua3eUsfK1atLS977I4CDdp0IDNLh3J14fUZY1xiNqtSjQmej4Yk1VLQtkZxy
         qEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789067272; x=1789672072;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zMobSeq0Oh4543STo+E8eGV9sAEro05LNNhcKN2dLi8=;
        b=bvYLGjkBP8EBWS3YGQkXm3W5E6q0LnBB3Gt2f2CxyXDdlIhoDg4otW1GzQ5aXXNLMq
         vrW9B//GkrW7s5n6rhLt6m5XMUcRvMBBxsFtWFS7KIpGGAIQLWeQErkgScbKLM/hGtCg
         qB2M/wXtLamaZFQyLUgjte0lPPWmQX1ITFoppXLLbOHF6UofRvuH4XdTiXqxlKkhrwRq
         MZt0mgAS0MicQ6HhOuXOKm9wCB7DSXDFRgA2E5gJGFpPPSLgj/Xs3tkXIRBBuQs0hJlf
         E502u3QKFauexIV5+OjPLKkg0IzhakKxSucB76Bcbc3s5l3/75Syo2B6TFoQUdaTCGVV
         3npw==
X-Gm-Message-State: AFuF++mT2CHhWk9DjM5urj7asqieJOA5+1cztQWa9dXoIv43qfOuSsJp
	9Iyf7U3Ukwf5qn45PRTvlfI/d6jaeMjWHn8Fo3ZRIuyrglvbA7qDLTuw
X-Gm-Gg: AYBFou02+skbrLBhjg0O5TRX3So8v3hs01CGBVCqy/+rJawbcBcKgSMOf1E1NM2uS5A
	xagDGc1tmhoSPU0UgPFyoOWXOD+cPP4yBsg6rgtO/yoAH4EqZo5GUTQb+Cz8RuUGYyBtsjO0fVa
	cHhy+2V9/WN1YlpFqbcELa81JYp+zhnNxIe0eNxruB1I6VcnwVXYdLZ+78AhLyyHFr7uzB66uGL
	YnGfvbAyg7vis2V8cufIVHIkLGELPsCH9cHfLtKhqS/H2+WmK1AnHxELM8vbarlLhXqzOfUkLaP
	j2zJNLOX9nZ+yROcDDIt/gRUcBDbJfeB0tvG4NjlBMZ0R9Mz6Q6uGe1OOaIxlIMILECKh/SUS9f
	JxAiM7QY5pO9ykfzgxnAwUoFVQcV3U0Bqlc87OeDMHNuDR/P5D7D+wbKapRVwcuac0nu642Y5iv
	2sFjWb+FofVBh1rWjH8U2BTCYCx5T7eWFEXlXWLM7YhWsq7lG6mXZBB4PK0RQ3O81qE2GeJxXMC
	Q==
X-Received: by 2002:a05:6122:420e:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5c8463028afmr724557e0c.8.1789067271932;
        Thu, 10 Sep 2026 12:07:51 -0700 (PDT)
Received: from x-wing ([2804:14d:78b6:4583:bc62:f651:fe2f:303b])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470add08sm298844e0c.3.2026.09.10.12.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:07:51 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: [PATCH v2] docs: translations: pt_BR: translate researcher-guidelines.rst
Date: Thu, 10 Sep 2026 16:07:45 -0300
Message-ID: <20260910190745.1676-1-silvapfabio@gmail.com>
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

Assisted-by: Opus 5:Opus 5-3-opus
Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
---
Changes in v2:
- Add document to Documentation/translations/pt_BR/process/index.rst
  instead of the top-level index.
- Remove top-of-file Sphinx label to prevent cross-reference and build conflict.
- Fix trailing newline at end of file.
- Include Assisted-by: Opus 5:Opus 5-3-opus trailer as per documentation.

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


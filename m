Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4484830E0FC
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 00:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604631; cv=none; b=OsXhnS7YQQCimKydZvb3yCHI3kl9tyIRCYID0YqC2TGTq3jgqp/OeWw4rn6uAi1vhsFCZe7HGOLJ/MR55bpUsf6uYoGmoM40Ck7nBdJD1pNjgepYjjUIyI5OBxjmehCRrkdylsewmZD7kAosha40XD8i46gzJj2KhCO+JRqKiIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604631; c=relaxed/simple;
	bh=XPjKWsEcPmE8I8Bo1knWlZ++w34ti15+6CuUOTWdkpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VIEqu3ZVlzCoD8PZ0cqAdhY1rDjbQlskTn7gpSoWPRyIKXoFQSyNxQqQEM9MbQCd0LilA0LFAVl4YlymwjaOUR7Ha8w7c/gQyiiBgK1u5smxeQwGmeYuT4vuw1vYb/RLzy/92xHt/+aK1MNs2U+WxGKA3oCRl++WR45yZtwat2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJ8MngrE; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJ8MngrE"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398c066106cso189295a91.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 17:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789604628; x=1790209428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw8JDp91+KaBT0Rt/XpxMAba3iLVx7q/IVL+Ob6iVx8=;
        b=PJ8MngrEv/UtRBTOsYTxq01Dwmk/8KR4lk44FJ1cTBP5g6Q8AAdafW0/nL7nlpyKGn
         UGzo7iAXfwZGHeJ8X5rCpBenwjzmDTeEmdRzfss9UmeLoLN5tErFxLkxIgcta/d6hWG2
         rrTjbY5kz5YqF2Y2kNNb82hpbjks7SIQQsMsKhO6vk/asrNTSjyDx8JhNUGQZODiv5SW
         riEoWMCdb2djox0hvHLDzPHy9Bk6eaJmkcflYLXCJjwjPVODxrB0OwaAFzMAovmIOB1P
         NeyzWkGPZlDH3/L0osGvPAZlBg1oJKTbW38HWSNM3W9EtpTt6jdoYQOEFlzl0Q6jgl8D
         LUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789604628; x=1790209428;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jw8JDp91+KaBT0Rt/XpxMAba3iLVx7q/IVL+Ob6iVx8=;
        b=q+UUrFEiJby/0+9kd1r0DTy4FcTKVsrk1yhKx54B9EZYM0AGLxVgQaXkMcdDoPxFaI
         EYauUJ9UkZ5QOD2qkMnwLHHDM3njnA+cgZp9NLJHcU9KE4EHF69gHjhmYjTtg9zxqjRB
         MnBbKeizmZQhslaFl2kbNvzD7JAO/i39/k+18lXYglVKOgmV54izTArzdSspaIEphqVq
         3HRl1NoqMp6MA7Yx52ZCNAduHfzR16aznyT0ALyztGYAb0TB1MBva2jYtvMqZRjhgOj/
         95fgenEka8anXHg38PY/aGrc93KHnYZ9vqx04V2+xhn5ExF1L0ncnPR7BcBfQuW8umDS
         QFvA==
X-Gm-Message-State: AFuF++nfBJBsM70pyvu64fRWVQ/xylwXcOYFsFteX5F5cCrHdAMqhD8H
	RD+MlmaW66MQps7610/5cWB8+5s0tAhAtfIhx2Uqg5UuPDmETpIj3K6a
X-Gm-Gg: AYBFou059o/eC/oX/2XJs4eVx5FeouhqTnUPQODZVx7LF7dBl4cUmXa+SjEmE1JuXkS
	Cpv/sclzwhErmSn3tCeNgg7qZGZFjdvzwD/QzhDFUQJXG0mjVTUaQGFmSmgkjyd1e+gWik+qHIv
	FhfCj5DPhnGF0fA12xSqlNqE1sbmI3rY8YeisQlk07S22hySZ8Gxf/+DRtScj8/l46Zs/Al8SQx
	Lwa7RCGDAGPLOdJNUnhP8XBjtdUON1WYBIOf6yK2fP6D4UzLkMSs2zVIvRCbNmG1GE9vaNVKXXX
	1owoVw+Ufqo3uyaiv2zYfkCd+JKsujYG2S9cdtgoXAN8ZWwoGLUm9YW6wMX7bvlAQ5fTEYJTO3J
	/DDoVt5t+Xg614VFKTzTEusBZJhzDLEhL4NgtfbsNwb3tiWRtQvvthEq1kLS0WEW+P+/MybSqAa
	AYZnuByvlLwoK4zW0ujaBuLEgDRCX1p0+k+uluaC7aXc8SOVItZJ//a+NVNqaSmFmIPCk1i+H+z
	0z2iA==
X-Received: by 2002:a17:90b:2ec7:b0:39d:f317:44cd with SMTP id 98e67ed59e1d1-39e1e4907f3mr14270110a91.14.1789604628249;
        Wed, 16 Sep 2026 17:23:48 -0700 (PDT)
Received: from x-wing ([177.181.2.143])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm12418094eec.14.2026.09.16.17.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:23:47 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v3] docs: translations: pt_BR: translate researcher-guidelines.rst
Date: Wed, 16 Sep 2026 21:23:41 -0300
Message-ID: <20260917002341.5938-1-silvapfabio@gmail.com>
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
- Use "adesão explícita (opt-in)" instead of "explicitamente opcionais"
  to make it clear that participation must be actively opted into.
- Rename "Pesquisas" section title to "Questionários" (and adjust
  underline width) to keep "survey" and "research" as separate terms,
  matching the body wording and the zh_CN translation.
- Replace backticks around "Fixes:" and "Reviewed-by" tags with plain
  double quotes, since backticks render as title_reference in RST
  while the original English uses no markup.

v2: https://lore.kernel.org/r/20260910190745.1676-1-silvapfabio@gmail.com
v1: https://lore.kernel.org/r/20260910151145.1226-1-silvapfabio@gmail.com
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/researcher-guidelines.rst   | 174 ++++++++++++++++++
 2 files changed, 175 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/researcher-guidelines.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index ce2ed7a0387a..9d0c253f0256 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -75,6 +75,7 @@ kernel e sobre como ver seu trabalho integrado.
    Lista de verificação para patches <process/submit-checklist>
    Processo de desenvolvimento <process/development-process>
    Linguagem de programação <process/programming-language>
+   Diretrizes para pesquisadores <process/researcher-guidelines>
    Interface de drivers do kernel Linux <process/stable-api-nonsense>
    Conclave (Continuidade do projeto) <process/conclave>
    Manuais dos mantenedores <process/maintainer-handbooks>
diff --git a/Documentation/translations/pt_BR/process/researcher-guidelines.rst b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
new file mode 100644
index 000000000000..f61e10b707d2
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
@@ -0,0 +1,174 @@
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
+sobre desenvolvedores devam exigir adesão explícita (opt-in) dos
+desenvolvedores.
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
+Questionários
+=============
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
+ricas do que as obtidas em um questionário por e-mail, e a comunidade se
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
+Se você é um colaborador de primeira viagem, recomenda-se que o próprio patch
+seja avaliado por outras pessoas em particular antes de ser publicado nas
+listas públicas. (Isso é obrigatório se tiver sido explicitamente informado
+de que seus patches precisam de uma revisão interna mais cuidadosa.) Espera-se
+que essas pessoas incluam sua tag "Reviewed-by" no patch resultante. Encontrar
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
-- 
2.55.0.windows.2


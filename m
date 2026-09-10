Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A014A689F
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 15:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053131; cv=none; b=guc3l7cZhJ6u7fneRosc0bRiYOJx9Zo9fQJkHpsBq6wY4ZIlSeHjfSz5/bUzTglmKQo6/sSlWAariDr8jrNmWu22KTAWPJ3GY4lW+MLTtpIYxzvijsGar8wDjxIWzK9p2QFLV3Xv+I2ZBbTI82OszJ8nvNjGwQ9Hm9negLDFvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053131; c=relaxed/simple;
	bh=y6EYbz7oWIyTBh9ynujYw/cizrhiJsqqj/cFiUzDRv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jaW6hyVwsdWN9LciHa9cgJeeiHvCmh2a3ThgXBbE4jK4owh//vfzMmhhivT9kglZKAoOpIhyZwD922Lc7jlreKOLrmENV+Y28gJUDyOtOD8W2JB84h43TAu/ppYE0YCq8c/kP+yrBza3UoBJxMftiERfoLMY9gCtn30JO3JA4ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbQiABET; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbQiABET"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148cso25091086d6.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789053122; x=1789657922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPxQagHeFJcDFnkTRc84s7RTeb0uSzU+W5Gsuk9f9D0=;
        b=dbQiABETFxuTHu3aPTYZyL04WukmLb4/B3MEznVTg47unSsA3Vu751v4axPJ9O0dG2
         409rEIQETny6bAD+6TpA7mYXAMGTuB7SnEgzwYrgkgMlDsgngde22PPIMVQqghiQstgz
         dguHQ/hja117Ew1U8WqX43UKGG6xXXdZT4xABsZvFnFLzILy7qOyHryeWtJu/f9ozHAm
         K1NmGMKkStF4PbIC2+58X82lLG1oqGGzo09713nAmGAwUM18mYASP7G27w3scbhC2edp
         YGOAHMZdVRqNvb0fOUpnBV1eDBpgi+h5iBfFGVFfsKt4ShVTYxRNRJNiGDknDhd7lCPr
         dTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053122; x=1789657922;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPxQagHeFJcDFnkTRc84s7RTeb0uSzU+W5Gsuk9f9D0=;
        b=AF3Krma0xXEApIM5uFFP7cTwT6y7NNzII4pIKoRS3/V2T6ZgyLYTYoGtPgQ6grUQwB
         2VRH5cDuN6+enJpeUnWlwX6RmSQ9OUQ178qSGcdK3/cEvAwI1N85PiZX2/MkByX+4DYu
         gl2IArIiFRgLUyur9uDPIOOSUy6JoKKli9mGQC/2AmSzN+N07YqHHhkWUT6LfXfq4Z3u
         1XgulMpo6Ebh8i/I9tZ2yjIM/DOy6cJOGPKx8OhP31Lrxj1aNm/nTYM7vtpNxvbKO5Qf
         QP7eXwuTW4mwPh7a/OgpB3YKUeuCUMxCzYnizUVjtDyj7bxhpz7D7JhpQiOXs1AAlaXG
         K9ew==
X-Gm-Message-State: AFuF++lQGyTXzRKV3RGqc4LUIqPT16YDdGEhQ31842Wx1+94Y6SmLJes
	ERUgG36+vywcb5UWxxHY0bbdgjJkIJlFZt6MDj15wYSjf14B4+srQCwj
X-Gm-Gg: AYBFou13/+nUPBrOrkTBjrVim/pMgC6w6lXIiJUUfl61ELrlcMGTDgUUN7Vjbfcucf3
	QcMCaX5f3lHrrBPfruo2aHrQyOHo1llwbtccJLll1/6bf1H5WD0dloGiaYjS8OqFC7dCkxTJjT9
	NobdjiHggE+ebecQHbCiXU5ezh2JJUcmmUjrkodRtsM941w/xc1+PCINCPHSuhmR2PerrSE+kAv
	0ip2o4qyzyOxXms87MfTEcgnahSJB3IejVXcrs+eAis4lpd6T75FUwm/0jMtf+f9I8dKNSH17Ct
	jB/qDPpvTpBcbrjCyIZFvNmIBBXxdf9etS5/GgIrDGId2F4xtj5uRRKppOYVnWyy2Q+/D3AxYOs
	ujDNC4kQCBxZfaPeze5LWL/ItyHJtOhTI3ViMC5MPWpdGzecbnni4JccB1UoFd48YJjvT7N5Usm
	SzL/uZkoYgig9kZQji6heG0eqL9nsr36eQWdh4uktcP3FahvPGY529Ms6KCBsN55jPJzaSnnm89
	+c1TiRlx0Ly
X-Received: by 2002:a05:6214:3bc7:b0:910:706b:6a66 with SMTP id 6a1803df08f44-910706b6be6mr146527226d6.15.1789053121316;
        Thu, 10 Sep 2026 08:12:01 -0700 (PDT)
Received: from x-wing ([2804:14d:78b6:4583:a459:a51e:dab5:de9d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406bf8c3sm172948816d6.48.2026.09.10.08.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:12:00 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate researcher-guidelines.rst
Date: Thu, 10 Sep 2026 12:11:55 -0300
Message-ID: <20260910151155.1237-1-silvapfabio@gmail.com>
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

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 71eb024fbec8..af4c085c39e8 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -73,6 +73,7 @@ kernel e sobre como ver seu trabalho integrado.
    Requisitos mínimos <process/changes>
    CVEs <process/cve>
    Lista de verificação para patches <process/submit-checklist>
+   Diretrizes para pesquisadores <process/researcher-guidelines>
    Interface de drivers do kernel Linux <process/stable-api-nonsense>
    Conclave (Continuidade do projeto) <process/conclave>
    Manuais dos mantenedores <process/maintainer-handbooks>
diff --git a/Documentation/translations/pt_BR/process/researcher-guidelines.rst b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
new file mode 100644
index 000000000000..e93e2398b1d8
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
@@ -0,0 +1,175 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _researcher_guidelines:
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

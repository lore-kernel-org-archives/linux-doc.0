Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC15F4EBAE1
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 23:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791935191; cv=none; b=hYkfpMy4SFEhyx8jLSPTFuBjlUZj8CKQAk2fUGCOAvdUuzaCvHgdO3AvySutOGoH5sq5Ug6Z1cQCi5RKruX6++mNxjUhl8yBxp9P49LyvLZa74C/oYz91HjAXV4/siywmffM7tL7PznryEXjuVkjN9HoCA8Har7s1TIrjFJ5B9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791935191; c=relaxed/simple;
	bh=H98DaAfH1rZM15SYvpeWDT+Od6Ypu9ibP7DAEl8Rkyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tiS2S8yV9IeTRFA2Db8lpmAltTbfmbGb0Oknh88Vgt28Fohe4VnpC5vnh/EMleWlIDxI937ICMeicHyCi4KQ8l05cW16DMVfsSa+L69jLCAEvWyeYpkvsX5MjNya3xaoH5Vm8xvxjDtpRrD0DvinPqDZNf2ywcthwnL3bqvozPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URj4NvxW; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URj4NvxW"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so673198eec.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 16:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791935189; x=1792539989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o68p/6aoo8jLJxqjN+WPuuOUaI2Z1MpIHdwtTNRzrUA=;
        b=URj4NvxWRgZALInw3yq+Ru4Umeq6ndHOdwuIaNSBVJRBIjLZ9z3kITJ0EbznFq6eUN
         4EZLd9gGKFw+ACJEhqFkN61Daj/D07K2gmtJZ4+OZRpFxzszMApg5/pIkHh0kdKJAlP+
         y6Ix6j+HsScugH8eMgEbmJ1uG72R6zbNy7uMsxuBTANknxpvXSUx69qNTKY2vEW8MJ28
         urAvEQjcoOWkwEhvMTNsqSmP8QLIMexFDU4XjvH9LygM5Y9F+COk659WWl9dgFKL3uUv
         Vm0i6isEA4KtnHurhFgQcPPi68gC6kOySyqFaS2wtQO46k/nYKI1oVzXNXSnJhSMNx9E
         t/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791935189; x=1792539989;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o68p/6aoo8jLJxqjN+WPuuOUaI2Z1MpIHdwtTNRzrUA=;
        b=GAI3ENkTfzWt4lzteSXORUJJORy/E5r9dubNIaGTVFtyPatxuP3CPSHK6G3Vy9QTTS
         wVxqQVseyblvvlxqbl16atZ43o0XJHjMJRPFaKr4bFCan+u17mpJeauj1pgcwmNs7CNM
         KXA/P2lNentSLoOUo80PnXfD2zeugcq5blv9QxxJCfYzjj/rLbRCNkG7X/HEG/UJaRMq
         dM0HJc8CczRuIOhO5G67ig42MTB9t1dF4PE3g0UrCb+g2m4Uau0yFa8UBkKiFIRE5Q5J
         nFR3+nTSxFLXF+5PbqwFypSuvnirCnnj/TjnwrCQbCHCWGj9KZAmLQx7g2o23pCWefI8
         KESw==
X-Forwarded-Encrypted: i=1; AKwUvBwLY9H3dxVpLna+teCKmvrOW1gqgdDtOHLWliHbWv/yxZPRq1ALvmJXaY26pbYXrp1Nq3DrkE0iaKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJrWGgzQHS7oHe4dEpyQbmt3zi9led3akkNSuMTrHogImM9nZw
	pOp1Qyks1GIGckAT/XmO/j3hGEy1QL9iuAt8mNZPLETQbYXLYRVrIbIF
X-Gm-Gg: AYBFou1r+kLRV0F2v4gOLOsxwWNIYLh6UEzy/PzcpNIXHe6JACy/XCLUmXdDxGoOOf7
	nqmg5ukegprCMcqRyYXQYNm184Wquh9V24jeHOHRp9v6qO6pz7hT0gkd0WQFIkzZi5/zxq+s1V4
	NnxfQiTW5sSeIJIWbjZRUIuU8asD1xI18CxZQPkrhXyy/0XtlFw9t8tn7p3xtRFK+6oqTOzU+TH
	k4IuZPBZi/RxNNdxtrkscuoktqJeBWwztga2nQvwoxfEnLv/NRBDVlxcQHtsLSK/4nnn27aWQ9w
	qrn6hK9TVTxQe85EIUknVJwbpKwzBqkkw+lAHTcGPHz4ysSPHRhe/Y2U6PsYLoBsuzC8oKMHEv/
	thkNST8iJG+Z130/QiwURBCPkmYtzVoljOdgwZ8WXjnwqdx69+Di3O84cTI36R0Qzza+zt37aEN
	u7AX69+S/UttwE4/qnApJKp0KQQvhlRph4KKHeOCwfsqY/dzVV77NlNQ+Qfh5Zxwm4/8uxcvvQ+
	YQ=
X-Received: by 2002:a05:7300:de48:b0:353:82b2:205f with SMTP id 5a478bee46e88-35382b220a7mr17353933eec.16.1791935188449;
        Tue, 13 Oct 2026 16:46:28 -0700 (PDT)
Received: from fedora ([2804:29b8:508d:af45:a398:9dc5:b37c:dfa8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm51257744eec.0.2026.10.13.16.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 16:46:28 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Subject: [PATCH v1 2/3] docs: translations: pt_BR: process: Translate researcher-guidelines.rst
Date: Tue, 13 Oct 2026 20:45:43 -0300
Message-ID: <d262b5c50b60d7f3f211c2eb55e58d774919a336.1791933697.git.lucasadramalho@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791933697.git.lucasadramalho@gmail.com>
References: <cover.1791933697.git.lucasadramalho@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate researcher-guidelines.rst into Brazilian Portuguese
and add it to the process documentation index.

Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
---
 .../translations/pt_BR/process/index.rst      |   1 +
 .../pt_BR/process/researcher-guidelines.rst   | 188 ++++++++++++++++++
 2 files changed, 189 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/researcher-guidelines.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index d072f7e46..31704e28d 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -64,6 +64,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
    A interface de drivers do kernel Linux <stable-api-nonsense>
    Estilo de gerenciamento do kernel Linux <management-style>
+   Diretrizes para pesquisadores <researcher-guidelines>
    Assistentes de código <coding-assistants>
    O manual da árvore tip <maintainer-tip>
    Conclave (Continuidade do projeto) <conclave>
diff --git a/Documentation/translations/pt_BR/process/researcher-guidelines.rst b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
new file mode 100644
index 000000000..8209b0e17
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
@@ -0,0 +1,188 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_BR_researcher-guidelines:
+
+Diretrizes para pesquisadores
++++++++++++++++++++++++++++++
+
+A comunidade do kernel do Linux acolhe com satisfação pesquisas
+transparentes sobre o kernel do Linux, as atividades envolvidas em seu
+desenvolvimento e quaisquer outros subprodutos de seu desenvolvimento. O
+Linux se beneficia enormemente desse tipo de pesquisa, e a maioria dos
+aspectos do Linux é impulsionada por pesquisas, de uma forma ou de outra.
+
+A comunidade agradece imensamente se os pesquisadores puderem compartilhar
+descobertas preliminares antes de tornar seus resultados públicos,
+especialmente se tal pesquisa envolver segurança. O envolvimento antecipado
+da comunidade ajuda a melhorar tanto a qualidade da pesquisa quanto a
+capacidade do Linux de se beneficiar de seus resultados. De qualquer forma,
+recomenda-se compartilhar com a comunidade cópias de acesso aberto das
+pesquisas publicadas.
+
+Este documento tem como objetivo esclarecer o que a comunidade do kernel
+Linux considera práticas aceitáveis e inaceitáveis na condução desse tipo
+de pesquisa. No mínimo, tais pesquisas e atividades relacionadas devem
+seguir os princípios fundamentais da ética em pesquisa. Para obter mais
+informações sobre ética em pesquisa em geral, ética em tecnologia e
+pesquisa sobre comunidades de desenvolvedores em particular, consulte:
+
+* `História da Ética em Pesquisa
+  <https://www.unlv.edu/research/ORI-HSR/history-ethics>`_
+* `Ética do IEEE <https://www.ieee.org/about/ethics/index.html>`_
+* `Opiniões de desenvolvedores e pesquisadores sobre a ética de
+  experimentos em projetos de código aberto
+  <https://arxiv.org/pdf/2112.13217.pdf>`_
+
+A comunidade do kernel Linux espera que todos os que interagem com o
+projeto estejam participando de boa-fé para tornar o Linux melhor.
+Pesquisas sobre qualquer material disponível publicamente (incluindo, mas
+não se limitando ao código-fonte) produzido pela comunidade do kernel Linux
+são bem-vindas, embora pesquisas envolvendo desenvolvedores exijam
+consentimento explícito dos participantes.
+
+Pesquisas passivas baseadas inteiramente em fontes publicamente
+disponíveis, incluindo postagens em listas de discussão públicas e commits
+em repositórios públicos, são claramente permitidas. No entanto, como em
+qualquer pesquisa, os princípios éticos padrão devem ser seguidos.
+
+A pesquisa ativa sobre o comportamento dos desenvolvedores, no entanto,
+deve ser realizada com o consentimento explícito e a plena divulgação aos
+desenvolvedores individuais envolvidos. Não é permitido interagir com os
+desenvolvedores ou realizar experimentos com eles sem o consentimento; isso
+também faz parte da ética padrão da pesquisa.
+
+Questionários
+=============
+
+A pesquisa geralmente assume a forma de questionários enviados a
+mantenedores ou colaboradores.  Como regra geral, porém, a comunidade do
+kernel obtém pouco valor desses questionários.  O processo de
+desenvolvimento do kernel funciona porque cada desenvolvedor se beneficia
+de sua participação, mesmo trabalhando com outras pessoas que têm objetivos
+diferentes. Responder a um questionário, porém, é uma exigência unilateral
+imposta a desenvolvedores ocupados, sem nenhum benefício correspondente
+para eles próprios ou para a comunidade do kernel como um todo. Por esse
+motivo, esse método de pesquisa não é recomendado.
+
+Os membros da comunidade do kernel já recebem e-mails em excesso e
+provavelmente perceberão os pedidos de pesquisa como apenas mais uma
+exigência sobre seu tempo.  O envio desses pedidos priva a comunidade do
+valioso tempo dos colaboradores e é improvável que gere uma resposta
+estatisticamente útil.
+
+Como alternativa, os pesquisadores devem considerar participar de eventos
+de desenvolvedores, organizar sessões nas quais o projeto de pesquisa e
+seus benefícios para os participantes possam ser explicados e interagir
+diretamente com a comunidade no local.  As informações recebidas serão
+muito mais ricas do que as obtidas por meio de uma pesquisa por e-mail, e a
+comunidade também se beneficiará da oportunidade de aprender com suas
+percepções.
+
+Patches
+=======
+
+Para ajudar a esclarecer: enviar patches aos desenvolvedores *é* interagir
+com eles, mas eles já consentiram em receber *contribuições de boa-fé*.
+Esse consentimento não se estende ao envio de patches intencionalmente
+defeituosos ou vulneráveis, nem ao fornecimento de informações enganosas
+durante as discussões. Essas interações podem prejudicar os desenvolvedores
+ao consumir tempo, esforço e motivação, além de prejudicar o projeto ao
+minar a confiança de toda a comunidade de desenvolvedores no colaborador (e
+na organização do colaborador como um todo), prejudicando os esforços para
+fornecer feedback construtivo aos colaboradores e colocando os usuários
+finais em risco de falhas de software.
+
+A participação de pesquisadores no desenvolvimento do próprio Linux, assim
+como a de qualquer pessoa, é bem-vinda e incentivada. A pesquisa no código
+do Linux é uma prática comum, especialmente quando se trata de desenvolver
+ou executar ferramentas de análise que produzam resultados que possam ser
+utilizados na prática.
+
+Ao interagir com a comunidade de desenvolvedores, enviar um patch tem sido,
+tradicionalmente, a melhor maneira de causar impacto. O Linux já possui
+muitos bugs conhecidos — o que é muito mais útil é dispor de correções
+revisadas e verificadas. Antes de contribuir, leia atentamente a
+documentação apropriada:
+
+* Documentation/process/development-process.rst
+* Documentation/process/submitting-patches.rst
+* Documentation/admin-guide/reporting-issues.rst
+* Documentation/process/security-bugs.rst
+
+Em seguida, envie um patch (incluindo uma mensagem de commit com todos os
+detalhes listados abaixo) e responda aos comentários dos outros
+desenvolvedores.
+
+Ao enviar patches resultantes de pesquisas, as mensagens de commit devem
+conter, no mínimo, os seguintes detalhes, para que os desenvolvedores
+tenham o contexto adequado para compreender a contribuição. Responda às
+seguintes perguntas:
+
+* Qual é o problema específico que foi identificado?
+* Como o problema poderia ser reproduzido em um sistema em execução?
+* Que efeito a ocorrência do problema teria no sistema?
+* Como o problema foi identificado? Inclua, especificamente, detalhes sobre
+  quaisquer testes, programas de análise estática ou dinâmica e quaisquer
+  outras ferramentas ou métodos utilizados para realizar o trabalho.
+* Em qual versão do Linux o problema foi identificado? É altamente
+  recomendável utilizar a versão mais recente ou um ramo recente do
+  linux-next (consulte Documentation/process/howto.rst).
+* O que foi alterado para corrigir o problema e por que se acredita que a
+  correção esteja correta?
+* Como a alteração foi testada na compilação e em tempo de execução?
+* Qual commit anterior esta alteração corrige? Isso deve constar na tag
+  “Fixes:” conforme descrito na documentação.
+* Quem mais revisou este patch? Isso deve constar nas tags apropriadas
+  “Reviewed-by:”; veja abaixo.
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
+Se você estiver contribuindo pela primeira vez, recomenda-se que o patch
+seja avaliado por outras pessoas em particular antes de ser enviado às
+listas de discussão públicas.
+(Isso é obrigatório caso tenha sido explicitamente informado de que seus
+patches precisam de uma revisão interna mais cuidadosa.) Espera-se que
+essas pessoas tenham sua tag “Reviewed-by” incluída no patch resultante.
+Encontrar outro desenvolvedor familiarizado com contribuições para o Linux,
+especialmente dentro da sua própria organização, e pedir que ele ajude nas
+revisões antes de enviá-las para as listas de discussão públicas tende a
+melhorar significativamente a qualidade dos patches resultantes e, com isso,
+reduz a carga de trabalho sobre outros desenvolvedores.
+
+Se não for possível encontrar ninguém para revisar os patches internamente
+e você precisar de ajuda para encontrar essa pessoa, ou se tiver quaisquer
+outras dúvidas relacionadas a este documento e às expectativas da
+comunidade de desenvolvedores, entre em contato com a lista de discussão
+privada do Conselho Consultivo Técnico:
+<tech-board@groups.linuxfoundation.org>.
-- 
2.55.0


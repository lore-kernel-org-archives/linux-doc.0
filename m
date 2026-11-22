Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795356099;
	b=X+n8mx6M53IIDkMeuESlAjQs8l1WeP0q6JL/duBqIt/LypiNkRbQr35m+LVozucOYX8q
	 fpejEod9Yy/lALevTU5WXs3vYnsK+cSUoz+gHBVeuivBcwSsfLirQR/kQ7iA7hp1rvTPm
	 IJZaUoL9j7NCtG4ghmc45vyQ8N+cJ7UlhiyyJDD45EKaxyiX8bonTxoYrgR5PjD9RVGWC
	 KRrJ34OnEq+ni/dk6CH3cNwaxhOcds2g5iffziFYk6JdBp4MQfpPDTLF9MY4FhXDMS1t2
	 B9K+x12ckX235gHaleJlx4wQfL+5SAiaTb6257RC8B8q3jkyaYDhMwbWdgs98lVBRHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356099;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LGNIYXh0L3oq3PeBKYd3gdGYODLqyGaDs0D5vOhJde0=;
	b=ag4LXy7kJLgzBe1+v5XGv+UyK3TcEmKlr+8ZWDMODzeYSoSeuTGpJZDgP045lE2SHmiF
	 Uqkvv5uZ8GwTUhXUc+Nx/5RDWKZ7UkmG2x+fuPopl97wUxpfkAz8+yvEEsB4vempLijfg
	 FFK/KmQxSFZKItO4kEYw7t+Dr1KKDcxa5pzIlaBMdAVB7QhirA8/3LRshThYxcwI1GIrQ
	 lQbdwqcNRd0NIkC4+wlRp3A6PdPJhF2fybSyUu4SDXxcAQElpWbVZpSd1ya20r5vrjC20
	 dO6Jfp7v0Tig5AdrnogPZtdP/DsV6ni9obCEXypKqRkjJ3n91CULGwCM05smmWO+J2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ogzXWbTP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641B2606A32C
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 14:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ogzXWbTP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795356098;
	b=rO/BjsufQegJjFBBCxKytMe9GzQe+UErgLAmt8jl0TtCvg8DGTIk0YiALiVqKk4kyrPc
	 8fS2dlESiGvQrfmQGEmhenU6u8RbV2NjfEu7hLzr9Psh9mvD+SwH6LAGV4XfLcDU1PZlB
	 3mOqJASIMpOmaFdDOLKHHYfGC9XynLa80kkMhYv1blVsf+eey7lPfP492gTi4ccvbcJAG
	 ogO3balYICN0VYmJi4khxFluGpZopNklXq9hb/UMyNYUFpoBkZTvQra74/xnN7WWbW3ai
	 T048QnrzQM+z/vvcUfLAExaG8j35lGFCclT1MlO4zjBoiO8Kp2t8ofJjaT9Be+vaQ5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795356098;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LGNIYXh0L3oq3PeBKYd3gdGYODLqyGaDs0D5vOhJde0=;
	b=0Z+FrV7Zx2uQ26AHKn1MBxp+gMyqlsu5WG+0SaiXNBoq8LR5me7Z25l6473qlAtzI1XK
	 oYAgQm5ih5qb4S3OLKjTy8o94KtQJpAJzPS0AKKrKtF1iOhLj4RFCtB6Or+v2ZEmDeq0A
	 haXd6dtISMa4jEmspkEuhff7nBwrS4Zs370R15IBLDR5HP6z/AASqkjqDYH3HHXutEeVb
	 gfMz10RX8lDL895mQF7eO8XrRw5Gr/HHXk28S+yGHYjkspP1LdPjhG90VE5aT7nSDC9x+
	 9w4EJq432VobUvu0/DBCOtWUYA7M1PZA7TMw39pZviv6rNgw6sosvDVd61DP3JTohsg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72AED1F000C4;
	Sun, 22 Nov 2026 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795356098;
	bh=LGNIYXh0L3oq3PeBKYd3gdGYODLqyGaDs0D5vOhJde0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ogzXWbTPG04LPQOLsncIpVCk/fSzFPY8L3hrjFpCNQ4Vko3tSHQOiXT3uIE6xp/jl
	 e6bCFjT67c9QeYL7TU0dAr7HjJoAfyST+RSRErj0OBSY6xZy9luKqw3EcqftWuMv9g
	 85rDIDdSOxUf2qOAzWE7tYs+p4eYtKk0egXfhXl663ToBXJvIhm5x0aejBwotaG7lt
	 EOYU/+cV/JI7Ak+ffrNRrDgcMqSVFgPa6I6cQUvMqIP7/L8LZxwPQoGvHPIpkBfNdF
	 B1lQU29kmgzssD4Zxob9vhoFhAjo3P5yl3A7jaGC9Jmb+tG0SjTmTJUxwDfdxiKsYF
	 oBjinT/fzX/jg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EB95C4C0DC;
	Sun, 22 Nov 2026 14:01:26 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 11:01:26 -0300
Subject: [PATCH v4 1/3] docs/translations/pt_BR: process: add
 handling-regressions.rst (1/3)
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
Message-Id: <20261122-handling-regressions-v4-1-b6b9f2070290@gmail.com>
References: <20261122-handling-regressions-v4-0-b6b9f2070290@gmail.com>
In-Reply-To: <20261122-handling-regressions-v4-0-b6b9f2070290@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, danielmaraboo@gmail.com, 
 rdunlap@infradead.org, Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795356085; l=16045;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=Si8hFraNdEddmRmWfRFBbEa6X8eBV3kEcWuUXNqyWhI=;
 b=Kph0sxscz+aaH5SHiSFCwJ85EXwvrmpufi0mVTLqSdh3Hj8eYDqEqaSdYuT8XR66+YfXh+0zs
 wMaYVcOTBu+Brti8fBsBzUf8OCZ4unLWb/j2ihj28vGM7DaYljDxJ23
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com
Content-Transfer-Encoding: 8bit

From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>

Start the Brazilian Portuguese translation of
Documentation/process/handling-regressions.rst, covering the summary of
the essential points and the basic guidance on handling regression
reports and on fixing them.

The translation follows the original file as last changed by commit
fdd100ee60a0 ("docs: process: use gender-neutral pronouns") and keeps
its structure: section levels, literal blocks, URLs, :ref: roles and the
regzbot commands are preserved verbatim.

The file is added in three parts to keep the review tractable.

Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
---
 .../pt_BR/process/handling-regressions.rst         | 326 +++++++++++++++++++++
 1 file changed, 326 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/handling-regressions.rst b/Documentation/translations/pt_BR/process/handling-regressions.rst
new file mode 100644
index 000000000000..6129cde22ec1
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/handling-regressions.rst
@@ -0,0 +1,326 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR CC-BY-4.0)
+.. Consulte o final deste arquivo para informações adicionais de
+.. redistribuição.
+
+Lidando com regressões
+++++++++++++++++++++++
+
+*Nós não causamos regressões* -- este documento descreve o que essa
+"primeira regra do desenvolvimento do kernel Linux" significa na prática
+para os desenvolvedores. Ele complementa
+Documentation/admin-guide/reporting-regressions.rst, que cobre o assunto
+do ponto de vista do usuário; se você nunca leu aquele texto, vá lá e ao
+menos dê uma passada de olhos antes de continuar aqui.
+
+Os pontos essenciais (também conhecidos como "o TL;DR")
+=======================================================
+
+#. Garanta que os inscritos na `lista de discussão de regressões
+   <https://lore.kernel.org/regressions/>`_
+   (regressions@lists.linux.dev) saibam rapidamente de qualquer novo
+   relato de regressão:
+
+    * Ao receber um relato por e-mail que não tenha a lista em CC,
+      inclua-a
+      imediatamente no circuito enviando ao menos um breve "Responder a
+      todos" com a lista em CC.
+
+    * Reencaminhe ou redirecione para a lista qualquer relato enviado em
+      rastreadores de bugs.
+
+#. Faça o robô de acompanhamento de regressões do kernel Linux,
+   "regzbot",
+   acompanhar o problema (isto é opcional, mas recomendado):
+
+    * Para relatos enviados por e-mail, verifique se o autor incluiu uma
+      linha como ``#regzbot introduced: v5.13..v5.14-rc1``. Caso não
+      tenha, envie uma resposta (com a lista de regressões em CC)
+      contendo um parágrafo como o seguinte, que informa ao regzbot
+      quando o problema começou a ocorrer::
+
+       #regzbot ^introduced: 1f2e3d4c5b6a
+
+    * Ao reencaminhar relatos de um rastreador de bugs para a lista de
+      regressões (veja acima), inclua um parágrafo como o seguinte::
+
+       #regzbot introduced: v5.13..v5.14-rc1
+       #regzbot from: Some N. Ice Human <some.human@example.com>
+       #regzbot monitor: http://some.bugtracker.example.com/ticket?id=123456789
+
+#. Ao enviar correções para regressões, adicione tags "Closes:" à
+   descrição do patch apontando para todos os lugares onde o problema
+   foi relatado, conforme exigido por
+   Documentation/process/submitting-patches.rst e
+   :ref:`Documentation/process/5.Posting.rst <development_posting>`. Se
+   você estiver corrigindo apenas parte do problema que causou a
+   regressão, pode usar tags "Link:" em vez disso. No momento, o regzbot
+   não faz distinção entre as duas.
+
+#. Tente corrigir as regressões rapidamente assim que o culpado for
+   identificado; as correções da maioria das regressões devem ser
+   mescladas em até duas semanas, mas algumas precisam ser resolvidas em
+   dois ou três dias.
+
+
+Todos os detalhes sobre regressões no kernel Linux relevantes para os
+desenvolvedores
+===============
+
+
+O básico importante em mais detalhes
+-------------------------------------
+
+
+O que fazer ao receber relatos de regressão
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Garanta que o rastreador de regressões do kernel Linux e os demais
+inscritos na `lista de discussão de regressões
+<https://lore.kernel.org/regressions/>`_ (regressions@lists.linux.dev)
+saibam de qualquer regressão recém-relatada:
+
+ * Ao receber por e-mail um relato que não tenha a lista em CC, inclua-a
+   imediatamente no circuito enviando ao menos um breve "Responder a
+   todos" com a lista em CC; procure garantir que ela volte a ser
+   incluída caso você responda a uma resposta que a tenha omitido.
+
+ * Se um relato enviado em um rastreador de bugs chegar à sua caixa de
+   entrada, reencaminhe-o ou redirecione-o para a lista. Considere
+   verificar antes os arquivos da lista, no caso de o autor já ter
+   reencaminhado o relato conforme instruído por
+   Documentation/admin-guide/reporting-issues.rst.
+
+Em ambos os casos, considere fazer com que o robô de acompanhamento de
+regressões do kernel Linux, "regzbot", comece a acompanhar o problema
+imediatamente:
+
+ * Para relatos enviados por e-mail, verifique se o autor incluiu um
+   "comando
+   do regzbot" como ``#regzbot introduced: 1f2e3d4c5b6a``. Caso não
+   tenha, envie uma resposta (com a lista de regressões em CC) com um
+   parágrafo como o seguinte:::
+
+       #regzbot ^introduced: v5.13..v5.14-rc1
+
+   Isso informa ao regzbot a faixa de versões em que o problema começou
+   a ocorrer; você também pode especificar uma faixa usando commit-ids
+   ou indicar um único commit-id, no caso de o autor ter feito bisseção
+   do culpado.
+
+   Observe o circunflexo (^) antes de "introduced": ele pede ao regzbot
+   que trate o e-mail pai (aquele ao qual você está respondendo) como o
+   relato inicial da regressão que você quer ver acompanhada; isso é
+   importante, pois mais tarde o regzbot vai procurar patches com tags
+   "Closes:" que apontem para o relato nos arquivos em lore.kernel.org.
+
+ * Ao reencaminhar uma regressão relatada em um rastreador de bugs,
+   inclua um
+   parágrafo com estes comandos do regzbot:::
+
+       #regzbot introduced: 1f2e3d4c5b6a
+       #regzbot from: Some N. Ice Human <some.human@example.com>
+       #regzbot monitor: http://some.bugtracker.example.com/ticket?id=123456789
+
+   O regzbot então associará automaticamente os patches ao relato que
+   contenham tags "Closes:" apontando para o seu e-mail ou para o ticket
+   mencionado.
+
+O que é importante ao corrigir regressões
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Você não precisa fazer nada de especial ao enviar correções para
+regressões; apenas lembre-se de fazer o que
+Documentation/process/submitting-patches.rst,
+:ref:`Documentation/process/5.Posting.rst <development_posting>` e
+Documentation/process/stable-kernel-rules.rst já explicam em mais
+detalhes:
+
+ * Aponte para todos os lugares onde o problema foi relatado usando tags
+   "Closes:" ::
+
+       Closes: https://lore.kernel.org/r/30th.anniversary.repost@klaava.Helsinki.FI/
+       Closes: https://bugzilla.kernel.org/show_bug.cgi?id=1234567890
+
+   Se você estiver corrigindo apenas parte do problema, pode usar
+   "Link:" em vez disso, como descrito no primeiro documento mencionado
+   acima. No momento, o regzbot trata os dois de forma equivalente e
+   considera os relatos vinculados como resolvidos.
+
+ * Adicione uma tag "Fixes:" especificando o commit que causou a
+   regressão.
+
+ * Se o culpado foi mesclado em um ciclo de desenvolvimento anterior,
+   marque
+   explicitamente a correção para backport usando a tag ``Cc:
+   stable@vger.kernel.org``.
+
+Tudo isso é esperado de você e importante quando se trata de regressão,
+pois essas tags têm grande valor para todos (inclusive você) que possam
+estar investigando o problema semanas, meses ou anos depois. Essas tags
+também são cruciais para ferramentas e scripts usados por outros
+desenvolvedores do kernel ou por distribuições Linux; uma dessas
+ferramentas é o regzbot, que depende fortemente das tags "Closes:" para
+associar relatos de regressão às mudanças que os resolvem.
+
+Expectativas e boas práticas para corrigir regressões
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Como desenvolvedor do kernel Linux, espera-se que você dê o seu melhor
+para evitar situações em que uma regressão causada por uma mudança
+recente sua deixe aos usuários apenas estas opções:
+
+ * Rodar um kernel com uma regressão que impacta o uso.
+
+ * Mudar para uma série de kernel mais antiga ou mais nova.
+
+ * Continuar rodando um kernel desatualizado e, portanto, potencialmente
+   inseguro, por mais de três semanas após a identificação do culpado
+   pela regressão. O ideal é que seja menos de duas. E deveria ser
+   questão de poucos dias, se o problema for grave ou afetar muitos
+   usuários -- seja de modo geral, seja em ambientes prevalentes.
+
+Como concretizar isso na prática depende de vários fatores. Use as
+regras gerais a seguir como guia.
+
+Em geral:
+
+ * Priorize o trabalho em regressões acima de qualquer outro trabalho no
+   kernel Linux, a menos que este último envolva um problema grave (por
+   exemplo, vulnerabilidade de segurança aguda, perda de dados, hardware
+   inutilizado, ...).
+
+ * Agilize a correção de regressões do mainline que recentemente
+   entraram em
+   uma versão mainline, stable ou longterm de fato (seja diretamente,
+   seja via backport).
+
+ * Não considere as regressões do ciclo atual como algo que pode esperar
+   até o
+   fim do ciclo, pois o problema pode desestimular ou impedir que
+   usuários e sistemas de CI testem o mainline agora ou de modo geral.
+
+ * Trabalhe com o cuidado necessário para evitar danos adicionais ou
+   maiores,
+   mesmo que resolver o problema leve mais tempo do que o descrito
+   abaixo.
+
+Sobre prazos quando o culpado de uma regressão é conhecido:
+
+ * Procure levar uma correção ao mainline em dois ou três dias, se o
+   problema
+   for grave ou incomodar muitos usuários -- seja de modo geral, seja em
+   condições prevalentes, como um ambiente de hardware específico, uma
+   distribuição ou uma série stable/longterm.
+
+ * Procure levar uma correção ao mainline até o domingo seguinte ao
+   próximo,
+   se o culpado entrou em uma versão mainline, stable ou longterm
+   recente (seja diretamente, seja via backport); se o culpado ficou
+   conhecido no início da semana e é simples de resolver, tente levar a
+   correção ao mainline na mesma semana.
+
+ * Para outras regressões, procure levar as correções ao mainline antes
+   do
+   último domingo dentro das próximas três semanas. Um ou dois domingos
+   depois é aceitável, se a regressão for algo com que as pessoas
+   consigam conviver facilmente por um tempo -- como uma regressão leve
+   de desempenho.
+
+ * É fortemente desaconselhado adiar correções de regressão para a
+   próxima
+   janela de merge, exceto quando a correção for extraordinariamente
+   arriscada ou quando o culpado tiver sido levado ao mainline há mais
+   de um ano.
+
+Sobre procedimento:
+
+ * Sempre considere reverter o culpado, pois costuma ser a forma mais
+   rápida e
+   menos perigosa de corrigir uma regressão. Não se preocupe em levar ao
+   mainline uma variante corrigida depois: isso deve ser direto, já que
+   a maior parte do código passou por revisão uma vez.
+
+ * Procure resolver qualquer regressão introduzida no mainline nos
+   últimos
+   doze meses antes que o ciclo de desenvolvimento atual termine: Linus
+   quer que tais regressões sejam tratadas como as do ciclo atual, a
+   menos que a correção envolva riscos incomuns.
+
+ * Considere colocar Linus em CC nas discussões ou na revisão do patch,
+   se uma
+   regressão parecer emaranhada. Faça o mesmo em casos precários ou
+   urgentes -- especialmente se o mantenedor do subsistema puder estar
+   indisponível. Coloque também a equipe stable em CC quando souber que
+   tal regressão entrou em uma versão mainline, stable ou longterm.
+
+ * Para regressões urgentes, considere pedir a Linus que pegue a
+   correção
+   diretamente da lista de discussão: ele não vê problema nisso para
+   correções sem controvérsia. O ideal, porém, é que tais pedidos
+   aconteçam em acordo com os mantenedores do subsistema ou venham
+   diretamente deles.
+
+ * Caso não tenha certeza se uma correção vale o risco de ser aplicada
+   poucos
+   dias antes de uma nova versão mainline, envie a Linus um e-mail com
+   as listas e pessoas habituais em CC; nele, resuma a situação e peça
+   que ele considere pegar a correção diretamente da lista. Ele então
+   pode tomar a decisão e, quando necessário, até adiar a versão. Tais
+   pedidos, novamente, devem idealmente acontecer em acordo com os
+   mantenedores do subsistema ou vir diretamente deles.
+
+Sobre kernels stable e longterm:
+
+ * Você é livre para deixar regressões para a equipe stable, se elas em
+   momento algum ocorreram no mainline ou já foram corrigidas lá.
+
+ * Se uma regressão entrou em uma versão mainline de fato nos últimos
+   doze
+   meses, garanta marcar a correção com "Cc: stable@vger.kernel.org",
+   pois uma tag "Fixes:" sozinha não garante um backport. Adicione a
+   mesma tag caso saiba que o culpado foi levado por backport para
+   kernels stable ou longterm.
+
+ * Ao receber relatos sobre regressões em séries de kernel stable ou
+   longterm
+   recentes, avalie ao menos brevemente se o problema pode ocorrer
+   também no mainline atual -- e, se isso parecer provável, assuma o
+   relato. Em caso de dúvida, peça ao autor que verifique o mainline.
+
+ * Sempre que quiser resolver rapidamente uma regressão que recentemente
+   também entrou em uma versão mainline, stable ou longterm de fato,
+   corrija-a rapidamente em mainline; quando apropriado, envolva então
+   Linus para acelerar a correção (veja acima). Isso porque a equipe
+   stable normalmente não reverte nem corrige mudanças que causem os
+   mesmos problemas no mainline.
+
+ * Em caso de correções urgentes de regressão, você pode querer garantir
+   um
+   backport célere enviando uma nota à equipe stable assim que a
+   correção for levada ao mainline; isso é especialmente recomendável
+   durante janelas de merge e logo depois delas, pois de outro modo a
+   correção pode parar no fim de uma fila enorme de patches.
+
+Sobre o fluxo de patches:
+
+ * Desenvolvedores, ao tentarem alcançar os prazos mencionados acima,
+   lembrem-se de considerar o tempo necessário para que as correções
+   sejam testadas, revisadas e mescladas por Linus, idealmente passando
+   ao menos brevemente pelo linux-next. Assim, se uma correção for
+   urgente, deixe isso óbvio para garantir que os outros a tratem
+   adequadamente.
+
+ * Revisores, pedimos gentilmente que auxiliem os desenvolvedores a
+   cumprir
+   os prazos mencionados acima revisando as correções de regressão em
+   tempo hábil.
+
+ * Mantenedores de subsistema, vocês também são encorajados a agilizar o
+   tratamento de correções de regressão. Assim, avaliem se pular o
+   linux-next é uma opção para a correção em questão. Considerem também
+   enviar pull requests do git com mais frequência que o habitual quando
+   necessário. E procurem evitar segurar correções de regressão durante
+   os fins de semana -- especialmente quando a correção estiver marcada
+   para backport.
+
+

-- 
2.53.0



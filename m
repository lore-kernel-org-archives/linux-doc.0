Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354348;
	b=sS6UTIQmYu6MdyoV86HMVWpqqLmOzjTm8XOMxhpVQEqIq5rtML0NFtZzmJ3DzEntFfeI
	 OB3zoXh+u8iXW2P9/B+9vWG6PLHNE1jVeUrehDYk6B6uRLWcurFy467K5df7UiNLkYzmK
	 mTNzJ+N4io/EvTBmP6H72g8RM3DLNo9Qi9y/mx7YRY3hWic1acpZggt3kxuka0dKYuGn5
	 wl1xQCVqIPcF3nosVcOuojXaTP3jSWBTsKoC5tKh1fIJogySyp8XjDpoT9zQYnssffOFp
	 NSljZCjVfCmBGEV8JO6Mj7+6PVi1PB41sTp7UNQNRfFyv0lbBKqaL2/ASw+2YzR9Txg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354348;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=I02dVmtdcUQjdKpnXArusP/C5Cz7DRwuNI+QLYTTF+0=;
	b=axui6bTYBlZUzNWIKiny+aUgGwgzvDv+AXlQpZVX+LsrGoFFC3meP2fE3deZ4QBFL90F
	 cA4/rkc18kRbQaSaQB9RT92Rb5Ia4e45bSof2LhxXx6HA7TYFBMbyT28vXpzeUs7OKN0F
	 kP5Z9wGZdPw7XyvCsqY5nH/McU/oaSPouLVkRS86neD2+EXx7H8UoNSq6kHpx8AEmAcpj
	 UyvtJzvxvyAtC+UJC7O38Fjp2ysQeEAEFnm3PT4/LoeZoCjjnuEwGaKZY40K43hpMdQOF
	 ++hg9RmW5HJqqsm2m3dDetO67ir1xv7n3Y5pwwCIPcyaCIr24DVkkCtPqIe+qiS8V8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+ZqiZHb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C949606A32A
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 13:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+ZqiZHb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354347;
	b=IgU2YyZDsmzRlxnq5AXXv9jnKPfAnXBg3LyQB48Kn+NnV1tYdyxJBRIxJ9ruPcDrYIkL
	 ZHW3y25KYx6ZTSlyTomfqJJcO566I7yOD4LxpNpeJO0W2lADMWm9zq2gwrdn0483fVCom
	 jDDTvN3SE47qM3Rnzrnx9WumGYWVdD+q4VQdOVwHcPc02rOtXsHBBJhFaHBQrTUeOp581
	 rEhRVt2R28ZsDlqYT31wWwRfrsK48fp9jtJz6qxdWrn3EpslczJ5vcyBGw6PZXBdU5DhE
	 6PCj+9S0bl2zN3XqvjftWevep3KpS526tKN1kI0/b1JbB+lhP+LMT3UzIPdLNFhtOwg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354347;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=I02dVmtdcUQjdKpnXArusP/C5Cz7DRwuNI+QLYTTF+0=;
	b=Bch+56EduK1rtFAyabl/jhFCxtUa7ZY/Dtt74CSe/l3JrkeuqKPoLDB28MOOge28RsCJ
	 SMPurv27m5rfB5prodbIIzmr60cTG+ICVUDefwT5AzyhgBObTQgY430c7L35kuL7lWnyi
	 CtlHPKEJGdfbyMr1Iw+U+CbGpbqHaU6NZaXNVNb/UqcxhbSbvTDsQ2Ti32NkBGGdThnQ9
	 LPnpE9H9cemJ30MTWP39Pc98A7oE3WIDpWerNYS985gKTafA59cItYRQstAbdUApQmpeK
	 Wm0ETGfGQb/mN1roEXjwPeTqv6dyLG3JgZpSI0OV8ej98kPbP+svgTxm6VoP5bAIcBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E21F91F000CF;
	Sun, 22 Nov 2026 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354347;
	bh=I02dVmtdcUQjdKpnXArusP/C5Cz7DRwuNI+QLYTTF+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=N+ZqiZHbG6NBFm9JDlWU3BykwUe6rZom5NRaa2mZrA1cQkBX0OjFiw98lJFAGqGek
	 7EGQbNa7xT/DdlPq8Gw4niCWiObGW33uslVYaJ6uIwjomBvG35lO+aRUO5A0yZO58e
	 Uf3CZ+8ma/XD9XaDmzIFxMXUljux6KyBYkDbOSyVIuDkFhMuXqmzoDwg8RnGP8AAVY
	 uDhgGzCgAGQ+fA+/5sIZcIeI4PKJ6k0XZ5YzoXnskruaimJZvXKMn2W78HIfTdPjuM
	 LaBYBxyjl0TCKsMtOeaRdHqVOaqNM0z+eRoC5iiPfXCwMhXn3P/M9odAPn3RJF3JFz
	 SGmojbaPHQMGg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 61F344C08F;
	Sun, 22 Nov 2026 13:32:15 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 10:32:15 -0300
Subject: [PATCH v2 1/3] docs/translations/pt_BR: process: add
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
Message-Id: <20261122-handling-regressions-v2-1-2557db5ab946@gmail.com>
References: <20261122-handling-regressions-v2-0-2557db5ab946@gmail.com>
In-Reply-To: <20261122-handling-regressions-v2-0-2557db5ab946@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Eduardo Pereira Cruz <dreduardocruz@gmail.com>, rdunlap@infradead.org, 
 skhan@linuxfoundation.org, corbet@lwn.net, danielmaraboo@gmail.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354334; l=15972;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=9ekj6E2ZZjvmiGYel3pKF0yqeBfRK1gTeB5nYHQsTJM=;
 b=nOK45jAxpPN4NDxOp9myd3m1uk2Cb4QKF5JaD4djQJjWXRnSSAShhI7SW+o1qvh7+1QczAgeq
 97Ptr4T5gt8C/PK6tYelQMjy3R/xKEUCFITkwfu1aIJT31F3a92BwFN
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
 .../pt_BR/process/handling-regressions.rst         | 307 +++++++++++++++++++++
 1 file changed, 307 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/handling-regressions.rst b/Documentation/translations/pt_BR/process/handling-regressions.rst
new file mode 100644
index 000000000000..50c50f57dc4b
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/handling-regressions.rst
@@ -0,0 +1,307 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR CC-BY-4.0) .. Consulte o final
+deste arquivo para informações adicionais de .. redistribuição.
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
+      inclua-a imediatamente no circuito enviando ao menos um breve
+      "Responder a todos" com a lista em CC.
+
+    * Reencaminhe ou redirecione para a lista qualquer relato enviado em
+      rastreadores de bugs.
+
+#. Faça o robô de acompanhamento de regressões do kernel Linux,
+   "regzbot", acompanhar o problema (isto é opcional, mas recomendado):
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
+   regressão, pode usar tags "Link:" em vez disso. No momento, o
+   regzbot não faz distinção entre as duas.
+
+#. Tente corrigir as regressões rapidamente assim que o culpado for
+   identificado; as correções da maioria das regressões devem ser
+   mescladas em até duas semanas, mas algumas precisam ser resolvidas em
+   dois ou três dias.
+
+
+Detalhes sobre regressões relevantes para os desenvolvedores
+============================================================
+
+
+O básico importante em mais detalhes
+------------------------------------
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
+   "comando do regzbot" como ``#regzbot introduced: 1f2e3d4c5b6a``. Caso
+   não tenha, envie uma resposta (com a lista de regressões em CC) com
+   um parágrafo como o seguinte:::
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
+   importante, pois mais tarde o regzbot vai procurar patches com
+   tags "Closes:" que apontem para o relato nos arquivos em
+   lore.kernel.org.
+
+ * Ao reencaminhar uma regressão relatada em um rastreador de bugs,
+   inclua um parágrafo com estes comandos do regzbot:::
+
+       #regzbot introduced: 1f2e3d4c5b6a
+       #regzbot from: Some N. Ice Human <some.human@example.com>
+       #regzbot monitor: http://some.bugtracker.example.com/ticket?id=123456789
+
+   O regzbot então associará automaticamente os patches ao relato que
+   contenham tags "Closes:" apontando para o seu e-mail ou para o
+   ticket mencionado.
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
+ * Aponte para todos os lugares onde o problema foi relatado usando
+   tags "Closes:" ::
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
+   marque explicitamente a correção para backport usando a tag
+   ``Cc: stable@vger.kernel.org``.
+
+Tudo isso é esperado de você e importante quando se trata de regressão,
+pois essas tags têm grande valor para todos (inclusive você) que
+possam estar investigando o problema semanas, meses ou anos depois.
+Essas tags também são cruciais para ferramentas e scripts usados
+por outros desenvolvedores do kernel ou por distribuições Linux; uma
+dessas ferramentas é o regzbot, que depende fortemente das tags
+"Closes:" para associar relatos de regressão às mudanças que os
+resolvem.
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
+   entraram em uma versão mainline, stable ou longterm adequada (seja
+   diretamente, seja via backport).
+
+ * Não considere as regressões do ciclo atual como algo que pode esperar
+   até o fim do ciclo, pois o problema pode desestimular ou impedir que
+   usuários e sistemas de CI testem o mainline agora ou de modo geral.
+
+ * Trabalhe com o cuidado necessário para evitar danos adicionais ou
+   maiores, mesmo que resolver o problema leve mais tempo do que o
+   descrito abaixo.
+
+Sobre prazos quando o culpado de uma regressão é conhecido:
+
+ * Procure levar uma correção ao mainline em dois ou três dias, se o
+   problema for grave ou incomodar muitos usuários -- seja de modo
+   geral, seja em condições prevalentes, como um ambiente de hardware
+   específico, uma distribuição ou uma série stable/longterm.
+
+ * Procure levar uma correção ao mainline até o domingo seguinte ao
+   próximo, se o culpado entrou em uma versão mainline, stable ou
+   longterm recente (seja diretamente, seja via backport); se o culpado
+   ficou conhecido no início da semana e é simples de resolver, tente
+   levar a correção ao mainline na mesma semana.
+
+ * Para outras regressões, procure levar as correções ao mainline antes
+   do último domingo dentro das próximas três semanas. Um ou dois
+   domingos depois é aceitável, se a regressão for algo com que as
+   pessoas consigam conviver facilmente por um tempo -- como uma
+   regressão leve de desempenho.
+
+ * É fortemente desaconselhado adiar correções de regressão para a
+   próxima janela de merge, exceto quando a correção for
+   extraordinariamente arriscada ou quando o culpado tiver sido levado
+   ao mainline há mais de um ano.
+
+Sobre procedimento:
+
+ * Sempre considere reverter o culpado, pois costuma ser a forma mais
+   rápida e menos perigosa de corrigir uma regressão. Não se preocupe em
+   levar ao mainline uma variante corrigida depois: isso deve ser
+   direto, já que a maior parte do código passou por revisão uma vez.
+
+ * Procure resolver qualquer regressão introduzida no mainline nos
+   últimos doze meses antes que o ciclo de desenvolvimento atual
+   termine: Linus quer que tais regressões sejam tratadas como as do
+   ciclo atual, a menos que a correção envolva riscos incomuns.
+
+ * Considere colocar Linus em CC nas discussões ou na revisão do patch,
+   se uma regressão parecer emaranhada. Faça o mesmo em casos precários
+   ou urgentes -- especialmente se o mantenedor do subsistema puder
+   estar indisponível. Coloque também a equipe stable em CC quando
+   souber que tal regressão entrou em uma versão mainline, stable ou
+   longterm.
+
+ * Para regressões urgentes, considere pedir a Linus que pegue a
+   correção diretamente da lista de discussão: ele não vê problema nisso
+   para correções sem controvérsia. O ideal, porém, é que tais pedidos
+   aconteçam em acordo com os mantenedores do subsistema ou venham
+   diretamente deles.
+
+ * Caso não tenha certeza se uma correção vale o risco de ser aplicada
+   poucos dias antes de uma nova versão mainline, envie a Linus um
+   e-mail com as listas e pessoas habituais em CC; nele, resuma a
+   situação e peça que ele considere pegar a correção diretamente da
+   lista. Ele então pode tomar a decisão e, quando necessário, até adiar
+   a versão. Tais pedidos, novamente, devem idealmente acontecer em
+   acordo com os mantenedores do subsistema ou vir diretamente deles.
+
+Sobre kernels stable e longterm:
+
+ * Você é livre para deixar regressões para a equipe stable, se elas em
+   momento algum ocorreram no mainline ou já foram corrigidas lá.
+
+ * Se uma regressão entrou em uma versão mainline adequada nos últimos
+   doze meses, garanta marcar a correção com "Cc:
+   stable@vger.kernel.org", pois uma tag "Fixes:" sozinha não
+   garante um backport. Adicione a mesma tag caso saiba que o
+   culpado foi levado por backport para kernels stable ou longterm.
+
+ * Ao receber relatos sobre regressões em séries de kernel stable ou
+   longterm recentes, avalie ao menos brevemente se o problema pode
+   ocorrer também no mainline atual -- e, se isso parecer provável,
+   assuma o relato. Em caso de dúvida, peça ao autor que verifique o
+   mainline.
+
+ * Sempre que quiser resolver rapidamente uma regressão que recentemente
+   também entrou em uma versão mainline, stable ou longterm adequada,
+   corrija-a rapidamente em mainline; quando apropriado, envolva então
+   Linus para acelerar a correção (veja acima). Isso porque a equipe
+   stable normalmente não reverte nem corrige mudanças que causem os
+   mesmos problemas no mainline.
+
+ * Em caso de correções urgentes de regressão, você pode querer garantir
+   um backport célere enviando uma nota à equipe stable assim que a
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
+   cumprir os prazos mencionados acima revisando as correções de
+   regressão em tempo hábil.
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



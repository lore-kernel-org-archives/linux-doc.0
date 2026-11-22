Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795355189;
	b=ysCIIcj17mV5+arffmI3aQk/iRU8Fm67nIyNSVXjTk/4ia7r1I40HHw6Aitnca1615eP
	 pldHhU67A6OUVZBozDIqe3OAvfUm9VN7NSOc/PQxIyC7epCjU0CNzgTUJKGiwecbJqw6p
	 Rak+It7hCBkAU0IMFfvo4B48hlde31SO1DnnqiuPrANN35yLhf5dc23nMwpe+TYKRoad1
	 VUrjZ8Z41XVTJETdXGbIDcda3B/66umJEZpnIZ7WFXt8/qNhmrf+tVyQIoO4WenUEcZRB
	 I7ZvwdS+y3ubq9qix3GrWca78Pk2K0c8iTTZAQvbt4FPcw5XI22gG53DKVY5NDLqftw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355189;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pB057NkZDYqdczBABoh917OV5l09xxC3pud6tJA7b28=;
	b=HR91q61h48BYBhJJ0wKu2K+uZPykOLpwCVLp+E+jrQ+tacihq0hG18Z/9TzFn584FbgZ
	 aEVhdgrLGrUVtzTpyH5faq2Ot/y5Q8hM58LKCOvqN2UYJQQdfT5Dafzw/SwfLmJcxynYH
	 JaR3go/S5KNM4Gwf+u3RIpngVaKxfArOPKSScLzn9jlhSsFOo8rHWH+jMv4DNhuCgbVmi
	 PPh84dzeqnQoIvqP+NCPyV7JHovh6CSPADl2s2W2NUm3z/vk4Dd4PR7IUEGR/FYpAoolj
	 IUI76MWkmVQ/obQSxg470YhZ7fcA5Oo4z1x7ohkOw7WesExOS47tFT/GRZhDnPGzpzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hZgr3MGj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA472606A32A
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hZgr3MGj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795355189;
	b=jtqPIApx79GNF0dJdi1ziEM12NSDT0UL5CuU025Nf3GQ/ONV7cOZAUPwQvPaBriKgzkZ
	 HyjN2kMUoyEoo083rEArhxylErRW90QdnyK2+kroKyKGxRM6J7q8QVXvqSQ0MVX861km8
	 lpST6TezjgdQvTS8F39ZXC83oxOEHt7LJCxhbCjNhKcnD0xTjBs8b89G1wGYVg/QnrLJf
	 T2ZsPacVYV6Vaiu2wYNcDgWOJ2d+pF1R0Nbp5sA/oSnZTov6AwSwfrFs83Cv1vddHNa3o
	 dO7aRnIygpjgwloCxfG9OBxqIVuejEZSz5+Nw//W7VeLhUoGRveDtVN8c9Us1P1H7Cg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795355189;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pB057NkZDYqdczBABoh917OV5l09xxC3pud6tJA7b28=;
	b=HDTSV9EPX3h81KxOVxqJYb8f5gtdl7fboBiJTKHzI8o1gXcf0ITntWKGi0Id6lvNPmif
	 oIS0cejQiOGfKuLCBnV4lJjHw2lz40eKlspQ90CR1AmBCPSCMugTlJ/DEpZv7lCyvWoGy
	 5HGHtAGEVQQW/az7H0b2jJhWS6uXKmmGmDtswgAOyWxKI0Jhb2t3AW/A/bous9NUvcj9A
	 jdd+b2p1VbFqyRtBPU52dMXFHxOeCun17ydt6JA5/Jc+abinbg42+le1p9Ouaw9niuNml
	 5/VB5GdtXlLKK8uiCC5c6pdYR4KIyCZGQc+nsRkiLDi/vDoruV/4bIwCRShQjejiExQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 430111F000C0;
	Sun, 22 Nov 2026 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795355189;
	bh=pB057NkZDYqdczBABoh917OV5l09xxC3pud6tJA7b28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hZgr3MGjX/Cw4F1936RsODK3M++DoJeQnMdWe9OLD1pbQRE/EmTkzmI3Za5XpTbzO
	 SBV0r/K37VK0ofU//fjBjk7zKdPqUdWUC3TzUbjrRex5X03BqKoiGSm16GI4XAKcWf
	 hxNUX/ec0jv8mdOXwvXHeb16wEwU6HY1kNb7Oq0EYdLYNnPSUY0ehFfIB3cWhIJ965
	 pJCyeiJbUpJMGt4RoujfsVcJQQoVbOCMIZfPGgOgkyZqap0xsPpjFh/LbziK88bX8N
	 WqWjJ4W9usVcc0fw5L3gdrIeVN5Ykji5Yi6qMlMQ7QysDLy2FrIKETbao+h2T71Lb7
	 EBaheAnPcmT2Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C89F34C0C8;
	Sun, 22 Nov 2026 13:46:16 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 10:46:17 -0300
Subject: [PATCH v3 2/3] docs/translations/pt_BR: process: add
 handling-regressions.rst (2/3)
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
Message-Id: <20261122-handling-regressions-v3-2-e3d5ea982948@gmail.com>
References: <20261122-handling-regressions-v3-0-e3d5ea982948@gmail.com>
In-Reply-To: <20261122-handling-regressions-v3-0-e3d5ea982948@gmail.com>
To: linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com, corbet@lwn.net, rdunlap@infradead.org, 
 skhan@linuxfoundation.org, Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795355175; l=11132;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=wTBeEoWZ5YObuIY6tTiWmBYIlTubs6bOb8juDkqMaL4=;
 b=OUe6XFlvGyg7uKv4f5XWdA4+J+LxQai88Kc4OFzwv05MOMNBwLsBDKQTvtatXx0Cwx67NOIMD
 olT9NVyUZdiDd1C+ImvVG7Pt8ikPI5EZjPYvoAwBMU9udb1O7qJOhus
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com
Content-Transfer-Encoding: 8bit

From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>

Translate the second part: the aspects developers should be aware of
(known regression risk, where to ask for advice) and the chapter on
regression tracking with regzbot, including its commands.

Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
---
 .../pt_BR/process/handling-regressions.rst         | 223 +++++++++++++++++++++
 1 file changed, 223 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/handling-regressions.rst b/Documentation/translations/pt_BR/process/handling-regressions.rst
index 6129cde22ec1..8f18bc28689e 100644
--- a/Documentation/translations/pt_BR/process/handling-regressions.rst
+++ b/Documentation/translations/pt_BR/process/handling-regressions.rst
@@ -324,3 +324,226 @@ Sobre o fluxo de patches:
    para backport.
 
 
+Mais aspectos sobre regressões que os desenvolvedores devem conhecer
+---------------------------------------------------------------------
+
+
+Como lidar com mudanças em que há risco conhecido de regressão
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Avalie quão grande é o risco de regressões, por exemplo realizando uma
+busca de código em distribuições Linux e em forjas Git. Considere também
+pedir a outros desenvolvedores ou a projetos provavelmente afetados que
+avaliem ou até testem a mudança proposta; se surgirem problemas, talvez
+seja possível encontrar alguma solução aceitável para todos.
+
+Se ao final o risco de regressões parecer relativamente pequeno,
+prossiga com a mudança, mas informe todas as partes envolvidas sobre o
+risco. Assim, garanta que a descrição do seu patch torne esse aspecto
+óbvio. Depois que a mudança for mesclada, conte ao rastreador de
+regressões do kernel Linux e à lista de discussão de regressões sobre o
+risco, para que todos tenham a mudança no radar caso relatos comecem a
+aparecer. Dependendo do risco, você também pode querer pedir ao
+mantenedor do subsistema que mencione o assunto no pull request dele
+para o mainline.
+
+O que mais há para saber sobre regressões?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Confira Documentation/admin-guide/reporting-regressions.rst; ele cobre
+vários outros aspectos que você pode querer conhecer:
+
+ * o propósito da regra "sem regressões"
+
+ * quais problemas de fato se qualificam como regressão
+
+ * quem é responsável por encontrar a causa raiz de uma regressão
+
+ * como lidar com situações complicadas, por exemplo quando uma
+   regressão é
+   causada por uma correção de segurança ou quando corrigir uma
+   regressão pode causar outra
+
+A quem pedir conselho quando se trata de regressões
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Envie um e-mail para a lista de discussão de regressões
+(regressions@lists.linux.dev) com o rastreador de regressões do kernel
+Linux (regressions@leemhuis.info) em CC; se o assunto puder ser tratado
+melhor em particular, sinta-se à vontade para omitir a lista.
+
+
+Mais sobre o acompanhamento de regressões e o regzbot
+------------------------------------------------------
+
+
+Por que o kernel Linux tem um rastreador de regressões e por que o
+regzbot é usado?
+~~~~~~~~~~~~~~~~
+
+Regras como "sem regressões" precisam de alguém que garanta que sejam
+seguidas, caso contrário são quebradas por acidente ou de propósito. A
+história tem mostrado que isso é verdadeiro também para o kernel Linux.
+É por isso que Thorsten Leemhuis se ofereceu para ficar de olho nas
+coisas como rastreador de regressões do kernel Linux, sendo
+ocasionalmente ajudado por outras pessoas. Nenhum deles é pago para
+fazer isso, e é por isso que o acompanhamento de regressões é feito na
+base do melhor esforço.
+
+Tentativas anteriores de acompanhar regressões manualmente mostraram que
+é um trabalho exaustivo e frustrante, motivo pelo qual foram abandonadas
+depois de um tempo. Para evitar que isso acontecesse de novo, Thorsten
+desenvolveu o regzbot para facilitar o trabalho, com o objetivo de longo
+prazo de automatizar o acompanhamento de regressões o máximo possível
+para todos os envolvidos.
+
+Como funciona o acompanhamento de regressões com o regzbot?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+O robô observa as respostas aos relatos de regressões acompanhadas. Além
+disso, ele procura patches publicados ou commitados que referenciem tais
+relatos com tags "Closes:"; respostas a esses envios de patch também são
+acompanhadas. Combinados, esses dados oferecem boa visão do estado atual
+do processo de correção.
+
+O regzbot procura fazer o seu trabalho com a menor sobrecarga possível
+tanto para quem relata quanto para os desenvolvedores. Na verdade,
+apenas quem relata recebe um dever extra: é preciso informar ao regzbot
+sobre o relato de regressão usando o comando ``#regzbot introduced``
+descrito acima; se a pessoa não fizer isso, alguém pode cuidar disso
+usando ``#regzbot ^introduced``.
+
+Para os desenvolvedores normalmente não há trabalho extra envolvido;
+eles só precisam garantir que fazem algo esperado muito antes de o
+regzbot existir: adicionar à descrição do patch links para todos os
+relatos sobre o problema corrigido.
+
+Eu preciso usar o regzbot?
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+É do interesse de todos que você use, pois mantenedores do kernel como
+Linus Torvalds se apoiam em parte no acompanhamento do regzbot em seu
+trabalho -- por exemplo, ao decidir lançar uma nova versão ou estender a
+fase de desenvolvimento. Para isso, eles precisam estar cientes de todas
+as regressões não corrigidas; para tanto, sabe-se que Linus examina os
+relatórios semanais enviados pelo regzbot.
+
+Preciso contar ao regzbot sobre toda regressão com que eu esbarrar?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+O ideal é que sim: somos todos humanos e esquecemos facilmente de
+problemas quando algo mais importante surge de repente -- por exemplo,
+um problema maior no kernel Linux ou algo na vida real que nos mantenha
+longe do teclado por um tempo. Assim, é melhor contar ao regzbot sobre
+toda regressão, exceto quando você escreve uma correção imediatamente e
+a commita em uma árvore regularmente mesclada na série de kernel
+afetada.
+
+Como ver quais regressões o regzbot acompanha no momento?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Consulte a `interface web do regzbot
+<https://linux-regtracking.leemhuis.info/regzbot/>`_ para as informações
+mais recentes; alternativamente, `procure o relatório de regressões mais
+recente
+<https://lore.kernel.org/lkml/?q=%22Linux+regressions+report%22+f%3Aregzbot>`_,
+que o regzbot normalmente envia uma vez por semana, no domingo à noite
+(UTC), algumas horas antes de Linus publicar novas versões (ou
+pré-versões).
+
+Quais lugares o regzbot monitora?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+O regzbot observa as listas de discussão mais importantes do Linux, bem
+como os repositórios git do linux-next, do mainline e das séries
+stable/longterm.
+
+Que tipo de problema deve ser acompanhado pelo regzbot?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+O robô serve para acompanhar regressões; portanto, não envolva o regzbot
+em problemas comuns. Mas não há problema, para o rastreador de
+regressões do kernel Linux, se você usar o regzbot para acompanhar
+problemas graves, como relatos de travamentos, dados corrompidos ou
+erros internos (Panic, Oops, BUG(), warning, ...).
+
+Posso adicionar ao acompanhamento do regzbot regressões encontradas por
+sistemas de CI?
+~~~~~~~~~~~~~~~
+
+Fique à vontade para fazê-lo, se a regressão em questão provavelmente
+tiver impacto em casos de uso práticos e, assim, puder ser notada por
+usuários; portanto, não envolva o regzbot em regressões teóricas com
+pouca chance de se manifestarem no uso real.
+
+Como interagir com o regzbot?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Usando um 'comando do regzbot' em uma resposta direta ou indireta ao
+e-mail com o relato de regressão. Esses comandos precisam estar em seu
+próprio parágrafo (ou seja: precisam ser separados do restante do e-mail
+por linhas em branco).
+
+Um desses comandos é ``#regzbot introduced: <versão ou commit>``, que
+faz o regzbot considerar o seu e-mail como um relato de regressão
+adicionado ao acompanhamento, como já descrito acima; ``#regzbot
+^introduced: <versão ou commit>`` é outro desses comandos, que faz o
+regzbot considerar o e-mail pai como um relato de uma regressão que ele
+passa a acompanhar.
+
+Depois que um desses dois comandos tiver sido usado, outros comandos do
+regzbot podem ser usados em respostas diretas ou indiretas ao relato.
+Você pode escrevê-los abaixo de um dos comandos `introduced` ou em
+respostas ao e-mail que usou um deles, ou que por sua vez seja resposta
+a esse e-mail:
+
+ * Definir ou atualizar o título::
+
+       #regzbot title: foo
+
+ * Monitorar uma discussão ou um ticket em bugzilla.kernel.org onde
+   aspectos
+   adicionais do problema ou de uma correção são discutidos -- por
+   exemplo, a publicação de um patch que corrige a regressão::
+
+       #regzbot monitor:
+       https://lore.kernel.org/all/30th.anniversary.repost@klaava.Helsinki.FI/
+
+   O monitoramento funciona apenas para lore.kernel.org e
+   bugzilla.kernel.org; o regzbot considerará todas as mensagens naquele
+   encadeamento ou ticket como relacionadas ao processo de correção.
+
+ * Apontar para um lugar com mais detalhes de interesse, como uma
+   mensagem em
+   lista de discussão ou um ticket em um rastreador de bugs que sejam
+   levemente relacionados, mas sobre outro assunto::
+
+       #regzbot link:
+       https://bugzilla.kernel.org/show_bug.cgi?id=123456789
+
+ * Marcar uma regressão como corrigida por um commit que está indo para
+   o
+   upstream ou já foi aplicado::
+
+       #regzbot fix: 1f2e3d4c5d
+
+ * Marcar uma regressão como duplicada de outra já acompanhada pelo regzbot::
+
+       #regzbot dup-of: https://lore.kernel.org/all/30th.anniversary.repost@klaava.Helsinki.FI/
+
+ * Marcar uma regressão como inválida::
+
+       #regzbot invalid: wasn't a regression, problem has always existed
+
+Há mais a dizer sobre o regzbot e seus comandos?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Informações mais detalhadas e atualizadas sobre o robô de acompanhamento
+de regressões do kernel Linux podem ser encontradas na sua `página do
+projeto <https://gitlab.com/knurd42/regzbot>`_, que entre outras coisas
+contém um `guia de primeiros passos
+<https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md>`_
+e `documentação de referência
+<https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md>`_,
+ambos cobrindo mais detalhes do que a seção acima.
+

-- 
2.53.0



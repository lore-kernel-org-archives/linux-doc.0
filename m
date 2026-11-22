Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354349;
	b=mhktvqibQk9i8ZK6nsBPmcOrTr+1YDG2ShJsxGWCF9LzdsyoZHYkU5sMY3Rps/IRUJgX
	 7qWR19BntLlBAySA2nNbtxP7+LqVk01wUsaK7qhrJ4ZzuVQ31fK5/bQUF/fEGkWYQYsE6
	 m6RL1r7HLRdtQxdHmqzbJLj1qscTgYf/C4o0zVu5R5XSYHrnVtIU2RcwCi8T+3JBO9biQ
	 NPoBHDEWFFMKyrJurzHjMGGCXxkfyigD0aQ8GlkMoGewTyfbQHV4vWrZJDrrLPEC2xEBV
	 KXNea2yRxnU7IoPfXAiArkM+v6qrrEkkWDiZfPZaZEv72DwfHTzrz9DnwRaqSHkc3yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354349;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kHRJAasgyu6W44M0HZyI0FQVN3Kd0TeTVkHExr/ixy8=;
	b=Mx709XahaZwBgv7jll5VF9geAqu1OoDeGIWO2T6i5fuS6HquAcQVqFb9ZsQ/6ifPzRLv
	 iWPzz/Muai7IMuV0YCKgbyk8MAZRBmKSYl/VZqfoYkmxNlRpJJ0y7YJCXDJNJIjj5t3Qc
	 DjOHWIS5v+I6vaMB/Bo0b7+dPpwJnL6mD2N8eIc13Rum7SeFXKpVdp1YdibDsz5YHAEO8
	 lGxg9lieeUembaTBf/rDsWqFrXt/SFRQUc7Ik2aJlK4/EtYal6JhF2df4erswmu3XfTcZ
	 Dtuzzz9FV2HIubVXTHBS2tZcdQsLYX17hsoy0Re9KNXTIEXQUJOCdMUbrtgn1e+b2HA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jN1QuaLd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3597F606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jN1QuaLd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354348;
	b=vhxCgULraa5ovJwVMMJm4oZrYGn+xvmhBj+cul2BH4dxWSA5/rIrghSaLKIUaqOnW78m
	 Si8wtAyRCfzd2rtVno31YlnMto/hYwEmXe3LiB9OoKzw17e8LRfxFP3UfayEDsulGQXxh
	 sROLxDHPHgJDsjJnDqtW1AAV9CPc/DQdm6DQdTyBMZnCZap0L1l8Jlb76k5JRtPJIIOTg
	 h/JRprR4sSYzYS1VfQyRSXUuxI6n5gzKBF7voltkfFQ2OtgnhtR9BoxMH72SAJ0qcRpfa
	 sGEExeNKqDs9vyoiEjVLRxmdOA0NP3LJU4DAYa+oILOXGNMUTnjiaGjd1Ejes2TiCXA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354348;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kHRJAasgyu6W44M0HZyI0FQVN3Kd0TeTVkHExr/ixy8=;
	b=3kvtLYw0vxCSpMlXPq7H/oB6Y5Wt1dQ89K33LOkPwrumcTIvsMAf1gT3AK5hXX7SDvC8
	 mB4SpaaWNpyblgXtLsE+QZmd7IbvYnw+erNFNqXLU6ID1ghn0dyjIKLTPzjN/dg2SH+Dr
	 naVJG83cQ8T0qlTcmxeyXqO+SAtrnBu1usQfyF3aWKCDRWkW0B9RZk3o/xN+XeLqcRGWH
	 3pPhvRJ/7p3KFHWlaeB8uPCDcktWFgnB9s6ZFX6fApvg9uDFOwzTE78i62/qR3iSuutb3
	 MoqMz0fIaIlpFSv6j0adfE3o8gSzADidAw3VYz0BLpeRaZlDHd3eEbeDeGILuagptQQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFD481F000D0;
	Sun, 22 Nov 2026 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354348;
	bh=kHRJAasgyu6W44M0HZyI0FQVN3Kd0TeTVkHExr/ixy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jN1QuaLdpq43FWBYK6V/e3KgbIf65jG1qT9+E3HatKtOjRVOE8uwDaHRv10R8xxDg
	 cjKMkY3/aU3Z0pduqcIfS7FUeDs41zkzsvQAbva5mC1FAOtWlR5tuQDCEsnAzawtNJ
	 AvY0e95LR0e7ZsrS/TqUIWYFXkk7E9XhDH1WCPikKrZ6ipx8oZaMd0xs6nMU5A65bu
	 uxjVEWMp/oVuCCQlM4EnfVtGIUOjCkMT8+Q62NChGxKMlQDKq+hBfZfbEiz0fGcd8w
	 6QKSewh18s7aXU4aW9VaezP/KaIk6idTRLvm1C51zSWuXHVkdry0ZpQyfRCdj7iSCY
	 h3KymU01kQmaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7C67D4C093;
	Sun, 22 Nov 2026 13:32:15 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 10:32:16 -0300
Subject: [PATCH v2 2/3] docs/translations/pt_BR: process: add
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
Message-Id: <20261122-handling-regressions-v2-2-2557db5ab946@gmail.com>
References: <20261122-handling-regressions-v2-0-2557db5ab946@gmail.com>
In-Reply-To: <20261122-handling-regressions-v2-0-2557db5ab946@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Eduardo Pereira Cruz <dreduardocruz@gmail.com>, rdunlap@infradead.org, 
 skhan@linuxfoundation.org, corbet@lwn.net, danielmaraboo@gmail.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354334; l=11099;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=O3Q3jnUrDnWMkHifTi29sbI5U1SscWtK5X6aFEPt1Ls=;
 b=772+8zywxnOsk/WgjfmygugbeRt6bE7bZM+JV1yFOU+BkvK7aK6Cm8QHCP6/ithsl+M4Yz/Eq
 vbEjjSaFZoHCRFIxjPkqNgEG42j8nMG1xa3wwDPeS4TfX/ji3S0Jxcj
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
 .../pt_BR/process/handling-regressions.rst         | 218 +++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/handling-regressions.rst b/Documentation/translations/pt_BR/process/handling-regressions.rst
index 50c50f57dc4b..4366cdfdf1ab 100644
--- a/Documentation/translations/pt_BR/process/handling-regressions.rst
+++ b/Documentation/translations/pt_BR/process/handling-regressions.rst
@@ -305,3 +305,221 @@ Sobre o fluxo de patches:
    para backport.
 
 
+Mais aspectos sobre regressões que os desenvolvedores devem conhecer
+--------------------------------------------------------------------
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
+   regressão é causada por uma correção de segurança ou quando corrigir
+   uma regressão pode causar outra
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
+-----------------------------------------------------
+
+
+Por que o kernel Linux tem um rastreador de regressões e por que o
+regzbot é
+usado?
+~~~~~~
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
+relatos com tags "Closes:"; respostas a esses envios de patch
+também são acompanhadas. Combinados, esses dados oferecem boa visão do
+estado atual do processo de correção.
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
+Posso adicionar regressões encontradas por CI ao regzbot?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
+   aspectos adicionais do problema ou de uma correção são discutidos --
+   por exemplo, a publicação de um patch que corrige a regressão::
+
+       #regzbot monitor: https://lore.kernel.org/all/30th.anniversary.repost@klaava.Helsinki.FI/
+
+   O monitoramento funciona apenas para lore.kernel.org e
+   bugzilla.kernel.org; o regzbot considerará todas as mensagens naquele
+   encadeamento ou ticket como relacionadas ao processo de correção.
+
+ * Apontar para um lugar com mais detalhes de interesse, como uma
+   mensagem em lista de discussão ou um ticket em um rastreador de bugs
+   que sejam levemente relacionados, mas sobre outro assunto::
+
+       #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=123456789
+
+ * Marcar uma regressão como corrigida por um commit que está indo para
+   o upstream ou já foi aplicado::
+
+       #regzbot fix: 1f2e3d4c5d
+
+ * Marcar uma regressão como duplicada de outra já acompanhada pelo
+   regzbot::
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



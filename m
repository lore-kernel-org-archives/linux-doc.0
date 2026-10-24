Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848132;
	b=WTKgkTXl1/hnEV1BLalZymB1KPku8Ehi+tJsp9rGtrCH/jR7ijCvetFYtDOQk6qt0ljE
	 3vnvzycldc5B99yhMX05IRzSZuLhjw/uE6Osl6/RJ6wP0AN3+aAPrzaTLTYqQchWRSveK
	 fsinpaiasZRm7VPyVzOXt7+NVs2hMb7y9I2LlNKLp4hEwmODb2aJUXJ2z6Vs5r9OezR5A
	 ximrZ9BT+P92O1DtQe5S/hVkYSYVFUevfLuHbLXWl3YX7c3KQ50+hK3/1H/K5PxMQJ8vo
	 vFIIZySoiiOJ8h1Tuc7b6GPzZe1qkXUS3VA3xHl6yt7BqP8XB2VfdWsTBsBR7olz7rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nAZupw1eCKziR0M8D+yaK6UHqIeSruv+kPHdTs8m78s=;
	b=achm6OpbSxud+wUyB9a8hMKksTyEOGcAYX8VebZseZgomPOV8FSi9w5IZAt5y13mOble
	 lAMPqNJIES1ETtJMiNSfnRuS3NIvrhpvwCM5U+PRtwbxxvKgA5TrcJg4hpxkbvRJ1r4Nx
	 EmvebaU2CwDmPgXKqgfWE9Vw6KM7B6TYQnfpKHujrkJY2BDWSQdHaK/EfQ3etx8HldAje
	 1orb4HgPYNXnOnwZPmqpFoom3IsfTvOY42TPtfQfWqh0eMVyNP3VpIASdyMJpY4A8vQBY
	 YLRKRS2/odUbaixObvxjBs/bcqchKmkfEY1tsB31dFhajFcs1hzjaROhUdDGcyaMCvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sibz1Z10;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60703606A31B
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60703606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sibz1Z10
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3258753eec.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848131; x=1793452931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAZupw1eCKziR0M8D+yaK6UHqIeSruv+kPHdTs8m78s=;
        b=sibz1Z10rW1s9y2l6I8HRzdC8+ELVferVnpxDxRxsPGq8WfRkWUUtkBG4b5aTcxLt+
         eSTOKadbhEVojUyAfZg3g5hlnIyeGvDE/lEgtlYQ3joPeNdSwdJjCuuCedZOcfSLYzdk
         M4QBpxzVykHrA6rddqC5gmFCbytENUf4MBt50L7G1s7VPcztdaX9EDImUgz+pis8n7YW
         NiugPK1njZOxnjhvHCT21DvJUwEww5Q7JfEeLmUBnzs/vPlfeO1wLVjIHlwnG7l6bu0f
         ulf+pH8KMHJrMJMbLaKW08oEtcETmAANZfie3+wbPOip77Ho9a/Mr6ilyE6+HkIDCRQ7
         6Okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848131; x=1793452931;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAZupw1eCKziR0M8D+yaK6UHqIeSruv+kPHdTs8m78s=;
        b=vX8ZOklKN3rxi3K30KTlyClGGRPp/T1IT/5rq36J9W3Qm8MG+yzPzzh1TfubDqS5Zk
         501+lX5Rx/hgUF7lFixV6vMLCW77wMRD253vjmzpJgx6/hwhc/0YXd/PGiaMUBb9AL4V
         GBceeQMrDKMjXn6I/v/1PRNTWNsqwerPO6wqhv9EM2k6RnHe/XUmVzRCtNQuyEGdEtZp
         0UoLNeM8tgF7IRtE+sDEDuS3QDt5ua85CsYDKpAu/jzefXoNLP2VfugEjO8aVz0XvNtY
         7CNhF6cWiEEuvL+ZBMl+qhG6E2e+CyfAWeat0Mf1jWix1iU0hb/7EvNJaWm4qyQjHnbm
         qTQw==
X-Forwarded-Encrypted: i=1; AKwUvBwgDv6cQxuHiHQXckCO2zWXFJLfGeBjPTWooTrsf0ZMlFRsXt4aEq4bd/BFckJBcQkHYaquUCP3mL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0Cy2nItognKF3G3gWTXANwTWMM3Vm925cbWa62XIE9P8KZWEF
	xgmpIIEgtx8JPCrPk19T6Y1c8f1BDloiY/1l8XVwyQTmfzlxd2/f64EoiBsDMBs9
X-Gm-Gg: AYBFou3TWnwfj5xXH5rskNVQ7vado/qXnesRklla1lcNz2IOt8/DugbesgrMZRXLMgf
	bJNL00KiEeAaLjGkQxkJ0i2I9Z8vRNMBftCvoHqdmAryEDPWipZNvn1KFxbp9jzAkku1OHAL2Vx
	sNVxh30lrWWa9/S4VziEfZXLLu9CUcbj5QaXnjv9wKvLJr8LPWcNjpFZTlEHB7eQemE/Lcenkzq
	BvLQfGR7Z0yuDz7yfG14rmMoqu2mElkyDHOWIJPkpmDsfmW09slKhU3M+6eNTb2IiBjKf6ck3PC
	hV/2bOOrePqZ4Vbl1FbqRQbueUnnb3PMK2+yUl4aPqshpBpdNn34Gi+M3bmuXHXrsBw8X3ILVm+
	JtEex3du8pw2TO+IzsfhcK0tiPInWiBXggemKjotgL6BmbVa3q1qvZH1Utl3jEslJkCjC41JQjT
	l37yjdzYJAh7BFq4H/4c1F2/5r8ZNN7kJkipsanWzhQWbcVuD9gfEajQxXLPs/D5jdadWVgZU0t
	wyzHj9OrfB7Zn7ho3A/NzMuodgkBPWviZyuYZkiob9nLy8jaJ8RYgOdynJIsxC7jBxtYXoLQtSb
	5qQ44yOa4YN0BShJ6bgy7vy6TvPXnEpVjxkB5q6XEqD87934j9XYmlwooTau2eG7pF7DB619LeQ
	pi9ilS6bL
X-Received: by 2002:a05:7301:e110:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-369e8614733mr3003216eec.23.1792848130846;
        Sat, 24 Oct 2026 06:22:10 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:10 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 04/11] docs/translations/pt_BR: process: maintainer-netdev.rst: sync with English
Date: Sat, 24 Oct 2026 10:21:51 -0300
Message-ID: <20261024132158.39493-5-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024132158.39493-1-danielmaraboo@gmail.com>
References: <20261024132158.39493-1-danielmaraboo@gmail.com>
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

Sync with the English version: translate the paragraphs about the
LLM-generated reviews (Sashiko) and about not contacting maintainers or
reviewers through private channels.

Also fix errors against the English text:

- "We give no guarantees that netdevsim won't change" had its negation
  inverted;
- "eventually" was translated with the false friend "eventualmente";
- restore "process issues", "~10 weeks", the dash in the RFC paragraph
  and "xmas" in "reverse xmas tree";
- "Updating patch status" was a section instead of a subsection;
- two inline literals were not closed properly and rendered with
  visible backquotes;
- add a missing space after a semicolon in the tl;dr and remove a
  doubled space in the example reply;
- restore the links to the patch status, local variable ordering,
  stable kernel rules, submitting patches and patch review sections,
  adding the pt_BR_patch_status, pt_BR_rcs and
  pt_BR_development_advancedtopics_reviews labels, which mirror the
  English ones.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/7.AdvancedTopics.rst        |  2 +
 .../pt_BR/process/maintainer-netdev.rst       | 76 +++++++++++++------
 2 files changed, 54 insertions(+), 24 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/7.AdvancedTopics.rst b/Documentation/translations/pt_BR/process/7.AdvancedTopics.rst
index bd98927c4..bbf0c733a 100644
--- a/Documentation/translations/pt_BR/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/pt_BR/process/7.AdvancedTopics.rst
@@ -154,6 +154,8 @@ esperam e também verificará se você se lembrou de dar push nessas alteraçõe
 para o servidor público.
 
 
+.. _pt_BR_development_advancedtopics_reviews:
+
 Revisão de patches
 ------------------
 
diff --git a/Documentation/translations/pt_BR/process/maintainer-netdev.rst b/Documentation/translations/pt_BR/process/maintainer-netdev.rst
index e9bb998c7..2f90bd93e 100644
--- a/Documentation/translations/pt_BR/process/maintainer-netdev.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-netdev.rst
@@ -7,11 +7,11 @@ Subsistema de Rede do Linux (netdev)
 tl;dr
 -----
 
-- **Direcione seu patch para uma árvore** – use ``[PATCH net]``para correções
+- **Direcione seu patch para uma árvore** – use ``[PATCH net]`` para correções
   ou ``[PATCH net-next]`` para novas funcionalidades.
 - **Tag Fixes** – para correções, a tag ``Fixes:`` é obrigatória,
   independentemente da árvore de destino.
-- **Tamanho da série** – não envie séries grandes (> 15 patches);divida-as em
+- **Tamanho da série** – não envie séries grandes (> 15 patches); divida-as em
   partes menores.
 - **Intervalo de envio** – não reenvie seus patches dentro de um período de 24
   horas.
@@ -70,7 +70,7 @@ mesclagem (*merge window*) e o ``net-next`` está fechado.
 ------------------------------
 
 Existem duas árvores de rede (repositórios git) em jogo. Ambas são coordenadas
-por David Miller, o mantenedor principal de rede. Há a árvore ``net``e a árvore
+por David Miller, o mantenedor principal de rede. Há a árvore ``net`` e a árvore
 ``net-next``. Como você provavelmente pode adivinhar pelos nomes, a árvore
 ``net`` é para correções de código existente já na árvore mainline de Linus, e a
 ``net-next`` é para onde o novo código vai para o lançamento futuro.
@@ -81,7 +81,7 @@ Você pode encontrar as árvores aqui:
 
 Relacionando isso ao desenvolvimento do kernel: no início da janela de mesclagem
 (*merge window*) de 2 semanas, a árvore ``net-next`` será fechada, sem novas
-mudanças ou funcionalidades. O conteúdo novo acumulado nas últimas 10 semanas
+mudanças ou funcionalidades. O conteúdo novo acumulado nas últimas ~10 semanas
 será passado para a mainline/Linus via um *pull request* para a vX.Y ao mesmo
 tempo, a árvore ``net`` começará a acumular correções para este conteúdo enviado
 relacionado à vX.Y.
@@ -118,6 +118,8 @@ Finalmente, a vX.Y é lançada e todo o ciclo recomeça.
 Revisão de patches da netdev
 ----------------------------
 
+.. _pt_BR_patch_status:
+
 Status do patch
 ~~~~~~~~~~~~~~~
 
@@ -168,7 +170,7 @@ transportaram; portanto, se você tiver problemas para encontrar seu patch,
 anexe o valor do ``Message-ID`` à URL acima.
 
 Atualizando o status do patch
------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Colaboradores e revisores não têm permissões para atualizar o estado do patch
 diretamente no patchwork. O Patchwork não expõe muitas informações sobre o
@@ -216,26 +218,48 @@ comentários e respostas cheguem após uma semana de silêncio. Se um
 patch não estiver mais ativo no patchwork e a thread ficar inativa por mais de
 uma semana - esclareça os próximos passos e/ou envie a próxima versão.
 
-Especificamente para envios de RFC, se ninguém responder em uma semana  ou os
+Especificamente para envios de RFC, se ninguém responder em uma semana - ou os
 revisores perderam o envio ou não têm opiniões fortes a respeito. Se o código
 estiver pronto, reenvie como um PATCH.
 
+Há 2 serviços que fornecem ativamente revisões geradas por LLM para os patches
+enviados:
+
+- https://sashiko.dev/
+- https://netdev-ai.bots.linux.dev/sashiko/
+
+ambos usam a infraestrutura do Sashiko sobre modelos diferentes. As revisões
+ficam disponíveis após 24h. Espera-se que os autores dos patches analisem
+proativamente as revisões geradas por IA e tratem esse feedback como qualquer
+outro tipo de revisão: discutindo-o ou atendendo-o. Em ambos os casos, espera-se
+uma resposta na lista de discussão.
+
+Os autores são fortemente encorajados a executar revisões por LLM nos patches
+antes de enviá-los de fato. Séries grandes que gerem uma quantidade
+significativa de feedback gerado por IA provavelmente receberão pouca atenção
+dos mantenedores e revisores.
+
 E-mails dizendo apenas "ping" ou "bump" são considerados rudes. Se você não
 conseguir identificar o status do patch pelo patchwork ou onde a discussão
 parou - descreva sua melhor suposição e pergunte se ela está correta. Por
 exemplo::
 
-  Não entendo quais são os próximos passos. A Pessoa X parece estar  descontente
+  Não entendo quais são os próximos passos. A Pessoa X parece estar descontente
   com A; devo fazer B e enviar novamente os patches?
 
+Não entre em contato com mantenedores ou revisores por e-mail privado e/ou
+outros canais de comunicação: toda a discussão deve permanecer pública, e pedir
+atenção especial é, na melhor das hipóteses, injusto com a comunidade.
+
 .. _Solicitações de mudanças:
 
 Mudanças solicitadas
 ~~~~~~~~~~~~~~~~~~~~
 
-Patches marcados como ``Changes Requested`` precisam ser revisados. A nova
-versão deve vir com um registro de alterações (changelog),
-preferencialmente incluindo links para as postagens anteriores, por exemplo::
+Patches :ref:`marcados<pt_BR_patch_status>` como ``Changes Requested``
+precisam ser revisados. A nova versão deve vir com um registro de alterações
+(changelog), preferencialmente incluindo links para as postagens anteriores,
+por exemplo::
 
   [PATCH net-next v3] net: faz as vacas dizerem "muuu"
 
@@ -292,8 +316,8 @@ incrementais são preferidas.
 Embora antigamente as submissões para a netdev não devessem carregar tags
 explícitas ``CC: stable@vger.kernel.org``, esse não é mais o caso hoje em dia.
 Por favor, siga as regras padrão de estabilidade em
-``Documentation/process/stable-kernel-rules.rst``, e certifique-se de incluir as
-tags Fixes apropriadas!
+:ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`,
+e certifique-se de incluir as tags Fixes apropriadas!
 
 Correções de segurança
 ~~~~~~~~~~~~~~~~~~~~~~
@@ -359,7 +383,8 @@ Se for o seu primeiro patch, envie-o para si mesmo por e-mail para que você
 possa testar a aplicação em uma árvore sem patches para confirmar que a
 infraestrutura não o danificou.
 
-Finalmente, volte e leia ``Documentation/process/submitting-patches.rst``
+Finalmente, volte e leia
+:ref:`Documentation/process/submitting-patches.rst <pt_BR_submittingpatches>`
 para ter certeza de que não está repetindo algum erro comum documentado lá.
 
 Indicando a árvore de destino
@@ -399,8 +424,10 @@ Este limite tem o objetivo de focar o esforço do desenvolvedor nos testes dos
 patches antes da revisão upstream, auxiliando a qualidade das submissões
 upstream e aliviando a carga sobre os revisores.
 
-Ordenação de variáveis locais ("árvore invertida", "RCS")
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+.. _pt_BR_rcs:
+
+Ordenação de variáveis locais ("árvore de Natal invertida", "RCS")
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 A netdev tem uma convenção para ordenar variáveis locais em funções. Ordene as
 linhas de declaração de variáveis da mais longa para a mais curta, por exemplo::
@@ -416,7 +443,7 @@ Precedência de formatação
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Ao trabalhar em código existente que utiliza formatação não padrão, faça com
-que seu código siga as diretrizes mais recentes, para que, eventualmente,
+que seu código siga as diretrizes mais recentes, para que, com o tempo,
 todo o código no domínio da netdev esteja no formato preferido.
 
 Uso de construções gerenciadas por dispositivo e cleanup.h
@@ -445,7 +472,7 @@ contexto de outro trabalho. Por exemplo:
 
 * Tratar avisos do ``checkpatch.pl`` e outros avisos triviais de estilo de
   codificação
-* Tratar problemas de Ordenação de variáveis locais
+* Tratar problemas de :ref:`Ordenação de variáveis locais<pt_BR_rcs>`
 * Conversões para APIs gerenciadas por dispositivo (auxiliares ``devm_``)
 
 Isso ocorre porque se considera que a agitação (*churn*) que tais mudanças
@@ -516,10 +543,11 @@ falha no núcleo que são difíceis de exercitar com um driver real.
 ``netdevsim`` em si **não** é considerado um caso de uso/usuário.
 Você também deve implementar as novas APIs em um driver real.
 
-Não damos garantias de que o ``netdevsim`` mudará no futuro de uma forma que
-quebraria o que normalmente seria considerado uAPI.  O ``netdevsim`` é reservado
-apenas para uso por testes upstream, portanto, quaisquer novos recursos do
-``netdevsim`` devem ser acompanhados de selftests em ``tools/testing/selftests/``.
+Não damos garantias de que o ``netdevsim`` não mudará no futuro de uma forma
+que quebraria o que normalmente seria considerado uAPI. O ``netdevsim`` é
+reservado apenas para uso por testes upstream, portanto, quaisquer novos
+recursos do ``netdevsim`` devem ser acompanhados de selftests em
+``tools/testing/selftests/``.
 
 Status de suporte para drivers
 ------------------------------
@@ -579,7 +607,7 @@ Orientações para revisores
 
 Revisar patches de outras pessoas na lista é altamente incentivado,
 independentemente do nível de experiência. Para orientações gerais e dicas
-úteis, consulte `revisão de tópicos avançados de desenvolvimento`.
+úteis, consulte :ref:`pt_BR_development_advancedtopics_reviews`.
 
 É seguro assumir que os mantenedores da netdev conhecem a comunidade e o nível
 de experiência dos revisores. Os revisores não devem se preocupar com o fato de
@@ -588,8 +616,8 @@ seus comentários impedirem ou desviarem o fluxo de patches. Uma tag Reviewed-by
 "Posso atestar que este código está correto".
 
 Revisores são fortemente incentivados a fazer uma revisão mais aprofundada das
-submissões e não focar exclusivamente em questões triviais ou subjetivas, como
-formatação de código, tags, etc.
+submissões e não focar exclusivamente em questões de processo, triviais ou
+subjetivas, como formatação de código, tags, etc.
 
 Depoimentos / feedback
 ----------------------
-- 
2.47.3


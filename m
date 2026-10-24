Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848140;
	b=W87iHXthwDDLahZJZqeJTRXSH2Pcnb73vRCbqbbTjlcatsIcYGkDbfK+0TphwHx87AzR
	 HbLQ5KsSxSO/h2/DslvQlbIJn6wC+ZLUteQeYZ6rcQYd4xyMdiAbjJmx4h7IDB5zDfQo3
	 xhVgTbRuXfdiznmZrYQ9K8QZKn8fJINGyX+s9PRM1Yku0OVWW3rgb1R0oR5tbPrC7uXgt
	 PpWq3BtUrMoEDwLSitcEcv4DGNwtJKPaGI/4hkhUg/IKgjrJDAdxC5x93N/QymPuZA+i5
	 XWsun2YxQtWeaIItZGDLstCtX/Lz/t8EYjtkFG8a+BS+c6HRnV2jLv39izJQcb0W+vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=zAXqz+LVlVqjIkmBV7Lv8XcpK0kQZYM39dSFRxYLqs8=;
	b=P5+lL2ks/rmYJjDFRA/aB2hbX2hznDCag5FYi5RWMkAElBkE3LCebb32spKZnL2KC59z
	 tRjmxJGxVTkTqiiqnT4hdMt1tL/ko0XHu62QDfr9f5564L8yFXkh6ETFveiHVAakL8Ywt
	 5Jsef5+KZs/zxyWeizL86Pjyz7MYzlutHo0ud2X7BiU5B6Da5XhddPZT78lFJdgROqSEB
	 eb7RqHfK5cEzX/7gW7iIMJQY0TcZ6AMJf7VG4dizH+WwWccTEaZvL8jbtjCgT5hLFlVWe
	 5Pk+WxJ4La3WVVn4sJXKRchni9jYgr1G25yebFJqSktjBxgyPO31v9ZODBxR6vOaujQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="qf0YFfd/";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ADC606A31A
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5ADC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qf0YFfd/
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2859848eec.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848139; x=1793452939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAXqz+LVlVqjIkmBV7Lv8XcpK0kQZYM39dSFRxYLqs8=;
        b=qf0YFfd/aVexVXHdK33AabYX89RHUYPII7aL4NyuGuAhYMWB0sRIiSwXF9bY4BoKN1
         pipghsENtL2IzlwvUat9vghwq6z0xiObjzng3R9rDrab1eKYK7latT2yZR8QPOViz3qj
         sTfAqZ4zb5jqESfq/grCQz/2ZBeaE0/j4c6VXJmWyDCfNA5M5uf5kdxKOIYaBkla1EnA
         c6Cdj+7Pd9qyecjDdl7sl6nQvj5N+s6krLQ10XunTjpTG3R8I2RpvGazAZkS+Om2vWpq
         zOqSUPzUmq2MVk5XPP2o0/ZqiIPwe5bcePmklrVKeQsm0jFEYHVjBngiDWeFWyPnafio
         pKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848139; x=1793452939;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAXqz+LVlVqjIkmBV7Lv8XcpK0kQZYM39dSFRxYLqs8=;
        b=JzTNWQvl4/7ckQ14VNtmCnCd6A3ytpDPZd3cK5xP+3qc5ksWWs4GRK4S1DVz14Nfmh
         ntptspw0la6KtA9BaEhw7Q7Zuj12TqUKXM/X3+2kNSj+gbRewI8ZQFsEnfWSNjtEhowY
         CG31Y73GenLJ4fnpkroWXmt2FUbTnAzU5wYkhfCGu28IUnkBHDJGzn5bNErJwYwZjVPZ
         NWsWDj3KCqowke+Kojqv+ODyzTDwuRP8QGSc9rS6F/T2SENA83rZNoeqlQXezEx1K/WS
         GHfnifX3jxW1fRMQ9TJnfgpKrcvFmUuV09a2VVtqKqdXtTNYj1lp7bvuBdFqwGB9YLIF
         ywGA==
X-Forwarded-Encrypted: i=1; AKwUvBwAlJlv9LlCXsamtDkDZC6avLPOnf0t/Zgb7USb9YjbKHXJyUoS+SZ424XQ9aqvfsrTRe5xLsatI9I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB/UIgUMShEbHgMMM4Oxz0HXKsuyG45DLDJtykP6tY1bltmuAz
	rREArPfUCQgeOpOwefr6yMzQYeNAgyp5LeFWnNUtsqWHWgHAxBJFQgSbNKkjMR21
X-Gm-Gg: AYBFou2Kgb+Hx0IuLFSPQMspKUoiGJMrMU2j0uUjQvZe6Nlvteb2jftBA2goh/t+KvC
	fV/yEPyzL5e2NXGJp7n9tMiLup3MDYhuTNhjIfkE/PhvV6l6rvD3VsHIVHQEYUA0/ugQIfv7+rn
	j02kZrKvA9DGK4F4exoZNJEdIrcb8L8Ezd++PmheS0pgcoLZHKzxXANArD6OJfN/RKVkL0KPkdo
	VObsIk8QfB/u571Tdu3rNIo7LW28n2n/6MWzN+9nfW6kRQc7ENr+pJkttf+Vetp5JOARIToTpqZ
	Pd4afhapcxnfPXx9D3Nu1gi78OlA0QgqGxvi6gB1ABET79l33lqEvuO1VZs7/AyFRj+ER/dvr3W
	1WTtRpK+zvC00izZwZKmR6Pvfpyc8wqSayOMIUGlCJ1qZzYNIl4kEtOmQ9iOQhOErcNYVNvJsxZ
	2ef40z+XelVoKlaceaJY/W5b4vmxK/lGL6YA3fEzrjqQvxeqPL7YdCqFe2ODgvWuy7OmB1fQ20x
	YJlRg4MKnBPk4hanJNIit+vt/O6uyUbWDF0OdhNmbsSTbtZ4VZX3etU1J7WNU24c11QVJ1htKlC
	dJv+abVRlKGf6i4MdoMRsrtBqYh1YI4pHjhZ43H+e+K1r/JSrBMuUBa45BXx1OSIEQa2Q6NQ5Im
	/8PKmPZ2K
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr1210943eec.11.1792848138426;
        Sat, 24 Oct 2026 06:22:18 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:18 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 08/11] docs/translations/pt_BR: process: 2.Process.rst: fix translation errors
Date: Sat, 24 Oct 2026 10:21:55 -0300
Message-ID: <20261024132158.39493-9-danielmaraboo@gmail.com>
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

Fix errors against the English text:

- the merge window paragraph added content that is not in the original
  ("all code", "mandatorily", "frantic", bold text) and dropped
  "relatively", "sufficiently stable" and "for a new development cycle";
  its nested bold/italic markup also rendered with visible asterisks;
- "hopefully" was translated as "fortunately";
- "eventually" was translated with the false friend "eventualmente"
  three times;
- "a common place to go wrong" was translated as a cliché;
- "will not even compile" and "if it is to remain useful" had their
  meaning changed, and "should really" was weakened to "ideally";
- the sentence about asking Linus to pull was garbled;
- restore "(described below)" and "inline", and use the plural in the
  "Next trees" title.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/2.Process.rst  | 46 ++++++++++---------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/2.Process.rst b/Documentation/translations/pt_BR/process/2.Process.rst
index a0b6decfa..1e0e7dd6e 100644
--- a/Documentation/translations/pt_BR/process/2.Process.rst
+++ b/Documentation/translations/pt_BR/process/2.Process.rst
@@ -34,14 +34,14 @@ juntamente com suas datas, podem ser encontrados na `Wikipedia
        incrementado apenas se x for considerado grande o suficiente
        (por exemplo, o Linux 5.0 foi lançado após o Linux 4.20).
 
-O processo de integração (*merging*) de patches segue um fluxo simples a
-cada lançamento. No início de cada ciclo de desenvolvimento, abre-se a
-**"janela de integração" (*merge window*)**. Durante esse período, todo
-código considerado estável e aprovado pela comunidade é unificado ao
-kernel principal (*mainline*). A maior parte das novidades  e todas as
-grandes mudanças estruturais — entra obrigatoriamente nessa fase, em um
-ritmo frenético que chega a **1.000 patches (ou conjuntos de alterações)
-por dia**.
+O processo de integração (*merging*) de patches segue um fluxo relativamente
+simples a cada lançamento. No início de cada ciclo de desenvolvimento, abre-se
+a "janela de integração" (*merge window*). Durante esse período, o código
+considerado suficientemente estável (e aprovado pela comunidade de
+desenvolvimento) é integrado ao kernel principal (*mainline*). A maior parte
+das mudanças de um novo ciclo de desenvolvimento (e todas as grandes
+mudanças) entra nessa fase, em um ritmo que se aproxima de 1.000 mudanças
+("patches" ou "conjuntos de alterações") por dia.
 
 (Como observação secundária, vale destacar que as mudanças integradas durante
 a janela de integração não surgem do nada; elas foram coletadas, testadas e
@@ -104,7 +104,7 @@ projeto deste tamanho. Chega um ponto em que adiar o lançamento final apenas
 torna o problema pior; o volume de mudanças esperando pela próxima janela de
 integração crescerá ainda mais, criando ainda mais regressões no ciclo
 seguinte. Portanto, a maioria dos kernels é lançada com um pequeno número de
-regressões conhecidas, embora, felizmente, nenhuma delas seja grave.
+regressões conhecidas, embora, com sorte, nenhuma delas seja grave.
 
 Assim que um lançamento estável é feito, sua manutenção contínua é passada
 para a "equipe estável" (*stable team*), atualmente composta por Greg
@@ -178,7 +178,8 @@ As etapas pelas quais um patch passa são, geralmente:
    pronto para inclusão no mainline, ele deve ser aceito por um mantenedor de
    subsistema relevante — embora essa aceitação não seja uma garantia de que
    o patch chegará até o kernel principal. O patch aparecerá na árvore de
-   subsistema do mantenedor e nas árvores -next. Quando o processo funciona,
+   subsistema do mantenedor e nas árvores -next (descritas abaixo). Quando o
+   processo funciona,
    esta etapa leva a uma revisão mais ampla do patch e à descoberta de
    quaisquer problemas resultantes da integração deste patch com o trabalho
    que está sendo feito por outros.
@@ -193,7 +194,7 @@ As etapas pelas quais um patch passa são, geralmente:
    atual (garantindo que ele seja aplicado de forma limpa) e continuar
    enviando-o para revisão e integração.
 
- - Integração no mainline. Eventualmente, um
+ - Integração no mainline. Por fim, um
    patch bem-sucedido será integrado ao repositório principal (*mainline*)
    gerenciado por Linus Torvalds. Mais comentários e/ou problemas podem surgir
    neste momento; é importante que o desenvolvedor seja responsivo a eles e
@@ -209,7 +210,7 @@ As etapas pelas quais um patch passa são, geralmente:
    desenvolvimento. Integrar o código elimina parte do fardo de manutenção,
    já que outros corrigirão problemas causados por mudanças de API. No entanto,
    o desenvolvedor original deve continuar assumindo a responsabilidade pelo
-   código se ele quiser que este permaneça útil no longo prazo.
+   código para que ele permaneça útil no longo prazo.
 
 Um dos maiores erros cometidos por desenvolvedores do kernel (ou por seus
 empregadores) é tentar reduzir todo o processo a uma única etapa de
@@ -246,8 +247,9 @@ autoria e outros metadados. A qualquer momento, o mantenedor pode identificar
 quais patches em seu repositório não são encontrados no mainline.
 
 Quando a janela de integração se abre, os mantenedores de
-alto nível pedirão a Linus para realizar o pull de seus repositórios os patches
-que selecionaram para integração. Se Linus concordar, o fluxo de patches
+alto nível pedirão a Linus para realizar o "pull", a partir de seus
+repositórios, dos patches que selecionaram para integração. Se Linus
+concordar, o fluxo de patches
 subirá para o seu repositório, tornando-se parte do kernel principal. A
 quantidade de atenção que Linus dedica a patches específicos
 recebidos em uma operação de pull varia. Está claro que, às vezes, ele os
@@ -268,7 +270,7 @@ encontrar o mantenedor correto. Enviar patches diretamente para Linus
 normalmente não é o caminho certo a seguir.
 
 
-Árvore -next
+Árvores -next
 -------------
 
 A cadeia de árvores de subsistemas orienta o fluxo de patches para o kernel,
@@ -297,7 +299,7 @@ para a qual não existe uma árvore de subsistema designada. Como resultado, a
 -mm opera como uma espécie de árvore de subsistema de "último recurso"; se
 não houver outro caminho óbvio para um patch entrar no mainline, é provável
 que ele acabe na -mm. Patches diversos que se acumulam na
--mm eventualmente serão encaminhados para uma árvore de subsistema adequada
+-mm por fim serão encaminhados para uma árvore de subsistema adequada
 ou enviados diretamente para Linus. Em um ciclo de desenvolvimento típico,
 aproximadamente 5% a 10% do total de patches que entram no mainline chegam
 lá por meio da -mm.
@@ -308,7 +310,7 @@ em:
 	https://www.ozlabs.org/~akpm/mmotm/
 
 O uso da árvore MMOTM, no entanto, provavelmente será uma experiência
-frustrante; existe uma chance real de que ela sequer compile.
+frustrante; existe uma chance real de que ela nem sequer compile.
 
 A árvore primária para a integração de patches do próximo ciclo é a
 linux-next, mantida por Mark Brown. A árvore linux-next é, por design, um
@@ -321,7 +323,7 @@ quando são montadas; elas podem ser baixadas em:
 
 A linux-next tornou-se uma parte integrante do processo de desenvolvimento
 do kernel; todos os patches integrados durante uma determinada janela de
-integração devem, idealmente, ter encontrado seu caminho para a linux-next algum
+integração devem realmente ter encontrado seu caminho para a linux-next algum
 tempo antes da abertura da janela de integração.
 
 
@@ -349,7 +351,7 @@ O staging pode ser uma maneira relativamente fácil de colocar novos drivers
 no mainline onde, com sorte, eles chamarão a atenção de outros desenvolvedores
 e melhorarão rapidamente. No entanto, a entrada no staging não é o fim da
 história; o código no staging que não apresentar progresso regular será,
-eventualmente, removido. Os distribuidores também tendem a ser relativamente
+com o tempo, removido. Os distribuidores também tendem a ser relativamente
 relutantes em habilitar drivers do staging. Portanto, o staging é, na melhor
 das hipóteses, uma parada no caminho para se tornar um driver mainline adequado.
 
@@ -454,7 +456,7 @@ Existem algumas dicas que podem ajudar na sobrevivência na lista linux-kernel:
   perguntas. Alguns desenvolvedores podem ficar impacientes com pessoas que
   claramente não fizeram sua lição de casa.
 
-- Use respostas intercaladas, o que torna sua resposta mais fácil
+- Use respostas intercaladas ("inline"), o que torna sua resposta mais fácil
   de ler. (ou seja, evite o "top-posting" — a prática de colocar sua resposta
   acima do texto citado ao qual você está respondendo). Para mais detalhes, veja
   :ref:`Documentation/process/submitting-patches.rst <pt_BR_interleaved_replies>`.
@@ -463,8 +465,8 @@ Existem algumas dicas que podem ajudar na sobrevivência na lista linux-kernel:
   ponto de encontro geral, mas não é o melhor lugar para encontrar desenvolvedores
   de todos os subsistemas.
 
-O último ponto, encontrar a lista de discussão correta, é um lugar comum
-onde os desenvolvedores iniciantes costumam errar. Alguém que faça uma pergunta
+O último ponto, encontrar a lista de discussão correta, é onde os
+desenvolvedores iniciantes costumam errar. Alguém que faça uma pergunta
 relacionada a redes na lista linux-kernel quase certamente receberá uma
 sugestão educada para perguntar na lista netdev em seu lugar, já que essa é a
 lista frequentada pela maioria dos desenvolvedores de redes. Existem outras
-- 
2.47.3


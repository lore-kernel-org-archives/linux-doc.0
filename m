Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16FA23393E
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 02:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789524301; cv=none; b=T8ejVCoGYjuTUrfPxioXUy2vz9dymIZ1/28laDVg1kW0UaiaPJxj7Pfmw4CooTIbsQIQlNH5AGP31GNSndvX4H/86/q7FfBqMFKYaXFK/32BPJXFEF100sPtk1+6GFPs6wPnVmOoaQ3JpQwrz89lCD7OX/50/1HGrpCS3iKpsAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789524301; c=relaxed/simple;
	bh=hKvJ3uZ4Y5+pLwSM/dL05OZ2SqiUT4YYz3BWKGgJMUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=njzoRErPjLKN71zxWpHTznhlhJhkF10sgrNr5vtpFucABpYROZgSVgLNkW+hL2IsNCyoZC7h2NMoLp/RTIC1W7Meh/9hGVjmAv4EpzRcPCUaQKNvGndYFopaTDoN63Hx6eBzFZNM1crFVv8f4AKQfrx4DuXMVBD7fAM/2GoSquQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0yCB+F6; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0yCB+F6"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7dcso147623137.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 19:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789524288; x=1790129088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8tHdM1R8QWrfrycXdnSxkZx2URIKhlqCiEDWfYHPL0=;
        b=X0yCB+F6i3IqZRH4oyMkkTdsIIj/r5LcO0hwtF3rQsX9Rp2vJxFbG9hLF0OeruvQs5
         NmWeefGPH1xpVTfwZrT0EfsF44mR9VN2mxY4CY+i1EFplFXkWVU5f5dM0zqTQsoQZxYx
         aS3ZDI1RX47AbIBZIbCuYW8NX9AqV57zGTof+pP1v6bCxR13UgpkjMixYHT453Vhsv7d
         xaVr6y2obs3mj94gmfdJk2RTLk5JTBSveKAFQNgB5M2ECyEpqSYPXKGU5Zu5cB6lGq4j
         ATs9iqiyknc9uE3WwL23Z4w7AfT0elm9WJhdBnEH3/d4TwmA0gPNW/mVsAx8Uhvi/Cnq
         XAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789524288; x=1790129088;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g8tHdM1R8QWrfrycXdnSxkZx2URIKhlqCiEDWfYHPL0=;
        b=Fg853xmDiN9zHy1KaZL9nap8Yo8mopz0tbvroolunJfkjCCoA9wmw+ZaL04TXYBdyX
         OS9j46dCSO6xaFHgtHCWlgoXBRHRFlEBor0o4I+7dF2xh0zTgPnS+zB1TV4GX9ATWlno
         vBgRjyX8r+MEgmA/L3iXpoIxLaotEhptmKYtiJFAs9CdlOd2g/RMbNrx1H1w+bWHGjB4
         tdzG+K37TtBTj6tPNemDmec3I/C/TrbzpTZ480zf+UZPj2b35aI801eU4re0SKiHm7We
         DFVFFkzO9Hll2PzGFu6r4pV97EwjJxmUTaLEqpQYjj24VGxdBaQjl1e8xOgEtR5AzeHN
         MLMQ==
X-Forwarded-Encrypted: i=1; AKwUvByHRRenkdwAM5lpyy6CnYvXT7oVSsq0T7cnxFGmCcZL5wV5l4NKHOXlO6KJe3CSThstKHOyWHq2Ib8=@vger.kernel.org
X-Gm-Message-State: AFuF++mYnGtMWd2eM85aHC1Z5ZQZ64lrgXROrmNRtf5pgZogCWSzTAlU
	9fdwhVIfHUv1aZrjj8uabO7lu793zyf8XCPtpfNOLocG6II0Nyuue0Tq
X-Gm-Gg: AYBFou39whYU2azgtBd5lZ2rI8Vma8QcwX0cni5pqzTthzEuiULVZA+9EpJVeWo6HC3
	aBa/Rl035BJD8ecgKMeJMm2gMMtk5oRDwDOaDIwhIt6Ah3C3TWTh2Kz4fOXuVMW/pkYsyunpc6i
	AmLN3izfq9jcVN367M6QoOmWTWxvka01/Pj1BZNPFOMTGYTK+QejL0BI4blTjW5dklw4YXY1J4T
	ENrg3SNwfesWzYpmSI4QyO550PX3Hao0QTbn7vceKTGaT4gjiRJGaFaR+s71RypeB6z5P2aihcb
	1uHlLOhjYJ3jlRJn8J+CexWuQThp9Vd5NDtCxSo5PVZEGPQfduUYNrl7ppxsLbzaGB2yN9qWGP+
	TRBcMktbwoekGaHFB7tH5/dV8QZN4iUZXVaIwC7lrZqcSE0MDPsAe5uTjd0y1a0Ph2gvX0xahcS
	JSj5wUgZInxGmKU0o1AUFpwkN4rFnoJTWywfqQ07hl/gWt3+Z8hQrx/MHXIos5MGdR9hta7iYzs
	dOqBWJG94Ck
X-Received: by 2002:a05:6102:5812:b0:79e:3401:403a with SMTP id ada2fe7eead31-7a028791ee0mr1180582137.8.1789524287652;
        Tue, 15 Sep 2026 19:04:47 -0700 (PDT)
Received: from cachyos ([2804:7f0:9f80:834e:ff40:6e50:a18b:5455])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79facab39basm1631051137.2.2026.09.15.19.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:04:47 -0700 (PDT)
From: Ygor Otavio <ygorotavio.sjc@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ygor Otavio <ygorotavio.sjc@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate generated-content.rst
Date: Tue, 15 Sep 2026 23:03:33 -0300
Message-ID: <20260916020335.17034-1-ygorotavio.sjc@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate genetated-content.rst into Brazilian Portuguese,
maintaining consistency with original formatting rules.
And add it to the pt_BR process documentation index.

Assisted-by: Claude:Sonnet-5

Signed-off-by: Ygor Otavio <ygorotavio.sjc@gmail.com>

---
---
 .../pt_BR/process/generated-content.rst       | 117 ++++++++++++++++++
 .../translations/pt_BR/process/index.rst      |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/generated-content.rst

diff --git a/Documentation/translations/pt_BR/process/generated-content.rst b/Documentation/translations/pt_BR/process/generated-content.rst
new file mode 100644
index 000000000000..1c66dd9c13a5
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/generated-content.rst
@@ -0,0 +1,117 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================================
+Diretrizes do Kernel para Conteúdo Gerado por Ferramentas
+=========================================================
+
+Propósito
+=========
+
+Os contribuidores do kernel vêm usando ferramentas para gerar contribuições há
+muito tempo. Essas ferramentas podem aumentar o volume de contribuições. Ao mesmo
+tempo, o tempo disponível de revisores e mantenedores é um recurso escasso.
+Entender quais partes de uma contribuição vêm de humanos e quais vêm de ferramentas
+ajuda a preservar esses recursos e manter o desenvolvimento do kernel saudável.
+
+O objetivo aqui é esclarecer as expectativas da comunidade em relação a ferramentas.
+Isso permite que todos se tornem mais produtivos, mantendo ao mesmo tempo um alto
+grau de confiança entre submetedores e revisores.
+
+Fora do Escopo
+===============
+
+Estas diretrizes não se aplicam a ferramentas que fazem ajustes triviais em
+conteúdo preexistente. Também não dizem respeito a ferramentas que ajudam em
+tarefas menores. Alguns exemplos:
+
+ - Correções de ortografia e gramática, como reformular para o modo imperativo
+ - Auxílios de digitação como completar identificadores, boilerplate
+   ou completar padrões triviais
+ - Transformações puramente mecânicas, como renomear variáveis
+ - Reformatação, como executar o Lindent, ``clang-format`` ou ``rust-fmt``
+
+Mesmo quando o uso da sua ferramenta estiver fora do escopo, você
+ainda deve sempre considerar se informar ao revisor qual ferramenta
+você usou ajudaria na revisão da sua contribuição.
+
+No Escopo
+==========
+
+Estas diretrizes se aplicam quando uma quantidade significativa de conteúdo em
+uma contribuição do kernel não foi escrita por uma pessoa presente na cadeia de
+Signed-off-by, mas sim criada por uma ferramenta.
+
+A detecção de um problema e o teste da correção para ele também fazem parte do
+processo de desenvolvimento; se uma ferramenta foi usada para encontrar um problema
+tratado por uma alteração, isso deve ser mencionado no changelog. Isso não apenas
+dá o devido crédito, como também ajuda outros desenvolvedores a descobrir essas
+ferramentas.
+
+Alguns exemplos:
+ - Qualquer correção sugerida por ferramenta, como ``checkpatch.pl --fix``
+ - Scripts do Coccinelle
+ - Um chatbot gerou uma nova função no seu patch para ordenar entradas de lista.
+ - Um arquivo .c do patch foi originalmente gerado por um assistente de codificação,
+   mas foi limpo manualmente.
+ - O changelog foi gerado entregando o patch a uma ferramenta de IA generativa e
+   pedindo que ela escrevesse o changelog.
+ - O changelog foi traduzido de outro idioma.
+
+Em caso de dúvida, escolha a transparência e presuma que estas diretrizes se
+aplicam à sua contribuição.
+
+Diretrizes
+==========
+
+Primeiro, leia o Developer's Certificate of Origin:
+Documentation/process/submitting-patches.rst. Suas regras são simples e estão em
+vigor há muito tempo. Elas já cobriram diversas contribuições geradas por ferramentas.
+Certifique-se de que você entende toda a sua submissão e está preparado para
+responder aos comentários de revisão.
+
+Segundo, ao fazer uma contribuição, seja transparente sobre a origem
+do conteúdo em cover letters e changelogs. Você pode ser mais
+transparente adicionando informações como:
+
+ - Quais ferramentas foram usadas?
+ - A entrada fornecida às ferramentas que você usou, como o script de origem do
+   Coccinelle.
+ - Se o código foi majoritariamente gerado a partir de um único prompt ou um
+   pequeno conjunto de prompts, inclua esses prompts. Para sessões mais longas,
+   inclua um resumo dos prompts e da natureza da assistência resultante.
+ - Quais partes do conteúdo foram afetadas por essa ferramenta?
+ - Como a submissão foi testada e quais ferramentas foram usadas para testar a
+   correção?
+
+Como em todas as contribuições, cada mantenedor tem a discricionariedade de escolher
+como lidar com a contribuição. Por exemplo, eles podem:
+
+ - Tratá-la como qualquer outra contribuição.
+ - Rejeitá-la de imediato.
+ - Tratar a contribuição de forma especial, por exemplo, pedindo testes extras,
+   revisando com escrutínio adicional, ou revisando com prioridade menor do que
+   conteúdo gerado por humanos.
+ - Pedir algum outro passo especial, como solicitar que o contribuidor detalhe
+   como a ferramenta ou o modelo foi treinado.
+ - Pedir ao submetedor que explique em mais detalhes sobre a contribuição, para
+   que o mantenedor possa se assegurar de que o submetedor entende completamente
+   como o código funciona.
+ - Sugerir um prompt melhor em vez de sugerir alterações específicas de código.
+
+Se as ferramentas permitirem que você gere uma contribuição automaticamente,
+espere escrutínio adicional proporcional a quanto dela foi gerado.
+
+Como com a saída de qualquer ferramenta, o resultado pode estar incorreto ou
+inadequado. Espera-se que você entenda e seja capaz de defender tudo o que submeter.
+Se você não for capaz de fazer isso, então não submeta as alterações resultantes.
+
+Se você o fizer mesmo assim, os mantenedores têm o direito de rejeitar sua série
+sem revisão detalhada.
+
+Referências
+============
+
+Para diretrizes específicas sobre assistentes de codificação de IA, veja:
+
+
+* Documentation/process/coding-assistants.rst
diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5166..cced028e12c9 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -59,6 +59,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
    Estilo de gerenciamento do kernel Linux <management-style>
+   Diretrizes do Kernel para Conteúdo Gerado por Ferramentas <generated-content>
    Conclave (Continuidade do projeto) <conclave>
 
 Lidando com bugs
-- 
2.55.0


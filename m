Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795357878;
	b=hm7oH6qVUAfc9qzL6lRYWbHBg2+iX/ngZnTz49R6FtAh2TXJVELv70QJ8sIaiIt077eQ
	 x0xfCF8JLITpbDe6xQNUGGMt/kn39H1+mE7Sy9yOK5I1ORDU74NDqgkL9/bht49Uf+s+6
	 LlwfcUruXLpYGW5vlCMrKgk5Gezpcr92WP76DqjsNrWE/DrHcGXR6zKfUX6mYSbwFvonP
	 TiwMk5VeAYhLZVJpy4Q0YvpDLFVCWvBQYowAyywp7raVJ4DUFlGPyfW50FtuTJK/JG/Ir
	 7K6+D7p/YztgUz4/31NGd3tT6sIZvWa+nO10HEktaESaxltsemIqRN4MinLFnRF1F6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795357878;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wuZqBlFO9K/iqR50A1wZtKOuwbTHQywnPFzgxZqG8Z0=;
	b=SPkVaga1Cmlk/GWfU25Ofnqu9D14K18Z7liqqSZCHXtlRt5qLtCckduCoovcax9BkWKK
	 goXEwni7LIp9lGi/XNeM3kLzRSj6NL2WxDSLO8QAreyzGU/cqEdD9JRAitQukGAUKtyen
	 9BXzdCuHexKL7WK1yvYmfXuWeOFsx/7FDx5W2RyHsnUUAf2H1Et3WI2JnKafoo3OtEVA1
	 dv+pgntE26jrujmTum25f5f+v38UCMlJ3mJJhe70hjkTHUureflNblynyeG2EC8pEfLDe
	 Yy/nKXnPN4Ygu9Oe5XcBGR/Pr90yxx7YCOe4yVW5Bnh1AikvQzM0dP/LLDoyv0vTD7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fFL3TB57;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13356606A330
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 14:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fFL3TB57
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795357877;
	b=PH7sX86DVg8AD3UUJbGObdcvs9W632qPC0d4KDPcQZ1y3Ni4BfD9JtrO9srERSK/RKjf
	 f3Egz5LiSZ2DZTR/aUudEtR4Yqr0+fq7rZswR7bYxB0Ze/hHR/ltKIW6pv7jC0UuJXQ0d
	 gE0kP2Uz1VsjEZhmJLaAfleKI+FBZ6g2gcIVMTJ3+aEWoh6cNRy9I9mGYxiEnEhTVMA86
	 tTUGdQChHjo8HCvJ6b7i/qG9ZoRAYZajTFN+XwFnGY1WP5i80FhpRIh5QPnsByWYUl3g6
	 QAKg3dt5dcAprLIIxWRVleLYLENt4YNufebggYa7tW034iLWOcTyZnsGaawxywsZ6JA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795357877;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wuZqBlFO9K/iqR50A1wZtKOuwbTHQywnPFzgxZqG8Z0=;
	b=JNU93QJkv2JibbdINZxkVFC/dG/pCwTxRtn3eJi/3rq4DaM4CPZiO84ECrBdgiBfFKsw
	 IJa+dWBidtTlvaT8JLc6NgvVrfV7CPWrQgdz3TBOKK6R1OYf0h49jICM/QI+qEVIjSFgl
	 p+8OZQENAFnzXn6J3D44rnuT6Qg0dcN54ZzQzFQ9ahqZYMUeyFttQw4rDqQBCGazL5W/F
	 dq3vhGexmFiMT3NQKRWE/KKa1Lf/Oo30BNRY6lgn4vI/OHtqeRKXsYDkV91HH7Q1djHIu
	 J+50J3bl4USMx/kHZneiZr/ywk0/L+tMglgPYEGDfAz1Vld28B85TAGI4rCZsyDYjQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE3FB1F000C0;
	Sun, 22 Nov 2026 14:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795357877;
	bh=wuZqBlFO9K/iqR50A1wZtKOuwbTHQywnPFzgxZqG8Z0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=fFL3TB579YelhUMVTsFeLubs8HBQ0lRj88aPLCRztKGeDB5hc6TGpHPgUxWDCN0kp
	 sui45zdvJWiTOCkJ6Aemo4lX7azlXFneBP0Hvk0jGtbWttThjSy9zrCQV63pxT+WLS
	 nviAMn8/HihhgjlFnZ/vDL41ExZAhyG9dOZU6J5fQaNDkzkE8WMs72Xge/XlW/rfN9
	 9Hg40qSdzcedzONcyKo9v8omGBTpitTqU3icDPtKsQbY3OdKXT5OUSu4Fjbii3DnT1
	 IPTKtYyIz+mDL5qnx6I6dZ2kuPuGGT5QnGPmxWwNd9LC3d7xWqGmyx5du+54I5NaXD
	 DRtD8YopOWZQw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3DFCB4C0ED;
	Sun, 22 Nov 2026 14:31:12 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 11:31:12 -0300
Subject: [PATCH] docs/translations/pt_BR: process: add
 generated-content.rst
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
Message-Id: <20261122-generated-content-pt-br-v1-1-3462e22d7b5d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTtgQonRq4iLJv2t4yItk6kIp
 Xc36vJbvLdRhQoqXbqNFC+pMpcGd+goP4YygWVsJn/0wTnveUKBDoaR81wMxXgxTsoxh9CHdI7
 9KVKrF8Vd3r/z9fZ3XdMT2b472vcPjHhRNnsAAAA=
X-Change-ID: 20261122-generated-content-pt-br-8c6646b98478
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net, danielmaraboo@gmail.com, rdunlap@infradead.org, 
 skhan@linuxfoundation.org, Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795357871; l=7364;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=vo81soZDHoCodR9WtIkcpWbMvZKc7+lumNVuyAZ09og=;
 b=WrnSfPoOEHN111ZAFEao4EkLSobIKCWMqL2x780NR7Xw0WwX5AYpNHBx2YGLao9bYOMKFy3u4
 B1flBD2Vd5QCAJk6lWLrWyzC5JrqrgkDhjQxbywnIbKAGCTpPtKV3+q
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com
Content-Transfer-Encoding: 8bit

From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>

Add the Brazilian Portuguese translation of
Documentation/process/generated-content.rst, which describes the kernel
community expectations for contributions generated with tools, including
what to disclose in cover letters and changelogs.

The translation follows the English original as last committed and keeps
the four lists, the inline code spans naming the tools and the reference
to the Developer's Certificate of Origin.

Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
---
 .../pt_BR/process/generated-content.rst            | 122 +++++++++++++++++++++
 Documentation/translations/pt_BR/process/index.rst |   1 +
 2 files changed, 123 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/generated-content.rst b/Documentation/translations/pt_BR/process/generated-content.rst
new file mode 100644
index 000000000000..8ba3348c1692
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/generated-content.rst
@@ -0,0 +1,122 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================================
+Diretrizes do kernel para conteúdo gerado por ferramentas
+=========================================================
+
+Propósito
+=========
+
+Colaboradores do kernel usam ferramentas para gerar contribuições há muito
+tempo. Essas ferramentas podem aumentar o volume de contribuições. Ao mesmo
+tempo, o tempo disponível de revisores e mantenedores é um recurso escasso.
+Entender quais partes de uma contribuição vêm de humanos e quais vêm de
+ferramentas ajuda a preservar esses recursos e a manter o desenvolvimento
+do kernel saudável.
+
+O objetivo aqui é esclarecer as expectativas da comunidade em relação às
+ferramentas. Isso permite que todos se tornem mais produtivos e, ao mesmo
+tempo, mantenham altos níveis de confiança entre quem envia e quem revisa.
+
+Fora de escopo
+==============
+
+Estas diretrizes não se aplicam a ferramentas que fazem ajustes triviais em
+conteúdo preexistente. Nem dizem respeito a ferramentas que ajudam em
+tarefas rotineiras. Alguns exemplos:
+
+ - Correções de ortografia e gramática, como reescrever para o modo
+   imperativo
+ - Auxílios de digitação, como completar identificadores, boilerplate comum
+   ou padrões triviais
+ - Transformações puramente mecânicas, como renomear variáveis
+ - Reformatação, como rodar Lindent, ``clang-format`` ou ``rust-fmt``
+
+Mesmo quando o uso da ferramenta estiver fora de escopo, você ainda deve
+sempre considerar se o revisor saber qual ferramenta foi usada ajudaria na
+revisão da sua contribuição.
+
+Dentro do escopo
+================
+
+Estas diretrizes se aplicam quando uma quantidade significativa de conteúdo
+de uma contribuição ao kernel não foi escrita por uma pessoa na cadeia de
+Signed-off-by, mas foi criada por uma ferramenta.
+
+Detectar um problema e testar a correção para ele também faz parte do
+processo de desenvolvimento; se uma ferramenta foi usada para encontrar um
+problema tratado por uma mudança, isso deve ser anotado no changelog. Isso
+não apenas dá o crédito devido, como também ajuda outros desenvolvedores a
+conhecer essas ferramentas.
+
+Alguns exemplos:
+
+ - Qualquer correção sugerida por ferramenta, como ``checkpatch.pl --fix``
+ - Scripts Coccinelle
+ - Um chatbot gerou uma nova função no seu patch para ordenar entradas de
+   lista.
+ - Um arquivo .c do patch foi originalmente gerado por um assistente de
+   código, mas limpo à mão.
+ - O changelog foi gerado entregando o patch a uma ferramenta de IA
+   generativa e pedindo que ela escrevesse o changelog.
+ - O changelog foi traduzido de outro idioma.
+
+Em caso de dúvida, escolha a transparência e presuma que estas diretrizes
+se aplicam à sua contribuição.
+
+Diretrizes
+==========
+
+Primeiro, leia o Developer's Certificate of Origin:
+Documentation/process/submitting-patches.rst. As regras são simples e
+existem há muito tempo. Elas vêm cobrindo muitas contribuições geradas por
+ferramentas. Garanta que você entende toda a sua submissão e que está
+preparado para responder aos comentários de revisão.
+
+Segundo, ao fazer uma contribuição, seja transparente sobre a origem do
+conteúdo nas cover letters e nos changelogs. Você pode ser mais
+transparente incluindo informações como:
+
+ - Quais ferramentas foram usadas?
+ - A entrada fornecida às ferramentas usadas, como o script fonte do
+   Coccinelle.
+ - Se o código foi gerado em grande parte a partir de um único prompt ou de
+   um conjunto curto deles, inclua esses prompts. Para sessões mais longas,
+   inclua um resumo dos prompts e a natureza da assistência resultante.
+ - Quais partes do conteúdo foram afetadas por aquela ferramenta?
+ - Como a submissão foi testada e quais ferramentas foram usadas para
+   testar a correção?
+
+Como em todas as contribuições, cada mantenedor tem discricionariedade para
+escolher como lidar com a contribuição. Por exemplo, ele pode:
+
+ - Tratá-la como qualquer outra contribuição.
+ - Rejeitá-la de imediato.
+ - Tratar a contribuição de forma especial, por exemplo, pedindo testes
+   adicionais, revisando com escrutínio extra ou revisando com prioridade
+   menor do que o conteúdo gerado por humanos.
+ - Pedir outros passos especiais, como solicitar ao colaborador que
+   detalhe como a ferramenta ou o modelo foi treinado.
+ - Pedir a quem envia que explique a contribuição em mais detalhes, para
+   que o mantenedor tenha certeza de que a pessoa entende plenamente como o
+   código funciona.
+ - Sugerir um prompt melhor em vez de sugerir mudanças específicas no
+   código.
+
+Se as ferramentas permitirem gerar uma contribuição automaticamente, espere
+escrutínio adicional proporcional à quantidade gerada.
+
+Assim como ocorre com a saída de qualquer ferramenta, o resultado pode estar
+incorreto ou ser inadequado. Espera-se que você entenda e consiga defender
+tudo o que envia. Se não conseguir fazer isso, não envie as mudanças
+resultantes.
+
+Se enviar mesmo assim, os mantenedores têm o direito de rejeitar a sua
+série sem revisão detalhada.
+
+Referências
+===========
+
+Para diretrizes específicas sobre assistentes de código com IA, veja:
+
+* Documentation/process/coding-assistants.rst
diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index d072f7e46767..d2dd4bf02675 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -46,6 +46,7 @@ devem estar familiarizados.
    Adicionando uma nova chamada de Sistema <adding-syscalls>
    Por que a classe de tipo "volatile" não deve ser usada <volatile-considered-harmful>
    Como não Deixar as ioctls malfeitas <botching-up-ioctls>
+   Conteúdo gerado por ferramentas <generated-content>
 
 Guias de políticas e declarações de desenvolvedores
 ---------------------------------------------------

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261122-generated-content-pt-br-8c6646b98478

Best regards,
--  
Eduardo Pereira Cruz <dreduardocruz@gmail.com>



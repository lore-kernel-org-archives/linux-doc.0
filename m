Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B167E37A840
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 01:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853987; cv=none; b=R8vwSDr96BPKOq/7LgjGeh4ntveZQcEaq2dY/xd3eoIz3OB0oAOi59hv69OGCTlAvDX/mxi7AdkoxSuPlL4ONeYBRvMOyaYVZhPeXZdkoFbvsNUfiI4/oYr3o4NiKfsV7McKzzuYtEI2ZdmXQRiaVTL5oDN4HfBko3nqCzBTLo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853987; c=relaxed/simple;
	bh=Wb9IloYHyj3Y7vOA0dxPQDsPBQ6p0fy0/wWyJxmd2LU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U0Q33hrpJF/K32BE2FPedX4KuVPSXVSaN0v22bhxH6qKx0KIncYwf34DXw0QYvz7ly5SBx9Q3xGTI2KzOMtTpQifmREbEhp0f39S+U1pU9fIU3BDPkhrXvSyRSb5bT05dH4JrI5ZcsNd/P7lV5wSA0hJBrLJC7vO8s8tdSqiFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRLHO7KW; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRLHO7KW"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30b6dad2382so5698431eec.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 18:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791853985; x=1792458785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZsCL9NCNCGhtLCeYnjn/IHwp0PKXAfcikldb75bYeI=;
        b=oRLHO7KW6ndIAa/qveL0jNtJws48pBFpg6jnCdWheIDt8ozaqZyksvRlNYf8W+RUKY
         e9Oiy5qj01mH5zvTcIFTMq8yD08y7uxMOWGHkqi2g48gHcHezWWoqo2RPrQc1KuNQsdA
         RGvpjANwqvHgZ8BP4WQd6Fep2qjS3ppm/jJe4IH3JQvbWPlL8QsxNdAuUIPbpOE63Wpi
         Ib6TRFZ+M+KGRQsZwQw4xO0hq2O+gqIHSxRSS207hHbXucF7sbU1g7/BeNNAlcOVYdbB
         V8d2Oq2oO1dxVsE4dG4DBzI6WWEjOiQzweYRZzP1P3yAqZh50T1T23eKIPaLBHmlnhTJ
         SXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853985; x=1792458785;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ZsCL9NCNCGhtLCeYnjn/IHwp0PKXAfcikldb75bYeI=;
        b=pE/Zla4ylsBjQAhZ81m1JlhgPZ+C/k//Dvt/KL+Y4qolK0GLVitJ7DvFbc6IZD7jqD
         hCv+WxrRvfz9iuwlEHAY5thfRW/DWW8O20Uwv9Ukdbv60k7LgrfVUO4KvqgjdUoLKkDl
         JSFZ/PZD3iIUrQYQ1vEb9ffBz5rJTbaplfS9i/0zmwC5TynEm9rUjBy69GP/nDjfhAWO
         DZiGujV/JW6sVM+xXR8fmZ00wxL2iCh/MMHctLznxltQQnax5x459Z/4wyZcxj5fQvGz
         r1Ct5nN1Rok0uia/jnrhlAKI50HOpW3VowA1pt91RAWMnq2pe88GbTtvtvTq9qYsTuUV
         OhVw==
X-Forwarded-Encrypted: i=1; AKwUvBwCvOtQJd334LYpgwOv39RPSPI32fdmrxpsXheSV7cqcmN7ORhx4lzm+5tYSZitKzrhipo/BgTF/Cs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXHpOAPysACLAInQJbpVhayrHKwv7JgE/m/xH6rZQbnMOqfNDm
	xvTWaMZp3kGNwEJWJWc2GarkpXEFUFUIWB41ezZKvNRtQ4uYk4Ffc3sJ
X-Gm-Gg: AYBFou1CYFdsT3AYNP39ilgruozh3Kr1cdlCRWSI+LK1hSItCC6d2yqH6/2DSBQqTYH
	FUmjNUjj/KSmav810WkOQEmx6A56Lb4Z10OknmzLFQ6YZOxZEfwLYTYK15y2J8jiJpBvegQsxKH
	smLBGIK1dwQISQH/C4DODCQmcErN1MjiqZFRF+1+T0BptJ69NrIcqTN0+YdbmsJBkJm/pLlTIbb
	KaENFBJQ5h55t1YGI39AVGses4FVhaRwMJUfst7ItfEIAM7/3JlwKb8Oci0FA5GensyorTsBQBH
	8RUA3fd7vrO5+UdpPjQYUV13MlbInLSMU2bUiborUMnxhMiZ58yku+VmSCrldIKYCZbP8fFFqxe
	ulmPt907D7ATslFzfY6KX34UFmSsm2KoDausNYSg6aakPvbe9FZa5wiq8rdHIdMB7iy89sONRJu
	IY/7arZPzmn0wy8yShavz3HLFC6J/9N1HkL9TMdxdyhib7Pywd4HJTBGbn3zZMUv8ggmI5WZ0=
X-Received: by 2002:a05:7301:faf:b0:35a:6baa:9c9b with SMTP id 5a478bee46e88-35a6baaa286mr6581925eec.35.1791853984527;
        Mon, 12 Oct 2026 18:13:04 -0700 (PDT)
Received: from cachyos ([2804:7f0:9f81:4c10:ebb9:5cd0:df8:562c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35a352d4b05sm18202768eec.19.2026.10.12.18.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:13:04 -0700 (PDT)
From: Ygor Otavio <ygorotavio.sjc@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ygor Otavio <ygorotavio.sjc@gmail.com>
Subject: [PATCH v2] docs: translations: pt_BR: translate generated-content.rst
Date: Mon, 12 Oct 2026 22:12:45 -0300
Message-ID: <20261013011245.4779-1-ygorotavio.sjc@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate generated-content.rst into Brazilian Portuguese,
maintaining consistency with original formatting rules.
Add it to the pt_BR process documentation index.
And fixed the errors in the commit.

Assisted-by:LLM

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


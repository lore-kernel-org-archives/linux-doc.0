Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BBB21D596
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 01:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783302742; cv=none; b=eae6lldCshhnI1Ygrp+tDExT81kkZS1BG7+22vjj+lbU5B2CpG8hERXNTmHDQ3lvKCzn6q3SvirXLokXL8f+gKECf+rpizGmzWEKTyv/VnvPREFnE9ReoVcLRrTmgRwX0AQp2QzihLcJsahyMhwumYj6GR/2RCaPVUnDZgrdRCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783302742; c=relaxed/simple;
	bh=BAbyzESDjUAhrUpk6vdGC4rLsogrCkJf9sMgdtAR/NI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WTv56gXhEYSqO7cZU9EP4GBt80W1lrPr1LJaK6aR/P3OQfOS7rtG/3QIUKzzBm/iMkZ7npwG1jk2IkktDFrxROXB/+fszJQoOzxUk81uChnT/reiX2HyrfQdgFzWdxUS3uBdT+fvvWpp10Pg9IpVWrU9FNNtaKf5vHj8pyGbMsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuhgUro8; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuhgUro8"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84794e800f4so1259627b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 18:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783302740; x=1783907540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzsxPNuwGbvzDDrmpsRIwxt5Qc7PbGUXYGb3SVJUHKg=;
        b=QuhgUro8sB4+9OF0bGdOOVSF6UtMft3WIwCUh2nZL7rKYixd1LYT6QtLa4j/iR/6ha
         V8KQWHdcD4wDqEYB4wrIrotXwcEvj6zYdEofKzVL4Q70vJcHSvqGSaM1gCHu5rfG0TUR
         /MMx9pQzNBBlNy6ge1lekBQeZvcmcxa42UCFpSDoPcNbBVauQ8HbZVAqUHqdYmEQWq0N
         k2DZkGcS7s3NG/XPhYUDgefJCw3RB1bUsq9CDFrEA0rdG4fc3joJx61/ln3hQ6Tdckyu
         xk4b7iM9C/d79J0aGM+6GxofVEPluvHiye2pyJ5NXFEiM3Pgf9zVkukI7B3/sc3TMN2d
         us+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783302740; x=1783907540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzsxPNuwGbvzDDrmpsRIwxt5Qc7PbGUXYGb3SVJUHKg=;
        b=Ead9DB1U9NAdniyaor3esYg7iKo69xZWYsFbGn35ydwIJ3p/K0S2+bueFhtZJz52aK
         Qp0D0a0jXI07HpqAbbkD1mwLW7YVHynln0+ol6o1JGDxlEXVbLntfxHUmPfdZE2E4ZAg
         neT+yBGSBks4jsHd4V0vRqIkI8br4xt3MRHX1pXRuIxak/e9AX6DyZTjze3Tuo7qU6ah
         OUh9wWkSxdyNbv6nOgQ68kEbi88S9kWX2tZy6LaOlrYW9XgdGeZh7VYl2736JVAfsBQ9
         KfegOkuKH0jQdIzWJBp2/6K/DfrCTJTHOimRsL0gA04CM+yRLDTEoQ5rJf89P82EMjP0
         RHfg==
X-Gm-Message-State: AOJu0Yz+EByfv6RmpyDNzwvP2mR6fEVFv/evYV1kvWGCRLSbT3NAjAGE
	flZxufrM0cO/K+1aV6zsHlfbyceM1UJxB8DO1eb+kk9Plle/CG/ccwdq
X-Gm-Gg: AfdE7cmWBmMDtonB0SSUMXXdU9kJzlKoYE9IkpuJ7SGD/gE90sfkiiASY9pF/laywde
	NbCVt6k0RUi8Crz0AoU58JBbC7LhKNGNeyh5YwrIzFWWY0AwkRvot2OTEPe/TR3bAO08VZXOyVQ
	NBR9HbnuNusH8M932Ilg9sEZoqpyALlZqPxvdkoURJUW2hBOQjNdkQlRvax9Vph7dBV9A7Hc4fi
	QyDkwtt8ARbgeX3m89OosGobVaP3rjmYyjCVnPAejWo0274IHrLxjC6nAcaSvbfgZJq1+c09t7O
	guC7jOK9NB2ZyhTq7pE42BGviVzzgPj2+MlSJbJHjgDCFEg5c3fN3+dlLCmmkkWCj11ZpcfbG7H
	P921nI65n0e+EN+LAQQ7T4/8XPq6GP+YodbcFbAfu+Lmgm1afRAjQW7sEC9Lq2qsPJOyj0mK/a0
	E6rq0jVi3kuBUkptYZNVOibxuTXA==
X-Received: by 2002:a05:6a21:6e48:b0:3bf:6c07:b2f6 with SMTP id adf61e73a8af0-3c03e5b3d89mr8109661637.57.1783302740228;
        Sun, 05 Jul 2026 18:52:20 -0700 (PDT)
Received: from x-wing ([2804:7f0:7c80:129d:1836:8d17:62af:2ff4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7bb8fasm45375806eec.1.2026.07.05.18.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 18:52:19 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org,
	Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: [PATCH] docs: pt_BR: process: Translate CVE documentation
Date: Sun,  5 Jul 2026 22:52:13 -0300
Message-ID: <20260706015213.1828-1-silvapfabio@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/cve.rst into Brazilian Portuguese and link it from the pt_BR documentation index.

Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../translations/pt_BR/process/cve.rst        | 125 ++++++++++++++++++
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/cve.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 76936710b06e..dcc238a5ecfe 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -71,6 +71,7 @@ kernel e sobre como ver seu trabalho integrado.
    Regras de licenciamento <process/license-rules>
    Como começar <process/howto>
    Requisitos mínimos <process/changes>
+   CVEs <process/cve>
    Conclave (Continuidade do projeto) <process/conclave>
    Manuais dos mantenedores <process/maintainer-handbooks>
    Processo do subsistema de rede (netdev) <process/maintainer-netdev>
diff --git a/Documentation/translations/pt_BR/process/cve.rst b/Documentation/translations/pt_BR/process/cve.rst
new file mode 100644
index 000000000000..25452eebfb7b
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/cve.rst
@@ -0,0 +1,125 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====
+CVEs
+====
+
+Os números Common Vulnerabilities and Exposure (CVE®) foram desenvolvidos
+como uma forma inequívoca de identificar, definir e catalogar vulnerabilidades
+de segurança divulgadas publicamente. Com o tempo, sua utilidade diminuiu em
+relação ao projeto do kernel, e os números CVE foram frequentemente atribuídos
+de formas inadequadas e por motivos inadequados. Por causa disso, a comunidade
+de desenvolvimento do kernel tendeu a evitá-los. No entanto, a combinação da
+pressão contínua para atribuir CVEs e outras formas de identificadores de
+segurança, e abusos contínuos por indivíduos e empresas de fora da comunidade
+do kernel, deixou claro que a comunidade do kernel deve controlar
+essas atribuições.
+
+A equipe de desenvolvedores do kernel Linux tem a capacidade de atribuir CVEs
+para possíveis problemas de segurança do kernel Linux. Essa atribuição é
+independente do processo normal de relato de bugs de segurança do kernel
+Linux, descrito em :ref:`securitybugs`.
+
+Uma lista de todos os CVEs atribuídos ao kernel Linux pode ser encontrada nos
+arquivos da lista de discussão linux-cve, como visto em
+https://lore.kernel.org/linux-cve-announce/. Para receber notificações sobre
+os CVEs atribuídos, por favor, `inscreva-se
+<https://subspace.kernel.org/subscribing.html>`_ nessa lista de discussão.
+
+Processo
+========
+
+Como parte do processo normal de lançamento estável, alterações do kernel que
+são potencialmente problemas de segurança são identificadas pelos
+desenvolvedores responsáveis pelas atribuições de números CVE e recebem
+automaticamente números CVE. Essas atribuições são publicadas na lista de
+discussão linux-cve-announce como anúncios frequentes.
+
+Observe que, devido à camada em que o kernel Linux se encontra em um sistema,
+quase qualquer bug pode ser explorável para comprometer a segurança do kernel,
+mas a possibilidade de exploração muitas vezes não é evidente quando o bug é
+corrigido. Por causa disso, a equipe de atribuição de CVEs é excessivamente
+cautelosa e atribui números CVE a qualquer correção de bug que identificar.
+Isso explica o número aparentemente grande de CVEs emitidos pela equipe do
+kernel Linux.
+
+Se a equipe de atribuição de CVEs deixar passar uma correção específica que
+qualquer usuário considere que deveria receber um CVE, por favor envie um
+e-mail para <cve@kernel.org> e a equipe trabalhará com você nisso. Observe
+que nenhum possível problema de segurança deve ser enviado para esse alias;
+ele é SOMENTE para atribuição de CVEs a correções que já estejam em árvores de
+kernel lançadas. Se você acredita ter encontrado um problema de segurança
+ainda
+não corrigido, por favor siga o processo normal de relato de bugs de segurança do kernel
+Linux, descrito em :ref:`securitybugs`.
+
+Nenhum CVE será atribuído automaticamente para problemas de segurança ainda
+não corrigidos no kernel Linux; a atribuição só acontecerá automaticamente
+depois que uma correção estiver disponível e aplicada a uma árvore de kernel
+estável, e ela será rastreada dessa forma pelo ID do commit git da correção
+original. Se alguém desejar que um CVE seja atribuído antes que um problema
+seja resolvido com um commit, por favor entre em contato com a equipe de
+atribuição de CVEs do kernel em <cve@kernel.org> para obter um identificador
+atribuído a partir de seu lote de identificadores reservados.
+
+Nenhum CVE será atribuído para qualquer problema encontrado em uma versão do
+kernel que atualmente não esteja sendo mantida ativamente pela equipe de kernel
+Stable/LTS. Uma lista dos ramos de kernel atualmente suportados pode ser
+encontrada em https://kernel.org/releases.html
+
+Contestações de CVEs atribuídos
+===============================
+
+A autoridade para contestar ou modificar um CVE atribuído a uma alteração
+específica do kernel pertence exclusivamente aos mantenedores do subsistema
+relevante afetado. Esse princípio garante um alto grau de precisão e
+responsabilização no relato de vulnerabilidades. Somente esses indivíduos, com
+profundo conhecimento especializado e conhecimento íntimo do subsistema, podem
+avaliar de forma eficaz a validade e o escopo de uma vulnerabilidade relatada e
+determinar sua designação CVE apropriada. Qualquer tentativa de modificar ou
+contestar um CVE fora dessa autoridade designada pode levar a confusão, relato
+impreciso e, em última análise, sistemas comprometidos.
+
+CVEs inválidos
+==============
+
+Se um problema de segurança for encontrado em um kernel Linux que é suportado
+apenas por uma distribuição Linux devido às alterações feitas por essa
+distribuição, ou porque a distribuição oferece suporte a uma versão do kernel
+que não é mais uma das versões suportadas pelo kernel.org, então um CVE não
+pode ser atribuído pela equipe de CVEs do kernel Linux e deve ser solicitado à
+própria distribuição Linux.
+
+Qualquer CVE atribuído contra o kernel Linux para uma versão de kernel
+ativamente suportada, por qualquer grupo que não seja a equipe de atribuição de
+CVEs do kernel, não deve ser tratado como um CVE válido. Por favor, notifique
+a equipe de atribuição de CVEs do kernel em <cve@kernel.org> para que ela
+possa trabalhar para invalidar essas entradas por meio do processo de remediação
+da CNA.
+
+Aplicabilidade de CVEs específicos
+==================================
+
+Como o kernel Linux pode ser usado de muitas formas diferentes, com muitas
+formas diferentes de acesso por usuários externos, ou sem nenhum acesso, a
+aplicabilidade de qualquer CVE específico cabe ao usuário do Linux determinar;
+isso não cabe à equipe de atribuição de CVEs. Por favor, não entre em contato
+conosco para tentar determinar a aplicabilidade de qualquer CVE específico.
+
+Além disso, como a árvore de fontes é muito grande, e qualquer sistema usa
+apenas um pequeno subconjunto da árvore de fontes, qualquer usuário do Linux
+deve estar ciente de que grandes números de CVEs atribuídos não são relevantes
+para seus sistemas.
+
+Em resumo, não conhecemos o seu caso de uso e não sabemos quais partes do
+kernel você usa, portanto não há como determinarmos se um CVE específico é
+relevante para o seu sistema.
+
+Como sempre, o melhor é adotar todas as alterações de kernel lançadas, pois
+elas são testadas em conjunto como um todo unificado por muitos membros da
+comunidade, e não como alterações individuais selecionadas. Observe também que,
+para muitos bugs, a solução do problema geral não é encontrada em uma única
+alteração, mas pela soma de muitas correções umas sobre as outras. Idealmente,
+CVEs serão atribuídos a todas as correções de todos os problemas, mas às vezes
+podemos deixar de perceber algumas correções; portanto, presuma que algumas alterações
+sem um CVE atribuído podem ser relevantes para adotar.
-- 
2.55.0.windows.2


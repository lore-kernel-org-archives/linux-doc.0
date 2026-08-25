Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35CA3242DF
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787669140; cv=none; b=gYTaU6qSRF2AQZ6Rtch0zFi2nc0hdsT4uTTqGDbpqqXNHbzYWT6qXaRPAEN2Do3YHrETmh12a7gA2s0A99EIi82UWawFy2eFUJMucdZzG+hLrzZTp2FfH4iJRdhgFXP01EPeaNFSRpQ1CkIGJQt4G9at3a/V8lTmHptb8rLM3NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787669140; c=relaxed/simple;
	bh=xW808fuPPWsltOQ2b7g49MQqOmp4eBJWZLNHomx9uzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DEDcOgBdrRxo+PmAuJHHeNjcvpkk0W57siXYYzikMSbPKRNremx+QUWCQlr90BAfs+/a6FCqHDqJifq2bojMGD+lwAl9+3ulBmGlElxGw3rqTqZx/s0pqWtokNUGQN9spnb5NijWeHC1smT6rWRDCWXxjH2Uv3ThFPXNjqJDcno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqB0zBWw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqB0zBWw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so6113433a91.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787669133; x=1788273933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOha3PyFvY0LqRGYAsh8D3QLL9jBKYEJb2OG4/6I7eI=;
        b=lqB0zBWwwn3gzp+SpVq8PLT6AHZFjKI7WZVAuIkvd4Jr4jF5lBoectz7VftcurLXe+
         J6sr/xxzGRhgt6Ya/GxF/ZAQBiEKFCoAIgJpetS7bet8mVm39Ss6M3tCaqdGXlzyRyFh
         6TjosTGdOLYW1N54IYM4dsftyhpDLKYKFKdns6fUR67tdoyD7RoAaOMKE9ayFqnmNsMK
         qWNelChubBRzADGx30q6gfcSRbGM2APUeSTQkqhAlNacp2z6cM7aknkvHGugRZK5GWiQ
         h0g1FwGDX1zqD3CT/kxNm04TD6XF4Fv0di5XssPvvzrZqChU3GBDsmglLGDjvISrfUsr
         NuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787669133; x=1788273933;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BOha3PyFvY0LqRGYAsh8D3QLL9jBKYEJb2OG4/6I7eI=;
        b=q0OxjwoGy3pwYzKMb1Gc3sJSvGBKb5C6XRlbxJU3MUjdts4c/xcsOrRnaMtJv6y0ai
         yEBOkXIc1KQUXVqWFLcADU7giD7/9zv3+/2NMmMorrZsHSnCQHqEe1u2IhIu79IRiPTF
         NJRdlI2iCG6CwGAomAyvZuoEGu/fl2N5y6H1z8J1F04VuzSqjQm4sX1FHGTMrv0dq420
         dabyqqx7lBfhKdadYUDZBIfj03H4TgPVbkKGMb8MQtNqghbv4UmEOrss+yCYhV5M1VHP
         xD690EKUszIge47FtFXqMARHRQ9L/K9O97P6rPaw0Eqd3pyN3M8jDUXj/qibW0N0YQ6j
         ljiw==
X-Gm-Message-State: AFuF++lwuSbcgGdvAKav1/3jVJqnaqS4qbXFYxBjzpsdnSH4jEyk+pqU
	c8+ihquJvg/pt7EuhZ72XqCNmlXOdn5yd5TI0xGYrCuqCkSWAd98H2NdopECHA==
X-Gm-Gg: AR+sD13ewzNCSU90h5UYQbxIw8YGHInyFNHwLJSqpuKv8DW7lFVPFBGP+3DGbYkD9+O
	7Fetveb3tLIKMHA+088/I1gVKFug3gx3U14qOKi1NXs/LkOqP2NJiR3dbpMgGT7b+9pn1LMGPuz
	Z5hnsyRW5oF8tD91oziojQB13QhLOhLG/fjihZwQLP0Juj1VvTeQpFUZ0jkQZrBTBBmGyzlw5qG
	XbnLW3Odl3H6KeW+o3BAPa442RWxd3acxIdZFaqIeogpdWy6S4rUQ3QGrBJBHQLBwqNqKn0i/PB
	e58DzBk94sEENxSixYGEx+WGkRYqnQUK7wBc5eclpzivyrz78x2z/0wJTH7QuQQrvMZHpDfM3ok
	GwgoeN3zMwzZddQ93W3DIANS0iSQYQZdziI43uVsXIsQ4I3yIRPp3cK8uEDdKMSao2GeumxHDaJ
	HJGmtg6iAPpUZo1gSopc3aakQhum4DTL3ytoVOeKGMKY8WD9WEluMPvWltId2SxUjrxFs=
X-Received: by 2002:a17:90b:4ac6:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-395df13ced5mr49978672a91.8.1787669132706;
        Tue, 25 Aug 2026 07:45:32 -0700 (PDT)
Received: from x-wing ([177.181.5.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860c697esm32077206c88.3.2026.08.25.07.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:45:31 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Kurt Borja <kuurtb@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2] docs: pt_BR: process: Translate CVE documentation
Date: Tue, 25 Aug 2026 11:45:25 -0300
Message-ID: <20260825144525.12670-1-silvapfabio@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/cve.rst into Brazilian Portuguese and
link it from the pt_BR documentation index.

Changes in v2:
- replace "conhecimento especializado" with "conhecimento técnico"
- change "atribuído contra o kernel Linux" to "atribuído ao kernel Linux"
- reduce repetition in the applicability paragraph
- replace "árvore de fontes" with "árvore de códigos-fonte"
- replace "grandes números" with "grandes quantidades"
- remove the repeated "qualquer" wording in the same paragraph

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
index 000000000000..3612ec3c3679
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
+profundo conhecimento técnico e conhecimento íntimo do subsistema, podem
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
+Qualquer CVE atribuído ao kernel Linux para uma versão de kernel
+ativamente suportada, por qualquer grupo que não seja a equipe de atribuição de
+CVEs do kernel, não deve ser tratado como um CVE válido. Por favor, notifique
+a equipe de atribuição de CVEs do kernel em <cve@kernel.org> para que ela
+possa trabalhar para invalidar essas entradas por meio do processo de remediação
+da CNA.
+
+Aplicabilidade de CVEs específicos
+==================================
+
+Como o kernel Linux pode ser usado de múltiplas maneiras, com diversas
+formas de acesso por usuários externos, ou sem nenhum acesso, a
+aplicabilidade de qualquer CVE específico cabe ao usuário do Linux determinar;
+isso não cabe à equipe de atribuição de CVEs. Por favor, não entre em contato
+conosco para tentar determinar a aplicabilidade de qualquer CVE específico.
+
+Além disso, como a árvore de códigos-fonte é muito grande, e cada sistema usa
+apenas um pequeno subconjunto dessa árvore, o usuário do Linux deve estar
+ciente de que grandes quantidades de CVEs atribuídos não são relevantes para
+seus sistemas.
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
\ No newline at end of file
-- 
2.43.0

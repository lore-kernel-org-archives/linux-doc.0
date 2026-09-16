Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3964A7CB6
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 17:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580520; cv=none; b=UTtRNK3jc/IUFzcDrfqq+b8S1QBERDxd6AWgI/GhP0YMUi07MleYldzcoubPJueDvJOiIek+lnma9/3Lxw+ifGHBuFUozUUHRTSq15sD6yJ0ajEW+k+bzonMQuZgujU99HOOPI91WVCeAyRRB9h59laLE9RCJ1io1LJxqtgFhgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580520; c=relaxed/simple;
	bh=9YtIzfjOWdJvmRX/9Np3gD1QaC4cQlYJKP6ihIyK4KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LNKehjQeeFy7iPdZ+o8sDFI+Fu2V60M60GZMAXGfCG38KbeQ8ucKvtP8OuvauyPFkRbsdbp6EdCHk26wAPWAyZWgbQNfKVd83hTrs/cxiN0p82O5I9oFuW0nHYpqMNGGaQELtxUWsALXf/Njj3qbDmOVIXMrNLXcs/4EcnFX7CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYtkcGyv; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYtkcGyv"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b5c61966d0so787551b6e.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 10:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580504; x=1790185304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a93gvVt8Lyux8O5gDkqg6ZxenGRaGOCq9FdrB0UJiOw=;
        b=fYtkcGyvFIYskR/DPo0YK3ii9gVrvEx3KWkZdsw5Sf6fTXuKig5h4U8bIjL94//54B
         CSZVZFmNIWuXO74ezjxLY8S3zQAEGOSuVdvBGLxiqbhjzXHoSeGJ6aaw4h21VG3h02rR
         G6aTP9QWCRSJWVh8KtDuj6BXMxMJF6VmM+1gMLys6taFtoH7y1FolEAr6UYY19xxUUtq
         1uhdm9ErSBt11ENnqe1JYQ0V0xrheojDXP407nD08/eMXoS635CFbfyzalTIgeWwomVR
         IGsEKZPkBDfWDkuNbqycpohyEOlBYIk3bod61mtCoBh9kQP1cytGDxWzpohBZVgH6CFF
         zudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580504; x=1790185304;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a93gvVt8Lyux8O5gDkqg6ZxenGRaGOCq9FdrB0UJiOw=;
        b=VKEQNiNnUrLNGkaNQlMgufXEMhxrqxvgXQMpYUE1LrSkI+4PY1ho5+3sLfeRZR4ZW7
         I/pGJw0lYNohJI/Ne27sOS/iJuLAuh+oAIjJnv/tQNc7kD3rOwCJgC4f4jLYlznDG5A8
         SVAK5HthFKC4rHDj4h9C6rC1z62MkZ322nIK29S1yOHEiaTsjVTEvwWBpq80JYFf+n2U
         CIplqaKt025vBNHZN5vUhcH+Wu/3iuNaITYI1YZFSlsa9XLfN+XKkPqPnmReQCfEymNi
         sUm+uzQDi3bQMW1NCZ7RT5yF60iAtmcsbJNtWOIA3Y5E81NXbLIAhKlVURwdXmEP97Pb
         YWTg==
X-Gm-Message-State: AFuF++lZvAiP+tcbVOCoYrB/KerM1rMftQYn0k/Z8aozs/evOstpk4Zs
	8xpTGfuKI88b2fw0prYLAuulEo9Mc7TV8vtBGxdOEI+eNdOH3f559nzayKPBQSR9LDQ=
X-Gm-Gg: AYBFou2R880e5/VAKb+V2wkN02EO9a2ZnGf+bgIA93oy+dW53zqXuzSB0evjIT+y60R
	GnMaGxnyaAc5nhQoa+POYTUR5t+gZZrQQ2Bq06rVHKs9d9QhyXDP1ZfZHNBdQL8X4rkS8whYsRS
	zee5TUgcLt6wQFbhUOKlWppfnIojj0ueoLrz+y2FSCcv5C5SoxGEVG4rVaDkuLxdZ80rzOe3b9A
	BFiMKvzVp41uWX5x/2X97pj4jXGgHUEBHONvVx6qB5uVesO1qPldUrQcPBfGNyjlbe1fOO6b2bw
	79zbFkGglf2T2xRan9Pboak8UqPlq1Ydmq9QonvFDWUKv3u5WvIQYrDSvZ2ujcGy1E8Jb1wF8wn
	wJPE62YRz3CQ4DbhIYMdTfMcaYXl4S+FQvf422k1Zm3jC1GX3u37QJFlxFZEFVv8Tofd6JTi39/
	1zs0xMzByEfIN/UwzUjPoXc2IxR7MmmWp4gQgIUAWDYhLdiMu3iQVMF646ML/FqSW4x7Cy1roMQ
	L2vqBkMMuJkbm8waaXXBOpC8FUYn41Yi5VnWn/R4HrU+trATcHFLKsM46CPIRi7/NlHNfM2/SPu
	wV6vmv8FFIiQyZTNqbiex1M4cV/02SwCoyG9LA74qqxIqO4=
X-Received: by 2002:a05:6808:1307:b0:4b9:e5fa:8910 with SMTP id 5614622812f47-4ca4c185ac1mr4021159b6e.35.1789580504034;
        Wed, 16 Sep 2026 10:41:44 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d9999e8sm360668b6e.17.2026.09.16.10.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:41:43 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH 1/5] docs: translations: pt_BR: point refs at the translated documents
Date: Wed, 16 Sep 2026 14:41:31 -0300
Message-ID: <20260916174136.48011-2-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916174136.48011-1-danielmaraboo@gmail.com>
References: <20260916174136.48011-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Several pt_BR documents referenced the English version of documents that
are already translated, in some cases rendering an English title in the
middle of a Portuguese sentence.  Add the missing pt_BR anchors, repoint
the references at the translations, and fix the broken paths and stray
punctuation found along the way.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/adding-syscalls.rst         |  2 +-
 .../code-of-conduct-interpretation.rst        |  2 ++
 .../pt_BR/process/code-of-conduct.rst         |  4 +--
 .../pt_BR/process/coding-style.rst            |  2 ++
 .../translations/pt_BR/process/cve.rst        |  4 +--
 .../pt_BR/process/development-process.rst     |  2 ++
 .../pt_BR/process/maintainer-handbooks.rst    |  4 +--
 .../pt_BR/process/maintainer-kvm-x86.rst      |  4 +--
 .../process/maintainer-soc-clean-dts.rst      |  5 ++--
 .../pt_BR/process/management-style.rst        |  7 +++---
 .../pt_BR/process/security-bugs.rst           | 25 +++++++++++--------
 .../pt_BR/process/submit-checklist.rst        |  4 +--
 .../pt_BR/process/submitting-patches.rst      |  2 ++
 13 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/adding-syscalls.rst b/Documentation/translations/pt_BR/process/adding-syscalls.rst
index 37b0dd0e2..99607ee5f 100644
--- a/Documentation/translations/pt_BR/process/adding-syscalls.rst
+++ b/Documentation/translations/pt_BR/process/adding-syscalls.rst
@@ -7,7 +7,7 @@ Adicionando uma Nova Chamada de Sistema
 Este documento descreve o que está envolvido na adição de uma nova chamada de
 sistema (system call) ao kernel Linux, indo além dos conselhos normais de
 submissão em
-:ref:`Documentation/process/submitting-patches.rst <submittingpatches>`.
+:ref:`Documentation/translations/pt_BR/process/submitting-patches.rst <pt_BR_submittingpatches>`.
 
 
 Alternativas às Chamadas de Sistema
diff --git a/Documentation/translations/pt_BR/process/code-of-conduct-interpretation.rst b/Documentation/translations/pt_BR/process/code-of-conduct-interpretation.rst
index 866c9f7e7..c40886e3d 100644
--- a/Documentation/translations/pt_BR/process/code-of-conduct-interpretation.rst
+++ b/Documentation/translations/pt_BR/process/code-of-conduct-interpretation.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_code_of_conduct_interpretation:
+
 Interpretação do Código de Conduta do Kernel Linux
 ==================================================
 
diff --git a/Documentation/translations/pt_BR/process/code-of-conduct.rst b/Documentation/translations/pt_BR/process/code-of-conduct.rst
index 1ab171bf2..8a3da70b7 100644
--- a/Documentation/translations/pt_BR/process/code-of-conduct.rst
+++ b/Documentation/translations/pt_BR/process/code-of-conduct.rst
@@ -84,5 +84,5 @@ disponível em https://www.contributor-covenant.org/version/1/4/code-of-conduct.
 Interpretação
 =============
 
-Consulte o documento :ref:`code_of_conduct_interpretation` para entender como a
-comunidade do kernel Linux interpretará este documento.
+Consulte o documento :ref:`pt_BR_code_of_conduct_interpretation` para
+entender como a comunidade do kernel Linux interpretará este documento.
diff --git a/Documentation/translations/pt_BR/process/coding-style.rst b/Documentation/translations/pt_BR/process/coding-style.rst
index 26dcd1246..ac9bf0a71 100644
--- a/Documentation/translations/pt_BR/process/coding-style.rst
+++ b/Documentation/translations/pt_BR/process/coding-style.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_codingstyle:
+
 Estilo de codificação do kernel Linux
 =====================================
 
diff --git a/Documentation/translations/pt_BR/process/cve.rst b/Documentation/translations/pt_BR/process/cve.rst
index 18f4b11be..83977eda3 100644
--- a/Documentation/translations/pt_BR/process/cve.rst
+++ b/Documentation/translations/pt_BR/process/cve.rst
@@ -18,7 +18,7 @@ essas atribuições.
 A equipe de desenvolvedores do kernel Linux tem a capacidade de atribuir CVEs
 para possíveis problemas de segurança do kernel Linux. Essa atribuição é
 independente do processo normal de relato de bugs de segurança do kernel
-Linux, descrito em :ref:`securitybugs`.
+Linux, descrito em :ref:`pt_BR_securitybugs`.
 
 Uma lista de todos os CVEs atribuídos ao kernel Linux pode ser encontrada nos
 arquivos da lista de discussão linux-cve, como visto em
@@ -51,7 +51,7 @@ ele é SOMENTE para atribuição de CVEs a correções que já estejam em árvor
 kernel lançadas. Se você acredita ter encontrado um problema de segurança
 ainda
 não corrigido, por favor siga o processo normal de relato de bugs de segurança do kernel
-Linux, descrito em :ref:`securitybugs`.
+Linux, descrito em :ref:`pt_BR_securitybugs`.
 
 Nenhum CVE será atribuído automaticamente para problemas de segurança ainda
 não corrigidos no kernel Linux; a atribuição só acontecerá automaticamente
diff --git a/Documentation/translations/pt_BR/process/development-process.rst b/Documentation/translations/pt_BR/process/development-process.rst
index d303ab92b..e1441cec8 100644
--- a/Documentation/translations/pt_BR/process/development-process.rst
+++ b/Documentation/translations/pt_BR/process/development-process.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_development_process_main:
+
 Guia para o Processo de Desenvolvimento do Kernel
 =================================================
 
diff --git a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
index b7aab788f..130730650 100644
--- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
@@ -5,8 +5,8 @@ Notas sobre o processo de desenvolvimento de subsistemas e mantenedores
 
 O propósito deste documento é fornecer informações específicas de
 subsistemas que são suplementares ao manual geral do processo de
-desenvolvimento.
-:ref:`Documentation/process <development_process_main>`.
+desenvolvimento
+:ref:`Documentation/translations/pt_BR/process <pt_BR_development_process_main>`.
 
 Para desenvolvedores, veja abaixo todos os guias específicos de
 subsistemas conhecidos. Se o subsistema para o qual você está
diff --git a/Documentation/translations/pt_BR/process/maintainer-kvm-x86.rst b/Documentation/translations/pt_BR/process/maintainer-kvm-x86.rst
index d9fd272fb..ef133d32c 100644
--- a/Documentation/translations/pt_BR/process/maintainer-kvm-x86.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-kvm-x86.rst
@@ -431,5 +431,5 @@ Bugs que podem ser explorados pelo convidado (guest) para atacar o hospedeiro
 (host) (kernel ou espaço do usuário), ou que podem ser explorados por uma VM
 aninhada (nested) contra o *seu* próprio hospedeiro (L2 atacando L1), são de
 interesse particular para o KVM. Por favor, siga o protocolo em
-:ref:`securitybugs` se você suspeitar que um bug possa levar a um escape,
-vazamento de dados, etc.
+:ref:`pt_BR_securitybugs` se você suspeitar que um bug possa levar a um
+escape, vazamento de dados, etc.
diff --git a/Documentation/translations/pt_BR/process/maintainer-soc-clean-dts.rst b/Documentation/translations/pt_BR/process/maintainer-soc-clean-dts.rst
index a7e7bf0f1..7256c7153 100644
--- a/Documentation/translations/pt_BR/process/maintainer-soc-clean-dts.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-soc-clean-dts.rst
@@ -8,8 +8,9 @@ Visão Geral
 -----------
 
 As plataformas SoC ou subarquiteturas devem seguir todas as regras de
-Documentation/process/maintainer-soc.rst. Este documento, referenciado em
-MAINTAINERS, impõe requisitos adicionais listados abaixo.
+Documentation/translations/pt_BR/process/maintainer-soc.rst. Este
+documento, referenciado em MAINTAINERS, impõe requisitos adicionais
+listados abaixo.
 
 Conformidade Estrita com DT Schema de DTS e dtc
 -----------------------------------------------
diff --git a/Documentation/translations/pt_BR/process/management-style.rst b/Documentation/translations/pt_BR/process/management-style.rst
index b92f8705c..c40b19b90 100644
--- a/Documentation/translations/pt_BR/process/management-style.rst
+++ b/Documentation/translations/pt_BR/process/management-style.rst
@@ -5,9 +5,10 @@ Estilo de gerenciamento do kernel Linux
 
 Este é um documento curto descrevendo o estilo de gerenciamento preferido (ou
 inventado, dependendo de quem você perguntar) para o kernel do Linux. Ele se
-destina a espelhar o documento :ref:`process/coding-style.rst <codingstyle>` em
-algum grau, e foi escrito principalmente para evitar responder [#f1]_ as mesmas
-(ou semelhantes) perguntas repetidamente.
+destina a espelhar o documento
+:ref:`Documentation/translations/pt_BR/process/coding-style.rst <pt_BR_codingstyle>`
+em algum grau, e foi escrito principalmente para evitar responder [#f1]_ as
+mesmas (ou semelhantes) perguntas repetidamente.
 
 Estilo de gerenciamento é muito pessoal e muito mais difícil de quantificar do
 que simples regras de estilo de codificação, então este documento pode ou não ter
diff --git a/Documentation/translations/pt_BR/process/security-bugs.rst b/Documentation/translations/pt_BR/process/security-bugs.rst
index 72c771869..321575657 100644
--- a/Documentation/translations/pt_BR/process/security-bugs.rst
+++ b/Documentation/translations/pt_BR/process/security-bugs.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_securitybugs:
+
 Falhas de segurança
 ===================
 
@@ -59,11 +61,11 @@ Além disso, as seguintes informações são altamente desejáveis:
     mantenedores, mesmo que a correção acabe não sendo a correta, pois ajuda a
     entender o bug. Ao propor uma correção testada, por favor, formate-a
     sempre de uma maneira que possa ser mesclada imediatamente (consulte
-    Documentation/process/submitting-patches.rst). Isso evitará algumas trocas
-    de mensagens caso ela seja aceita, e você receberá o crédito por
-    encontrar e corrigir o problema. Observe que, neste caso, apenas uma tag
-    ``Signed-off-by:`` é necessária, sem ``Reported-by:`` quando o relator e
-    o autor forem a mesma pessoa.
+    Documentation/translations/pt_BR/process/submitting-patches.rst). Isso
+    evitará algumas trocas de mensagens caso ela seja aceita, e você receberá
+    o crédito por encontrar e corrigir o problema. Observe que, neste caso,
+    apenas uma tag ``Signed-off-by:`` é necessária, sem ``Reported-by:``
+    quando o relator e o autor forem a mesma pessoa.
 
   * **mitigações**: com muita frequência, durante a análise de um bug,
     surgem algumas maneiras de mitigar o problema. É útil compartilhá-las,
@@ -228,8 +230,8 @@ a tornar esses relatórios desnecessariamente difíceis de lidar:
     Se a correção não puder ser testada porque depende de hardware raro ou de
     protocolos de rede quase extintos, é provável que o problema não seja um
     bug de segurança. Em qualquer caso, se uma correção for proposta, ela deve
-    aderir a Documentation/process/submitting-patches.rst e incluir uma tag
-    'Fixes:' designando o commit que introduziu o bug.
+    aderir a Documentation/translations/pt_BR/process/submitting-patches.rst
+    e incluir uma tag 'Fixes:' designando o commit que introduziu o bug.
 
 A falha em considerar estes pontos expõe seu relatório ao risco de ser
 ignorado.
@@ -280,7 +282,7 @@ entender e corrigir a vulnerabilidade de segurança.
 Por favor, envie e-mails em **texto simples** sem anexos, sempre que possível.
 É muito mais difícil ter uma discussão com citações de contexto sobre um
 problema complexo se todos os detalhes estiverem ocultos em anexos. Pense nisso
-como uma :doc:`regular path submission </../../../process/submitting-patches>`
+como uma :doc:`submissão pelo caminho normal <submitting-patches>`
 (mesmo que você ainda não tenha um patch): descreva o problema e o impacto,
 liste as etapas de reprodução e siga com uma proposta de correção, tudo em
 texto simples. Relatórios formatados em Markdown, HTML e RST são
@@ -288,8 +290,9 @@ particularmente malvistos, pois são bastante difíceis de ler por humanos e
 incentivam o uso de visualizadores dedicados, às vezes online, o que por
 definição não é aceitável para um relatório de segurança confidencial. Note
 que alguns clientes de e-mail tendem a corromper a formatação de texto simples
-por padrão; por favor, consulte Documentation/process/email-clients.rst para
-mais informações.
+por padrão; por favor, consulte
+Documentation/translations/pt_BR/process/email-clients.rst para mais
+informações.
 
 Divulgação e informações sob embargo
 ------------------------------------
@@ -359,7 +362,7 @@ A equipe de segurança não atribui CVEs, nem os exigimos para relatórios ou
 correções, pois isso pode complicar desnecessariamente o processo e adiar o
 tratamento do bug. Se um relator desejar que um identificador CVE seja
 atribuído para um problema confirmado, ele pode entrar em contato com a
-:doc:`kernel CVE assignment team<../../../process/cve>` para obter um.
+:doc:`equipe de atribuição de CVEs do kernel <cve>` para obter um.
 
 Acordo de não divulgação
 ------------------------
diff --git a/Documentation/translations/pt_BR/process/submit-checklist.rst b/Documentation/translations/pt_BR/process/submit-checklist.rst
index 003fc9568..3e0ee38b9 100644
--- a/Documentation/translations/pt_BR/process/submit-checklist.rst
+++ b/Documentation/translations/pt_BR/process/submit-checklist.rst
@@ -8,7 +8,7 @@ Aqui estão algumas coisas básicas que os desenvolvedores devem fazer se
 quiserem ver suas submissões de patches de kernel aceitas mais rapidamente.
 
 Estas diretrizes vão além da documentação fornecida em
-:ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
+:ref:`Documentation/translations/pt_BR/process/submitting-patches.rst <pt_BR_submittingpatches>`
 e em outros locais sobre o envio de patches para o kernel Linux.
 
 Revise seu código
@@ -19,7 +19,7 @@ Revise seu código
    os que você usa de forma indireta.
 
 2) Verifique o estilo geral do seu patch conforme detalhado em
-   :ref:`Documentation//process/coding-style.rst <codingstyle>`.
+   :ref:`Documentation/translations/pt_BR/process/coding-style.rst <pt_BR_codingstyle>`.
 
 3) Todas as barreiras de memória {por exemplo, ``barrier()``, ``rmb()``,
    ``wmb()``} precisam de um comentário no código-fonte que explique a
diff --git a/Documentation/translations/pt_BR/process/submitting-patches.rst b/Documentation/translations/pt_BR/process/submitting-patches.rst
index 8cf1aae52..aad926c17 100644
--- a/Documentation/translations/pt_BR/process/submitting-patches.rst
+++ b/Documentation/translations/pt_BR/process/submitting-patches.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_submittingpatches:
+
 Enviando patches: o guia essencial para colocar o seu código no kernel
 ======================================================================
 
-- 
2.47.3


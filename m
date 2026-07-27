Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559F52F7F00
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 11:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785153184; cv=none; b=hGFGta+zlgWLwPzUo5vSJK9mPGUPulSzfx182ss+AH9NBxqLyuAGkGlmJtNeN+++RUWkTbTqk7HrfJrJlwg/pRGZy8ZuPYwatQkKr9m6F/aeoPD2UfnTzmlVCb6dyGgJkhR1w+2FpZzvcejUlZmn4GPmobYE53IekPwX7ZEfwDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785153184; c=relaxed/simple;
	bh=VSYygienpvF57clrZgsLA5ARbleBT8GZyT3SmquL/gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VP4J/1dR4SZz/H9/3SyhFVUdvxaNQqyb2Ga4t96utIXBR7A1IL8LC1SrDV24Pnb4tAWMuCvvXk8KZd8hcH2qBOpwJJxRSR8TGaZzFyykNl1nRGvoJw21TBawtHMUsqfcxB+stANwZul2fCk6G8ev8mgC6WrmPghLSvnq6njiaao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fi7wARxu; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fi7wARxu"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-667923d86a7so3550271d50.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 04:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785153182; x=1785757982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogEPHSl0Ws9MSJlyo2LP7jyvCfiz5n665slTDMRMY8A=;
        b=fi7wARxuTKuT0EAYyV2KlwA/MUpTUD3OYQ6p/UKPbUhxfTF/dEyNa5kBPMbTD+ZD2v
         cBQt1G84cdEmnDzk0pdQsia1REemE7SRTs4gl727cidxeCZ9VpqVsmFhe4Kf1ERe8bTI
         TXPaniLE+9FzWbZ16awvJzCVRQn/6dlC2QLt8sAr2FcXo0kmKW+yHdbbATqgVcd9rszb
         1zQAgCf28z0Bgf8aY1gf5jusXhJW4u+CEtU55tDDKNDwOydE+/y4QYbiScXO9+0aiZPR
         UPtStF/iLxLx/EldeG7ta0G/rrQhUYXiMrA/x4xCwKemflkb/xfSQrBSGtpBc1v/RXBo
         cZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785153182; x=1785757982;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ogEPHSl0Ws9MSJlyo2LP7jyvCfiz5n665slTDMRMY8A=;
        b=aHuQj/jtiqxoW22ArpgnXnMcoTrjMl/jaXZ1iHpsfVdUtWLMHylXdQlbCyUX3hpKhB
         jBc2H7L7cheVYc58L4gJY87QrhVm1a6ZNuX/F0kRXayTyjcGSeHkJl6apCv7zu1FYoII
         gCyRKfzBDJf48iJPdkgUY8izsjb0wSsbNFUZoXkd1shpogvHw2WgqVcO1Xi/QPoGHzEL
         nZJR3vDrTaU/fuF2IxVezpA0DjlTNGPx36vSf8/8Gp/UjEX9UGiqbO80PPpi2RXSYMTq
         1E4h6TRCMrWI56+upPRs/EUEDBQ7bs5pMOdpszWxYQv8s22HlQXOb5p6Vc9dgMHTSkA2
         8gCg==
X-Gm-Message-State: AOJu0Yyry4KgqhfMRZ6dy0O9DmQIZaTNXH8VkJhp6GHsxjCXEPH7dFLb
	r61uwcEvasd8yM92Wak5fqCavpuJl3OVwek6caAuwKnb08fxk5nbCmre
X-Gm-Gg: AR+sD13yEohN/kYR902AncLhO+qH7wmMH1zv68AYn8n0S+xnGqX0s6jKAZa4yHeVjS+
	Kjk8PFL+qqgC39TYQSsGJgSpUE0foMBEZReKU+TfAvWbyTRsD75cFM9LxFYDD7d2MNIQY/6GeFl
	DgJy5e7FEW9/G3fpUJF18mGrDV/8wWtSDBmcaHYTOb5cm09jFTBRZpKpBLOSH35K2N0Tx6w0xVs
	M2ZigdDH34Od3wXWi9wT9AZNi9SpK7TyVBHSDHeTYIrv7hiFDZMc73xO2sNBj+/bdzghwemOf21
	EukIw9SM2z3NpJzI/pdInP/7FEhblvgEj1CLYzKhYab2CPU2yClq07KktOBRNgfB2tD3UmTjvwJ
	8CMyLTsaNHozhap5n2TFLlH5UcCLdwHPBGENohVsk8eCnq920GIVTLXV/0qisFnJUrb4xBAVXxI
	QHn9DtTyo/AAY9nFeU8oEnhhbaAM09zMM53f1HersAKfVgH5ZpRZXKydeAOTsLprEFAFle9ymu2
	toGS0kIUcsTTHOEFy3+2cR8jgESictsTaSbi37COydRTIpwZ2a7IyxoWzCtYU0p
X-Received: by 2002:a05:690e:1b62:b0:668:27a8:5566 with SMTP id 956f58d0204a3-668bfd6249bmr2227487d50.9.1785153181970;
        Mon, 27 Jul 2026 04:53:01 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668c6d63596sm3206474d50.6.2026.07.27.04.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:53:01 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH] docs: pt_BR: Reorganize index.rst to avoid merge conflicts
Date: Mon, 27 Jul 2026 08:52:17 -0300
Message-ID: <20260727115218.109323-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The main index.rst file for the pt_BR translation was grouping all
translated documents directly in its toctree. Because many contributors
are submitting translations simultaneously to the same file, it has
become a bottleneck, causing frequent merge conflicts.

To solve this issue and improve maintainability, this patch refactors
the structure to follow the pattern used by the base English
documentation. Specifically, a new index.rst was created inside the
process/ directory to handle all future contributions and document
additions targeting that specific directory.

The root index.rst now simply references process/index.rst. This
modular organization keeps the main tree clean and significantly
reduces patch collisions.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    | 28 +--------------
 .../translations/pt_BR/process/index.rst      | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/process/index.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 232d18f7c..e868544d1 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -1,7 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-
-
 =========================================
 Documentação do Kernel Linux em Português
 =========================================
@@ -22,8 +20,6 @@ na reorganização da documentação de forma mais coerente. Melhorias na
 documentação são sempre bem-vindas; se você deseja ajudar, inscreva-se na lista
 de discussão linux-doc em vger.kernel.org.
 
-
-
 Avisos
 ======
 
@@ -66,26 +62,4 @@ kernel e sobre como ver seu trabalho integrado.
 .. toctree::
    :maxdepth: 1
 
-   Introdução <process/1.Intro>
-   Guia do Processo de Desenvolvimento <process/development-process>
-   Como aplicar patches <process/applying-patches>
-   Backporting e resolução de conflitos <process/backporting>
-   Como não Deixar as ioctls malfeitas <process/botching-up-ioctls>
-   Index de documentos do Kernel <process/kernel-docs>
-   Regras de licenciamento <process/license-rules>
-   Como começar <process/howto>
-   Requisitos mínimos <process/changes>
-   Conclave (Continuidade do projeto) <process/conclave>
-   Modelos de Maturidade para Contribuição no Kernel Linux <process/contribution-maturity-model.rst>
-   Manuais dos mantenedores <process/maintainer-handbooks>
-   Processo do subsistema de rede (netdev) <process/maintainer-netdev>
-   Processo do subsistema SoC <process/maintainer-soc>
-   Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
-   Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
-   Adicionando uma nova chamada de Sistema <process/adding-syscalls>
-   Declaração sobre Drivers do Kernel <process/kernel-driver-statement>
-   Lista de verificação para submissão de patches do kernel Linux <process/submit-checklist>
-   Interpretação do Código de Conduta do Kernel Linux <process/code-of-conduct-interpretation>
-   Código de Conduta de Compromisso do Colaborador <process/code-of-conduct>
-   Interfaces, recursos de linguagem, atributos e convenções obsoletos <process/deprecated>
-
+   Todos os documentos do processo de desenvolvimento <process/index>
diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
new file mode 100644
index 000000000..b3518fe72
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================================================
+Trabalhando com a comunidade de desenvolvimento
+================================================
+
+As guias fundamentais para a interação com a comunidade de desenvolvimento do
+kernel e sobre como ver seu trabalho integrado.
+
+.. toctree::
+   :maxdepth: 1
+
+   Introdução <1.Intro>
+   Guia do Processo de Desenvolvimento <development-process>
+   Como aplicar patches <applying-patches>
+   Backporting e resolução de conflitos <backporting>
+   Como não Deixar as ioctls malfeitas <botching-up-ioctls>
+   Index de documentos do Kernel <kernel-docs>
+   Regras de licenciamento <license-rules>
+   Como começar <howto>
+   Requisitos mínimos <changes>
+   Conclave (Continuidade do projeto) <conclave>
+   Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model>
+   Manuais dos mantenedores <maintainer-handbooks>
+   Processo do subsistema de rede (netdev) <maintainer-netdev>
+   Processo do subsistema SoC <maintainer-soc>
+   Conformidade de DTS para SoC <maintainer-soc-clean-dts>
+   Processo do subsistema KVM x86 <maintainer-kvm-x86>
+   Adicionando uma nova chamada de Sistema <adding-syscalls>
+   Declaração sobre Drivers do Kernel <kernel-driver-statement>
+   Lista de verificação para submissão de patches do kernel Linux <submit-checklist>
+   Interpretação do Código de Conduta do Kernel Linux <code-of-conduct-interpretation>
+   Código de Conduta de Compromisso do Colaborador <code-of-conduct>
+   Interfaces, recursos de linguagem, atributos e convenções obsoletos <deprecated>
-- 
2.52.0


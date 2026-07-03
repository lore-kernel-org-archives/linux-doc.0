Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC2C2DA756
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 17:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098446; cv=none; b=KiQqplusJuDYvKuWhJ6/qD0tb0e4bSnzRc9UcuAXVdqPuiNFhktoMwyGihfmkvWKoaN+b+5Nc2bHiENtm+WAPnAvXlbiuGsVhzZrq0NB20wxo8eKzYG2Z0C8hQ+f/LwjCsq/DchS+WMjPjLMC80lnDIBTXLwV917mxHQuTifKXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098446; c=relaxed/simple;
	bh=bpN/MDIIPVlq0ec3N+M+qJEuhunTMf4ri+T/r8MobEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tVQ0eJ8AVTBJdqyLI6J1hgT90z7tCR68dH7ONEMI4X58n47VSGQyM8rS/70kqz7mLJ1DYQ/UyskiR7DH8poZv8Ng1y9hMtMeX12UXAmyz4vjB4EqXS1yBVGYa/r8VR1FgFm20OYfiu5zK3zYR+sucI+k68t1Ke2Rk0emDxFqqVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A955OR3S; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A955OR3S"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c825c88744so6497715ad.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 10:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783098444; x=1783703244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIurjtpSRTbX1yfKFmCbh0TjGqX3s3Oq1dSt/WdoJrw=;
        b=A955OR3SPWgO+WVYqlZGOQ59k7Xudzjr0ViISDL9Ur+P4hgG+TxrD3ytuIhCUwtfnb
         mSeOyWZ+5h+E+TEabCDaYnrzUJEAvf5m3OpoB2Jxq9OxJWHNa6JsHdq7cB8zzLjX9aWn
         QzGRT6VT7Jt+ueOZqKuWAXwC72WlL25oW85FEt2qCY1DQlEku5Eevy0LjkC7l98ERqNH
         lJPGPvHeQu7/vvrqnOBNm8GXQgRkRR5fUmUSO5o35jN5ydeSFeY39n9Q/KSxo8sx+ZtX
         BFgV8gylOOi3LWzBwz9hyMku5nTsmYJyLpB/6N5AGjAN5ueRDJV3pyVqPhlY4Gc/jui/
         IFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098444; x=1783703244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AIurjtpSRTbX1yfKFmCbh0TjGqX3s3Oq1dSt/WdoJrw=;
        b=ac6PZBvhMypSTN+DqBwCn19DEgcJ6SbRqStX9EEuEKaqhNpfnxseSxXxueWdOCRkds
         c6tKQD1E85l14DubOW4rULL9el0S2XE+x0mUE+XtXd8pjXekXEa6THiifUvbWUyNH9JS
         5/c1Fh9gs+8kamDR4tjwmFm/+9/8PEst3hMaYVqKW362tTDJeXg9M+UEpt5ca+jRb+/L
         Z9WQAUPSr4cbFET3aT8daLWarqnCtUDVtOAIFKAab46LJKxj8k0pqPnmYBBS/I8TgPEj
         uUWq+C6SrU2EVj/rfJYOcUmpOSPUoOHs0PF2Nh07TxdqQS/6XcaTKAbWtar3JWii+Yzu
         o1Eg==
X-Gm-Message-State: AOJu0Yy5fSTFBwPFTC+mNX0C4pGY07Fok70DZX5OQL58OCaFt/6wezxV
	cVP1V5WgnWwI1jUfNGRcsQnJxTuWyEH/9kX3Yi6gBjBTblF/pIissa093E+AUoe1
X-Gm-Gg: AfdE7cnD1VYZAAC5kROteqUSMACxij+R5YGaMIjsbRTOfs3lyhputXZBwmTdF1QQnBt
	YUVlJfv8eOVgxBY8UCtCC1c+TiLyUvGjuL2DRpCPO4hTJB8hA5Xfs2VnjJuhgupi9mtaGeWb50F
	IhO7F18GyW1XERN3/tk2XjoqW2THZ/qMEUB64C9+kWJnatsRioccvZwakY2T+yPfUapW3IRqJQs
	kPPQu2uT4sWMG2Mw3rP53B0MMIxByAU7O97ViW0cvO5uXSErd3iohFwigB4kg+lbWUOpZMRb0qc
	csEOc6KUMBbQqOGHArUMjSdGmo2itThVWgQR2BncsKDEgxZd4fYUZLkqZ5v1AQ6TahIlQlS+0DZ
	PupcPCS8lAbNbUHynhjc+ksnOVAkfD7WHUqX4mWkd9SkM7ODfabZUd2k+GeUOPEPl4u3S6bxl1n
	lm0k06Lg+TOGPlrOKCSfaxUQDgtC7Gow5XlcOQwUz8QRxWSssZLg5IbQVeW7CRDgXEUD0OhkVzA
	WZ6mSM7Y6+Vbfcp4IkcOQjjaoDTbYV4JnoWhHoJih6xH19JaJqHUbXOztNj1w==
X-Received: by 2002:a17:902:f745:b0:2ca:d874:c6cf with SMTP id d9443c01a7336-2cb97e47abbmr1611025ad.4.1783098443853;
        Fri, 03 Jul 2026 10:07:23 -0700 (PDT)
Received: from parrot.meuintelbras.local ([45.179.5.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c876ea9sm19643688c88.13.2026.07.03.10.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:07:23 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v2 6/7] docs: pt_BR: process: translate contribution maturity model
Date: Fri,  3 Jul 2026 14:05:46 -0300
Message-ID: <20260703170552.174764-7-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703170552.174764-1-danielmaraboo@gmail.com>
References: <20260703170552.174764-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Translate the 'contribution-maturity-model' documentation into
Brazilian Portuguese, ensuring strict alignment with the upstream
source structure and language.

The translation covers the Open Source engagement framework proposed
by the Technical Advisory Board (TAB), detailing Levels 0 through 5
of organizational upstream maturity, community metrics, and engineer
career alignment.

Additionally, maintain strict 80-column line length restrictions
across the entire file to ensure proper Sphinx HTML rendering.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../process/contribution-maturity-model.rst   | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/contribution-maturity-model.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 4a13b3d14..749c5fc3f 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -76,6 +76,7 @@ kernel e sobre como ver seu trabalho integrado.
    Como começar <process/howto>
    Requisitos mínimos <process/changes>
    Conclave (Continuidade do projeto) <process/conclave>
+   Modelos de Maturidade para Contribuição no Kernel Linux <process/contribution-maturity-model.rst>
    Manuais dos mantenedores <process/maintainer-handbooks>
    Processo do subsistema de rede (netdev) <process/maintainer-netdev>
    Processo do subsistema SoC <process/maintainer-soc>
diff --git a/Documentation/translations/pt_BR/process/contribution-maturity-model.rst b/Documentation/translations/pt_BR/process/contribution-maturity-model.rst
new file mode 100644
index 000000000..bb003c4cd
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/contribution-maturity-model.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================================================
+Modelos de Maturidade para Contribuição no Kernel Linux
+=======================================================
+
+
+Contexto
+========
+
+Como parte do Linux Kernel Maintainers’ Summit de 2021, houve uma
+`discussão <https://lwn.net/Articles/870581/>`_ sobre os desafios na
+contratação de mantenedores do kernel, bem como a sucessão de mantenedores.
+Algumas das conclusões daquela discussão incluíram que as empresas que fazem
+parte da comunidade do Kernel Linux precisam permitir que os engenheiros atuem
+como mantenedores como parte de seu trabalho, para que possam crescer e se
+tornar líderes respeitados e, eventualmente, mantenedores do kernel. Para
+apoiar um fluxo forte de talentos, os desenvolvedores devem ser autorizados e
+incentivados a assumir contribuições no upstream, como revisar os patches de
+outras pessoas, refatorar a infraestrutura do kernel e escrever documentação.
+
+Para tanto, o Conselho Técnico Consultivo (Technical Advisory Board - TAB) da
+Linux Foundation propõe este Modelo de Maturidade para Contribuição no Kernel
+Linux. Essas expectativas comuns para o engajamento da comunidade upstream visam
+aumentar a influência de desenvolvedores individuais, aumentar a colaboração
+de organizações e melhorar a saúde geral do ecossistema do Kernel Linux.
+
+O TAB insta as organizações a avaliarem continuamente seu modelo de maturidade
+em Open Source e a se comprometerem com melhorias para se alinharem a este
+modelo. Para ser eficaz, essa avaliação deve incorporar o feedback de toda a
+organização, incluindo a gerência e os desenvolvedores de todos os níveis de
+senioridade. No espírito do Open Source, incentivamos as organizações a
+publicarem suas avaliações e planos para melhorar seu engajamento com a
+comunidade upstream.
+
+Nível 0
+=======
+
+* Engenheiros de Software não têm permissão para contribuir com patches para o
+  kernel Linux.
+
+
+Nível 1
+=======
+
+* Engenheiros de Software têm permissão para contribuir com patches para o
+  kernel Linux, seja como parte de suas responsabilidades de trabalho ou em seu
+  próprio tempo.
+
+Nível 2
+=======
+
+* Espera-se que os Engenheiros de Software contribuam para o Kernel Linux como
+  parte de suas responsabilidades de trabalho.
+* Os Engenheiros de Software receberão apoio para participar de conferências
+  relacionadas ao Linux como parte de seu trabalho.
+* As contribuições de código no upstream de um Engenheiro de Software serão
+  consideradas em promoções e avaliações de desempenho.
+
+Nível 3
+=======
+
+* Espera-se que os Engenheiros de Software revisem patches (incluindo patches
+  escritos por engenheiros de outras empresas) como parte de suas
+  responsabilidades de trabalho.
+* A contribuição com apresentações ou artigos para conferências acadêmicas ou
+  relacionadas ao Linux (como as organizadas pela Linux Foundation, Usenix,
+  ACM, etc.) é considerada parte do trabalho do engenheiro.
+* As contribuições comunitárias de um Engenheiro de Software serão consideradas
+  em promoções e avaliações de desempenho.
+* As organizações relatarão regularmente as métricas de suas contribuições em
+  open source e acompanharão essas métricas ao longo do tempo. Essas métricas
+  podem ser publicadas apenas internamente na organização ou, a critério da
+  organização, algumas ou todas podem ser publicadas externamente. As métricas
+  fortemente sugeridas incluem:
+
+  * O número de contribuições ao kernel no upstream por equipe ou organização
+    (por exemplo, todas as pessoas que se reportam a um gerente, diretor ou
+    vice-presidente).
+  * A porcentagem de desenvolvedores de kernel que fizeram contribuições no
+    upstream em relação ao total de desenvolvedores de kernel na organização.
+  * O intervalo de tempo entre os kernels usados nos servidores e/ou produtos
+    da organização e a data de publicação do kernel upstream no qual o kernel
+    interno se baseia.
+  * O número de commits fora da árvore (out-of-tree) presentes nos kernels
+    internos.
+
+Nível 4
+=======
+
+* Os Engenheiros de Software são incentivados a dedicar uma parte do seu tempo
+  de trabalho focados no Trabalho no Upstream, o qual é definido como a revisão
+  de patches, atuação em comitês de programa, melhoria da infraestrutura central
+  do projeto -- como escrita ou manutenção de testes, redução de dívida técnica
+  no upstream, escrita de documentação, etc.
+* Os Engenheiros de Software recebem apoio para ajudar a organizar conferências
+  relacionadas ao Linux.
+* As organizações considerarão o feedback dos membros da comunidade em
+  avaliações de desempenho oficiais.
+
+Nível 5
+=======
+
+* O desenvolvimento de kernel no upstream é considerado um cargo formal, com
+  pelo menos um terço do tempo do engenheiro dedicado à realização de Trabalho
+  no Upstream.
+* As organizações buscarão ativamente o feedback dos membros da comunidade como
+  um fator nas avaliações de desempenho oficiais.
+* As organizações relatarão internamente e de forma regular a proporção entre o
+  Trabalho no Upstream e o trabalho focado em atingir diretamente os objetivos
+  de negócios.
\ No newline at end of file
-- 
2.47.3


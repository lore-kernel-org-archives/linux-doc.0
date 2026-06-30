Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB29A47278B
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 20:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782851220; cv=none; b=mTkc5Sh1eWZzwkwJKlMTWfAaZcG+4DmOwbkE4ZQAJOalOe98m2MwK6PWuBZmtJH8n4UMa3WfIOA4Tq17tHAe4R/64WWftA+MpQPglRPW7MUccAGrbNZpvjid2BmlOHLi4hBTslnzXAYdfX64196jcORJW7wPqJDO5cMS7oiOENE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782851220; c=relaxed/simple;
	bh=bpN/MDIIPVlq0ec3N+M+qJEuhunTMf4ri+T/r8MobEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q7FP4xJ+B/BAjXeVJHnPTt/CSNzmkkzf/l5k2uLl7UglPik3rpuK7uwK0+VtJwiMnE2GclParrflSKWH58G/+Ub1Ogzt8CxZhqRJihqyzSNqqbNx2B1iGfRm06ku1hQpHEFomMegg1p6s/MekacV1zYG/8eGuINzlFRIG3rWSgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0iqczRl; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0iqczRl"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30eac9abd79so4811454eec.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 13:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782851218; x=1783456018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIurjtpSRTbX1yfKFmCbh0TjGqX3s3Oq1dSt/WdoJrw=;
        b=W0iqczRlCffVOoARJ1R64rqDnVAHRcWL1tHjETLf4ZK+JDdagtHTE3sS984cnO8TZ0
         3LOWCQE/s6lYZGjRcPFzPaY/Z5/hJuNL331WTZEA/28nmhXfSQGohJUp8464hBrdC8Kx
         YlrnwBM7OZ3iMgZog3CFCh4IaotUJYTbPuyCD+Q+hP62PIpaucUCKVbCVBnKsvk6M2Pq
         Fz7XS28nDyypvne+P++8msm+bgyqhE9mXRun0js32QqxSE5S55Wg5sdV9a2ZWg1HEBK8
         trCwYphOV7O9SMmQLcXQNzj0fioyo/2O8dTf+mg3wdCalbzui94nD8zahQmoBXhCqiN+
         7V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782851218; x=1783456018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AIurjtpSRTbX1yfKFmCbh0TjGqX3s3Oq1dSt/WdoJrw=;
        b=GgL0KntyXZBiWUwdmkif8WQy7PP0H3earil8PQKEDR0fxEVO+Z8TP/ZxBiqkAdKWcx
         u9BROsrnxjHJ7I7KQelf7kcsuT+gZYZKszObi/d6b3zMmC2TTh5nkqYsITtiPWRHiSDw
         AS307mKLTGwCdZ7ogSeiPlH/B8yO2sIDYyWnxYXd6mW0yNsmSSjJ5j/Er37g3gQvaOrQ
         wsDA/0/65P/QJvpzqMAhebY9xutfu48UYC0IzQteNcqzkFWwCv/LJs+5Qd/K7FGsE4rg
         C8Non2sbOAPfFvuzgVAQD6Y1jukrJGnfl/qe6yJLdab+lRrkhDDawiM6AOJ2jWDtUonC
         r05A==
X-Gm-Message-State: AOJu0YyTeF9ik2corJS/aUA7PeKoBy0nSUaHROqD3hhWrJYw3emCZ92c
	uIgHLOKHhiv0St69QaJyVPBmp23GgghOxE1XfgAJaVuvQC1Qi7+o2xF5
X-Gm-Gg: AfdE7ck1UGtcNVX+E7QBOimeWyfep+lVIiTg5MgG3YwT0cPpobQKqfoOBg8hIs+hGsg
	xmLaZFPqjPhO0AX7w1aX9i0GzaeIGoNfGvkTNXyxIBY1vHjnrzmORx89oNG/tXrkRvRspmcejKr
	4tuvcQO7W4dokusJHj2cpINq7+ox9yARPMovGZDA8kAaN8mMXmmJKKGivDh5mmDTZqxI5Hkn55C
	RhJrlX3AdoLQgjon5K7KzDZcBbElRz+qr5I45Lj7L2nuQKM6bbmA1PO5or8adTCJ88p2TotpNsS
	XUDMP+tdtemWMYmMb8oeabtNUFkyZ6LVPdJj4Hdmf7L/QTayig1VTR1uR7tBO7QESgOtRuUHDqV
	m+AxgdIV1vs9BDMevtcBtDJ4Nt2mxCGKmOoMDLEFUh3oV8ARmyr1LuUZtAgMdmhHvybfXn1BaiR
	LAa6EH8Va4X/RmdHYyqMK2tolHo33HlcOBQjDZXUicTPmr6UANQqjK8n8VLBPUzpiwm3tlSZAP0
	sf23AV64GHe00GVeSr8yMg=
X-Received: by 2002:a05:7300:760a:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-30ee1229a87mr4214843eec.17.1782851217701;
        Tue, 30 Jun 2026 13:26:57 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fbe011sm11157638eec.9.2026.06.30.13.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 13:26:57 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 6/7] docs: pt_BR: process: translate contribution maturity model
Date: Tue, 30 Jun 2026 17:25:40 -0300
Message-ID: <20260630202549.278894-7-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630202549.278894-1-danielmaraboo@gmail.com>
References: <20260630202549.278894-1-danielmaraboo@gmail.com>
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


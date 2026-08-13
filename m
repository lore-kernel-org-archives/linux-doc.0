Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD93477E2A
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628870; cv=none; b=ZI3MZNLIFVlKPwMEy5m+ip9vzHXETaYKBzXNslEP+myI5vymPXRXYxEjTwXQ8PAzaI3zLCc+/l/uWl8cT1e/X8cCn/f8GHWZIs27OvGQXshGJ/Hc6nUuIDkLNmamTdRCLkMWw94kXTih+sM9KzVg3eWOOG8Wzr0jTap2feXs2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628870; c=relaxed/simple;
	bh=UZrb7VRvySDBHKqzjQDIKFdGUTi5b65jUTXLTKusWuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BuU+dVZFT++Op+hBRLcLlcX3tZdhHTJVso3gzvYfLGjCbC9EWpBl4jujouOzw5OiMiuNGChZZONUMsxdaB6drdzTfmfFGxCZxy6OQc7YPwua7xYDq79ZzY3fuliR0k8FShTeRHvHE1wysfPj2EF7ILV0phFvNoRBHK49uPx/kpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sh+DvyWS; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sh+DvyWS"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2289754a12.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 06:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628868; x=1787233668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRo6rWR/N8SaaRIjDum9BhWzE5GlfAM9ECHVjvqDwOE=;
        b=Sh+DvyWSQ7lXO8HdYkVgvw0KHvHPiHogLlsPXKTxEQnU2Ah6Bf/0Gax5oeVXm0YiWH
         aLA2D0EUwSdLM2b1PowMdoBpddQuHf3MWnf/jMAxbsmVneJhGZglyJROXSl4nxydY5JM
         EqatOfR3EuYk3wMURqGNNSpXE+ARssp/BMiL/ehmGh4/VeiEpaOTvUOMbDgkkDiP5Sok
         SqGR7NMdZngFWf/1Uv1/AO6oEQtdqq13dOgg/VnLVxH4LMqVLXPq/9eWzf2EioWyjMoT
         OGz78yaHrybjmDuMJAi5ngBjs9wr9ZoFBIK1Ty/o5CBljD8zTqjPWDF7Lsp1SgfO4tjS
         kCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628868; x=1787233668;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dRo6rWR/N8SaaRIjDum9BhWzE5GlfAM9ECHVjvqDwOE=;
        b=Ijl+g4RZ3sGWZPmpMvmSJwUXjqcCPIjeOY7MWlwy4lM3pC9Cmc1T3P9iKR0y5GvkSi
         k5kBA+ypFtamJSE2jLJcM3fkrUjVmnX5M1yokX9bwegFlDdiskFr9S3cq3HU77EVUU3a
         rVbkIMEbmBKI1jStAVxc4AzSKgOsgi+7v3HYACPuqKqsXHlFC1TNEokekxsEHOloJO6B
         DmcwNXSvjcvxIfPKtPzxxyDRXfSrgjfhBzq7mjuhSpsFmL2YO1S+xAHWlk7b0UnKrWCu
         6JDt2xUyvgj2Wo5LUB1QWiK1AHS+y5D2U+pCKm7rQjsAfD1qyDZrk3ho3xn8/CrPUY3g
         gpgA==
X-Gm-Message-State: AOJu0YxFFwhfBO1lj2g2+MyThMRhbNJGgJ8AzpSzcJ1r1GvFN6sm922Y
	FjQjseH0sdBIPnLmVOVJ64l4sy1KAZLZ8unja3IYl0ndfVmdjxoAfeSI
X-Gm-Gg: AR+sD10rW6X8xCcP9NsjJNPW0EjYBSv4XxeearozTcpCe1LyX/4kheb2jJDLndDA3ED
	sbrz5UEq/pAB3pqNgnC7ySvOclAEkt3QJ2j0RB55w7Ny6INmMvDqV2DDCvu+mzCJfBbAULfq1jO
	T4+Gn+Fwo/iO/AVMPS4Zt8Rkx7C+hz4TCdF8zSuq2WLFXFg0r4VRJiMfL6/hy0jOLDU/XxXG676
	awdjT/fcHQmSIixTfh+0g+w5lYLxlJQIGLBjT4ZGdfPKAZ5qnNaC4z47n1NCRQZqH//1aOhWy6S
	LigFWaLdS4FUJhUh+iM2nH9F3gSATgIoOqfKq0LJknYvUUtlJNC8jENMXx6c7Sw8wqjxmgAwUSJ
	6uKl3Zljtf4xm2P+0bixpTukBVX9G5O7UM19bTaJPVWb9VcavtB8hZa1FHcEUyWijgxWaJ03Wi8
	WsOJMELeFtcZEAYqr3NwqpZ/EppBq3tuL/qPan13bIjJMHukCWmbPZ8p1WfrB46U4OgoZ5Ydm/n
	qcbMt3hI5nCCvcQi21zTaecjYV4pmp0OpmQY2+Bypf9jNjJ7mlUUkr+bGs9xE3z/5/RWLE6Dy9h
	5+EyPq6hE+ayGtK0Ow0=
X-Received: by 2002:a05:6a21:10a:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3cc55044176mr8986748637.13.1786628868181;
        Thu, 13 Aug 2026 06:47:48 -0700 (PDT)
Received: from localhost.localdomain ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412d8bd946sm9687887c88.5.2026.08.13.06.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:47:47 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH] docs: pt_BR: Reorganize process/index.rst to follow english structure
Date: Thu, 13 Aug 2026 10:47:39 -0300
Message-ID: <20260813134741.11025-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

The main index.rst file for the pt_BR translation was grouping all
translated process documents directly in its toctree, which frequently
caused patch collisions among contributors.

Following Jonathan Corbet's suggestion, this patch introduces a new
pt_BR/process/index.rst that mirrors the subsection structure of the
English Documentation/process/index.rst. The translated documents are
now organized into their respective categories, rather than a single
flat list.

The root pt_BR/index.rst now simply references process/index.

This matches the upstream categorization and significantly reduces
merge conflicts for future pt_BR translations.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |  27 +----
 .../translations/pt_BR/process/index.rst      | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/process/index.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 1462b62d8..462267e92 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -66,29 +66,4 @@ kernel e sobre como ver seu trabalho integrado.
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
-   CVEs <process/cve>
-   Conclave (Continuidade do projeto) <process/conclave>
-   Informações sobre clientes de email para Linux <process/email-clients>
-   Modelos de Maturidade para Contribuição no Kernel Linux <process/contribution-maturity-model.rst>
-   Manuais dos mantenedores <process/maintainer-handbooks>
-   Processo do subsistema de rede (netdev) <process/maintainer-netdev>
-   Processo do subsistema SoC <process/maintainer-soc>
-   Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
-   Estilo de gerenciamento do kernel Linux <process/management-style>
-   Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
-   Adicionando uma nova chamada de Sistema <process/adding-syscalls>
-   Declaração sobre Drivers do Kernel <process/kernel-driver-statement>
-   Lista de verificação para submissão de patches do kernel Linux <process/submit-checklist>
-   Interpretação do Código de Conduta do Kernel Linux <process/code-of-conduct-interpretation>
-   Código de Conduta de Compromisso do Colaborador <process/code-of-conduct>
-   Interfaces, recursos de linguagem, atributos e convenções obsoletos <process/deprecated>
-   Falhas de segurança <process/security-bugs>
+   process/index
diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
new file mode 100644
index 000000000..5cecc0300
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -0,0 +1,104 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. raw:: latex
+
+	\renewcommand\thesection*
+	\renewcommand\thesubsection*
+
+.. _process_index_pt_BR:
+
+===============================================
+Trabalhando com a comunidade de desenvolvimento
+===============================================
+
+Então você quer ser um desenvolvedor do kernel Linux? Bem-vindo! Embora haja
+muito a aprender sobre o kernel em um sentido técnico, também é importante
+aprender como nossa comunidade funciona. A leitura desses documentos tornará
+muito mais fácil para você ter suas alterações integradas com um mínimo de
+problemas.
+
+Uma introdução sobre como funciona o desenvolvimento do kernel
+--------------------------------------------------------------
+
+Leia estes documentos primeiro: entender este material facilitará
+sua entrada na comunidade do kernel.
+
+.. toctree::
+   :maxdepth: 1
+
+   Como começar <howto>
+   Guia do Processo de Desenvolvimento <development-process>
+   Lista de verificação para submissão de patches do kernel Linux <submit-checklist>
+
+Ferramentas e guias técnicos para desenvolvedores do kernel
+-----------------------------------------------------------
+
+Esta é uma coleção de material com o qual os desenvolvedores do kernel
+devem estar familiarizados.
+
+.. toctree::
+   :maxdepth: 1
+
+   Requisitos mínimos <changes>
+   Informações sobre clientes de email para Linux <email-clients>
+   Como aplicar patches <applying-patches>
+   Backporting e resolução de conflitos <backporting>
+   Adicionando uma nova chamada de Sistema <adding-syscalls>
+   Como não Deixar as ioctls malfeitas <botching-up-ioctls>
+
+Guias de políticas e declarações de desenvolvedores
+---------------------------------------------------
+
+Estas são as regras pelas quais tentamos viver na comunidade do kernel
+(e além).
+
+.. toctree::
+   :maxdepth: 1
+
+   Regras de licenciamento <license-rules>
+   Código de Conduta de Compromisso do Colaborador <code-of-conduct>
+   Interpretação do Código de Conduta do Kernel Linux <code-of-conduct-interpretation>
+   Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
+   Declaração sobre Drivers do Kernel <kernel-driver-statement>
+   Estilo de gerenciamento do kernel Linux <management-style>
+   Conclave (Continuidade do projeto) <conclave>
+
+Lidando com bugs
+----------------
+
+Bugs são uma realidade; é importante lidarmos com eles de forma correta.
+Os documentos abaixo detalham políticas e conselhos em relação ao
+gerenciamento de bugs e vulnerabilidades.
+
+.. toctree::
+   :maxdepth: 1
+
+   Falhas de segurança <security-bugs>
+   CVEs <cve>
+
+Informações para mantenedores
+-----------------------------
+
+Como encontrar as pessoas que aceitarão seus patches e manuais úteis para os
+mantenedores de subsistemas.
+
+.. toctree::
+   :maxdepth: 1
+
+   Manuais dos mantenedores <maintainer-handbooks>
+   Processo do subsistema de rede (netdev) <maintainer-netdev>
+   Processo do subsistema SoC <maintainer-soc>
+   Conformidade de DTS para SoC <maintainer-soc-clean-dts>
+   Processo do subsistema KVM x86 <maintainer-kvm-x86>
+
+Outros materiais
+----------------
+
+Aqui estão alguns outros guias para a comunidade que são de interesse para
+a maioria dos desenvolvedores:
+
+.. toctree::
+   :maxdepth: 1
+
+   Index de documentos do Kernel <kernel-docs>
+   Interfaces, recursos de linguagem, atributos e convenções obsoletos <deprecated>
-- 
2.52.0


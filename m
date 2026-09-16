Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7BF51E445
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 17:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580532; cv=none; b=t6S0Mxr77cqaJDs7X27ZiWiK/PBuZI1D9Xr1UkZWJ1t/Yx9ZUlGOsfDs7r062mmO+scPNOqSTq+HYx3u4COqymw3CJJH1+GKsThn5u6RocAN1gyEPlWw1XMos4U7sroR9Jbu8gXaWdE8j5+Yvu92GobWK5AuwzcPK5YpTSy37lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580532; c=relaxed/simple;
	bh=bjadOHc4/vehi9vHWqzlEkrOfUUFcVknoh6lPFiHxNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NJgIXwALKzgaTYNDuL2NBDgKLszaDjBHGqV9YAwUUIN2Aurgb9l6ZDZKn2/RdlgY64czU+5VOFawiiIPDJvsuWAIJ8oKAqSxH39UFxDYoeoWxRa4XVpJrCVTy7mJy1qzAaS+Mc2rVzrn7wC9MJqOuydSsHN4OokqlUChCMg8gPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR9GfIY0; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR9GfIY0"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c537df4daaso663875b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 10:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580514; x=1790185314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w4plynHVuY4qA+W9T1O9/ln8MmErO59cL852oYyBo6Y=;
        b=cR9GfIY0lifN6WRJE5JiAc85rWNqkzVtakfXQeqCXi7S2R6oT39IUBW0KatPGeOcjM
         NoexgD6+w0sgqQDzR48Tvd3bNR/4MOFbuMVWsKLgrZjhSSSxh2kTEOb4rgFH4N/WmnsA
         OYTzaF0kIQmrN3Uw4YPPJsg+pIEcLfmZQ4H24nMw7GHoFfGjUJ/Uo6d3SWiUSeZPVWRM
         GZwTCkvr2ZAo9wB/LJWmAh4uan2SlqPoYctGNBdfo9YXjYKQDi7IkHr/1ubb8ilN6lRO
         plZ4TLtqsC2XcMcJPoJXSbLj+0hplODDXbFXmpgPtffs4gTosN+zHf1cb1Pf7Mknc1j+
         6Zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580514; x=1790185314;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4plynHVuY4qA+W9T1O9/ln8MmErO59cL852oYyBo6Y=;
        b=19nDjOo51lVy/3j7CPQeowIi0OZ10Vsim2OuzQMH0vit9sVi577dWPTPdtRqijb3RV
         gL3mce11QxjduOSYgUli5y7pd7y6myHXEUx1DPuudkfvnz1KPUB6H3rMbXtd8OI1krzg
         jdsndptFHLS2BtHFIaloE0p7bOT2dnAfYvVKzhKwHRFV1Qart08I3gAQbXhxiae7hEHh
         R3WFrBos4ERvyWuSYb8GfUS/1lMnxTEFCkZ+gMlByNu288vfnIhCKrI6I5X37eRfjbLk
         ztxAoSk1kgVtmAJ9+qYEw5MHE/j02cFvLji/uU/TN+hRpupwzHcHsNi299laDqWYT7wy
         qd5A==
X-Gm-Message-State: AFuF++lkeHwHhq59x3bWxRFrheEoXIAnmKyBxia3ISriZCrdCSlyt0is
	hfT46Y+fXhW3asQwd8+nbEuOfUs3gYYSRWXpf5We8CwjRrP10ckGAsI2+ZKwpsIXvkc=
X-Gm-Gg: AYBFou0j2sychNHrUG9h5WWfbShSWXBBxcjgGNbKjNctV5mVoBnQCwXCwJp8uDQI17w
	R940vy1IgB/ro8X4QTXu8b03aLOoxqXynXFjqOgGq5ZC2UsaOfu4NQgiOFd18ZQ6U3NlnUyDWTm
	03ncxsoGLq3RTI+V0fyIbD1dDnCBKZNVgsxAHtsy/y+yqu1xzyNeJ8qvOb0D5w+mxvkO71cAaSt
	M7wOsNlrI4PUD3iHR9KO9G1bPtpqRE3esEVsQ1461016NEzC1hd6yEHR+mE3BQvgM5MR/IrQn06
	ZWotJCGIWkYSt+j/VeWeUvFBEkAPGeURh0+G2FDKumUS+OOf0H/btfg0YaxgA5nI1oqo+KEgcY4
	Hsgar+hN8kogOKzuWXMyrelT4jzZCEpLntNBJ6jJc/U/cDXhds14EU7ZnIWGj8CILJtcdTiDpgK
	vZidekzu19Oy83Yrxhi++pd1pz1LUtJ45Rj5oAozavl1/fznCt9i3IRcCBSsrzSVGG2Rp6uMI5k
	LEXr/xDQVokndIoWTy/KrsOaV6kiOEnYPzHZQcjPyF65nOtxckEEpqiM8uruoq5kLA7cIMkEj+P
	w9/pHNgb92A68mF9yphuoZ/2rHCDwtx42UO7dFD8s1srvIlP4/FlxIKGGA==
X-Received: by 2002:a05:6808:10c9:b0:4b1:bc2e:3f60 with SMTP id 5614622812f47-4ca4a0e12a8mr3901148b6e.16.1789580513750;
        Wed, 16 Sep 2026 10:41:53 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d9999e8sm360668b6e.17.2026.09.16.10.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:41:53 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH 5/5] docs: translations: pt_BR: point howto.rst at the translated documents
Date: Wed, 16 Sep 2026 14:41:35 -0300
Message-ID: <20260916174136.48011-6-danielmaraboo@gmail.com>
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

The reading list in howto.rst referenced the English version of documents
that are already translated, so a reader of the translation was sent back
to the originals.  Add the four missing pt_BR anchors and repoint the nine
references that have a translation available; the remaining three have no
pt_BR counterpart and are left alone.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/applying-patches.rst        |  2 ++
 .../translations/pt_BR/process/howto.rst      | 19 ++++++++++---------
 .../pt_BR/process/kernel-docs.rst             |  2 ++
 .../pt_BR/process/license-rules.rst           |  2 ++
 .../pt_BR/process/management-style.rst        |  2 ++
 5 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/applying-patches.rst b/Documentation/translations/pt_BR/process/applying-patches.rst
index 37a8d804d..143603b99 100644
--- a/Documentation/translations/pt_BR/process/applying-patches.rst
+++ b/Documentation/translations/pt_BR/process/applying-patches.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_applying_patches:
+
 Aplicando Patches ao Kernel Linux
 +++++++++++++++++++++++++++++++++
 
diff --git a/Documentation/translations/pt_BR/process/howto.rst b/Documentation/translations/pt_BR/process/howto.rst
index bcedee727..54ea7fad8 100644
--- a/Documentation/translations/pt_BR/process/howto.rst
+++ b/Documentation/translations/pt_BR/process/howto.rst
@@ -67,7 +67,8 @@ Questões Legais
 O código-fonte do kernel Linux é lançado sob a GPL. Por favor, veja o arquivo
 COPYING no diretório principal da árvore de fontes. As regras de licenciamento
 do kernel Linux e como usar os identificadores `SPDX <https://spdx.org/>`_ no
-código-fonte estão descritas em :ref:`Documentation/process/license-rules.rst <kernel_licensing>`.
+código-fonte estão descritas em
+:ref:`Documentation/translations/pt_BR/process/license-rules.rst <pt_BR_kernel_licensing>`.
 Se você tiver mais perguntas sobre a licença, por favor, entre em contato com
 um advogado e não pergunte na lista de discussão do kernel Linux. As pessoas
 nas listas de discussão não são advogados e você não deve confiar em suas
@@ -94,7 +95,7 @@ a lista linux-api@vger.kernel.org.
 Aqui está uma lista de arquivos que estão na árvore de fontes do kernel e
 que são de leitura obrigatória:
 
-  :ref:`Documentation/admin-guide/README.rst <readme>`
+  :ref:`Documentation/translations/pt_BR/admin-guide/README.rst <pt_BR_readme>`
     Este arquivo fornece um breve histórico sobre o kernel Linux e descreve
     o que é necessário fazer para configurar e compilar o kernel. Pessoas
     que são novas no kernel devem começar por aqui.
@@ -104,14 +105,14 @@ que são de leitura obrigatória:
     software que são necessários para compilar e executar o kernel com
     sucesso.
 
-  :ref:`Documentation/process/coding-style.rst <codingstyle>`
+  :ref:`Documentation/translations/pt_BR/process/coding-style.rst <pt_BR_codingstyle>`
     Este documento descreve o estilo de codificação do kernel Linux e parte
     da fundamentação por trás dele. Espera-se que todo código novo siga as
     diretrizes deste documento. A maioria dos mantenedores apenas aceitará
     patches se essas regras forem seguidas, e muitas pessoas apenas
     revisarão o código se ele estiver no estilo adequado.
 
-  :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
+  :ref:`Documentation/translations/pt_BR/process/submitting-patches.rst <pt_BR_submittingpatches>`
     Este arquivo descreve em detalhes explícitos como criar e enviar
     um patch com sucesso, incluindo (mas não limitado a):
 
@@ -144,12 +145,12 @@ Outras excelentes descrições de como criar patches adequadamente são:
     do Linux e é muito importante para pessoas que estão migrando para o
     Linux vindas do desenvolvimento em outros Sistemas Operacionais.
 
-  :ref:`Documentation/process/security-bugs.rst <securitybugs>`
+  :ref:`Documentation/translations/pt_BR/process/security-bugs.rst <pt_BR_securitybugs>`
     Se você acredita ter encontrado um problema de segurança no kernel Linux,
     por favor, siga os passos descritos neste documento para ajudar a
     notificar os desenvolvedores do kernel e auxiliar na resolução do problema.
 
-  :ref:`Documentation/process/management-style.rst <managementstyle>`
+  :ref:`Documentation/translations/pt_BR/process/management-style.rst <pt_BR_managementstyle>`
     Este documento descreve como os mantenedores do kernel Linux operam e o
     ethos compartilhado por trás de suas metodologias. Esta é uma leitura
     importante para qualquer pessoa nova no desenvolvimento do kernel (ou
@@ -162,12 +163,12 @@ Outras excelentes descrições de como criar patches adequadamente são:
     versões estáveis (stable) do kernel e o que fazer se você desejar que
     uma alteração seja incluída em um desses lançamentos.
 
-  :ref:`Documentation/process/kernel-docs.rst <kernel_docs>`
+  :ref:`Documentation/translations/pt_BR/process/kernel-docs.rst <pt_BR_kernel_docs>`
     Uma lista de documentação externa que pertence ao desenvolvimento do
     kernel. Por favor, consulte esta lista caso não encontre o que está
     procurando dentro da documentação interna do kernel.
 
-  :ref:`Documentation/process/applying-patches.rst <applying_patches>`
+  :ref:`Documentation/translations/pt_BR/process/applying-patches.rst <pt_BR_applying_patches>`
     Uma boa introdução descrevendo exatamente o que é um patch e como
     aplicá-lo aos diferentes ramos (branches) de desenvolvimento do kernel.
 
@@ -435,7 +436,7 @@ individualmente, em vez de escrever tudo no topo do e-mail.
 
 Se você adicionar patches ao seu e-mail, certifique-se de que sejam texto
 puro legível, conforme declarado em
-:ref:`Documentation/process/submitting-patches.rst <submittingpatches>`.
+:ref:`Documentation/translations/pt_BR/process/submitting-patches.rst <pt_BR_submittingpatches>`.
 Os desenvolvedores do kernel não querem lidar com anexos ou patches
 compactados; eles podem querer comentar linhas individuais do seu patch,
 o que só funciona dessa forma. Certifique-se de usar um programa de
diff --git a/Documentation/translations/pt_BR/process/kernel-docs.rst b/Documentation/translations/pt_BR/process/kernel-docs.rst
index 3c8d80ffa..6235b1e7b 100644
--- a/Documentation/translations/pt_BR/process/kernel-docs.rst
+++ b/Documentation/translations/pt_BR/process/kernel-docs.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_kernel_docs:
+
 Índice de Documentação Adicional do Kernel
 ==========================================
 
diff --git a/Documentation/translations/pt_BR/process/license-rules.rst b/Documentation/translations/pt_BR/process/license-rules.rst
index 1e395dfea..7a801b2a4 100644
--- a/Documentation/translations/pt_BR/process/license-rules.rst
+++ b/Documentation/translations/pt_BR/process/license-rules.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_kernel_licensing:
+
 Regras de licenciamento do kernel Linux
 =======================================
 
diff --git a/Documentation/translations/pt_BR/process/management-style.rst b/Documentation/translations/pt_BR/process/management-style.rst
index c40b19b90..9d067e046 100644
--- a/Documentation/translations/pt_BR/process/management-style.rst
+++ b/Documentation/translations/pt_BR/process/management-style.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_managementstyle:
+
 Estilo de gerenciamento do kernel Linux
 =======================================
 
-- 
2.47.3


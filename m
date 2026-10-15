Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E764A485F
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 11:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064073; cv=none; b=qyHTarMmSF6LhSVpVsHlZQ/cMtziitQeT2Jfg6H0mH5HPocN1eAHQdeYbyCDGqtUwz1tS4fIJGw4ua5NrWSgDwB2ZU2RKui/boAKS8LW4BNVME42xYK0CO87V83KhsEQXxEUaHXZ9dyz5eWo9I0MVQICIC49kO2Es0w2FyiT+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064073; c=relaxed/simple;
	bh=G2nt0s9kzoN0p96nqV3HDnJNP6hotYxAlGJVA6j5sDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AurysIQZaQhHe4Oh5gDpv81lF7myT/bU/U3l2bPEPxL68S9Q6n/eSZPHHxmKDVJksmPu25TaNgSnyFMLFzXtlWUiIJRRV4UH+utEKn6o8OMft9Cg5iNxX8CYo7qVekZx9SNmfgkn6rrHhJRxPgxFzEABkRx9LdnpL9w8vBOpKWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWlOb+a2; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWlOb+a2"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-354ba08cfd1so8601041eec.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792064063; x=1792668863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jQbix8wt4H7PrDpoKq1NKQBCds9xJFYPKLQaOq6fk0=;
        b=kWlOb+a2Ycmw7QR5YJsyOzzD8m9nrwJ7ToKxiqEhe0af/V4JhGgjbBhPrkXDPZpGoU
         /PPcD/dg5/ofTOlhiw8FvTlRZ8ewtg+OXu40oOCkza5J5EsS16UTLw/KuSgtMMuFTjt5
         yR6LdrG+vf5DwJ9NYVb0X4v7m2N0kbsk66DFTjorp0YhV9Bgyrxl5ELjl60BQzHMTOOr
         PaoOzHRloaXEDM56XHC0VXZie6gmr5XtP2huXYKs3ndNJ0YkCGWHjdwPtzFzN9tXiB6U
         qpZXaJzoMTfIfXAQI181MpZAGJu/44m/blRBhHNXpx+GLtIX7pLyxpaMJYU+Ij4syTCg
         JG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064063; x=1792668863;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jQbix8wt4H7PrDpoKq1NKQBCds9xJFYPKLQaOq6fk0=;
        b=Oku3fUUsWZWtrlGfRBWcwSfRLKnb5A68XD+/DcQ2phkCo+S0viUCcGEJMPX95wtHwX
         Y04/ClHc18wijikN6BdVm2jPI0C+3OUVoE2lGf1dbL/KnpCRRm7MjhsKIGIp4eR41dDc
         /Ll+gfQQFYd1e4KTmH+voPDo75W32FuIWzCm90zatLjMKrcoMJzI44X8zETM2Z4hBrZd
         2wvFuLDtWQmhDe/wj9qz06V2wePwCzTeapCjf2jnwYI1Fn7NkGJhdk+ExdAaKgvH+M5n
         r9fXypb5ZNDdJ6IYWI3zTSMSLzcobzcl4N6rxQG4aUOaal6WisK1a5mfZMI2ScbXjEwV
         XTBA==
X-Gm-Message-State: AFq9FYKpkuRMxA/N0DzzP7/wgR5QDxeVACPV1gvZRslo7oHZ33VgoGLi
	ue8wDrCkVSq0g29CX42EyAECcdPrzexJH1t63YRwZWGXKA6+jxr3OdCD
X-Gm-Gg: AYBFou1KitCig2VpKkaKbpVlgI9MH4OdTQH8V5fvq1Trp1bVhuYZnblA/CmqmOYZFxA
	bh8UGlAcThQv85PDm1zyhv5OpP5+YkzBh2wBQsaS9Jip5u2YeQzU/QsQFaGQ2TesmaFY/EaJFPh
	TnNleZVRw5s14kGvhfzo6e1nUJqqp1iOBwYN4NI+7R2nn2BfU0PsIhRwY2rwLRztn/prFxTg+F1
	o0fsA51jRN+VYNvqFQLEd/xQMk3dC0a7WGXcE6CdWWgbZ4V2z5YdTq8gKjeapKCDT7SkAlX/mpT
	bIleNyc1M0swEYpqPhP4PWFaaHaDAwgxy12W2er7jIxyWHYufhWPuF73a/Nc2OUJ19lRK51Dd/+
	H0el1/QGAokdnzU/oNt2+nwh/Njwwk21Dd4Kt1UsSwxmeyPqCbvyKePPYzW+B/DloFMwHLzNeCO
	lOSm75R0xi0a9Esawzz8EARCg2t7kq/xIKAP2OUC5GHbWkEHC7R9lGSz+YcRmOJYMBh8OtvoWFl
	ikU2w5NBkJ+0TvLWkJYhmW+67OBPcuhxIkRPNv6m1rGmxjwFCq6dXus17djUrzDZJoylH/GqyYq
	qPWfyIRhb3RmNYNNr91kum2cDRFARIuw2A==
X-Received: by 2002:a05:7300:7f21:b0:34e:f5f1:2f46 with SMTP id 5a478bee46e88-3537e03ef03mr26685682eec.6.1792064062467;
        Thu, 15 Oct 2026 04:34:22 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm69156913eec.3.2026.10.15.04.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:34:22 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2 03/10] docs/translations/pt_BR: admin-guide: add sysctl/index.rst
Date: Thu, 15 Oct 2026 08:31:11 -0300
Message-ID: <20261015113121.4550-4-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015113121.4550-1-danielmaraboo@gmail.com>
References: <20261015113121.4550-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add translation of sysctl/index.rst to Portuguese and update
admin-guide/index.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/admin-guide/index.rst  |   2 +-
 .../pt_BR/admin-guide/sysctl/index.rst        | 108 ++++++++++++++++++
 2 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/sysctl/index.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index 90f536bdb..878a88d71 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -36,10 +36,10 @@ com eles.
    :maxdepth: 1
 
    sysfs-rules
+   sysctl/index
 
 Todolist:
 
-*   sysctl/index
 *   cputopology
 *   abi
 
diff --git a/Documentation/translations/pt_BR/admin-guide/sysctl/index.rst b/Documentation/translations/pt_BR/admin-guide/sysctl/index.rst
new file mode 100644
index 000000000..dd52a1522
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/sysctl/index.rst
@@ -0,0 +1,108 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
+Documentação para /proc/sys
+===========================
+
+Copyright (c) 1998, 1999,  Rik van Riel <riel@nl.linux.org>
+
+------------------------------------------------------------------------------
+
+'Por que', ouço você perguntar, 'alguém iria sequer _querer_ documentação
+para esses arquivos sysctl? Se alguém realmente precisa, está tudo no
+código-fonte...'
+
+Bem, esta documentação foi escrita porque algumas pessoas ou não sabem
+que precisam ajustar algo, ou porque não têm tempo ou conhecimento
+para ler o código-fonte.
+
+Além disso, os programadores que construíram o sysctl o fizeram para
+ser realmente utilizado, e não apenas pela diversão de programá-lo :-)
+
+------------------------------------------------------------------------------
+
+Aviso legal:
+
+Como de costume, há duas coisas principais a se considerar:
+
+1. você recebe pelo que paga
+2. é de graça
+
+As consequências são que eu não garanto a exatidão deste
+documento e, se você vier reclamar comigo sobre como você bagunçou seu
+sistema por causa de uma documentação incorreta, não sentirei pena de você.
+Eu posso até rir de você...
+
+Mas é claro, se você _realmente_ conseguir bagunçar seu sistema usando
+apenas as opções de sysctl utilizadas neste arquivo, eu gostaria de saber
+disso. Não apenas para dar boas risadas, mas também para ter certeza de que
+você é a última pessoa lendo o manual (RTFM) a fazer essa besteira.
+
+Em resumo, envie suas sugestões, correções e/ou histórias de terror
+por e-mail para: <riel@nl.linux.org>
+
+Rik van Riel.
+
+--------------------------------------------------------------
+
+Introdução
+==========
+
+O sysctl é um meio de configurar determinados aspectos do kernel
+em tempo de execução, e o diretório /proc/sys/ existe para que você
+nem precise de ferramentas especiais para fazer isso!
+Na verdade, são necessárias apenas quatro coisas para usar esses recursos
+de configuração:
+
+- um sistema Linux em execução
+- acesso root
+- bom senso (isso é especialmente difícil de encontrar hoje em dia)
+- conhecimento sobre o que todos esses valores significam
+
+Como um rápido 'ls /proc/sys' mostrará, o diretório consiste em
+vários subdiretórios (dependentes de arquitetura?). Cada subdiretório
+trata principalmente de uma parte do kernel, permitindo que você faça
+a configuração parte por parte, ou apenas algumas 'modificações temáticas'.
+
+Esta documentação é sobre:
+
+=============== ===============================================================
+abi/		domínios de execução e personalidades
+<$ARCH>		controles de ajuste para várias arquiteturas de CPU (ex.: csky, s390)
+crypto/		subsistema criptográfico
+debug/		recursos de depuração
+dev/		informações específicas de dispositivos (ex.: dev/cdrom/info)
+fs/		sistemas de arquivos específicos
+		ajustes de manipuladores de arquivos (filehandle), inode, dentry e cotas
+		binfmt_misc <Documentation/admin-guide/binfmt-misc.rst>
+kernel/		informações globais / ajustes do kernel
+		coisas diversas
+		alguns controles específicos de arquitetura
+		coisas de segurança (LSM)
+net/		coisas de rede; para documentação consulte:
+		<Documentation/networking/>
+proc/		<vazio>
+sunrpc/		SUN Remote Procedure Call (NFS)
+user/		limites por namespace de usuário
+vm/		ajustes de gerenciamento de memória
+		gerenciamento de buffers e cache
+xen/		controles do hipervisor Xen
+=============== ===============================================================
+
+Estes são os subdiretórios que tenho no meu sistema ou que foram descobertos
+pesquisando pelo código-fonte. Pode haver mais ou outros subdiretórios em
+outra configuração. Se você encontrar outro diretório, eu realmente gostaria de
+saber sobre ele :-)
+
+Todolist:
+
+*   abi
+*   crypto
+*   debug
+*   fs
+*   kernel
+*   net
+*   sunrpc
+*   user
+*   vm
+*   xen
-- 
2.47.3


Received: from mail-vs2-f35.google.com (mail-vs2-f35.google.com [74.125.227.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414355013A8
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961122; cv=none; b=kNLA8SY6rSDsDYU0ivS2lLumSFWciTz59A8tmJFajyLXA1ziUvLZT0qxza5HMktwWpZqH/iDsgxPFSVf+4Ebrx2HpjxcSllNo12gptZnncsNu57yqVubHPTvOiULRds5COdWs/iIOzcXyYuuDDQiigwsJFD4pHTj8LO1snZoTis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961122; c=relaxed/simple;
	bh=G2nt0s9kzoN0p96nqV3HDnJNP6hotYxAlGJVA6j5sDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eP/GX/DYdlBThAEm45C5jr8ja44PwBxejsr+bW7cxNPODKhuHbBiMmAWZ1zMNHrZtIwULSsA+/dmSNBmx2GdQdWzDSk/NP0gKJJxCrYF8b7nSBzjlQOmFvrO+smoOk+4usxXHXLUOqzdaAqxxGh3TuDPp+ehmcsMHrCpey5Ymek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7/EW5fD; arc=none smtp.client-ip=74.125.227.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7/EW5fD"
Received: by mail-vs2-f35.google.com with SMTP id ada2fe7eead31-7bf9eb881f7so1316774137.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961109; x=1791565909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jQbix8wt4H7PrDpoKq1NKQBCds9xJFYPKLQaOq6fk0=;
        b=h7/EW5fDnQnUXNUpbWNx5dFjqXtxTnc/PzRPGXwzFxx9OBpHwuTEYTTSMdyzbsmD3a
         IVCTDUtlAcChsKlpzHlJPnzCtwxbyogjypMSI/uIouQ6gtnwD7+x2TO+s+6uMpv3MiPq
         viyYsVjMisDhh2mImPir2KjLQ90e3iweITpP81Xy1egD2maY4c/i9H71IhqAOf8KGYdG
         GQGp48FLXWDU6d39JenOmyMmSR1uZ+/ERzlNc5bk/aqRyj1yvHI7e/fPI6RzGdm519Kv
         rdUi8aSFXCJO81/QoMKWloXDaEZKRiNwKSo4RaKuvOqAs2nS4HSJuGvSUtISSI/bmU1Z
         ZzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961109; x=1791565909;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jQbix8wt4H7PrDpoKq1NKQBCds9xJFYPKLQaOq6fk0=;
        b=QC2AR+OgHPfFPt4YXIx6VsZ1iRCTUqcIjv0+CDLd/nImv0Ba+34OIYT3VDDTYg8OxM
         ZeoLcEmLlKrGqtM5CmDNbvXy28kaff/r3QjDYtubw6on7yYBu9evH9JQlGR4VvyV0eSz
         sso0LKfa5vPs3LVC9eNX2zKW1lKOCvIsa9Yyqy4JoXmKdxTAUvu+V/stEyL+Q2DSBE8q
         1A0PR2YQ6AHZwgmtjBQDb89ykk4NBBINvHt8r/Mht/ffks1Y4aL4T3Zg4PMRBHEpiiWl
         QFtExegzWuXrOgpjDv9tcgFlZTCRLHa+CmaxfOnyBRD2bNuKTaxvDSky5Aeiej0ZB459
         ftKw==
X-Gm-Message-State: AFq9FYIVWFEEfoXdRYbBKYB6V/LCawZrK9sJEX8Biu/FepDiR6nxa0h6
	0POaUIBIsJGyL9+woXK2jHFMMZnPuhvvrlABFJ2x1vdh3fOnRLlj91YaPcX3g9iS
X-Gm-Gg: AYBFou35Sp1sK2LDP2VAJr9RYvCZxtbAkRGVuDzrgnB+5uVj5U7S+H36gLFNQ0NKFLl
	5vZbBv1AWkv5PBt76JPpUS+ElLg91tT0cIaeT4ztUGkNO5217/MrptOWrUp/soiCArSTotEO2FN
	80R3lHOv3e6pTa8BmHxgFT2gZqjZvpGhQEvTgdiccLDNIRCXifOhd1oA1NFGPlKj+ck5qF10YIq
	pwowD5ND15ww6hu3RVKsz1DOjKDeVSxVxpruCmXOSoxwUIEMRNiKcrmMoB2g3+0sYQxm0hDMPuT
	HgaJGrLLDsG2aXkleY/YCIIWMiENwWQp5v5DacbpGp+V1d5kFbhZf/JC3+0eiCmUZkTbvm9LGfN
	0xr47w+sBMbRTWrCI8mpO9IdnaI3hjZGIwYql/8750BbxKCUe8TF+xSj2MPpoFJM40Lwzq2jN5n
	u9BBx7MzdV+Fhgs2yjteefgBEY1+mFUYiX6J6UNW3WnzBroDI28wDqgvQwqMuF6XBWiT9a7tzZJ
	LK4zYvpNUSq7Iv4NfK7vRf3KG6AwMRDDyWXGpe7Zec7+X2XdHTotw7xgspzh2VPb/fwiEoxNKE/
	+ggkjN25VxSKzsM3LrSRnT4=
X-Received: by 2002:a05:6122:3d06:b0:5d4:7441:1671 with SMTP id 71dfb90a1353d-5dab28cb1bcmr1222423e0c.19.1790961109401;
        Fri, 02 Oct 2026 10:11:49 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da635c7209sm3947605e0c.15.2026.10.02.10.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:49 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: [PATCH 03/10] docs/translations/pt_BR: admin-guide: add sysctl/index.rst
Date: Fri,  2 Oct 2026 14:11:26 -0300
Message-ID: <20261002171133.50969-4-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002171133.50969-1-danielmaraboo@gmail.com>
References: <20261002171133.50969-1-danielmaraboo@gmail.com>
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


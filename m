Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830190;
	b=32O8LefojdIBpiGyXyPcII5rs3OJEiQy9Z75p9aPIXynoeIKN8pURwRYGs2e7lNbDlGd
	 oXoQeKGeEGHmnljObYreOd5ry+IDt+smKbdVEH1qnNvgYUAnEmCVOtJL07SyG5qf7Do7v
	 V/uqSkLwPzL1DdpgZAGhm2Gwyiihz+DFdteppX4s4jY7I6NWOhcnR+/8SMLIQ9EKCsc5T
	 Xh1hBV5hgZebswSssmvNGbvVyf4fi5X6lJyy65AOFansOqA+shUMPxLPUm/5zC1dnGaUt
	 CguxAO7axnQz80IzijEvb0dBaqNgeWv+C/noietz6927c3ZEj0iBQnBl25xLWWUElKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=vRuWX14oDec4PUivP0BVmuEKPbHN3NfZUe1eLUxKBfM=;
	b=sJa6+CkR5LNBjNhrNlcgWqUN/D9IWyhPv7FsLR3gRersw++toSl0/EVE9c8DWA5upxcU
	 olXJ4Kg1A6mPJ+pUsKkEAkVwue06Jddxm7sD69+glstgRREm0/otTDRL+dDsMOBhDECKS
	 Akh/kOe3QJ+CGJd1JGXyoEyjWy6fME/Uex5ckcMYWFoiChluJIqZSxcedzL0D35gm1sk+
	 AaP9+wZsGE/6l7oVJIt08TjUOINizuSdvyk42oAqzvppWK8txaahugLZaMHwanqfI2WXM
	 9AnN/zXaKX/19Bcx0VNM7NtulmOElSB1QICy9zsYoSQMTrpHuB0vxfu5ptTCu7RByfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0T1LOFaz;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF987606A329
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 11:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF987606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0T1LOFaz
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b2d14968c9so32216867b3.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 03:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830189; x=1795434989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vRuWX14oDec4PUivP0BVmuEKPbHN3NfZUe1eLUxKBfM=;
        b=0T1LOFazR5ff+WapUSpw39k6O2aX7fMmNzZNhqUZBNffQTEn8kAw8Mu9rX4QRUZqrA
         ll2QeKWg2IDSm5wSJn3HnYebouAgDYuKI2k7ekQztJhbDjmlU6ucVJwuvcOAh0r/L5iv
         OsujwqQzelQXPgj6eEPhKDCzrwuwDx9h6xqd3ZdoAzwtPVGUNHjMEW/kEWZM/OLWhXkp
         orPv3eyGx1vtDoEbWiaNBgl41Rtn37t3riqxQhtKgqtdF76rkl3r6bj3OFOhzoFF4ntX
         X24Et8bx1gZhLsuuLCol2QRfEwVQW1GXqSfIyVSbxXebNkVG5eght2OgD5UxNWqqV5fl
         XnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830189; x=1795434989;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRuWX14oDec4PUivP0BVmuEKPbHN3NfZUe1eLUxKBfM=;
        b=YE9y/DZ7UJj3TZ6t0+IOjYFFKtqPZ63nKRWHNEHrFwLEsEYhqe4/e6b+AB5gD5kvpT
         8QKfXPppf4tB7prmL8VAME9nwdVPvTXz5vc/YqUgZyIPx6Nj8+9NAnFqVDe3Q701VnY/
         TuCDwJhBQXG26OM+ACDvwMuizibHiBfNxbVF8ew8fj9YsXnSPKvPeE8ybUQzqTjaCH7V
         8piX0OjwvUsM2fu/pw7WVXqUUiLEWdfaXA/n8QQ/Ds92VDHeDCCGkOj8yZZFV8rDbDMh
         E5cGmJFWRmeyihRXVqZtU54PoEFfDejYHqKepsGyvtQGr9JoYDAk9GdPMom5kqu6TIjC
         8svw==
X-Gm-Message-State: APuU4Z9egVAqbsmUd6yRG0Enjpjf9+Qiwwn3Z3Z5wKfdE2vPk+p97euk
	sb1RxwYgtW42kJcGOImn/YnrFD3rZhSkoKVfiHLZ3kDrQh5XNhNpPylb
X-Gm-Gg: AZFdTZdYhp5/3k8wzwA/bfdvDSHcf49vJ0JhB3WirQZFrlvxt0aVqch85Zg7KUviao+
	Vio2jfdL973KnwQQVQs4GRwpv7DPEo1XTSs2++INtZPWgwsyXtfaGbvmTLoYW0zmx6mqkkFySTs
	57wjoAH0zC8k+fhdUX7Oo5G+G9e8JzdMVukiM3gqTdgTFUysIWD0NVzHNMxIarS5y3qXdYJoITq
	EwU9ysAXCh4CsoxdvYmDmVtXub708jyYF0dykBgLpHAqMP697HA4lvXldoDmb3y8iEtMzTrJOXV
	DQo5loFi5yePTDowpa/t5CExh891wE4erxBuYKETk+8JcNdhD75Gt8m++oG/7NVfHFfs0A6cAI+
	d0xtX382n2BQTgCGp7gdM5CwSKzlv6ZT0hHg0iogFLZ/LwVxfjcFiy46b0uIbpDG4KPHY79dMfZ
	/RFssyoeC1tmNpbu3rhkRHxmevzUD7nuyHMddQaoPS3xWyJawDhsaVRKiscmg8ef8O2OSGOGKUR
	6Yh/D/crmEd9wyuGe9cNMGT3VITLkcsFyFsoEXlew/5bA+Zc+/8ygDMy86TUzHJQBKKYBeXJtbp
	53Pj036o/+Ha8Yo8xviMH4VHmfHwrYC3a1eIYnwJH2KMC9WdKrjVtQE8mg114s3E3ZIzv1b0pCJ
	aOeKUwY/3hwDJ9Vbb5M992Vll2J7T3TfkJ1kmrGLJYZ0mBSinObCGtaNtHEamS1LxpYuWK/f8Y9
	MI8hylwvX6GcV7QyRcCMbEIEmSFuHHfu+h
X-Received: by 2002:a05:690c:c4fa:b0:8b4:d0ea:ca9d with SMTP id 00721157ae682-8b4d0ead379mr14904667b3.25.1794830188725;
        Mon, 16 Nov 2026 03:56:28 -0800 (PST)
Received: from Daniel ([187.45.177.21])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9dc1c9sm84198817b3.36.2026.11.16.03.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:28 -0800 (PST)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v1 2/3] docs: translations: pt_BR: use plain filenames in process index
Date: Mon, 16 Nov 2026 08:56:04 -0300
Message-ID: <20261116115605.174735-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116115605.174735-1-danielmaraboo@gmail.com>
References: <20261116115605.174735-1-danielmaraboo@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- index: list entries by filename only, as in the English original,
  so titles come from each document and cannot go out of sync.
- index: drop ".rst" from contribution-maturity-model and fix the
  4-space indentation.
- howto: "COMO FAZER" -> "Como fazer". The title now shows in the
  index and was the only one in upper case.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/howto.rst      |  2 +-
 .../translations/pt_BR/process/index.rst      | 74 +++++++++----------
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/howto.rst b/Documentation/translations/pt_BR/process/howto.rst
index 6f0b3cd9d..db263f89e 100644
--- a/Documentation/translations/pt_BR/process/howto.rst
+++ b/Documentation/translations/pt_BR/process/howto.rst
@@ -2,7 +2,7 @@
 
 .. _pt_process_howto:
 
-COMO FAZER o desenvolvimento do kernel Linux
+Como fazer o desenvolvimento do kernel Linux
 ============================================
 
 Este é o documento definitivo sobre este tópico. Ele contém instruções
diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index da92a7026..689117ad9 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -24,10 +24,10 @@ sua entrada na comunidade do kernel.
 .. toctree::
    :maxdepth: 1
 
-   Como começar <howto>
-   Guia do Processo de Desenvolvimento <development-process>
-   Enviando patches: o guia essencial para colocar o seu código no kernel <submitting-patches>
-   Lista de verificação para submissão de patches do kernel Linux <submit-checklist>
+   howto
+   development-process
+   submitting-patches
+   submit-checklist
 
 Ferramentas e guias técnicos para desenvolvedores do kernel
 -----------------------------------------------------------
@@ -38,16 +38,16 @@ devem estar familiarizados.
 .. toctree::
    :maxdepth: 1
 
-   Requisitos mínimos <changes>
-   Linguagem de programação <programming-language>
-   Estilo de codificação do kernel Linux <coding-style>
-   Guia PGP para mantenedores do kernel <maintainer-pgp-guide>
-   Informações sobre clientes de email para Linux <email-clients>
-   Como aplicar patches <applying-patches>
-   Backporting e resolução de conflitos <backporting>
-   Adicionando uma nova chamada de Sistema <adding-syscalls>
-   Por que a classe de tipo "volatile" não deve ser usada <volatile-considered-harmful>
-   Como não Deixar as ioctls malfeitas <botching-up-ioctls>
+   changes
+   programming-language
+   coding-style
+   maintainer-pgp-guide
+   email-clients
+   applying-patches
+   backporting
+   adding-syscalls
+   volatile-considered-harmful
+   botching-up-ioctls
 
 Guias de políticas e declarações de desenvolvedores
 ---------------------------------------------------
@@ -58,17 +58,17 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
 .. toctree::
    :maxdepth: 1
 
-   Regras de licenciamento <license-rules>
-   Código de Conduta de Compromisso do Colaborador <code-of-conduct>
-   Interpretação do Código de Conduta do Kernel Linux <code-of-conduct-interpretation>
-   Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
-   Declaração de Aplicação do Kernel Linux <kernel-enforcement-statement>
-   Declaração sobre Drivers do Kernel <kernel-driver-statement>
-   A interface de drivers do kernel Linux <stable-api-nonsense>
-   Estilo de gerenciamento do kernel Linux <management-style>
-   Assistentes de código <coding-assistants>
-   O manual da árvore tip <maintainer-tip>
-   Conclave (Continuidade do projeto) <conclave>
+   license-rules
+   code-of-conduct
+   code-of-conduct-interpretation
+   contribution-maturity-model
+   kernel-enforcement-statement
+   kernel-driver-statement
+   stable-api-nonsense
+   management-style
+   coding-assistants
+   maintainer-tip
+   conclave
 
 Lidando com bugs
 ----------------
@@ -80,10 +80,10 @@ gerenciamento de bugs e vulnerabilidades.
 .. toctree::
    :maxdepth: 1
 
-   Dicas de depuração para desenvolvedores do Kernel Linux <debugging/index>
-   Falhas de segurança <security-bugs>
-   Problemas de hardware sob embargo <embargoed-hardware-issues>
-   CVEs <cve>
+   debugging/index
+   security-bugs
+   embargoed-hardware-issues
+   cve
 
 Informações para mantenedores
 -----------------------------
@@ -94,12 +94,12 @@ mantenedores de subsistemas.
 .. toctree::
    :maxdepth: 1
 
-   Manuais dos mantenedores <maintainer-handbooks>
-   Processo do subsistema de rede (netdev) <maintainer-netdev>
-   Processo do subsistema SoC <maintainer-soc>
-   Conformidade de DTS para SoC <maintainer-soc-clean-dts>
-   Processo do subsistema KVM x86 <maintainer-kvm-x86>
-   Subsistema de Devicetree e Open Firmware <maintainer-devicetree>
+   maintainer-handbooks
+   maintainer-netdev
+   maintainer-soc
+   maintainer-soc-clean-dts
+   maintainer-kvm-x86
+   maintainer-devicetree
 
 Outros materiais
 ----------------
@@ -110,5 +110,5 @@ a maioria dos desenvolvedores:
 .. toctree::
    :maxdepth: 1
 
-   Index de documentos do Kernel <kernel-docs>
-   Interfaces, recursos de linguagem, atributos e convenções obsoletos <deprecated>
+   kernel-docs
+   deprecated
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848134;
	b=W1aS+c/19XYJKEjAqTD7D1fJ0O9eBZGxfEexzpvJsys0ylMvENv+gZnur5TVJBMhTWT9
	 v2ezrgCvlFG8DH1zdnRnbGPNvGJQmL1OmWUCKqTLFwFOJE3XIzpGZZmfPIRQ/O0STu1Re
	 JvU/s4nr6jaezrFX63xkZvAhRKWrOAhE0vae9X88kHS4B9xBXWBN33MHu9M6zbyh1hAAy
	 oMKNnk839Yrs69n1f7xzxg6AcyQwgVeL/2bZQHGGsOeT00egCdWlUrSAHrb6qUwaS/vKj
	 qEOexWzQw5MbsVO/NxwyskH7cAGj47+L/YNNEoNIS1WvtK4qpHp2oWwaJesqydn6IzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=k3Rmlo9euTGoZYfcdyM7eA701HdL2UPqxuewkR3WL5M=;
	b=AwdzSS32O4edCMvbbv4CgJ0chkpO6QH6WxMscAcb4j/EzUwVzlp16F6toUgpxTc6mG74
	 FqZcjsxQmC/6QHpjgOGcApurFHOndt5WOo2QTJ/Fh5ySNu/h4T50RtDiDHLIUeuZCJwYn
	 cWEOebR4SDnvcrwJeNrcXX/xR/ONAeOiNIFmmB4IaLux24Y03fg0M5xKvG7xKDmRtBlor
	 XxuvTeO8cIwElT1FqU1yEmSxwC9trjKvGARd5K2I7iKY4pyfmwzPS6XKDBLZ+faXPAF7m
	 z2AQGHGFbBrX+6Co/1EZamEkVBpalmWV+33WVKWALdsQp/2Av3paeX2zePRMNZNJQVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kU18TpFa;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB82606A31F
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB82606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kU18TpFa
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3014232eec.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848133; x=1793452933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3Rmlo9euTGoZYfcdyM7eA701HdL2UPqxuewkR3WL5M=;
        b=kU18TpFa90eZixoo3Mec/shtk2lkmltZWyrRKZuhQJ1dIQm9xJ+G8WjeuSjXXwfJRa
         dmFtYZlYRu7dU7XUAEbyw2dvhxs4bSJzOS9vmdsTF+pPMH5T+kxagp/rl/V4/tysHoRx
         wrooBay/qATVYDn2C+y117vT6mlqcR1jTo7nE7cJMjT+sK1s4ahKKeW2rzUbXOtSQpIO
         gUTz1turD8zEFOENAgLqfuqmJ9ufEWTSjZ5ElGTZvT2pTohqS1BZcjsKBzNMqhE7u9HP
         fEKI8j+LfCr8jl2hLOCutjAUNWvmHOKVf24NuTj5seggYT8+Ljms9+GQCrIg9oEz3TFq
         C3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848133; x=1793452933;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3Rmlo9euTGoZYfcdyM7eA701HdL2UPqxuewkR3WL5M=;
        b=VmZ5EQx807XPE3AsGrwf98GOebXSQODRp32vQPq0DqWZnf/UfTjnKPe7U4i3Uk1oPJ
         QhezsN2JunXwAh+Sht6b/RmlJPKCzO+VeOtTDx+2nlROE9kSyoHFq+0z/wQR6NQ83PA3
         hpFNs/EbfNIAte9Rh3jJEF9/RzauOnGTmsKEoPhE0XoGbrw+GHcKY0mMFheMPYxmUxGy
         UC6nI16MhXADK3S8+K27HkB/bMk5knL+h9qdPhAMJYAbD0vTN4Gc4YNu+Ry/7ey0kghC
         c9ARYMS4/HzDrYL9JOofYsxdJx3iERn8w7S5uJMqps/ZqBXnAwGKh4xx01siipqd9cc2
         e6ew==
X-Forwarded-Encrypted: i=1; AKwUvBwovmhDZME+ReB7iGXBuqoOwiXAhjJQHX3++NNv2FYw0ITFKg97bfpgsebDUPczC4FFYw8xZvrUNOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFo0gdCwzIThVUbTNDxMDo1likRCJ6A2jw3FlghDtL6l8L3WeY
	lHvm0WryWNlUZxmoU9XNjg2HzdDW5K2dhS54vyXrdD0JgUeYmckF3by7VQDpslYN
X-Gm-Gg: AYBFou0VNtpD/Ap1dCvmjMbXrnGEdJtHSGnmxJNelOPkVwfhgxMgZkzV7x1gCADL5/f
	+FJM37K7JJSIDl9gKKY/xEU94LRewE38LvshPOMccZjOLf0Pzi/44IPZw6MigHXcp26u8OqoZem
	CMb5/lqqLt1RFcEeX9HHADTTnsB8Twz0uLsbnrFJgCpjr/a3ntwCxXbkgP6Ksez7T94DDtNa0ae
	osIMMjeSAPhV2DWf5KqUY2ljGeOvpzT0BJVwI/Av4EZjimhXt18dCnbTvizWxLUNS068kj/hP1c
	CuDv0KI4/zAGYVAh/mwCNlepRbBS0yeVVhkJIVeNYc+khpZfIWafrYV9gb9EWNRKBgQx3MlCsL1
	+quHgsQZ3l4bK6C/6piLc6jd5mibkExJyfUrigi1fUek2wBdNAil8lxHXqIzcbZ6QnmtPWCW7/w
	y1BgaFuiD2iPlfc9WQ2dLURFzFTOsH2TTAMY9IBMqN7gKJ8bdWVz+cJBr3pAS9KqXzkt+8hleeG
	0MEKoh+fPB/J0LDtqea4Fmz5XhzgYZ1iADJ/uM4GCEd+19OQfhLyVrVUFuh4ykGtioTJ9rlnR7M
	f5tFDJ35szZV81RjHTWacuDnCe4dgBrJ9wOSUHPPdrXUqvx9rY4diwJAvJoF+0i4Asvajgy5OIn
	de+yUjcKe
X-Received: by 2002:a05:7300:1c1e:b0:353:8103:ecae with SMTP id 5a478bee46e88-369e863c98emr3078463eec.23.1792848132780;
        Sat, 24 Oct 2026 06:22:12 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:12 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 05/11] docs/translations/pt_BR: process: maintainer-soc.rst: sync with English
Date: Sat, 24 Oct 2026 10:21:52 -0300
Message-ID: <20261024132158.39493-6-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024132158.39493-1-danielmaraboo@gmail.com>
References: <20261024132158.39493-1-danielmaraboo@gmail.com>
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

Sync with the English version: replace the sentence about contacting the
devicetree maintainers, which is no longer in the original, with the new
paragraph about scripts/dtc/dt-check-style warnings.

Also fix errors against the English text: restore "upstream" in
"upstream-supported machine/board", translate "named after the vendor"
correctly, fix a list item whose continuation line started a new item,
and drop the literal markup around three document paths so that they
are turned into links as in the original.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/maintainer-soc.rst          | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/maintainer-soc.rst b/Documentation/translations/pt_BR/process/maintainer-soc.rst
index eb8040a62..e98c8fcc1 100644
--- a/Documentation/translations/pt_BR/process/maintainer-soc.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-soc.rst
@@ -14,7 +14,7 @@ O subsistema SoC é um local de agregação para códigos específicos de SoC
 * Arquivos de placa (board files) ARM de 32 bits (arch/arm/mach*).
 * Defconfigs ARM de 32 e 64 bits.
 * Drivers específicos de SoC em diversas arquiteturas, em particular para ARM de
-* 32 e 64 bits, RISC-V e Loongarch.
+  32 e 64 bits, RISC-V e Loongarch.
 
 Estes "drivers específicos de SoC" não incluem drivers de clock, GPIO, etc., que
 possuem outros mantenedores de alto nível. O diretório ``drivers/soc/`` é
@@ -102,7 +102,7 @@ Estabilidade da ABI do Devicetree
 
 Talvez um dos pontos mais importantes a destacar é que os *dt-bindings*
 documentam a ABI entre o devicetree e o kernel. Por favor, leia
-``Documentation/devicetree/bindings/ABI.rst``.
+Documentation/devicetree/bindings/ABI.rst.
 
 Se estiverem sendo feitas alterações em um DTS que sejam incompatíveis com
 kernels antigos, o patch do DTS não deve ser aplicado até que o driver seja, ou
@@ -163,7 +163,7 @@ Algumas plataformas também possuem *System on Modules* (SoM), contendo um SoC,
 que são então integrados em diversas placas diferentes. Para essas plataformas,
 ``$soc-$som.dtsi`` e ``$soc-$som-$board.dts`` são típicos.
 
-Os diretórios geralmente são nomeados após o fornecedor do SoC no momento de sua
+Os diretórios geralmente recebem o nome do fornecedor do SoC no momento de sua
 inclusão, o que leva a alguns nomes de diretórios históricos na árvore.
 
 Validando Arquivos de Devicetree
@@ -171,14 +171,16 @@ Validando Arquivos de Devicetree
 
 ``make dtbs_check`` pode ser usado para validar se os arquivos de devicetree
 estão em conformidade com os *dt-bindings* que descrevem a ABI. Por favor, leia
-a seção "Running checks" de ``Documentation/devicetree/bindings/writing-schema.rst``
+a seção "Running checks" de Documentation/devicetree/bindings/writing-schema.rst
 para mais informações sobre a validação de devicetrees.
 
 Para novas plataformas, ou adições a plataformas existentes, ``make dtbs_check``
 não deve adicionar nenhum aviso (*warning*) novo. Para SoCs RISC-V e Samsung, é
 exigido que ``make dtbs_check W=1`` não adicione nenhum novo aviso.
-Se houver qualquer dúvida sobre uma alteração de devicetree, entre em contato
-com os mantenedores de devicetree.
+
+Além disso, código novo não deve ter nenhum aviso do
+``scripts/dtc/dt-check-style`` no modo 'relaxed' e deve ter resolvido a maioria
+dos avisos no modo 'strict' (este último modo pode produzir falsos positivos).
 
 Branches e Pull Requests
 ~~~~~~~~~~~~~~~~~~~~~~~~
@@ -219,7 +221,7 @@ melhor do que tentar combinar muitos patches em um único pull request.
 A linha de assunto de um pull request deve começar com "[GIT PULL]" e ser feita
 usando uma tag assinada, em vez de um branch. Esta tag deve conter uma breve
 descrição resumindo as alterações no pull request. Para mais detalhes sobre o
-envio de pull requests, consulte ``Documentation/maintainer/pull-requests.rst``.
+envio de pull requests, consulte Documentation/maintainer/pull-requests.rst.
 
 Propósito dos Defconfigs
 ~~~~~~~~~~~~~~~~~~~~~~~~
@@ -228,5 +230,5 @@ Defconfigs são usados principalmente pelos desenvolvedores do kernel, porque as
 distribuições têm suas próprias configurações. Uma mudança que adiciona novas
 opções CONFIG a um defconfig deve explicar por que os desenvolvedores do kernel
 em geral gostariam de tal opção, por exemplo, fornecendo o nome de uma máquina/placa
-suportada usando essa nova opção. Isso implica que habilitar opções em defconfig
-para máquinas não upstream não deve ser aceito.
+suportada no upstream usando essa nova opção. Isso implica que habilitar
+opções em defconfig para máquinas não upstream não deve ser aceito.
-- 
2.47.3


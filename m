Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2801DC198
	for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2026 00:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788310580; cv=none; b=ffL6Np+b1AuxWFf9+g69t6vYExESV+7tE6ZCZjVFv6aUUDd/gTBjEHgftxAQ2WS2mbAoLI9hifj4k8ZBAIaDZWgt3ScMl7Qoj2L/YGWUaM/qs4RxCqU7M62keWWFEhYhOieT1Wq5Dnf8nt7czdP/lXYu7Sco0950hGT+7M3lZcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788310580; c=relaxed/simple;
	bh=d7cWym8GiqZJAsG40QVKThsxlp6hXKwXuUFOc7+ukYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oJTGTv2qM5M3qsfNSV7nWam4ZT0YymEQAfvhruUeTD1sgCVLjbo3189irMS8tHZocLXmw6eSnuY2XQlXL9SaAFpYdNc5qClYoXHz17NpQ8vk8+yW5rx1WRx7nHPlCb5v3IeKXYv9dxDXkkXOx4WNwfkFmmNQDrMDBzoNeWnqcKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2Zleaxk; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2Zleaxk"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97bf8f6a31eso189704241.1
        for <linux-doc@vger.kernel.org>; Tue, 01 Sep 2026 17:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788310577; x=1788915377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tiVFAkorF9lFs+sLXpfvZyw5OEmX56UI3CjqJwbxhXU=;
        b=E2ZleaxkXM0UeMGSDpKyPPR1Sk7k/GkXuRjqGqF+nK+axUiyCu4pKHl811sfTStAEK
         9WqcrBNXCPa6iJ/FIxcgN3lpzy6AoTZHDYhYV8s6Giv5WczFjK3AHLyaK8kPJ25QXhrM
         19SMxKKYgbtpBnN6fbKT9rOXocOBy6LKOEKiT6a1mqVFi1F+agq/K+K6BCFwyfU1UUgd
         lirRLJN3w3WlhKHiFFf6CgI4PUI/0XDaKeZue37NH5FmHRtqI260Ng83hbg4G5f7Stme
         W+spkAEx8wEZD3a6ZwLWwkcFOo070jSzKID4Fci4iJv3lFPBQazE51NF0AubL4l6K/Q6
         onZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788310577; x=1788915377;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tiVFAkorF9lFs+sLXpfvZyw5OEmX56UI3CjqJwbxhXU=;
        b=Jo1Wk9SN2qolVbqziWFH/KHAB/KCowVz8MmBtAo/0++olcfsEImG8cgdvCjMof3p9I
         USskD0pnwWwrxyzvaamn8EWY7SjUEDSrLana6cAQd7ad3q4SkHUfi3NVo29/u1ewYrhR
         iwRkCtLDKrH6/oFeMmHkmqSlqfRwjiweqAHHlDvXPkVvCZSj6F2YM52leKlKIrpbPlpY
         EAwyMBGVJAjbOOSYMpbsUHU1+afndEZisGvFK+L4rxRSS5OtrULUAO5gwXuO96PBH0iU
         S62P496ZFnp5EIvWisuXbReCZcz5MuaXafe6LYICfXjObYaf39SMF0RTyvXQDunwOmHY
         hnHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+6gZIugwg2Y5gwuksIDZNco8gWASh0OnSrUjZkRoeXIJW+tce5UuaPPPiyk8KuM1tQFiYnrbQWKU=@vger.kernel.org
X-Gm-Message-State: AFuF++nWhFeQtuUcb46JehuF2lyJ1ZnjJers8G5xGf0NlS5laV2YcQVM
	tYmRa/1KVRHZx5FQBBAI3pxaRcOLRU1pm5TQMNg8nx/KyLSNwVb4TrLx
X-Gm-Gg: AYBFou0C87sBpwNKYFvsivGsiZRFanOctGIG8YYZAtNFuQr1tMQfK0Ebo2SckhHvyBu
	om9Vxl82OLQlU0HrFvnNHQ0xpI5/xRkNPt9LKTGkHDQZGXBMmM9of/Gcw4Zrs6ufvyuZADd0Wtt
	KqOfR4y65rKYLgRsrnDmcD8ytq2mnrby+9SkLy2a5aaR7o7V63QQe0AgDd4c1vQo7LMx16lBFgq
	qbMo+610eAjFAVD0UvN4Q6qa4UFNjRRjzUCNUYz2srNa7zKrW8+e/l3JJ9w+3SrCunB0UUbMi6M
	CAEGjLZOdsqAjOYvuPHeb3OZV4FmHSJgyAkbZr90BxuViMaqi7IKwEA33r3aHn9KSjo7e+VOmTf
	mnPJry3jP359q6AaTfE4JvwYv4WDZU9iEilmDuDUlgUNR+FF4NEPEaiL5++P+B3vecSvw0ah99+
	LNH+C1SzwR8xM7kPgnu5f5pVwYhE5tMC+aWsE71eXipyxiFaHnlqrZMdMjvv0hv4lC3MN7Yw==
X-Received: by 2002:a05:6102:5490:b0:783:79ac:9dc3 with SMTP id ada2fe7eead31-78a1f2df152mr381604137.10.1788310577405;
        Tue, 01 Sep 2026 17:56:17 -0700 (PDT)
Received: from pop-os ([2804:14c:daa2:8daa:574f:5cf:6f39:859e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a251ca6sm1095624137.4.2026.09.01.17.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 17:56:17 -0700 (PDT)
From: Giovanna Macedo Cox <giovannamccds@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Giovanna Macedo Cox <giovannamccds@gmail.com>
Subject: [PATCH v2] docs: translations: pt_BR: translate coding-assistants.rst
Date: Tue,  1 Sep 2026 21:56:01 -0300
Message-ID: <20260902005603.18836-1-giovannamccds@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate coding-assistants.rst into Brazilian Portuguese
and add it to the pt_BR process documentation index.

Assisted-by: LLM 
Signed-off-by: Giovanna Macedo Cox <giovannamccds@gmail.com>
---
Changes in v2:
- Change trailer Assisted-by for the new pattern
- Fix translation errors
- Link to V1: https://lore.kernel.org/r/20260830234515.63131-1-giovannamccds@gmail.com/

 .../pt_BR/process/coding-assistants.rst       | 60 +++++++++++++++++++
 .../translations/pt_BR/process/index.rst      |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/coding-assistants.rst

diff --git a/Documentation/translations/pt_BR/process/coding-assistants.rst b/Documentation/translations/pt_BR/process/coding-assistants.rst
new file mode 100644
index 000000000..2055af34a
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/coding-assistants.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+IA Assistente de código
++++++++++++++++++++++++
+
+Esta documentação fornece um guia para ferramentas de IA e desenvolvedores que
+usam IA como assistente para contribuir para o kernel do Linux.
+
+Ferramentas de IA que ajudam desenvolvedores do Linux kernel devem seguir os
+padrões de desenvolvimento do kernel:
+
+* Documentation/process/development-process.rst
+* Documentation/process/coding-style.rst
+* Documentation/process/submitting-patches.rst
+
+Para guias e conteúdo sobre códigos gerados por assistentes de IA veja:
+
+* Documentation/process/generated-content.rst
+
+Licenças e Requisitos Legais
+============================
+
+Todas as contribuições devem estar de acordo com os requisitos de licença do
+kernel:
+
+* Todo código deve ser compatível apenas com GPL-2.0
+* Use identificadores SPDX de licença apropriados
+* Veja Documentation/process/license-rules.rst para mais detalhes
+
+Assinatura e certificado de origem do desenvolvedor
+===================================================
+
+Agentes de IA NÃO DEVEM adicionar tags Signed-off-by. Apenas pessoas
+podem legalmente certificar o Certificado de Origem do Desenvolvedor (DCO).
+A pessoa que envia é responsável por:
+
+* Revisar todo código gerado por IA
+* Garantir conformidade com os requisitos de licença
+* Acrescentar sua própria tag Signed-off-by para certificar o DCO
+* Assumir toda responsabilidade pela contribuição
+
+Atribuições
+===========
+
+Quando ferramentas de IA contribuírem para o desenvolvimento do kernel,
+a atribuição adequada ajuda a rastrear a função da IA no processo de
+desenvolvimento. Contribuições devem incluir a tag de assistência seguindo este
+formato::
+
+    Assisted-by: LLM [FERRAMENTA1] [FERRAMENTA2]
+
+* ``[FERRAMENTA1] [FERRAMENTA2]`` são ferramentas de análise especializada
+    opcionais (Exemplo: coccinelle, sparse, smatch, clang-tidy)
+
+Ferramentas básicas de desenvolvimento (git, gcc, make, editors) não são
+listadas.
+
+Exemplo::
+
+  Assisted-by: LLM coccinelle sparse
\ No newline at end of file
diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5..6c68ac496 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -59,6 +59,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
    Estilo de gerenciamento do kernel Linux <management-style>
+   Assistentes de código <coding-assistants>
    Conclave (Continuidade do projeto) <conclave>
 
 Lidando com bugs
-- 
2.55.0


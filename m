Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C1322A
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 00:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780532539; cv=none; b=N0gIF+KrEnBKXcX82mpr9KqWCcOY81f/GKQ0rkDx18y/5A7d4cbZ0bNIb6Psu6TPNqfKIcnW9Y/XlFZRya97JEK+tf/f7dpyrrphzh6M26H1VmO0BXokbrqPtuk9vvGOn2n4j5OKKt0txAHSW/DMCQyvL6BU6ArOtCprZGP6KSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780532539; c=relaxed/simple;
	bh=cbO/wvsOvlB5KDEHFmqYKAppoz23pgUkU43qKmW0yGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fo0K7rRWnSAog4Enb87mMFX9TC0bESGDN07AyAgBmbjiK3omPCCaHB4ClkJBAVap07fmXuOlef8ezFiBU8TCErzc/BBcTjy+86iq9/nsOTlAWKM6v/D12as4/Vlh5JuRI4tbpQjn1nGfNNxkh9XCdN3ssQ+j6zw7ouHCueckJyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YryV1fVn; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YryV1fVn"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59e2b96e3d3so64438e0c.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 17:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780532537; x=1781137337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9iWWEpPIhNCSlwE6YzFZbuBGAPF0Cpf2zsyVfqvIlVo=;
        b=YryV1fVn3ihHSgqGglfnMoVQtQSY/z1mTXuxaOoLFWqgO4ypkFKvITCvUjrjGHsUAV
         DrbLbF67bZALxDER1FLsxY8q4t5LfsSOIpBDXHljmSdtb6SHHltLVylnHd81ppBR+13B
         c9V146mGN/cV9CQN6grPGihLKiCPsweMbKsCtaUFxodn/KT8k5lO39p6oqN4Bwzu8TmG
         DATz/PJGZNZsa2pCrxCbCTdU5K6+4zkwZWXndjsa5/3phJbk57fp1h7mw9lX/vmCHUf7
         Q7soUAlNHZ4QNV7cd7Q7k4VE+LP0M9XB6rAvfTknVgMeLvjfVjXfzFCgYvwIF0r3Xk0m
         Imig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780532537; x=1781137337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iWWEpPIhNCSlwE6YzFZbuBGAPF0Cpf2zsyVfqvIlVo=;
        b=nxodQb6uyvyxLSH8N9BlER/vSP/7Nm95FIYQwKPlmcYKyDFLk97GO4zH4B5tvhw5S9
         evYvmJDoQ5pZuappBOKEG1o0xz3ii9TrzRCoIJals2QbcmnxXVKWVrhRi5H/oXF16DGV
         MSLUqcyGyWqoC554uoMqZ8ONdDhyFsYBXKCWjt2OB2Z0PfioMEzhNMS8jI6mllgvwoE2
         9KHbI6D3TvSTwum5JiBKzuQRTgPMMzBFL6DxkRaSWHt5ATqg81+wRUB0P74v6+Hm6niI
         z7ct6Xj4Eh08Kv+bdKcXTJXmb+Ue8fl3OORGAyy7bUwBY4UVahc44Fww/GJTU57YoYQq
         oIcA==
X-Gm-Message-State: AOJu0YxbpHuF7lnPTKD0tWnfjgsKQBYu4c1B/hbFYITcjy/TKTTNC8uQ
	m5OoXfFCiBvbdw9imtdy+c9i0xvAaVMpkB59NOssdGWJDjNGamnJtRt7TfAN9qklyXc=
X-Gm-Gg: Acq92OE12+QzX2j+pRgs5E9M/wmZlRr0pfsZZXx0uwof7kJnS0vDbwJl4186LbPEPIO
	dfAYP6Z0GCjIfvvO43SH357i62A8rzRvQD271BI3VxdDWQqH8gAoTA9RIsFGQFSCycxglfWCOVB
	l0fNZX/acKnTK9/Q3JA3VgWTBHKHWqQw45aYmHa4AIaECZ8nvZwvI63OQsK7nJCR+L+H+UQPVvq
	vCLdH1AwrpYin7CIpYU7djxOujrkny6rGFvw97zaKhWNlQrvqzMhlDsH4EIvEFWAOTbyoKq1iSh
	JCVIKPtH/PPSpnGkj08OLQBJytkfxOAhJlFy3WJV+W4o93cEwKePWa5D0VSVtDKDQwb3o0tzlkD
	QFoaRWjkZhBGc+N2+19vyxXO6DQ9KD2yq2Tr2IcZ+wraSqAwWogtWURULSnSUGkXMuzmae8Fi4E
	0Xvt2mQ5KXNkyzFFGuu9sTrN0RmfYNAc56+Lanr1eKHw==
X-Received: by 2002:a05:6122:4683:b0:5a5:4166:67c5 with SMTP id 71dfb90a1353d-5a6e408f8f6mr3457627e0c.3.1780532537650;
        Wed, 03 Jun 2026 17:22:17 -0700 (PDT)
Received: from localhost ([2804:7f0:3d7:5e7:4e93:f426:5c77:c127])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6dc44d233sm3842406e0c.10.2026.06.03.17.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:22:17 -0700 (PDT)
From: =?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org,
	=?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Subject: [PATCH] docs: pt_BR: update "Purpose of Defconfigs" section in maintainer-soc.rst
Date: Wed,  3 Jun 2026 21:22:11 -0300
Message-ID: <20260604002212.42092-1-amandacorreasilvax@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This update includes the "Purpose of Defconfigs" section translated
to Brazilian Portuguese.

Signed-off-by: Amanda Corrêa <amandacorreasilvax@gmail.com>
---
 .../translations/pt_BR/process/maintainer-soc.rst    | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/pt_BR/process/maintainer-soc.rst b/Documentation/translations/pt_BR/process/maintainer-soc.rst
index 5a3ae213e..96dc9a130 100644
--- a/Documentation/translations/pt_BR/process/maintainer-soc.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-soc.rst
@@ -8,7 +8,7 @@ Visão Geral
 -----------
 
 O subsistema SoC é um local de agregação para códigos específicos de SoC
-System on Chip). Os principais componentes do subsistema são:
+(System on Chip). Os principais componentes do subsistema são:
 
 * Devicetrees (DTS) para ARM de 32 e 64 bits e RISC-V.
 * Arquivos de placa (board files) ARM de 32 bits (arch/arm/mach*).
@@ -220,3 +220,13 @@ A linha de assunto de um pull request deve começar com "[GIT PULL]" e ser feita
 usando uma tag assinada, em vez de um branch. Esta tag deve conter uma breve
 descrição resumindo as alterações no pull request. Para mais detalhes sobre o
 envio de pull requests, consulte ``Documentation/maintainer/pull-requests.rst``.
+
+Propósito do Defconfigs
+~~~~~~~~~~~~~~~~~~~~~~~
+
+Defconfigs são usados principalmente pelos desenvolvedores do kernel, porque as
+distribuições têm suas próprias configurações. Uma mudança que adiciona novas
+opções CONFIG a um defconfig deve explicar por que os desenvolvedores do kernel
+em geral gostariam de tal opção, por exemplo, fornecendo o nome de uma máquina/placa
+suportada usando essa nova opção. Isso implica que habilitar opções em defconfig
+para máquinas não upstream não deve ser aceito.
-- 
2.43.0


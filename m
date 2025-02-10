Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84D62512E9
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 21:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223377; cv=none; b=aFeakgRZMhw90/GNh7tq2ndphS5rxyJwRVmZ2iremKb/xhkkAQ3qUCLpT0O8K10ojWztrGhSrBj9xQ4SVFJLb/kIre6xnYCdbw8+wm6+Fv+AoysxA27ZnU6P6gvs4/gx6pHtrtH9vrm0+DIOEB5PkkJYpuRF263iAKlym/l02ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223377; c=relaxed/simple;
	bh=B4l5ww4xM3ybuxVDnFD7O4s6SCugiqPi0tOYv0B/adg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aruVUB5SZTMzdeiUHZshsoRqoaFKN8vLH7NAQm1yAJP1d9JQ10Cryug5UklN+MqZAWGqHz+COY0qjnyW67kXNngrLpBZjdERykf2eCrcsA/JgLafDhXGGCG+5jxb7dK5GHG70Y669NqLCfswh3bVJLXAJbHvDBbVcd9D8mrkgoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lMnD5CEG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lMnD5CEG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso10927405e9.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 13:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223373; x=1739828173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=lMnD5CEGFmwiNpSSMeoO/Ijj/7bK4sm+7xlJhbqHB46ItuSs7YjGvWsRNeqtq+F7gU
         8kazmQuKtzPzM84J2JMdTCIwzHWHPsaloE3AvmZHNnJWFEoXLZThW1k9yI/DOJ4Uktgd
         SGkpLKKsF7mONDnKPyp4LDutV65sFEahCgvWLW4+PebcS780PaGFlyekCr6JPbc1qlGJ
         FfK3ftWt025K7F8L+t44FdUjC9hfnz0F18ep0z3epCdy7VdK62pAmapa1xg4kd+U1yHU
         XVIm6rUw6quQ/Y59o1zqZY0loMfzEPfUj03Rkz1/3XaWNPEE2sLd9KyEg/IFkEiL/EVx
         11Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223373; x=1739828173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=l9HrU+SLKNxyGZnHg5kxjyOR7Y0v6/8eWa2UNeRLkJ23P4U4VVXm2ai5etxF5rYtQq
         1tyIF95PeptNjwlI8/hfsrXuEtByL+J8RhohO86M/HNfzJaAPpLX1VC9dDZklZpleeOh
         YHX3zDRpBT04/KV3vZBsMv1k85gAvqkgTq3NgK9l+cBk/Hd2qRAdpcsix+v8pJ36Qg0A
         RcUQYFspLLo1Yamgs9yOM6X3tttK7jXQv1r3FBpIptnVFf63WrlHKhAszA87/2qC+bo2
         jdUwa+YkoDukQp+AqF2h6fF92V+wcPMtqDzthrSWlb8pRUaIT37RifafH1mwexnO8zTq
         DxCw==
X-Forwarded-Encrypted: i=1; AJvYcCWymN7bqwzM2nIqWw+Fewi/kvxhnrkHySe7XYuGgDmhP24tMc7Njreav+qLGnNr3gKJ3RrM1rgyCCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5v2GbC5iQfbPk6cQ6f61GG7ez3rSDKXrzlMbbOIru+Ip//wHV
	bHb4LnvPGsU4Z8Pwe1VlrcYm/c3ITt7mYCQ1xPDhkVldftMG+KT2PJ5fPA9A4ug=
X-Gm-Gg: ASbGncskeT4Q/qFc3FEC5DhR+wFmPttBWoUHqE1kJ5r69ATesD1ONZM2EJqwP6VGycu
	tirne9fwpImLvuAYXGye+QEMt6ot7PRD7+Z4hXyddP89OL+l/gcav+FjSh6HqFtutuFqiB3K7KJ
	yXgKNwQZCXs5gDBw2pu22QgnW5lQrbE4SNxOX5nLGWZBRDFo9UIKw6SMIVSJbzWYilYw6/xPlCC
	/sKNEt3kgV8hjLiYp1T5J1JuUJuDZBcYB7/PbfNN5+s8X/cWbblzebGbO65/MrRj4yWe5wyL1In
	ADfzS+quF0/h0V7w
X-Google-Smtp-Source: AGHT+IFIy2UHszvgSyStziow4xh4NgDeIiWhARHb24tahmr62iRvzSTuU8RezdSX8BLezNfYx/izdg==
X-Received: by 2002:a05:600c:1da8:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-439249a7534mr117351975e9.21.1739223372921;
        Mon, 10 Feb 2025 13:36:12 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:12 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 07/15] riscv: misaligned: factorize trap handling
Date: Mon, 10 Feb 2025 22:35:40 +0100
Message-ID: <20250210213549.1867704-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

misaligned accesses traps are not nmi and should be treated as normal
one using irqentry_enter()/exit(). Since both load/store and user/kernel
should use almost the same path and that we are going to add some code
around that, factorize it.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps.c | 49 ++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8ff8e8b36524..55d9f3450398 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -198,47 +198,38 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
 DO_ERROR_INFO(do_trap_load_fault,
 	SIGSEGV, SEGV_ACCERR, "load access fault");
 
-asmlinkage __visible __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
+enum misaligned_access_type {
+	MISALIGNED_STORE,
+	MISALIGNED_LOAD,
+};
+
+static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type type)
 {
-	if (user_mode(regs)) {
-		irqentry_enter_from_user_mode(regs);
+	irqentry_state_t state = irqentry_enter(regs);
 
+	if (type ==  MISALIGNED_LOAD) {
 		if (handle_misaligned_load(regs))
 			do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
-			      "Oops - load address misaligned");
-
-		irqentry_exit_to_user_mode(regs);
+				      "Oops - load address misaligned");
 	} else {
-		irqentry_state_t state = irqentry_nmi_enter(regs);
-
-		if (handle_misaligned_load(regs))
+		if (handle_misaligned_store(regs))
 			do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
-			      "Oops - load address misaligned");
-
-		irqentry_nmi_exit(regs, state);
+				      "Oops - store (or AMO) address misaligned");
 	}
+
+	irqentry_exit(regs, state);
 }
 
-asmlinkage __visible __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
+asmlinkage __visible __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
 {
-	if (user_mode(regs)) {
-		irqentry_enter_from_user_mode(regs);
-
-		if (handle_misaligned_store(regs))
-			do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
-				"Oops - store (or AMO) address misaligned");
-
-		irqentry_exit_to_user_mode(regs);
-	} else {
-		irqentry_state_t state = irqentry_nmi_enter(regs);
-
-		if (handle_misaligned_store(regs))
-			do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
-				"Oops - store (or AMO) address misaligned");
+	do_trap_misaligned(regs, MISALIGNED_LOAD);
+}
 
-		irqentry_nmi_exit(regs, state);
-	}
+asmlinkage __visible __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
+{
+	do_trap_misaligned(regs, MISALIGNED_STORE);
 }
+
 DO_ERROR_INFO(do_trap_store_fault,
 	SIGSEGV, SEGV_ACCERR, "store (or AMO) access fault");
 DO_ERROR_INFO(do_trap_ecall_s,
-- 
2.47.2


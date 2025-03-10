Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1B022E3FD
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619645; cv=none; b=LNIvRGqgjEk9xQsbEaaZqsz+3qwUt4escLuxQEA39Heny5pBsCQGcTqneUxMBx/4J8Lpq4HENyRKHEB6B4h1muR0/Y5NT/JhSEosZtuo+hdIm3n9YRPNI2ZKsSgMgGjcdm/N25rLMAcwlL8KWOc5IuGXVlPiYTs16XuDLXJlgnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619645; c=relaxed/simple;
	bh=B4l5ww4xM3ybuxVDnFD7O4s6SCugiqPi0tOYv0B/adg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oqTLHQkb/7SjZ3MYHE2zfLj9yVkMe2+HDtZgBJy1FE857MSCCANmiAKBvBlmpkUrvRn+KfZQi5FcfsuU4OgW3vXLKjr74qvSmQZhKCM9b4YOgQtyLgn3fzng63DPZmDeYg22ORvrC2HpFtv4KsERO8gMBtTAJAnRcu1IjysM7pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=phyKIH0L; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="phyKIH0L"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22435603572so42315165ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 08:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619642; x=1742224442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=phyKIH0LB85yJ+LguS7wKtU89NW1nV7XXxzNvx9aR+JVuimcTKgh1gW7BD+Qb8tM7P
         kFXzFlnt2iMQJMvrt1wmretsUcNW/Q3G4gIovHKC9kYALAIw7xGZiuFLoTkjgXipYm8E
         whBOyPY8lGh/D/lRk0QpQJAsiOWhpGvxFvpwYsy00ieeJUFDbWxx9gsJgxbI7j++ANhY
         /IzdOnBb+m8CsqYjjuOgIwoYfGdb/9KNs20lvaFsJGK7wYtpSGjFVi5ffjaFDIQ1eoEo
         9Sxqf7E+iOFYsuB8xshlSYOrRX5lms7JPrfx1rNBagNwCLap4PrKxSoxtI+h2CF5jCnl
         wYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619642; x=1742224442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=SfI6qs8BsoAPX3mwGWIfB8SdL6kEExwwRzyzVfnMoLUJdIdDJ5nOx7hLeFmfcIaJ9p
         0Zstg9ur6eZXDBBkcQMCPS/ucBu+Hk06+hbIRBfsjFe9SPbI120H6kBNxo/era61ddW7
         44+nAAFlqEhav0yZ84HaBVQpAoTrHGXD6LRenRGCCcMs7W3uhm9rAzi2OoRle3wOJAXy
         cvqjLxOJGgB3td0g+2e/LJykx7oF4debnvNDt1UCxLIda2xHU7b7Wbnr9MWeJzURP95Q
         OkZjnIyP/rnNiuUvKvWHWhLly3BuXrrDKuyqk4gTvJPeTUPuqQMf7mWfQoPk78BWGgEU
         FJww==
X-Forwarded-Encrypted: i=1; AJvYcCUln1U5pN11XMtbzLZ+sJlYMdloStDjmRCSR5hZmJ6rmqScgDYWlQensQ3o1wmG7nrsu0dwoYKVUMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlU1wRMOESUfqMmxEyIPEI+zF1BlSW5irjfov6LSM1DjF6Yt5
	+fckxha1OSdA+gLSVb3vwQKStjA7RHmDnUdOq17aLMl8SkfOSMz52MreR3Rv5tE=
X-Gm-Gg: ASbGncsi34YZQLomuc/p+A8t1Wbquqdt/FXhwr4YGkwYE/czFDXfq1IYX2k5K5L6j6c
	Ajsg7sF62FrlY4dXRQvgoMsgzoQ3baULH5l60Qlx6FueCMuL8HwIQ38bAzjt/lRsNc3/h+hd9kS
	LA5ROk5CjVnY/Ra4+PJ0Kc+LPJCmDDTiSjntFmgY7ikWh03DPHUmS4clntXPnOilscYraEWsvB+
	MzMxWnFWOhWrU8t2lauzV4my5hJ3nSs1mFlvgoyPyjpMW6ncznZiyvYZRfcTSB1OThoT7FzN+ds
	zK8CHV6NxLfTjJkCPfR3j6UX8aFzTGjwxgXaTF+u8tA5+g==
X-Google-Smtp-Source: AGHT+IE/Wftdkd3zlZdL/ywUH78DLaDAVcrFF4WfEuA9Q1JYQZM9C8xhDZMPOQ9HkccIr+uMejIbbw==
X-Received: by 2002:a17:903:298b:b0:21f:4649:fd49 with SMTP id d9443c01a7336-22428c221dbmr239345965ad.49.1741619642512;
        Mon, 10 Mar 2025 08:14:02 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:02 -0700 (PDT)
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
Subject: [PATCH v3 09/17] riscv: misaligned: factorize trap handling
Date: Mon, 10 Mar 2025 16:12:16 +0100
Message-ID: <20250310151229.2365992-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
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


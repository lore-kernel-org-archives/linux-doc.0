Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78D61DDA0F
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231302; cv=none; b=vCkRc3NBjW1V1xSpKbW1kHnsMgxwC/ILRAtmo04oQ4mJq0RO2s+Elyrk9ScL/eZJiOK28nvzYXRxLL4uLRR6lHReni5rw5Y09VPL/dSOVZdhPfSADPW9Hvg5CH/j/QFSU6VmLL/No0dXNCz2qvvA/UYv1D3k0U6gMjLecW0RiwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231302; c=relaxed/simple;
	bh=B4l5ww4xM3ybuxVDnFD7O4s6SCugiqPi0tOYv0B/adg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qlM8F0bPuncy9N0olSAG/WduGHyiO4uj6Uyz5mrnHccNmNmEs4/LwKvQ3E2Hb2iqvn2QBcI1SQrSP9RL5c01AWcfUEhAEYg6ZFlMRQlrkp984tgqCvueM6T/ZdVX5tQ3ptgXZlI5mRcRYzAfs2LBggI/RmM3y1BfNgd8pC9KAyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=TH0Wpr6k; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="TH0Wpr6k"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so3042755f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231298; x=1742836098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=TH0Wpr6kUlHO8JCQ8f1xc1hUwdTwBLerRFQ1twh7EsTet8H64iJxR7jlfxf4PtwVsk
         VXRN09JsGKDl7bY4vCW0Ht2UFXJ1kdeHbPrjlSVA3Eho+hcUH1ZUF9cUDYufFnkKkWbb
         f4ETFjelcXuCl7cyxhkKFvNpn4547+fOHY9Rrso8D78/OUSgoe3wKWtPwfYxqSA+ma9d
         xPemuYDNAL9vwUieKeknaKYh85TIPPhPeNbNeII+DXeoIiPQ2NGhnzSf4n6rb42h+ICU
         /5BZuHy9st5KLNxj/lERhDOCDRtPCd0+D+MqaLN3MhM0rVeQyU+XrA80YfffflQxVQA4
         swUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231298; x=1742836098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=Wa8lf6kfk9k4VbDH8giAbF62/sBaylDDRU+BxMyldc1qBA9Z3XBu2sr3CTYr9j3gPe
         4auEGkos0TIcj3dUZ2K+VC8XoGMaufHEhcTNX4M6I9VW42o4sFQc7YsVjn6tmE5OjOOG
         5hLtfs+p1uvzAkKl85KA41WT3l7xkwj8Oq/IIwrOk42DGVqR8l+f6RmZJvU5iRzEtKYv
         16KxkmmtWeYzVT/VjCCJsEsmipE78DwLdcVkG6+uqfXuLAaoic0ktG7n3COVmae+m67/
         oQUz2L2jKVAt2ade7Nw3NfuH/VGCQ5QNyXPGfppyayU9CEGbiuR6iNH2jDkpa7N1jnPT
         bipQ==
X-Forwarded-Encrypted: i=1; AJvYcCWerlxzdoqSakfoSiAq9LVGy313uQzPRl4u5d+iZjpsm+I04pqxJWNd5aHa52RED7CTtMcgghw4OzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywee01P2E1ciOxNxHD+LI5UaIKzNv722AYfCH9bEXVaW971/RLF
	/s8SACtOAFqO6frNgmCVFZvCJYnTXYszid+W/kuOhElKMs379NKalD2HACYRDBI=
X-Gm-Gg: ASbGncsqw/Z71BfZ48IXuXsB2mOeT0JEBDTbr2acvugIrVEJmMtrnCW1EKQFfFTuZiY
	FEuE5/IngfJ4h/Pm+GLujRcwX8E9lhfguzkb0WVDmvTk057AapBanF80g5c/HYwLqQP0jTGSwSs
	LP6oMLgfCV1ZMyPdyDDRGjleQV0emI2A6wLY6u1nTDwe2HnYAU+LEWxLkKaD30SeB1ViofM1AO0
	bpdZgMQ3Zjy41to1f3YP6Vkoc7jPuB5WRbmTZcvk96AWyTeLd8aXv5y9oRiOQFc8QJQHTBqayxt
	OVFWuQ3V6Hr3k3ZRihhhsr1mPf0G+CQGv3RusUqM7j8ZIQ==
X-Google-Smtp-Source: AGHT+IGA2Rdk6jf2tb4X7esu4pon4fXkJaTK84F8Y0BwgA61Xp90vVw97TtNBjS5pxzMobEPki6sdQ==
X-Received: by 2002:a05:6000:1f8e:b0:391:253b:4046 with SMTP id ffacd0b85a97d-3971d51f3f8mr14939898f8f.16.1742231298143;
        Mon, 17 Mar 2025 10:08:18 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:17 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 10/18] riscv: misaligned: factorize trap handling
Date: Mon, 17 Mar 2025 18:06:16 +0100
Message-ID: <20250317170625.1142870-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
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


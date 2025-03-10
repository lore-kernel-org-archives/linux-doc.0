Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D51E22F140
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 15:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619653; cv=none; b=JztAIGSvW/PI1FrFhhTXIwSPwmsYuAIvNsUbArK4E2zPWIa3pygBcgj2ZvjqIS5QvbCukznTWomPqB74k1FqErl/2mCs5gCaWcQnXSAtsVomaW00bGkipfEzA6oHcCMeke7miru/zEAK35EwAL899tTBWgWEAVFHMPHBk46Qly0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619653; c=relaxed/simple;
	bh=o8LicozigsBJPUxfw0UjH/+haPfd2EDEodthfJ8bhLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g1e47Jl7RTgxi4HvmS2gSu8pAfwa+CV4NS1U8KL4RrNnl1/306LzhPZmxC7tEebrrSwSm1Qt+QjnpqtXt0ZNJPyxiypgJ2iBv22/V/M99s8gyQZ4t5pOQnzmFpy31jlxj/a1zDTmihy6G05vt+LJBzN5xkzLhPgKj+07/hWNm8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=sdD/23dZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="sdD/23dZ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2240b4de12bso71868645ad.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619651; x=1742224451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=sdD/23dZh56zIGm8cLD57MT1KljzYrdDdt0dTNjXryen8/XPut3abB0rYHPCsTnwIl
         xBltirmFV6nHe57X0hLBs9mWLRWy4vI+sZj2qGbIKjKJtVbtnuJzYRLZrCiM7XM/ahwJ
         ZpXOcffhvM+w+4+bsrIeOXs0dN1CGZ+NFBFTQYQR27GGRth8cMejLYM8u6/i1a3mc9xP
         IrDyfcCA2Q4tgWfDQV/kcIlWNB4HFx1rOX3QKICsv9NkXWic3SPDGx2De36h2SGf+uJ9
         4KAjrCmLACeHBpGjvTXIMYcZmASp0gPbF919FzQkH6r9/oZLBGobFP9q65GeHJklT/Uk
         Hu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619651; x=1742224451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=pzqcVDVuUOc47eunseXSJVyVphpwIz7khzdQj3S+wn+RRqg/s+VL00bqbxxfCZvryh
         wc86zI9i17UJPbYVzq49we1Z09zmQCjcdsKuWo53GCvXiCCcJ6Fj1lMZzVfY3xPrbwp0
         6pGZm6tehC/atbhzjrSCJNv3X1Ves2BI3gxbfEGcSvfNUR88AaiC9lHsa6iVeaVkdNla
         cwDpBuH7kcn0Cb8mB9FY8dTSOdz9jxf39brEORJXnhMF8eZNdjnPUUbfVcJGgMf8IJwB
         LV3hfvGnlfC5XroJjCaND5lH+c69CwRZz3O0GJCraCSG6JV8uNgHRIMVxzKZkul6pfPA
         Cgbw==
X-Forwarded-Encrypted: i=1; AJvYcCXVAAFi1xg5wE0f9OJTuHFDKYE1X0KdIUqrY8fYQ8CcMXKTo/I11e7fgLQZU3Zppk3ac/OjU/SJ36E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2dEKnNQBl47h0RuXTnMQjpRbBgnm41rPNstfb8G14bvct92Kk
	wwUTTYAeq9qh9XTmHtsFNWTL58eChvq9HgjJARZe6LNyOX4e0w7E+8PdBiVV0ic=
X-Gm-Gg: ASbGncvkiG121xAjv625f7TKRMzQL0DQwl5LBbox4hOhjBzbUZo3vCSpvVqmNBsx8JW
	WMV9S1GMkQ5kzhUmspJNzC3koKCF4TbcN3yIJ2aHVu2xn8XmazLpEdbA4re3nGhwKwYMcEmi3AO
	VNa3vWY1yLhvaQA4WZhTgR1f3srmf6b/10+8RDjoa4DHJqe9cIyJ59pjt8sJ2FTl/GMgS3GY3lz
	psjWaKn7BLIgJW4kqmZuTV7yxe2P9/83sLwT6TeDj5XVuvde3VneM4aF8XtYIkI5S9mEcRROr+L
	J5ynDppfObHQF+XicBUhcIeHza1Cq9U8B6Glb00yPhiK0A==
X-Google-Smtp-Source: AGHT+IFrDg0cMkxcg3xxzzqPCaOQUBTnQwFpZHXCVcuWzC1x8fPkcfYHuG4bXSCleAdszR5qGgJy/A==
X-Received: by 2002:a17:902:d54e:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-2242887b415mr253277735ad.1.1741619651099;
        Mon, 10 Mar 2025 08:14:11 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:10 -0700 (PDT)
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
Subject: [PATCH v3 10/17] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Mon, 10 Mar 2025 16:12:17 +0100
Message-ID: <20250310151229.2365992-11-cleger@rivosinc.com>
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

We can safely reenable IRQs if they were enabled in the previous
context. This allows to access user memory that could potentially
trigger a page fault.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 55d9f3450398..3eecc2addc41 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -206,6 +206,11 @@ enum misaligned_access_type {
 static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type type)
 {
 	irqentry_state_t state = irqentry_enter(regs);
+	bool enable_irqs = !regs_irqs_disabled(regs);
+
+	/* Enable interrupts if they were enabled in the interrupted context. */
+	if (enable_irqs)
+		local_irq_enable();
 
 	if (type ==  MISALIGNED_LOAD) {
 		if (handle_misaligned_load(regs))
@@ -217,6 +222,9 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
 				      "Oops - store (or AMO) address misaligned");
 	}
 
+	if (enable_irqs)
+		local_irq_disable();
+
 	irqentry_exit(regs, state);
 }
 
-- 
2.47.2


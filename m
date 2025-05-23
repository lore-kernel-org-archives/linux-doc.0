Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDA222A4CD
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995747; cv=none; b=OYXfDOkgePXeRN9WvuprtUH6kfNapaN1EAZLI696Q2CK1iJRNxdQRu8jEAQ5DFORC69lifwGgORLFjli9LLggK/ZRzkw1Q7u9uwEBUT6yZ/Ceaq9x380WWdQO6PPihUIr2F2/DM0pAjt5SR/zDctypp9lxFoanJ4thR7wQwupNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995747; c=relaxed/simple;
	bh=ViCP/GXPR6c4TqOEA6RHPSeoT6XgmF7w9rLMCocIqJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dinqtJ2eMnxy9uGxtC4nAXHyvnKF+AP4YL/dtv+4P2HzWEBNTn6t1UeKF2TZbvhFI28nD63KSiC76PsJ8cbnZBkoIT8g3eEuqGWw/HWGSnb8Ue36O4gmyTWlYCTxaRHe7UiAiofEV5+q5M3o8WChWV0AW0AHHGxkN5wVbHJjLd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=F4BLMmvU; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="F4BLMmvU"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742b614581dso7481551b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 03:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995744; x=1748600544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJlHvKZgzBuDLrZteqciLWVF8ALRj3f5YDjK6RzEUVA=;
        b=F4BLMmvUragUW4s7HyKp0BYbTKVW3t5KE14GnKOGodHwi/oOQ9epFFGVDSTCc2EGCE
         unmJMniOabLV+9iCUQEtm36SHxTUHyF9g2kgDZzMfbcD0Zg312zo+BlS5wNhUZh8FePs
         1PqZfkN7IMu6extAbRIVX+t4fRXYmB9dxV4gQnmBJqsFJfaPEvGvWiHuaHCE7tb6KDfi
         iGVxa4AhX+H73k/AGzcJof9GS1RUMkdo6kanbzU6BNBaNPPNxgPEjEFB7UGybGaaJhOG
         CxDoBBO1hc/KeOAnOTbzJZ1S6Uy0S7kGYFclirqXqGhizlUCand9GvD1h2U9OVROTB5G
         X4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995744; x=1748600544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJlHvKZgzBuDLrZteqciLWVF8ALRj3f5YDjK6RzEUVA=;
        b=fmZrlWFs/OylKZtwxdO5dIYouTv7xGn6nNi2l6LqOOHsZN4pFrqeVN9xvxA9758srw
         KFXbaHXifZHXa/uhr2tiNr5dZF4QoWos8X1qTzV9OXP1NInq4FWAMi2XDKXJvMjsizd1
         1aJQydE/5lES/hRgPpj3ojDDM4cgq9QpxfDOMlOHkcG1mEGMasSGoazW810PGLvHp24L
         6Sx/pR5tjZ7gVGO+mPbA6auD/koLM72g9KLga6eZmQsNtR38L3TacUz+TuzBpQ6r8eJS
         8bifNiIf3yFo7Qx+XNlB8zFE2cpNI6fdlLKDhf13oON0tsPedyskE6rgYhpuPlmZzmlN
         R0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUh9WG4S+1W9D9P+R9vltkeccHMStXbHqR5ftUJp+Xt5B3/EDEfG80wU2Yd6hJXlA4MpwHYT8HFr0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+mtzTwprevNIsMgWiNEbnAMUXhhozP0W2um0lNRWuwYfGLQBs
	T3GKtNVRgZnRJiLrm8UATZl32ywTuQ4UY0FLfW+JUI1qggagAJgdfYoEPSdh5/vM72s=
X-Gm-Gg: ASbGncsa+83CQ/1S0AsLwcwqb+C31FjcDl21r8i9EnArktUik7vWL6HuFZzqMORR95A
	VH3nhhwS4HxRedxNxiVa9ylC0wLaQh2j+8Xq/wUBSM6nkEfSKOeYtDl0tOzpIgj/Gha4mDBhuF7
	wayiS/IWFw9D4xpWFEHe+fZnfWatqhrRJgDLRl8Y861lGSv98DA9gI0QDNzBzzEhZFTjF1na7b7
	khGZEimMX0Q/zr6qOWU26XM16Q5urSKgEps5VVh6ZmmFzFj/o+Ueau1YRQ50gHIwD9ZLw5YjfXN
	8bGS+bprtGfF3u4zX6ZLexYcLt2qiBKs7vvyBHJ4os3/LbasOOtw
X-Google-Smtp-Source: AGHT+IGKDj0Vt3rsaPKYZL2nBjHo4cZKOOLzPGlgQIfiludDyBY6vduzzuNU0u8N497C+aWPSTsTOQ==
X-Received: by 2002:a05:6a00:3e0b:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-742acd75e6amr44078224b3a.24.1747995744354;
        Fri, 23 May 2025 03:22:24 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:22:23 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 10/14] riscv: misaligned: add a function to check misalign trap delegability
Date: Fri, 23 May 2025 12:19:27 +0200
Message-ID: <20250523101932.1594077-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Checking for the delegability of the misaligned access trap is needed
for the KVM FWFT extension implementation. Add a function to get the
delegability of the misaligned trap exception.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cpufeature.h  |  6 ++++++
 arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 2bfa4ef383ed..fbd0e4306c93 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -81,6 +81,12 @@ static inline bool unaligned_ctl_available(void)
 
 #if defined(CONFIG_RISCV_MISALIGNED)
 DECLARE_PER_CPU(long, misaligned_access_speed);
+bool misaligned_traps_can_delegate(void);
+#else
+static inline bool misaligned_traps_can_delegate(void)
+{
+	return false;
+}
 #endif
 
 bool __init check_vector_unaligned_access_emulated_all_cpus(void);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 7ecaa8103fe7..93043924fe6c 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -724,10 +724,10 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
 }
 #endif
 
-#ifdef CONFIG_RISCV_SBI
-
 static bool misaligned_traps_delegated;
 
+#ifdef CONFIG_RISCV_SBI
+
 static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
 {
 	if (sbi_fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0) &&
@@ -763,6 +763,7 @@ static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
 {
 	return 0;
 }
+
 #endif
 
 int cpu_online_unaligned_access_init(unsigned int cpu)
@@ -775,3 +776,15 @@ int cpu_online_unaligned_access_init(unsigned int cpu)
 
 	return cpu_online_check_unaligned_access_emulated(cpu);
 }
+
+bool misaligned_traps_can_delegate(void)
+{
+	/*
+	 * Either we successfully requested misaligned traps delegation for all
+	 * CPUs, or the SBI does not implement the FWFT extension but delegated
+	 * the exception by default.
+	 */
+	return misaligned_traps_delegated ||
+	       all_cpus_unaligned_scalar_access_emulated();
+}
+EXPORT_SYMBOL_GPL(misaligned_traps_can_delegate);
-- 
2.49.0


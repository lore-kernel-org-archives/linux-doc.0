Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F12472A9
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892721; cv=none; b=BJCfg7NT23FSLEhG82sZG6kAryGHkXItp68V9xCX7zU3muPH+RpWmful/O6pY6zKP3DiSAs80TRaT7AE9uL8LxFY1EuPVXtPJHsCK7ljbYJlyMHM3XooPm1pewT/KpFqBe70vYXMXgFNZu663nZRwD4ZOnnBWGu60f80iPxyrFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892721; c=relaxed/simple;
	bh=EovtyHw9idZFNwtsYlCnzb9BpVvdfog+V7fNy74G0ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FSlyqVIRnXpRecQeBGTl1XrROBqGSEXjIh2pHqszsYNhvGbmXCGcKJeEj0dIWGoy75w8t3iEn7Lzm4u7zHqQ8apnC67v2yj3eCjpfvgX8YZei6ZXKoJJUxhnlzA1JIOUuY8npYuCyEDy15nuolxELr7PAbASi0VfqubLYgxk1Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YxAnZnFd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YxAnZnFd"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22438c356c8so7712095ad.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 05:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892718; x=1745497518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZnuSlMP6ZuwANzL9lETdaARYZp01YtNV9fLw8GSKUw=;
        b=YxAnZnFdjVu5gHkkao1RamPbDun2+eJGZ96H+jcRzfY99EYkmBRdovrb/zuWmBuLGF
         /vm3UtI+rDHCd6jVWTThMHRmppDhiG2Uw73HbKc3uJnD0OEN7mJ/hfboLSwuBj/M1nvi
         0VTcokaXVSoRcweOfmOhXdyS01tRWi+PHt8I1h6eJPLOajaTV/egiXaZzEOSzPmapj25
         kg6yWyU27GGfh36Vl7z+YR3rMvYb+zbF/f/UJcEuRvXuhrZdRDN99ti7EAliF2m6egh6
         48BhqxVEQEupVYxsHAaMU/x+xGxMG1uGpQilEj72yYRLMQJz3POhj+LljvNa3NnJoMTw
         SHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892718; x=1745497518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZnuSlMP6ZuwANzL9lETdaARYZp01YtNV9fLw8GSKUw=;
        b=KmcWJmm9Z8hPeD+bCQTqMt4NLroJaZ1iWYtzL+Mw9JMlvQUEhfyhBp4ehnMO2KE9mv
         1raheT+4kK+j4TQrHLn2ZRa8D1pS4YQ2W5sWKMiBMwAReLuuSY6zqE6bVahmWTvVapGH
         7MD32STB9T6XF1krU8+JsQtnG6ML4Sc8RS1CmuIX1d3Qzvuu2cq6GerHqJgQCs88bSOc
         UBgqcjSefiJx63Mrdz1jZ5dCsIrdcx/DLCXQlqPsvg8xuO5GVGz3rhiKvG8D+9MSB82m
         6yAs6Ceg3Bw1zmwLuTDRg30ZZMI2kEVmqihtzBNlT+802d+UveWLbeyYJuOGvci+8VLW
         lxpg==
X-Forwarded-Encrypted: i=1; AJvYcCVbLzfUyRtqYzPPJmtDuHGYy32vLkzLTbEmdBo2Eq1wXlYwvKg62Wk7kWSb7kQS7kHho8yVES1cRE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj/Vn+YFWf3qxRzfXFkw3/VdK6JanUtESS94+rJBi+EuwFGzno
	3+6pVTDk62S4LtVyaBDXGcLoMwo1ysUToqJhJm73QGEKF38xHxeILQ3du/0lCd0=
X-Gm-Gg: ASbGncuOmQsgM5BR/KBpXd3VPv97Zn5+yknpj8t9KoajbWhXsRQbb28vkLI7odBWczf
	v/Zsn8GYHyIZInO0OC8tAOcDS5wrmfdBogE3PD2LdjF6oyQKDovxwtmhvWifrGqs2/wCPTeC+3d
	zct5dPoA6SkbvmAeG3M2fyNv+4IHD6XhfJD4eF0+jF7rctFQ3Tdd/kzNwhrow/ToSkcPjODJEME
	qoB8soXuO7cEZDYqVKTqLXC28nNwsPJJN3d7g0Wr1s+uNQsJV62TizRqCgmVa4PuOYTAQzflmmn
	luCBoRSmfOU+zPXdt/lZ78QJrP8WcUrtLbPBiCa7O8C+f5KAJyB/
X-Google-Smtp-Source: AGHT+IFn+UkDwIOY/e3sKBsC4N9k8AEuCmWtLw7UPdTMPKcDNDFZ5/adGOe7oxZT/yFghuiQ5DQrlA==
X-Received: by 2002:a17:902:e808:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-22c358db9abmr72649025ad.18.1744892718633;
        Thu, 17 Apr 2025 05:25:18 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:25:18 -0700 (PDT)
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
Subject: [PATCH v5 09/13] riscv: misaligned: add a function to check misalign trap delegability
Date: Thu, 17 Apr 2025 14:19:56 +0200
Message-ID: <20250417122337.547969-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
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
 arch/riscv/include/asm/cpufeature.h  |  5 +++++
 arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index dbe5970d4fe6..3a87f612035c 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -72,12 +72,17 @@ int cpu_online_unaligned_access_init(unsigned int cpu);
 #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
 void unaligned_emulation_finish(void);
 bool unaligned_ctl_available(void);
+bool misaligned_traps_can_delegate(void);
 DECLARE_PER_CPU(long, misaligned_access_speed);
 #else
 static inline bool unaligned_ctl_available(void)
 {
 	return false;
 }
+static inline bool misaligned_traps_can_delegate(void)
+{
+	return false;
+}
 #endif
 
 bool __init check_vector_unaligned_access_emulated_all_cpus(void);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index a0007552e7a5..7ff1e21f619e 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -709,10 +709,10 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
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
@@ -748,6 +748,7 @@ static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
 {
 	return 0;
 }
+
 #endif
 
 int cpu_online_unaligned_access_init(unsigned int cpu)
@@ -760,3 +761,15 @@ int cpu_online_unaligned_access_init(unsigned int cpu)
 
 	return cpu_online_check_unaligned_access_emulated(cpu);
 }
+
+bool misaligned_traps_can_delegate(void)
+{
+	/*
+	 * Either we successfully requested misaligned traps delegation for all
+	 * CPUS or the SBI does not implemented FWFT extension but delegated the
+	 * exception by default.
+	 */
+	return misaligned_traps_delegated ||
+	       all_cpus_unaligned_scalar_access_emulated();
+}
+EXPORT_SYMBOL_GPL(misaligned_traps_can_delegate);
-- 
2.49.0


Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821BA1E1E15
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 17:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231300; cv=none; b=sEMLRFP1Qmiv/R1OMlzRNvBB44NkBFSijr2V/ZI7oSJ7NVr/mlT7N5IVIaMyGrW66TdbOryxEKaUTOovnhMGGY2wBxl4lBkzK0/8ciqjYb163Ln3pjn7H0mzzTJtLJSCATD0EwEVW1//z0BBOeTFb6uTJChSPxjqNZ9TWTG76kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231300; c=relaxed/simple;
	bh=s4E957oqIf8er7oaqipLhpUVd977hLf6TtGqZJ/vs/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4rUv4naQXuYQBgctx+0shUEzm4O2VrepZevdk/2NozU+2Hp2Z427ftXt17+m7mnCuSI9lyq8r7g+HvJ6rUNxMQZTsndFxbwwI7WT7J25Be8lgi+69FJjNvLiVRZBXEauTIvaCe6Y97nG9UMsJtpTa5L4sONxQlsH0zeUSdGSVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=q2CTpS6Q; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="q2CTpS6Q"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so13878435e9.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231297; x=1742836097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goQPfqUUhZrDcxyWXuqyDL1Ho5AqcAiizxxMLq8C+LA=;
        b=q2CTpS6QJi8dW1qdnBA0JvHSyuONwujIfHN+9AEMomvVztDcwc6S85/MBlQvtsCxjL
         oc+yf5/SO0wma9uU3DXO/mCKCD42WDqZtap+n/4vPJ4/fsmPcjVuNj9hrXbjmMKIKJN9
         3aW12fbP68JHbxRGpGhQin9fWC4pECamas80Pzs0IWpN2cNgonJm9wzGLGMVyhR+JSHn
         MRw9TfAMNzHjGEW71MROy66cMPt642/Odp6UYfai+j9SRLUSvog/AW7kMswsJCwk/Kzt
         /4j02ifaPq/5Lba8XgXCRe8JLytb6cOXQUDyv60EVHFnKH1FuSLta5xPASUlmjVv1w1x
         JSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231297; x=1742836097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goQPfqUUhZrDcxyWXuqyDL1Ho5AqcAiizxxMLq8C+LA=;
        b=iPe/iV1U97EnEWdpglisIw9zVXrC28d2gCSPFyYMd0QuJGAgRmlsGmMA0dYVsHl8qG
         cmzIJjFSjXBPVpVcAzRAa7Y5hvrElKQuBtKrtTDHDqY97sF+m1jDkeBXVPePJnTsGAZ4
         /Z+y6j4xCvfoE7fecq6jNFzguSY8wfeYg8mseNRLaHPf8g637OFfE0wTt2bUNwfq2S6g
         wqF31Q9XcCkaBOHHcghFywUGpC3jMwH69ZFNSTkMeEFbH74mCfeLjnm/GIPniEAZVden
         Yn9zOHJX4bhJniUnNQhf0w1n9MGeuOP9bxa8coKTt+d3hDCLOlsPj3UGLvfKK7ZpyV8s
         yC4g==
X-Forwarded-Encrypted: i=1; AJvYcCUN2G5/pk1c9lBYuQ80RWhetnedNs7jXj1VxdoRGGDrohc0TqDgZK8PzYwVcRSUoQ5sfzgIAV52vQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF6jbJSDBfVAtIBBN5SJ+y/4Noe//41S53LPG6LXpLR2oOqEYo
	RfSzCf5iCDsAfAuFla4fggVcti6BD5kPNJh0poY0AcfJVd5nHlRBHD3SHM0YenQ=
X-Gm-Gg: ASbGncuGtc16bLOfFPkC1EPF3ar1KIyPkf4YgLjAMsAMYrwut3DMaFMVMDebOk9+awT
	kK46YHqzunPJpdwAZXIcu80+2+3pnszGhSRbBVpYShoC2Lqo/clPpE8ejywS10vIm6baMOePiKy
	5cRu9RpJ3PJOf9VOnBT/l6r/aOLvMu6Ty5GUOcq8CTudfSA7hdqWxa3EF74+jMnPqgjGS7PHTe3
	UcNlDYxvWNtZ6CL/l0LibnZ7rQD0MlmJQxbSjjpgu/La5oCbOoa+5/QhJcW3QhjSbK3GjTRxptZ
	GeQsc4qokCXr/2AWrIP5bJsfqQ5RLg6HmhHzOcBHlXTQ7g==
X-Google-Smtp-Source: AGHT+IFputIgv6zhtm+v7+MGBN3nI7X+BtRN1fT5rRbozYZS+RzAoNXF9CqISuMs9K5H8TPGERcLdQ==
X-Received: by 2002:a05:600c:4e51:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-43d38f72af6mr2448325e9.2.1742231296757;
        Mon, 17 Mar 2025 10:08:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:16 -0700 (PDT)
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
Subject: [PATCH v4 09/18] riscv: misaligned: add a function to check misalign trap delegability
Date: Mon, 17 Mar 2025 18:06:15 +0100
Message-ID: <20250317170625.1142870-10-cleger@rivosinc.com>
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
index ad7d26788e6a..8b97cba99fc3 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -69,12 +69,17 @@ int cpu_online_unaligned_access_init(unsigned int cpu);
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
 
 bool check_vector_unaligned_access_emulated_all_cpus(void);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 3c77fc78fe4f..0fb663ac200f 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -715,10 +715,10 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
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
@@ -760,6 +760,7 @@ static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
 {
 	return 0;
 }
+
 #endif
 
 int cpu_online_unaligned_access_init(unsigned int cpu)
@@ -772,3 +773,15 @@ int cpu_online_unaligned_access_init(unsigned int cpu)
 
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
2.47.2


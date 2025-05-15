Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29BE297A53
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 08:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297439; cv=none; b=adgr2m+wnCnXWue0QeIJGLHHw1g7SLma/ww94Oy/67j2+ZsNMfTAH7sBBVf2Jo3hS3XpvLKpsnhYME/NGGnodEiYRa18K6Y81bUGsL5I+MKPWYYn7at+7bNnArOt0ntqa2PT2tgi+01g/r/0IpB0PeZhd3HnOjgBGL5qJOfzYQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297439; c=relaxed/simple;
	bh=6scZ4X17fdv5dJgMUH+Z/tkYVkKNxVFN1ec5pCjMd+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jk7DqTUxOZRcoBYD8aB74NhqE0efxffsBhAaOS5B+cGRZIFKKLiLRJ7xbvq3KmLQZMh9K0PVMIfAlS6ni8S4VMmXCGAO9L5xEPvRPLUJbjvdQ6gRdgWIa61I55Rj0ZJRekIX7M+sdomlmNFPjDfO3m2La94GJ+zFj+9ABrhvIyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=I/Cv6cRQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="I/Cv6cRQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso7112975e9.2
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 01:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297436; x=1747902236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKxcqBU2nPIooApXHLbhnyTkcGwztZCP22EVNBbws9Y=;
        b=I/Cv6cRQgHww8Yh8hWwchjxF/dK8AbuQFP7vSzOreU+l99QXCdJPWUAo1N7NaD6bau
         vW5/YADE0A6PkTFBf9J539p5k9ZW1s/DX9e6eTQPG0tHYaofAHv/81ZmYeG2VHNbTjj+
         4fLbYPudEp6OvMvD/etVaftbKF9mtEXncsqp4xjVJeoqf64XJEuhwVmg6xjMuAz5lYc5
         rrXdQkq+oFMyxWDKQ/V79bRXHZdkvy9+rBAKJcRo/94eR98AQclT0GtwJuGPbP34Pd7J
         EhlTrpB6k8eQZEDfQhl+zj7ZEp3y2CrdvijK+Tt4hKYtgEbfVI/b2pY1Wd3dIiNu6WZx
         nxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297436; x=1747902236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKxcqBU2nPIooApXHLbhnyTkcGwztZCP22EVNBbws9Y=;
        b=Y/gSlzFtlszmt4x7++g1hDs9W8zOaF7Zf7t1YymO1ivmC5/eCnDrRtpf/eeqMnloKr
         qIKTajY1gghMJSFXsvN/+DJCe2ybH8DPjcALgVgZtBRP1r6H1+p3/1yRlDC3jt70FD2r
         G897CHlNVIViKnav9pLI0AXy0QnAWenGTdtLCOmnmuN0Hkqy5vJY/t66liVyg9Jf7Uw+
         N9XWUUMsCF29AWB6waOR++6ukNkzhzYJBxo4AouzaVpGsGumL6mSlWVplqVm02ArOG19
         fRJuIU8SvZnqHdXLsIRTkF94/0FbPxy6LfM3lSHoUZlOEwJPZ5f2N/b1C31mUuYKduFv
         +Ugg==
X-Forwarded-Encrypted: i=1; AJvYcCU6EKscB0ts776+Uv5rgiEj3B8lfT9HGpijo5PSZVFJ94LFHSp2rIN/t72vpI66xAeEuOpKtlyGa3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wsh8aPTVPhf4f4D/wUtqD0NVS5VamQEsagaFGoG8eMBJjgJ+
	bhbGN3C7zCdkRCYkdwsLEu/DfKm8PyeY4tfPXFpO1hwR8uDKZ5I+XO2sb2bnjRs=
X-Gm-Gg: ASbGnctPLdxaPc2jIWIgyFwuqBp04xlOUD5c7zNDvtSsE0N+PiMAIn75ujkUu+QaPb+
	SBbCpKpBC3XhfII+o2xI/lJ8zrNzwPg5xKVOZYG1EEU6puOynicueq6bGA2qWnjBqarum12rMrI
	697QIH4ndPkbkcAR/3IQwaNCjAUR/0sSxn0eSnI5kK9p+CpGflgdYpMo+odl6Mu2ZuSQspIukYb
	jbhSMsbhiw1ONMKWYYjrUW30ibFjPP/wWBfoCGMb1qd1A+5UP+4TvzEySJqW0tYHoAH1TyxqzX0
	gOR+m4dJnvJM+yFAbRhTqyn1fZFm7NqmlMakaf3Lr1xS2P7soeo=
X-Google-Smtp-Source: AGHT+IFz0FuSTvvFeV+6j/dLoSAMMI6plfd/uGaDa29QeKBmVTFM4URBXIUM54FLKxq4unv6VMcljA==
X-Received: by 2002:a05:600c:1c88:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-442f210d5d0mr60501515e9.19.1747297435883;
        Thu, 15 May 2025 01:23:55 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:55 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v7 10/14] riscv: misaligned: add a function to check misalign trap delegability
Date: Thu, 15 May 2025 10:22:11 +0200
Message-ID: <20250515082217.433227-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
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
 arch/riscv/include/asm/cpufeature.h  |  9 +++++++++
 arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index dbe5970d4fe6..09a5183345d4 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -80,6 +80,15 @@ static inline bool unaligned_ctl_available(void)
 }
 #endif
 
+#ifdef CONFIG_RISCV_MISALIGNED
+bool misaligned_traps_can_delegate(void);
+#else
+static inline bool misaligned_traps_can_delegate(void)
+{
+	return false;
+}
+#endif
+
 bool __init check_vector_unaligned_access_emulated_all_cpus(void);
 #if defined(CONFIG_RISCV_VECTOR_MISALIGNED)
 void check_vector_unaligned_access_emulated(struct work_struct *work __always_unused);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 287ec37021c8..f3ab84bc4632 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -726,10 +726,10 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
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
@@ -765,6 +765,7 @@ static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
 {
 	return 0;
 }
+
 #endif
 
 int cpu_online_unaligned_access_init(unsigned int cpu)
@@ -777,3 +778,15 @@ int cpu_online_unaligned_access_init(unsigned int cpu)
 
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


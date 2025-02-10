Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EFE250BF8
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 21:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223375; cv=none; b=uuWxpt2wWroVgQ2bk8n9HOeSuPBRqyOEkyKLdYFHs1fJIuj00SJLXfC0eAm4mQgjTBQV+/NP6B/zeG7lX4xsTnSwV1flf82J6wxMGAKt5T194pKUfHkikwsM2aVkuGTjJzb20U7H9wS17HwN4ItuNjYlCdifB0/gMMkB2gCMj5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223375; c=relaxed/simple;
	bh=F4Do9nbuxLrfh5xxDqR9A4aZTOH4TmDTDJYChmTpD4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsfCIIxAWcFoPypC9tOK0Xt7pPc0ZZD7M0h+PWLJ3BXB5QcKOIt3SH4r3MqtBeaRYN3TgzZgPPEanjpE9FRQ1FDiYQOln4w9eurA4oksftdxre8XvCQW3QJXHedyqFoDTbYpkebzfOvlpaChkkqz0SpHboXRI+fqWxeNtCLFv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=KXbXruID; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KXbXruID"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436345cc17bso33735405e9.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 13:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223371; x=1739828171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Omq0jMe02v0O4r8y1/1Uapc6yttVgCIGxdH7exDcAxo=;
        b=KXbXruIDB5G787QuytbS/uJyneis5sSddcj6YIG44vZiEAUCh25Q78QUIAC/vwyGiA
         A6PICK03/C/dN5x2nlfH0JAVtO2n4kxw1Gw3M09rnL1oRefT3Ey/DnDCsIHRJk6ZhyXI
         p7v//l/Z/cBaIm4xrVRrWc+GLNoQKOo93Khlis7KgCnOK34Op8z2ngFaL1QZ3XVFkU1h
         tVgn5KXfMYam6p+L+nwIWt6RoaNnwBsV9+skYR6HCzx8r9dZ5+QnBdolYsRLCokKaGqZ
         dEIeDvb6MbO+a59s+xZIwKNeQaow/Rdhe2O4vWsvNCudBc2yf9zpt9FFX98iFJvf1ven
         kMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223371; x=1739828171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Omq0jMe02v0O4r8y1/1Uapc6yttVgCIGxdH7exDcAxo=;
        b=vmz5/XCpn6OCqYgGo8DNXf7pULSnhHCfni6qFcbuiMT0EiuQfKzx+WRPaYkLoCuNcG
         Cuhilu+xftpof4LWAwNfUCDij1TqnIiZCX0M4aILp6jgye+OoJX2s96KnWuFszp5sYli
         E497aOY4iNF4xRysII0dHA1owwhP/lkD+hadNtgiTZgN2rP/JpOlVBJMudziEY9fYYmL
         pnRqMOJOs+WBTlX1GHEopujQWUsFYtfXnoixouTGVv6x+ZI6j9TrolMXB9jtAbs3ptWw
         kNRnkRUbcIfll29w97NfJMV6t5qZJ2kds+6ZX1hhl8uWhhiQusd3iFKz76cqkjzRwXT7
         +0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwilW8Y5drUJYqVdb+1LL+MQqbzEWKaeX1yoQXuZeKySPsnOyb19VZdB8NHgi47CHmbwJn+U4bQr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNQkLEG5lcXQTmCmRAbF2fG/ZlZnq4H8cDRFUL7rXx6CGzNaWm
	Z1/uqske1GP2v5RGypK/N2Nii6fpPfWK7/AhoSZcNmVDV72hldFPl8yQn6sF7vM=
X-Gm-Gg: ASbGncsIXl/XEsdX+0Vmi5xkoLCKhmUjVtIOhoiiD66ypHJYdKHEC4Hv+LYzT29LJxy
	Ip5Q1EGE6ser3j/w2z45Qvtm2YD5DAWLh4C6SXnA+Sv/9H/CKGcy8XjU1Kg276q0Yf0lMEyO9eb
	v/TGcKbwgqEE5x9bnkmJtJ/lA0PVN9Oj7D+GUujhZJW4lqOTQ1uAvVsDA0V2M11PLt1LRpYLZRZ
	LV0kUP30bVXHPRKFQwkl5Skv82cJvGmf2lXvuwmcNAdMj2V4mGhLTT81ktw8HVMkiwf6FeMpeKu
	uNDWg6DiXtkO1Jx4
X-Google-Smtp-Source: AGHT+IEW4IwiVYF//YV32GNZdcYc01vxx73uhLVhCiMW8eGAxNPBu731uRffpK0oYRexJJNizE9I8g==
X-Received: by 2002:a05:600c:510c:b0:434:a4b3:5ebe with SMTP id 5b1f17b1804b1-4394c847ad4mr11919565e9.24.1739223371617;
        Mon, 10 Feb 2025 13:36:11 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:11 -0800 (PST)
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
Subject: [PATCH v2 06/15] riscv: misaligned: add a function to check misalign trap delegability
Date: Mon, 10 Feb 2025 22:35:39 +0100
Message-ID: <20250210213549.1867704-7-cleger@rivosinc.com>
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

Checking for the delegability of the misaligned access trap is needed
for the KVM FWFT extension implementation. Add a function to get the
delegability of the misaligned trap exception.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
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
index 7d6185deea33..1d523cf96ff0 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -716,6 +716,8 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
 }
 #endif
 
+static bool misaligned_traps_delegated;
+
 #ifdef CONFIG_RISCV_SBI
 
 struct misaligned_deleg_req {
@@ -732,8 +734,6 @@ static int sbi_request_unaligned_delegation(void)
 	return sbi_err_map_linux_errno(ret.error);
 }
 
-static bool misaligned_traps_delegated;
-
 static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
 {
 	if (sbi_request_unaligned_delegation() && misaligned_traps_delegated) {
@@ -782,6 +782,7 @@ static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
 {
 	return 0;
 }
+
 #endif
 
 int cpu_online_unaligned_access_init(unsigned int cpu)
@@ -792,3 +793,15 @@ int cpu_online_unaligned_access_init(unsigned int cpu)
 
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
\ No newline at end of file
-- 
2.47.2


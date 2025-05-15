Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357462920AF
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297436; cv=none; b=j4/rOhwdVumD+ZDgHN45V76OL/tS074V8Xd77yIRTF0Ss5k6hmKFYHX1ATrImtMltkR56RjEkI56QHbibPsd8bL5HE52HNGtMGMFIgE61raazZVPsbWsPhGF7SnbnA0+E7v8C0Rts0duADKC7cYM6wsgkolmAD14vxpe3d19PHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297436; c=relaxed/simple;
	bh=MaIrwOKv+YVVxdhE/r+zc5gTHYqZ311Osy8lrbnqATY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dr5hFGBUr4JslCMo/nZJ47Dxwdwrtd5UeEI7T1Ooj4gCJ5x/yTmKJq6N4CoQgLVPfuCLa80VOwn09SI8QUNMU6rAn/+7qgOH1GhQXAt8O5Ri2N5cfQ0fdIFk+/asg8HjSjsVLmkgzYgbK3VW263j3jCRv1qBzfwIolUJG7JIfe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=EK2gjO+q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="EK2gjO+q"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1f9791a4dso385201f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 01:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297432; x=1747902232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iF+NUUhZJ5jxYVuPSRzuPMezDiacMrJKv4fNDBdRi4=;
        b=EK2gjO+qaczb3fcaIgJO9UwDj16ed11AoFoahsgYGSPGpoJxK0u2vB27BUMRSN917a
         0B5x7CJ8QdSumLxLUOTSRaFuqNO5CWt4HlZ5VZAAaDOKaRpeDBTUnL+7yAJMqZMcJdoH
         oDGxc6BXbBveVJKLIm6TqRJkghM+L1gdw2MWUHdd+0QUEeoIn+i/9hXBzk19TBCqhkeT
         WsWF8g+oxOKFAW0zm51XIPYIKPO6g1G45oXunHjqgbNa4y3eRMIe+3VKWV236oTzoolM
         +5MTxDqZqTAckpT1HMobwyef1NClMUw0Qv5xrSYhWXVYaJfFIBfCy9gmDz5JAcH/a9zB
         moNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297432; x=1747902232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iF+NUUhZJ5jxYVuPSRzuPMezDiacMrJKv4fNDBdRi4=;
        b=wZYqjiL32vPNls600V3Ho6E3dGdPSC5RLY09wD1FQyM1g6KKp8GzCzuR3NDbkwHjy5
         3ywGSV0643TOnK3TtS1DNK/u48cyfVVIl1UMrkOjwpNfRGQxq3CWIoonyLrrmr6Ky4Kv
         tGaP/hOmMw/Tgj7Ce+ULULS2wmdxaGlk6kxCdFdQ7uwwd/oVaqQBmq7M2Yl23HCaQjxi
         NTo9GeT6SaC8xrs0FMfUJGBsUMy4q3n38ZrbgB3o3HC3BHeboujA8cY5liQ+huX54xsO
         N4+EWTQnUHrX1erQ0YsEThcRuoIkbSV/nuRO5G2jSA1ZR0yV65P0b1bmWm3HpgEHymyX
         azFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr7aGhW3uMgQ4Q5SaIzVnB8nOQfrCyY27lXwaoO/WU9LHxgqDpO3p3214bcV7XlqAaC2fJSgLe+/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4u5TBk5YJ08qXmeetjXWVDG3qrPNZih3Qeu4Fw/snka0ySXG2
	20XkA89+yo1nGn+FYAxQfCMG0QCER02kiwzFIyMRYTQVK6LNVvG4oqqAMkAcoOY=
X-Gm-Gg: ASbGncvtatcvFDDhsnPJw0Wg1hgmpoSRAWf2uRRHq83R+A58noUTrnOigKlC5dU91HO
	VubabOE0Z3Fc4VmMYgJrtTcrZhxWxVwt8BrA54aQJzK2nkWPLSYQRg6pi76Zi4CtvRPJdbkOZHn
	BehEH00erKoQZhoCmthHd5QA3QEvXet8cy/qHX/gIzsXVjy18+x7IQwLCei5eOYzI9S2UW2GLLI
	yOK29vDG/UkZfbZn/xnuQAswnv8jRV95XDyEmf/WI1CTQ2g435bqWrXug97hwnbZhBqsOipm0bp
	3v4QJJl67PnSGXubn6OGsbSXARnWaFruTikX884aTpmImUQvxKe/t7ltOOTMXA==
X-Google-Smtp-Source: AGHT+IG/sxfuxXzoVLJQzgwnpP2BoJhjD/oKnctxBNP0O5v4fRD4OfvNOZerKN94X8y7ctt3mQZ17w==
X-Received: by 2002:a5d:5f8e:0:b0:3a1:f535:e9be with SMTP id ffacd0b85a97d-3a349694ac7mr5405960f8f.7.1747297432412;
        Thu, 15 May 2025 01:23:52 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:51 -0700 (PDT)
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
Subject: [PATCH v7 07/14] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Thu, 15 May 2025 10:22:08 +0200
Message-ID: <20250515082217.433227-8-cleger@rivosinc.com>
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

schedule_on_each_cpu() was used without any good reason while documented
as very slow. This call was in the boot path, so better use
on_each_cpu() for scalar misaligned checking. Vector misaligned check
still needs to use schedule_on_each_cpu() since it requires irqs to be
enabled but that's less of a problem since this code is ran in a kthread.
Add a comment to explicit that.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 592b1a28e897..34b4a4e9dfca 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -627,6 +627,10 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
+	/*
+	 * While being documented as very slow, schedule_on_each_cpu() is used since
+	 * kernel_vector_begin() expects irqs to be enabled or it will panic()
+	 */
 	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
 
 	for_each_online_cpu(cpu)
@@ -647,7 +651,7 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 
 static bool unaligned_ctl __read_mostly;
 
-static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
+static void check_unaligned_access_emulated(void *arg __always_unused)
 {
 	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
@@ -688,7 +692,7 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
-	schedule_on_each_cpu(check_unaligned_access_emulated);
+	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
 
 	for_each_online_cpu(cpu)
 		if (per_cpu(misaligned_access_speed, cpu)
-- 
2.49.0


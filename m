Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4814F70
	for <linux-doc@vger.kernel.org>; Sun, 18 Aug 2024 06:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723963375; cv=none; b=SYvdrafCWp40mTzOQ154Za/lvQcRcUml5+AnpmVesVGPC4KheT5vM3TlHXTWf4+k1uPerkF/HlKUTuHX2ZAoAyReFkm0zQgbN15Iy13mjpPJ58n/9liLZT/rzOa96VHTz511L28js5fIGCWvx90Q3EdcobbY4k2hGADQ07By7XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723963375; c=relaxed/simple;
	bh=sRPSYdpr70kDnUmWl16TfbREyKeQnnlWJPh7z2q//BU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rqUOV9QYmxjLO8QBzkwbYYM20V5WA1K1Ldy7W/jdrwqqQTwvstB8ShgrNcWfud2SM5MNoQe1ceMyN1FPB5QVGK+8uQM8RgwgBhqoePArr3p8Z5kcSFnokVTE//aaQXzvvl/tbLOveKI+e7HUCmxuGjbTLG8DJVcuxiY4efCAkU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tz5D02/u; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tz5D02/u"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42812945633so28003875e9.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Aug 2024 23:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963372; x=1724568172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quUzKJl3l9W/iH7huB/Ox/rGh7MBHVzUurNoeTrSXJY=;
        b=tz5D02/uCgrRxmvxomjzVDYx5pZEu+KZK8Q3PJq87Jd+kTRif9MReBc5/meIvYDoCb
         WtOjFxY2EJe7lNubPfyqINmGbIu/ZEpeKF6i9T1YOv+AjBBpkqxbUJLL9E6Y3nbuMLtZ
         GPZl+pL8dezAeSSnsRURZf6BqXuplzsHTenx/PJlqAnWm4+FKggrhE4CZxAU3pW7kE8y
         Kb/8EOcCqa4o59DDuXFQM/vARh94eM/OXo69Pe37+hP88jKIxfz2tLk/gWuqsGvDy8VK
         4PC4FyLrvpfBaXsL//WY3nDXS/k6cpBO/bRne6UL5vTN1AgHXLZzRf6TSSA+J7GJ9cN0
         6TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963372; x=1724568172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quUzKJl3l9W/iH7huB/Ox/rGh7MBHVzUurNoeTrSXJY=;
        b=uOnmDy6VbDYwZ7lGnMKeKIQZdgKnMFVkbuW5ShxI9eCCibJ7CSnjcIx5yaxHQ8F6dj
         xlVJ3G/urNAxwxp4jyt4xAIziFX+mVY3ZPkO0EamsnmzOtY2W9NtTB8FFZYV3MpiJkNd
         J0E9TB+so5TEUtI+H/ulxzcG/EV2oUC12TnR9zNlh0W1j3AtCp0wXPc0PtStWWLZx1Aj
         /8mIjuds+uzONNgr8g73vGV2RgHs4ybPzD4vd/ps6W8F49X9gP8HrYZFTXcdtVToD4gE
         ctInmbboV7ueIAYSb7gaanih5nvmc8Q64LS13QmMtTY2QbV0jv1+9kSwxr2noVcTjh2G
         Zl7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWEX8tNa21N+DcI1Oo04eRyoYYIoyO+6mEf8+G9oLG8PhgUX88s0s6rR66U6KND0DUrREnZA+UI9jWvxWzmaNaVehiub4M1EUR
X-Gm-Message-State: AOJu0YxKN8YdkZLJdhnUDROfh/4nYoyQw6rg8CJlamvqA3eXK5FT47Hz
	N9z/TkKfBqP9dwliyMcgV9HT0v8iN9fD1feTtLyUmMwmszqa/p84GMV1vkrlASc=
X-Google-Smtp-Source: AGHT+IEe0ieY97eTK1clBc3HGi9QZxo6cf+OA5t5L0JQLmZOTEmF4/dAe6bc3mWD2TnCj1Dfw0jsiA==
X-Received: by 2002:a05:600c:3509:b0:426:6b92:387d with SMTP id 5b1f17b1804b1-429ed7b8860mr53677765e9.21.1723963372179;
        Sat, 17 Aug 2024 23:42:52 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed7945b8sm66605265e9.44.2024.08.17.23.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:42:51 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 07/13] riscv: Implement arch_cmpxchg128() using Zacas
Date: Sun, 18 Aug 2024 08:35:32 +0200
Message-Id: <20240818063538.6651-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240818063538.6651-1-alexghiti@rivosinc.com>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that Zacas is supported in the kernel, let's use the double word
atomic version of amocas to improve the SLUB allocator.

Note that we have to select fixed registers, otherwise gcc fails to pick
even registers and then produces a reserved encoding which fails to
assemble.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/cmpxchg.h | 38 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 212ec2aab389..ef55ab94027e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
+	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 5b2f95f7f310..05ba8a8e2ef5 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -296,6 +296,44 @@
 	arch_cmpxchg_release((ptr), (o), (n));				\
 })
 
+#if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS)
+
+#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
+
+union __u128_halves {
+	u128 full;
+	struct {
+		u64 low, high;
+	};
+};
+
+#define __arch_cmpxchg128(p, o, n, cas_sfx)					\
+({										\
+	__typeof__(*(p)) __o = (o);                                             \
+	union __u128_halves __hn = { .full = (n) };				\
+	union __u128_halves __ho = { .full = (__o) };				\
+	register unsigned long t1 asm ("t1") = __hn.low;			\
+	register unsigned long t2 asm ("t2") = __hn.high;			\
+	register unsigned long t3 asm ("t3") = __ho.low;			\
+	register unsigned long t4 asm ("t4") = __ho.high;			\
+										\
+	__asm__ __volatile__ (							\
+		 "       amocas.q" cas_sfx " %0, %z3, %2"			\
+		 : "+&r" (t3), "+&r" (t4), "+A" (*(p))				\
+		 : "rJ" (t1), "rJ" (t2)						\
+		 : "memory");							\
+										\
+		 ((u128)t4 << 64) | t3;						\
+})
+
+#define arch_cmpxchg128(ptr, o, n)						\
+	__arch_cmpxchg128((ptr), (o), (n), ".aqrl")
+
+#define arch_cmpxchg128_local(ptr, o, n)					\
+	__arch_cmpxchg128((ptr), (o), (n), "")
+
+#endif /* CONFIG_64BIT && CONFIG_RISCV_ISA_ZACAS */
+
 #ifdef CONFIG_RISCV_ISA_ZAWRS
 /*
  * Despite wrs.nto being "WRS-with-no-timeout", in the absence of changes to
-- 
2.39.2


Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC5111A8
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 06:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197264; cv=none; b=Ul5foMFx0qa3Jk3fVCX2S/X2lp9P4SsQuy4wgDtygc1OqSp5IBboULzQL72J5wNBkzynKsFXcVkgtujlLU77ov62sLiNZzBUm7BXTrnGZo3gIU9+NnUNDRC3FLqBDeIUCb1SUqgaTMBB+ImK7Fk/DuR1vG6+iRXSjt5uysZlJrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197264; c=relaxed/simple;
	bh=SXM4rwRn+leJo0pY0SefkogHqfR8LE/yvz/Y5VWFmfY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WO0xoi5mcA7uLzG5HZKTy8cStn/rR/IecBBKRhcWOQW+DqMlLi9Tcqk9o4T7ACDB0ffjE174PLk0ASyMGGDI3c+3AlW2UYlnWmGr57EUHl9KVNTqMr1j+KKj1H9uLXBQRHu1eQhLt90iUepZyZgOmS+yT7/9OphGv0XlIqMfNtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NO6C4MFc; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NO6C4MFc"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-367b8a60b60so3537965f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 23:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197261; x=1721802061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObJKiPOVe5UThPd0qvfEFz5Dv3ABd72erfyOiynPtd0=;
        b=NO6C4MFccp6jMYUp14P2O8wo0mBXLQl6LHFIuVweezaHf1jUvJie9NmZVZ0ZlFQi8H
         wDY18VV5pgJBylc6QQI6pv2EtwmXFCspGDWNt7TfUutbEHRaLi6tKVk4+IA/x09mQ8SD
         q9gm7kYx5Tlc9vTUvCPdPHChI64mu8vTVM+A5r18hmO0CePM2bGgCc7iUOXwvSvc/5RV
         V808mT4G9+0wbzBHjzaTFKcZbkKnaR+5NATSw+JpgRp1PsHO0N6k18WYsovFOkYFQgol
         UegyJfdiNS6B1RKv7Ex6GrE3xMbhpD/CcTFtMxWoRIbsaxHuwi3GSe5KlxnSbSMhmwoF
         B77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197261; x=1721802061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObJKiPOVe5UThPd0qvfEFz5Dv3ABd72erfyOiynPtd0=;
        b=Ox1l4iPvj2vqDDgbOjXjw9YkksE9i9NdlqgWYMl+gN53MRygLTXB6FBo8s18wMYr8/
         ifNh+akMHHuLzXNQXnEMAO7z4fZ3Mj+1Et+AWUOEOUDAzIBW1bTR1wL0y7pHMTwm1cLx
         9VcrhUJTaiLB+S2wjHysDPl/xizH5PhK7JiJzPb7cODWLFWj5+ALMTmLpP3PTmsfAR2l
         SexI9T3scpqOekFlb28mWPmlgygd/okEZWzdKYzJN2LOFfmtZZKDWbRDr113USHstPkd
         871z4LE1vhEpXQrFdnK2PagOgpOeOCrEUAg/o7uQutZWZ/I0X1ll/Yyp0XFdUSEx7ook
         HKKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBqy9JoLBef06/zHg2fV5fvoXlzZwr3jzlRYaNjbswGhsc9Q3HPna9phvO3ElqgnDFGjHioaiOJYEsaLAlvmzsmIAQ3JCgR6N6
X-Gm-Message-State: AOJu0YyWHZS/lxX5tjJMMw4tCdgqeLlhoJEuyQOautxk91CbE/vFvq9v
	fotZ9zpsI+CGL+U8SGvEd3U3Lj0BdeYYFdIhIWiZ/4oxVu5xWFiV3UBV69qWdGU=
X-Google-Smtp-Source: AGHT+IEiqDUUVGHtWHIaIo4kIBhavsk6wpSjfOY4FyjkQmBFXrWWxjPRklD8XBy60kYG9vsl83pQBA==
X-Received: by 2002:a5d:6a8c:0:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-36837ac4476mr188365f8f.31.1721197261060;
        Tue, 16 Jul 2024 23:21:01 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3cd1sm10867433f8f.22.2024.07.16.23.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:21:00 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 01/11] riscv: Implement cmpxchg32/64() using Zacas
Date: Wed, 17 Jul 2024 08:19:47 +0200
Message-Id: <20240717061957.140712-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds runtime support for Zacas in cmpxchg operations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig               | 17 +++++++++++++++++
 arch/riscv/Makefile              |  3 +++
 arch/riscv/include/asm/cmpxchg.h | 26 +++++++++++++++++++++++---
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 05ccba8ca33a..1caaedec88c7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -596,6 +596,23 @@ config RISCV_ISA_V_PREEMPTIVE
 	  preemption. Enabling this config will result in higher memory
 	  consumption due to the allocation of per-task's kernel Vector context.
 
+config TOOLCHAIN_HAS_ZACAS
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZACAS
+	bool "Zacas extension support for atomic CAS"
+	depends on TOOLCHAIN_HAS_ZACAS
+	default y
+	help
+	  Enable the use of the Zacas ISA-extension to implement kernel atomic
+	  cmpxchg operations when it is detected at boot.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 06de9d365088..9fd13d7a9cc6 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -85,6 +85,9 @@ endif
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
+# Check if the toolchain supports Zacas
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 808b4c78462e..5d38153e2f13 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -9,6 +9,7 @@
 #include <linux/bug.h>
 
 #include <asm/fence.h>
+#include <asm/alternative.h>
 
 #define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
 ({									\
@@ -134,21 +135,40 @@
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
+#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
 ({									\
+	__label__ no_zacas, end;					\
 	register unsigned int __rc;					\
 									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
+		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
+				     RISCV_ISA_EXT_ZACAS, 1)		\
+			 : : : : no_zacas);				\
+									\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
+			append						\
+			: "+&r" (r), "+A" (*(p))			\
+			: "rJ" (n)					\
+			: "memory");					\
+		goto end;						\
+	}								\
+									\
+no_zacas:								\
 	__asm__ __volatile__ (						\
 		prepend							\
 		"0:	lr" lr_sfx " %0, %2\n"				\
 		"	bne  %0, %z3, 1f\n"				\
-		"	sc" sc_sfx " %1, %z4, %2\n"			\
+		"	sc" sc_cas_sfx " %1, %z4, %2\n"			\
 		"	bnez %1, 0b\n"					\
 		append							\
 		"1:\n"							\
 		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
 		: "rJ" (co o), "rJ" (n)					\
 		: "memory");						\
+									\
+end:;									\
 })
 
 #define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
@@ -156,7 +176,7 @@
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
 	__typeof__(*(__ptr)) __new = (new);				\
-	__typeof__(*(__ptr)) __ret;					\
+	__typeof__(*(__ptr)) __ret = (old);				\
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-- 
2.39.2


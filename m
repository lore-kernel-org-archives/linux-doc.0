Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CF01BF3A
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 06:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197386; cv=none; b=dvVtSyt8vxtvuGLASaPHJmVr+wqHWoYhZRilyn4YIivO8PaXDsYmymlkT5OsmVZiNFMgCd3HpNcbqghUGrbe2qNQ4uzhoxfRyUhtYp25XMJTEfeh79uy2tfLSRd18pTBG8DM1VOMxyf0BLg7BYgoTpst2xBf8zz9Ke79kJfzlAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197386; c=relaxed/simple;
	bh=bde5DyyiE12OaoL1Ez5kRf1Jyic7KdWN1Z4jecTYxiw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GeIIi714910TmcykcVyGwYb4i1aOHTuCbCkOHPHdW7+uYzKEb5hPAb4EcwQLDsTlv8Dsp56ZfBitqja0xxNAdBWwBehu2JJmofVQFyFbBMdLv7/I53gsYXoR2nKGZdbUxEA87TfK0a/9VkHSkcPeB6x78fkJvJJuY5yIgthSDcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=z8QF1et9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="z8QF1et9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42797bcfc77so45273275e9.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 23:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197384; x=1721802184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QjpPjoLwI+58peQzByots6FWlw3e8eiNriVwaJAk3o=;
        b=z8QF1et9TcQeCmN7iu6Mx+4JDIhCFTbyXwoTW/WlV4PeyL8mygeMgxKkbqvShnttHk
         89j8FIpxMw29KoQeA6d3OgOgrCNV63QmzHwtzjUh8dVe1O1KX/8l3ZD6HB3Et2mp/qDk
         zOWx/5ksllZrdQvIcpWAH+TtiGm6vRdI/cTEAIbfIRv7/QgTHcoUgHLqyVPlxLil9Rlg
         HHPHoRSWiW1AsuDj14pVPIZ5cB8n7ySiZQhT5RZ5E7HlnLhB3wIPsPCUCHQT69ZiAnPa
         5FjOkn+Cr+KSGvfRcio3CDMnLgY0uGozbkaI8FfnFPwB1Zw3KRZdPDu8Jicute4Ui3iu
         p91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197384; x=1721802184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QjpPjoLwI+58peQzByots6FWlw3e8eiNriVwaJAk3o=;
        b=RVz2VJGSkRivUdLBNI8/bXOY/gQgZHX8uRpLmNegPaOuBi3nCEdPdL+K+V8r57bZ/Z
         VpITQNHoKq7G1GDoOBcYoCT5FRx3NxlA4YKMs2sl2tg7z2E7x3RNB6aTol4Yd8juxwMZ
         xrhgLKPStWBushneU3SQ0gquKQAEJ29jl0NalsLA/oV6crAtUzjFCvfOMP+PFGTB/v9T
         kg5Rh5lik+t9h6Ef66eS5PE20qQMnp82a1xRtYwzG6iQi37gdDkiY+AN5qcku+a76UWP
         /yhdnTdYGKSptVv39haH+xRaXLP2nuQvL6cdQA1oG5zTaYzBPXni5ZytIfudH3djsoZn
         sgrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiX8EsWITfMceMxvxENHJYpLDhZXPa1psnbt+1aaeicGnR54NhRj30j1Yw7k2ZOHzx8jbPZ8tAdU2jxsxCrDedAh37lBmr98vv
X-Gm-Message-State: AOJu0YziJT9NFb4wmB8bfNZgFbdoNe0PsEMAmYl6Y3t5g5ZUZ9ihud4U
	2yP/fpxdMdYdeH9uHGTp8vjWHMAM3wTpOlSVqhU4kvUdM4J8uPG0LdB7g0CmJWs=
X-Google-Smtp-Source: AGHT+IFPLb6pDwn4ZT2PDYb1qbrSJD7FUpoL0IeRpIU13kaHx3oluVLPGx9Y3b3221ag/XCVCbja3g==
X-Received: by 2002:a05:600c:3592:b0:426:5dca:50a with SMTP id 5b1f17b1804b1-427c2ce6539mr4895335e9.21.1721197383614;
        Tue, 16 Jul 2024 23:23:03 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db03e41sm10773043f8f.98.2024.07.16.23.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:23:03 -0700 (PDT)
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
Subject: [PATCH v3 03/11] riscv: Implement cmpxchg8/16() using Zabha
Date: Wed, 17 Jul 2024 08:19:49 +0200
Message-Id: <20240717061957.140712-4-alexghiti@rivosinc.com>
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

This adds runtime support for Zabha in cmpxchg8/16() operations.

Note that in the absence of Zacas support in the toolchain, CAS
instructions from Zabha won't be used.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig               | 17 ++++++++++++++++
 arch/riscv/Makefile              |  3 +++
 arch/riscv/include/asm/cmpxchg.h | 33 ++++++++++++++++++++++++++++++--
 arch/riscv/include/asm/hwcap.h   |  1 +
 arch/riscv/kernel/cpufeature.c   |  1 +
 5 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1caaedec88c7..d3b0f92f92da 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -596,6 +596,23 @@ config RISCV_ISA_V_PREEMPTIVE
 	  preemption. Enabling this config will result in higher memory
 	  consumption due to the allocation of per-task's kernel Vector context.
 
+config TOOLCHAIN_HAS_ZABHA
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZABHA
+	bool "Zabha extension support for atomic byte/halfword operations"
+	depends on TOOLCHAIN_HAS_ZABHA
+	default y
+	help
+	  Enable the use of the Zabha ISA-extension to implement kernel
+	  byte/halfword atomic memory operations when it is detected at boot.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZACAS
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 9fd13d7a9cc6..78dcaaeebf4e 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -88,6 +88,9 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 # Check if the toolchain supports Zacas
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
 
+# Check if the toolchain supports Zabha
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 5d38153e2f13..c86722a101d0 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -105,8 +105,30 @@
  * indicated by comparing RETURN with OLD.
  */
 
-#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
+#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
 ({									\
+	__label__ no_zabha_zacas, end;					\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&			\
+	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
+		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
+				     RISCV_ISA_EXT_ZABHA, 1)		\
+			 : : : : no_zabha_zacas);			\
+		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
+				     RISCV_ISA_EXT_ZACAS, 1)		\
+			 : : : : no_zabha_zacas);			\
+									\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"	amocas" cas_sfx " %0, %z2, %1\n"	\
+			append						\
+			: "+&r" (r), "+A" (*(p))			\
+			: "rJ" (n)					\
+			: "memory");					\
+		goto end;						\
+	}								\
+									\
+no_zabha_zacas:;							\
 	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
 	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
 	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
@@ -133,6 +155,8 @@
 		: "memory");						\
 									\
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+									\
+end:;									\
 })
 
 #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
@@ -180,8 +204,13 @@ end:;									\
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
+		__arch_cmpxchg_masked(sc_sfx, ".b" sc_sfx,		\
+					prepend, append,		\
+					__ret, __ptr, __old, __new);    \
+		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_sfx, prepend, append,		\
+		__arch_cmpxchg_masked(sc_sfx, ".h" sc_sfx,		\
+					prepend, append,		\
 					__ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..f71ddd2ca163 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_ZABHA		75
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5ef48cb20ee1..c125d82c894b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -257,6 +257,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
-- 
2.39.2


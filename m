Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD973DF59
	for <linux-doc@vger.kernel.org>; Sun, 18 Aug 2024 06:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723963129; cv=none; b=PxVllFk7ndF1ZlTs6G6k4QlxXFTHLboXen1LEP4m4q0sdR+JZ1k2CC5fClZCerj+rTMJ6TYUt/xxluVZrM9c7J2vFC1pfukQWI7iqeM8aJCM4SgYPcsZGICq3BbqQIg6tBRXIz7mpCTN8NuPtLwRiqIh4P8UIrtwPfLgNVa3eWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723963129; c=relaxed/simple;
	bh=gDF2VWVMCr0OWTZfcqqsgA0khsQjVyY2MClD81Q70wk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cna9M794ZGcQWfhae4pn5SVBBVd5XWzboGycLZZlssfjvePXLGmKuquvxtjwu7u7akQrj3hHhuQOL/MLsaN2vxDmZxjZzRn7pUAyOqvTtgvodW+xYtnzs27RMNM0UQrIKPGzbTRO3WI6kogZwVSTT4AUHZrbaVmmtxSwRW2QgHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ciyggjcf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ciyggjcf"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37186c2278bso1807095f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 17 Aug 2024 23:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963126; x=1724567926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgpIYh7KuQW+iTbAJx3HXjQmOubS3QQ17d+o/pur+bQ=;
        b=ciyggjcfKkyG5WWx6+/WxNu5UaYeFgIcQdY1xWJp/Fruonsq2Y44MtGctFDXCIqUmV
         BEeSSXuLLw45MixLQow2FkXgDnq428PJM6BzJwmHcsXWUSaEmm95YVWGo7zbgJ7Mo/Bh
         K973bQNsvpT3Ko6RQtP3L6WrJyq5a+v3/UM2qXDrepFATglW3AJ0cvAqDHNc9pFcnceb
         rspFMVDQL1ziceD48Z7/PmOQgIoQbr/pPu/sfLW0X+dz+oCHNEll52j8QI0FCGLyIcUZ
         hQ1Jape/uTMpWlp8yfp8XhTbX6RHH+oE2GZbKckLydlW94cC7VHI7sJz8L85AaEkehwF
         0POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963126; x=1724567926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgpIYh7KuQW+iTbAJx3HXjQmOubS3QQ17d+o/pur+bQ=;
        b=Fl+M31QzCYTQ9D4Y2uTBeK1ebD9yqmRMm6fig8Z1k3sAzOS0/0EX2vH0FkCJ96MF58
         CZN6AjyhyPLm/vU473mH51dj19X86PuIOg1j8NKbdi1Y1as2pqDQ1c4yv4w4LBZLaisx
         MQn6+hhKZivcotpzLc6vw0X53yXAw3N+iHghTe+dxo/047iZxNRHpheHDLf9xFaSIQ8Y
         MNqxHYSJxhhsTqhv8GiIWS/64u/7Kr5sMBKYfapi2UmaTMoPauznivVr5P9Xs0IrXIZO
         fKmwMLov8eBUv9LNoBQJfaDEkLnKK+cEBnS6GA1WKF4OyBj8LnJtEIz3BWi9KRHcjt0Q
         dz0g==
X-Forwarded-Encrypted: i=1; AJvYcCV/CH+0jTARdccyabiaOXoTWVLVmsJZbt3xuvRYrM8sg0sDYBjkkl43KgVF95iI8hd7Byz0TqsapMdNz+wDEnCeCrrqhq0cbmL9
X-Gm-Message-State: AOJu0YxNmzRVrnph2qenDUpVaVeWjZU981ULZ5H/yVKlwm7JTVrCH93o
	/6i1csixi2wR4t/CzkrrurpM8ksuQWjpctaYSqBFxTWx8SIke2WBIYg1kj16vUM=
X-Google-Smtp-Source: AGHT+IH8V6P8ozp0CwQCJM5ywpee/RSEJ1cgWdpG4qWioSCMxPEkZ3gtZHRrHCz0XJWkyE2olycTYw==
X-Received: by 2002:adf:f648:0:b0:366:ee84:6a77 with SMTP id ffacd0b85a97d-37186bbd203mr7255006f8f.3.1723963125945;
        Sat, 17 Aug 2024 23:38:45 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429eeadfafbsm62053035e9.47.2024.08.17.23.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:38:45 -0700 (PDT)
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
Subject: [PATCH v5 03/13] riscv: Implement cmpxchg32/64() using Zacas
Date: Sun, 18 Aug 2024 08:35:28 +0200
Message-Id: <20240818063538.6651-4-alexghiti@rivosinc.com>
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

This adds runtime support for Zacas in cmpxchg operations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig               | 16 +++++++++++
 arch/riscv/Makefile              |  3 ++
 arch/riscv/include/asm/cmpxchg.h | 48 +++++++++++++++++++++-----------
 3 files changed, 50 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..d955c64d50c2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -613,6 +613,22 @@ config RISCV_ISA_ZAWRS
 	  use of these instructions in the kernel when the Zawrs extension is
 	  detected at boot.
 
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
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	  Enable the use of the Zacas ISA-extension to implement kernel atomic
+	  cmpxchg operations when it is detected at boot.
+
 	  If you don't know what to do here, say Y.
 
 config TOOLCHAIN_HAS_ZBB
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6fe682139d2e..f1788131d5fe 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -82,6 +82,9 @@ else
 riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei
 endif
 
+# Check if the toolchain supports Zacas
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ac1d7df898ef..39c1daf39f6a 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -12,6 +12,7 @@
 #include <asm/fence.h>
 #include <asm/hwcap.h>
 #include <asm/insn-def.h>
+#include <asm/cpufeature-macros.h>
 
 #define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
 ({									\
@@ -137,24 +138,37 @@
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
+#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
 ({									\
-	register unsigned int __rc;					\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
+		r = o;							\
 									\
-	__asm__ __volatile__ (						\
-		prepend							\
-		"0:	lr" lr_sfx " %0, %2\n"				\
-		"	bne  %0, %z3, 1f\n"				\
-		"	sc" sc_sfx " %1, %z4, %2\n"			\
-		"	bnez %1, 0b\n"					\
-		append							\
-		"1:\n"							\
-		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
-		: "rJ" (co o), "rJ" (n)					\
-		: "memory");						\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
+			append						\
+			: "+&r" (r), "+A" (*(p))			\
+			: "rJ" (n)					\
+			: "memory");					\
+	} else {							\
+		register unsigned int __rc;				\
+									\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"0:	lr" lr_sfx " %0, %2\n"			\
+			"	bne  %0, %z3, 1f\n"			\
+			"	sc" sc_cas_sfx " %1, %z4, %2\n"		\
+			"	bnez %1, 0b\n"				\
+			append						\
+			"1:\n"						\
+			: "=&r" (r), "=&r" (__rc), "+A" (*(p))		\
+			: "rJ" (co o), "rJ" (n)				\
+			: "memory");					\
+	}								\
 })
 
-#define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
+#define _arch_cmpxchg(ptr, old, new, sc_cas_sfx, prepend, append)	\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
@@ -164,15 +178,15 @@
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_sfx, prepend, append,		\
+		__arch_cmpxchg_masked(sc_cas_sfx, prepend, append,	\
 					__ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
-		__arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,	\
+		__arch_cmpxchg(".w", ".w" sc_cas_sfx, prepend, append,	\
 				__ret, __ptr, (long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__arch_cmpxchg(".d", ".d" sc_sfx, prepend, append,	\
+		__arch_cmpxchg(".d", ".d" sc_cas_sfx, prepend, append,	\
 				__ret, __ptr, /**/, __old, __new);	\
 		break;							\
 	default:							\
-- 
2.39.2


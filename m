Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC83185E61
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719407280; cv=none; b=bPvuIUktD0BaMqNCMfuQaGZme95NU8V4cy2xd/RpHUEAFAm33uBckmMp8PuTURWs3x+52BZAeNyD6cMMX3WBK7q92n0SdYdpm7OWAxVbDj/ITuMWDQzv2dP8Lv4npzmRh8K2ZX3Qq0kgzAs1hlYQWQ4pplI+lsuVxYkzeiHRvOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719407280; c=relaxed/simple;
	bh=E1dArXUJoA5c+pEIPLkeGZNPzuED9bTXBuqFFCJr2HY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f9qR7/k+M6YZd0WyHIe6vUOrDLJ1+1CvVZVNJ/enOZ4I9/ZGVsvb5QyaHFyEGMWDsxmMtKpL2KTcIZuA5x0mqnqlc1V0rSK8WaW0wwXBXsL4jqUKDZfCr92OvpKSEOVe8iHe2IZWKSm8uzw9nk941gsPghfyEhHk6/eHKn2GgIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=n/yob9B7; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="n/yob9B7"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so88816491fa.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 06:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719407276; x=1720012076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y2lg3OgYzhfS3tcxdHdgy6tUi+qEwW8C3VWq7VXFkI=;
        b=n/yob9B7HDNO0+wjSlLGNzd+niUZ/e30zroxnGXX0Ra6viTm+0R3Ihv9MyqsI/pmwj
         moIMg5IGhCMrzW+PA4NxHIMpsIKBTXSNQt2klBlYA1anz387zVjKgWhQGqXEXb/WAkwv
         TmlFoZy6aYYN28YbehILy+fy3IvVDCp4RQSyFpPLgmEZzXWmopfmB5GNFDGmSu+4R5P7
         D+g5nOgCgN6p33vEnk8TAbRj25DFQDfzwF8qOrFyjn/xsvA8shJgYGRDrIKnTdDC+C24
         BBwqy3WFV9u38xE2cNJAdabCYYXPzsaXw2Pf87XQDXsErRuAArBhIwlcasJIMQlYynwJ
         grog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407276; x=1720012076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Y2lg3OgYzhfS3tcxdHdgy6tUi+qEwW8C3VWq7VXFkI=;
        b=S0ZUoic1Igw/U7IiAC8S7QQggIu740m18lji4/TSNTP39fSj/n3+kTLn10riICcp6e
         o4RQVfy2jM5vKsX8HpBnrih7KxhMCbBtRpzeBMb+BcdZW7Ht2lEHkHlEZCnKmqcQofMD
         rwSaCiXQxq6M+QtK7vVvDR7+CuP2MNIZnsb5a+FDhgNJsbaELNAdD32GVnBNALj8JDpx
         Yjre2CSBFVpO7vQ/gidsQFPHJcJPk1LjLkBMnVXvlkcZKCWQ9c7nmR9BjzF/wH/4ZPVM
         FZbK3+Ij7cs0Jr6wAe6HQzDQ7Qy4hLKe4+UgQ7CWQwk7htmtUjDX6mHKPr4c7UY70vVG
         zFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCURCm2+7f1dtVuVUwNYVdlrUOENIwZRHsQ7IoPFhEuqosl3Gr9lxqovDizP4TfbF/mC/Rujw0+gfywMsAApYamU5F5LlT1j5AIC
X-Gm-Message-State: AOJu0YyeaCxDcqRwYrXK7YySG80Yzsy5cA+GuMuWYLy/bHi4GPEht6uj
	J1cncbQttFR1hnbBPGiBFuQksNfqDzT/24LYqLnV0Hnakhvr6M87G4aYLl2mhas=
X-Google-Smtp-Source: AGHT+IFibXerpu/bTQ8y3LbVZ+LSuPoGA9fjYKjk5jwlDwlIOb8M9rkEFeIslajkZZ7g7g2gAUfMJA==
X-Received: by 2002:a2e:720c:0:b0:2ec:4e79:b416 with SMTP id 38308e7fff4ca-2ec5b2fc299mr74660131fa.6.1719407276560;
        Wed, 26 Jun 2024 06:07:56 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c838bef4sm24669765e9.46.2024.06.26.06.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:07:56 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrea Parri <andrea@rivosinc.com>
Subject: [PATCH v2 04/10] riscv: Improve amocas.X use in cmpxchg()
Date: Wed, 26 Jun 2024 15:03:41 +0200
Message-Id: <20240626130347.520750-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626130347.520750-1-alexghiti@rivosinc.com>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cmpxchg() uses amocas.X instructions from Zacas and Zabha but still uses
the LR/SC acquire/release semantics which require barriers.

Let's improve that by using proper amocas acquire/release semantics in
order to avoid any of those barriers.

Suggested-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 60 ++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index b9a3fdcec919..3c65b00a0d36 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -105,7 +105,9 @@
  * indicated by comparing RETURN with OLD.
  */
 
-#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
+#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,				\
+			      sc_prepend, sc_append,			\
+			      r, p, o, n)				\
 ({									\
 	__label__ no_zacas, zabha, end;					\
 									\
@@ -129,7 +131,7 @@ no_zacas:;								\
 	ulong __rc;							\
 									\
 	__asm__ __volatile__ (						\
-		prepend							\
+		sc_prepend							\
 		"0:	lr.w %0, %2\n"					\
 		"	and  %1, %0, %z5\n"				\
 		"	bne  %1, %z3, 1f\n"				\
@@ -137,7 +139,7 @@ no_zacas:;								\
 		"	or   %1, %1, %z4\n"				\
 		"	sc.w" sc_sfx " %1, %1, %2\n"			\
 		"	bnez %1, 0b\n"					\
-		append							\
+		sc_append							\
 		"1:\n"							\
 		: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 		: "rJ" ((long)__oldx), "rJ" (__newx),			\
@@ -150,9 +152,7 @@ no_zacas:;								\
 zabha:									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
 		__asm__ __volatile__ (					\
-			prepend						\
 			"	amocas" cas_sfx " %0, %z2, %1\n"	\
-			append						\
 			: "+&r" (r), "+A" (*(p))			\
 			: "rJ" (n)					\
 			: "memory");					\
@@ -160,7 +160,9 @@ zabha:									\
 end:;									\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
+#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,				\
+		       sc_prepend, sc_append,				\
+		       r, p, co, o, n)					\
 ({									\
 	__label__ zacas, end;						\
 	register unsigned int __rc;					\
@@ -172,12 +174,12 @@ end:;									\
 	}								\
 									\
 	__asm__ __volatile__ (						\
-		prepend							\
+		sc_prepend							\
 		"0:	lr" lr_sfx " %0, %2\n"				\
 		"	bne  %0, %z3, 1f\n"				\
-		"	sc" sc_cas_sfx " %1, %z4, %2\n"			\
+		"	sc" sc_sfx " %1, %z4, %2\n"			\
 		"	bnez %1, 0b\n"					\
-		append							\
+		sc_append							\
 		"1:\n"							\
 		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
 		: "rJ" (co o), "rJ" (n)					\
@@ -187,9 +189,7 @@ end:;									\
 zacas:									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
 		__asm__ __volatile__ (					\
-			prepend						\
-			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
-			append						\
+			"	amocas" cas_sfx " %0, %z2, %1\n"	\
 			: "+&r" (r), "+A" (*(p))			\
 			: "rJ" (n)					\
 			: "memory");					\
@@ -197,7 +197,8 @@ zacas:									\
 end:;									\
 })
 
-#define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
+#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,			\
+		      sc_prepend, sc_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
@@ -206,22 +207,24 @@ end:;									\
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_cmpxchg_masked(sc_sfx, ".b" sc_sfx,		\
-					prepend, append,		\
-					__ret, __ptr, __old, __new);    \
+		__arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,		\
+				      sc_prepend, sc_append,		\
+				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_sfx, ".h" sc_sfx,		\
-					prepend, append,		\
-					__ret, __ptr, __old, __new);	\
+		__arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,		\
+				      sc_prepend, sc_append,		\
+				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
-		__arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,	\
-				__ret, __ptr, (long), __old, __new);	\
+		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
+			       sc_prepend, sc_append,			\
+			       __ret, __ptr, (long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__arch_cmpxchg(".d", ".d" sc_sfx, prepend, append,	\
-				__ret, __ptr, /**/, __old, __new);	\
+		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
+			       sc_prepend, sc_append,			\
+			       __ret, __ptr, /**/, __old, __new);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -230,16 +233,19 @@ end:;									\
 })
 
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", "", "")
+	_arch_cmpxchg((ptr), (o), (n), "", "", "", "")
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", "", RISCV_ACQUIRE_BARRIER)
+	_arch_cmpxchg((ptr), (o), (n), "", ".aq",			\
+		      "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_cmpxchg_release(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", RISCV_RELEASE_BARRIER, "")
+	_arch_cmpxchg((ptr), (o), (n), "", ".rl",			\
+		      RISCV_RELEASE_BARRIER, "")
 
 #define arch_cmpxchg(ptr, o, n)						\
-	_arch_cmpxchg((ptr), (o), (n), ".rl", "", "	fence rw, rw\n")
+	_arch_cmpxchg((ptr), (o), (n), ".rl", ".aqrl",			\
+		      "", RISCV_FULL_BARRIER)
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 	arch_cmpxchg_relaxed((ptr), (o), (n))
-- 
2.39.2


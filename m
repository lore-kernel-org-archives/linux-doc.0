Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CD21AAA5
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722411019; cv=none; b=mJJU4HZq+Gv9AmgfpUXOV2FvvLM2wFhC1JIbO9354TRrLoaYTESVnLatA3nZeRJhpz66cV3XJC6iVW1xydvbN0Quix26QMEVaCunJD2yg/kCMN2BDa81UAVTXco6Xc2bZYW6Vsxddnz5bVR0U6JDTx1Iri7vw+R1Jif6yiht4/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722411019; c=relaxed/simple;
	bh=bouw3smbNw/9iyv4bvw9AONYeCpQvHZiGv7/AYi1ML4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hTWPSt1QC8puvHvZ4OnLu3AcKFC7ErKbxrwDcDCqXThNyMHTeZZ6GfsP11NbATuY4A3YUCf6KHnIp/WEUGjvISw7aPZMDGR3a8ZTSVUuRPiD08+5axI9oEFkVy+/bArBdicBBdAaOKLiXqUKsOOQPlL0b9+sPz/WrEhylWuX2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fk2jf/qc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fk2jf/qc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-426526d30aaso35033575e9.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722411016; x=1723015816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEhBxTOflsSVFsDNAT/T0q8dd0IMJwzl7NNb3foLEqQ=;
        b=fk2jf/qcPx7ppeemKq3pcL1SHeocSdW3JJT3IGGUxdExXVYD1AI9KRNFIafprrbsM4
         3HBK2X4IIEWVtAcJ2m49zIrtpvE8EcnPq7Dv3epamFX6m4Q8WNDlbd4NffbrzM3kTIsQ
         sdpGVUi6L4gW36R+QjEzhtf7ExLFhA2CkcnLWT/AG1No+AxUuy9OSubYdOISl46g2wvG
         RJyYDdxpqtggF7ZLT1cCRf0OJMCqKuH5c1EPzbPsLW7KLll2OajjyDpfJJurNrhRB7uJ
         DwUwkgdDe19nxgmt451xVznanbQ3XhcfqOZmoS9g9AyrC03iqQiMZCacTzFs7Wzt52EH
         l1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722411016; x=1723015816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEhBxTOflsSVFsDNAT/T0q8dd0IMJwzl7NNb3foLEqQ=;
        b=cuwUYxzCT+zeM42U2ymnTm5BpgJZXvZOzlzgPHZWZfV10pVf2fPlzdxolD2PmMDNt8
         8ATp3VStbLmUXw1TqjCzhwAOfpGLPNktZwD7NovM+RjTZtlFH6BQGEVdkKWZOY31nzxu
         d79GYluMQvS5TGbfktaUNIHalEFnVSH9IuhU9K8m2VBgsFd3IGpvcgo02JAKNQ1tzy2t
         y7S+vvT0JF7A1v1lm5idcEk+MQcf8B3IU7qfR1i06ylVpzC0QK1LHRyXOUDgj2oWYbUO
         CI/o3QjjcfFkrfb7VmUG5gnEssM18/l9RGz59U11C1lF/FW9EG7FFo7jQkS4YtvC4FYQ
         LY0A==
X-Forwarded-Encrypted: i=1; AJvYcCVC47i0kRFM83ZtZ+551NY5GAYNJ2vEWTpfJyShCV0A3n5Pxg/y3wWluujcHnQ0lbyCV0RYmGaJKCaJJtz1aAuufT9zgPY6iIRg
X-Gm-Message-State: AOJu0YyBShMlnHQlN7XsNs8NbsoiMFAtijpCFtMiYfYTTaj1HxRm9ipb
	8EdNKK3ky8tK5IaneBQYTDqKO3EER05fW1ye69nDvn/ODbD2W/I6t1/wdaeAqhA=
X-Google-Smtp-Source: AGHT+IG/D6snF/aUaHw8KmNLUqH1g4Di4cdhfBmk7rNdHJS5BuCS2wlMZCx/S8dP1xXXPnipMharHQ==
X-Received: by 2002:a05:600c:5492:b0:426:5b21:97fa with SMTP id 5b1f17b1804b1-42811dd19camr83992885e9.29.1722411015502;
        Wed, 31 Jul 2024 00:30:15 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb9d54esm10549595e9.43.2024.07.31.00.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:30:15 -0700 (PDT)
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
	Andrea Parri <andrea@rivosinc.com>
Subject: [PATCH v4 06/13] riscv: Improve zacas fully-ordered cmpxchg()
Date: Wed, 31 Jul 2024 09:23:58 +0200
Message-Id: <20240731072405.197046-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current fully-ordered cmpxchgXX() implementation results in:

  amocas.X.rl     a5,a4,(s1)
  fence           rw,rw

This provides enough sync but we can actually use the following better
mapping instead:

  amocas.X.aqrl   a5,a4,(s1)

Suggested-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 72 +++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ebcd4a30ae60..391730367213 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -107,8 +107,10 @@
  * store NEW in MEM.  Return the initial value in MEM.  Success is
  * indicated by comparing RETURN with OLD.
  */
-
-#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
+#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,					\
+			      sc_prepend, sc_append,				\
+			      cas_prepend, cas_append,				\
+			      r, p, o, n)					\
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
 	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&				\
@@ -117,9 +119,9 @@
 		r = o;								\
 										\
 		__asm__ __volatile__ (						\
-			prepend							\
+			cas_prepend							\
 			"	amocas" cas_sfx " %0, %z2, %1\n"		\
-			append							\
+			cas_append							\
 			: "+&r" (r), "+A" (*(p))				\
 			: "rJ" (n)						\
 			: "memory");						\
@@ -134,7 +136,7 @@
 		ulong __rc;							\
 										\
 		__asm__ __volatile__ (						\
-			prepend							\
+			sc_prepend							\
 			"0:	lr.w %0, %2\n"					\
 			"	and  %1, %0, %z5\n"				\
 			"	bne  %1, %z3, 1f\n"				\
@@ -142,7 +144,7 @@
 			"	or   %1, %1, %z4\n"				\
 			"	sc.w" sc_sfx " %1, %1, %2\n"			\
 			"	bnez %1, 0b\n"					\
-			append							\
+			sc_append							\
 			"1:\n"							\
 			: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 			: "rJ" ((long)__oldx), "rJ" (__newx),			\
@@ -153,16 +155,19 @@
 	}									\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
+#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,				\
+		       sc_prepend, sc_append,				\
+		       cas_prepend, cas_append,				\
+		       r, p, co, o, n)					\
 ({									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
 	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
 		r = o;							\
 									\
 		__asm__ __volatile__ (					\
-			prepend						\
-			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
-			append						\
+			cas_prepend					\
+			"	amocas" cas_sfx " %0, %z2, %1\n"	\
+			cas_append					\
 			: "+&r" (r), "+A" (*(p))			\
 			: "rJ" (n)					\
 			: "memory");					\
@@ -170,12 +175,12 @@
 		register unsigned int __rc;				\
 									\
 		__asm__ __volatile__ (					\
-			prepend						\
+			sc_prepend					\
 			"0:	lr" lr_sfx " %0, %2\n"			\
 			"	bne  %0, %z3, 1f\n"			\
-			"	sc" sc_cas_sfx " %1, %z4, %2\n"		\
+			"	sc" sc_sfx " %1, %z4, %2\n"		\
 			"	bnez %1, 0b\n"				\
-			append						\
+			sc_append					\
 			"1:\n"						\
 			: "=&r" (r), "=&r" (__rc), "+A" (*(p))		\
 			: "rJ" (co o), "rJ" (n)				\
@@ -183,7 +188,9 @@
 	}								\
 })
 
-#define _arch_cmpxchg(ptr, old, new, sc_cas_sfx, prepend, append)	\
+#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,			\
+		      sc_prepend, sc_append,				\
+		      cas_prepend, cas_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
@@ -192,22 +199,28 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_cmpxchg_masked(sc_cas_sfx, ".b" sc_cas_sfx,	\
-					prepend, append,		\
-					__ret, __ptr, __old, __new);    \
+		__arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,		\
+				      sc_prepend, sc_append,		\
+				      cas_prepend, cas_append,		\
+				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_cas_sfx, ".h" sc_cas_sfx,	\
-					prepend, append,		\
-					__ret, __ptr, __old, __new);	\
+		__arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,		\
+				      sc_prepend, sc_append,		\
+				      cas_prepend, cas_append,		\
+				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
-		__arch_cmpxchg(".w", ".w" sc_cas_sfx, prepend, append,	\
-				__ret, __ptr, (long), __old, __new);	\
+		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
+			       sc_prepend, sc_append,			\
+			       cas_prepend, cas_append,			\
+			       __ret, __ptr, (long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__arch_cmpxchg(".d", ".d" sc_cas_sfx, prepend, append,	\
-				__ret, __ptr, /**/, __old, __new);	\
+		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
+			       sc_prepend, sc_append,			\
+			       cas_prepend, cas_append,			\
+			       __ret, __ptr, /**/, __old, __new);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -216,16 +229,19 @@
 })
 
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", "", "")
+	_arch_cmpxchg((ptr), (o), (n), "", "", "", "", "", "")
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", "", RISCV_ACQUIRE_BARRIER)
+	_arch_cmpxchg((ptr), (o), (n), "", "",				\
+		      "", RISCV_ACQUIRE_BARRIER, "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_cmpxchg_release(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", RISCV_RELEASE_BARRIER, "")
+	_arch_cmpxchg((ptr), (o), (n), "", "",				\
+		      RISCV_RELEASE_BARRIER, "", RISCV_RELEASE_BARRIER, "")
 
 #define arch_cmpxchg(ptr, o, n)						\
-	_arch_cmpxchg((ptr), (o), (n), ".rl", "", "	fence rw, rw\n")
+	_arch_cmpxchg((ptr), (o), (n), ".rl", ".aqrl",			\
+		      "", RISCV_FULL_BARRIER, "", "")
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 	arch_cmpxchg_relaxed((ptr), (o), (n))
-- 
2.39.2


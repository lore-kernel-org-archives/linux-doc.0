Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5552C08AC
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 04:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760934338; cv=none; b=gYTUbcXHf7W5fTbsUIe6/eOxSe614CuR9K9J5tzXFGdWCDJX/rRQHDXvrC98js6vdr9/PeFJE/rKY7mRkijbkjCn4MlLWcyscMDigyGuHTrhDUCyvPGi36YtydQoZ4GsVjWo/1rR1V5hYdE2tLR1uRNWPsVFNULqsC+d7dvMr5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760934338; c=relaxed/simple;
	bh=8hNEznhKZts7nsJ+/Md1hqEm+KtJGCPHkBh501JLIEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OGOYRFaKzBrIQI2YlDux8XTGpjNCTuitPW9tShhLrPJVG7AUl/41K9PfvgjAng0giyMxT/wY0RJbJtyukqEBEPIcaadv22z3PvO6kWOCwCXyLPV8Ta8uMtgwn116UCvcq5YSiIaJ2S5TANPP65Ox72r4pRzwYPqOQyaslQHtFqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Stmy11bH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Stmy11bH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2698d47e776so29149525ad.1
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 21:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934336; x=1761539136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Dx3bjUZwp+FDi5HGHRvFmbVTrXXeKiS0FzRK/EiFHI=;
        b=Stmy11bHlbtB+FCDM3N72lvFypHEqmDaCdkIBk4dvYHEXWSYbZjkmUaCLg9ibvm+aV
         +tBJT7JrQ+OWBwWUW+V7RvOPp7+dBAKV9NtfQCMefduyrAondxZDckMqpCFrzKHIX6Fa
         uYy2RuZQUJsWzih7+a77KtJvu2TlZlWNKSXR8xpia4RXDKdAQc6Vuq4YCd9jrz/4qsg4
         /tQUIb+B/uSJuNcuwZTTmuYjteul+9jOPHrFQ47XSAviBXnD1RnSYeL7mcohffacyoeN
         Y6lEFIunSYFtAh3whVE20Pzbi31sbVNEbffHHXiEMGYPXfck/E81aYv+N7roEMHMPPo7
         oViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934336; x=1761539136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Dx3bjUZwp+FDi5HGHRvFmbVTrXXeKiS0FzRK/EiFHI=;
        b=egrOAAho6zSKCRtVT2PEA2kRdHuLaQvqHU3QrcU1MGbttNusO565W6CSwtqwPQyNav
         nZxeFk1KUMccGqLoX/Kt4zCejEyowLR75msu+sev5rP+82n7myLiGp/c/yD0/RwZOoHv
         T2dPJYI4wetA8y0QCBYNbhuXqZP03nmz8J2Ddvq6n0nG5PAwDeB/UZM+X9cGiwICN0mk
         i19VD7fwBWywjNXY60oww3vCtIgi0yvS3QepScRxhDkW+5cbc8YM/NgKcPhcQNHVM9np
         8skYWhR5YTpCxE+Zx/vqUOIRn5ZXzN5UvfPSbTr8eTlFc35bfJVlRYBY2CEnta/OwsJ3
         VGuQ==
X-Gm-Message-State: AOJu0Ywro/MyE6eEwC0iRTe5M+P+y54QL4OiTrEXnotqSP0TwYBwBou8
	rImXEuSa6TjNtjBuzzrlo9cKN1tjLeeE2OREnrhSVvBJmm3/wpjfiDHu+IBhF09Yi9s=
X-Gm-Gg: ASbGncvs7jOMpbp0ZhP6YpQPSTM9swXGb6WH3ej/xPLtqAN0ZjUXHKjzPsaV3t9ta3q
	aaCptBPW2rkLHKyPndx4io3KhtIJGTkqwW5Whe2VA04s7D82/dvu54CJZWPSx+mCVFp4BMbXVY2
	U7VGmBLRHaaNA9gmojx4bpekDYuFRPXaM1Asi/3EzIjMydfr0pE7d48trwRSRQUeyBa9OL/HVj6
	w/ZrD4P9nUDnPLIqNLZAjzG5E1vmtdFm/Asx7FxplpErB7DVWRvhsqz3hKhtvZnoaia4jmFBmRY
	JsurmaRIVClILaYxey/gcXFvUK0wFXHQv08wMA3zTPbaumUX8UG7l0XvOZocnLVmngHzCdXs1tz
	7W+AxiXoVzm3u0PLacSKd+cKXtmuc/X7O85/7x+YIqMvj+8feL1uC8BHt4f63nvYSiebsQ8SpCV
	AexOiMpFx7pqhr5c/jB3EG8sBgLhSnd/fAtS8twQEgoCnM+peEva2P6xCAyd3uWhY=
X-Google-Smtp-Source: AGHT+IHd1kF3POpTVpfQwriGdz/AzJEchqY/kwdyjm7t3VNt+rro2wzxG/dmQOsLktQwlvjqL1Trmw==
X-Received: by 2002:a17:903:b48:b0:290:29ba:340f with SMTP id d9443c01a7336-290cb17c05fmr150708105ad.42.1760934336328;
        Sun, 19 Oct 2025 21:25:36 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec20a4sm68319325ad.7.2025.10.19.21.25.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:25:36 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 08/10] riscv: Remove arch specific __atomic_acquire/release_fence
Date: Mon, 20 Oct 2025 12:24:55 +0800
Message-ID: <20251020042457.30915-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042457.30915-1-luxu.kernel@bytedance.com>
References: <20251020042457.30915-1-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove arch specific __atomic_acquire/release_fence() operations since
they use fence instruction to simulate acquire/release order and can not
work well with real acquire/release instructions.

The default generic __atomic_acuire/release_fence() now provide sequential
order via 'fennce rw, rw'. They are rarely called since we use real
acquire/release instructions in most of times.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/atomic.h | 6 ------
 arch/riscv/include/asm/fence.h  | 4 ----
 2 files changed, 10 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 86291de07de62..6ed50a283bf8b 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -18,12 +18,6 @@
 
 #include <asm/cmpxchg.h>
 
-#define __atomic_acquire_fence()					\
-	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
-
-#define __atomic_release_fence()					\
-	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
-
 static __always_inline int arch_atomic_read(const atomic_t *v)
 {
 	return READ_ONCE(v->counter);
diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
index 182db7930edc2..9ce83e4793948 100644
--- a/arch/riscv/include/asm/fence.h
+++ b/arch/riscv/include/asm/fence.h
@@ -7,12 +7,8 @@
 	({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })
 
 #ifdef CONFIG_SMP
-#define RISCV_ACQUIRE_BARRIER		RISCV_FENCE_ASM(r, rw)
-#define RISCV_RELEASE_BARRIER		RISCV_FENCE_ASM(rw, w)
 #define RISCV_FULL_BARRIER		RISCV_FENCE_ASM(rw, rw)
 #else
-#define RISCV_ACQUIRE_BARRIER
-#define RISCV_RELEASE_BARRIER
 #define RISCV_FULL_BARRIER
 #endif
 
-- 
2.20.1


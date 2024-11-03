Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB684155308
	for <linux-doc@vger.kernel.org>; Sun,  3 Nov 2024 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730646072; cv=none; b=Ud2wZtHx88jwVhQ2N78otI5Y5uQej9Poqf7+suPGJn7lLYleTb5PX4W7LLknpgLYSs+T9C0hKXwo5zMFJqyqSwzo5862fvDGxBST0zdAaWBGGC5sDsXDdEjQ5o/m82fpGceTbVjT4XNrk7u4NGahsIfIqAl5jMSHyjcnZb+2mdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730646072; c=relaxed/simple;
	bh=EDwD9aZEGDLa1mlnyZaiQGHjsh7Aq5OXTHhH9BR6X5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bAu/+2/gUlW6EBI+10dHx3QoteEigZIen4cIcNTatI2lo0Z97hnrQEwkrNbwf8xTjEEVLFYAn2ZCi2/2ltzrjdV5Ja+nKfHIuL8iMVqGLp1EHpmPAVIyWobfgA9iJDduvAnOD+fMO4w80aIPMH6Nw6Pud8N/Mqy8wstBxBCBpkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qGkT5xhP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qGkT5xhP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43169902057so26372385e9.0
        for <linux-doc@vger.kernel.org>; Sun, 03 Nov 2024 07:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730646068; x=1731250868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s2g6PiZXcRkI3A8BFgYC9wzyXLIo5JanvDPO+lSWQk=;
        b=qGkT5xhPAMhRMeXBOW/1eKsYXMmqh9iyK2rw8zNy/oYDmZMiTsTm7r+7SLbCooKgew
         wqorE3cNqAingkKpq85t78fKSjYeny2W62SnhJRp2HrBicOz5rwDUv9vIS44/24nlYfn
         nSJNoixhHWxagg76s1tf+K5SzbOEsGGESQqwKdoZN40O/WwOso3oa6tWqCwr1oYuQTJ2
         Xtj+ff6KOtNS66BtcFjmn1LkU3NZzzEsaryq0C5Kbnv86zgmqK9sHIAl/PMvVhuxfUZU
         wZdPJDM4XUe9Yr9k7yCW7m+x7oZYrgj05+wc5huths1BDViYuHEAdffIgtLEWH4xlvRn
         tsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730646068; x=1731250868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2s2g6PiZXcRkI3A8BFgYC9wzyXLIo5JanvDPO+lSWQk=;
        b=NqhymVEd/NXYKNNWKPC4f29p+la1fgNLqETNW5PE8gq8ePFOXgbW+cDidc/mJ4hwK7
         fs9ONoAI4EEYpg8KPVLD6LFLbi0qMs7jh2m0fpxc1MCOHIhAvCGW75GywCQ3+pJJCWGY
         cZ5skfca3HjGJu+74M5HzwqS1MV1OMZP+9JBSxqOmALu3HufR2rS7fltFkawwCmwC9Kz
         poR0PZaoFL2a8jhCz+zQnGmir/+kziUT/IWx8MPEshFyznr88tGqxIUjshzZGGkCUFY0
         TbslVA63jlsBMtl4smR3zg3uKpD+tRVsUNNW/rC3BHsqqR0jXv/lqCL47c/xyY1MrOi4
         kAMA==
X-Forwarded-Encrypted: i=1; AJvYcCVKufyxhjk3fm2R4BSa9V1dIuoZilVne15hP/9Y2If8V5CjTlCXmOacoQ1EznCYxFHBwemdo6XkIyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YweSNk3gPM58mm+FG1ndiCyfCZfqer71W2kBzY5+dVifkIx9/r2
	TZ9YUsmX84jWQ1Vw2HslPyvPGDukLg/BP2al8UZk5vi8n1NMPlQVoNDYBLXomrc=
X-Google-Smtp-Source: AGHT+IHT05faWmtqnYuiNBzL9haD0/7Dkr0QGrJhaTkS4osZpzeT6/FO8hvYgpCC2wE7TfnKCk1UVw==
X-Received: by 2002:a05:600c:4215:b0:431:55af:a230 with SMTP id 5b1f17b1804b1-431bb9e6031mr145075625e9.33.1730646067731;
        Sun, 03 Nov 2024 07:01:07 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852fdsm125977405e9.34.2024.11.03.07.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 07:01:07 -0800 (PST)
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 09/13] asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
Date: Sun,  3 Nov 2024 15:51:49 +0100
Message-Id: <20241103145153.105097-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guo Ren <guoren@linux.alibaba.com>

The arch_spinlock_t of qspinlock has contained the atomic_t val, which
satisfies the ticket-lock requirement. Thus, unify the arch_spinlock_t
into qspinlock_types.h. This is the preparation for the next combo
spinlock.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-riscv/CAK8P3a2rnz9mQqhN6-e0CGUUv9rntRELFdxt_weiD7FxH7fkfQ@mail.gmail.com/
Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/asm-generic/spinlock.h       | 14 +++++++-------
 include/asm-generic/spinlock_types.h | 12 ++----------
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index 90803a826ba0..4773334ee638 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -32,7 +32,7 @@
 
 static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
 {
-	u32 val = atomic_fetch_add(1<<16, lock);
+	u32 val = atomic_fetch_add(1<<16, &lock->val);
 	u16 ticket = val >> 16;
 
 	if (ticket == (u16)val)
@@ -46,31 +46,31 @@ static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
 	 * have no outstanding writes due to the atomic_fetch_add() the extra
 	 * orderings are free.
 	 */
-	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
+	atomic_cond_read_acquire(&lock->val, ticket == (u16)VAL);
 	smp_mb();
 }
 
 static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
 {
-	u32 old = atomic_read(lock);
+	u32 old = atomic_read(&lock->val);
 
 	if ((old >> 16) != (old & 0xffff))
 		return false;
 
-	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RCsc */
+	return atomic_try_cmpxchg(&lock->val, &old, old + (1<<16)); /* SC, for RCsc */
 }
 
 static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
 {
 	u16 *ptr = (u16 *)lock + IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
-	u32 val = atomic_read(lock);
+	u32 val = atomic_read(&lock->val);
 
 	smp_store_release(ptr, (u16)val + 1);
 }
 
 static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
 {
-	u32 val = lock.counter;
+	u32 val = lock.val.counter;
 
 	return ((val >> 16) == (val & 0xffff));
 }
@@ -84,7 +84,7 @@ static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
 
 static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
 {
-	u32 val = atomic_read(lock);
+	u32 val = atomic_read(&lock->val);
 
 	return (s16)((val >> 16) - (val & 0xffff)) > 1;
 }
diff --git a/include/asm-generic/spinlock_types.h b/include/asm-generic/spinlock_types.h
index 8962bb730945..f534aa5de394 100644
--- a/include/asm-generic/spinlock_types.h
+++ b/include/asm-generic/spinlock_types.h
@@ -3,15 +3,7 @@
 #ifndef __ASM_GENERIC_SPINLOCK_TYPES_H
 #define __ASM_GENERIC_SPINLOCK_TYPES_H
 
-#include <linux/types.h>
-typedef atomic_t arch_spinlock_t;
-
-/*
- * qrwlock_types depends on arch_spinlock_t, so we must typedef that before the
- * include.
- */
-#include <asm/qrwlock_types.h>
-
-#define __ARCH_SPIN_LOCK_UNLOCKED	ATOMIC_INIT(0)
+#include <asm-generic/qspinlock_types.h>
+#include <asm-generic/qrwlock_types.h>
 
 #endif /* __ASM_GENERIC_SPINLOCK_TYPES_H */
-- 
2.39.2


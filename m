Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617FDFC02
	for <linux-doc@vger.kernel.org>; Sun, 18 Aug 2024 06:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723963500; cv=none; b=K2tBn4ZIpDadLQc81+6mX20/+Vox4dmwGmN69OpnF3LYNGjNKcxpTZZeF58jspWquFCj5F1un7o+UnOXUFdZ0heiY3ts92k23t2HHOUPu+7gcGfXn+59P/nepPtw6hct/v61zEiwDimmWCCb5dxgkHlU8i/6KvcBHOfkasmINaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723963500; c=relaxed/simple;
	bh=XhPMIf8E5h7ieBT3eV+7JhnNWaDTpV0oRSqL+1+Yoms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RpIqr5WfxZmWIq9sheK0BrZZ9rywYGym0QddzfHTBqTR+nY9rmMfYW9AuRg+/IxUjh9GYfDEPTvdJw8pxggjTPqRUUGZ03b4qxDeX5oTOAIDGDSamOGM7vML6xUysPJCT4YjC5v88gAomI/zTOsinjQUMt2QkL+G87qot14Lra0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bQk1Abem; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bQk1Abem"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42803bbf842so34869125e9.1
        for <linux-doc@vger.kernel.org>; Sat, 17 Aug 2024 23:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963496; x=1724568296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFL/O3acOIAnvUQyUxNex19UAi4aS/YbFByq84YgWQ0=;
        b=bQk1AbempOzqW4v1ovhjBszbUagtUn9Zv96ifPexKqXUxjWpyVO65hpcNUc1ENLJru
         q7Yb3w5pygHNaQagttJyigqfCm132Ys200UOKP5jwaI1skM8rRxUHfq2zyYT+6rlWVDd
         UWJaoJhVtp2XKmV7wYJazVMLqBxIEwvkWHpA7Qb8C3YyPkknCteJlT2Dk4yG98ZBoEdz
         yRgW/POf0m8p3v/iyzPNv19ZQnhCadY+u4L+bL3fU1HJxdOvurygRrE9oJXbtRjO6wlB
         p12bBpTyEqvhLzaMcTzLwAmnGwv9QT9HM4XNe1kxL7vkCnPqbVlAYHSTB8+2h0/EvqyY
         Cy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963496; x=1724568296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFL/O3acOIAnvUQyUxNex19UAi4aS/YbFByq84YgWQ0=;
        b=OifSK0c11swg0gTuDY8uhBAPnqGxjkcEtiK6oG4+hN1kDpbdCkkTJrZsjVUHeYRDL1
         GrGsbqtaT+RO6CYX9y43HW9TRzNWYJs0K6vOGvx+i6EYWWB1Rm2g35LHjbrUxGWOTf8c
         wb0dGWuyqnP6dIUnVS9NeZoqaUeNhCtRN5C/stSyo7n/8wU3DcovMl04/7oyIXS/MaKv
         wDqRqSHlceaUGVxj1oK3NZhqgwBZdc78GvyI7GcKh/Nve8QpueoU3J18KkVsQMbdzqOo
         Lw7UWvgrFqxLYYyRTfyhsfFSMEHzTPqfv7OE79+MpqdbxphhqYHT+v+Yw13RmQUh2lf2
         tLTw==
X-Forwarded-Encrypted: i=1; AJvYcCV6wE9C2GIq06Mu5tLzVsMl8oIXh9xychgQGVm5pWpGY/fELp0JtFFuYXYcR4nQ2O/NTIv1fFv1Ir/pI+dPnVyMBGU46jcNTuAL
X-Gm-Message-State: AOJu0Yxno/9ObvaYA3RpO+QZzpZmQFtjC8AW0kbV8cWcRgTimbNGd1WQ
	JCapDM4CnlP5kUDttfaAIz4zsoGh+S/QMsU5bmA1fVmMGpWesPefuBIa6P7SWaM=
X-Google-Smtp-Source: AGHT+IFPBW1mn5KeYnZcFZpLT4fLpEaOfFIUvQMa/GHHDd1nNhnkQYgHstBKdHhKt1mlaNsMcxCEDw==
X-Received: by 2002:a05:600c:4ed2:b0:426:5b44:2be7 with SMTP id 5b1f17b1804b1-429ed79568amr68241915e9.10.1723963495566;
        Sat, 17 Aug 2024 23:44:55 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded180dcsm120623885e9.4.2024.08.17.23.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:44:55 -0700 (PDT)
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
Cc: Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH v5 09/13] asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
Date: Sun, 18 Aug 2024 08:35:34 +0200
Message-Id: <20240818063538.6651-10-alexghiti@rivosinc.com>
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


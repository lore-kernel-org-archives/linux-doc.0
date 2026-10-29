Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260231;
	b=Ee05tksRvkYs6V3UOGfoAQdMedew/RQwm93a40DvO/NExLgZ7uGXO/67K/5Xi6HGWL0O
	 EoRXjJGz7YkYZt11X5AucnJDma4aBFt5jGAx/AKIHJvrAxv+AJW4I5Cu8qUb/9twllVk5
	 dN4BPp4VisXHAcE+cRYajvy0PVgcuy4MfBus1hsXXxd8NwIoJoOw9RwSSXxie7YdITXJA
	 BXHOPBJzhecRw3ki51hVjQ1JxRUW6F4EORcgyOHJLL8DGJBq424w8jR4ta+dauBBuBt5M
	 rIfIsaQJ6eEuFSyMLSdhppe27XdVazSAgR8nuXZgLh8WF4bgAE15Bj5dkhOm/l3URmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oepihVkZlK/qzYmwSGek/f6xpe+tahIK2SzRmS26BHM=;
	b=qZnDe2EE1QFJeATX7vI/z5kQPt2ctQMM0eezEf7NI2jiUSPRIcKPTPOzmxOjltXh5qHF
	 Q79Spv+tk67+hbAz43g/631RqFVgsGuOiZkJ52tuw+hm/6God2vryzxeeb6liSK3Injke
	 AYKp30kgqjTXzCsNp0CzpPljiEwtxZRAB0fmz1mUolwu5SUP5Xj4trQLZDD0ic1epMuHt
	 P8rPDQWQSzW6Bgek7Apwxwb2ZVMH56hrJMeLXhx9g7/C7E9Op0StYcuQcgqRYOm5eVbQc
	 NX7PHvkggNkvzTTnBO7gtLNz6QoFN3SVojXCf5P3+O+SnwxtuO8262dK0uaE3j2Z5ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jz6BzEJm;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98805606A339
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 07:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98805606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jz6BzEJm
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e977109392so10866845ad.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 00:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793260230; x=1793865030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oepihVkZlK/qzYmwSGek/f6xpe+tahIK2SzRmS26BHM=;
        b=jz6BzEJmohQMGYzs4LlydOev8edMU0iNAlDKRwqDhgVfQz5X7APQbZgh1/ZfqPkCpF
         BxuIx3Fyb9lpq7XzBEemFlsPxAjvOiGeJzPUQWhDNwvW6CA01c8zw9gismLg5ZxNAyJC
         OTazykQsCZlEaxgl0NdQ++7YDNoYzeNZoGUL4jVOvv8tKy6jQ7KaVqactLjrUHfOzdCT
         fzhTYb657jWtvAmfNDB5PA4vdkC6sxnfcvLx3Qjud2nh5p5HzZAXpf0IrRZYpforERBM
         dqIK4MJT3JMv4obZN6XK4DVImNKc0eMyb/vTIr88L5qxO67hNZwtfq7qhtOwUxBHcY+9
         MOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260230; x=1793865030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oepihVkZlK/qzYmwSGek/f6xpe+tahIK2SzRmS26BHM=;
        b=K9PNIFrfCeKs9byojngrwIbTM2mDu6XO/ABJOnsS6A/vQezznfZu5hizwfLQnjwr3u
         6/DkpUDMXdVuFTGaiqMVh0kJ+PGNsb+8UL7seN9mckahlO5T3lExFxIzSIF5YLGUN7FB
         FFT17+UYSyUufEFYsaXQSSFKDIUMEyMAUwBDp9t8XG0y4jefVccNul3utO8AEKP2r+ST
         Qt6rkOya0O/uvKImJQ6MdA5VbGdRQkYbwREvhVDriOUXX6zigB90c+LEgM4ikE9rLD5O
         uqJ7b1fWzuVwFyeQ11zqUuUKB0dob6FBtvFFh+8e3AWjlxyg/6Dqe2sKO/D7vJdvxeEi
         NTGw==
X-Forwarded-Encrypted: i=1; AKwUvBwmzplb1gv5eGe1sZwEMPH4tgD0dfoWHAVYdKWo/E17suyJCFMDTM+dt6RYOtmWR+HaEkjUGT8FPCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbK10Lft6DGLVJloVY9/f1hDWJ1VgHQ4eKSh3c1rBzvJ4I61v1
	Of3mY+6dhC4wH5pgeF4EFOnTjUYz4zW1eMDD+LA2Tfgty2S+zhfccfnipv4LrS2C3fQ=
X-Gm-Gg: AYBFou1bIZmSigofqb5sDZCsUBDNS13KfleNY6Qx5xk9fGX0fkTwtV3IKOA7Ot2ooci
	1RLUyOO9gpVU1aaBHIUstsyBH2id70YeSUS1XxgTssEl4WE0swlWJWjOw3os7ckVi77y+mxe5C4
	6xjfoSW3k9q0gQpMbslS/N/XAAACZGtMpZFffS66yT7Vuw9cAzYiWOW2wZrLSOy/eGn+ucpYi1i
	VRjuOjZ78yUBP+nAfS8FgkHo0vYeXVCOqupfufdOg1pOi7l1KE97otj8Lr9yRB8BDMCered+p1V
	Ii4dpEoMqVRxINjmt2y1m0j/0P9uhdirqmwolpTFsmbRdmVfGWKkM28axGQHoNk3n//CurNiFZO
	eYMZ6VMfrHh6fTF+89ZpBNVabiGC9uTYOjIw2p8xCl1nrbEJ11+RgJ99hvH960GIlQG3N8cQK7t
	ibdGWwOgnAOEvC7bK7ESos5dl7pNP6BUAeZgQllfX50BZc5cJRNswXEPGeXGj1xIAJUL7Jg9IiG
	8+2zT5sosKIRkjgPFjIY/nMvDmBAAH/At+ygk2fwuIlY8GE9EN3aceScQaTzuBdINWNOIs/dbMy
	3iqWlRWEkdYXZc3o0os9mGuoYn7gcCOl4lwFARafqfxkqgE6DIGODlWdJvg4b8wUvwFv0J8Dc19
	SMaBtq5I=
X-Received: by 2002:a17:903:3c28:b0:2e9:3f26:5d83 with SMTP id d9443c01a7336-2eb004000b6mr42659455ad.12.1793260229799;
        Thu, 29 Oct 2026 00:50:29 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bd60desm30598915ad.29.2026.10.29.00.50.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 00:50:29 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 06/11] riscv: enable NMI-safe lockdep irqflags tracking
Date: Thu, 29 Oct 2026 15:48:48 +0800
Message-ID: <20261029074853.35467-7-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An SSE handler runs with interrupts masked, but can interrupt code whose
lockdep hardirq state is enabled. Bare nmi_enter()/nmi_exit() do not
update that state. Consequently, lockdep_assert_irqs_disabled() in the
perf overflow path can report a warning despite interrupts being masked.

Select TRACE_IRQFLAGS_NMI_SUPPORT so lockdep can update its hardirq state
inside an NMI. Pair this with irqentry_nmi_enter()/irqentry_nmi_exit() in
the SSE wrapper: these helpers save the previous tracked state, mark
interrupts disabled on entry and restore the tracked state on exit.
Selecting the configuration option alone does not perform those updates.
This follows the entry helpers used by the other RISC-V NMI-like traps.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/sbi_sse.c | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 467a877445a..dea30784fc7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -228,6 +228,7 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
+	select TRACE_IRQFLAGS_NMI_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select VDSO_DATASTORE if MMU
 	select VDSO_GETRANDOM if MMU && 64BIT
diff --git a/arch/riscv/kernel/sbi_sse.c b/arch/riscv/kernel/sbi_sse.c
index 032fcc07abc..59e47a39589 100644
--- a/arch/riscv/kernel/sbi_sse.c
+++ b/arch/riscv/kernel/sbi_sse.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2025 Rivos Inc.
  */
-#include <linux/nmi.h>
+#include <linux/entry-common.h>
 #include <linux/sched.h>
 #include <linux/scs.h>
 #include <linux/bitfield.h>
@@ -36,9 +36,10 @@ void noinstr do_sse(struct sse_event_arch_data *arch_evt,
 {
 	struct riscv_sse_interrupted_context context = { regs, hstatus };
 	struct riscv_sse_interrupted_context *previous;
+	irqentry_state_t state;
 	struct sbiret sret;
 
-	nmi_enter();
+	state = irqentry_nmi_enter(regs);
 	instrumentation_begin();
 
 	/* Retrieve missing GPRs from SBI */
@@ -84,7 +85,7 @@ void noinstr do_sse(struct sse_event_arch_data *arch_evt,
 
 out:
 	instrumentation_end();
-	nmi_exit();
+	irqentry_nmi_exit(regs, state);
 }
 
 static void *alloc_to_stack_pointer(void *alloc)
-- 
2.50.1 (Apple Git-155)


Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LVw27cEu"
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629F8170C
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 23:21:43 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6d81580d696so124037a34.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 23:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701415302; x=1702020102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01vsWcEoRsZ8jN9se+rvMnn0SZYxGQ5PaoOtj11FSJg=;
        b=LVw27cEuBwUJxJngrncVU6on/z83ZKtzM8UUrou51ywMBzt1gA4Qt1HhWnIeXyCQSr
         j+NGACCxkyb29DfeLn64v2rsPMtIrYatD4Jy1HQJyDrbF6OkZHJjDjHYicrZCSD64EaT
         0byZu5+KqMCS28q+djzRZKXydmVs62+U1tT7xNkNxOsp1ua+7RX3hLcqkyNwnmjljt7K
         RoyttV3Ybgh3ZGSIzJZQVM9oSWhCv6xTzSljUceZz18o7slE4drx/ieYecpp4GwtWOiZ
         j5Phf9iX0XHs1eABjgrnL5h74tlNWsi90rB5vGtqqb7VhSrmmOyTIs3rDVy+BKylIFi/
         NiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415302; x=1702020102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01vsWcEoRsZ8jN9se+rvMnn0SZYxGQ5PaoOtj11FSJg=;
        b=fHszkTtYHvCTqZSkb9O/6+8tecTumLD8glToz+XenpIhFdlef2NmWCGxc4wYlqnznm
         1pujhDwrEnC/HWTE2fpXpgiXyYyPNStdBeYVK8PxSXOmEh/yeNh0oUA6qWMBxbLJh0R/
         P5WVQSYPKMpIQWYC6xO4QvMyErGH72PtsKdRWRilwiM3Am45BlNysEktfQ6CfSbUuDx3
         QXCeo93dejRQEMaBruZnhG0jsSblytBkv03bzzCm/g1lXWkN0G+EC23tqOWl4XfoCRPX
         SxzcoW1Wz/jfYt7o6B4GhrXsaLPEAkcifOP9RMFu+8y+khglYC9/qK//kCF49JEdTXpU
         51Rg==
X-Gm-Message-State: AOJu0YzvJUPm3Mzw2DmAiOMWiSis1WEC2RMeSMJdy/3gF/s6XLzaGJdO
	VX5/ppxC9CJi+ZExmNrO4jQ8rA==
X-Google-Smtp-Source: AGHT+IGUs1cTF7roNXGwjwzuly5vlfIbdkJ4dyIqUSgULu3Qv7Z7T2nJDVo86ydDa+O1oGRb9p16+w==
X-Received: by 2002:a05:6870:9f08:b0:1fa:1738:85dd with SMTP id xl8-20020a0568709f0800b001fa173885ddmr25882226oab.57.1701415302677;
        Thu, 30 Nov 2023 23:21:42 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id v23-20020a0568301bd700b006d7f8da1b57sm412662ota.62.2023.11.30.23.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:21:42 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 30 Nov 2023 23:21:35 -0800
Subject: [PATCH v2 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231130-fencei-v2-1-2cb623ab1b1f@rivosinc.com>
References: <20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com>
In-Reply-To: <20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701415300; l=6120;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=29lD1s3MiibMkD22p96wvCky0NuEdcDTMl8SkeAuDnk=;
 b=4T9JKi8+qGT7WUOONWkYSL4OzrVZoOIhdWH1IQ3P02CHNb0LQmt2gEDZonkOIYom89ag3dtkd
 y1gOCeN6FDyDbPCi2zVzdPSpLCzzxLnTfxNPZczdYRZ1r3/eEyQJBnV
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
optimization of cross modifying code. This prctl enables userspace code
to use icache flushing instructions such as fence.i with the guarantee
that the icache will continue to be clean after thread migration.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/mmu.h       |  2 ++
 arch/riscv/include/asm/processor.h |  6 ++++++
 arch/riscv/mm/cacheflush.c         | 37 +++++++++++++++++++++++++++++++++++++
 arch/riscv/mm/context.c            |  8 +++++---
 include/uapi/linux/prctl.h         |  3 +++
 kernel/sys.c                       |  6 ++++++
 6 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 355504b37f8e..60be458e94da 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -19,6 +19,8 @@ typedef struct {
 #ifdef CONFIG_SMP
 	/* A local icache flush is needed before user execution can resume. */
 	cpumask_t icache_stale_mask;
+	/* Force local icache flush on all migrations. */
+	bool force_icache_flush;
 #endif
 #ifdef CONFIG_BINFMT_ELF_FDPIC
 	unsigned long exec_fdpic_loadmap;
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda54..7eda6c75e0f2 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -84,6 +84,9 @@ struct thread_struct {
 	unsigned long vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
 	unsigned long align_ctl;
+#ifdef CONFIG_SMP
+	bool force_icache_flush;
+#endif
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
@@ -145,6 +148,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
 #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
 #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
 
+#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_ctx(arg1, arg2)
+extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 55a34f2020a8..3b2bf8256a10 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -5,6 +5,7 @@
 
 #include <linux/acpi.h>
 #include <linux/of.h>
+#include <linux/prctl.h>
 #include <asm/acpi.h>
 #include <asm/cacheflush.h>
 
@@ -152,3 +153,39 @@ void __init riscv_init_cbo_blocksizes(void)
 	if (cboz_block_size)
 		riscv_cboz_block_size = cboz_block_size;
 }
+
+/**
+ * riscv_set_icache_flush_ctx() - Enable userspace to emit icache flushing instructions.
+ * @ctx: Sets the type of context
+ *  - PR_RISCV_CTX_SW_FENCEI: Allow fence.i in userspace. Another fence.i will
+ *			      emitted on thread/process migration.
+ * @per_thread: When set to 0, will use the default behavior of setting the
+ *  icache flush context per process. When set to 1, will use a per thread
+ *  context.
+ *
+ * When in per-process context, there may be multiple threads using the same mm.
+ * Therefore, the icache can never be assumed clean when. Multiple threads in
+ * the process may modify instructions in the mm concurrently.
+ *
+ * In per-thread context, it can be assumed that all modifications to
+ * instructions in memory will be performed by this thread. When the thread is
+ * migrated the icache will be flushed.
+ *
+ */
+int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread)
+{
+#ifdef CONFIG_SMP
+	switch (ctx) {
+	case PR_RISCV_CTX_SW_FENCEI:
+		if (per_thread)
+			current->thread.force_icache_flush = true;
+		else
+			current->mm->context.force_icache_flush = true;
+		break;
+
+	default:
+		break;
+	}
+#endif
+	return 0;
+}
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 217fd4de6134..a394b146e78a 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -297,12 +297,14 @@ static inline void set_mm(struct mm_struct *prev,
  *
  * The "cpu" argument must be the current local CPU number.
  */
-static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
+static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
+					 struct task_struct *task)
 {
 #ifdef CONFIG_SMP
 	cpumask_t *mask = &mm->context.icache_stale_mask;
 
-	if (cpumask_test_cpu(cpu, mask)) {
+	if (cpumask_test_cpu(cpu, mask) || mm->context.force_icache_flush ||
+	    mm->context.force_icache_flush) {
 		cpumask_clear_cpu(cpu, mask);
 		/*
 		 * Ensure the remote hart's writes are visible to this hart.
@@ -332,5 +334,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 
 	set_mm(prev, next, cpu);
 
-	flush_icache_deferred(next, cpu);
+	flush_icache_deferred(next, cpu, task);
 }
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 370ed14b1ae0..472801ea78cc 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -306,4 +306,7 @@ struct prctl_mm_map {
 # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
 # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 
+#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
+# define PR_RISCV_CTX_SW_FENCEI		0
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 420d9cb9cc8e..e806a8a67c36 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -146,6 +146,9 @@
 #ifndef RISCV_V_GET_CONTROL
 # define RISCV_V_GET_CONTROL()		(-EINVAL)
 #endif
+#ifndef RISCV_SET_ICACHE_FLUSH_CTX
+# define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
+#endif
 
 /*
  * this is where the system-wide overflow UID and GID are defined, for
@@ -2739,6 +2742,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_RISCV_V_GET_CONTROL:
 		error = RISCV_V_GET_CONTROL();
 		break;
+	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
+		error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
+		break;
 	default:
 		error = -EINVAL;
 		break;

-- 
2.34.1


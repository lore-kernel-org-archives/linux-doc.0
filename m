Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158325;
	b=tx957TVcBnxcjalIWsKnqqLsVgr9CbIXLwLfTjiaXkGl5w+hZXrEqbd58vH4Fx+qzYWJ
	 W697CuBPP/HGr1np7ht+hqlGvGXtvqDcwNMpzdRSkrHX4pKW4LYF8iFe5yDod4qvlff3c
	 7DdpcveF0Lq9IRx8NKre3Pwmxs06iuiQsoVtQ+hsxn/DMni1eQg6gejELQhXE4otTXVXG
	 yE1pTMyK4PuNKFUmpE+wq2lk7pqQ7Is9cIWjeZ0wTAxCuQyiE6wsjzqjeaz4bomPViXk8
	 Ps1aQ5nBrmzwlN7mVkbhk/PiLkIUX96OBmkGb2cUFTJrGhlOt0hYdzFADymqOtdYHHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
	b=KWKRtXi6Iq6bduZneW4Qxm1c5oo2DUnHd2sOoKtx40Na+gBi7J0sgoZ9ijwYgyRywmfc
	 lAKrOfV8lhu5jdpn+aOpGFJRE8+JHmt5fHKmFlUFEPUZ6UwJG6M1CY55fke/5UnOXd3Jw
	 lLbwRn04FZF15vdFTw1ZQiWRL7zFaSB0VcDVMpgsJIsa/+WH0TpbOP3qDty5ujkH4D5fQ
	 z5hfpM3eXBaN/VtYmpLvgjrVfDQ2UsXZMmqMy/Qe3jnohsBiGxOfD6MHctNsw2rgKN2ZJ
	 PDvZbWc4rGjGNzfyCoTDvJu8IlXpOmmxPKtzfY5xDmw6Jv3GxsDRQ1H32FIpqma6XZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YN1rJqSK;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C36606A329
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C36606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YN1rJqSK
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso3958835e9.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158322; x=1793763122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
        b=YN1rJqSK4kfGeTi3P9WEN2JcOPI2UwtVuMHGOQaZb+j2qAUU19Wd43m8weFH5DCDIU
         oztgwHo2X4/DH4+lDGlZTTG0uzpvImrec4k3MMl2JOqzmXv0lWNmfWGNG4MRNO/cP1kj
         BjPEfioEt4GzPmC2+szafeNnMWTndPrJMTFgzrHa/dX8xVXt7gD/2HLhfc6Z5XZOPkEz
         Wlq+WwlG5/OkzQGWXtYwujgaBGaEImDIopp0Y0RfpHYLGom3sZkhuaPBDz9dH1ZIdnAr
         ep5D63bTpGGi1gSnuPoQVrZXkOv5pU68+AWIt5RHiZjQlRMhjyEr6VUrVqHg7hMNadCn
         A3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158322; x=1793763122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
        b=kY4/zgPcjjVZZhJLHRQMsUTw3g04j/iXN3YKP0dcro16b4CfVaw/vbb9Cu+GUBf5Su
         pgQ2RpTLh0OkV7Jgyfr2dqEBmlJY1uK16TIke+XxB5d2n0SULUmFDcfZm97SxmarSmqX
         51KcOolv/hqCEqgiZ12VeB5DReEoqkwPcsyxNzLrUdH7BgJtZS82DHCUTdNIRiBREQB/
         eGJIL2yRqydxd6JpVTCVLCp16T4UZwsEPeTeG8RZX/fHbX3GI1pU2LBdDf8yLZU1YMha
         PcKTDh0We3wx1U2CSZZGDTrEsZIE/nTK30bbG5/ivCxFNTNpj2oEVMf/cnwHft2ztope
         /5Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxIsR3L959m6Cl1p2JUlG3BmbEJ1qQ7emg/3dJDkhbb0DenEvZxeI8/FD028yPJfKMer6RZVWEraaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgvMVZ7wUlJmy/Vv830fPQrrE07XkEtTkM4RIRQ9SoO0xPnj2/
	oa0wHQCtlEDBwyEjmqtQqF9GC1nU4TvN+omotTBbVoNZpV6WU2zYhGxn
X-Gm-Gg: AYBFou2J9TxoiUOuhByFfjaT2kV+lIVvMKgEwn9LfNpUMkLk6ikpajbRj9SNZgfREO2
	PXGlhWTcURc/7zn8ZqUUIdOfZEJnJSnq8zuVo38wKOiNCiX0N0sieLdvJLIza8KJ+rB7ZVq1w8w
	bp5WrB2/5TUNIG9wWmnpc37eMwKgkEYFPJSmjUgHjHEJzz0HWfegzYAo8F/vjwlnlh2gtyxQhWn
	p+dtR6PMOyeEpqBfxWS1c3lBC0U0Uzu0C45X91YbIz8Z/5zE7cRTv/Y0vuX5j1Gvg9VCoOYZi5G
	5h+t4Lc1ogA3FPeU2eKKBPYdHt2elOyqSYHAkK7UyspeJsEtoLP+7SGOVtT165UqROwBI8kAxfY
	LA/ZrvaJZHr2WbnsfwhWf6dN7SlHXYnYdvrvJIo3x/YZ84moIUahQ5FtxpBFBH9FeH+8ShCu3Qr
	KF1rO+v4iMyD1yWeDI/ewOvfn0fHYFLdI7o2K6ogyx4URNlWvBIQ6PC2oP5FZWU4gpVI7HMZrfS
	IjUtBC/HDyqyBlF0MDiTUuKJCN9B4DaCQvH5YZevF1Qw/eDwpv23S8oX8jFKoMIXU83XmbcnrX6
	kqeUn1oU3pk/kW+kqdgdyWSsNUZLGq+wrvTj4NzvoEFzVdJVAX5PDQ5XB/l6T8kqR+b8eYpcr9p
	/89IaCczsPMWb2ntY31y2OhYz9SANgmNNC6Iyb+1dkxxFBHrpjHxt7teSOWLrjeejzOzZVltybp
	Ir/1+Mgz1T1xLdFG1tvXa6NlzMBMEfZ78M
X-Received: by 2002:a05:600c:a314:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4a96b29d208mr13460435e9.18.1793158322397;
        Tue, 27 Oct 2026 20:32:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 07/13] context_tracking: Split IRQ-exit preparation from the EQS transition
Date: Wed, 28 Oct 2026 04:31:21 +0100
Message-Id: <20261028033127.82193-8-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
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

ct_irq_exit() combines traceable nesting and tracepoint work with the final
transition to an RCU extended quiescent state. A pre-counted ordinary
hardirq return needs to run that preparation before its synthetic hardirq
classification is removed, but it must enter the quiescent state only after
the raw count and lockdep teardown.

Split IRQ exit into prepare and finish phases. The prepare phase validates
and updates interrupt nesting, then emits the tracepoint while RCU is
watching. The finish phase performs the raw quiescent-state transition and
RCU Tasks bookkeeping.

Keep ct_irq_exit() and ct_nmi_exit() as adjacent prepare and finish
wrappers. Existing IRQ and NMI callers retain their ordering and behavior.

Assisted-by: LLM
---
 include/linux/context_tracking_irq.h | 32 +++++++++++-
 kernel/context_tracking.c            | 78 ++++++++++++++++++++++------
 2 files changed, 93 insertions(+), 17 deletions(-)

diff --git a/include/linux/context_tracking_irq.h b/include/linux/context_tracking_irq.h
index 197916ee91a4b..b038cd1249148 100644
--- a/include/linux/context_tracking_irq.h
+++ b/include/linux/context_tracking_irq.h
@@ -2,8 +2,23 @@
 #ifndef _LINUX_CONTEXT_TRACKING_IRQ_H
 #define _LINUX_CONTEXT_TRACKING_IRQ_H
 
+#include <linux/types.h>
+
+/**
+ * struct ct_irq_exit_state - Opaque context-tracking IRQ-exit state
+ * @exit_rcu: The interrupted context was in an RCU extended quiescent state
+ *
+ * This object is filled in by ct_irq_exit_prepare() and must be passed to the
+ * matching ct_irq_exit_finish(). Callers must consider its members private.
+ */
+struct ct_irq_exit_state {
+	bool exit_rcu;
+};
+
 #ifdef CONFIG_CONTEXT_TRACKING_IDLE
 void ct_irq_enter(void);
+struct ct_irq_exit_state ct_irq_exit_prepare(void);
+void ct_irq_exit_finish(struct ct_irq_exit_state state);
 void ct_irq_exit(void);
 void ct_irq_enter_irqson(void);
 void ct_irq_exit_irqson(void);
@@ -11,7 +26,22 @@ void ct_nmi_enter(void);
 void ct_nmi_exit(void);
 #else
 static __always_inline void ct_irq_enter(void) { }
-static __always_inline void ct_irq_exit(void) { }
+static __always_inline struct ct_irq_exit_state ct_irq_exit_prepare(void)
+{
+	return (struct ct_irq_exit_state) { };
+}
+
+static __always_inline void ct_irq_exit_finish(struct ct_irq_exit_state state)
+{
+	(void)state;
+}
+
+static __always_inline void ct_irq_exit(void)
+{
+	struct ct_irq_exit_state state = ct_irq_exit_prepare();
+
+	ct_irq_exit_finish(state);
+}
 static inline void ct_irq_enter_irqson(void) { }
 static inline void ct_irq_exit_irqson(void) { }
 static __always_inline void ct_nmi_enter(void) { }
diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index a743e7ffa6c00..80ed8ec606c6a 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -169,20 +169,10 @@ static void noinstr ct_kernel_enter(bool user, int offset)
 	instrumentation_end();
 }
 
-/**
- * ct_nmi_exit - inform RCU of exit from NMI context
- *
- * If we are returning from the outermost NMI handler that interrupted an
- * RCU-idle period, update ct->state and ct->nmi_nesting
- * to let the RCU grace-period handling know that the CPU is back to
- * being RCU-idle.
- *
- * If you add or remove a call to ct_nmi_exit(), be sure to test
- * with CONFIG_RCU_EQS_DEBUG=y.
- */
-void noinstr ct_nmi_exit(void)
+static struct ct_irq_exit_state noinstr __ct_nmi_exit_prepare(void)
 {
 	struct context_tracking *ct = this_cpu_ptr(&context_tracking);
+	struct ct_irq_exit_state state = { };
 
 	instrumentation_begin();
 	/*
@@ -203,7 +193,7 @@ void noinstr ct_nmi_exit(void)
 		WRITE_ONCE(ct->nmi_nesting, /* No store tearing. */
 			   ct_nmi_nesting() - 2);
 		instrumentation_end();
-		return;
+		return state;
 	}
 
 	/* This NMI interrupted an RCU-idle CPU, restore RCU-idleness. */
@@ -213,6 +203,15 @@ void noinstr ct_nmi_exit(void)
 	// instrumentation for the noinstr ct_kernel_exit_state()
 	instrument_atomic_write(&ct->state, sizeof(ct->state));
 	instrumentation_end();
+	state.exit_rcu = true;
+
+	return state;
+}
+
+static void noinstr __ct_nmi_exit_finish(struct ct_irq_exit_state state)
+{
+	if (!state.exit_rcu)
+		return;
 
 	// RCU is watching here ...
 	ct_kernel_exit_state(CT_RCU_WATCHING);
@@ -222,6 +221,24 @@ void noinstr ct_nmi_exit(void)
 		rcu_task_exit();
 }
 
+/**
+ * ct_nmi_exit - inform RCU of exit from NMI context
+ *
+ * If we are returning from the outermost NMI handler that interrupted an
+ * RCU-idle period, update ct->state and ct->nmi_nesting
+ * to let the RCU grace-period handling know that the CPU is back to
+ * being RCU-idle.
+ *
+ * If you add or remove a call to ct_nmi_exit(), be sure to test
+ * with CONFIG_RCU_EQS_DEBUG=y.
+ */
+void noinstr ct_nmi_exit(void)
+{
+	struct ct_irq_exit_state state = __ct_nmi_exit_prepare();
+
+	__ct_nmi_exit_finish(state);
+}
+
 /**
  * ct_nmi_enter - inform RCU of entry to NMI context
  *
@@ -348,7 +365,35 @@ noinstr void ct_irq_enter(void)
 }
 
 /**
- * ct_irq_exit - inform RCU that current CPU is exiting irq towards idle
+ * ct_irq_exit_prepare - prepare to exit an IRQ towards idle
+ *
+ * Perform the traceable part of an IRQ exit and return an opaque object for
+ * ct_irq_exit_finish(). RCU remains watching until the matching finish call.
+ * The caller must keep interrupts disabled, must not schedule or migrate, and
+ * must invoke ct_irq_exit_finish() exactly once.
+ *
+ * Return: An opaque object to pass to ct_irq_exit_finish().
+ */
+struct ct_irq_exit_state noinstr ct_irq_exit_prepare(void)
+{
+	lockdep_assert_irqs_disabled();
+	return __ct_nmi_exit_prepare();
+}
+
+/**
+ * ct_irq_exit_finish - finish exiting an IRQ towards idle
+ * @state: Return value from the matching ct_irq_exit_prepare()
+ *
+ * Complete a pending transition to an RCU extended quiescent state. Nothing
+ * traceable may run between this function and the low-level return path.
+ */
+void noinstr ct_irq_exit_finish(struct ct_irq_exit_state state)
+{
+	__ct_nmi_exit_finish(state);
+}
+
+/**
+ * ct_irq_exit - inform RCU that current CPU is exiting IRQ towards idle
  *
  * Exit from an interrupt handler, which might possibly result in entering
  * idle mode, in other words, leaving the mode in which read-side critical
@@ -368,8 +413,9 @@ noinstr void ct_irq_enter(void)
  */
 noinstr void ct_irq_exit(void)
 {
-	lockdep_assert_irqs_disabled();
-	ct_nmi_exit();
+	struct ct_irq_exit_state state = ct_irq_exit_prepare();
+
+	ct_irq_exit_finish(state);
 }
 
 /*
-- 
2.39.5 (Apple Git-154)


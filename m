Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646250;
	b=KWt0JM1rCTvZP/6YkTL+Aj5CejJ343HjyG45bAS7p6anqMn6Ao4yyEsNM0heJxJ+/PgS
	 ZmqZC3PhIIdMoP+1gZxjEPMTAR2ApX1azAXipbOzUNsokpzAw6zTVKKmArjyDlE8HdXpP
	 JdT1fe/Qmx3jPjwZD0std7MKlgvrSi6Xift2q21cecNOoB6eJvR9dTKQx8ku6uuC3y/gF
	 TVTmurnP+t9c7SFb0jAcH/RZP1+Q4//VAlX/ue+ZcVa3ovLglt2HOvBm63h3IXHZXCZ1t
	 /6GOhaBK36HJd869KIJh9jFKcHTmNUDy/FuwNpBz+dPl/DCsQUsPHCSQQFNfw08nS/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
	b=ZO1OxGRCHtdEAlsjs023ASYh1sqqcg+i5mNcK/4/ldMsU1GYTwWSKcSlJvnygcvcBWN6
	 Klf6fM9He0BSLttcxcMReCrdoZApd+6OEqySHWvFaOosPyK1vB5yZI4KWz0sOnPVEoQsZ
	 f7m2F651TfP4q31tH6cKt8ydC/aIFvIajvni7FZBpfNfI5uxL/ZnilYUPumJcAMpRUSpP
	 QSJ0+c9VjWDAOMlG3mnh8qyExzDPj2BDTV0ropTOQr1f1tPEPSJaz5xfW7M0mvD9SLboB
	 AYpnYEVDOE9iBZP+D3uDmy5QaVSod1NeqAjbT5CVq/ZLA2y96S2ILApqMoZM2LI3aRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWjT1DOi;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977D960A2617
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977D960A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWjT1DOi
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c45111bebso904570f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 22:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646248; x=1793251048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
        b=EWjT1DOiwP/QnckE2CrzqGSzPgoFuNRp8VGjmbvso6wvNstOG5pDtREqV/mcIP4NBl
         b4C06akztESRsdUBLQrfEbcZdlXcf4n97yiZjVOuY3F9vRugGIbH3gBEORiheP17PvAq
         Z46xcAAOKDUTv47gGyvq8ri5OvlX9hRfheBOmAJ8JwUOhyM+3f351ZeJ+JOViqjXf71c
         3VRpl/wcoPUbgebZh1YgVVmVOXlLgrN2SKHQwnL2Nhkw6jnyz/XoFQLAX3VhZbUvths8
         k97bAX4O3eCubhXQglvGpX8ZAdLEShBHl2I2mrXkK4gQ5wENoUQgab6WJO1I0hcsmoBq
         zXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646248; x=1793251048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
        b=ULYJRxNXqeFqmz0UDuhWHXbSbLFGgKHYR4+sGFHBEr2PPh1xe1c5o+bVtlaBzup076
         msYifrc8wLL3au2UTbTSA5+U+O2hVUnoy4ns2+HZ6HqRNADsv817mqgzrF6I+cPJRWFM
         BVnrixs7w2+gBl/6aqOOh0PD8jBBAe840WZUjLqPfEwwh5sSmKnT/Ajrtxj+PDhianZ6
         JEbG/mnw7JzmK2Nrnr3Qnx2Os2FHrt6rl9qOhT4oS8fuwaPTOTMUA5vg+I43L1V5h99o
         2hVvbGDSYKyPtQUnM7NyBJ5LEKvBaggEsYB5ToSBZNR/F5TcnQlSRyBRq+WYbCbnFTKK
         ts0w==
X-Forwarded-Encrypted: i=1; AKwUvBy8NSWfS29Gyhcc/9d+XWMoUK4MVzz8C9vIjXGNiFF1RuT9GRMRh89dP5TXJ1+aoWehveqL/XU/mCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdn4MaSC2hX4ySQbWn5/X5lVKxBLt7gfW6DH/TyJqmBteVFuuw
	7M2Q5eQL9QWzb8/35wtPUN15eS2YxG+PlRQAIfR0Tdm9/za8mZyXLzcr
X-Gm-Gg: AYBFou1CLHwbZ4PYR8QVF/vxj56Z6eV49e3GFn9BdfDMzXb2rz8HqPWIvBH31SzQgvh
	6UfWthPJQwKeC2NlDOGjrtuuhPjwIGOYeiNYZtrwRgYEXyYdQVVlybHpckF3MlCqzDoTjg6ttED
	jbGWeIfSllUFXZ/Ds03A0adRtJWVHhORGU1ao9ykPGbWrcjN2AsH4BzMtZtUHDkgpTTjjz4T/T8
	ocFMwh4YwlvnVA65AhrY2fkGNtOMBSn7Ml4yDAz/2T6B/xQVIRxJAnLFiQeFrPCBlcZrbq4IX0L
	DcNMDMoNgQ96FkKF77rsy/Udq3BVXrqtzLDluZvPUjsp5H+nAtT2tj93UcWs2sQq9BPJa07vd56
	T35M2rsudXnAbSulWvzujsJkTTlvMwUHygTzftLgpFWwDIoPqiBqxCCRw5M8xw8sBKqAIMFrXH6
	h+znIKVubavdTsmJIXSU4wVPOTT8zoUEWMvylq10ZlDzGwsDE2wykWlLcqFuRRZ7UamyPZtouMY
	q/lxl2/SxK8ckAG9MB8VfrFC/Bjr026qw3WwOO/TEW7BXkCUFe0OZUdC6xap/5u8L0NeqIin508
	FhxXkzIOOgWiIsQ9Z99n1xNO4L06I6BsUawSjfqRUP+05cMdIuraXFP2Hv6BiIxDwB7W+1tvlHF
	z4p5NBIUBOk6OeKsIEnp05OMmbptX0BJvtTByvtYwCb729Y/4g87Wa2HfnuU=
X-Received: by 2002:a05:600c:1d0f:b0:4a1:fbd5:26b0 with SMTP id 5b1f17b1804b1-4a1fdd15af8mr85822205e9.12.1792646247844;
        Wed, 21 Oct 2026 22:17:27 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Subject: [RFC PATCH 05/12] context_tracking: Split IRQ-exit preparation from the EQS transition
Date: Thu, 22 Oct 2026 07:16:47 +0200
Message-Id: <20261022051654.79224-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
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


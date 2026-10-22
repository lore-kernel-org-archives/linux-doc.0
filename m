Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646252;
	b=VbmCkaup0SUxLdsXMTsF03JRUrfXbtF0GFU2R5Q/g3yT9NsextUDZJvsST++GwP1N+W3
	 HkAlcGqkhOZLaDro7Uxc3ExpwLf/bb8Gw8dNQ8rcu7NrBjfqNXQNpDZzhcXMCKt1CtFs6
	 csXgU6bcPV+WOIgKZqwG4Hdr7p72OguHRmY8WgmO4fT+NDY54za2ytK9VlxqEg9CmhF+G
	 6lqopY859+yRFNto67mU6OqmsZfImwJmXKGud+NXV5QP+PjdFEy0z3dlFVIN34oCjoZyB
	 b6yxNUCKE00/2pd18IuCODUkRSI1R+qCHl4S7T2tHaivbPNVk538EitHcJ1vNaDKQ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SgSVPju/oDwYCUMu1qXQuK1g6vGXDkUziO98RSaFsPc=;
	b=2QKI7tzYoQdHMDJc3pUGVu8vmrec4kXkWchiDkVY25HaXfOWzgYjxeLWH7C1vcPn9Jna
	 G6886CChjPPhvYxgDwVeagmDo4mBrztiSREnkNivLm270bK6alvMx7T7GiROGJV2KXPWJ
	 S/q0clvvXF5MGKh2wDaXt1H8eNRNKOSb9V/B9Sf3hAQcrRdy+KNzkk7DCPkueTs5cXilP
	 8MBNz0299xJiLZ91RUnpSBB/Hm137R3JLqNWvMRrcAMIljZoMWSwmlx/2MgN1h6y2UdeW
	 72AvrzLZPc3kUokL2y6Az5zgErNBNzuCnopwZfH5BhMEk7j7/6okp6ArvZJcl5lebcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mV9IvZyy;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378C260A260B
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378C260A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mV9IvZyy
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso11646885e9.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 22:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646251; x=1793251051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgSVPju/oDwYCUMu1qXQuK1g6vGXDkUziO98RSaFsPc=;
        b=mV9IvZyyzzbb8eaAq6WvvyU135ja9QGcCNyd0fJ/Rk00xax7ivbbJh0YOCwOj0uU9r
         Sv3sxXQHx5XvUGVhU1w0dQId4eQB0Ahb1C/jzherVi59bpgQvHQEgzuCGSQjX1tynKtq
         XfNgYHmZNLlcc4Ks+57CJOVR20sy71p8y5GsPhGA3v089OZlWQZGOy54eJ9UWfP0xfT0
         EhawdTFhkEw5DB370nnFZn9FD6sSH6iN66zAa8OqDMF4OI+AFm3ecjvZzbU4FpZOKnfv
         Q+unLImemE4UTWn19tJ9yWLuFDHBUYq51E522H1mbVA6g8CqRgWFl10Z5gTsWhMC1xnd
         SKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646251; x=1793251051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgSVPju/oDwYCUMu1qXQuK1g6vGXDkUziO98RSaFsPc=;
        b=Oz+V2HGK/i2Cs9VhhVyadCUabkFocVjWku/Vd06KhGhuC0bW47dyDm8iABdCL5gClH
         bATIPky0kw1mjJz3aGYU4xxaW6wK0Yt0Sgw85llT7esEbOP5I+V0CLIlOjs/FdoV6h8J
         BDxcN11eX3x8xhrsga7JhgCmU5SPT29+MprVpAyIbA6kZYfi5AZ9Qke3fGnKt1Xbedf5
         QYRvsOjDDdRvve6XclEDjyvzYIBppEBilD3DqvwNaPVXRJBSwO5ZbH73Y9xfwP1zXi/e
         3UHY6q3bYuC2eHDITurf9IwFf5ZWqdprmPHKGRNE0k4gwn96qX/s0KQ6+qi4fe+RlamE
         stJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQWG7s4Tf4GcyzAHnc4kjX3/8j0bGBAa8lkuOVej2IJpoy+H5xPa4dVI3ct3rhWONfbpBib96UgTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrgHm72u0BZz7peIl6vrs2dCXg95/7oN0rniofAB2eDodb1Zd9
	edUIQZ0OyyMnUQg13he5lquVTioCRQdQMIwbkuTIvUfjdrrJinPZ929K
X-Gm-Gg: AYBFou2oxlCKz3aEaO0roQxMXnrssZk4EYIwvKmA5y3CQWRSOd0XGJxxbpEtRcwRwsG
	CMBP/OwC/Cb6W+NOylIHypVHw4lRe0NWp8tUnFthtdkQ79vCH2RN3AVTDOfsT0EAU0LPQYz3ii6
	PJCtotmTDIp8WaTO22GwL2TG7qyxOeg8Vd+FpY2I0UpEyskmDWrqrlYTIXHW7jB9gsOvz88WBAw
	PauijBzx4ICvrouneZf6VZjPGG4I/gnDW1tQCjAEewioGRVHP9VP2fPe3x90V0uR0DgShykcoK4
	n4BX/5EbHF1lj2r5e5DqBSVtc2nQkz33rFQoPoNHpTXVlfv+e+Lodyf7Hlt3pn9qNhJH8tO050k
	t9kJ1iiDL/QnoDkjxxNDLenyfvJ+jITYK9yzJd62UOXB8WGGK4/1wl2YrQIb3neTPMzhE+yU5b1
	BGYTn4kygBKdcMr6jQqrHXZ+s9sLva6NLCTc4MimVNsDGX9JVI/RQbmrMzC+f7aPTXWH1BxSNi6
	qneObzYy2F2N3r5qeQT4lXs8WIF7mBzDsidMQxFI8oX4q8GIyvLtLTLrCdN+IvpQAYYHETzY5ng
	KBuIBBiX92DU+jbtwN9M/ugcArHVMm6FGJEOPOEm3kq39Jsu7orZRKd7bzOYmFhLxpsYULytVx7
	/VrW1n1g72r1ambIF1qrE/LdjNc00IcgJEmnH6hnZXPFEvAivOjSv0gbhZu8=
X-Received: by 2002:a05:600d:8653:20b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4a205ca7975mr15129905e9.4.1792646250340;
        Wed, 21 Oct 2026 22:17:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:29 -0700 (PDT)
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
Subject: [RFC PATCH 06/12] lockdep: Prepare IRQ-on state from a hardirq return tail
Date: Thu, 22 Oct 2026 07:16:48 +0200
Message-Id: <20261022051654.79224-7-kmehltretter@gmail.com>
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

lockdep_hardirqs_on_prepare() rejects any live hardirq context. An ordinary
hardirq return tail needs to retain one synthetic hardirq nesting level
through traceable IRQ-on preparation so callbacks remain classified as
hardirq work.

Factor the common preparation and add a return-tail variant which accepts
exactly one nesting level. Keep the ordinary helper restricted to zero.
Neither helper changes IRQ or hardirq state. The caller must remove the
tail context before lockdep_hardirqs_on().

Assisted-by: LLM
---
 include/linux/irqflags.h |  2 ++
 kernel/locking/lockdep.c | 42 ++++++++++++++++++++++++++++------------
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index e98313a8ad307..c7601a173e55b 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -25,6 +25,7 @@ struct task_struct;
   extern void lockdep_softirqs_on(unsigned long ip);
   extern void lockdep_softirqs_off(unsigned long ip);
   extern void lockdep_hardirqs_on_prepare(void);
+void lockdep_hardirqs_on_prepare_irqtail(void);
   extern void lockdep_hardirqs_on(unsigned long ip);
   extern void lockdep_hardirqs_off(unsigned long ip);
   extern void lockdep_cleanup_dead_cpu(unsigned int cpu,
@@ -33,6 +34,7 @@ struct task_struct;
   static inline void lockdep_softirqs_on(unsigned long ip) { }
   static inline void lockdep_softirqs_off(unsigned long ip) { }
   static inline void lockdep_hardirqs_on_prepare(void) { }
+static inline void lockdep_hardirqs_on_prepare_irqtail(void) { }
   static inline void lockdep_hardirqs_on(unsigned long ip) { }
   static inline void lockdep_hardirqs_off(unsigned long ip) { }
   static inline void lockdep_cleanup_dead_cpu(unsigned int cpu,
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 01dba8fb32a90..457bef3ea1689 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4395,15 +4395,7 @@ static void __trace_hardirqs_on_caller(void)
 		mark_held_locks(curr, LOCK_ENABLED_SOFTIRQ);
 }
 
-/**
- * lockdep_hardirqs_on_prepare - Prepare for enabling interrupts
- *
- * Invoked before a possible transition to RCU idle from exit to user or
- * guest mode. This ensures that all RCU operations are done before RCU
- * stops watching. After the RCU transition lockdep_hardirqs_on() has to be
- * invoked to set the final state.
- */
-void lockdep_hardirqs_on_prepare(void)
+static void __lockdep_hardirqs_on_prepare(unsigned int expected_context)
 {
 	if (unlikely(!debug_locks))
 		return;
@@ -4442,10 +4434,11 @@ void lockdep_hardirqs_on_prepare(void)
 		return;
 
 	/*
-	 * Can't allow enabling interrupts while in an interrupt handler,
-	 * that's general bad form and such. Recursion, limited stack etc..
+	 * Ordinary IRQ enable requires no hardirq context. The interrupt return
+	 * tail variant permits exactly the synthetic context it is about to
+	 * remove.
 	 */
-	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context()))
+	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context() != expected_context))
 		return;
 
 	current->hardirq_chain_key = current->curr_chain_key;
@@ -4454,8 +4447,33 @@ void lockdep_hardirqs_on_prepare(void)
 	__trace_hardirqs_on_caller();
 	lockdep_recursion_finish();
 }
+
+/**
+ * lockdep_hardirqs_on_prepare - Prepare for enabling interrupts
+ *
+ * Invoked before a possible transition to RCU idle from exit to user or
+ * guest mode. This ensures that all RCU operations are done before RCU
+ * stops watching. After the RCU transition lockdep_hardirqs_on() has to be
+ * invoked to set the final state.
+ */
+void lockdep_hardirqs_on_prepare(void)
+{
+	__lockdep_hardirqs_on_prepare(0);
+}
 EXPORT_SYMBOL_GPL(lockdep_hardirqs_on_prepare);
 
+/**
+ * lockdep_hardirqs_on_prepare_irqtail - Prepare an interrupt return tail
+ *
+ * Like lockdep_hardirqs_on_prepare(), but invoked while the single synthetic
+ * lockdep hardirq context covering an interrupt return tail is still active.
+ * The caller must remove that context before lockdep_hardirqs_on().
+ */
+void lockdep_hardirqs_on_prepare_irqtail(void)
+{
+	__lockdep_hardirqs_on_prepare(1);
+}
+
 void noinstr lockdep_hardirqs_on(unsigned long ip)
 {
 	struct irqtrace_events *trace = &current->irqtrace;
-- 
2.39.5 (Apple Git-154)


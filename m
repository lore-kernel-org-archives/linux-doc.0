Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158326;
	b=zKD6pXFRpUtaJsm8vQT+JEKpU0xY53CuQ+0pldjqbHXZRDBeJ2AglSwdtt9ElTiDMZfo
	 1xhS44+n8WCQGpuO74epX+JsmWsSTffmtCWoAZC0ljuJ89OBIkL0KZY/YCZnFSUBuJquR
	 mpw9w/rjzoFG4b+a9SL6SSTczdvBI6welxpNm4zHjvFmtvrJaj2TpEAV2AyM5ooHW0cVI
	 SLAXusbNF8Ph+huK+bdfs5fO7NYorlsXZ0k6wME16WK5L8ikX/PVkWNZ53EbrTeePniiw
	 LxW4sk7XrOlATTrRgRfbADJvWrdil1Pe3GlECkEavJM+iXu0PQuuSVK4nwnVZOk15HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=;
	b=EESGtll/xLQ3427++Wow7NZDewOnh3CWFmZk33MGpee3TwzHVqg5IDL7bKijIJXy/FSr
	 BG3G0kTkKB4YIbtZBqHL8aRDhOHMUwDA+GVmIA1Q5xjZkMXGjIL7QDc4gXNl/g3cWo2qa
	 BJnYUiDGeRZ9iams2SQiAbc+4YRzV18sbHrIZ/iZq1jbUUo6/XSDTMD+Bk0Igl4NPneiC
	 6av41Jk6jDirIlx/BjnKFqbqpYWXbCO13phU+IQeTS7ViZdP6HSvtkG2PHgyExEn2h0GG
	 R9JUddKRY6a94WZsGeX2qcDoUo4qpFy/ddifww42EiEn7XrpmMUx1tiHXgZ4Uo6sKsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQYihddN;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18AA606A331
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D18AA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQYihddN
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso298439f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158324; x=1793763124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=;
        b=IQYihddNldSwwNQL4cNDOCOj3vvWf6Wnmb806Mt7YnHev8qmPKJiywxcjV1sz23mXu
         dsePR7cCzgB1pkxuONknafj6ZvOcKxOm9j21xDL+bfrY+eQ0VQuSbN3gctFdA4KuZLpc
         OoXsqXDz1La7cEGOcnMkuJs36dhQ4jJmZlkgx/4ZM7D8fxZnRkApn6OA0yKoYFHPPqbk
         NXtRw8M6f3S2T8WDmwVlJoDaOifcuApwzusE2dCncmuNF7/4LvAnZecpSlEEWnG4gGCG
         f43UwyjXzPxKe0pBrfcsDQ79AEFjnAbqaV9ok+1I9lUNLDqEtqrdHjtp3kc55W7icDz0
         hOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158324; x=1793763124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=;
        b=X0bzUO8TiSKiNvRs4pnBrdcAl/+OZ+AIzkbZ2sirgRMJeBOlh3oog+J1Ymk5xA8UR7
         tq+wXMCV2oBbaxRDQnGFdfLK93nLl3z6CGa2iRoogVCzBsZPfNgjxDodlH+dd6iLPC9x
         F/rxTkYmVc+vicpm0MlgiJv1apsJcVjTRkbaFdR9kJnZuizlP39EenHlx9M/5DpcUo/0
         /nE7RqFc3Y94QCOsT0RNe7Th1Wo5dhDAdJY5pfVAK7uBOtYtWMP6lLGd4qNjVICStlK6
         qRtf7cOlgFN8r15hgSXHnTh1S9oPPa2yS4QoF26g9dFSi66K0SGKfTEPkcEAy50KLLUh
         aOQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIbgjWzuoaFzZ6HmpSLH02P0FBsRgcH4z81h7QY5JQVOEKq5SrxAtiWsDq6N3z/vJ5M5iOXbN78Zg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBdOiWmVxM3dUh2dzZZvPvny01ekGK57X+CBxPnuLr4+ePd5Na
	KFWg6Dwl3ydSdmGmEcj7KnSusiqslom6aTOV58qizPR96AcgU0otbCGB
X-Gm-Gg: AYBFou2M031h0MM5+eGkIZE05nr2X6tKm3ZEuvQmeSyoAPFtoi9mqEIItepT/wzSINb
	lpYmYtU0BfEbNxsxPzz3Zzb/05hKE+Hwe5xdvsWXgHQf2mhp/SYuFEsnL23tVfOpaBBO+9q8I6c
	JPIya+Gn6E0Q5TdUO0VJAq4PHwmeGh58Kb2kuwKKtgfqg9dOcOZMntX00skX8p/4N9nbs3KlTIK
	DR5GHsQBt58BQfevovZc97E65ZYEuDveTSY+Q7NHdHlBFOWI3hmu0II61LVcIvJEG+aVycD42BG
	VQxPcU8RfhbgX3rHZrfLRG0mMmpaGbnubdsz5e/R45w52HEwR8mGdqyby344tVK2k2s/dTdfOev
	ZRkB4E3pv4dnJTBEXC4HWYhjaJmNYbWUzoQz6mXqBLKoIOoUPlxVSy26zGRt4hfRBmkdhPDZmjU
	DkuHjgt5AyAh9GMSvI5/tcs2cZ2mGa26zzyDTdM+Jjm1AUwaIbBpOH2s9lzunWm+a4Qx+oJ0zYA
	Tgy2JKTpnbQD1hTKZvQNoerceTP61fuQ+i4w/kI5xHW+GUqq+2A5InURISL85wtaaWqBBE/oQZ2
	C7RZ60LYdy1sg5ruwUGFmSKCbIaADVBriA3Tn1yDtCdoqfI3dnLP6h/iXjXjuFDNKgcO63lrDp+
	/wosHkP0gz+Rh4cwoksrWsiq6J1jr0+3wMl3IJADwJSIlrsAe5hjSH0SjLnZ5oQnonNnStlfmoz
	toj+ZPYozhMWM+JrCABNu2ig5J3MV4/VQ7
X-Received: by 2002:a05:6000:46d9:b0:48d:fa9c:7838 with SMTP id ffacd0b85a97d-48e5d567dd3mr1945784f8f.2.1793158324146;
        Tue, 27 Oct 2026 20:32:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:03 -0700 (PDT)
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
Subject: [RFC PATCH v2 08/13] lockdep: Prepare IRQ-on state from a hardirq return tail
Date: Wed, 28 Oct 2026 04:31:22 +0100
Message-Id: <20261028033127.82193-9-kmehltretter@gmail.com>
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

lockdep_hardirqs_on_prepare() rejects any live hardirq context. An ordinary
hardirq return tail needs to retain synthetic hardirq nesting through
traceable IRQ-on preparation. This keeps callbacks classified as hardirq
work.

Factor the common preparation and add a return-tail variant which requires
the synthetic hardirq context to be present. An interrupted outer hardirq
can contribute additional nesting. Keep the ordinary helper restricted to
zero. Neither helper changes IRQ or hardirq state. The caller must remove
the tail context before lockdep_hardirqs_on().

Assisted-by: LLM
---
 include/linux/irqflags.h |  2 ++
 kernel/locking/lockdep.c | 43 +++++++++++++++++++++++++++++-----------
 2 files changed, 33 insertions(+), 12 deletions(-)

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
index 01dba8fb32a90..2ecd506715fa7 100644
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
+static void __lockdep_hardirqs_on_prepare(bool expect_hardirq)
 {
 	if (unlikely(!debug_locks))
 		return;
@@ -4442,10 +4434,11 @@ void lockdep_hardirqs_on_prepare(void)
 		return;
 
 	/*
-	 * Can't allow enabling interrupts while in an interrupt handler,
-	 * that's general bad form and such. Recursion, limited stack etc..
+	 * Ordinary IRQ enable requires no hardirq context. The interrupt return
+	 * tail variant requires its synthetic context, possibly nested inside
+	 * an interrupted outer hardirq.
 	 */
-	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context()))
+	if (DEBUG_LOCKS_WARN_ON(!!lockdep_hardirq_context() != expect_hardirq))
 		return;
 
 	current->hardirq_chain_key = current->curr_chain_key;
@@ -4454,8 +4447,34 @@ void lockdep_hardirqs_on_prepare(void)
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
+	__lockdep_hardirqs_on_prepare(false);
+}
 EXPORT_SYMBOL_GPL(lockdep_hardirqs_on_prepare);
 
+/**
+ * lockdep_hardirqs_on_prepare_irqtail - Prepare an interrupt return tail
+ *
+ * Like lockdep_hardirqs_on_prepare(), but invoked while the synthetic lockdep
+ * hardirq context covering an interrupt return tail is still active. An
+ * interrupted outer hardirq can contribute additional nesting. The caller
+ * must remove the tail context before lockdep_hardirqs_on().
+ */
+void lockdep_hardirqs_on_prepare_irqtail(void)
+{
+	__lockdep_hardirqs_on_prepare(true);
+}
+
 void noinstr lockdep_hardirqs_on(unsigned long ip)
 {
 	struct irqtrace_events *trace = &current->irqtrace;
-- 
2.39.5 (Apple Git-154)


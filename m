Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158339;
	b=PIVuz7Mt8Jt6PNRBZU2YZvEBSGZzkmLfBDOXdCaUUyn5CK65hkttw7Cssv9DUCDMhqxb
	 y75xjA4VkczJ/KiHQuSxSSHoAXo//NFhE2ITo6xCGRdwJRUij+I3ewYFmJ/WDkjtURoJu
	 p9bI21P9mnLkOWOPqidEiMDqh/bGQIBUEyDYgo2cRffAyOedN+2MLN6KIM9RatUF83lLf
	 RQzzzf+zBa1+0fiFg95x5tKH9I4N91vBnCQO+QaAMHdEgi/8Yd5xGgvVPzzNMmOGDTRPr
	 mPy3zUG5oB+gFHvVGwmX6gMTkois/XON+4w16/yDI2nNvPpNJ/H+7vEEA5mVV9IspIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/z19Dyd36Kry4my+DL1hRK2Ik7rhLnBj6p5QTA/aWQg=;
	b=zVQyT7RVntmlRSz2gGSgLcZ/z57Hl+IptYw08CnKH6yJ1xkPFNDhHrryBG8WO0qKALXH
	 V+XNQh3MKSEpO4LMatscWNXRhD/sBXfYxcLti0T4fpngkZP0g7KmZOmF5ogw/H9+It210
	 /nyURGG/uz8DnFk3lWLDG2ilbZ6hkQ8wtESBZETT3dkAk+dgaA+TgMrLhmHfRSu7j6xFv
	 e+N1YcYzTO9Wy3ZXm5ARc74j0nBVN5qmJUZZJNZ20TyBvZOI4KEzuvxLA+GR8+vgCMR1Y
	 HJe++B81xY5H+zk/mv+3GK7rGypoSGFShGuCOztk1NoJcU23E0sDBxD7cvtXB5BqX6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOWVwp7y;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F8606A31D
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B63F8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOWVwp7y
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so244382f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158337; x=1793763137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/z19Dyd36Kry4my+DL1hRK2Ik7rhLnBj6p5QTA/aWQg=;
        b=GOWVwp7yfQojsYBMOt1ToiDrLrBqZZ26mjcO66IJmMemadtvb+jcIFRZKadRhNCQp6
         d1uM1MZU7mmEXAKsg/cCD+BNVgrzt0JKma7NMmuWEA4LxACxfYjQDC5RKRGKM57B/76+
         zuXZnLL9LsJZT2o4tA8EjyIEOY//LBI39yJfK8WbLs1D89lqaAXpQBF6fJs8rPi+GN3W
         YqGoHxUcuPK01ZAG6JIvYqMmrOXxM2RUG8Ayh+Em9wD+/9h3MMAXjkqaYUaaGg+qB8yY
         E4FNmH9VZ0qlOJTHgnmBqo/C7wAEgx0k6SP0aJ+BEAXpCJS/m6gszoG5jA6cpAoRWbu6
         fOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158337; x=1793763137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/z19Dyd36Kry4my+DL1hRK2Ik7rhLnBj6p5QTA/aWQg=;
        b=GWynDohzL2mi1kW+RY7Wfalecu+Mx/EO3KTL4tX3wNa1nFFiAlWw7z6Z80M6F4ETa1
         ypfkrhhwGX/82CggCmM5XKKZQpDPtNkRAaslLhkQoT4XdCxGSXbZBifMG08cCW00BKMS
         UHMvEnbWLxwrvB5X19a7hbFZaJsxCanCQuC47H54ur9WMkmLh5i8R01YG7YTUE7a4yG/
         jCVAeVJrFyV19gk4m51d1A0xg07hgsfoTw81KNcTiPXHpOp+UAU0Y+fINblulU4usUVS
         aeYAi4Fc7Qhfl9JHY9dH6lbV4G5yWGQRJFp6iN4P4f8E3/FhbpeGsTWxcyJ9B2pcxZ7q
         IloA==
X-Forwarded-Encrypted: i=1; AKwUvBw6LIX82AJpCekolY/2u4GeMiycaY7kbJUpdrGtff/6SUkPCmyMGUvOUgUvEvUIOK4Y6wST1CKLpKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1lk53/jZCDRc25UDGHMEf198zLYqsUs3N2MyU908AsHmWcwh3
	NUErDASpjl5O9HLZeHmKW0XFfsdSUurs0XYzyPrZsLWC7dQIaA9T3f3c
X-Gm-Gg: AYBFou0Ilz7PoiJW5eugig68gTgF1YIKW8pigTyAK1WsxFPDev7l93FdfPibNakIV/u
	KfadbsqTh5csu1jBZgjGMMYas08dQccKcy/HatEAGRqOmuajbcbxkHNxg1v16QRiwTt6jjlVM5D
	kxkRYK0aFPoPpQ11nsCMCxv9zaXTzhsi4yLf8o8/tFlK48Fp9Gi6F1YD2xIUYOpSzVkHTd1FTIr
	GORH3HX5YTOCBTiGkJPf4MyIkfLqo5TTbTOiGSfJ4mTGMXcbuekApCZ/yUK20X6BdmglVuWtauD
	Mm6EQQ1/CDMk+3SjsPI41xPxkc7xVn5VAEkeMr6PCQXoDmR8zjxx0GQC5hpFPbCPuma7P1yiDhI
	I38eaXcDfWGB9jqyBE8C5iw5kBt1hFX36FTIXtLekg7FM7uAgq/EnQvMthQhYzUvSHp//AsXV1x
	nbzdJhsscuP0r/a0Jg7K+gA2GGuvg0noBcsPWIHQ6f2RnZIQwXQb5ntWeSNY+vonZKJ2Iw1DoFx
	vhYduoTgRZV75Hb8ox6dAw1FuGSDVbMBFAQiKhxJqPz39iF3psSdLk8/3SZTilHqUTyrbactVDK
	cSuB3l1zewVYbdSmQaMdLuEHnREtFY8BS8KXgoXdBX1emYrLKtr1tohj/IM73PNW5+iDzSj4/SB
	oGTI3Mo2NzX1ecZr7hVT8aMIEdlijO3rs3E7UY2f2DA8CBELvgO5pxSbd7MKeUW45ajUcErNtDA
	RWhscDY9mAxNL191gAIvmI/nboq1Zkw6oC
X-Received: by 2002:adf:e011:0:10b0:48c:4d32:ccf8 with SMTP id ffacd0b85a97d-48e5d58f11dmr2007171f8f.16.1793158337059;
        Tue, 27 Oct 2026 20:32:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:15 -0700 (PDT)
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
Subject: [RFC PATCH v2 12/13] Documentation: entry: Describe the pre-counted hardirq lifecycle
Date: Wed, 28 Oct 2026 04:31:26 +0100
Message-Id: <20261028033127.82193-13-kmehltretter@gmail.com>
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

The entry documentation covers only the traditional irq_enter_rcu()
path. It does not explain the early-counted entry contract or the retained
and synthetic hardirq exit phases.

Document the staged raw count and lockdep entry, delayed traceable
bookkeeping and rejected-add handling, hardirq accounting,
hardirq-to-softirq classification switch, retained real IRQ exit, possible
preemption and migration, and the classification-only return tail. Also
cover late worker closure, conditional raw teardown and context-tracking
order.

Record that arm64 excludes pseudo-NMIs from this lifecycle and identify its
external noinstr inlining prerequisites.

Assisted-by: LLM
---
 Documentation/core-api/entry.rst | 89 ++++++++++++++++++++++++++++----
 1 file changed, 79 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/entry.rst b/Documentation/core-api/entry.rst
index 09942135aad18..7153cc4120192 100644
--- a/Documentation/core-api/entry.rst
+++ b/Documentation/core-api/entry.rst
@@ -193,21 +193,14 @@ Note that the invocation of the actual interrupt handler is within a
 irq_enter_rcu() and irq_exit_rcu() pair.
 
 irq_enter_rcu() updates the preemption count which makes in_hardirq()
-return true, handles NOHZ tick state and interrupt time accounting. This
-means that up to the point where irq_enter_rcu() is invoked in_hardirq()
-returns false.
+return true, handles NOHZ tick state and interrupt time accounting. On this
+entry path, in_hardirq() therefore returns false until irq_enter_rcu() is
+invoked.
 
 irq_exit_rcu() handles interrupt time accounting, handles soft interrupts if
 possible, handles the NOHZ tick state and finally undoes the preemption count
 update.
 
-In theory, the preemption count could be updated in irqentry_enter(). In
-practice, deferring this update to irq_enter_rcu() allows the preemption-count
-code to be traced, while also maintaining symmetry with irq_exit_rcu() and
-irqentry_exit(), which are described in the next paragraph. The only downside
-is that the early entry code up to irq_enter_rcu() must be aware that the
-preemption count has not yet been updated with the HARDIRQ_OFFSET state.
-
 Note that soft interrupt handlers must run in BH context rather than in hard
 interrupt context. irq_exit_rcu() therefore replaces HARDIRQ_OFFSET with
 SOFTIRQ_OFFSET in the preemption count while it handles soft interrupts and
@@ -216,6 +209,82 @@ is still attributed to the interrupt. HARDIRQ_OFFSET is removed before
 irq_exit_rcu() returns because irqentry_exit() might schedule, which requires
 that HARDIRQ_OFFSET has been removed from the preemption count.
 
+Pre-counted hardirq lifecycle
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Architectures which need hardirq state before early context-tracking or
+tracing callbacks can use the pre-counted lifecycle. It applies only to an
+ordinary hard interrupt after the architecture has distinguished it from an
+NMI-like event:
+
+  * irqentry_hardirq_enter() attempts to add HARDIRQ_OFFSET with a raw update
+    and records whether the update was applied. It establishes IRQ-disabled
+    and lockdep hardirq state before instrumentable entry work. It then runs
+    the generic entry and context-tracking path, including any required
+    transition out of an RCU extended quiescent state.
+
+  * irq_enter_rcu_preempt_counted() later finishes the staged attempt. For an
+    applied update it performs traceable debug and latency bookkeeping. For a
+    rejected update it attempts deferred reporting and skips post-add
+    bookkeeping. It also performs the deferred timer repair, NOHZ tick
+    handling and interrupt accounting from irq_enter_rcu().
+
+  * irq_exit_rcu_preempt_counted_prepare() performs interrupt accounting,
+    softirq handling and NOHZ tick handling while carrying any applied
+    hardirq count across the traceable exit path. When an applied outer
+    hardirq invokes softirqs, both the preempt-count and lockdep
+    classifications temporarily switch from hardirq to softirq and back. The
+    architecture immediately follows the preparation with
+    irqentry_hardirq_exit_finish(), which performs the conditional raw-count
+    subtraction and lockdep teardown.
+
+The staged addition carries an opaque state into its instrumentable finish and
+matching teardown. With DEBUG_PREEMPT and no separate reschedule bits, an
+already-negative count follows the legacy DEBUG_LOCKS_WARN_ON() rule. During
+an oops the warning condition is bypassed and the addition is applied.
+Otherwise the attempt is rejected and leaves the count unchanged. Its finish
+attempts deferred reporting, which an intervening oops can suppress. A
+rejected token always skips post-add bookkeeping and the matching subtraction,
+independently of whether reporting produced a warning.
+
+The real interrupt is complete after that teardown. Return-to-kernel
+preemption can schedule and migrate the task before the architecture-specific
+tail runs, so the current preemption count cannot identify the original entry
+class. irqentry_state_t retains that provenance instead.
+
+For an ordinary hardirq returning to kernel mode,
+irqentry_hardirq_tail_enter() makes a fresh staged attempt to add
+HARDIRQ_OFFSET and establishes lockdep hardirq nesting after the preemption
+decision. This synthetic classification covers traceable architecture tail
+work, deferred timer rearming, IRQ-on preparation and context-tracking
+preparation. It does not repeat interrupt accounting, RCU or tick entry.
+IRQ-on preparation requires this synthetic lockdep nesting to remain present.
+An interrupted outer hardirq can contribute additional nesting.
+
+irqentry_hardirq_tail_exit() performs the final traceable teardown preparation
+and then conditionally removes any applied raw synthetic count. For an applied
+staged count at outermost hardirq depth, both retained exit points recheck
+regular softirq work and forced-thread timer work raised by late callbacks and
+wake the corresponding workers before ending hardirq state. If the interrupted
+context was in an RCU extended quiescent state,
+ct_irq_exit_prepare() runs before the raw tail teardown and
+ct_irq_exit_finish() completes the transition afterwards.
+
+On arm64 the ordinary lifecycle is selected only after the pseudo-NMI
+decision. Pseudo-NMIs continue to use irqentry_nmi_enter() and
+irqentry_nmi_exit(). All raw transitions are in noinstr paths, so
+preempt_count(), the raw preempt-count update helpers and
+__kern_my_cpu_offset() must remain inline. The arm64 conversion includes the
+first requirement and depends on the `arm64 raw preempt-count inlining
+prerequisite`_ and `arm64 per-CPU offset inlining prerequisite`_ for the
+others.
+
+.. _`arm64 raw preempt-count inlining prerequisite`:
+   https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
+
+.. _`arm64 per-CPU offset inlining prerequisite`:
+   https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
+
 Even though interrupt handlers are expected to run with local interrupts
 disabled, interrupt nesting is common from an entry/exit perspective. For
 example, softirq handling happens within an irqentry_{enter,exit}() block with
-- 
2.39.5 (Apple Git-154)


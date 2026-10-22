Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646270;
	b=HKr/m6edsMAWFjOicMXsE9M7wdNGaLkGCyRTy1VUV9vAZFhvDnijYzj52WhuGhs7HGXI
	 fCZSms9ZXsFy9H6niK/eA6d5TUE/ueQYghpqIWE1zUBpJEqb/nIZqXFV0DNgcP40f7B4u
	 6Te2U0Pr3HznvdYX5DBzxJV+S7hi5xL+SDgVFRvtiq7BBlm1hCJjkHtAS63gaFOSNo268
	 rffNmu224mUY/EBH1QHanNvJJVzqcxu257IS21Ce8SP4Vo/ZnhJBTOLarr8KoRSENqtoC
	 W09rpo8oZbuSUziA+r2PbjjvqjzVZS8lA+b70f6nIgqg7LulIqQxPhYC3PXjPnLXV7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B5VpfkiruZaKFMNAXJdCzQrQfGZBIQ5E4hTuwKkgO4o=;
	b=C0ZUn7yIrnIlNbof79a6GoCroWojJ2FWsJWldIcfDyUzXTHOdslwUrKAUca50ZSQo2Pd
	 Gi2EW39d5W93yE4MadYETR9RbmgZ/py1JKzYL+JAgRvyX2wD0IDytZkpi4U8mx3OObVSO
	 VjMC6rworKB2Y2IqalVVFPdEH+SFeYy51SdgvQ8ysoC11aEj3LXXPgGklOL/vRCvJ2rFG
	 mx54Rl3XY7CfVUBSAjlF6xr0Sf+qsUM01z7S3jaVq0wZJ9JykZ0b5Xgu5KJGJED7xl7Ri
	 ogdn6yCyvTPMIAIfiBujX+YbkdIlhArCmld8obqjiqQcIMXJpMXmCNA7nbT9tonUfmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cmte5wBN;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF65606A31F
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF65606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cmte5wBN
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso15956945e9.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 22:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646268; x=1793251068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5VpfkiruZaKFMNAXJdCzQrQfGZBIQ5E4hTuwKkgO4o=;
        b=Cmte5wBNCckqMd6qKr5FyeqRx8p3GFkXzZH/uR1IB+wn3VGZ0tTKAYiOfsB+sK03gN
         oUs5f+mT2qtVGuGdmGoWh5NJgFNYNrwn7N36NeyX14ikJDjBdpnOWudAZCVMJAEEbh0k
         k/b9m+AAWj1SN644A0H14mD5nhJIlObyoiRW7vMZ9W37CkBgvDk2uIfQONd5K+/pgz9V
         yT1BOeh95JVZkRviBtUN37tH+g8yvQZ7W1VqbjVN0xHb2KPtpmfoCtB7Hrb7rucQk0LT
         yb6N3g3enIqrL6iqGoLeBhZrkBL7NMEoqT1uRbfoQXXT1EiZI4dIZy8M+MR52VgfCbCm
         fmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646268; x=1793251068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5VpfkiruZaKFMNAXJdCzQrQfGZBIQ5E4hTuwKkgO4o=;
        b=JT6PTbsU/Ec3SQ49MMmArZONbWOKg1tc8jyTB0ecbs/YxngfjkaLRDfddd5z2lmB3I
         s2LJEC9JR1tcanNzoOpGMtDp4EkJCd5z69XhmHKDuyrKmV0w8QHZwYoe/TFjBDQMef7/
         +KdL3/HH+eQxZYFhSUMSjd97S4rlFwnSGUoB9YhRq+kRJgFaD7wBEEVsvUdZAdrzXpYK
         rus8TB+9kWHy9ib+mfFQrQob6rJibZxDFMt/6vziLiyC2C7DbqJfdtfrOSQYwOH3HfFv
         vMTiX1j4+igu5gBk5XO9mciePTrCnlWw+8z29/nPn7zJlkEDGFcpQV5AQEqCpv2PhhhB
         fGGQ==
X-Forwarded-Encrypted: i=1; AKwUvByMNks4yuma18fe83GCrEd2yQ92fUD/26G3H4Ml4BHXPuCwLJz8wGfZqxZBVtBNJcbskGUqxJD6PIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI67po326VENOJLDnh6hFg5R35h7vInMMC9H7qmCxbbiD4gaR8b
	W31cjeOKxKyoQ2i04bqRnh3ntdxWQUp5f55VChsDgUlYBHJvzI42r9qA
X-Gm-Gg: AYBFou1Fga7AMBfKbCm7PVAPC+uK1NPbdMOEUSAc1fAI68dHSObB/waZsXKgNyk8l3d
	9TjxPOOV0DyIMikMVxm2hu9hAxVekHElNEcNVpFPe7Y/9NWwcl2Xw2KxwvGGpPoR8HR7HaaRQZo
	S6FtI+JPP8avIYlmWkz7TgkCKHUA4ZCjDKyLcHA6hUdLO9OoPIyLR8VGFls8eh7lqy/jROm1YyE
	k5IDIVKwTwrOUiGtjNzsqsSBCnOdVpZkZodGHkLiRVUz5IaWS8tVumgWHrnoY8yrh727vB57sLj
	oDHE/gaUm+t8HV4CMLngGUVKJ/FDsJKivgqpkL9ZkGb1WSbjCCRIl0kN4tycNfraWIOkA7rFkK9
	Zm4HV29MNtEN45XY5TJviopFN5KCODXH01rSmH0OcHKDv068wSb8o6Ep36X9s6AOnVhQORrXBJ+
	Q6anOHRZFHDvZxnuSOBv44aq8SUyGS7Iy4X/p/v33L6gwcxfSd+HAcgKfTa4xG0LayusLeQBMXk
	SjVKVln90qjDncejv68kTbd383jfjfEaw0rsImpP5c7SOLAXvBoksB0eaHhIDj1+GDbacM2AnDY
	9wVuC+SCNefk/VKTEKM18w9jdsIe1eZ5ndULJcun8FQfda3JXYFzi+B/FLw3dwwzpc2cnoHL693
	2htdYAZ753BJqf/3nHSofqu8GQUBbtFHtIU+ZGKOTD1IMisphWpJ2ggO+R8k=
X-Received: by 2002:a05:600c:34c9:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4a1fdd09bebmr74736715e9.26.1792646268101;
        Wed, 21 Oct 2026 22:17:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:47 -0700 (PDT)
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
Subject: [RFC PATCH 10/12] docs: entry: Describe the pre-counted hardirq lifecycle
Date: Thu, 22 Oct 2026 07:16:52 +0200
Message-Id: <20261022051654.79224-11-kmehltretter@gmail.com>
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

The entry documentation covers only the traditional irq_enter_rcu()
path. It does not explain the early-counted entry contract or the retained
and synthetic hardirq exit phases.

Document the raw count and lockdep entry, delayed traceable bookkeeping,
hardirq accounting, hardirq-to-softirq count swap, retained real IRQ exit,
possible preemption and migration, and the classification-only return tail.
Also cover late worker closure, raw teardown and context-tracking order.

Record that arm64 excludes pseudo-NMIs from this lifecycle and identify its
external noinstr inlining prerequisites.

Assisted-by: LLM
---
 Documentation/core-api/entry.rst | 75 +++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/entry.rst b/Documentation/core-api/entry.rst
index 09942135aad18..e02c463dcb08f 100644
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
@@ -216,6 +209,68 @@ is still attributed to the interrupt. HARDIRQ_OFFSET is removed before
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
+  * irqentry_hardirq_enter() adds HARDIRQ_OFFSET with a raw update and
+    establishes IRQ-disabled and lockdep hardirq state before instrumentable
+    entry work. It then runs the generic entry and context-tracking path,
+    including any required transition out of an RCU extended quiescent state.
+
+  * irq_enter_rcu_preempt_counted() later performs the traceable debug and
+    latency bookkeeping for that raw update. It also performs the deferred
+    timer repair, NOHZ tick handling and interrupt accounting from
+    irq_enter_rcu().
+
+  * irq_exit_rcu_preempt_counted_prepare() performs interrupt accounting,
+    softirq handling and NOHZ tick handling while retaining the hardirq count
+    and lockdep nesting through every traceable exit callback. Softirq
+    handling uses the same temporary HARDIRQ_OFFSET to SOFTIRQ_OFFSET and back
+    transition described above. The architecture immediately follows the
+    preparation with irqentry_hardirq_exit_finish(), which applies the raw
+    count and lockdep teardown.
+
+The real interrupt is complete after that teardown. Return-to-kernel
+preemption can schedule and migrate the task before the architecture-specific
+tail runs, so the current preemption count cannot identify the original entry
+class. irqentry_state_t retains that provenance instead.
+
+For an ordinary hardirq returning to kernel mode,
+irqentry_hardirq_tail_enter() restores only HARDIRQ_OFFSET and lockdep hardirq
+nesting after the preemption decision. This synthetic classification covers
+traceable architecture tail work, deferred timer rearming, IRQ-on preparation
+and context-tracking preparation. It does not repeat interrupt accounting,
+RCU or tick entry. IRQ-on preparation accepts exactly this one synthetic
+lockdep nesting level.
+
+irqentry_hardirq_tail_exit() performs the final traceable teardown preparation
+and then removes the raw synthetic state. Both retained exit points recheck
+regular softirq work and forced-thread timer work raised by late callbacks and
+wake the corresponding workers before dropping hardirq state. If the
+interrupted context was in an RCU extended quiescent state,
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


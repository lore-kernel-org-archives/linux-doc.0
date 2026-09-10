Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC573B0AEA
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059669; cv=none; b=Jo51Rvlcuzs8ztyvY6ndWBkTYXnP0R5x0qQZITZ3jgZk9NmxXUf+ehT6sfrU+o5Ba4VLPNiuap5XApxJQs8Gnl8optN2mjY4fIRTfQYrRvqRE/VaZ5Ew08yhT7DG3dSKkBbyAgXsI4uJprrGz1S3pn85p20tXEEgR/zXFkDunz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059669; c=relaxed/simple;
	bh=VgnchaCc2vX6JqnZYdkH5HmBZPbqNielW9yPIGJDnOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScA+IRSsbYEZmg6rCWylEo5JxH6ccXaPzRst2QEtzsp1AqgcZ9ioNNMFh50EGjaoduGKLkzTZ1bexQkRI72i5PV/kGjBt1KcvAMnYdHOtF0klO7A28KylHd+CAWqEyuHQB/vkpNqjWsdO6L8bscoW+/jo1kzazeetMp+iGidcoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJmg5zpq; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJmg5zpq"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so1351183a91.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 10:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059657; x=1789664457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1R78kwUbbRM80m6M3DLzus90cypEj7C20j5fyE9J8w=;
        b=KJmg5zpqq3q/4Kluxx45d6F/mVlBpzfe/HankEVPYtvPqqrMFODx8DzRH209RCmMvA
         lLma8U1xI/xmfjNwWJnhmk/X6bkhGYvvVZsU+xmyXiEI+Ax/XwCJUSMeeOS/f/+QW1rq
         gG/XscmTTQZxVwtSFakyq+mLMs2ZQ9kVRvex/RI1aMe6da9nrvYNafMP5fsi9vxj0+V+
         gNUr6qzaa77yX/0AdL8vdKbQMGW5Q1fl+xHOhvUfeQVjxIsyI3rvXBRWLFLJV+NVBU5S
         CqFzW7U22FoGgEVTlNEwG8B8DrcKBp9pMRFvuCzRn8IfR2JqNrC295RO5wpPttfgtO/u
         eb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059657; x=1789664457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1R78kwUbbRM80m6M3DLzus90cypEj7C20j5fyE9J8w=;
        b=gMMskcpiIDsS8WpaDpGR+Ozgvbnk6EHZdBLP0URsRSYL6rB+mZtqU0ufCCJ57tawUB
         gWnyY4YI2fsley2+KAcVcfIye0iL24EE/VBRNHSXFVU0Pb6RcB8VOlQs/t+Qj6/JYEEA
         Jh2jeolEbMnm/FPOo+lImVh9uM3Z1t+XW7mZnKj0rt2LjYspFTmZFpqXSZPj5GesZaC5
         rFKRIWx4gkBgd09NZ5y9iw3IvBlfA+tpya+zprLj6g/KP83p+aX1hvZKD07p8+nvMThg
         LZEIOFz5rukHfUZs+WJZdnqqP2QBZbs64FyYgDOcXBrl0vTRZbuMtWJLcBZggwgjqqoN
         AINw==
X-Forwarded-Encrypted: i=1; AKwUvBzOtC251yRYwJoWblrjTXzW3ZFgtgaKUUBbbtmk/mkKqRo31yfRfHwolCwXux+6EWAkY7vcjaoYKQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++nyJAf4QA0Lv3VddANeD4P4cyu0UIoxPr9B78c4otIbCv4C97l2
	t+gTbOuWfAY5NO2Wl0+bFQ/yn6MaWUZ1Tm7j5RXWsVQw40+B8sDpF4Kt
X-Gm-Gg: AYBFou1Ytea7zK8EdRwWzeSUjLpOMJNttfx5MTRea5FN9xn9NequdCwB+dFz3+rbBq5
	uvpz35yBLRHy8rzQSFE8m8BXtkxUm2YYU+1B0f0nrQLDdjtFJq0s7us+qVm5Hll29vFkQDKJA+P
	Jne211H+6ohtl8C9BtTn9S9+wToGszpRLc9iyqDY3EgVlY3+VUcMEOV+GGN06onPMdRLhR1BZgN
	VcTRyfBYJm7u9lDsIXjCopAvl0xKh5869qGw8HKs511/fIK+5vQslimJiP0cwt0YxK5KBYxvBxx
	b5r8dRmH+6Y9MI4efbGEjUhYz5XG0OfG8gMrJ96UtMqmXsIkEfud4I8pVmMU0nRF+Ars7PmyDtR
	AcqtkheGiqvYwYU5wTpOVoMYamm0j1BpN67OD5D9ygJAPhqod5pNaIY5Ysj24FAL11t7cZK+F4J
	steBXpf+H1Y8X9mTymy/0IyVjwqH7CHMhQGGv4Ls7cIBvolhLKc9tOw1aavmdLerku8YKo//ien
	uO0Vea/uYGbpNYOyt0sEfK3PWz7uPxFmCtYUZ/h6QWz7iFLgI4GBPnl/vQmkg+5fSSxEve/Ge41
	TttR+0vP3ervgAYsCQMha0JSq3IAGGJEAZhxKuJAt/duMRE5awwglwHDkFbx9jc=
X-Received: by 2002:a17:90b:1c02:b0:398:9bd3:d6d6 with SMTP id 98e67ed59e1d1-39d98140f92mr240590a91.16.1789059656557;
        Thu, 10 Sep 2026 10:00:56 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94744dfdsm568538a91.0.2026.09.10.10.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:00:54 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: paulmck@kernel.org,
	urezki@gmail.com,
	harry@kernel.org
Cc: frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	boqun@kernel.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	surenb@google.com,
	vbabka@kernel.org,
	rcu@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] rcu: make userspace barrier hook drain kvfree_rcu work
Date: Fri, 11 Sep 2026 01:00:40 +0800
Message-ID: <20260910170040.344864-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910170040.344864-1-matthias.goergens@gmail.com>
References: <20260910101112.1648978-1-matthias.goergens@gmail.com>
 <20260910170040.344864-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The bcachefs ktest allocation-leak check writes rcutree.do_rcu_barrier
before reading /proc/allocinfo. While testing bcachefs performance
changes, small objects released with kfree_rcu() remained visible after
repeated writes to the hook and 20 seconds of waiting, causing otherwise
clean tests to fail their leak check.

The test assumes a stronger contract than the hook currently documents:
rcu_barrier() waits for ordinary callbacks, but does not flush objects
still held in kfree_rcu() batching or per-CPU SLUB sheaves. The retained
population eventually fell as a sheaf filled; there is no evidence here
of unbounded growth or OOM.

Changing the hook to drain kvfree_rcu() work let the same unmodified
bcachefs workload pass its allocation check. All eight checkpoints in
one VM, after 50 through 400 option changes, reported zero retained
reconcile_scan objects. This motivated the separate private-cache
reproducer used to isolate the incomplete drain from bcachefs.

Calling kvfree_rcu_barrier() from rcu_barrier_throttled() was proposed
when the former API was added in 2024, to restore a clean baseline
between userspace benchmark runs. The discussion concluded that keeping
the existing hook name, adding the second operation and documenting both
was the safest compatibility choice, but the follow-up was not added.

Add that drain and document the stronger test interface. Keep the
explicit rcu_barrier() so the hook's ordinary-callback contract does not
depend on kvfree_rcu_barrier() reaching an ordinary barrier internally.

Do not reuse the ordinary rcu_barrier() sequence as an early-completion
check while throttling: an unrelated ordinary barrier does not establish
that kvfree_rcu() work was drained. Retain the existing start-rate limit.

Four fresh VM pairs with the full private-cache fixture retained the
queued object without the patch (60 to 60 active objects) and drained it
with the patch (60 to 59). A separate ordinary-callback regression test
passed on both kernels.

Link: https://lore.kernel.org/all/20240820155935.1167988-1-urezki@gmail.com/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  7 ++---
 kernel/rcu/tree.c                             | 27 ++++++++++++-------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..244a53166249 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5699,9 +5699,10 @@ Kernel parameters
 			there is an ongoing too-long CSD-lock wait.
 
 	rcutree.do_rcu_barrier=	[KNL]
-			Request a call to rcu_barrier().  This is
-			throttled so that userspace tests can safely
-			hammer on the sysfs variable if they so choose.
+			Request that deferred kfree_rcu() objects and
+			ordinary call_rcu() callbacks be drained.  This is
+			throttled so that userspace tests can safely hammer
+			on the sysfs variable if they so choose.
 			If triggered before the RCU grace-period machinery
 			is fully active, this will error out with EAGAIN.
 
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 96848fc1f02b..014e28ec3bd3 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -3989,12 +3989,12 @@ EXPORT_SYMBOL_GPL(rcu_barrier);
 static unsigned long rcu_barrier_last_throttle;
 
 /**
- * rcu_barrier_throttled - Do rcu_barrier(), but limit to one per second
+ * rcu_barrier_throttled - Drain deferred RCU frees, but rate-limit starts
  *
- * This can be thought of as guard rails around rcu_barrier() that
- * permits unrestricted userspace use, at least assuming the hardware's
- * try_cmpxchg() is robust.  There will be at most one call per second to
- * rcu_barrier() system-wide from use of this function, which means that
+ * This can be thought of as guard rails around the deferred-free barriers
+ * that permit unrestricted userspace use, at least assuming the hardware's
+ * try_cmpxchg() is robust.  There will be at most one drain operation started
+ * per sixteenth of a second from use of this function, which means that
  * callers might needlessly wait a second or three.
  *
  * This is intended for use by test suites to avoid OOM by flushing RCU
@@ -4011,18 +4011,25 @@ static void rcu_barrier_throttled(void)
 {
 	unsigned long j = jiffies;
 	unsigned long old = READ_ONCE(rcu_barrier_last_throttle);
-	unsigned long s = rcu_seq_snap(&rcu_state.barrier_sequence);
 
 	while (time_in_range(j, old, old + HZ / 16) ||
 	       !try_cmpxchg(&rcu_barrier_last_throttle, &old, j)) {
 		schedule_timeout_idle(HZ / 16);
-		if (rcu_seq_done(&rcu_state.barrier_sequence, s)) {
-			smp_mb(); /* caller's subsequent code after above check. */
-			return;
-		}
 		j = jiffies;
 		old = READ_ONCE(rcu_barrier_last_throttle);
 	}
+	/*
+	 * kfree_rcu() can retain objects outside the ordinary callback lists in
+	 * per-CPU SLUB sheaves and kvfree_rcu batches.  Test suites use this hook
+	 * to prevent deferred frees from spilling into the following test, so
+	 * drain those queues as well as ordinary call_rcu() callbacks.
+	 *
+	 * kvfree_rcu_barrier() currently includes an ordinary barrier, but that
+	 * is not part of its documented API.  Keep the explicit rcu_barrier() so
+	 * this hook's original contract does not depend on slab implementation
+	 * details.
+	 */
+	kvfree_rcu_barrier();
 	rcu_barrier();
 }
 
-- 
2.55.0


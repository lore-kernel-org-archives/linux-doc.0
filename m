Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A8438F62F
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 22:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778970892; cv=none; b=Q1d2zAXUIWMvY5aO6P36DEVQ5dp89qTKaiDqNpN08Jt9ZZU9sX4b1tbWRWYhiq2BUsKuJnVqr+Y47FXOpwvHO2JFVoFC9UlkEc3J355Wn86pgnXbgygyRUpS04bpd+gpeA7Q1NNBRsrWOmYzNZBVycOBzQKa3GprU2G4YcmulUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778970892; c=relaxed/simple;
	bh=9qCyQuXla6OX/PfPv/Mgm7xBHK14vZ4tbPQnAPQWEbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBObaqwPgi+Gplc57JLLKzWoHktqE2hifY8ewPOrQa9JkJ2LYt8heHz6TGRdAugA4Rfb53mNFjI4dQjl1mhivUo0Stqv8DwGJU4ugxI3hXveZFybSeyAKWhudkNL3AY8AS8Klo1cuTCE3BeSglHWCG2jx+rjYx0MYVEyxuaUZ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7+H8xfX; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7+H8xfX"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-7bde9d73678so5542077b3.0
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 15:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778970889; x=1779575689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV43Lg6ZeBSxT2gi43CrNOJZdZ5c40FejoI6Xqvs4d0=;
        b=H7+H8xfX3gngHHYpwOlzZEuLXIJJ7rPG9QArrHHWqmjpIvlgKvT1Tx1bn2OkYck6is
         Hg2yrLyFey9YH9fQKM2nz1+Sqf5IiK3A1hk8Fld1ikUjlyyPmpx/XeAwymhOPtMBOMYR
         XG//ArTfL6RVQtUIF1S0jLB+Mv0gEOjUGfomC/QWEMUyHhY2V7YzOqvfFZI2nB2ryVrE
         Q6OO8033tBONtf8OW/1ExFCUnosh6Ck6HBgNzp5V0FJ2PZArGFAwqu3Xtkm2zAbKRgT3
         4141ltHo58mhgoYKrgdJxu1+SP9ducX/lJpiEeKzj543Dflhrd+eHiXciuOoKFk1Nw6w
         d7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778970889; x=1779575689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wV43Lg6ZeBSxT2gi43CrNOJZdZ5c40FejoI6Xqvs4d0=;
        b=lFSkO/BgmPwqQnppqjmUn6nllxegJ1uaWj0sjWhKMsuPyujEtnrqQUNVaIUVTeU5gK
         l+MUvLc8PwlUDM55+VVpbX5MVUAiRajoKSszUQFfYHlNPErnLO/yI1eNID4SuqibBYvH
         mRkPWiCv2Z4YXn/yMlLPvQEqDAS04NWQV8nqXFKrdLU/a8/ghAFD+IbllTyPGei2lPg2
         JLwYJ8sGBax7cl0zm94OMyjQ0a5o9cNGLHBVBi29BRTqeZzf3Bw7tQwNaolVc5GvJaQq
         s11xJrewpd3vc4P1sNgDKP/0k2VX3uwCMMg0PWlyclWWnNxX64GUb4rGIU2a/VHCwHSJ
         OqWw==
X-Forwarded-Encrypted: i=1; AFNElJ+E8I3nVeCGwyTG5ZoH+xI2XP4PYp4v3WeVRFQYbT05MWTHmDZQr0kjsGrRMHNn6hLBIM9JcRftais=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhCrYi0ypiOrUfaBQrpqBObvFVxUzfZOPFTXQPVfGS8OVeAJZp
	jC7UwIvcA44UdL/7pPN8IR9jXCD/u1vNjwSCbcY21fugnQkQcWR4HhQ=
X-Gm-Gg: Acq92OH9W7hL2SXVTUcx5RF3tP/aDjNrV7uMH7/WkfsTZBZlctZrsPHnzeolNE9W58T
	jry9AI80qjaGql7103Ck88pqR5cc0di77z17qMc7LKt08ZsKWoI5HVfnS9C4cNfW8wPLO5Y1YM8
	YWqiTFbxuknarV+8tR8/dLbviBRnxNxb9GmnjSkvt9HKz58maVw5zU5jWq5ShyRByi2UZpIheku
	kPqlzPFjVKs+YyPtSLR0j3ZyqcPANgZvlnW4bJQONXnn4jt+KP8iqxN010a5h+KRNC0sKqJ50m/
	cemnpue4aICaKz5EMr9Ad4GlNRJgadgaLDlGpd2a3sFn+mqZk0tyXc4taYvgqBZPfVgcLeJYjnp
	eHWreFe9OtiSH8BN/wVQXQQ3gJc1MpsIM+2vRh8qOv9XEj+XLglTnziV8eLpqzK46gU29hmKFsH
	TdJVK/imA06RvShqFda1Pu5uAh8ZbLAlgqtC97ANi1qTctJtoU2mvL0Szz1pZRtTSA5W57sMBWz
	C0oDZDW7yT7
X-Received: by 2002:a05:690c:e04e:b0:7c2:fa53:6d7f with SMTP id 00721157ae682-7c9463a2449mr68267967b3.3.1778970888966;
        Sat, 16 May 2026 15:34:48 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9c6cd4f5sm666137b3.35.2026.05.16.15.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:34:48 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com,
	bharata@amd.com
Subject: [RFC PATCH 3/7] mm/damon/core: replace mutex-protected report buffer with per-CPU lockless ring
Date: Sat, 16 May 2026 15:34:28 -0700
Message-ID: <20260516223439.4033-4-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516223439.4033-1-ravis.opensrc@gmail.com>
References: <20260516223439.4033-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the mutex-protected fixed-size array (DAMON_ACCESS_REPORTS_CAP=1000)
with a per-CPU lockless ring buffer.  This enables damon_report_access()
to be called from NMI context.

Ring design:
- Producer is serialized per CPU: only one in-flight producer per CPU
  is allowed.  A per-CPU damon_report_ring_busy counter detects
  NMI-on-process nesting and drops the nested attempt, preserving the
  single-writer invariant on the slot.
- head is advanced by the producer with smp_wmb() before publish.
- tail is advanced by the consumer (kdamond) after the entries[] reads.
- Overflow: sample silently dropped.  NMI context is allocation-free
  and access reports are best-effort.

To keep the producer/consumer pattern scalable on systems with many
CPUs and a high NMI rate, the ring layout follows three rules:

- head, tail and entries[] live on separate cache lines via
  ____cacheline_aligned_in_smp, so producer and consumer do not
  invalidate each other's working set on every advance.
- DAMON_REPORT_RING_SIZE is bounded so the per-CPU footprint stays
  small (256 entries x sizeof(struct damon_access_report) plus head
  and tail cache lines), keeping draining all rings during one
  kdamond tick from evicting unrelated data on contemporary server
  parts.
- A cpumask, damon_rings_pending, is set by the producer after
  publishing and cleared by the consumer per ring drained, so the
  consumer iterates only CPUs with pending entries instead of
  walking every online CPU.  An smp_mb__before_atomic() between the
  head publish and the cpumask_set_cpu() ensures observers of the
  pending bit also observe the published head; without it, weakly-
  ordered architectures could let the consumer drain stale head and
  delay the report.  The consumer pairs this with an
  smp_mb__after_atomic() between cpumask_clear_cpu() and reading
  head, so a producer that publishes between the consumer's clear
  and head-read is observed via the bit it re-sets rather than
  silently stranded.

Consumer (kdamond_check_reported_accesses) drains the rings of CPUs
in damon_rings_pending, applying reports to targets.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 143 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 101 insertions(+), 42 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index b605d36b29b1a..9ed789e932ebd 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -25,7 +25,26 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/damon.h>
 
-#define DAMON_ACCESS_REPORTS_CAP 1000
+/* Sized so the per-CPU ring set fits in L3 on typical multi-socket boxes. */
+#define DAMON_REPORT_RING_SIZE	256
+#define DAMON_REPORT_RING_MASK	(DAMON_REPORT_RING_SIZE - 1)
+
+struct damon_report_ring {
+	unsigned int head;	/* written by producer (NMI) */
+	unsigned int tail	/* written by consumer (kdamond) */
+		____cacheline_aligned_in_smp;
+	struct damon_access_report entries[DAMON_REPORT_RING_SIZE]
+		____cacheline_aligned_in_smp;
+};
+
+static DEFINE_PER_CPU(struct damon_report_ring, damon_report_rings);
+static DEFINE_PER_CPU(int, damon_report_ring_busy);
+/*
+ * Per-CPU bitmap: producer (NMI) sets after publishing a report;
+ * consumer (kdamond) clears before draining the corresponding ring.
+ * Hot-write under sampling load - do NOT mark __read_mostly.
+ */
+static cpumask_t damon_rings_pending;
 
 static DEFINE_MUTEX(damon_lock);
 static int nr_running_ctxs;
@@ -36,10 +55,6 @@ static struct damon_operations damon_registered_ops[NR_DAMON_OPS];
 
 static struct kmem_cache *damon_region_cache __ro_after_init;
 
-static DEFINE_MUTEX(damon_access_reports_lock);
-static struct damon_access_report damon_access_reports[
-	DAMON_ACCESS_REPORTS_CAP];
-static int damon_access_reports_len;
 
 /* Should be called under damon_ops_lock with id smaller than NR_DAMON_OPS */
 static bool __damon_is_registered_ops(enum damon_ops_id id)
@@ -2127,33 +2142,56 @@ int damos_walk(struct damon_ctx *ctx, struct damos_walk_control *control)
 }
 
 /**
- * damon_report_access() - Report identified access events to DAMON.
- * @report:	The reporting access information.
+ * damon_report_access() - Report a hardware-observed memory access.
+ * @report:	pointer to a filled damon_access_report struct.
  *
- * Report access events to DAMON.
- *
- * Context: May sleep.
- *
- * NOTE: we may be able to implement this as a lockless queue, and allow any
- * context.  As the overhead is unknown, and region-based DAMON logics would
- * guarantee the reports would be not made that frequently, let's start with
- * this simple implementation.
+ * Context: NMI-safe.  No sleeping, no allocation, no locks.
  */
 void damon_report_access(struct damon_access_report *report)
 {
-	struct damon_access_report *dst;
+	struct damon_report_ring *ring;
+	unsigned int head, next;
 
-	/* silently fail for races */
-	if (!mutex_trylock(&damon_access_reports_lock))
-		return;
-	dst = &damon_access_reports[damon_access_reports_len++];
-	/* just drop all existing reports in favor of simplicity. */
-	if (damon_access_reports_len == DAMON_ACCESS_REPORTS_CAP)
-		damon_access_reports_len = 0;
-	*dst = *report;
-	dst->report_jiffies = jiffies;
-	mutex_unlock(&damon_access_reports_lock);
+	/* Pin to a CPU so the SPSC invariant holds for preemptible callers. */
+	preempt_disable();
+	/*
+	 * NMI nesting on the same CPU as a process-context producer would
+	 * stomp the same entries[head] slot.  Detect and drop instead.
+	 */
+	if (this_cpu_inc_return(damon_report_ring_busy) != 1) {
+		/* NMI nested on a process-context producer; drop. */
+		goto out;
+	}
+
+	ring = this_cpu_ptr(&damon_report_rings);
+	head = ring->head;
+	next = (head + 1) & DAMON_REPORT_RING_MASK;
+
+	if (next == READ_ONCE(ring->tail)) {
+		/* Ring full; consumer is behind, drop the report. */
+		goto out;
+	}
+
+	ring->entries[head] = *report;
+	ring->entries[head].report_jiffies = jiffies;
+	smp_wmb(); /* ensure entry visible before head advance */
+	WRITE_ONCE(ring->head, next);
+	/*
+	 * Order the head advance before publishing the pending bit
+	 * so that the consumer, on observing the bit, is also
+	 * guaranteed to observe the new head.  set_bit/cpumask_set_cpu
+	 * are documented as unordered RMW (atomic_bitops.txt), hence
+	 * the explicit barrier; without it, a weakly-ordered arch
+	 * could let the consumer drain stale head, clear the bit, and
+	 * delay the report until the next producer sets the bit again.
+	 */
+	smp_mb__before_atomic();
+	cpumask_set_cpu(smp_processor_id(), &damon_rings_pending);
+out:
+	this_cpu_dec(damon_report_ring_busy);
+	preempt_enable();
 }
+EXPORT_SYMBOL_GPL(damon_report_access);
 
 #ifdef CONFIG_MMU
 void damon_report_page_fault(struct vm_fault *vmf, bool huge_pmd)
@@ -3814,26 +3852,47 @@ static unsigned int kdamond_apply_zero_access_report(struct damon_ctx *ctx)
 
 static unsigned int kdamond_check_reported_accesses(struct damon_ctx *ctx)
 {
-	int i;
-	struct damon_access_report *report;
+	int cpu;
 	struct damon_target *t;
 
-	/* currently damon_access_report supports only physical address */
-	if (damon_target_has_pid(ctx))
-		return 0;
+	for_each_cpu(cpu, &damon_rings_pending) {
+		struct damon_report_ring *ring =
+			per_cpu_ptr(&damon_report_rings, cpu);
+		unsigned int head, tail;
 
-	mutex_lock(&damon_access_reports_lock);
-	for (i = 0; i < damon_access_reports_len; i++) {
-		report = &damon_access_reports[i];
-		if (time_before(report->report_jiffies,
-					jiffies -
-					usecs_to_jiffies(
-						ctx->attrs.sample_interval)))
-			continue;
-		damon_for_each_target(t, ctx)
-			kdamond_apply_access_report(report, t, ctx);
+		cpumask_clear_cpu(cpu, &damon_rings_pending);
+		/*
+		 * Pair with the producer's smp_mb__before_atomic() between
+		 * the head publish and cpumask_set_cpu(): order the bit
+		 * clear before the head read so that a producer publishing
+		 * between our clear and our READ_ONCE(head) is observed via
+		 * the bit it re-sets, not lost as a stale-head drain.
+		 */
+		smp_mb__after_atomic();
+		head = READ_ONCE(ring->head);
+		/*
+		 * Pair with smp_wmb in damon_report_access(): the entry
+		 * data published before the producer advanced head must be
+		 * visible to the entries[] reads inside the loop below.
+		 */
+		smp_rmb();
+		tail = ring->tail;
+
+		while (tail != head) {
+			struct damon_access_report *report =
+				&ring->entries[tail];
+
+			if (!time_before(report->report_jiffies,
+					jiffies - usecs_to_jiffies(
+						ctx->attrs.sample_interval))) {
+				damon_for_each_target(t, ctx)
+					kdamond_apply_access_report(
+							report, t, ctx);
+			}
+			tail = (tail + 1) & DAMON_REPORT_RING_MASK;
+		}
+		WRITE_ONCE(ring->tail, tail);
 	}
-	mutex_unlock(&damon_access_reports_lock);
 	/* For nr_accesses_bp, absence of access should also be reported. */
 	return kdamond_apply_zero_access_report(ctx);
 }
-- 
2.43.0


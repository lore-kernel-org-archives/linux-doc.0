Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF038D3E0
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 22:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778970896; cv=none; b=go9Ah8AsCE+8BOBk+g6x/joX+2rGE3x+MXejM2JagLu6j1g4l8UsGRB9kVsoG2w9C+1Ll97BQdwXtEtQtZMhJd2KOzoXWn5n4M2c3CQFyQu0NoJjNiSI6MbQUvZg5dDWfCaT8zRZ6wssvsZJ8fkgG0fSX+tCJf07UqzVK8dOx4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778970896; c=relaxed/simple;
	bh=U7geW279ChrFXLde61M58WBHBu8SgrbFDoM4Qrvb2q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TxoTfKWGId8QqAwYacxpCvCr3lpU04wG2gF2sHPqFOYaa1HXhcswB0OwHvC0Gza3gUw/SOCNq0/8Al7ALC1xVYi8HyPWsv8Jmox7D73rGFFMjsv2NUTHwGY+ycv9QUa/SmzR1r4K6NbgpfFnvgBFrDs1hC1BkuRoPs6SdNEQoC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPpifN/T; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPpifN/T"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-7bdf83185bbso5223187b3.2
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 15:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778970891; x=1779575691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8+0GSDgF6eaqM7aU4GbWIS0I2DgBkn1ubqIjVsKT2c=;
        b=lPpifN/Tkjcp2aNLTwX73temMbpxnWT9XLa4qrnPaVGusB3H2cUwWr/nHFykruhaFz
         5NGx77LgoZJfETZKg1I0WCblxSSzTXtu2wDYijFQ/1PVTrJSbLjscGpHHtPqvWTKtSyT
         rWYW0dr0qu+x25ZhUuhJe0wgiBPHrpRW2W6sP6p5xdYK24Wpjy0EkUnv/03Kbh5avvvZ
         X95F0LvRIW6OJIwUFdg3PkZAU1tyBFvtqaojUvgo7LAvwAkolT3Mjqtsu/JZXb/ZBPvd
         vcR3z+fAtT4ZHWGvwhIoQyoLpvmren32NNvr3EcxuD6a9Ry+EDGfudLDn7szEzcrf4d+
         PEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778970891; x=1779575691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8+0GSDgF6eaqM7aU4GbWIS0I2DgBkn1ubqIjVsKT2c=;
        b=LQ26YV0xcNZ6CkU5EjDpvKRzCVLMeUF9pL10GEcxQijCZO8MDKtqMZ7bLYQFJCu3f/
         xSQsJUbKNYQpE8x6k2nlgKw60nxezJv6fRmo9xXYddLJVSOO7XPkAdNYqZwESml6XZnI
         JRpuEZ6c9tcEbC5Z+TzkbufYH0EQldGld7/HpXZjxl2EU8Rt7cCNVwoLVul1QxtY+MkN
         zii2AHuAzwKWBAtc/lIvXFNhkgxGruKKzJ6z42mBWq7QWu1yepQ5UTt14P/nilQiU73p
         xkuWkSpgwxfB+G8LvfMuL55bXTpBWkqn2K2IVQ6Owb9MMYjU8jXbO+GLz6MhSWyLM2oG
         cUog==
X-Forwarded-Encrypted: i=1; AFNElJ9pzkQuNR2dr1UId2COhb7lBljTQGg8HHOzYUg9z9eisAhqozFxwHEu83BM/6ynPvC4CudzbQQ1vmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfqS3arJA5O4POCn29QpSDLIMvc1/rdsGD2FaRBpIUSYdH9A62
	PWvUb2zf8dKWBVuxOYNkdsnq6AKA14yIPGtduBASAUPxBzMU/xdc7uU=
X-Gm-Gg: Acq92OFERT7N4vrNUiWchyIb/BhkVdCJkvm66tyoZCt1lAIPSkBnWkErNM0CJdZCsch
	4vbXtoo/fUQvmgmqxClgfaORMFA8gp/N9OdllMoFtGRVT6fLCoH+TmfoWFiofeXafAWV3zBdTVc
	bmqJEqCEAVGhNYAJpRDWf7IPO89dih5ySe1DcKdpKJCFB+5WhOmuMrlW+XWdIAZiXh2SHHt7Jgb
	IwE85PY+xxG+8cGzraU7ecV9b15pfefiY8SA3FcB1fQrcYDeD1BOiCFcXcrjTwrlNDcb9U7HYNH
	xHbSa9XUEZ1UYBF0yq/7Ofgj6DPxSk5+yy2OjVA8NkA+D71e3PTPDRDhEY+AtXfzSvdRxktWv4v
	oRaflzu/mRKNmo79pf32bTx3gH4lwRxYnqjm/ybiL45zPJ1smZQeeyaKlaueUsS7W8T7fsWadD7
	jmNVrroWQHcMkpO8fhNgi3I0M5gXXU89aqD0i072kURGDRnWX81MzsDFbFLjJCseSCU7tLmAxBo
	Q==
X-Received: by 2002:a05:690c:4a01:b0:79a:b440:5c77 with SMTP id 00721157ae682-7c959e890bfmr110956107b3.17.1778970890889;
        Sat, 16 May 2026 15:34:50 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9d18c769sm641257b3.47.2026.05.16.15.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:34:50 -0700 (PDT)
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
Subject: [RFC PATCH 4/7] mm/damon/core: flat-array snapshot + bsearch in ring-drain loop
Date: Sat, 16 May 2026 15:34:29 -0700
Message-ID: <20260516223439.4033-5-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516223439.4033-1-ravis.opensrc@gmail.com>
References: <20260516223439.4033-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The drain loop is O(reports x regions) when matching each ring entry
back to a region.  At sufficiently large CPU x region products the
linear scan exceeds the sample interval, producing unbounded backlog.

At drain start, snapshot each target's regions into a flat array
(struct damon_target_lookup), already sorted by ascending r->ar.start.
Replace the linear lookup with binary search over the snapshot,
reducing the drain to O(reports x log2(regions)).

Reject reports that straddle a region boundary
(addr + report->size > r->ar.end) so partial-region accesses are
not credited to the lower region.

If the snapshot allocation fails under memory pressure, log
ratelimited and fall through to zero-access reporting; the next
tick retries.

Hoist the per-report damon_sample_filter_out() check out of the
per-target loop so it runs once per ring entry rather than N times.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/linux/damon.h |   7 +++
 mm/damon/core.c       | 137 ++++++++++++++++++++++++++++++++++++------
 2 files changed, 126 insertions(+), 18 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 8e6e1cd89e551..35cc3d42fcba8 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -1045,6 +1045,13 @@ struct damon_ctx {
 
 	/* Per-ctx PRNG state for damon_rand(); kdamond is the sole consumer. */
 	struct rnd_state rnd_state;
+	/* Reusable drain-loop snapshot buffer (avoids per-tick kmalloc) */
+	struct {
+		struct damon_target_lookup *lookups;
+		unsigned int nr_lookups;
+		struct damon_region **region_buf;
+		unsigned int region_buf_cap;
+	} drain_snapshot;
 };
 
 /* Get a random number in [@l, @r) using @ctx's lockless PRNG. */
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 9ed789e932ebd..03f9c671e8bc9 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -29,6 +29,13 @@
 #define DAMON_REPORT_RING_SIZE	256
 #define DAMON_REPORT_RING_MASK	(DAMON_REPORT_RING_SIZE - 1)
 
+/* Per-target region lookup for drain loop */
+struct damon_target_lookup {
+	struct damon_region **regions;
+	unsigned int nr_regions;
+};
+
+
 struct damon_report_ring {
 	unsigned int head;	/* written by producer (NMI) */
 	unsigned int tail	/* written by consumer (kdamond) */
@@ -855,6 +862,7 @@ struct damon_ctx *damon_new_ctx(void)
 	INIT_LIST_HEAD(&ctx->schemes);
 
 	prandom_seed_state(&ctx->rnd_state, get_random_u64());
+	/* drain_snapshot zero-initialized by kzalloc — no explicit init */
 
 	return ctx;
 }
@@ -884,6 +892,8 @@ void damon_destroy_ctx(struct damon_ctx *ctx)
 	damon_for_each_sample_filter_safe(f, next_f, &ctx->sample_control)
 		damon_destroy_sample_filter(f, &ctx->sample_control);
 
+	kfree(ctx->drain_snapshot.lookups);
+	kfree(ctx->drain_snapshot.region_buf);
 	module_put(ctx->ops.owner);
 	kfree(ctx);
 }
@@ -3806,27 +3816,44 @@ static bool damon_sample_filter_out(struct damon_access_report *report,
 	return !filter->allow;
 }
 
+
 static void kdamond_apply_access_report(struct damon_access_report *report,
-		struct damon_target *t, struct damon_ctx *ctx)
+		struct damon_region **regions, unsigned int nr_regions,
+		struct damon_ctx *ctx)
 {
 	struct damon_region *r;
 	unsigned long addr;
+	int left, right, mid;
 
-	if (damon_sample_filter_out(report, &ctx->sample_control))
-		return;
 	if (damon_target_has_pid(ctx))
 		addr = report->vaddr;
 	else
 		addr = report->paddr;
 
-	/* todo: make search faster, e.g., binary search? */
-	damon_for_each_region(r, t) {
-		if (addr < r->ar.start)
-			continue;
-		if (r->ar.end < addr + report->size)
-			continue;
-		if (!r->access_reported)
-			damon_update_region_access_rate(r, true, &ctx->attrs);
+	/* Binary search the snapshot for the region containing addr. */
+	left = 0;
+	right = nr_regions - 1;
+	r = NULL;
+	while (left <= right) {
+		/* Avoid (left + right) overflow at large nr_regions. */
+		mid = left + (right - left) / 2;
+		if (addr < regions[mid]->ar.start)
+			right = mid - 1;
+		else if (addr >= regions[mid]->ar.end)
+			left = mid + 1;
+		else {
+			r = regions[mid];
+			break;
+		}
+	}
+
+	if (!r)
+		return;
+	/* Reject reports straddling a region boundary. */
+	if (addr + report->size > r->ar.end)
+		return;
+	if (!r->access_reported) {
+		damon_update_region_access_rate(r, true, &ctx->attrs);
 		r->access_reported = true;
 	}
 }
@@ -3850,10 +3877,79 @@ static unsigned int kdamond_apply_zero_access_report(struct damon_ctx *ctx)
 	return max_nr_accesses;
 }
 
+/*
+ * Build a snapshot of the ctx's targets and their region arrays for
+ * use by the ring drain loop.
+ *
+ * The two-pass walk over adaptive_targets is safe even though
+ * krealloc_array() may sleep: target list mutation is funneled
+ * through damon_call onto the kdamond itself, so no other thread
+ * can mutate the list while kdamond is running this function.
+ */
+static struct damon_target_lookup *damon_build_target_lookup(
+		struct damon_ctx *ctx, unsigned int *nr_targets_out)
+{
+	struct damon_target *t;
+	struct damon_target_lookup *tbl;
+	unsigned int nr_targets = 0, total_regions = 0, ti = 0, ri = 0;
+
+	damon_for_each_target(t, ctx) {
+		nr_targets++;
+		total_regions += damon_nr_regions(t);
+	}
+
+	/* Realloc lookups array if needed */
+	if (nr_targets > ctx->drain_snapshot.nr_lookups) {
+		tbl = krealloc_array(ctx->drain_snapshot.lookups,
+				nr_targets, sizeof(*tbl), GFP_KERNEL);
+		if (!tbl)
+			return NULL;
+		ctx->drain_snapshot.lookups = tbl;
+		ctx->drain_snapshot.nr_lookups = nr_targets;
+	}
+	tbl = ctx->drain_snapshot.lookups;
+
+	/* Realloc contiguous region_buf if needed */
+	if (total_regions > ctx->drain_snapshot.region_buf_cap) {
+		struct damon_region **buf;
+
+		buf = krealloc_array(ctx->drain_snapshot.region_buf,
+				total_regions, sizeof(*buf), GFP_KERNEL);
+		if (!buf)
+			return NULL;
+		ctx->drain_snapshot.region_buf = buf;
+		ctx->drain_snapshot.region_buf_cap = total_regions;
+	}
+
+	/* Fill lookup table, slicing region_buf across targets */
+	ri = 0;
+	damon_for_each_target(t, ctx) {
+		struct damon_region *r;
+
+		tbl[ti].regions = &ctx->drain_snapshot.region_buf[ri];
+		tbl[ti].nr_regions = damon_nr_regions(t);
+		damon_for_each_region(r, t)
+			ctx->drain_snapshot.region_buf[ri++] = r;
+		ti++;
+	}
+
+	*nr_targets_out = nr_targets;
+	return tbl;
+}
+
 static unsigned int kdamond_check_reported_accesses(struct damon_ctx *ctx)
 {
 	int cpu;
-	struct damon_target *t;
+	struct damon_target_lookup *tbl;
+	unsigned int nr_targets = 0;
+	unsigned int i;
+
+	tbl = damon_build_target_lookup(ctx, &nr_targets);
+	if (!tbl) {
+		pr_warn_ratelimited(
+			"damon: target-lookup alloc failed; ring drain skipped this tick\n");
+		return kdamond_apply_zero_access_report(ctx);
+	}
 
 	for_each_cpu(cpu, &damon_rings_pending) {
 		struct damon_report_ring *ring =
@@ -3881,14 +3977,19 @@ static unsigned int kdamond_check_reported_accesses(struct damon_ctx *ctx)
 		while (tail != head) {
 			struct damon_access_report *report =
 				&ring->entries[tail];
-
-			if (!time_before(report->report_jiffies,
+			if (time_before(report->report_jiffies,
 					jiffies - usecs_to_jiffies(
-						ctx->attrs.sample_interval))) {
-				damon_for_each_target(t, ctx)
-					kdamond_apply_access_report(
-							report, t, ctx);
+						ctx->attrs.sample_interval)))
+				goto next;
+			if (damon_sample_filter_out(report,
+					&ctx->sample_control))
+				goto next;
+			for (i = 0; i < nr_targets; i++) {
+				kdamond_apply_access_report(report,
+						tbl[i].regions,
+						tbl[i].nr_regions, ctx);
 			}
+next:
 			tail = (tail + 1) & DAMON_REPORT_RING_MASK;
 		}
 		WRITE_ONCE(ring->tail, tail);
-- 
2.43.0


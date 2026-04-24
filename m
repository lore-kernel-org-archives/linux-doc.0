Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CF73FB7DC
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 20:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777062900; cv=none; b=M9ZpeFbywGmMz+VQbxuny3vqMXJKhVMWXq2a3cS8WjV6kxqFfaBqVFBMkgOHxlxJWrvQpRahlL6V8ZR27QM66WVkYO3za10Jp7GGMoQCU0CTfACV4U0CGftxKixLKLyhIqBnMjuwX8wF0Mv0dEpoKETqmA1koQNgYEwNw61kfDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777062900; c=relaxed/simple;
	bh=dKg047W87wFIP2swOVB2oZBfrsTAUsKFjBpxXBmxDXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXP78jOZdItqjmy3UYGHkZcFieMnoAwC5GZho7zvtqHM1nUVTYEQ2Xj+LRsL11IjbDqV7ElqRNO2EVKkWklnNIiMoISb8TuKoM7eDr3i4HrGVJKZcJObN7Uofau+OdF5HrSOeLrhb55HMMUDpBxEDbBiqFDD8H64SkISUOIkrUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFdQJCR+; arc=none smtp.client-ip=209.85.210.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFdQJCR+"
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7d4c383f2fcso6948427a34.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 13:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777062898; x=1777667698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=92bmG5mdwkOb6S734aAYKrvcPKrn24NTG3MKYhd6SJk=;
        b=TFdQJCR+jY9B6KLMK20km51Z17loW1p060RarDKEpAZlrIyL74SD8q+mUyTVn+xIhX
         D+k1Ug4J99ETTeXZI/BaCxqxpQnZ7vyedKQnV/xGo4g4BXmQ8B8qbo7s9xI7O2lULWEk
         kGCBMhbU6ubBizqvHhs5NAXmIh9rM+GkLZMyuXuf4cSFNBP10qAvsm19UCNSfm5Jb7hV
         EhoHEVpHBzRFiYy/efKZh+CYu/RbxEeT/qQPPh1nAlz/wra5d9nUBAaJ/Dpx9aeWX1se
         2ylXH2rjlLUBCnuM3jxW4/lkk/8oujXxUL08Jaq6KTMSfRuinIoa8KrwBrix9uVB8sSU
         tR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777062898; x=1777667698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92bmG5mdwkOb6S734aAYKrvcPKrn24NTG3MKYhd6SJk=;
        b=r0qja32QQF9xd1U6QmGfl8gwi4g01l9UD7lEifEkgobX5wyoPC8gmvp+RtCbYdPeXV
         h6nlgUa4xKM3KX0JwlrScIkSPba7NJKl+t7BCXiBA1c2/AvD83nROmzROfAmqEtnFPJE
         WffRx0pt6cOyddtnv63dcRvpl6EAh1lLKt+dWopXnKHqLgmrLKg6RMcWGXo3rAuTFJak
         HjdRV+qFQMVho+0QAFJCbJrswJqOgWRWJWYPtqg+IloS5vlTi3CNXasTspmXZqNRG815
         +1r3DgX/YkcZi5lc5CsEQFtoRUm6wUR4XUN8YKFhGRWO5ztHvJ0oi6YBC/xsjqMbSojf
         DxJg==
X-Forwarded-Encrypted: i=1; AFNElJ/bJQBOkKxPt7EHQJdV/TbkiwRYZ1p9+SydMCKFwDrVj6qTWw6OCfDdifbU8I+IyOYaUnaaUt5Eeuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYCt/sY0XSfZM4mQXW/Aqfig2XiR/FUTPiBiFmRG0PEaBLDWfO
	tmkJF3CLTCBkQqFdL7TkaZ5DT86t6R0ejvz7f5jB6BnovBdEfj0EK/E=
X-Gm-Gg: AeBDievzi8ygJt8r0eKuFY98q3VbimR6FbB0zm+KhK2grVRo1eIdIFbiajL/tmU9kgx
	9nCXmPBalV0MfxfCk6gXMgYBOGUahO91+1UF4l/DaLDVtl5sm1mCLlRp5FIk3dTDfoeKJ5tgQd+
	VpJ/wgIkVpexUTANuSeM+3BrF82vHFk5HIDuLjJDRGyowigJ3UNRWO1smSt2RBNvIDPjOA0zRDg
	0kPx046PnHVQyEc3wTL4A4FgnZA7z6aytgooxziEXjGPsoHnrhO45wYqqAi9GKGmOidexN9Rh4n
	81YnYFVuheAA5J+FkViwMDD4WHqIZnzEP6NHGhARD4wdPxX0bTvRS/4zYFuboHHOS9KKglp/vWW
	Q48WTnn+R5r3Ve6bVFJ7jzipeShdp3OQG2q2V/nHD54gsD6qjelI9Z0mInogXXns7VPywYO3MpO
	7h00zyANbmROa+SI7yYN9PSv58SWnH4U4WsV1qvyaECxRj2FBInibh9l0GiNPbwmZmmK/QsBObU
	KRfpcnhWX6wMaocLaINHmE=
X-Received: by 2002:a05:6830:6d56:b0:7dc:d2ad:fb29 with SMTP id 46e09a7af769-7dcd2ae018bmr12849116a34.24.1777062897420;
        Fri, 24 Apr 2026 13:34:57 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc975034e7sm20050939a34.6.2026.04.24.13.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:34:56 -0700 (PDT)
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
	ravis.opensrc@gmail.com
Subject: [PATCH v7] mm/damon: add node_eligible_mem_bp goal metric
Date: Fri, 24 Apr 2026 13:34:48 -0700
Message-ID: <20260424203448.5040-1-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Background and Motivation
=========================

In heterogeneous memory systems, controlling memory distribution across
NUMA nodes is essential for performance optimization. This patch enables
system-wide page distribution with target-state goals such as "maintain
60% of scheme-eligible memory on DRAM" using PA-mode DAMON schemes.

Rather than using absolute thresholds, this metric tracks the ratio of
memory that matches each scheme's access pattern filters on a target
node, enabling the quota system to automatically adjust migration
aggressiveness to maintain the desired distribution.

What This Metric Measures
=========================

node_eligible_mem_bp:
    scheme_eligible_bytes_on_node / total_scheme_eligible_bytes * 10000

The metric iterates through each scheme's eligible regions and uses
damon_get_folio() to determine NUMA node placement of each folio.

Two-Scheme Setup for Hot Page Distribution
==========================================

For maintaining hot memory on DRAM (node 0) and CXL (node 1) in a 6:4
ratio (per SeongJae Park's suggestion):

    PULL scheme: migrate_hot to node 0
      goal: node_eligible_mem_bp, nid=0, target=6000
      "Move hot pages to DRAM if less than 60% of hot data is in DRAM"

    PUSH scheme: migrate_hot to node 1
      goal: node_eligible_mem_bp, nid=1, target=4000
      "Move hot pages to CXL if less than 40% of hot data is in CXL"

Each scheme independently measures its own eligible memory and adjusts
its quota to achieve its target ratio. The schemes work in concert
through DAMON's unified monitoring context, with the quota autotuner
balancing their relative aggressiveness.

Implementation Details
======================

Key implementation considerations:
- Uses phys_addr_t for byte calculations to prevent overflow on 32-bit
  architectures with large memory configurations
- Includes cond_resched() per region to prevent CPU soft lockups when
  processing large numbers of regions
- Validates that ops type is DAMON_OPS_PADDR in both damon_commit_ctx()
  (for clear error feedback) and the metric function (defensive check)
- Properly handles folio alignment when region addresses fall within
  large folios by calculating exact overlap

The implementation requires CONFIG_DAMON_PADDR since damon_get_folio()
is only available for physical address space monitoring.

Testing Results
===============

Functionally tested on a two-node heterogeneous memory system with DRAM
(node 0) and CXL memory (node 1). A PUSH+PULL scheme configuration using
migrate_hot actions was used to reach a target hot memory ratio between
the two tiers.

With the TEMPORAL tuner, the system converges quickly to the target
distribution. The tuner drives esz to maximum when under goal and to
zero once the goal is met, forming a simple on/off feedback loop that
stabilizes at the desired ratio.

With the CONSIST tuner, the scheme still converges but more slowly, as
it migrates and then throttles itself based on quota feedback. The time
to reach the goal varies depending on workload intensity.

Note: This metric works with both TEMPORAL and CONSIST goal tuners.

Suggested-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/linux/damon.h    |   3 +
 mm/damon/core.c          | 171 +++++++++++++++++++++++++++++++++++----
 mm/damon/sysfs-schemes.c |   7 ++
 3 files changed, 165 insertions(+), 16 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index f2cdb7c3f5e6..986b8c902585 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -159,6 +159,8 @@ enum damos_action {
  * @DAMOS_QUOTA_NODE_MEMCG_FREE_BP:	MemFree ratio of a node for a cgroup.
  * @DAMOS_QUOTA_ACTIVE_MEM_BP:		Active to total LRU memory ratio.
  * @DAMOS_QUOTA_INACTIVE_MEM_BP:	Inactive to total LRU memory ratio.
+ * @DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP:	Scheme-eligible memory ratio of a
+ *					node in basis points (0-10000).
  * @NR_DAMOS_QUOTA_GOAL_METRICS:	Number of DAMOS quota goal metrics.
  *
  * Metrics equal to larger than @NR_DAMOS_QUOTA_GOAL_METRICS are unsupported.
@@ -172,6 +174,7 @@ enum damos_quota_goal_metric {
 	DAMOS_QUOTA_NODE_MEMCG_FREE_BP,
 	DAMOS_QUOTA_ACTIVE_MEM_BP,
 	DAMOS_QUOTA_INACTIVE_MEM_BP,
+	DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP,
 	NR_DAMOS_QUOTA_GOAL_METRICS,
 };
 
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 3dbbbfdeff71..4ac805205261 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -13,10 +13,14 @@
 #include <linux/memcontrol.h>
 #include <linux/mm.h>
 #include <linux/psi.h>
+#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/string_choices.h>
 
+/* for damon_get_folio() used by node eligible memory metrics */
+#include "ops-common.h"
+
 #define CREATE_TRACE_POINTS
 #include <trace/events/damon.h>
 
@@ -1326,11 +1330,25 @@ static int damon_commit_targets(
 int damon_commit_ctx(struct damon_ctx *dst, struct damon_ctx *src)
 {
 	int err;
+	struct damos *scheme;
+	struct damos_quota_goal *goal;
 
 	dst->maybe_corrupted = true;
 	if (!is_power_of_2(src->min_region_sz))
 		return -EINVAL;
 
+	/* node_eligible_mem_bp metric requires PADDR ops */
+	if (src->ops.id != DAMON_OPS_PADDR) {
+		damon_for_each_scheme(scheme, src) {
+			struct damos_quota *quota = &scheme->quota;
+
+			damos_for_each_quota_goal(goal, quota) {
+				if (goal->metric == DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP)
+					return -EINVAL;
+			}
+		}
+	}
+
 	err = damon_commit_schemes(dst, src);
 	if (err)
 		return err;
@@ -2287,7 +2305,112 @@ static unsigned long damos_get_node_memcg_used_bp(
 		numerator = i.totalram - used_pages;
 	return mult_frac(numerator, 10000, i.totalram);
 }
-#else
+
+#ifdef CONFIG_DAMON_PADDR
+/*
+ * damos_calc_eligible_bytes() - Calculate raw eligible bytes per node.
+ * @c:		The DAMON context.
+ * @s:		The scheme.
+ * @nid:	The target NUMA node id.
+ * @total:	Output for total eligible bytes across all nodes.
+ *
+ * Iterates through each folio in eligible regions to accurately determine
+ * which node the memory resides on. Returns eligible bytes on the specified
+ * node and sets *total to the sum across all nodes.
+ *
+ * Note: This function requires damon_get_folio() from ops-common.c, which is
+ * only available when CONFIG_DAMON_PADDR is enabled. It also requires the
+ * context to be using PADDR operations for meaningful results.
+ */
+static phys_addr_t damos_calc_eligible_bytes(struct damon_ctx *c,
+		struct damos *s, int nid, phys_addr_t *total)
+{
+	struct damon_target *t;
+	struct damon_region *r;
+	phys_addr_t total_eligible = 0;
+	phys_addr_t node_eligible = 0;
+
+	damon_for_each_target(t, c) {
+		damon_for_each_region(r, t) {
+			phys_addr_t addr, end_addr;
+
+			if (!__damos_valid_target(r, s))
+				continue;
+
+			/* Convert from core address units to physical bytes */
+			addr = (phys_addr_t)r->ar.start * c->addr_unit;
+			end_addr = (phys_addr_t)r->ar.end * c->addr_unit;
+			while (addr < end_addr) {
+				struct folio *folio;
+				phys_addr_t folio_start, folio_end;
+				phys_addr_t overlap_start, overlap_end;
+				phys_addr_t counted;
+
+				folio = damon_get_folio(PHYS_PFN(addr));
+				if (!folio) {
+					addr += PAGE_SIZE;
+					continue;
+				}
+
+				/*
+				 * Calculate exact overlap between the region
+				 * [addr, end_addr) and the folio range.
+				 * The folio may start before addr if addr is
+				 * in the middle of a large folio.
+				 */
+				folio_start = PFN_PHYS(folio_pfn(folio));
+				folio_end = folio_start + folio_size(folio);
+
+				overlap_start = max(addr, folio_start);
+				overlap_end = min(end_addr, folio_end);
+
+				if (overlap_end > overlap_start) {
+					counted = overlap_end - overlap_start;
+					total_eligible += counted;
+					if (folio_nid(folio) == nid)
+						node_eligible += counted;
+				}
+
+				/* Advance past the entire folio */
+				addr = folio_end;
+				folio_put(folio);
+			}
+			cond_resched();
+		}
+	}
+
+	*total = total_eligible;
+	return node_eligible;
+}
+
+static unsigned long damos_get_node_eligible_mem_bp(struct damon_ctx *c,
+		struct damos *s, int nid)
+{
+	phys_addr_t total_eligible = 0;
+	phys_addr_t node_eligible;
+
+	if (c->ops.id != DAMON_OPS_PADDR)
+		return 0;
+
+	if (nid < 0 || nid >= MAX_NUMNODES || !node_online(nid))
+		return 0;
+
+	node_eligible = damos_calc_eligible_bytes(c, s, nid, &total_eligible);
+
+	if (!total_eligible)
+		return 0;
+
+	return mult_frac((unsigned long)node_eligible, 10000,
+			(unsigned long)total_eligible);
+}
+#else /* CONFIG_DAMON_PADDR */
+static unsigned long damos_get_node_eligible_mem_bp(struct damon_ctx *c,
+		struct damos *s, int nid)
+{
+	return 0;
+}
+#endif /* CONFIG_DAMON_PADDR */
+#else /* CONFIG_NUMA */
 static __kernel_ulong_t damos_get_node_mem_bp(
 		struct damos_quota_goal *goal)
 {
@@ -2299,7 +2422,13 @@ static unsigned long damos_get_node_memcg_used_bp(
 {
 	return 0;
 }
-#endif
+
+static unsigned long damos_get_node_eligible_mem_bp(struct damon_ctx *c,
+		struct damos *s, int nid)
+{
+	return 0;
+}
+#endif /* CONFIG_NUMA */
 
 /*
  * Returns LRU-active or inactive memory to total LRU memory size ratio.
@@ -2319,7 +2448,8 @@ static unsigned int damos_get_in_active_mem_bp(bool active_ratio)
 	return mult_frac(inactive, 10000, total);
 }
 
-static void damos_set_quota_goal_current_value(struct damos_quota_goal *goal)
+static void damos_set_quota_goal_current_value(struct damon_ctx *c,
+		struct damos *s, struct damos_quota_goal *goal)
 {
 	u64 now_psi_total;
 
@@ -2345,19 +2475,24 @@ static void damos_set_quota_goal_current_value(struct damos_quota_goal *goal)
 		goal->current_value = damos_get_in_active_mem_bp(
 				goal->metric == DAMOS_QUOTA_ACTIVE_MEM_BP);
 		break;
+	case DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP:
+		goal->current_value = damos_get_node_eligible_mem_bp(c, s,
+				goal->nid);
+		break;
 	default:
 		break;
 	}
 }
 
 /* Return the highest score since it makes schemes least aggressive */
-static unsigned long damos_quota_score(struct damos_quota *quota)
+static unsigned long damos_quota_score(struct damon_ctx *c, struct damos *s)
 {
 	struct damos_quota_goal *goal;
+	struct damos_quota *quota = &s->quota;
 	unsigned long highest_score = 0;
 
 	damos_for_each_quota_goal(goal, quota) {
-		damos_set_quota_goal_current_value(goal);
+		damos_set_quota_goal_current_value(c, s, goal);
 		highest_score = max(highest_score,
 				mult_frac(goal->current_value, 10000,
 					goal->target_value));
@@ -2366,17 +2501,19 @@ static unsigned long damos_quota_score(struct damos_quota *quota)
 	return highest_score;
 }
 
-static void damos_goal_tune_esz_bp_consist(struct damos_quota *quota)
+static void damos_goal_tune_esz_bp_consist(struct damon_ctx *c, struct damos *s)
 {
-	unsigned long score = damos_quota_score(quota);
+	struct damos_quota *quota = &s->quota;
+	unsigned long score = damos_quota_score(c, s);
 
 	quota->esz_bp = damon_feed_loop_next_input(
 			max(quota->esz_bp, 10000UL), score);
 }
 
-static void damos_goal_tune_esz_bp_temporal(struct damos_quota *quota)
+static void damos_goal_tune_esz_bp_temporal(struct damon_ctx *c, struct damos *s)
 {
-	unsigned long score = damos_quota_score(quota);
+	struct damos_quota *quota = &s->quota;
+	unsigned long score = damos_quota_score(c, s);
 
 	if (score >= 10000)
 		quota->esz_bp = 0;
@@ -2389,9 +2526,9 @@ static void damos_goal_tune_esz_bp_temporal(struct damos_quota *quota)
 /*
  * Called only if quota->ms, or quota->sz are set, or quota->goals is not empty
  */
-static void damos_set_effective_quota(struct damos_quota *quota,
-		struct damon_ctx *ctx)
+static void damos_set_effective_quota(struct damon_ctx *c, struct damos *s)
 {
+	struct damos_quota *quota = &s->quota;
 	unsigned long throughput;
 	unsigned long esz = ULONG_MAX;
 
@@ -2402,9 +2539,9 @@ static void damos_set_effective_quota(struct damos_quota *quota,
 
 	if (!list_empty(&quota->goals)) {
 		if (quota->goal_tuner == DAMOS_QUOTA_GOAL_TUNER_CONSIST)
-			damos_goal_tune_esz_bp_consist(quota);
+			damos_goal_tune_esz_bp_consist(c, s);
 		else if (quota->goal_tuner == DAMOS_QUOTA_GOAL_TUNER_TEMPORAL)
-			damos_goal_tune_esz_bp_temporal(quota);
+			damos_goal_tune_esz_bp_temporal(c, s);
 		esz = quota->esz_bp / 10000;
 	}
 
@@ -2415,7 +2552,7 @@ static void damos_set_effective_quota(struct damos_quota *quota,
 		else
 			throughput = PAGE_SIZE * 1024;
 		esz = min(throughput * quota->ms, esz);
-		esz = max(ctx->min_region_sz, esz);
+		esz = max(c->min_region_sz, esz);
 	}
 
 	if (quota->sz && quota->sz < esz)
@@ -2452,7 +2589,9 @@ static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
 	/* First charge window */
 	if (!quota->total_charged_sz && !quota->charged_from) {
 		quota->charged_from = jiffies;
-		damos_set_effective_quota(quota, c);
+		damos_set_effective_quota(c, s);
+		if (trace_damos_esz_enabled())
+			damos_trace_esz(c, s, quota);
 	}
 
 	/* New charge window starts */
@@ -2467,7 +2606,7 @@ static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
 		quota->charged_sz = 0;
 		if (trace_damos_esz_enabled())
 			cached_esz = quota->esz;
-		damos_set_effective_quota(quota, c);
+		damos_set_effective_quota(c, s);
 		if (trace_damos_esz_enabled() && quota->esz != cached_esz)
 			damos_trace_esz(c, s, quota);
 	}
diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
index 245d63808411..f21191d31f58 100644
--- a/mm/damon/sysfs-schemes.c
+++ b/mm/damon/sysfs-schemes.c
@@ -1094,6 +1094,10 @@ struct damos_sysfs_qgoal_metric_name damos_sysfs_qgoal_metric_names[] = {
 		.metric = DAMOS_QUOTA_INACTIVE_MEM_BP,
 		.name = "inactive_mem_bp",
 	},
+	{
+		.metric = DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP,
+		.name = "node_eligible_mem_bp",
+	},
 };
 
 static ssize_t target_metric_show(struct kobject *kobj,
@@ -2685,6 +2689,9 @@ static int damos_sysfs_add_quota_score(
 			}
 			goal->nid = sysfs_goal->nid;
 			break;
+		case DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP:
+			goal->nid = sysfs_goal->nid;
+			break;
 		default:
 			break;
 		}

base-commit: 277a7fae172bb4a598e0d4144ffb2ff6207fedb3
-- 
2.43.0


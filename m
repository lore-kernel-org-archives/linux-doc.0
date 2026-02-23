Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DAE18C03E
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849989; cv=none; b=EdbFbE8d7jnBwiaYaS0Ov5ejMK1HTKeayGPW/1/YTMBVLT7CkC9s/SYRk3tNaE5NDEExkFA0XGJ6EMVxDh8HjeqfP/1dG4otNfufpqHwKgaOnrTgxR9ElvIElIdsSUH0Z31CfY8CQH5f7u6AiIIZGnnhLtVTIL/ccAQW+Zl+gDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849989; c=relaxed/simple;
	bh=9A3KDPULYLSQF2TtBzqTrGQAnOGp35GVxCILsbUiNKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tR3lyUYYQ2ZrQx8myOwBPD5u4TUpIidbdTuTDY/VRKRCaU09H5fOjv31ssRbVtnvlP4XXqZR7QCnsy7Tb2YEPdqJIjsxNrNhELMd3Xk/XI6Q3d3/+VTpd808+MvpVKEPiVrKT3o/GK+5eNavRQ/Spgst3xkSTDXCwhgNgBZ+w8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCs0oMlK; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCs0oMlK"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c6e1d3e4dc4so870689a12.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 04:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771849983; x=1772454783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYNB6/pZb33YeAKubCBWRXUx4k4dpplKbNpn3dWK4iI=;
        b=TCs0oMlKpmQe+XIQwiZNvDLBOs+XcBR3gUx6ckWeY++41soJQ04czGRUzrZv/uBEWc
         aNrkLYoY+8rgLibrLLY5bWmtEWilMe+rg3j50if7UCHY7GYbKQew98n5GhUTweBbjmBW
         hzzLTZKHMs1ao6H4Ks4BBVcn2uCVLv+rWwRjiymE2Vca4BEiVUcxx1tCZ8oFV8kWQVFR
         4iQsZbcN+oWs+dtXwhv+3ywz5woXFhJ09heCDs61z3TGlvih9WQW+ILgq9AFQidHzfth
         3SHC26i+4O+fVkRH9OjIub4r5NMCEb3S8iOnHBMjYp9RgK1o6SukMszT+1tUtTMv/Aml
         pPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771849983; x=1772454783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GYNB6/pZb33YeAKubCBWRXUx4k4dpplKbNpn3dWK4iI=;
        b=i2qzX2Lju1rpwdI2AqJjbARHOH7nbH+BbUSR5XInO8VrPdTMXrL3dQ1zG7NFY6qYka
         Eag4x5go7+QHkQf2/qMOp/8vNqljiC79Cxqk3H2nfCNtOH6D2Fxq+YD4IXLDmwkFcS64
         MymHpvdPLpJUBVKk8ExwkMR4B/p4G53ZV7YZXvnocFnMnhP4rQCZ1NG/oIXJ9TjPcoUv
         /LjaYI5Yhf90//9Utw+YAicN5mup7BPOmy+pKka+yyLeY5gu3RuXOkbJ6c/Wv6lPbJyX
         mo5IsGpGVEbZ0tI7SOcVWEFxlt3RswIqFggxsgz3O6S2wvhpB9EsnABsdooEjG2k8kBr
         ySyA==
X-Forwarded-Encrypted: i=1; AJvYcCVTLAbfY+NvlJ/fyaUkKxY9qlA/Yr5jYUQh+y0f13Y26GM12vkedje6PBl34mIwsBzLLHyqyu/IBxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOMK9MMd7IZ93QMe7ShrwrOlhl5DndrK0MQ29BlFFpiSQTwBnC
	ezqGU8BUS5HQ1VeewfSJ3uA83Ndd5IvTuHq+fUYN+M4ox95Nlketwrc=
X-Gm-Gg: AZuq6aJWulmxCCqGOsbt4PdnvFuGW1zL9zY7J7gnOYHR5zs8iaRhPkoiHAV+ahnYc8a
	pHIKnYxpjzA6JWIGtfRdkOCOL1gFm6LOuNzhDF5HTD5Vl+a62F5AEB75q7iQRk/8Kgz0iSoKheQ
	6GRVDqwnEeZMrbH8gbtT+/qQNe8H9BcXB5omawkCjwAF6Nj4D3uoVEZy8YDUBEmvP+1a3HcHWyl
	J+pRnt1olHeunM0t7FD/m7JY7ik/7NO5G3kor/bwOsI4/Pc3WvWeKIHak7SqV+7jIF2XqA5hQG9
	GkfQ2T/iZvdQaXF5Ndog7XxMEvR9Zp/KDJA9HQZTzSUnU7nw/tZb4vsaaW8+DxQXugfBijuwqbm
	T+kA7YZ8oI1s6H4meJBgN5xfqHxgORDCjZQcYBTvuJApPm7Iu9HkbZgxTHAMsjUeE5YHS4HC/3W
	J/oWlyzNsnMRhX19oH5CPuPSw9ZRN7+UBMEWCNqf8+feaW
X-Received: by 2002:a05:6a20:cc97:b0:35e:11ff:45c1 with SMTP id adf61e73a8af0-39545ebee1cmr6462789637.18.1771849983299;
        Mon, 23 Feb 2026 04:33:03 -0800 (PST)
Received: from LAPTOP-FDBL0TVI.localdomain ([49.37.157.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71a73e1sm7454739a12.13.2026.02.23.04.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:33:02 -0800 (PST)
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
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Subject: [RFC PATCH v3 3/4] mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal metrics
Date: Mon, 23 Feb 2026 12:32:31 +0000
Message-ID: <20260223123232.12851-4-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223123232.12851-1-ravis.opensrc@gmail.com>
References: <20260223123232.12851-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add new quota goal metrics for memory tiering that track scheme-eligible
(hot) memory distribution across NUMA nodes:

- DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP: ratio of hot memory on a node
- DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP: ratio of hot memory NOT on a node

These complementary metrics enable push-pull migration schemes that
maintain a target hot memory distribution. For example, to keep 30%
of hot memory on CXL node 1:

- PUSH scheme (DRAM→CXL): node_eligible_mem_bp, nid=1, target=3000
  Activates when node 1 has less than 30% hot memory
- PULL scheme (CXL→DRAM): node_ineligible_mem_bp, nid=1, target=7000
  Activates when node 1 has more than 30% hot memory

Together with the TEMPORAL goal tuner, the schemes converge to
equilibrium at the target distribution.

The metrics use detected eligible bytes per node, calculated by summing
the size of regions that match the scheme's access pattern (size,
nr_accesses, age) on each NUMA node.

Suggested-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/linux/damon.h    |   6 ++
 mm/damon/core.c          | 123 ++++++++++++++++++++++++++++++++++++++-
 mm/damon/sysfs-schemes.c |  10 ++++
 3 files changed, 137 insertions(+), 2 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index ee2d0879c292..6df716533fbf 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -191,6 +191,8 @@ enum damos_action {
  * @DAMOS_QUOTA_NODE_MEM_FREE_BP:	MemFree ratio of a node.
  * @DAMOS_QUOTA_NODE_MEMCG_USED_BP:	MemUsed ratio of a node for a cgroup.
  * @DAMOS_QUOTA_NODE_MEMCG_FREE_BP:	MemFree ratio of a node for a cgroup.
+ * @DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP:	Scheme-eligible memory ratio of a node.
+ * @DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP:	Scheme-ineligible memory ratio of a node.
  * @DAMOS_QUOTA_ACTIVE_MEM_BP:		Active to total LRU memory ratio.
  * @DAMOS_QUOTA_INACTIVE_MEM_BP:	Inactive to total LRU memory ratio.
  * @NR_DAMOS_QUOTA_GOAL_METRICS:	Number of DAMOS quota goal metrics.
@@ -204,6 +206,8 @@ enum damos_quota_goal_metric {
 	DAMOS_QUOTA_NODE_MEM_FREE_BP,
 	DAMOS_QUOTA_NODE_MEMCG_USED_BP,
 	DAMOS_QUOTA_NODE_MEMCG_FREE_BP,
+	DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP,
+	DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP,
 	DAMOS_QUOTA_ACTIVE_MEM_BP,
 	DAMOS_QUOTA_INACTIVE_MEM_BP,
 	NR_DAMOS_QUOTA_GOAL_METRICS,
@@ -555,6 +559,7 @@ struct damos_migrate_dests {
  * @ops_filters:	ops layer handling &struct damos_filter objects list.
  * @last_applied:	Last @action applied ops-managing entity.
  * @stat:		Statistics of this scheme.
+ * @eligible_bytes_per_node: Scheme-eligible bytes per NUMA node.
  * @max_nr_snapshots:	Upper limit of nr_snapshots stat.
  * @list:		List head for siblings.
  *
@@ -644,6 +649,7 @@ struct damos {
 	struct list_head ops_filters;
 	void *last_applied;
 	struct damos_stat stat;
+	unsigned long eligible_bytes_per_node[MAX_NUMNODES];
 	unsigned long max_nr_snapshots;
 	struct list_head list;
 };
diff --git a/mm/damon/core.c b/mm/damon/core.c
index b438355ab54a..3e1cb850f067 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2544,6 +2544,111 @@ static unsigned long damos_get_node_memcg_used_bp(
 }
 #endif
 
+#ifdef CONFIG_NUMA
+/*
+ * damos_scheme_uses_eligible_metrics() - Check if scheme uses eligible metrics.
+ * @s: The scheme
+ *
+ * Returns true if any quota goal uses node_eligible_mem_bp or
+ * node_ineligible_mem_bp metrics, which require eligible bytes calculation.
+ */
+static bool damos_scheme_uses_eligible_metrics(struct damos *s)
+{
+	struct damos_quota_goal *goal;
+	struct damos_quota *quota = &s->quota;
+
+	damos_for_each_quota_goal(goal, quota) {
+		if (goal->metric == DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP ||
+		    goal->metric == DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP)
+			return true;
+	}
+	return false;
+}
+
+/*
+ * damos_calc_eligible_bytes_per_node() - Calculate eligible bytes per node.
+ * @c: The DAMON context
+ * @s: The scheme
+ *
+ * Calculates scheme-eligible bytes per NUMA node based on access pattern
+ * matching. A region is eligible if it matches the scheme's access pattern
+ * (size, nr_accesses, age).
+ */
+static void damos_calc_eligible_bytes_per_node(struct damon_ctx *c,
+		struct damos *s)
+{
+	struct damon_target *t;
+	struct damon_region *r;
+	phys_addr_t paddr;
+	int nid;
+
+	memset(s->eligible_bytes_per_node, 0,
+			sizeof(s->eligible_bytes_per_node));
+
+	damon_for_each_target(t, c) {
+		damon_for_each_region(r, t) {
+			if (!__damos_valid_target(r, s))
+				continue;
+			paddr = (phys_addr_t)r->ar.start * c->addr_unit;
+			nid = pfn_to_nid(PHYS_PFN(paddr));
+			if (nid >= 0 && nid < MAX_NUMNODES)
+				s->eligible_bytes_per_node[nid] +=
+					damon_sz_region(r) * c->addr_unit;
+		}
+	}
+}
+
+static unsigned long damos_get_node_eligible_mem_bp(struct damos *s, int nid)
+{
+	unsigned long total_eligible = 0;
+	unsigned long node_eligible;
+	int n;
+
+	if (nid < 0 || nid >= MAX_NUMNODES)
+		return 0;
+
+	for_each_online_node(n)
+		total_eligible += s->eligible_bytes_per_node[n];
+
+	if (!total_eligible)
+		return 0;
+
+	node_eligible = s->eligible_bytes_per_node[nid];
+
+	return mult_frac(node_eligible, 10000, total_eligible);
+}
+
+static unsigned long damos_get_node_ineligible_mem_bp(struct damos *s, int nid)
+{
+	unsigned long eligible_bp = damos_get_node_eligible_mem_bp(s, nid);
+
+	if (eligible_bp == 0)
+		return 10000;
+
+	return 10000 - eligible_bp;
+}
+#else
+static bool damos_scheme_uses_eligible_metrics(struct damos *s)
+{
+	return false;
+}
+
+static void damos_calc_eligible_bytes_per_node(struct damon_ctx *c,
+		struct damos *s)
+{
+}
+
+static unsigned long damos_get_node_eligible_mem_bp(struct damos *s, int nid)
+{
+	return 0;
+}
+
+static unsigned long damos_get_node_ineligible_mem_bp(struct damos *s, int nid)
+{
+	return 0;
+}
+#endif
+
 /*
  * Returns LRU-active or inactive memory to total LRU memory size ratio.
  */
@@ -2562,7 +2667,8 @@ static unsigned int damos_get_in_active_mem_bp(bool active_ratio)
 	return mult_frac(inactive, 10000, total);
 }
 
-static void damos_set_quota_goal_current_value(struct damos_quota_goal *goal)
+static void damos_set_quota_goal_current_value(struct damos_quota_goal *goal,
+		struct damos *s)
 {
 	u64 now_psi_total;
 
@@ -2584,6 +2690,14 @@ static void damos_set_quota_goal_current_value(struct damos_quota_goal *goal)
 	case DAMOS_QUOTA_NODE_MEMCG_FREE_BP:
 		goal->current_value = damos_get_node_memcg_used_bp(goal);
 		break;
+	case DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP:
+		goal->current_value = damos_get_node_eligible_mem_bp(s,
+				goal->nid);
+		break;
+	case DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP:
+		goal->current_value = damos_get_node_ineligible_mem_bp(s,
+				goal->nid);
+		break;
 	case DAMOS_QUOTA_ACTIVE_MEM_BP:
 	case DAMOS_QUOTA_INACTIVE_MEM_BP:
 		goal->current_value = damos_get_in_active_mem_bp(
@@ -2597,11 +2711,12 @@ static void damos_set_quota_goal_current_value(struct damos_quota_goal *goal)
 /* Return the highest score since it makes schemes least aggressive */
 static unsigned long damos_quota_score(struct damos_quota *quota)
 {
+	struct damos *s = container_of(quota, struct damos, quota);
 	struct damos_quota_goal *goal;
 	unsigned long highest_score = 0;
 
 	damos_for_each_quota_goal(goal, quota) {
-		damos_set_quota_goal_current_value(goal);
+		damos_set_quota_goal_current_value(goal, s);
 		highest_score = max(highest_score,
 				mult_frac(goal->current_value, 10000,
 					goal->target_value));
@@ -2693,6 +2808,10 @@ static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
 	if (!quota->ms && !quota->sz && list_empty(&quota->goals))
 		return;
 
+	/* Calculate eligible bytes per node for quota goal metrics */
+	if (damos_scheme_uses_eligible_metrics(s))
+		damos_calc_eligible_bytes_per_node(c, s);
+
 	/* First charge window */
 	if (!quota->total_charged_sz && !quota->charged_from) {
 		quota->charged_from = jiffies;
diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
index fe2e3b2db9e1..232b33f5cbfb 100644
--- a/mm/damon/sysfs-schemes.c
+++ b/mm/damon/sysfs-schemes.c
@@ -1079,6 +1079,14 @@ struct damos_sysfs_qgoal_metric_name damos_sysfs_qgoal_metric_names[] = {
 		.metric = DAMOS_QUOTA_NODE_MEMCG_FREE_BP,
 		.name = "node_memcg_free_bp",
 	},
+	{
+		.metric = DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP,
+		.name = "node_eligible_mem_bp",
+	},
+	{
+		.metric = DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP,
+		.name = "node_ineligible_mem_bp",
+	},
 	{
 		.metric = DAMOS_QUOTA_ACTIVE_MEM_BP,
 		.name = "active_mem_bp",
@@ -2669,6 +2677,8 @@ static int damos_sysfs_add_quota_score(
 			break;
 		case DAMOS_QUOTA_NODE_MEM_USED_BP:
 		case DAMOS_QUOTA_NODE_MEM_FREE_BP:
+		case DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP:
+		case DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP:
 			goal->nid = sysfs_goal->nid;
 			break;
 		case DAMOS_QUOTA_NODE_MEMCG_USED_BP:
-- 
2.43.0


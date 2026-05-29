Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BEC3FD12B
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 16:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073823; cv=none; b=p5K0zxAmbAeJHrLSlPg4REpXsSNZBQY4MOb46DkFZulliHdmPYwnuqt3NFIfU3lBDjuhK8PAsMA6sa7hjBGjx92DK7F8rpSmA+Cp+qL0K5WS9PH9MZJKyzO1PYaoXcJZB295QJvY6/xyr0LlKmyt2LB/SaMeLSGnGQFn+hBbXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073823; c=relaxed/simple;
	bh=/WB7DhhL0YPzVpIXGI8fiP8eIBsrpdAk77Iyd16ISAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U64IFm2WHHHIEHdzQ1/oXv+jYvdxE36RLa7LlumH9d+rqd0kTEEf6aGedlzIGCo8naiBrX9M91fli28CyA5hiwFFlwpYlDXfD/5YFG5c6Nj22V5B9//oaUCqFUskJXVdTgLhoydR/0GHIILkqpRDNxOzFxzjorBOOcu7+fZ+QRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slwewJ/Z; arc=none smtp.client-ip=209.85.160.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slwewJ/Z"
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-43b53f048beso6107046fac.1
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073820; x=1780678620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBG7U8aH1ARs37G3HmZz4dhZEB7morx48iJcdEwFffY=;
        b=slwewJ/Z7Tqj/w/HntFTl1PBI2hdLNI9vCtGlPAizJONGnE3yMK/xXF/nOMwOlUIIY
         mBrXfuE5v6zHpxyfHlOEw14SjbqAOvFUJGyoegFZBVfzzWD/cN4/jpJd0SlRzH34Hjbj
         6ntx6wt+F91kksvL302QMdECdhomtnViRco2Eaq44vuiCxbgLsFhXBuwmPGwDzeVTXGr
         tebWzir/U3s/9aQgFMvZodtxAdG9ZbDyRL6cDRsk5yk4kcmO1Y0mLj08K8Xi0Eq1W+kJ
         suTMFjD5lcZnCtvFOUI+wZQld4mTRcNdoad50KwU8d7RKAyDKJsxrrVLz2jkaJos2Ats
         nt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073820; x=1780678620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vBG7U8aH1ARs37G3HmZz4dhZEB7morx48iJcdEwFffY=;
        b=HsSSQSU0KtWzeYvhXhtDb1Gu+IwmnymN2+47PelML/rhUI/kcgROvZbxbnZ+4pZd2R
         ELP83kekievX5Qn+PenZfDsz8ZZjRw/UAQK1FlfvGHhOuRX2cPTG2YLSIwJp5TnVInEK
         6GxkqoAzlz9DjWSjNfp8eR7tJlL8kT6Jhnidfqt0cKrbP0eGvmyiaNwvXws3nPKsB7ex
         P/oob7M47dqolA/4cZ75yPu91gvIdvbK9Sk129oVcyzevHwOkH6TvXVqbjI4QwTF3gPd
         zC2p307IKRifCV85P5Wy+5to6lb8bDXFcMuPs8o1g3lO5Ljm9qqLXgD/gywiqHpSCPzK
         +3Jg==
X-Forwarded-Encrypted: i=1; AFNElJ9Jeju4uznIUwxZxCG5+586IIrr9k+lgCzLIAmoroD3mjOoQwv1t48vbl8b1ji6tyairisclGLz0A0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPiCKCuD/aoS0ASgvjVcr2BjUWlvzoeYYUHtXQmAgTASR4zhHM
	woTT43tVQI3vJmJSW63oXpYUOnTml6oMo1CNZpuWKWy903nbjrgxakk=
X-Gm-Gg: Acq92OH0yL5wmA6k6mdpsAktvDTBk9PG2A4E2dvUzk+wI0WrqLQXVclIM9dQSlFGyf/
	xq6nCVIe24BkWRUCeSHtrX3sf7i7NPoLmgJ4OVyEpDZEirdZQFqtJQ2kTWHyh6NCDlAVV6hRtJ6
	FqRFz5vWw0HUEethTwVbrQ9WrTsNDiq7CDGjQMoU6fvmq4uX0LfLWusTIi2IPKLMbRiH5CQs/+G
	zkJqeTXMeWecERUOMRcbh9Uv9aBhlxTSG5kf4Zs6OKoaLlAFgfQVKD4Hi7bJvpqCZKiNDto+fem
	1OucJTHWzo1pjjldEk+3fTrQcCE/WQLxBN1vWilvE04hFlc5lcbTUf/Xmj5LdYO993IA1HQr36i
	8m/jaigcW4Plf+95Drj/oKlcgnUX6AwiNYhR8k5PRfZknJ7BkrIXqsA7unakdm8H42x1YnqotdG
	k/wQEp9sXdTPiMiGgFhi0kGXW5aU/A9hizcUmKO4cvlr89aNvJDSX9SKxYrr9LkFtTzHpL+li/a
	CiCRuLlHQuy
X-Received: by 2002:a05:6871:890:b0:423:4260:2e0d with SMTP id 586e51a60fabf-43c891e473cmr1659989fac.8.1780073820507;
        Fri, 29 May 2026 09:57:00 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43c93ef3ad7sm1403070fac.9.2026.05.29.09.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 09:57:00 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	akinobu.mita@gmail.com,
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
Subject: [RFC PATCH 1/6] mm/damon: add struct damon_perf_event{,_attr} and per-ctx perf_events list
Date: Fri, 29 May 2026 09:56:35 -0700
Message-ID: <20260529165640.820-2-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529165640.820-1-ravis.opensrc@gmail.com>
References: <20260529165640.820-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the substrate types for using perf events as DAMON access
check sources.  struct damon_perf_event_attr carries the raw PMU attr
configurable from userspace; struct damon_perf_event is the per-event
entry on a new damon_ctx::perf_events list.

Declare damon_perf_init() and damon_perf_cleanup() in
mm/damon/ops-common.h.  When CONFIG_PERF_EVENTS=n they fold to a no-op
returning -ENOSYS.

Suggested-by: Akinobu Mita <akinobu.mita@gmail.com>
Link: https://lore.kernel.org/20260423004211.7037-1-akinobu.mita@gmail.com
Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/linux/damon.h   | 80 +++++++++++++++++++++++++++++++++++++++++
 mm/damon/ops-common.h   | 39 ++++++++++++++++++++
 mm/damon/sysfs-common.h |  6 ++++
 3 files changed, 125 insertions(+)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index c0375035a3a7b..11f1c1071b9ba 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -123,6 +123,7 @@ struct damon_target {
  * @size:		The size of the accessed address range.
  * @cpu:		The id of the CPU that made the access.
  * @tid:		The task id of the task that made the access.
+ * @tgid:		Thread group id of the task that made the access.
  * @is_write:		Whether the access is write.
  *
  * Any DAMON API callers that notified access events can report the information
@@ -135,6 +136,7 @@ struct damon_access_report {
 	unsigned long size;
 	unsigned int cpu;
 	pid_t tid;
+	pid_t tgid;
 	bool is_write;
 /* private: */
 	unsigned long report_jiffies;	/* when this report is made */
@@ -501,6 +503,7 @@ struct damos_filter {
 };
 
 struct damon_ctx;
+struct damon_target_lookup;
 struct damos;
 
 /**
@@ -966,6 +969,67 @@ struct damon_sample_control {
 	struct list_head sample_filters;
 };
 
+/**
+ * struct damon_perf_event_attr - raw PMU event attr for access check.
+ *
+ * @type:		raw PMU event type.
+ * @config:		raw PMU event config.
+ * @config1:		raw PMU event config1.
+ * @config2:		raw PMU event config2.
+ * @sample_phys_addr:	whether to set PERF_SAMPLE_PHYS_ADDR in sample_type.
+ * @sample_weight_struct:	whether to set PERF_SAMPLE_WEIGHT_STRUCT in
+ *				sample_type.  PMUs that do not advertise
+ *				weight (e.g. AMD IBS Op) reject events with
+ *				this flag set, so it must be opt-in.
+ * @exclude_kernel:	exclude kernel-mode samples.
+ * @exclude_hv:		exclude hypervisor samples.
+ * @freq:		when true use @sample_freq, otherwise @sample_period.
+ * @sample_freq:	target sample rate when @freq is true.
+ * @sample_period:	period (samples-between-overflows) when @freq is false.
+ * @wakeup_events:	perf_event_attr.wakeup_events.
+ * @precise_ip:		precise sampling skid bound (PEBS-style PMUs).
+ */
+struct damon_perf_event_attr {
+	u32 type;
+	u64 config;
+	u64 config1;
+	u64 config2;
+	bool sample_phys_addr;
+	bool sample_weight_struct;
+	bool exclude_kernel;
+	bool exclude_hv;
+	bool freq;
+	u64 sample_freq;
+	u64 sample_period;
+	u32 wakeup_events;
+	u32 precise_ip;
+};
+
+/**
+ * struct damon_perf_event - perf event for access check.
+ *
+ * @attr:	Per-event PMU attribute (configured via sysfs).
+ * @priv:	Monitoring operations-specific data.
+ * @list:	List head for &damon_ctx->perf_events siblings.
+ * @hlist_node:	Tracks this event among cpuhp multi-instance entries.
+ * @init_complete:	Set after the synchronous online sweep finishes; gates
+ *		@any_cpu_failed writes from late hotplug callbacks.
+ * @any_cpu_failed:	Set by the cpuhp online callback if perf_event creation
+ *		fails on any CPU during the synchronous initial install.
+ * @ctx:	Back-pointer to the owning damon_ctx; the cpu_online callback
+ *		reads ctx->perf_events_active to decide whether to enable a
+ *		late-onlining CPU's event immediately after create.
+ */
+struct damon_perf_event {
+	struct damon_perf_event_attr attr;
+	void *priv;
+	struct list_head list;
+	struct hlist_node hlist_node;
+	bool init_complete;
+	bool any_cpu_failed;
+	struct damon_ctx *ctx;
+};
+
 /**
  * struct damon_ctx - Represents a context for each monitoring.  This is the
  * main interface that allows users to set the attributes and get the results
@@ -991,6 +1055,11 @@ struct damon_sample_control {
  * @addr_unit:	Scale factor for core to ops address conversion.
  * @min_region_sz:	Minimum region size.
  * @pause:	Pause kdamond main loop.
+ * @perf_events:	Head of perf events (&damon_perf_event) list.
+ * @perf_events_active:	Set while kdamond_fn has the perf events armed.
+ *		Cleared in the kdamond_fn done path before the events are
+ *		disabled; serves as the gate for damon_commit_perf_events()
+ *		and the kdamond_fn drain dispatch.
  */
 struct damon_ctx {
 	struct damon_attrs attrs;
@@ -1046,6 +1115,9 @@ struct damon_ctx {
 	unsigned long min_region_sz;
 	bool pause;
 
+	struct list_head perf_events;
+	bool perf_events_active;
+
 /* private: */
 	/* Head of monitoring targets (&damon_target) list. */
 	struct list_head adaptive_targets;
@@ -1054,6 +1126,14 @@ struct damon_ctx {
 
 	/* Per-ctx PRNG state for damon_rand(); kdamond is the sole consumer. */
 	struct rnd_state rnd_state;
+
+	/* Reusable drain-loop snapshot buffer (avoids per-tick kmalloc). */
+	struct {
+		struct damon_target_lookup *lookups;
+		unsigned int nr_lookups;
+		struct damon_region **region_buf;
+		unsigned int region_buf_cap;
+	} drain_snapshot;
 };
 
 /* Get a random number in [@l, @r) using @ctx's lockless PRNG. */
diff --git a/mm/damon/ops-common.h b/mm/damon/ops-common.h
index 5efa5b5970def..35da400a67ec1 100644
--- a/mm/damon/ops-common.h
+++ b/mm/damon/ops-common.h
@@ -23,3 +23,42 @@ bool damos_folio_filter_match(struct damos_filter *filter, struct folio *folio);
 unsigned long damon_migrate_pages(struct list_head *folio_list, int target_nid);
 
 bool damos_ops_has_filter(struct damos *s);
+
+#ifdef CONFIG_PERF_EVENTS
+
+/*
+ * Per-event opaque allocated by damon_perf_init().  The NMI overflow
+ * handler does NOT touch this struct; submission goes through the
+ * shared per-CPU SPSC ring via damon_report_access().
+ */
+struct damon_perf {
+	struct perf_event * __percpu *event;
+};
+
+int damon_perf_init(struct damon_ctx *ctx, struct damon_perf_event *event);
+void damon_perf_cleanup(struct damon_ctx *ctx, struct damon_perf_event *event);
+void damon_perf_event_arm(struct damon_perf_event *event);
+void damon_perf_event_disarm(struct damon_perf_event *event);
+
+#else /* !CONFIG_PERF_EVENTS */
+
+static inline int damon_perf_init(struct damon_ctx *ctx,
+		struct damon_perf_event *event)
+{
+	return -ENOSYS;
+}
+
+static inline void damon_perf_cleanup(struct damon_ctx *ctx,
+		struct damon_perf_event *event)
+{
+}
+
+static inline void damon_perf_event_arm(struct damon_perf_event *event)
+{
+}
+
+static inline void damon_perf_event_disarm(struct damon_perf_event *event)
+{
+}
+
+#endif /* CONFIG_PERF_EVENTS */
diff --git a/mm/damon/sysfs-common.h b/mm/damon/sysfs-common.h
index 25a6c28abdea8..67c7545fd57d0 100644
--- a/mm/damon/sysfs-common.h
+++ b/mm/damon/sysfs-common.h
@@ -66,10 +66,13 @@ int damon_sysfs_memcg_path_to_id(char *memcg_path, u64 *id);
  * sample directory
  */
 
+struct damon_sysfs_perf_events;
+
 struct damon_sysfs_sample {
 	struct kobject kobj;
 	struct damon_sysfs_primitives *primitives;
 	struct damon_sysfs_sample_filters *filters;
+	struct damon_sysfs_perf_events *perf_events;
 };
 
 struct damon_sysfs_sample *damon_sysfs_sample_alloc(void);
@@ -82,3 +85,6 @@ extern const struct kobj_type damon_sysfs_sample_ktype;
 int damon_sysfs_set_sample_control(
 		struct damon_sample_control *control,
 		struct damon_sysfs_sample *sysfs_sample);
+
+int damon_sysfs_add_perf_events(struct damon_ctx *ctx,
+		struct damon_sysfs_sample *sysfs_sample);
-- 
2.43.0


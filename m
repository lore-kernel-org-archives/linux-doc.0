Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1702B3F9F2A
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073834; cv=none; b=toSgABPlGbO2tWUgFa6PKWd8z1+Y759xBf/3Bob87yo3jWkfg3ZyBAw4cVMgv7PrcOqsrdj5qCYzC3muErEdoKRjddxQhM2vthsrieEma8HyEVlwWxHpCK7UqsQbgf4qKlPuf4YiJPNRvoQRTdEuWE2Z65uChGQmxRVsxJ2EgKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073834; c=relaxed/simple;
	bh=iJHlTclTdvNVeqZJEsJKgPnybNHRC79ZU9HKHQ39RSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GuKigaEkjSEEtfAhuBraYkn8EwtLRdg89uG0iyKYMRvcOwN6PfRgjbyvEh9W+4rPzsBFg73my/2Q12Auo7UDQx1S+2aKEvR8Zkx3yBaXTNYOgIWBgnn+znKP3KjP1yuyPg5/im5RgPfLYB2qevVnWA1puiUHGGZ2x5baPoLLI1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwdB2iI5; arc=none smtp.client-ip=209.85.210.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwdB2iI5"
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7e582b3bcaaso11907605a34.3
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073830; x=1780678630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4H/yIMAbtX2q0bElVklgb86re8LM0PVikJCfYxPTsWQ=;
        b=lwdB2iI5TL9TUe8OqODPM8cInaftzcz3ZVLEkCjp5BupyXIRVddkjeFPMKSOkY0QGB
         2HZueq0GSsRU/PCdt5f9XgXTXDKHBk4OOrMl6DS3hPGInGsAw7p3S1NmVoL4oIzJJZau
         dmCF1eB/NrfJLiju3OFOzi8nMfh1Azowhczv7tM4xCHLlipKDb+AMF4JqaMfT5R4T5Lp
         xAixJeaOijRXiMEHuKh/w2AgiElTgOdzfX10rL4ujFiEoL79uJgSAwqL71s9VAiUd0Hh
         4E8Lp86bXKP23+76aDfaf3rDcwGSX4V0xQVCKmNiciX9jfcQU/m6O5eOlbDDI/7s1KTu
         EAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073830; x=1780678630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4H/yIMAbtX2q0bElVklgb86re8LM0PVikJCfYxPTsWQ=;
        b=QwHh1kVc4AUzVgvEVAtIyum60qBeibJ2AK1K/q3WGK9u5jgxzpdOPGfIKP5aIMlsyX
         EJJrXYGkNobSvUOU/A9THtTeDrZ9nxNvjHJCpPNoY+7F4XN9MOh8pQcsDetNnM7fhsaR
         Mbcanx5ywfp0SrpyIscLc8j+RRBATqaCGmesfDzVY4fk5GifonsVE+dMZBgpK5uXlCy5
         M94s02ZxsljXJP62x06yB/Y2gAG3kI9nklOZycBCJZmMwi3E14tT9AWepDd8S1To9qjW
         PiXLvSd/RpBRMkpADtdBdKETGIy6HYX1hASiuJO3wyjcn4QBnyNSEV6jxsnDYngpnf7T
         IVtA==
X-Forwarded-Encrypted: i=1; AFNElJ8vASZ4Uyi/DT8fZTNci9O1PGWJ+I33L+c06eIPeIV12KXPgJsaJx+F2Pq9FhrdD0w2NpN28WZnvoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YykISB+fdYiBiVKDfIJx4MFvZQjgfW0EhDm6fnBDNoI4WyXeulA
	MlnE4wL4IDp3hyuAo/0EfLICDP4SsWQxIEyF+/x0I0Oys7cspgj/ea7d5IWUB+NonQ==
X-Gm-Gg: Acq92OHt8P4exEtaBZ+VRPxN4aA5c+YQ2nwTLzXB+H14x5Lha3gO/BSEp6mMFp+KFQQ
	0qw3uoAbXALgxwvKXNt27rR7hcD6Y6302BLjD6tDGy/d7+Pu8sZ1NqD0ZBM7bcn/pXtHdIbaagf
	ft0XCuxPlGgtRwym4yrCrXNSQWTVixZpwZ86AqfgDU2ndQv1zFxvvx8Av6uuZuUFkAzwH3LwJfa
	6t+5Za4HXtmWdseeW+6gWKS2Zw0B9Za2EHsVo7HE79UQCMMvSApIxBTZWf2DNLQHpdk6w13/NaP
	0G4hw/+gJNqNMHUnYeJkJ+tz2fEICZbwczlkkZ+c5MKBbDRz24ujQ7xp5YqvjZAQFWcRefK5hGb
	sNLH9FNxWKMA7xzRxwlpYqBo8KpqYxJjDpbJi5naMhsts0I2IdOR+G3aJxgLibbftuEOp7/Dixq
	xXmfw8JBbGTMxOYTCsiwDASY51q6i2qXBjyaQTTknB0Zsn0y3Ih93Z81AALAEV4MozTVqj/x5K/
	+2k1KRoDbhj
X-Received: by 2002:a05:6830:348a:b0:7dc:cd0b:58ba with SMTP id 46e09a7af769-7e6a1d33c27mr359547a34.4.1780073830039;
        Fri, 29 May 2026 09:57:10 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695da86e1sm1785786a34.27.2026.05.29.09.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 09:57:09 -0700 (PDT)
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
Subject: [RFC PATCH 5/6] mm/damon/vaddr: implement perf-event access check
Date: Fri, 29 May 2026 09:56:39 -0700
Message-ID: <20260529165640.820-6-ravis.opensrc@gmail.com>
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

Add the perf-event backend used by the substrate.  Two stateless NMI
overflow handlers are picked at perf_event_create_kernel_counter()
time (paddr- vs vaddr-keyed) and called with context = NULL, so the
NMI fast path never dereferences the per-event struct.  Each submits
a damon_access_report into the per-CPU ring.

The vaddr handler drops samples with addr == 0 or addr >= TASK_SIZE.
The paddr handler gates on data->sample_flags & PERF_SAMPLE_PHYS_ADDR
rather than testing data->phys_addr for zero (which would also drop
legitimate page 0).  AMD IBS Op only populates phys_addr when
IBS_OP_DATA3.dc_phy_addr_valid is set; gating on sample_flags is the
documented way to detect that.  is_write is derived from
data->data_src.mem_op.

cpuhp_setup_state_multi() registers one global state at subsys_initcall;
each damon_perf_event is added as an instance in damon_perf_init() so
cpuhp drives per-CPU event creation and offline-time release.  Events
are created with disabled=1 and armed by kdamond_fn() when the
substrate is ready; per-CPU init failures are surfaced via
init_complete / any_cpu_failed so damon_perf_init() rolls back the
cpuhp instance instead of leaving a half-armed event behind.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/vaddr.c | 267 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index d271476035641..73fcea91afa07 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -7,11 +7,13 @@
 
 #define pr_fmt(fmt) "damon-va: " fmt
 
+#include <linux/cpuhotplug.h>
 #include <linux/highmem.h>
 #include <linux/hugetlb.h>
 #include <linux/mman.h>
 #include <linux/mmu_notifier.h>
 #include <linux/page_idle.h>
+#include <linux/perf_event.h>
 #include <linux/pagewalk.h>
 #include <linux/sched/mm.h>
 
@@ -957,6 +959,263 @@ static int damon_va_scheme_score(struct damon_ctx *context,
 	return DAMOS_MAX_SCORE;
 }
 
+#ifdef CONFIG_PERF_EVENTS
+
+#define DAMON_PERF_MAX_RECORDS	(1UL << 20)
+#define DAMON_PERF_INIT_RECORDS	(1UL << 15)
+
+/*
+ * NMI hot-path: avoid every heap dereference.  These handlers carry no
+ * pointer back to the per-event struct -- perf_event_create_kernel_counter
+ * is called with context = NULL.  Submission flows into the global
+ * per-CPU SPSC ring (damon_report_access -> kdamond_check_reported_accesses
+ * drains).
+ */
+static void damon_perf_overflow_vaddr(struct perf_event *perf_event,
+		struct perf_sample_data *data, struct pt_regs *regs)
+{
+	struct damon_access_report report;
+
+	if (!data || !data->addr)
+		return;
+
+	/* Drop kernel-VA hits -- only user-space VAs land in damon vaddr regions. */
+	if (data->addr >= TASK_SIZE)
+		return;
+
+	report = (struct damon_access_report){
+		.vaddr = data->addr & PAGE_MASK,
+		.size = PAGE_SIZE,
+		.cpu = smp_processor_id(),
+		.tid = current->pid,
+		.tgid = current->tgid,
+		.is_write = !!(data->data_src.mem_op & PERF_MEM_OP_STORE),
+	};
+	damon_report_access(&report);
+}
+
+static void damon_perf_overflow_paddr(struct perf_event *perf_event,
+		struct perf_sample_data *data, struct pt_regs *regs)
+{
+	struct damon_access_report report;
+
+	if (!data)
+		return;
+
+	/*
+	 * AMD IBS Op only populates data->phys_addr when
+	 * IBS_OP_DATA3.dc_phy_addr_valid is set; otherwise the field
+	 * carries a stale value.  Gate on sample_flags rather than testing
+	 * phys_addr for zero (which would also drop legitimate page 0).
+	 */
+	if (!(data->sample_flags & PERF_SAMPLE_PHYS_ADDR))
+		return;
+
+	report = (struct damon_access_report){
+		.paddr = data->phys_addr & PAGE_MASK,
+		.size = PAGE_SIZE,
+		.cpu = smp_processor_id(),
+		.is_write = !!(data->data_src.mem_op & PERF_MEM_OP_STORE),
+	};
+	damon_report_access(&report);
+}
+
+static enum cpuhp_state damon_perf_cpuhp_state;
+
+static void damon_perf_event_init_attr(struct damon_perf_event *event,
+		struct perf_event_attr *attr)
+{
+	*attr = (struct perf_event_attr) {
+		.size = sizeof(*attr),
+		.type = event->attr.type,
+		.config = event->attr.config,
+		.config1 = event->attr.config1,
+		.config2 = event->attr.config2,
+		.freq = event->attr.freq,
+		.sample_type = PERF_SAMPLE_TIME | PERF_SAMPLE_ADDR |
+			PERF_SAMPLE_PERIOD | PERF_SAMPLE_DATA_SRC |
+			(event->attr.sample_phys_addr ?
+				PERF_SAMPLE_PHYS_ADDR : 0) |
+			(event->attr.sample_weight_struct ?
+				PERF_SAMPLE_WEIGHT_STRUCT : 0),
+		.precise_ip = event->attr.precise_ip,
+		.pinned = 1,
+		.disabled = 1,
+		.wakeup_events = event->attr.wakeup_events,
+		.exclude_kernel = event->attr.exclude_kernel,
+		.exclude_hv = event->attr.exclude_hv,
+	};
+
+	/*
+	 * sample_period and sample_freq share storage in the kernel
+	 * perf_event_attr (union).  Select based on the freq toggle so
+	 * frequency-based callers (PEBS) and period-based callers
+	 * (AMD IBS Op MaxCnt) both work correctly.
+	 */
+	if (event->attr.freq)
+		attr->sample_freq = event->attr.sample_freq;
+	else
+		attr->sample_period = event->attr.sample_period;
+}
+
+static int damon_perf_cpu_online(unsigned int cpu, struct hlist_node *node)
+{
+	struct damon_perf_event *event = hlist_entry(node,
+			struct damon_perf_event, hlist_node);
+	struct damon_perf *perf = event->priv;
+	struct perf_event_attr attr;
+	struct perf_event *perf_event;
+	perf_overflow_handler_t handler;
+
+	if (!perf)
+		return 0;
+
+	damon_perf_event_init_attr(event, &attr);
+
+	/*
+	 * Pick a paddr- or vaddr-specific handler at create time so the
+	 * NMI fast path is statically branched.  Pass NULL as context --
+	 * handlers are stateless wrt the per-event struct, so the NMI
+	 * fast path performs no per-event heap dereference.  Submission
+	 * flows into the global per-CPU SPSC ring via damon_report_access().
+	 */
+	handler = event->attr.sample_phys_addr ?
+		damon_perf_overflow_paddr : damon_perf_overflow_vaddr;
+
+	perf_event = perf_event_create_kernel_counter(&attr, cpu, NULL,
+			handler, NULL);
+	if (IS_ERR(perf_event)) {
+		pr_warn_ratelimited("damon-perf: cpu %u event create failed: %ld\n",
+				cpu, PTR_ERR(perf_event));
+		if (!event->init_complete)
+			event->any_cpu_failed = true;
+		return 0;	/* never block CPU online */
+	}
+	*per_cpu_ptr(perf->event, cpu) = perf_event;
+	/*
+	 * Late-online CPU after the substrate is armed: events are created
+	 * with attr.disabled = 1 and would otherwise stay quiescent on this
+	 * CPU until the next arm walk.  Enable here so coverage matches the
+	 * already-online CPUs.
+	 */
+	if (event->ctx && READ_ONCE(event->ctx->perf_events_active))
+		perf_event_enable(perf_event);
+	return 0;
+}
+
+static int damon_perf_cpu_offline(unsigned int cpu, struct hlist_node *node)
+{
+	struct damon_perf_event *event = hlist_entry(node,
+			struct damon_perf_event, hlist_node);
+	struct damon_perf *perf = event->priv;
+	struct perf_event *perf_event;
+
+	if (!perf)
+		return 0;
+
+	perf_event = per_cpu(*perf->event, cpu);
+	if (perf_event) {
+		perf_event_disable(perf_event);
+		perf_event_release_kernel(perf_event);
+		*per_cpu_ptr(perf->event, cpu) = NULL;
+	}
+	return 0;
+}
+
+void damon_perf_event_arm(struct damon_perf_event *event)
+{
+	struct damon_perf *perf = event->priv;
+	struct perf_event *perf_event;
+	int cpu;
+
+	if (!perf)
+		return;
+
+	for_each_online_cpu(cpu) {
+		perf_event = *per_cpu_ptr(perf->event, cpu);
+		if (perf_event)
+			perf_event_enable(perf_event);
+	}
+}
+
+void damon_perf_event_disarm(struct damon_perf_event *event)
+{
+	struct damon_perf *perf = event->priv;
+	struct perf_event *perf_event;
+	int cpu;
+
+	if (!perf)
+		return;
+
+	for_each_online_cpu(cpu) {
+		perf_event = *per_cpu_ptr(perf->event, cpu);
+		if (perf_event)
+			perf_event_disable(perf_event);
+	}
+}
+
+int damon_perf_init(struct damon_ctx *ctx, struct damon_perf_event *event)
+{
+	struct damon_perf *perf;
+	int err = -ENOMEM;
+
+	perf = kzalloc(sizeof(*perf), GFP_KERNEL);
+	if (!perf)
+		return -ENOMEM;
+
+	perf->event = alloc_percpu(typeof(*perf->event));
+	if (!perf->event)
+		goto free_perf;
+
+	event->priv = perf;
+	event->ctx = ctx;
+	INIT_HLIST_NODE(&event->hlist_node);
+
+	/*
+	 * cpuhp_state_add_instance() invokes the online callback synchronously
+	 * for every currently-online CPU; late-online CPUs subsequently get
+	 * an event automatically and offline CPUs release theirs cleanly.
+	 */
+	err = cpuhp_state_add_instance(damon_perf_cpuhp_state,
+			&event->hlist_node);
+	if (err)
+		goto free_event;
+
+	event->init_complete = true;
+	if (event->any_cpu_failed) {
+		cpuhp_state_remove_instance(damon_perf_cpuhp_state,
+				&event->hlist_node);
+		err = -ENODEV;
+		goto free_event;
+	}
+
+	return 0;
+
+free_event:
+	free_percpu(perf->event);
+free_perf:
+	kfree(perf);
+	event->priv = NULL;
+	return err;
+}
+
+void damon_perf_cleanup(struct damon_ctx *ctx, struct damon_perf_event *event)
+{
+	struct damon_perf *perf = event->priv;
+
+	if (!perf)
+		return;
+
+	cpuhp_state_remove_instance(damon_perf_cpuhp_state,
+			&event->hlist_node);
+
+	free_percpu(perf->event);
+	kfree(perf);
+	event->priv = NULL;
+}
+
+#endif /* CONFIG_PERF_EVENTS */
+
 static int __init damon_va_initcall(void)
 {
 	struct damon_operations ops = {
@@ -979,6 +1238,14 @@ static int __init damon_va_initcall(void)
 	ops_fvaddr.init = NULL;
 	ops_fvaddr.update = NULL;
 
+#ifdef CONFIG_PERF_EVENTS
+	err = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "damon/perf:online",
+			damon_perf_cpu_online, damon_perf_cpu_offline);
+	if (err < 0)
+		return err;
+	damon_perf_cpuhp_state = err;
+#endif
+
 	err = damon_register_ops(&ops);
 	if (err)
 		return err;
-- 
2.43.0


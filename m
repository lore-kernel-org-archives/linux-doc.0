Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3742AC64ED8
	for <linux-doc@archiver.kernel.org>; Fri, 24 Feb 2023 09:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjBXJfD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Feb 2023 04:35:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjBXJfC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 04:35:02 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712614DBCA
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 01:35:00 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id k37so7991045wms.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 01:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRK9CVl+wp5UA9FM0KiXaS6Hv0eR7fUWtXzYt4onYBI=;
        b=aeaP+8GpSlBrTz0Ck22w37L8jNZXuLY7XzqRiV7TMNqQIraO8lIsG2uI0QxBG6sYSO
         YaCzS2VTd72to5fFRzTyrxDRqfVmkG/1xLZcqcTROHtnd8QziUlJZ5/GaA2l7chieDrd
         KfMNbvgA/KZbYLoZm5v/8oLyQRhmDC3fLmX8ke34ZZYBBq3ouVuLw2JMfGK4874hBrwh
         5dCJ9xvzrd4k/tpGfHGW/dtUoljWWPlVPVbZkJ0YWxdbO7l3KaAj44H76grIkeXb7Z6/
         0Z0Z3UcS8m81iXcoxjO2GXo0rqHYT6GPKb1TvBOGozY192erQKt1rLmS3DMx/G7T+JYp
         2oTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRK9CVl+wp5UA9FM0KiXaS6Hv0eR7fUWtXzYt4onYBI=;
        b=VdKjXsX5tswrWSB80de6kYuBDecpF5QfVVKGIID42Fq5SWNSdrPyumu7KO0JQ72my6
         ZyX3gtERp2LXE0ygMBviJ9V137fiXaJm/lbY4avpCADjuHUUszGLzYaQ9vb53l7sRSeI
         6iDxhfpMRgFa3Ee4QP29oZtv0t4PBcICGFtVpTpTcAVQ3aJ5VHFOjIFNd3HX+kZyk8J1
         VS0PimFH2fcOxu3VMPe5Qo25qZxE13R3HrIIvyQd3VwhrlIkvag+B+NcQIjuSt6EUSO+
         14PzKZhp9DSg3XpKGAO+ECjPojbEyBLLyQzWmb7eyoAMJqJKArJ2nHhzkry+3AwrouXV
         iWWA==
X-Gm-Message-State: AO0yUKUi49yg/KI630mFyyMAXf89YQQGpEZV97vZbxhJjiYtj5E0P90Q
        lJZNoYQi1xmV4IcPGxXInhJ9VA==
X-Google-Smtp-Source: AK7set9DycGihbQVhmIuKxV5lUboLORFf6uAPRS3MjcVUD/x5O8KbgCF5jxbi78SslZbJP7ODFOttQ==
X-Received: by 2002:a05:600c:4aaa:b0:3ea:f710:bdad with SMTP id b42-20020a05600c4aaa00b003eaf710bdadmr1899360wmp.29.1677231298788;
        Fri, 24 Feb 2023 01:34:58 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:a6f0:4ee9:c103:44cb])
        by smtp.gmail.com with ESMTPSA id d18-20020a05600c34d200b003e6dcd562a6sm2239179wmq.28.2023.02.24.01.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 01:34:58 -0800 (PST)
From:   Vincent Guittot <vincent.guittot@linaro.org>
To:     mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
        linux-kernel@vger.kernel.org, parth@linux.ibm.com, tj@kernel.org,
        lizefan.x@bytedance.com, hannes@cmpxchg.org,
        cgroups@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     qyousef@layalina.io, chris.hyser@oracle.com,
        patrick.bellasi@matbug.net, David.Laight@aculab.com,
        pjt@google.com, pavel@ucw.cz, qperret@google.com,
        tim.c.chen@linux.intel.com, joshdon@google.com, timj@gnu.org,
        kprateek.nayak@amd.com, yu.c.chen@intel.com,
        youssefesmat@chromium.org, joel@joelfernandes.org,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v12 1/8] sched/fair: fix unfairness at wakeup
Date:   Fri, 24 Feb 2023 10:34:47 +0100
Message-Id: <20230224093454.956298-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224093454.956298-1-vincent.guittot@linaro.org>
References: <20230224093454.956298-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

At wake up, the vruntime of a task is updated to not be more older than
a sched_latency period behind the min_vruntime. This prevents long sleeping
task to get unlimited credit at wakeup.
Such waking task should preempt current one to use its CPU bandwidth but
wakeup_gran() can be larger than sched_latency, filter out the
wakeup preemption and as a results steals some CPU bandwidth to
the waking task.

Make sure that a task, which vruntime has been capped, will preempt current
task and use its CPU bandwidth even if wakeup_gran() is in the same range
as sched_latency.

If the waking task failed to preempt current it could to wait up to
sysctl_sched_min_granularity before preempting it during next tick.

Strictly speaking, we should use cfs->min_vruntime instead of
curr->vruntime but it doesn't worth the additional overhead and complexity
as the vruntime of current should be close to min_vruntime if not equal.

Reported-by: Youssef Esmat <youssefesmat@chromium.org>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 kernel/sched/fair.c  | 46 ++++++++++++++++++++------------------------
 kernel/sched/sched.h | 34 +++++++++++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 26 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ff4dbbae3b10..81bef11eb660 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4654,33 +4654,17 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int initial)
 	u64 vruntime = cfs_rq->min_vruntime;
 	u64 sleep_time;
 
-	/*
-	 * The 'current' period is already promised to the current tasks,
-	 * however the extra weight of the new task will slow them down a
-	 * little, place the new task so that it fits in the slot that
-	 * stays open at the end.
-	 */
-	if (initial && sched_feat(START_DEBIT))
-		vruntime += sched_vslice(cfs_rq, se);
-
-	/* sleeps up to a single latency don't count. */
-	if (!initial) {
-		unsigned long thresh;
-
-		if (se_is_idle(se))
-			thresh = sysctl_sched_min_granularity;
-		else
-			thresh = sysctl_sched_latency;
-
+	if (!initial)
+		/* sleeps up to a single latency don't count. */
+		vruntime -= get_sleep_latency(se_is_idle(se));
+	else if (sched_feat(START_DEBIT))
 		/*
-		 * Halve their sleep time's effect, to allow
-		 * for a gentler effect of sleepers:
+		 * The 'current' period is already promised to the current tasks,
+		 * however the extra weight of the new task will slow them down a
+		 * little, place the new task so that it fits in the slot that
+		 * stays open at the end.
 		 */
-		if (sched_feat(GENTLE_FAIR_SLEEPERS))
-			thresh >>= 1;
-
-		vruntime -= thresh;
-	}
+		vruntime += sched_vslice(cfs_rq, se);
 
 	/*
 	 * Pull vruntime of the entity being placed to the base level of
@@ -7721,6 +7705,18 @@ wakeup_preempt_entity(struct sched_entity *curr, struct sched_entity *se)
 		return -1;
 
 	gran = wakeup_gran(se);
+
+	/*
+	 * At wake up, the vruntime of a task is capped to not be older than
+	 * a sched_latency period compared to min_vruntime. This prevents long
+	 * sleeping task to get unlimited credit at wakeup. Such waking up task
+	 * has to preempt current in order to not lose its share of CPU
+	 * bandwidth but wakeup_gran() can become higher than scheduling period
+	 * for low priority task. Make sure that long sleeping task will get a
+	 * chance to preempt current.
+	 */
+	gran = min_t(s64, gran, get_latency_max());
+
 	if (vdiff > gran)
 		return 1;
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 3e8df6d31c1e..51ba0af7fb27 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2458,9 +2458,9 @@ extern void check_preempt_curr(struct rq *rq, struct task_struct *p, int flags);
 extern const_debug unsigned int sysctl_sched_nr_migrate;
 extern const_debug unsigned int sysctl_sched_migration_cost;
 
-#ifdef CONFIG_SCHED_DEBUG
 extern unsigned int sysctl_sched_latency;
 extern unsigned int sysctl_sched_min_granularity;
+#ifdef CONFIG_SCHED_DEBUG
 extern unsigned int sysctl_sched_idle_min_granularity;
 extern unsigned int sysctl_sched_wakeup_granularity;
 extern int sysctl_resched_latency_warn_ms;
@@ -2475,6 +2475,38 @@ extern unsigned int sysctl_numa_balancing_scan_size;
 extern unsigned int sysctl_numa_balancing_hot_threshold;
 #endif
 
+static inline unsigned long get_sleep_latency(bool idle)
+{
+	unsigned long thresh;
+
+	if (idle)
+		thresh = sysctl_sched_min_granularity;
+	else
+		thresh = sysctl_sched_latency;
+
+	/*
+	 * Halve their sleep time's effect, to allow
+	 * for a gentler effect of sleepers:
+	 */
+	if (sched_feat(GENTLE_FAIR_SLEEPERS))
+		thresh >>= 1;
+
+	return thresh;
+}
+
+static inline unsigned long get_latency_max(void)
+{
+	unsigned long thresh = get_sleep_latency(false);
+
+	 /*
+	  * If the waking task failed to preempt current it could to wait up to
+	  * sysctl_sched_min_granularity before preempting it during next tick.
+	  */
+	thresh -= sysctl_sched_min_granularity;
+
+	return thresh;
+}
+
 #ifdef CONFIG_SCHED_HRTICK
 
 /*
-- 
2.34.1


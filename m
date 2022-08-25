Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C89ECAA25
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 16:45:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243396AbiHYQpr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 12:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243109AbiHYQoy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 12:44:54 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB80BB935
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 09:43:24 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id 72so42247pfx.9
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 09:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SCDBrE7DqDt9xq+C0kDPsH502BlLTLBnNXs8tmzP+NY=;
        b=z3jNNQuRODa4qAdkDO5xjtLZYdFW9dsHq4+6hsYJjgfnqZlcosCtZMH5mtiTAnIrMl
         tNIhMNtFH2g3TJpmzKgVH9Abtb5PFBVQ6ySn2SNfuy2MrAW2L9sYDSeKx7/i6LEH1UvA
         EHl2bWTjm8NBFODHYYTf4g7M9DM4WdvUlothouFxWudcK6Xq2ZhQJd554/pnG/aq7/FT
         r0nMx/vNZr0NT92H1/fpPEJogGw/KOcUIUsfeVfRCVPcwn5B9emhvPz6iFI3UzGiKj12
         f7ZFE7cyaL+ypOFE3jg6Yo73dpdNEdwKaZhiJUy25SJ6CgA67ewIEgRankjpDMC9A8Nc
         LKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SCDBrE7DqDt9xq+C0kDPsH502BlLTLBnNXs8tmzP+NY=;
        b=oCnh5CDUTkNBkEpvxPd6Tp4NFpgT8J44w9q9kXX7+92pAeeYcl8T+dmkG1ukxbSI33
         Tp3uoFkO7nhfo+CYZTaxPCRWGnFYlm27f9wsX48YmqRkAzFijVpRCYL9JZGkx2lIUo2E
         eZQuh+DFpJwO35q9/s+fV/C8MPitlk9AMp7zgwlyucVR58fKwl4fgwdkJHdXcNEyuAN9
         qKO4zY/ANbY5JpKYA9VetSfA/MQNSdGbtocemGzDubk9b1t6xRjR9sIwA3LEOHacfr9y
         EWdw01j9vL7ZmSGVa2PGFUO3GCg0m7yylBIHALjs3IE06mcVT+z3vFxk8rU8thZ6BkWG
         WP3g==
X-Gm-Message-State: ACgBeo3iT12NBqfRzLyUwGv9WBWEGATVgp64pV2AJC/hsC1s7w+w+ju3
        WA26i9Es5jCa2/D+iT5DPdvPGA==
X-Google-Smtp-Source: AA6agR7GcstRQtnknuyZmjkY8b2uwOx782PbEt6POoFc/p+0avW3o0Ygcztz2i+RVzSvhVS8Y5NOMA==
X-Received: by 2002:a05:6a00:23c5:b0:535:5c24:68df with SMTP id g5-20020a056a0023c500b005355c2468dfmr5100776pfc.62.1661445803178;
        Thu, 25 Aug 2022 09:43:23 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id b18-20020a62a112000000b005362314bf80sm12779408pff.67.2022.08.25.09.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 09:43:22 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com,
        surenb@google.com
Cc:     mingo@redhat.com, peterz@infradead.org, gregkh@linuxfoundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH v4 09/10] sched/psi: cache parent psi_group to speed up groups iterate
Date:   Fri, 26 Aug 2022 00:41:10 +0800
Message-Id: <20220825164111.29534-10-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825164111.29534-1-zhouchengming@bytedance.com>
References: <20220825164111.29534-1-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We use iterate_groups() to iterate each level psi_group to update
PSI stats, which is a very hot path.

In current code, iterate_groups() have to use multiple branches and
cgroup_parent() to get parent psi_group for each level, which is not
very efficient.

This patch cache parent psi_group in struct psi_group, only need to get
psi_group of task itself first, then just use group->parent to iterate.

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 include/linux/psi_types.h |  2 ++
 kernel/sched/psi.c        | 49 +++++++++++++++------------------------
 2 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/include/linux/psi_types.h b/include/linux/psi_types.h
index 40c28171cd91..a0b746258c68 100644
--- a/include/linux/psi_types.h
+++ b/include/linux/psi_types.h
@@ -151,6 +151,8 @@ struct psi_trigger {
 };
 
 struct psi_group {
+	struct psi_group *parent;
+
 	/* Protects data used by the aggregator */
 	struct mutex avgs_lock;
 
diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 2545a78f82d8..9a8aee80a087 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -772,27 +772,12 @@ static void psi_group_change(struct psi_group *group, int cpu,
 		schedule_delayed_work(&group->avgs_work, PSI_FREQ);
 }
 
-static struct psi_group *iterate_groups(struct task_struct *task, void **iter)
+static inline struct psi_group *task_psi_group(struct task_struct *task)
 {
-	if (*iter == &psi_system)
-		return NULL;
-
 #ifdef CONFIG_CGROUPS
-	if (static_branch_likely(&psi_cgroups_enabled)) {
-		struct cgroup *cgroup = NULL;
-
-		if (!*iter)
-			cgroup = task->cgroups->dfl_cgrp;
-		else
-			cgroup = cgroup_parent(*iter);
-
-		if (cgroup && cgroup_parent(cgroup)) {
-			*iter = cgroup;
-			return cgroup_psi(cgroup);
-		}
-	}
+	if (static_branch_likely(&psi_cgroups_enabled))
+		return cgroup_psi(task_dfl_cgroup(task));
 #endif
-	*iter = &psi_system;
 	return &psi_system;
 }
 
@@ -815,7 +800,6 @@ void psi_task_change(struct task_struct *task, int clear, int set)
 {
 	int cpu = task_cpu(task);
 	struct psi_group *group;
-	void *iter = NULL;
 	u64 now;
 
 	if (!task->pid)
@@ -825,8 +809,10 @@ void psi_task_change(struct task_struct *task, int clear, int set)
 
 	now = cpu_clock(cpu);
 
-	while ((group = iterate_groups(task, &iter)))
+	group = task_psi_group(task);
+	do {
 		psi_group_change(group, cpu, clear, set, now, true);
+	} while ((group = group->parent));
 }
 
 void psi_task_switch(struct task_struct *prev, struct task_struct *next,
@@ -834,7 +820,6 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 {
 	struct psi_group *group, *common = NULL;
 	int cpu = task_cpu(prev);
-	void *iter;
 	u64 now = cpu_clock(cpu);
 
 	if (next->pid) {
@@ -844,8 +829,8 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 		 * ancestors with @prev, those will already have @prev's
 		 * TSK_ONCPU bit set, and we can stop the iteration there.
 		 */
-		iter = NULL;
-		while ((group = iterate_groups(next, &iter))) {
+		group = task_psi_group(next);
+		do {
 			if (per_cpu_ptr(group->pcpu, cpu)->state_mask &
 			    PSI_ONCPU) {
 				common = group;
@@ -853,7 +838,7 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 			}
 
 			psi_group_change(group, cpu, 0, TSK_ONCPU, now, true);
-		}
+		} while ((group = group->parent));
 	}
 
 	if (prev->pid) {
@@ -886,9 +871,12 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 
 		psi_flags_change(prev, clear, set);
 
-		iter = NULL;
-		while ((group = iterate_groups(prev, &iter)) && group != common)
+		group = task_psi_group(prev);
+		do {
+			if (group == common)
+				break;
 			psi_group_change(group, cpu, clear, set, now, wake_clock);
+		} while ((group = group->parent));
 
 		/*
 		 * TSK_ONCPU is handled up to the common ancestor. If there are
@@ -898,7 +886,7 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 		 */
 		if ((prev->psi_flags ^ next->psi_flags) & ~TSK_ONCPU) {
 			clear &= ~TSK_ONCPU;
-			for (; group; group = iterate_groups(prev, &iter))
+			for (; group; group = group->parent)
 				psi_group_change(group, cpu, clear, set, now, wake_clock);
 		}
 	}
@@ -908,7 +896,6 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 void psi_account_irqtime(struct task_struct *task, u32 delta)
 {
 	int cpu = task_cpu(task);
-	void *iter = NULL;
 	struct psi_group *group;
 	struct psi_group_cpu *groupc;
 	u64 now;
@@ -918,7 +905,8 @@ void psi_account_irqtime(struct task_struct *task, u32 delta)
 
 	now = cpu_clock(cpu);
 
-	while ((group = iterate_groups(task, &iter))) {
+	group = task_psi_group(task);
+	do {
 		groupc = per_cpu_ptr(group->pcpu, cpu);
 
 		write_seqcount_begin(&groupc->seq);
@@ -930,7 +918,7 @@ void psi_account_irqtime(struct task_struct *task, u32 delta)
 
 		if (group->poll_states & (1 << PSI_IRQ_FULL))
 			psi_schedule_poll_work(group, 1);
-	}
+	} while ((group = group->parent));
 }
 #endif
 
@@ -1010,6 +998,7 @@ int psi_cgroup_alloc(struct cgroup *cgroup)
 		return -ENOMEM;
 	}
 	group_init(cgroup->psi);
+	cgroup->psi->parent = cgroup_psi(cgroup_parent(cgroup));
 	return 0;
 }
 
-- 
2.37.2


Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6742C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 06:18:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C9D764FB8
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 06:18:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhCKGSV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Mar 2021 01:18:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbhCKGSF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Mar 2021 01:18:05 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BCAC061574
        for <linux-doc@vger.kernel.org>; Wed, 10 Mar 2021 22:18:05 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id lr10-20020a17090b4b8ab02900dd61b95c5eso6296614pjb.4
        for <linux-doc@vger.kernel.org>; Wed, 10 Mar 2021 22:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GtG19LOebEp2WxfXZAPDVqDaGg46AUd7BpnKVeJq4kc=;
        b=rhbKo8dcc8lTdzeUYcMZoyURBR3BB+R/PES6oMiL7hFf6Hfd2KdUNdjN3OUvIs24TK
         Kld96DWzTaLfOLMLQ4UQ+NNx04wNaN7EPmGc0Rrs/meIZhbVWMZRyFRs0xgvufGs53+1
         WZbD536dxbOG4ZX3uDXg6AXioZz0EA90qLurDWnmAee19bYnY5otEd1TRemCbakfWAKL
         mfI+Cvmzdumpdq3HmPzqS/JiVMKhF+gCqZT2yLK1tmyCFPc4VVUpdmR6swDdUIApIgfY
         qBS2ud3yIfWJyKT4/qh412WYUWrg/xwTXvwTyZLpEnvAJxOJvTLTF3sbjzl3uecblNhE
         Sfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GtG19LOebEp2WxfXZAPDVqDaGg46AUd7BpnKVeJq4kc=;
        b=XQsPtjmZnZhkeSDm0nbOXOqH+GaiLxmSblqDJfzk/4YQ+sA99LKmhKy8Q7YhcUfHfk
         PDF4oDLZSaJ6ZXUZxszJq77IAKWLrfXsccti+ekfHmzol3sMMsRysYvkJp6usQD4z+IP
         EqnnsXinulv61Jya/FP2PC0YjmZivB6hXycrG40ILN/0eesnTUet10+7qY3+MO4nLoe2
         5EUM/3NYq1wTsBhVRc5/BlkZO+CenTCwgTnvxcyNNDk1pWwFifTXKlGqJGXEYBTC8KfR
         luclOe56hTMWlIblQKI66L2IT0CbKHo+NzW5e1bHUvkxuKS5hBXz9w/XxHAtYY4amYy0
         X8Jg==
X-Gm-Message-State: AOAM532WdDyoNPGWWklqPbC/KxXXr4HjYkJ1n/0nvOZYhl9UDhJEFepS
        u4UUtrSIy5yfsfg7Sl/nY0GeQg==
X-Google-Smtp-Source: ABdhPJxyBUhrIkIxAqjaPMJ2bwK4AiMhyUompTTx88o6LU8BPAUdCjOWSAZUPGQMmMmsuEoYqfZllg==
X-Received: by 2002:a17:90a:c096:: with SMTP id o22mr7450750pjs.119.1615443484161;
        Wed, 10 Mar 2021 22:18:04 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id 25sm1241346pfh.199.2021.03.10.22.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 22:18:03 -0800 (PST)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     tj@kernel.org, lizefan.x@bytedance.com, hannes@cmpxchg.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc:     dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhouchengming@bytedance.com, songmuchun@bytedance.com
Subject: [PATCH] cgroup-v2: Add taskstats counters in cgroup.stat
Date:   Thu, 11 Mar 2021 14:17:52 +0800
Message-Id: <20210311061752.310831-1-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We have the netlink CGROUPSTATS_CMD_GET interface to get taskstats
of the cgroup on v1, but haven't the equivalent interface on v2,
making it difficult to calculate the per-cgroup cpu load in cadvisor
or implement the cgroup proc interface in lxcfs, like /proc/loadavg.

Since we already have these counters maintained in psi subsystem,
so this patch sum them up and export in the cgroup.stat interface.

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  9 +++++++
 include/linux/psi.h                     |  1 +
 kernel/cgroup/cgroup.c                  |  3 +++
 kernel/sched/psi.c                      | 34 +++++++++++++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 64c62b979f2f..4184e749f687 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -923,6 +923,15 @@ All cgroup core files are prefixed with "cgroup."
 		A dying cgroup can consume system resources not exceeding
 		limits, which were active at the moment of cgroup deletion.
 
+	  nr_iowait_tasks
+	    Total number of tasks in iowait.
+
+	  nr_memstall_tasks
+	    Total number of tasks in memstall.
+
+	  nr_running_tasks
+	    Total number of runnable tasks.
+
   cgroup.freeze
 	A read-write single value file which exists on non-root cgroups.
 	Allowed values are "0" and "1". The default is "0".
diff --git a/include/linux/psi.h b/include/linux/psi.h
index 7361023f3fdd..ea98239424ca 100644
--- a/include/linux/psi.h
+++ b/include/linux/psi.h
@@ -30,6 +30,7 @@ int psi_show(struct seq_file *s, struct psi_group *group, enum psi_res res);
 int psi_cgroup_alloc(struct cgroup *cgrp);
 void psi_cgroup_free(struct cgroup *cgrp);
 void cgroup_move_task(struct task_struct *p, struct css_set *to);
+void psi_taskstat_show(struct seq_file *m, struct cgroup *cgrp);
 
 struct psi_trigger *psi_trigger_create(struct psi_group *group,
 			char *buf, size_t nbytes, enum psi_res res);
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 9153b20e5cc6..2724ae318a3b 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3502,6 +3502,9 @@ static int cgroup_stat_show(struct seq_file *seq, void *v)
 	seq_printf(seq, "nr_dying_descendants %d\n",
 		   cgroup->nr_dying_descendants);
 
+#ifdef CONFIG_PSI
+	psi_taskstat_show(seq, cgroup);
+#endif
 	return 0;
 }
 
diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 967732c0766c..0ae8bd278ca4 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1000,6 +1000,40 @@ void cgroup_move_task(struct task_struct *task, struct css_set *to)
 
 	task_rq_unlock(rq, task, &rf);
 }
+
+void psi_taskstat_show(struct seq_file *m, struct cgroup *cgrp)
+{
+	struct psi_group *group;
+	int cpu;
+	int s;
+	unsigned int taskstat[NR_PSI_TASK_COUNTS - 1] = { 0, };
+
+	if (static_branch_likely(&psi_disabled))
+		return;
+
+	group = cgroup_ino(cgrp) == 1 ? &psi_system : &cgrp->psi;
+
+	for_each_possible_cpu(cpu) {
+		struct psi_group_cpu *groupc = per_cpu_ptr(group->pcpu, cpu);
+		unsigned int tasks[NR_PSI_TASK_COUNTS];
+		unsigned int seq;
+
+		do {
+			seq = read_seqcount_begin(&groupc->seq);
+			memcpy(tasks, groupc->tasks, sizeof(groupc->tasks));
+		} while (read_seqcount_retry(&groupc->seq, seq));
+
+		for (s = 0; s < NR_ONCPU; s++)
+			taskstat[s] += tasks[s];
+	}
+
+	seq_printf(m, "nr_iowait_tasks %u\n"
+		   "nr_memstall_tasks %u\n"
+		   "nr_running_tasks %u\n",
+		   taskstat[NR_IOWAIT],
+		   taskstat[NR_MEMSTALL],
+		   taskstat[NR_RUNNING]);
+}
 #endif /* CONFIG_CGROUPS */
 
 int psi_show(struct seq_file *m, struct psi_group *group, enum psi_res res)
-- 
2.25.1


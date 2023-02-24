Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AC0C64ED8
	for <linux-doc@archiver.kernel.org>; Fri, 24 Feb 2023 09:35:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjBXJfF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Feb 2023 04:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjBXJfD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 04:35:03 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9525951935
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 01:35:01 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id p23-20020a05600c1d9700b003ead4835046so1351124wms.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 01:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiVS63wbAWm+QNHUVgj2Zht/JYfZt2Iaghb+UJPmGJA=;
        b=QrTYP59UXLyEyZXXYAeeXw2AFfFauFp/C2n/IOyN3xqbAk8jjk7e20YwjW4/43PsBi
         4QPrI/QTUmePR3SOLNczxnpoBs5aDDxAEopDH+YvwI2cwTf4AF65FfzRnZObTfbN+Hec
         WFZO5EQCCOfR7bZFaP2tJLma9p8iRxA7DlUro5Z4PqHmwHBB+u2FhNfrug7WVn7wubU3
         GzPZ6F/YVjhhCLmMkMui/c6pr2O5+yI85Yufy2TgrbyHe/rdl02i5nnCM0km4exhBi3P
         cJhw7ozhoXe+F0JqtenV03G1YlpZGakYFvT8fC0bLeE7ExceapOsAmy4aB88jY7A/oFs
         835g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiVS63wbAWm+QNHUVgj2Zht/JYfZt2Iaghb+UJPmGJA=;
        b=X0QZqzn7ekwAC92MtT6u+gspCFB1ztzH3o1u6z91bLGYErHHKjWRCSV2fEXOFczSN6
         44HTdQe5bEEqtk2qcV2iFThRyVYhABFheHRCnhXqyfnos7CofGkAtT/TSxWRZCPLDZSp
         ezOXyFLtMVF8rUUlJOmegLPVUhtrdVp+v43cZppP2tMuxBHsI57cRwu17sB8M2E2dxsK
         2b5FsW3r9D0b7Wdkv2QhwPFWqZv0qRReVVerzJN4UqftY9tbI0fA6lE8/vOgEojmvmvj
         EwhbveOcaBxz9QwxEkCwVlXCpU0Caa1MetGvbXqgIHChIJF8V5SwK+XYPGlzBt9t32uP
         /Now==
X-Gm-Message-State: AO0yUKU/hEMHA33fqqNxyGt1+XLFEJWiHKUyNtJZbyLw4DGuGLOndfB6
        F6UIvhJn8gIdQ18C/xXHDBX/ow==
X-Google-Smtp-Source: AK7set/UtyAo4e/5YSmAo0P8kPKLUEJrgR9cSLNIDyJc/mrGRMK9XgthAW0Q7e5MQ/QTZ3rwk9DHTQ==
X-Received: by 2002:a05:600c:4929:b0:3e2:1f63:4beb with SMTP id f41-20020a05600c492900b003e21f634bebmr11748426wmp.19.1677231300127;
        Fri, 24 Feb 2023 01:35:00 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:a6f0:4ee9:c103:44cb])
        by smtp.gmail.com with ESMTPSA id d18-20020a05600c34d200b003e6dcd562a6sm2239179wmq.28.2023.02.24.01.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 01:34:59 -0800 (PST)
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
Subject: [PATCH v12 2/8] sched: Introduce latency-nice as a per-task attribute
Date:   Fri, 24 Feb 2023 10:34:48 +0100
Message-Id: <20230224093454.956298-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224093454.956298-1-vincent.guittot@linaro.org>
References: <20230224093454.956298-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Parth Shah <parth@linux.ibm.com>

Latency-nice indicates the latency requirements of a task with respect
to the other tasks in the system. The value of the attribute can be within
the range of [-20, 19] both inclusive to be in-line with the values just
like task nice values.

latency_nice = -20 indicates the task to have the least latency as
compared to the tasks having latency_nice = +19.

The latency_nice may affect only the CFS SCHED_CLASS by getting
latency requirements from the userspace.

Additionally, add debugging bits for newly added latency_nice attribute.

Signed-off-by: Parth Shah <parth@linux.ibm.com>
[rebase, move defines in sched/prio.h]
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 include/linux/sched.h      |  1 +
 include/linux/sched/prio.h | 18 ++++++++++++++++++
 kernel/sched/debug.c       |  1 +
 3 files changed, 20 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 4df2b3e76b30..6c61bde49152 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -784,6 +784,7 @@ struct task_struct {
 	int				static_prio;
 	int				normal_prio;
 	unsigned int			rt_priority;
+	int				latency_nice;
 
 	struct sched_entity		se;
 	struct sched_rt_entity		rt;
diff --git a/include/linux/sched/prio.h b/include/linux/sched/prio.h
index ab83d85e1183..bfcd7f1d1e11 100644
--- a/include/linux/sched/prio.h
+++ b/include/linux/sched/prio.h
@@ -42,4 +42,22 @@ static inline long rlimit_to_nice(long prio)
 	return (MAX_NICE - prio + 1);
 }
 
+/*
+ * Latency nice is meant to provide scheduler hints about the relative
+ * latency requirements of a task with respect to other tasks.
+ * Thus a task with latency_nice == 19 can be hinted as the task with no
+ * latency requirements, in contrast to the task with latency_nice == -20
+ * which should be given priority in terms of lower latency.
+ */
+#define MAX_LATENCY_NICE	19
+#define MIN_LATENCY_NICE	-20
+
+#define LATENCY_NICE_WIDTH	\
+	(MAX_LATENCY_NICE - MIN_LATENCY_NICE + 1)
+
+/*
+ * Default tasks should be treated as a task with latency_nice = 0.
+ */
+#define DEFAULT_LATENCY_NICE	0
+
 #endif /* _LINUX_SCHED_PRIO_H */
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 1637b65ba07a..68be7a3e42a3 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1043,6 +1043,7 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 #endif
 	P(policy);
 	P(prio);
+	P(latency_nice);
 	if (task_has_dl_policy(p)) {
 		P(dl.runtime);
 		P(dl.deadline);
-- 
2.34.1


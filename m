Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A808BC43334
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jul 2022 04:06:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbiGUEGQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jul 2022 00:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbiGUEFk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jul 2022 00:05:40 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63DE2656C
        for <linux-doc@vger.kernel.org>; Wed, 20 Jul 2022 21:05:35 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id y24so664884plh.7
        for <linux-doc@vger.kernel.org>; Wed, 20 Jul 2022 21:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=chxgxgcpZm63zsd7qnwFUE6j0UUhwVxho98X19IjMdE=;
        b=MEqNBgP7agly9aS2Azra3w7VOxdjKrzITB65iYsv3NXbBBWm7HIegWxDU49K4BpbH1
         upu756UW+/g2v32lOG9VTubX3HCXZh4vdPmCLXyUcqTpp7LbUW3NBWRJB6sZ1dEz+9ax
         jLNPgIjfXX6x9qBkQEK+58do+zhoAlNUgAX7FEaaWcVrKLvW/1xA/CB4mwIZAR9wDsMm
         afAYO+RCU73xoMk/QP/DkmQSf3RstJQzsQzDCn07vnpAKmP8Y9Jyd9PXnblNfbBeLgiE
         ZFyMRwUN+WkXIe4M195SuIyrHTNTA04IEImzh2fl5Myw1YCVj/LGvPfEEQsF2ARkZEwa
         hbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=chxgxgcpZm63zsd7qnwFUE6j0UUhwVxho98X19IjMdE=;
        b=ChFcTGMeKVqVjadB482+4cMlub3NfXvE1Y8nyyiJK2nFklJw5AkzpQxuHwaJSAYi6I
         62Uo1P6ABi2xZ/REa4prHXonEebBMPgcN6KsF+DgC2IBPXUuqSmDejI9epk8ik8xs8Qe
         3LhoBu+/sdz/46XLp4R8QjmGN71Hkot/O+IdDUcNF45v6HSTcBOXloSrNH+xl7j4udQb
         k+lBypDgmeHEmHSrIbK3Wa6ZLtjssmkMPpSfQJtB0jgwayUqy+b+anHHCwUQoqE66fjE
         //aWo6ONZJ5WcGCvBEOD9Bqa19tqDPWCMoS92UX8u6JeE0w8PGuyuJlg6J7gRDUN1sBR
         IHzQ==
X-Gm-Message-State: AJIora9uUubEXScFdbesko/KCRJ1Xy+o9aZ45kt3MUKo85V4LdiAT0ai
        jbuNAwB89TtYCL9MG4ZICFqZYA==
X-Google-Smtp-Source: AGRyM1vUIz6lPEf3HOHUkuvCGIIMxbk0t9sGoJJTfg14bbj82E++1uIgwhKvaCZx0C4rl6QULiYhTg==
X-Received: by 2002:a17:902:d552:b0:16d:33d2:955b with SMTP id z18-20020a170902d55200b0016d33d2955bmr177647plf.29.1658376335154;
        Wed, 20 Jul 2022 21:05:35 -0700 (PDT)
Received: from C02CV1DAMD6P.bytedance.net ([139.177.225.228])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902684400b0016bdf0032b9sm384368pln.110.2022.07.20.21.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 21:05:34 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     hannes@cmpxchg.org, surenb@google.com, mingo@redhat.com,
        peterz@infradead.org, tj@kernel.org, corbet@lwn.net,
        akpm@linux-foundation.org, rdunlap@infradead.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        songmuchun@bytedance.com, cgroups@vger.kernel.org,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH 8/9] sched/psi: add kernel cmdline parameter psi_inner_cgroup
Date:   Thu, 21 Jul 2022 12:04:38 +0800
Message-Id: <20220721040439.2651-9-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721040439.2651-1-zhouchengming@bytedance.com>
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

PSI accounts stalls for each cgroup separately and aggregates it
at each level of the hierarchy. This may case non-negligible overhead
for some workloads when under deep level of the hierarchy.

commit 3958e2d0c34e ("cgroup: make per-cgroup pressure stall tracking configurable")
make PSI to skip per-cgroup stall accounting, only account system-wide
to avoid this each level overhead.

For our use case, we also want leaf cgroup PSI accounted for userspace
adjustment on that cgroup, apart from only system-wide management.

So this patch add kernel cmdline parameter "psi_inner_cgroup" to control
whether or not to account for inner cgroups, which is default to true
for compatibility.

Performance test on Intel Xeon Platinum with 3 levels of cgroup:

1. default (psi_inner_cgroup=true)

$ perf bench sched all
 # Running sched/messaging benchmark...
 # 20 sender and receiver processes per group
 # 10 groups == 400 processes run

     Total time: 0.032 [sec]

 # Running sched/pipe benchmark...
 # Executed 1000000 pipe operations between two processes

     Total time: 7.758 [sec]

       7.758354 usecs/op
         128893 ops/sec

2. psi_inner_cgroup=false

$ perf bench sched all
 # Running sched/messaging benchmark...
 # 20 sender and receiver processes per group
 # 10 groups == 400 processes run

     Total time: 0.032 [sec]

 # Running sched/pipe benchmark...
 # Executed 1000000 pipe operations between two processes

     Total time: 7.309 [sec]

       7.309436 usecs/op
         136809 ops/sec

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 kernel/sched/psi.c                              | 11 ++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8090130b544b..6beef5b8bc36 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4419,6 +4419,12 @@
 			tracking.
 			Format: <bool>
 
+	psi_inner_cgroup=
+			[KNL] Enable or disable pressure stall information
+			tracking for the inner cgroups.
+			Format: <bool>
+			default: enabled
+
 	psmouse.proto=	[HW,MOUSE] Highest PS2 mouse protocol extension to
 			probe for; one of (bare|imps|exps|lifebook|any).
 	psmouse.rate=	[HW,MOUSE] Set desired mouse report rate, in reports
diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 2228cbf3bdd3..8d76920f47b3 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -147,12 +147,21 @@ static bool psi_enable;
 #else
 static bool psi_enable = true;
 #endif
+
+static bool psi_inner_cgroup __read_mostly = true;
+
 static int __init setup_psi(char *str)
 {
 	return kstrtobool(str, &psi_enable) == 0;
 }
 __setup("psi=", setup_psi);
 
+static int __init setup_psi_inner_cgroup(char *str)
+{
+	return kstrtobool(str, &psi_inner_cgroup) == 0;
+}
+__setup("psi_inner_cgroup=", setup_psi_inner_cgroup);
+
 /* Running averages - we need to be higher-res than loadavg */
 #define PSI_FREQ	(2*HZ+1)	/* 2 sec intervals */
 #define EXP_10s		1677		/* 1/exp(2s/10s) as fixed-point */
@@ -958,7 +967,7 @@ int psi_cgroup_alloc(struct cgroup *cgroup)
 	group_init(&cgroup->psi);
 
 	parent = cgroup_parent(cgroup);
-	if (parent && cgroup_parent(parent))
+	if (parent && cgroup_parent(parent) && psi_inner_cgroup)
 		cgroup->psi.parent = cgroup_psi(parent);
 	else
 		cgroup->psi.parent = &psi_system;
-- 
2.36.1


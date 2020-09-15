Return-Path: <SRS0=ug/q=CY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4235C43461
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 22:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A15B208E4
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 22:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="fZ2zBCzi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbgIOWpB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 18:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727441AbgIOPx7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 11:53:59 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E65BC06174A
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 08:53:58 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n14so2180167pff.6
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 08:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kU2nEMhjCVWVrMXPlsQXavcJV9QfPkKaCh123WirJUY=;
        b=fZ2zBCziQ3BDs46gAsEfUI7yxJtBST2rD1IAijko7XSzcOwptW4Ut8cyp/pKulyFN5
         Ya4+QRLBdUkedXev1V3EdJCBcWw7K2d1vm39dZMITMuBww53C+M6rM4NEoxRfDq+96Yq
         2hILdPF14cQEnz3v9ybLMFkS5pimkLRnuRTMrfCq5Hqy0KBcOcUjxpRFWbPMDZMUJqMZ
         JPJbtE/cVWhEHuZd7qbloKU9e+hR+nATFMV8pU+Rx6w1VBa40PqCN6W+dSAz4PQVeQeJ
         kt8jlvKwp4uuM6KWcCHU8nbzruP+ox0zWXUzIfgBxlatJaEpX6d7VdrCYvQraoKKotZH
         aM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kU2nEMhjCVWVrMXPlsQXavcJV9QfPkKaCh123WirJUY=;
        b=YQFc+ipczhnlwWKPCLYX/ZRJ3ra3GSCA5pOTPa+WMicEdW1rNSzwIwUqjWtTA0LB0Z
         tOdmSsUOoIUmbZXr4jKc/5HPNtGBD/2Azctv5kwf1w7T87T8Ucjiwx0EPl5ADIKFkZU4
         YYJsZkvw1QqZpgSVMiyeydUsRCvyGQAAzKb0CFW+3dkeAgTi4oxrVVhupdbThKIufYjj
         0AStWMiOYVNUg27g8BNuONJ4VfSPQwRTiqBkwuXG1723QK/lKbjD1uRGAuS/kvKfG9Kx
         CH1tTarLa5RwqvmiffDLSHwS+aPeTLzRCvAbhLkjbz8HrOEJXKA7ztU7Sn/VBiYzG3e8
         PDmw==
X-Gm-Message-State: AOAM533Lro+YGJIEORzbzHsFT2yCbUzD+pE+0Hhh3mKwRdVFPKSx7lFK
        7q/dksezMdF7/lVAjJoTy0qx3g==
X-Google-Smtp-Source: ABdhPJwi4fkNDvtVlto8KWYR1aJj5ID6DauHtUvOTVllokb0/rs8ghVhOYd/5I+QLqtz7r8sPEBupg==
X-Received: by 2002:a62:1bc7:0:b029:13e:d13d:a0f6 with SMTP id b190-20020a621bc70000b029013ed13da0f6mr18184752pfb.18.1600185237926;
        Tue, 15 Sep 2020 08:53:57 -0700 (PDT)
Received: from localhost.localdomain ([103.136.221.70])
        by smtp.gmail.com with ESMTPSA id b20sm14808636pfb.198.2020.09.15.08.53.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 08:53:57 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     tj@kernel.org, lizefan@huawei.com, hannes@cmpxchg.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     zhouchengming@bytedance.com, luodaowen.backend@bytedance.com,
        songmuchun@bytedance.com
Subject: [PATCH] cgroup: Add cgroupstats numbers to cgroup.stat file
Date:   Tue, 15 Sep 2020 23:53:49 +0800
Message-Id: <20200915155349.15181-1-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the cgroup v1, we can use netlink interface to get cgroupstats for
a cgroup. But it has been excluded from cgroup v2 interface intentionally
due to the duplication and inconsistencies with other statistics.
To make container monitor tool like "cadvisor" continue to work, we add
these cgroupstats numbers to the cgroup.stat file, and change the
admin-guide doc accordingly.

Reported-by: Daowen Luo <luodaowen.backend@bytedance.com>
Tested-by: Chengming Zhou <zhouchengming@bytedance.com>
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 15 ++++++++++++++
 kernel/cgroup/cgroup.c                  | 36 +++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 6be43781ec7f..9f781edca95a 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -925,6 +925,21 @@ All cgroup core files are prefixed with "cgroup."
 		A dying cgroup can consume system resources not exceeding
 		limits, which were active at the moment of cgroup deletion.
 
+          nr_running
+                Number of tasks running.
+
+          nr_sleeping
+                Number of tasks sleeping.
+
+          nr_uninterruptible
+                Number of tasks in uninterruptible state.
+
+          nr_stopped
+                Number of tasks in stopped state.
+
+          nr_io_wait
+                Number of tasks waiting on IO.
+
   cgroup.freeze
 	A read-write single value file which exists on non-root cgroups.
 	Allowed values are "0" and "1". The default is "0".
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 0e23ae3b1e56..c6ccacaf812d 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -42,6 +42,7 @@
 #include <linux/rcupdate.h>
 #include <linux/sched.h>
 #include <linux/sched/task.h>
+#include <linux/delayacct.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/percpu-rwsem.h>
@@ -3499,11 +3500,46 @@ static int cgroup_events_show(struct seq_file *seq, void *v)
 static int cgroup_stat_show(struct seq_file *seq, void *v)
 {
 	struct cgroup *cgroup = seq_css(seq)->cgroup;
+	struct css_task_iter it;
+	struct task_struct *tsk;
+	u64 nr_running = 0;
+	u64 nr_sleeping = 0;
+	u64 nr_uninterruptible = 0;
+	u64 nr_stopped = 0;
+	u64 nr_io_wait = 0;
+
+	css_task_iter_start(&cgroup->self, 0, &it);
+	while ((tsk = css_task_iter_next(&it))) {
+		switch (tsk->state) {
+		case TASK_RUNNING:
+			nr_running++;
+			break;
+		case TASK_INTERRUPTIBLE:
+			nr_sleeping++;
+			break;
+		case TASK_UNINTERRUPTIBLE:
+			nr_uninterruptible++;
+			break;
+		case TASK_STOPPED:
+			nr_stopped++;
+			break;
+		default:
+			if (delayacct_is_task_waiting_on_io(tsk))
+				nr_io_wait++;
+			break;
+		}
+	}
+	css_task_iter_end(&it);
 
 	seq_printf(seq, "nr_descendants %d\n",
 		   cgroup->nr_descendants);
 	seq_printf(seq, "nr_dying_descendants %d\n",
 		   cgroup->nr_dying_descendants);
+	seq_printf(seq, "nr_running %llu\n", nr_running);
+	seq_printf(seq, "nr_sleeping %llu\n", nr_sleeping);
+	seq_printf(seq, "nr_uninterruptible %llu\n", nr_uninterruptible);
+	seq_printf(seq, "nr_stopped %llu\n", nr_stopped);
+	seq_printf(seq, "nr_io_wait %llu\n", nr_io_wait);
 
 	return 0;
 }
-- 
2.11.0


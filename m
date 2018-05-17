Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 97FE97D09E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 May 2018 20:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752195AbeEQU4R (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 May 2018 16:56:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33260 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752188AbeEQUz7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 May 2018 16:55:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D4EF381FE14F;
        Thu, 17 May 2018 20:55:58 +0000 (UTC)
Received: from llong.com (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6FFDB2024CBF;
        Thu, 17 May 2018 20:55:58 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@fb.com, pjt@google.com,
        luto@amacapital.net, Mike Galbraith <efault@gmx.de>,
        torvalds@linux-foundation.org, Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v8 6/6] cpuset: Allow reporting of sched domain generation info
Date:   Thu, 17 May 2018 16:55:45 -0400
Message-Id: <1526590545-3350-7-git-send-email-longman@redhat.com>
In-Reply-To: <1526590545-3350-1-git-send-email-longman@redhat.com>
References: <1526590545-3350-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 17 May 2018 20:55:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 17 May 2018 20:55:58 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch enables us to report sched domain generation information.

If DYNAMIC_DEBUG is enabled, issuing the following command

  echo "file cpuset.c +p" > /sys/kernel/debug/dynamic_debug/control

and setting loglevel to 8 will allow the kernel to show what scheduling
domain changes are being made.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index fb8aa82b..8f586e8 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -820,6 +820,12 @@ static int generate_sched_domains(cpumask_var_t **domains,
 	}
 	BUG_ON(nslot != ndoms);
 
+#ifdef CONFIG_DEBUG_KERNEL
+	for (i = 0; i < ndoms; i++)
+		pr_debug("generate_sched_domains dom %d: %*pbl\n", i,
+			 cpumask_pr_args(doms[i]));
+#endif
+
 done:
 	kfree(csa);
 
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

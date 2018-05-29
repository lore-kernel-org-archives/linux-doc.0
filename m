Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A51097DF91
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 13:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934101AbeE2NnS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 09:43:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54530 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S934355AbeE2NmP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 May 2018 09:42:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id BDB6A401EF13;
        Tue, 29 May 2018 13:42:14 +0000 (UTC)
Received: from llong.com (dhcp-17-81.bos.redhat.com [10.18.17.81])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EA2EA64663;
        Tue, 29 May 2018 13:42:13 +0000 (UTC)
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
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v9 5/7] cpuset: Expose cpus.effective and mems.effective on cgroup v2 root
Date:   Tue, 29 May 2018 09:41:32 -0400
Message-Id: <1527601294-3444-6-git-send-email-longman@redhat.com>
In-Reply-To: <1527601294-3444-1-git-send-email-longman@redhat.com>
References: <1527601294-3444-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 29 May 2018 13:42:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 29 May 2018 13:42:14 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Because of the fact that setting the "cpuset.sched.domain_root" in
a direct child of root can remove CPUs from the root's effective CPU
list, it makes sense to know what CPUs are left in the root cgroup for
scheduling purpose. So the "cpuset.cpus.effective" control file is now
exposed in the v2 cgroup root.

For consistency, the "cpuset.mems.effective" control file is exposed
as well.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 Documentation/cgroup-v2.txt | 4 ++--
 kernel/cgroup/cpuset.c      | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/cgroup-v2.txt b/Documentation/cgroup-v2.txt
index 681a809..b97f211 100644
--- a/Documentation/cgroup-v2.txt
+++ b/Documentation/cgroup-v2.txt
@@ -1474,7 +1474,7 @@ Cpuset Interface Files
 	and won't be affected by any CPU hotplug events.
 
   cpuset.cpus.effective
-	A read-only multiple values file which exists on non-root
+	A read-only multiple values file which exists on all
 	cpuset-enabled cgroups.
 
 	It lists the onlined CPUs that are actually allowed to be
@@ -1504,7 +1504,7 @@ Cpuset Interface Files
 	and won't be affected by any memory nodes hotplug events.
 
   cpuset.mems.effective
-	A read-only multiple values file which exists on non-root
+	A read-only multiple values file which exists on all
 	cpuset-enabled cgroups.
 
 	It lists the onlined memory nodes that are actually allowed to
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 71cd920..f6ae483 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2214,14 +2214,12 @@ static s64 cpuset_read_s64(struct cgroup_subsys_state *css, struct cftype *cft)
 		.name = "cpus.effective",
 		.seq_show = cpuset_common_seq_show,
 		.private = FILE_EFFECTIVE_CPULIST,
-		.flags = CFTYPE_NOT_ON_ROOT,
 	},
 
 	{
 		.name = "mems.effective",
 		.seq_show = cpuset_common_seq_show,
 		.private = FILE_EFFECTIVE_MEMLIST,
-		.flags = CFTYPE_NOT_ON_ROOT,
 	},
 
 	{
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

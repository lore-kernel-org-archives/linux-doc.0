Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 60DEE7D8E7
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 20:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbeJPERg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Oct 2018 00:17:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48724 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727129AbeJPERf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Oct 2018 00:17:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 095B788E56;
        Mon, 15 Oct 2018 20:30:45 +0000 (UTC)
Received: from llong.com (dhcp-17-8.bos.redhat.com [10.18.17.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 60CBD768B2;
        Mon, 15 Oct 2018 20:30:43 +0000 (UTC)
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
        Tom Hromatka <tom.hromatka@oracle.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v14 09/12] cpuset: Expose cpus.effective and mems.effective on cgroup v2 root
Date:   Mon, 15 Oct 2018 16:29:34 -0400
Message-Id: <1539635377-22335-10-git-send-email-longman@redhat.com>
In-Reply-To: <1539635377-22335-1-git-send-email-longman@redhat.com>
References: <1539635377-22335-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 15 Oct 2018 20:30:45 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Because of the fact that setting the "cpuset.sched.partition" in
a direct child of root can remove CPUs from the root's effective CPU
list, it makes sense to know what CPUs are left in the root cgroup for
scheduling purpose. So the "cpuset.cpus.effective" control file is now
exposed in the v2 cgroup root.

For consistency, the "cpuset.mems.effective" control file is exposed
as well.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 4 ++--
 kernel/cgroup/cpuset.c                  | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 0465c231e2fb..533e85cb851b 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1631,7 +1631,7 @@ Cpuset Interface Files
 	and won't be affected by any CPU hotplug events.
 
   cpuset.cpus.effective
-	A read-only multiple values file which exists on non-root
+	A read-only multiple values file which exists on all
 	cpuset-enabled cgroups.
 
 	It lists the onlined CPUs that are actually granted to this
@@ -1671,7 +1671,7 @@ Cpuset Interface Files
 	and won't be affected by any memory nodes hotplug events.
 
   cpuset.mems.effective
-	A read-only multiple values file which exists on non-root
+	A read-only multiple values file which exists on all
 	cpuset-enabled cgroups.
 
 	It lists the onlined memory nodes that are actually granted to
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 53dbd473bd7e..b9832e355e36 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2569,14 +2569,12 @@ static struct cftype dfl_files[] = {
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
2.18.0


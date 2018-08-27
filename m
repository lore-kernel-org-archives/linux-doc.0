Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 72F717D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 27 Aug 2018 14:42:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbeH0S3E (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 27 Aug 2018 14:29:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43326 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727723AbeH0S2h (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 Aug 2018 14:28:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 17D3A402212B;
        Mon, 27 Aug 2018 14:41:42 +0000 (UTC)
Received: from llong.com (dhcp-17-8.bos.redhat.com [10.18.17.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9CB852027EA3;
        Mon, 27 Aug 2018 14:41:41 +0000 (UTC)
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
Subject: [PATCH v12 8/9] cpuset: Don't rebuild sched domains if cpu changes in non-partition root
Date:   Mon, 27 Aug 2018 10:41:23 -0400
Message-Id: <1535380884-31308-9-git-send-email-longman@redhat.com>
In-Reply-To: <1535380884-31308-1-git-send-email-longman@redhat.com>
References: <1535380884-31308-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Mon, 27 Aug 2018 14:41:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Mon, 27 Aug 2018 14:41:42 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With the cpuset v1, any changes to the list of allowable CPUs in a cpuset
may cause changes in the sched domain configuration depending on the
load balancing states and the cpu lists of its parent and its children.

With cpuset v2 (on default hierarchy), there are more restrictions
on how the load balancing state of a cpuset can change. As a result,
only changes made in a partition root will cause possible changes to
the corresponding sched domain. CPU changes to any of the non-partition
root cpusets will not cause changes in the sched domain configuration.
As a result, we don't need to call rebuild_sched_domains_locked()
for changes in a non-partition root cpuset saving precious cpu cycles.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 0e41b62..d8970b4 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -986,11 +986,15 @@ static void update_cpumasks_hier(struct cpuset *cs, struct cpumask *new_cpus)
 		update_tasks_cpumask(cp);
 
 		/*
-		 * If the effective cpumask of any non-empty cpuset is changed,
-		 * we need to rebuild sched domains.
+		 * On legacy hierarchy, if the effective cpumask of any non-
+		 * empty cpuset is changed, we need to rebuild sched domains.
+		 * On default hierarchy, the cpuset needs to be a partition
+		 * root as well.
 		 */
 		if (!cpumask_empty(cp->cpus_allowed) &&
-		    is_sched_load_balance(cp))
+		    is_sched_load_balance(cp) &&
+		   (!cgroup_subsys_on_dfl(cpuset_cgrp_subsys) ||
+		    is_partition_root(cp)))
 			need_rebuild_sched_domains = true;
 
 		rcu_read_lock();
-- 
1.8.3.1


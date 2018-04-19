Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8DB0D7E279
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 13:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753299AbeDSNrV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 09:47:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44280 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751293AbeDSNrR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Apr 2018 09:47:17 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 883C640201A4;
        Thu, 19 Apr 2018 13:47:16 +0000 (UTC)
Received: from llong.com (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E14D4215CDCB;
        Thu, 19 Apr 2018 13:47:15 +0000 (UTC)
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
Subject: [PATCH v7 4/5] cpuset: Restrict load balancing off cpus to subset of cpus.isolated
Date:   Thu, 19 Apr 2018 09:47:03 -0400
Message-Id: <1524145624-23655-5-git-send-email-longman@redhat.com>
In-Reply-To: <1524145624-23655-1-git-send-email-longman@redhat.com>
References: <1524145624-23655-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Thu, 19 Apr 2018 13:47:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Thu, 19 Apr 2018 13:47:16 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With the addition of "cpuset.cpus.isolated", it makes sense to add the
restriction that load balancing can only be turned off if the CPUs in
the isolated cpuset are subset of "cpuset.cpus.isolated".

Signed-off-by: Waiman Long <longman@redhat.com>
---
 Documentation/cgroup-v2.txt |  7 ++++---
 kernel/cgroup/cpuset.c      | 29 ++++++++++++++++++++++++++---
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/Documentation/cgroup-v2.txt b/Documentation/cgroup-v2.txt
index 8d89dc2..c4227ee 100644
--- a/Documentation/cgroup-v2.txt
+++ b/Documentation/cgroup-v2.txt
@@ -1554,9 +1554,10 @@ Cpuset Interface Files
 	and will not be moved to other CPUs.
 
 	This flag is hierarchical and is inherited by child cpusets. It
-	can be turned off only when the CPUs in this cpuset aren't
-	listed in the cpuset.cpus of other sibling cgroups, and all
-	the child cpusets, if present, have this flag turned off.
+	can be explicitly turned off only when it is a direct child of
+	the root cgroup and the CPUs in this cpuset are subset of the
+	root's "cpuset.cpus.isolated".	Moreover, the CPUs cannot be
+	listed in the "cpuset.cpus" of other sibling cgroups.
 
 	Once it is off, it cannot be turned back on as long as the
 	parent cgroup still has this flag in the off state.
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index c746b18..d05c4c8 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -511,6 +511,16 @@ static int validate_change(struct cpuset *cur, struct cpuset *trial)
 
 	par = parent_cs(cur);
 
+	/*
+	 * On default hierarchy with sched_load_balance flag off, the cpu
+	 * list must be a subset of the parent's isolated CPU list, if
+	 * defined (root).
+	 */
+	if (cgroup_subsys_on_dfl(cpuset_cgrp_subsys) &&
+	    !is_sched_load_balance(trial) && par->isolation_count &&
+	    !cpumask_subset(trial->cpus_allowed, par->isolated_cpus))
+		goto out;
+
 	/* On legacy hierarchy, we must be a subset of our parent cpuset. */
 	ret = -EACCES;
 	if (!is_in_v2_mode() && !is_cpuset_subset(trial, par))
@@ -1431,10 +1441,16 @@ static int update_flag(cpuset_flagbits_t bit, struct cpuset *cs,
 	else
 		clear_bit(bit, &trialcs->flags);
 
+	balance_flag_changed = (is_sched_load_balance(cs) !=
+				is_sched_load_balance(trialcs));
+
 	/*
 	 * On default hierarchy, turning off sched_load_balance flag implies
 	 * an implicit cpu_exclusive. Turning on sched_load_balance will
 	 * clear the cpu_exclusive flag.
+	 *
+	 * sched_load_balance can only be turned off if all the CPUs are
+	 * in the parent's isolated CPU list.
 	 */
 	if ((bit == CS_SCHED_LOAD_BALANCE) &&
 	    cgroup_subsys_on_dfl(cpuset_cgrp_subsys)) {
@@ -1442,15 +1458,22 @@ static int update_flag(cpuset_flagbits_t bit, struct cpuset *cs,
 			clear_bit(CS_CPU_EXCLUSIVE, &trialcs->flags);
 		else
 			set_bit(CS_CPU_EXCLUSIVE, &trialcs->flags);
+
+		if (balance_flag_changed && !turning_on) {
+			struct cpuset *parent = parent_cs(cs);
+
+			err = -EBUSY;
+			if (!parent->isolation_count ||
+			    !cpumask_subset(trialcs->cpus_allowed,
+					    parent->cpus_allowed))
+				goto out;
+		}
 	}
 
 	err = validate_change(cs, trialcs);
 	if (err < 0)
 		goto out;
 
-	balance_flag_changed = (is_sched_load_balance(cs) !=
-				is_sched_load_balance(trialcs));
-
 	spread_flag_changed = ((is_spread_slab(cs) != is_spread_slab(trialcs))
 			|| (is_spread_page(cs) != is_spread_page(trialcs)));
 
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

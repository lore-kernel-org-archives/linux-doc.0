Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 595807DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 13:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752100AbeDSNsO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 09:48:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43868 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752710AbeDSNrR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Apr 2018 09:47:17 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3598D406803E;
        Thu, 19 Apr 2018 13:47:17 +0000 (UTC)
Received: from llong.com (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 940E7215CDA7;
        Thu, 19 Apr 2018 13:47:16 +0000 (UTC)
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
Subject: [PATCH v7 5/5] cpuset: Make generate_sched_domains() recognize isolated_cpus
Date:   Thu, 19 Apr 2018 09:47:04 -0400
Message-Id: <1524145624-23655-6-git-send-email-longman@redhat.com>
In-Reply-To: <1524145624-23655-1-git-send-email-longman@redhat.com>
References: <1524145624-23655-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Thu, 19 Apr 2018 13:47:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Thu, 19 Apr 2018 13:47:17 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The generate_sched_domains() function and the hotplug code are modified
to make them use the newly introduced isolated_cpus mask for schedule
domains generation.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index d05c4c8..a67c77a 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -683,13 +683,14 @@ static int generate_sched_domains(cpumask_var_t **domains,
 	int ndoms = 0;		/* number of sched domains in result */
 	int nslot;		/* next empty doms[] struct cpumask slot */
 	struct cgroup_subsys_state *pos_css;
+	bool root_load_balance = is_sched_load_balance(&top_cpuset);
 
 	doms = NULL;
 	dattr = NULL;
 	csa = NULL;
 
 	/* Special case for the 99% of systems with one, full, sched domain */
-	if (is_sched_load_balance(&top_cpuset)) {
+	if (root_load_balance && !top_cpuset.isolation_count) {
 		ndoms = 1;
 		doms = alloc_sched_domains(ndoms);
 		if (!doms)
@@ -712,6 +713,8 @@ static int generate_sched_domains(cpumask_var_t **domains,
 	csn = 0;
 
 	rcu_read_lock();
+	if (root_load_balance)
+		csa[csn++] = &top_cpuset;
 	cpuset_for_each_descendant_pre(cp, pos_css, &top_cpuset) {
 		if (cp == &top_cpuset)
 			continue;
@@ -722,6 +725,9 @@ static int generate_sched_domains(cpumask_var_t **domains,
 		 * parent's cpus, so just skip them, and then we call
 		 * update_domain_attr_tree() to calc relax_domain_level of
 		 * the corresponding sched domain.
+		 *
+		 * If root is load-balancing, we can skip @cp if it
+		 * is a subset of the root's effective_cpus.
 		 */
 		if (!cpumask_empty(cp->cpus_allowed) &&
 		    !(is_sched_load_balance(cp) &&
@@ -729,6 +735,10 @@ static int generate_sched_domains(cpumask_var_t **domains,
 					 housekeeping_cpumask(HK_FLAG_DOMAIN))))
 			continue;
 
+		if (root_load_balance &&
+		    cpumask_subset(cp->cpus_allowed, top_cpuset.effective_cpus))
+			continue;
+
 		if (is_sched_load_balance(cp))
 			csa[csn++] = cp;
 
@@ -820,6 +830,12 @@ static int generate_sched_domains(cpumask_var_t **domains,
 	}
 	BUG_ON(nslot != ndoms);
 
+#ifdef CONFIG_DEBUG_KERNEL
+	for (i = 0; i < ndoms; i++)
+		pr_info("rebuild_sched_domains dom %d: %*pbl\n", i,
+			cpumask_pr_args(doms[i]));
+#endif
+
 done:
 	kfree(csa);
 
@@ -860,7 +876,12 @@ static void rebuild_sched_domains_locked(void)
 	 * passing doms with offlined cpu to partition_sched_domains().
 	 * Anyways, hotplug work item will rebuild sched domains.
 	 */
-	if (!cpumask_equal(top_cpuset.effective_cpus, cpu_active_mask))
+	if (!top_cpuset.isolation_count &&
+	    !cpumask_equal(top_cpuset.effective_cpus, cpu_active_mask))
+		goto out;
+
+	if (top_cpuset.isolation_count &&
+	   !cpumask_subset(top_cpuset.effective_cpus, cpu_active_mask))
 		goto out;
 
 	/* Generate domain masks and attrs */
@@ -1102,6 +1123,7 @@ static int update_isolated_cpumask(const char *buf)
 
 	top_cpuset.isolation_count = cpumask_weight(top_cpuset.isolated_cpus);
 	spin_unlock_irq(&callback_lock);
+	rebuild_sched_domains_locked();
 
 out_ok:
 	retval = 0;
@@ -2530,6 +2552,11 @@ static void cpuset_hotplug_workfn(struct work_struct *work)
 	cpumask_copy(&new_cpus, cpu_active_mask);
 	new_mems = node_states[N_MEMORY];
 
+	/*
+	 * If isolated_cpus is populated, it is likely that the check below
+	 * will produce a false positive on cpus_updated when the cpu list
+	 * isn't changed. It is extra work, but it is better to be safe.
+	 */
 	cpus_updated = !cpumask_equal(top_cpuset.effective_cpus, &new_cpus);
 	mems_updated = !nodes_equal(top_cpuset.effective_mems, new_mems);
 
@@ -2538,6 +2565,10 @@ static void cpuset_hotplug_workfn(struct work_struct *work)
 		spin_lock_irq(&callback_lock);
 		if (!on_dfl)
 			cpumask_copy(top_cpuset.cpus_allowed, &new_cpus);
+
+		if (top_cpuset.isolation_count)
+			cpumask_andnot(&new_cpus, &new_cpus,
+					top_cpuset.isolated_cpus);
 		cpumask_copy(top_cpuset.effective_cpus, &new_cpus);
 		spin_unlock_irq(&callback_lock);
 		/* we don't mess with cpumasks of tasks in top_cpuset */
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

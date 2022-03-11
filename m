Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88D5C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 11 Mar 2022 02:32:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345636AbiCKCdN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Mar 2022 21:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240600AbiCKCdM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Mar 2022 21:33:12 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6620FE86AF
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 18:32:09 -0800 (PST)
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KF8w43bLszcb2g;
        Fri, 11 Mar 2022 10:27:16 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 11 Mar 2022 10:32:07 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 11 Mar
 2022 10:32:07 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <corbet@lwn.net>, <peterz@infradead.org>, <mingo@redhat.com>
CC:     <linux-doc@vger.kernel.org>, <zhengbin13@huawei.com>,
        <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <tangyeechou@gmail.com>, Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH] docs: scheduler: Convert schedutil.txt to ReST
Date:   Fri, 11 Mar 2022 11:04:00 +0800
Message-ID: <20220311030400.32320-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

All other scheduler documents have been converted to *.rst. Let's do
the same for schedutil.txt.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
 Documentation/scheduler/index.rst             |  1 +
 .../{schedutil.txt => schedutil.rst}          | 50 ++++++++++---------
 2 files changed, 28 insertions(+), 23 deletions(-)
 rename Documentation/scheduler/{schedutil.txt => schedutil.rst} (85%)

diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 30cca8a37b3b..b430d856056a 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -14,6 +14,7 @@ Linux Scheduler
     sched-domains
     sched-capacity
     sched-energy
+    schedutil
     sched-nice-design
     sched-rt-group
     sched-stats
diff --git a/Documentation/scheduler/schedutil.txt b/Documentation/scheduler/schedutil.rst
similarity index 85%
rename from Documentation/scheduler/schedutil.txt
rename to Documentation/scheduler/schedutil.rst
index 78f6b91e2291..bd96e08cdf88 100644
--- a/Documentation/scheduler/schedutil.txt
+++ b/Documentation/scheduler/schedutil.rst
@@ -1,11 +1,15 @@
+=========
+Schedutil
+=========
 
+.. note::
 
-NOTE; all this assumes a linear relation between frequency and work capacity,
-we know this is flawed, but it is the best workable approximation.
+   All this assumes a linear relation between frequency and work capacity,
+   we know this is flawed, but it is the best workable approximation.
 
 
 PELT (Per Entity Load Tracking)
--------------------------------
+===============================
 
 With PELT we track some metrics across the various scheduler entities, from
 individual tasks to task-group slices to CPU runqueues. As the basis for this
@@ -38,8 +42,8 @@ while 'runnable' will increase to reflect the amount of contention.
 For more detail see: kernel/sched/pelt.c
 
 
-Frequency- / CPU Invariance
----------------------------
+Frequency / CPU Invariance
+==========================
 
 Because consuming the CPU for 50% at 1GHz is not the same as consuming the CPU
 for 50% at 2GHz, nor is running 50% on a LITTLE CPU the same as running 50% on
@@ -47,23 +51,23 @@ a big CPU, we allow architectures to scale the time delta with two ratios, one
 Dynamic Voltage and Frequency Scaling (DVFS) ratio and one microarch ratio.
 
 For simple DVFS architectures (where software is in full control) we trivially
-compute the ratio as:
+compute the ratio as::
 
-	    f_cur
+            f_cur
   r_dvfs := -----
             f_max
 
 For more dynamic systems where the hardware is in control of DVFS we use
 hardware counters (Intel APERF/MPERF, ARMv8.4-AMU) to provide us this ratio.
-For Intel specifically, we use:
+For Intel specifically, we use::
 
-	   APERF
+           APERF
   f_cur := ----- * P0
-	   MPERF
+           MPERF
 
-	     4C-turbo;	if available and turbo enabled
-  f_max := { 1C-turbo;	if turbo enabled
-	     P0;	otherwise
+             4C-turbo;  if available and turbo enabled
+  f_max := { 1C-turbo;  if turbo enabled
+             P0;        otherwise
 
                     f_cur
   r_dvfs := min( 1, ----- )
@@ -87,7 +91,7 @@ For more detail see:
 
 
 UTIL_EST / UTIL_EST_FASTUP
---------------------------
+==========================
 
 Because periodic tasks have their averages decayed while they sleep, even
 though when running their expected utilization will be the same, they suffer a
@@ -106,7 +110,7 @@ For more detail see: kernel/sched/fair.c:util_est_dequeue()
 
 
 UCLAMP
-------
+======
 
 It is possible to set effective u_min and u_max clamps on each CFS or RT task;
 the runqueue keeps an max aggregate of these clamps for all running tasks.
@@ -115,7 +119,7 @@ For more detail see: include/uapi/linux/sched/types.h
 
 
 Schedutil / DVFS
-----------------
+================
 
 Every time the scheduler load tracking is updated (task wakeup, task
 migration, time progression) we call out to schedutil to update the hardware
@@ -123,19 +127,19 @@ DVFS state.
 
 The basis is the CPU runqueue's 'running' metric, which per the above it is
 the frequency invariant utilization estimate of the CPU. From this we compute
-a desired frequency like:
+a desired frequency like::
 
-             max( running, util_est );	if UTIL_EST
-  u_cfs := { running;			otherwise
+             max( running, util_est );  if UTIL_EST
+  u_cfs := { running;                   otherwise
 
-               clamp( u_cfs + u_rt , u_min, u_max );	if UCLAMP_TASK
-  u_clamp := { u_cfs + u_rt;				otherwise
+               clamp( u_cfs + u_rt, u_min, u_max );  if UCLAMP_TASK
+  u_clamp := { u_cfs + u_rt;                         otherwise
 
   u := u_clamp + u_irq + u_dl;		[approx. see source for more detail]
 
   f_des := min( f_max, 1.25 u * f_max )
 
-XXX IO-wait; when the update is due to a task wakeup from IO-completion we
+XXX IO-wait: when the update is due to a task wakeup from IO-completion we
 boost 'u' above.
 
 This frequency is then used to select a P-state/OPP or directly munged into a
@@ -153,7 +157,7 @@ For more information see: kernel/sched/cpufreq_schedutil.c
 
 
 NOTES
------
+=====
 
  - On low-load scenarios, where DVFS is most relevant, the 'running' numbers
    will closely reflect utilization.
-- 
2.17.1


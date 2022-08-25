Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9FDECAA24
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 16:44:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243262AbiHYQoo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 12:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243362AbiHYQoM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 12:44:12 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36BFBC809
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 09:43:02 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso5542631pjk.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 09:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/PP0ux4xnVggwZX9NLWdLDgmxpszMjAcO6bhJJu5nGY=;
        b=UvrI7uci/V05kvoMUf3ILFGeF/R2vrNsWDDvRZeB1AmYyS1o9UyAv2f66GZ5tWvutD
         jPDVN2oJpVizBYXfth4UD7YeuYwPlowmHWVQPbCwt05ME/b6wVLIV9kc2kPirv/OFl9i
         btPY2W2iucdmMEUFSBkdATSREsUNQ7vaoH149BgbQ3S86zaHC9oUg5Yw0rzLnq4G/rLg
         HuzDirca8bvvnoQqqiucI0eHE4eUPaOvKMPTWtbpp4+7mLuKzHKzvYuahaS9ZFfI2a3m
         gDBqSb5pjSbikdNeNk/H+bN1mm72C/boZEjpal5ZqWuH8ZObfBghEQkPuPZd4kwYlIyd
         lFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/PP0ux4xnVggwZX9NLWdLDgmxpszMjAcO6bhJJu5nGY=;
        b=aa26h49gVQMX2NovvwXhaULEpYMePVycqh/ELtuTTm57YPf630Yg6cANM0pJdKiahG
         kxk623aa5ol58g4aPySA3XCL7j1kfpdkmz180OcQI+oREtAFnb+Queoq7VVmGo/aF6Vk
         Sd4VW/RurwVVVSva5pek9xZIKQYeREvNlM8XmPbeVqVr6z72HvZ2FMB6u+3VvlTB7FJY
         MaIxH6e0BDrKOyP4oxttaFHl1Amgv/ExzHtDRhf1/C90qh8vZqE1rewksQ2e9flHYTTk
         2o6r6s3pdOeG7f8c1LRdr/holIL1ntPW9oFzAjCoe/rtAj0/tuocVucyiv/44RQpWwgT
         8JaQ==
X-Gm-Message-State: ACgBeo3+aABBPdmDN8TpisOUS7ajWfyqaYB3xcF5qMhGqi8+oSD0qsWk
        V7JaBeZF6IBNEoZ7VXCMIA3EBm5TAp6yAA==
X-Google-Smtp-Source: AA6agR5T0XELOHYskVEEhPsX1HDkPM0boBsb58ZQhnd81NSz6WZtcG5Wi5My6jI9Vh6VPFKTqoXcPQ==
X-Received: by 2002:a17:902:bb94:b0:172:8fd9:7438 with SMTP id m20-20020a170902bb9400b001728fd97438mr4372382pls.174.1661445781918;
        Thu, 25 Aug 2022 09:43:01 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id b18-20020a62a112000000b005362314bf80sm12779408pff.67.2022.08.25.09.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 09:43:01 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com,
        surenb@google.com
Cc:     mingo@redhat.com, peterz@infradead.org, gregkh@linuxfoundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH v4 05/10] sched/psi: optimize task switch inside shared cgroups again
Date:   Fri, 26 Aug 2022 00:41:06 +0800
Message-Id: <20220825164111.29534-6-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825164111.29534-1-zhouchengming@bytedance.com>
References: <20220825164111.29534-1-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Way back when PSI_MEM_FULL was accounted from the timer tick, task
switching could simply iterate next and prev to the common ancestor to
update TSK_ONCPU and be done.

Then memstall ticks were replaced with checking curr->in_memstall
directly in psi_group_change(). That meant that now if the task switch
was between a memstall and a !memstall task, we had to iterate through
the common ancestors at least ONCE to fix up their state_masks.

We added the identical_state filter to make sure the common ancestor
elimination was skipped in that case. It seems that was always a
little too eager, because it caused us to walk the common ancestors
*twice* instead of the required once: the iteration for next could
have stopped at the common ancestor; prev could have updated TSK_ONCPU
up to the common ancestor, then finish to the root without changing
any flags, just to get the new curr->in_memstall into the state_masks.

This patch recognizes this and makes it so that we walk to the root
exactly once if state_mask needs updating, which is simply catching up
on a missed optimization that could have been done in commit 7fae6c8171d2
("psi: Use ONCPU state tracking machinery to detect reclaim") directly.

Apart from this, it's also necessary for the next patch "sched/psi: remove
NR_ONCPU task accounting". Suppose we walk the common ancestors twice:

(1) psi_group_change(.clear = 0, .set = TSK_ONCPU)
(2) psi_group_change(.clear = TSK_ONCPU, .set = 0)

We previously used tasks[NR_ONCPU] to record TSK_ONCPU, tasks[NR_ONCPU]++
in (1) then tasks[NR_ONCPU]-- in (2), so tasks[NR_ONCPU] still be correct.

The next patch change to use one bit in state mask to record TSK_ONCPU,
PSI_ONCPU bit will be set in (1), but then be cleared in (2), which cause
the psi_group_cpu has task running on CPU but without PSI_ONCPU bit set!

With this patch, we will never walk the common ancestors twice, so won't
have above problem.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
---
 kernel/sched/psi.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 77d53c03a76f..d71dbc2356ff 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -820,20 +820,15 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 	u64 now = cpu_clock(cpu);
 
 	if (next->pid) {
-		bool identical_state;
-
 		psi_flags_change(next, 0, TSK_ONCPU);
 		/*
-		 * When switching between tasks that have an identical
-		 * runtime state, the cgroup that contains both tasks
-		 * we reach the first common ancestor. Iterate @next's
-		 * ancestors only until we encounter @prev's ONCPU.
+		 * Set TSK_ONCPU on @next's cgroups. If @next shares any
+		 * ancestors with @prev, those will already have @prev's
+		 * TSK_ONCPU bit set, and we can stop the iteration there.
 		 */
-		identical_state = prev->psi_flags == next->psi_flags;
 		iter = NULL;
 		while ((group = iterate_groups(next, &iter))) {
-			if (identical_state &&
-			    per_cpu_ptr(group->pcpu, cpu)->tasks[NR_ONCPU]) {
+			if (per_cpu_ptr(group->pcpu, cpu)->tasks[NR_ONCPU]) {
 				common = group;
 				break;
 			}
@@ -877,10 +872,12 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 			psi_group_change(group, cpu, clear, set, now, wake_clock);
 
 		/*
-		 * TSK_ONCPU is handled up to the common ancestor. If we're tasked
-		 * with dequeuing too, finish that for the rest of the hierarchy.
+		 * TSK_ONCPU is handled up to the common ancestor. If there are
+		 * any other differences between the two tasks (e.g. prev goes
+		 * to sleep, or only one task is memstall), finish propagating
+		 * those differences all the way up to the root.
 		 */
-		if (sleep) {
+		if ((prev->psi_flags ^ next->psi_flags) & ~TSK_ONCPU) {
 			clear &= ~TSK_ONCPU;
 			for (; group; group = iterate_groups(prev, &iter))
 				psi_group_change(group, cpu, clear, set, now, wake_clock);
-- 
2.37.2


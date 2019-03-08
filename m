Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 55B5A7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Mar 2019 18:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbfCHSnh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Mar 2019 13:43:37 -0500
Received: from mail-it1-f202.google.com ([209.85.166.202]:56705 "EHLO
        mail-it1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728696AbfCHSng (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Mar 2019 13:43:36 -0500
Received: by mail-it1-f202.google.com with SMTP id j18so12436752itl.6
        for <linux-doc@vger.kernel.org>; Fri, 08 Mar 2019 10:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=il6G9EezI/fMlmphYMEu+28c9gYVmi2vxGNvZesouDw=;
        b=tjwDUtiobdfgKZIH++c88OYAAvRoSWJh7qHVhtehwxLEwOeHNDrMa9pD/txBuYov3w
         tpzrN9TjmUTADYocTrzDBUrTEzZMD5HxdOt2a9GMDUUyolNa+9tkNacxhzz4BzCGherl
         syRewsKwbdO+CjBTIM8eUiUdE6wz2kpm1eSAGLgIQgktEKLIThfLDv6pApzc1QI2qg2G
         klbVSbS32HsJq1EW8loyLsAGIsXoVyECiiHpJGdzMYVVZC+CFimkx6LQx5a+oPhpNKl8
         ig2xUUTSab4ro2ljYGE9dES4jtTPH+8mmUAJ60foFbGMnp0WadQ2fjLC/SzkO0K98Oj8
         DU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=il6G9EezI/fMlmphYMEu+28c9gYVmi2vxGNvZesouDw=;
        b=JSGpfOtD3JteWYaLoNt2U0iBdfd7w1MSk1ChWFiZOYnoA95GOw/MXufA29oaaeKxa3
         RWN9ilQAZ3njftCcTloJAAfACycA6EBUPQhpSxNxAWLqyTaJTDYJ9gCS+0h/wxp2WmNV
         Zsfb2GtPtmk6BG4lgY8L1ABzNaf99xJsDCf8kS0rdqNdaXjppsPzvmC9rikgbIJ6b56R
         62C6TZX7zasEa6vbwZUE2wj+UnDLK/7gu5ZgwC4STESdu7J5iUgrBSZshzQeFKHGfCaf
         vCOlBx0a1TZgXEmmDYiycqaGo9G8P+VQTk7Mb4ljgCUYbSymlOo4vBo/pTyANy6QWwW2
         ldLw==
X-Gm-Message-State: APjAAAWZsr38GKt0rKEMB8yCQPRRiuxHcx/RKi2upFo6UmcNmhVB06sD
        9wB/yhLbh/eWWV1AsLw+RW3v5dxtZxk=
X-Google-Smtp-Source: APXvYqwAwnYg5Nbq9SYI8Wv0WjT9si/BIA8kk9ROhAlWPiuYfhb0+1JdnfcDScdeun/zmwtuySgxLkrNte8=
X-Received: by 2002:a24:6cd5:: with SMTP id w204mr13988014itb.16.1552070615991;
 Fri, 08 Mar 2019 10:43:35 -0800 (PST)
Date:   Fri,  8 Mar 2019 10:43:09 -0800
In-Reply-To: <20190308184311.144521-1-surenb@google.com>
Message-Id: <20190308184311.144521-6-surenb@google.com>
Mime-Version: 1.0
References: <20190308184311.144521-1-surenb@google.com>
X-Mailer: git-send-email 2.21.0.360.g471c308f928-goog
Subject: [PATCH v5 5/7] psi: track changed states
From:   Suren Baghdasaryan <surenb@google.com>
To:     gregkh@linuxfoundation.org
Cc:     tj@kernel.org, lizefan@huawei.com, hannes@cmpxchg.org,
        axboe@kernel.dk, dennis@kernel.org, dennisszhou@gmail.com,
        mingo@redhat.com, peterz@infradead.org, akpm@linux-foundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Introduce changed_states parameter into collect_percpu_times to track
the states changed since the last update.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 kernel/sched/psi.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 337a445aefa3..59e4e1f8bc02 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -210,7 +210,8 @@ static bool test_state(unsigned int *tasks, enum psi_states state)
 	}
 }
 
-static void get_recent_times(struct psi_group *group, int cpu, u32 *times)
+static void get_recent_times(struct psi_group *group, int cpu, u32 *times,
+			     u32 *pchanged_states)
 {
 	struct psi_group_cpu *groupc = per_cpu_ptr(group->pcpu, cpu);
 	u64 now, state_start;
@@ -218,6 +219,8 @@ static void get_recent_times(struct psi_group *group, int cpu, u32 *times)
 	unsigned int seq;
 	u32 state_mask;
 
+	*pchanged_states = 0;
+
 	/* Snapshot a coherent view of the CPU state */
 	do {
 		seq = read_seqcount_begin(&groupc->seq);
@@ -246,6 +249,8 @@ static void get_recent_times(struct psi_group *group, int cpu, u32 *times)
 		groupc->times_prev[s] = times[s];
 
 		times[s] = delta;
+		if (delta)
+			*pchanged_states |= (1 << s);
 	}
 }
 
@@ -269,10 +274,11 @@ static void calc_avgs(unsigned long avg[3], int missed_periods,
 	avg[2] = calc_load(avg[2], EXP_300s, pct);
 }
 
-static bool collect_percpu_times(struct psi_group *group)
+static void collect_percpu_times(struct psi_group *group, u32 *pchanged_states)
 {
 	u64 deltas[NR_PSI_STATES - 1] = { 0, };
 	unsigned long nonidle_total = 0;
+	u32 changed_states = 0;
 	int cpu;
 	int s;
 
@@ -287,8 +293,11 @@ static bool collect_percpu_times(struct psi_group *group)
 	for_each_possible_cpu(cpu) {
 		u32 times[NR_PSI_STATES];
 		u32 nonidle;
+		u32 cpu_changed_states;
 
-		get_recent_times(group, cpu, times);
+		get_recent_times(group, cpu, times,
+				&cpu_changed_states);
+		changed_states |= cpu_changed_states;
 
 		nonidle = nsecs_to_jiffies(times[PSI_NONIDLE]);
 		nonidle_total += nonidle;
@@ -313,7 +322,8 @@ static bool collect_percpu_times(struct psi_group *group)
 	for (s = 0; s < NR_PSI_STATES - 1; s++)
 		group->total[s] += div_u64(deltas[s], max(nonidle_total, 1UL));
 
-	return nonidle_total;
+	if (pchanged_states)
+		*pchanged_states = changed_states;
 }
 
 static u64 update_averages(struct psi_group *group, u64 now)
@@ -373,6 +383,7 @@ static void psi_avgs_work(struct work_struct *work)
 {
 	struct delayed_work *dwork;
 	struct psi_group *group;
+	u32 changed_states;
 	bool nonidle;
 	u64 now;
 
@@ -383,7 +394,8 @@ static void psi_avgs_work(struct work_struct *work)
 
 	now = sched_clock();
 
-	nonidle = collect_percpu_times(group);
+	collect_percpu_times(group, &changed_states);
+	nonidle = changed_states & (1 << PSI_NONIDLE);
 	/*
 	 * If there is task activity, periodically fold the per-cpu
 	 * times and feed samples into the running averages. If things
@@ -718,7 +730,7 @@ int psi_show(struct seq_file *m, struct psi_group *group, enum psi_res res)
 
 	/* Update averages before reporting them */
 	mutex_lock(&group->avgs_lock);
-	collect_percpu_times(group);
+	collect_percpu_times(group, NULL);
 	update_averages(group, sched_clock());
 	mutex_unlock(&group->avgs_lock);
 
-- 
2.21.0.360.g471c308f928-goog


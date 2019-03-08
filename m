Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A0C9C7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Mar 2019 18:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbfCHSng (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Mar 2019 13:43:36 -0500
Received: from mail-qt1-f202.google.com ([209.85.160.202]:35855 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728693AbfCHSnd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Mar 2019 13:43:33 -0500
Received: by mail-qt1-f202.google.com with SMTP id p5so19540946qtp.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Mar 2019 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=5zrp8mnWP3uBM/Fizzp8Po+aOUFVr9GhLUoLscT+qvI=;
        b=N2+/GhOQIjgVthz+h+5kaB8hfb4yyrZZVmHe16ICqrfbYVc24XX7MCC9FuWksubwVU
         Xyjd64Yr/Z+WlCHwqfmHEv+CiriSFEdGbJ9EhGMGWuc80Qr3DgYdfRRtcofQeNGTEdK6
         3T8qSakvYZgmXfkQbtgGE7jw2pDafLAazJmbRsYkcTi49Se0zeK6UtEa9Ve9E0guUnNS
         wL8US7Ad5FVeD8X6Dbv/kQhn8oAj8KtMLTIjQz2bKZGZyoHB2wqqUQfC1pY0+K6tFI9s
         dUnUhmXIejpHH3UJHFZ6OtQ1mkX12leikIcwcgQhb8msIez1QXxhLaRnmJcOLvQ207By
         Rpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=5zrp8mnWP3uBM/Fizzp8Po+aOUFVr9GhLUoLscT+qvI=;
        b=cDUI2NcRM4SXiOqMhUBrGyPwtkqIoRxCExw1OlS7HNakKn7J6g/GVepaMu6R65eIIg
         OUx/palvVuX9iI/4t/QEh5ntpl20ufs+DVtGrIjByV8RpokyaUUza1Scdu3HmlbCBOen
         uQl55XGYN6suF0Y5sCa8mXWBl25IeDWYf8Oi7AgRjNqQQmfGp7A+zYGGGLM0M16vYz02
         WrQ7Tz+pP9OCtWhbNluSu7g3BtFgIp93KqAmWjPGXiDBw+APe3k9h2N3fqbOSaveJlGh
         Ti69RDajDDgsXH4oRl0gqE0NAd/qWvZ2QktcnXdImHEBkPO46M4eo7+AYLztWL/cJJ5v
         XOdA==
X-Gm-Message-State: APjAAAUSkwRwascnsT2qbaLQpHt4W/IJvbCl9X2q/9MPaxtaRyiDcO8h
        hrsX3pB2fBfGH7F8LCUuRVMsKNLvr+4=
X-Google-Smtp-Source: APXvYqyMGccggJ9hSdX5o1VkyMLTNxFEnyQRtZiCw//yBJ/b6Rl0YnlaVKMZGIxvWbcqMUZYihjxrpjsucE=
X-Received: by 2002:a37:ba47:: with SMTP id k68mr11068794qkf.60.1552070612363;
 Fri, 08 Mar 2019 10:43:32 -0800 (PST)
Date:   Fri,  8 Mar 2019 10:43:08 -0800
In-Reply-To: <20190308184311.144521-1-surenb@google.com>
Message-Id: <20190308184311.144521-5-surenb@google.com>
Mime-Version: 1.0
References: <20190308184311.144521-1-surenb@google.com>
X-Mailer: git-send-email 2.21.0.360.g471c308f928-goog
Subject: [PATCH v5 4/7] psi: split update_stats into parts
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

Split update_stats into collect_percpu_times and update_averages for
collect_percpu_times to be reused later inside psi monitor.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 kernel/sched/psi.c | 55 +++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 4fb4d9913bc8..337a445aefa3 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -269,17 +269,13 @@ static void calc_avgs(unsigned long avg[3], int missed_periods,
 	avg[2] = calc_load(avg[2], EXP_300s, pct);
 }
 
-static bool update_stats(struct psi_group *group)
+static bool collect_percpu_times(struct psi_group *group)
 {
 	u64 deltas[NR_PSI_STATES - 1] = { 0, };
-	unsigned long missed_periods = 0;
 	unsigned long nonidle_total = 0;
-	u64 now, expires, period;
 	int cpu;
 	int s;
 
-	mutex_lock(&group->avgs_lock);
-
 	/*
 	 * Collect the per-cpu time buckets and average them into a
 	 * single time sample that is normalized to wallclock time.
@@ -317,11 +313,18 @@ static bool update_stats(struct psi_group *group)
 	for (s = 0; s < NR_PSI_STATES - 1; s++)
 		group->total[s] += div_u64(deltas[s], max(nonidle_total, 1UL));
 
+	return nonidle_total;
+}
+
+static u64 update_averages(struct psi_group *group, u64 now)
+{
+	unsigned long missed_periods = 0;
+	u64 expires, period;
+	u64 avg_next_update;
+	int s;
+
 	/* avgX= */
-	now = sched_clock();
 	expires = group->avg_next_update;
-	if (now < expires)
-		goto out;
 	if (now - expires >= psi_period)
 		missed_periods = div_u64(now - expires, psi_period);
 
@@ -332,7 +335,7 @@ static bool update_stats(struct psi_group *group)
 	 * But the deltas we sample out of the per-cpu buckets above
 	 * are based on the actual time elapsing between clock ticks.
 	 */
-	group->avg_next_update = expires + ((1 + missed_periods) * psi_period);
+	avg_next_update = expires + ((1 + missed_periods) * psi_period);
 	period = now - (group->avg_last_update + (missed_periods * psi_period));
 	group->avg_last_update = now;
 
@@ -362,9 +365,8 @@ static bool update_stats(struct psi_group *group)
 		group->avg_total[s] += sample;
 		calc_avgs(group->avg[s], missed_periods, sample, period);
 	}
-out:
-	mutex_unlock(&group->avgs_lock);
-	return nonidle_total;
+
+	return avg_next_update;
 }
 
 static void psi_avgs_work(struct work_struct *work)
@@ -372,10 +374,16 @@ static void psi_avgs_work(struct work_struct *work)
 	struct delayed_work *dwork;
 	struct psi_group *group;
 	bool nonidle;
+	u64 now;
 
 	dwork = to_delayed_work(work);
 	group = container_of(dwork, struct psi_group, avgs_work);
 
+	mutex_lock(&group->avgs_lock);
+
+	now = sched_clock();
+
+	nonidle = collect_percpu_times(group);
 	/*
 	 * If there is task activity, periodically fold the per-cpu
 	 * times and feed samples into the running averages. If things
@@ -384,18 +392,15 @@ static void psi_avgs_work(struct work_struct *work)
 	 * go - see calc_avgs() and missed_periods.
 	 */
 
-	nonidle = update_stats(group);
-
 	if (nonidle) {
-		unsigned long delay = 0;
-		u64 now;
-
-		now = sched_clock();
-		if (group->avg_next_update > now)
-			delay = nsecs_to_jiffies(
-					group->avg_next_update - now) + 1;
-		schedule_delayed_work(dwork, delay);
+		if (now >= group->avg_next_update)
+			group->avg_next_update = update_averages(group, now);
+
+		schedule_delayed_work(dwork, nsecs_to_jiffies(
+				group->avg_next_update - now) + 1);
 	}
+
+	mutex_unlock(&group->avgs_lock);
 }
 
 static void record_times(struct psi_group_cpu *groupc, int cpu,
@@ -711,7 +716,11 @@ int psi_show(struct seq_file *m, struct psi_group *group, enum psi_res res)
 	if (static_branch_likely(&psi_disabled))
 		return -EOPNOTSUPP;
 
-	update_stats(group);
+	/* Update averages before reporting them */
+	mutex_lock(&group->avgs_lock);
+	collect_percpu_times(group);
+	update_averages(group, sched_clock());
+	mutex_unlock(&group->avgs_lock);
 
 	for (full = 0; full < 2 - (res == PSI_CPU); full++) {
 		unsigned long avg[3];
-- 
2.21.0.360.g471c308f928-goog


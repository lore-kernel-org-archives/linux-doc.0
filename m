Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77C4C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 11:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbiCILPx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 06:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbiCILPx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 06:15:53 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE9413CEC6
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 03:14:53 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id e15so1931606pfv.11
        for <linux-doc@vger.kernel.org>; Wed, 09 Mar 2022 03:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IsQsBuB2ms4XH7MMbYKCaAltmU40a94dVvRdCh2kPG8=;
        b=giQbAvpiNC6GgihtPUmX/gFcKXYFcGs5sk/zxjgS1mngiwkVPSv4j6HBatM0A6SLlD
         N8pUdXxYXl2dKA+Qime4DiOB5yxnMcG6y5PEEtMWzLJPHakjdt5TNPJ9vNIZBKiqfz5q
         FIS9Y3LvOE9bG3rek35JoAtOfqqZLFepdhsm2MbOwIMeEuLWd+7m0UBTr8YeUl9qIqwH
         DIMBlWDd/Hq4QUgfWKKEPdUYScu/rzE4O05+0ycytJSuR+bFfjPlArO5p5A6ZTAG0AFs
         kK1ckGlUZqDk+8DjcadQrClsK0k3ZPNAGZ5w3AzjGd8bBNPWttN+iWpfE5e3PCWow/PV
         ynGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IsQsBuB2ms4XH7MMbYKCaAltmU40a94dVvRdCh2kPG8=;
        b=nP9L6PhLFKx7E4H+2yD/m1NJ3TKIwi/KOVaDKqoyKFKJis+7lLiOnXKrRpy/LYZWBL
         nh80hx+7jATWjFMPvPNfKi/JN6Ih3a3zWnsoCb4cgiNoov/0QI5oD/FrHTYYTCqIkOz+
         f+yHLanhuLNHsHtVDtz/cFZa98LMBWvynsNgpHGIIfI5jbl3CrlhKThpOJULGkmy5SNl
         ZLpERVlmj1f8zvEXEOabLoJdP8h8hlgyd2SJK0qI1QuqVcoaqkdAZ4K6aSRBAHxSgvmf
         uiXHIAhLjTtbqoXnmFEA1xaixAqmGyHBDutV+Z3ls/ABhAfVDPEqkeuxKJCGTI2W6aPf
         55/Q==
X-Gm-Message-State: AOAM532PO4KS5UCNiviqe53HFUbSeTLs73/h9RhWhxKiBU3fOcDdOb/p
        iDx4wWos7KdJKqFA6R9UHNXLcQ==
X-Google-Smtp-Source: ABdhPJwBIGZHoRknu7XKYBKDZJFavSBHX1JbW99jXbsjdCSN8eEhyiUwRrZ9tgEjVnaIgmQI9H+4+g==
X-Received: by 2002:a63:204d:0:b0:378:c9e5:bea6 with SMTP id r13-20020a63204d000000b00378c9e5bea6mr17841111pgm.573.1646824493366;
        Wed, 09 Mar 2022 03:14:53 -0800 (PST)
Received: from C02CV1DAMD6P.bytedance.net ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id v66-20020a622f45000000b004f129e7767fsm2459618pfv.130.2022.03.09.03.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 03:14:52 -0800 (PST)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     corbet@lwn.net, hannes@cmpxchg.org, mingo@redhat.com,
        peterz@infradead.org, surenb@google.com, ebiggers@google.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        songmuchun@bytedance.com,
        Chengming Zhou <zhouchengming@bytedance.com>,
        Martin Steigerwald <Martin.Steigerwald@proact.de>
Subject: [PATCH v2] psi: report zeroes for CPU full at the system level
Date:   Wed,  9 Mar 2022 19:14:45 +0800
Message-Id: <20220309111445.86484-1-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Martin find it confusing when look at the /proc/pressure/cpu output,
and found no hint about that CPU "full" line in psi Documentation.

% cat /proc/pressure/cpu
some avg10=0.92 avg60=0.91 avg300=0.73 total=933490489
full avg10=0.22 avg60=0.23 avg300=0.16 total=358783277

The PSI_CPU_FULL state is introduced by commit e7fcd7622823
("psi: Add PSI_CPU_FULL state"), which mainly for cgroup level,
but also counted at the system level as a side effect.

Naturally, the FULL state doesn't exist for the CPU resource at
the system level. These "full" numbers can come from CPU idle
schedule latency. For example, t1 is the time when task wakeup
on an idle CPU, t2 is the time when CPU pick and switch to it.
The delta of (t2 - t1) will be in CPU_FULL state.

Another case all processes can be stalled is when all cgroups
have been throttled at the same time, which unlikely to happen.

Anyway, CPU_FULL metric is meaningless and confusing at the
system level. So this patch will report zeroes for CPU full
at the system level, and update psi Documentation accordingly.

Fixes: e7fcd7622823 ("psi: Add PSI_CPU_FULL state")
Reported-by: Martin Steigerwald <Martin.Steigerwald@proact.de>
Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
---
Changes in v2:
- update doc about the zeroes in CPU full at the system level.
---
 Documentation/accounting/psi.rst |  9 ++++-----
 kernel/sched/psi.c               | 15 +++++++++------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/accounting/psi.rst b/Documentation/accounting/psi.rst
index 860fe651d645..5e40b3f437f9 100644
--- a/Documentation/accounting/psi.rst
+++ b/Documentation/accounting/psi.rst
@@ -37,11 +37,7 @@ Pressure interface
 Pressure information for each resource is exported through the
 respective file in /proc/pressure/ -- cpu, memory, and io.
 
-The format for CPU is as such::
-
-	some avg10=0.00 avg60=0.00 avg300=0.00 total=0
-
-and for memory and IO::
+The format is as such::
 
 	some avg10=0.00 avg60=0.00 avg300=0.00 total=0
 	full avg10=0.00 avg60=0.00 avg300=0.00 total=0
@@ -58,6 +54,9 @@ situation from a state where some tasks are stalled but the CPU is
 still doing productive work. As such, time spent in this subset of the
 stall state is tracked separately and exported in the "full" averages.
 
+CPU full is undefined at the system level, but has been reported
+since 5.13, so it is set to zero for backward compatibility.
+
 The ratios (in %) are tracked as recent trends over ten, sixty, and
 three hundred second windows, which gives insight into short term events
 as well as medium and long term trends. The total absolute stall time
diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index e14358178849..97fd85c5143c 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1062,14 +1062,17 @@ int psi_show(struct seq_file *m, struct psi_group *group, enum psi_res res)
 	mutex_unlock(&group->avgs_lock);
 
 	for (full = 0; full < 2; full++) {
-		unsigned long avg[3];
-		u64 total;
+		unsigned long avg[3] = { 0, };
+		u64 total = 0;
 		int w;
 
-		for (w = 0; w < 3; w++)
-			avg[w] = group->avg[res * 2 + full][w];
-		total = div_u64(group->total[PSI_AVGS][res * 2 + full],
-				NSEC_PER_USEC);
+		/* CPU FULL is undefined at the system level */
+		if (!(group == &psi_system && res == PSI_CPU && full)) {
+			for (w = 0; w < 3; w++)
+				avg[w] = group->avg[res * 2 + full][w];
+			total = div_u64(group->total[PSI_AVGS][res * 2 + full],
+					NSEC_PER_USEC);
+		}
 
 		seq_printf(m, "%s avg10=%lu.%02lu avg60=%lu.%02lu avg300=%lu.%02lu total=%llu\n",
 			   full ? "full" : "some",
-- 
2.20.1


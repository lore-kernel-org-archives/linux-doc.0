Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 07CEA7E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Apr 2018 07:43:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754378AbeDCHnI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Apr 2018 03:43:08 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35859 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751974AbeDCHnH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Apr 2018 03:43:07 -0400
Received: by mail-wm0-f66.google.com with SMTP id x82so32742335wmg.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Apr 2018 00:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evidence-eu-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=9IcEW2ux/sS8YMUDdQMh5ucLF9nFlRzegLn3ygo8sWQ=;
        b=CUzPnTOck0huIp3Ii/KgMAQU0P/knR4VAd7A4pi99wxH3HkP4pJgtIGomQ31jE0H7L
         osS+wHkv7R35g84JZGptnoBcne7hXoEGIgDWn0sxwdUkXg03NTlZLjtN2InxG5GDsa91
         2vX5PDt4UXOKf+dXLxkjpBzXYifkPD1smVVsyx8+C1B/1j1xSpW+/2pjImNGYV68YfUx
         Hs5evJQ99wNARNZ4PAirHCVBufG9Ezb/vmTfCSZNMk6Y3b8zIOUqAN+N2vcqRRge00nM
         /t+2AESdmm1jHqHWlKtl+CfOLfSV1PFUj+YTDfwpccY96CYTS9zKVKfS1ZrUlaDZSzWL
         QYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9IcEW2ux/sS8YMUDdQMh5ucLF9nFlRzegLn3ygo8sWQ=;
        b=Rp3UBLjaPmdcsSdJRieQt5CDcjNX1sdG1VEAxaMwMOy3wNOuVdDijocjjbfXWVn3Vo
         65L1ZBfztAAKjCr3TBZyiWD4x6iol2ZfGSFoqlxeMlmKxydRcqE25qvtWhZHbkeJtjM2
         w9anl99Nca0Ggv2p4GV5RMYFVfm98VkZ6KQZ1m/4RrgoJ5Xids/EK9mWvyXxPmoLUo6K
         9nZZQ1kKNJVsNoNBSoyX7EJIZBtCQSxnZ9S9kMvAnnUlLTobQOWQL1pMrVErRytcaSns
         aq0kMJYB6T83QC8iVknyL/bIu72ttLeGrqMv7WBBxNN36iv+p3032tuA33li0bCZ2wDS
         kcyw==
X-Gm-Message-State: ALQs6tAKdaRHI/X9+bOA8+l20kbVqZ+EIkXmbCGmb9ZndcE+mx6F3y75
        Uzlf3igsUSCRG6wLi7m6HdBmDQ==
X-Google-Smtp-Source: AIpwx4+qY6UMorzBgs8fs6v6fCE2eq9hXEq3GhkQgFKM4h9AaHZeuY4A6fcbAcar8OXAVycznDK1KA==
X-Received: by 10.28.40.4 with SMTP id o4mr3449888wmo.44.1522741386067;
        Tue, 03 Apr 2018 00:43:06 -0700 (PDT)
Received: from localhost.localdomain (host92-93-static.8-79-b.business.telecomitalia.it. [79.8.93.92])
        by smtp.gmail.com with ESMTPSA id l34sm1602695wre.14.2018.04.03.00.43.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 03 Apr 2018 00:43:04 -0700 (PDT)
From:   Claudio Scordino <claudio@evidence.eu.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Claudio Scordino <claudio@evidence.eu.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Luca Abeni <luca.abeni@santannapisa.it>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] sched/deadline: add overrun signal and GRUB-PA in the documentation
Date:   Tue,  3 Apr 2018 09:42:42 +0200
Message-Id: <1522741362-4542-1-git-send-email-claudio@evidence.eu.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Claudio Scordino <claudio@evidence.eu.com>
CC: Juri Lelli <juri.lelli@redhat.com>
CC: Luca Abeni <luca.abeni@santannapisa.it>
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
---
 Documentation/scheduler/sched-deadline.txt | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/scheduler/sched-deadline.txt b/Documentation/scheduler/sched-deadline.txt
index 8ce78f8..b14e03f 100644
--- a/Documentation/scheduler/sched-deadline.txt
+++ b/Documentation/scheduler/sched-deadline.txt
@@ -49,7 +49,7 @@ CONTENTS
 2.1 Main algorithm
 ------------------
 
- SCHED_DEADLINE uses three parameters, named "runtime", "period", and
+ SCHED_DEADLINE [18] uses three parameters, named "runtime", "period", and
  "deadline", to schedule tasks. A SCHED_DEADLINE task should receive
  "runtime" microseconds of execution time every "period" microseconds, and
  these "runtime" microseconds are available within "deadline" microseconds
@@ -117,6 +117,10 @@ CONTENTS
          scheduling deadline = scheduling deadline + period
          remaining runtime = remaining runtime + runtime
 
+ The SCHED_FLAG_DL_OVERRUN flag in sched_attr's sched_flags field allows a task
+ to get informed about runtime overruns through the delivery of SIGXCPU
+ signals.
+
 
 2.2 Bandwidth reclaiming
 ------------------------
@@ -279,6 +283,19 @@ CONTENTS
     running_bw is incremented.
 
 
+2.3 Energy-aware scheduling
+------------------------
+
+ When cpufreq's schedutil governor is selected, SCHED_DEADLINE implements the
+ GRUB-PA [19] algorithm, reducing the CPU operating frequency to the minimum
+ value that still allows to meet the deadlines. This behavior is currently
+ implemented only for ARM architectures.
+
+ A particular care must be taken in case the time needed for changing frequency
+ is of the same order of magnitude of the reservation period. In such cases,
+ setting a fixed CPU frequency results in a lower amount of deadline misses.
+
+
 3. Scheduling Real-Time Tasks
 =============================
 
@@ -505,6 +522,12 @@ CONTENTS
   17 - L. Abeni, G. Lipari, A. Parri, Y. Sun, Multicore CPU reclaiming: parallel
        or sequential?. In Proceedings of the 31st Annual ACM Symposium on Applied
        Computing, 2016.
+  18 - J. Lelli, C. Scordino, L. Abeni, D. Faggioli, Deadline scheduling in the
+       Linux kernel, Software: Practice and Experience, 46(6): 821-839, June
+       2016.
+  19 - C. Scordino, L. Abeni, J. Lelli, Energy-Aware Real-Time Scheduling in
+       the Linux Kernel, 33rd ACM/SIGAPP Symposium On Applied Computing (SAC
+       2018), Pau, France, April 2018.
 
 
 4. Bandwidth management
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

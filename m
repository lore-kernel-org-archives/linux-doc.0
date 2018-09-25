Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 13B2B7D581
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 18:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbeIZAfO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 20:35:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34797 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbeIZAfN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 20:35:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id k19-v6so11808365pfi.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Sep 2018 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IxI1FgJwMERM3UAhQcklkAKLrTq7+Ffd56oaBhs9q2Y=;
        b=bX7DIYfq1TChJhi9OeUZVUPD/bUJU9KtYrS++kKV1v4hwpxJPazdz1oaWTt4ZY6FaH
         3Cgzv03qQBO6VYO7Hqdg43006DEnetOYFmDSI0F/o0i5rZd2ECV183Q8wtN6ya4Bcjex
         m/vG80PsKKOeRN04CgD0U8d/swBA8w04gYQug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IxI1FgJwMERM3UAhQcklkAKLrTq7+Ffd56oaBhs9q2Y=;
        b=WZMObbxt3r3YMcReEnP4fs4B8i8EPr1KjCkbeCw2aLT/6bnklLvLdjMDQZzsXWctGO
         oHWt9Nqd/5gTsWhll2/BsqLDYIwvVM2p7Hv+Cli+/ny78hX0XPWwWHz3DIRzl43WJbCt
         TFAXLyetxFuuGPxPT4zdxo+fkg2/8AqloUkHRpAGGgCOe7+C0n7nAvCDGAEeutWnLHmu
         HCq7UPWIsuXoNfaNEhIJAfmobHi1dwpFt9Z6Oy5h3q81rrPVI8QZXZb2gD8KNiJM575W
         T/wMitbowCOog+n5rmqXrpoOmbw+etEjhU74OUbcPvppysmyA4R4IZ6TaeMvTrdFcrir
         iufw==
X-Gm-Message-State: ABuFfohnbNtIPWj+QCoJbmHbTnl5pHoEBVLzUqB8RedOe2cRQ7ETqxr6
        jX62ZchLNXYDJT6YpZYaRuWj5A==
X-Google-Smtp-Source: ACcGV6004pCiQ5OGNOj/0U5kQopZ+EBGCnc/IrPqo13yWR3XCD8orlWqCksF3ExmHai8rMRiQuhG+Q==
X-Received: by 2002:a65:53c9:: with SMTP id z9-v6mr2123970pgr.203.1537899986543;
        Tue, 25 Sep 2018 11:26:26 -0700 (PDT)
Received: from joelaf-glaptop0.roam.corp.google.com (c-98-210-118-128.hsd1.ca.comcast.net. [98.210.118.128])
        by smtp.gmail.com with ESMTPSA id x70-v6sm6883626pfk.85.2018.09.25.11.26.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Sep 2018 11:26:25 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [1/5] doc: rcu: Update information about resched_cpu
Date:   Tue, 25 Sep 2018 11:25:57 -0700
Message-Id: <20180925182601.37421-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.444.g18242da7ef-goog
In-Reply-To: <20180925182601.37421-1-joel@joelfernandes.org>
References: <20180925182601.37421-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since commit fced9c8cfe6b ("rcu: Avoid resched_cpu() when rescheduling
the current CPU"), resched_cpu is not directly called from
sync_sched_exp_handler. Update the documentation about the same.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 .../Expedited-Grace-Periods/Expedited-Grace-Periods.html    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.html b/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.html
index e62c7c34a369..8e4f873b979f 100644
--- a/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.html
+++ b/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.html
@@ -160,9 +160,9 @@ was in flight.
 If the CPU is idle, then <tt>sync_sched_exp_handler()</tt> reports
 the quiescent state.
 
-<p>
-Otherwise, the handler invokes <tt>resched_cpu()</tt>, which forces
-a future context switch.
+<p> Otherwise, the handler forces a future context switch by setting the
+NEED_RESCHED flag of the current task's thread flag and the CPU preempt
+counter.
 At the time of the context switch, the CPU reports the quiescent state.
 Should the CPU go offline first, it will report the quiescent state
 at that time.
-- 
2.19.0.444.g18242da7ef-goog


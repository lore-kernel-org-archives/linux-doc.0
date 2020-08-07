Return-Path: <SRS0=iD3b=BR=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13646C433DF
	for <linux-doc@archiver.kernel.org>; Fri,  7 Aug 2020 17:08:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C38632086A
	for <linux-doc@archiver.kernel.org>; Fri,  7 Aug 2020 17:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="deJkkdWO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbgHGRHu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Aug 2020 13:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgHGRHb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Aug 2020 13:07:31 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9382C061A28
        for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2020 10:07:29 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id cs12so1072956qvb.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2020 10:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9MZydlpZQdg9xwKnugPlE3q4Dt+DJHoXBV4KQJAvjEY=;
        b=deJkkdWOEfKC+kvKx7+ClVkyba0wnSQ8rJM4NqNvIF79qpU2xahjNyIRC1c1Y/YyF5
         XgzORW6SmZfDojsp6Zc12OtykRcV3OLEjSrwSHSoOnUdsUAff9VY33xJi9YhQTdkJpk1
         urtOTNP6u99muORbmAQ8qHsZ0OkI2TxO7cRSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9MZydlpZQdg9xwKnugPlE3q4Dt+DJHoXBV4KQJAvjEY=;
        b=kBkl2jlrMh/gLcjbhOrThK6k8i0+qQZN161QmYNpY6Xsae6QcoUrYt/HPWohMROtDt
         +IZ8WP/VS5fIEMBfZE49tEi86n9GIIxXqaFRDhVY5mXIefsbUVAcgYJdi1EaujaSzKTR
         53btL8ISBzlXBRNXn+beMNn/aKXmUeI6YAA8rFOZfvpumwL1BJmVtreuF3kZbVvFPajq
         BuppWI5vK+T35nCzaVRrL2puFhibc64M0HZhdwBFGSdetAQK4SKQpR6kpiV5l5vXhajR
         xh9WXx117WaztiRmEX27eo+j9KPIRchdnFdvXuLzXyfmlxUbR/O+BhZ++j0stZ13CyT0
         usbQ==
X-Gm-Message-State: AOAM532D7+Gxir9eRmeehjts1BlQJJIXl8RFdXO9pU49M+gCFLU+yrLg
        tyTuJ0q19ypBlRFguxrD9uBn9g==
X-Google-Smtp-Source: ABdhPJzi6+BKUlFyi4WmIraEUPz+M5LA6AdajZabrAIn6mEi6tTSesJUhYB/tcWro/rb77kWUZGDjA==
X-Received: by 2002:ad4:4302:: with SMTP id c2mr15344941qvs.246.1596820049011;
        Fri, 07 Aug 2020 10:07:29 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:cad3:ffff:feb3:bd59])
        by smtp.gmail.com with ESMTPSA id w18sm8559905qtk.1.2020.08.07.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 10:07:28 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        peterz@infradead.org, Randy Dunlap <rdunlap@infradead.org>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
        tglx@linutronix.de, vineethrp@gmail.com
Subject: [PATCH v4 1/5] rcu/tree: Add a warning if CPU being onlined did not report QS already
Date:   Fri,  7 Aug 2020 13:07:18 -0400
Message-Id: <20200807170722.2897328-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
In-Reply-To: <20200807170722.2897328-1-joel@joelfernandes.org>
References: <20200807170722.2897328-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, rcu_cpu_starting() checks to see if the RCU core expects a
quiescent state from the incoming CPU.  However, the current interaction
between RCU quiescent-state reporting and CPU-hotplug operations should
mean that the incoming CPU never needs to report a quiescent state.
First, the outgoing CPU reports a quiescent state if needed.  Second,
the race where the CPU is leaving just as RCU is initializing a new
grace period is handled by an explicit check for this condition.  Third,
the CPU's leaf rcu_node structure's ->lock serializes these checks.

This means that if rcu_cpu_starting() ever feels the need to report
a quiescent state, then there is a bug somewhere in the CPU hotplug
code or the RCU grace-period handling code.  This commit therefore
adds a WARN_ON_ONCE() to bring that bug to everyone's attention.

Cc: Paul E. McKenney <paulmck@kernel.org>
Cc: Neeraj Upadhyay <neeraju@codeaurora.org>
Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 kernel/rcu/tree.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 65e1b5e92319..a49fa3b60faa 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -3996,7 +3996,14 @@ void rcu_cpu_starting(unsigned int cpu)
 	rcu_gpnum_ovf(rnp, rdp); /* Offline-induced counter wrap? */
 	rdp->rcu_onl_gp_seq = READ_ONCE(rcu_state.gp_seq);
 	rdp->rcu_onl_gp_flags = READ_ONCE(rcu_state.gp_flags);
-	if (rnp->qsmask & mask) { /* RCU waiting on incoming CPU? */
+
+	/*
+	 * XXX: The following rcu_report_qs_rnp() is redundant. If the below
+	 * warning does not fire, consider replacing it with the "else" block,
+	 * by June 2021 or so (while keeping the warning). Refer to RCU's
+	 * Requirements documentation for the rationale.
+	 */
+	if (WARN_ON_ONCE(rnp->qsmask & mask)) { /* RCU waiting on incoming CPU? */
 		rcu_disable_urgency_upon_qs(rdp);
 		/* Report QS -after- changing ->qsmaskinitnext! */
 		rcu_report_qs_rnp(mask, rnp, rnp->gp_seq, flags);
-- 
2.28.0.236.gb10cc79966-goog


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E12A77D57F
	for <lwn-linux-doc@archive.lwn.net>; Sat, 22 Sep 2018 23:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbeIWFhB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 23 Sep 2018 01:37:01 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35072 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbeIWFhA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 23 Sep 2018 01:37:00 -0400
Received: by mail-pl1-f195.google.com with SMTP id g2-v6so7522725plo.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Sep 2018 16:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2yxP4rhfIhDVX/maUGdnrlkcLnjNANX3q76JH8ZURX0=;
        b=ZUqboCnM9ZG7xFxbvC7EYayAEVfJ2l1kN8pw2FsvaK8gYSvTtnhYU+O4ocgqTxpsY7
         gGm8aQgziXx+NbMSodtogA9AKsVVBaJgIdQLkUC0F6GYd9OpN8fosUBfr6bUOFcEOmxY
         62OgGkqDi3wurAf2l16KF9rnu+tkl4prNoBPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2yxP4rhfIhDVX/maUGdnrlkcLnjNANX3q76JH8ZURX0=;
        b=nKJDkUKOp91iOuMcZXnMsAR3WUuhnG4c7Kt3MEUqgRSmRd4OIU3HiyTRoWAW6wGQK4
         cKMq6p3F/o+WqznTHkRXqnY2ftMQOQ+hOYHdVIBJSbprt4c/UG2SzabGv2VQEgIkVR/c
         RKP9Y48U6x+rEKl/tD95F9bNCPnNpFMd6WSJk0TtEF09OWANQIq5Bk8K736rRkfFTesk
         FcsEPb2IXKTysZYLnQ+M0SYVdGHNFAjHslGHg0ltkeblzaBg/1s3cwnRGYBy9vDFR58I
         rkIKgdAwSNcjcHi+THUmX1wj1Ga459+mxzOUIpaeb3ogzbFag6IP0jug3nf9PS4P4YY6
         jEag==
X-Gm-Message-State: ABuFfoir7OZvjo0qQLAUWzm9hmAIZg6AGVPdIGvEyxrMXmRBhA4YphnY
        8c/GcWWnsull2/Ep/FIt2R/UlAi+eAU=
X-Google-Smtp-Source: ACcGV61PZMOYdvw3cRGg4CPuAf+ITcqoBWkXwRZPO2ga2T44ldc4d9F/dNog6fSvBqApTVTMy8djAQ==
X-Received: by 2002:a17:902:14e:: with SMTP id 72-v6mr4155963plb.299.1537659700437;
        Sat, 22 Sep 2018 16:41:40 -0700 (PDT)
Received: from joelaf-glaptop0.roam.corp.google.com (c-98-210-118-128.hsd1.ca.comcast.net. [98.210.118.128])
        by smtp.gmail.com with ESMTPSA id h4-v6sm32377789pgp.13.2018.09.22.16.41.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Sep 2018 16:41:39 -0700 (PDT)
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
Subject: [PATCH RFC 2/3] rcu: tree: Fix comment about gp_seq_needed
Date:   Sat, 22 Sep 2018 19:41:26 -0400
Message-Id: <20180922234127.94970-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.444.g18242da7ef-goog
In-Reply-To: <20180922234127.94970-1-joel@joelfernandes.org>
References: <20180922234127.94970-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

rcu_state does not have a gp_seq_needed field. This comment therefore is
confusing or incorrect. Fix it.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 kernel/rcu/tree.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/tree.h b/kernel/rcu/tree.h
index 57a937ac51c2..fd2ba3f9eee9 100644
--- a/kernel/rcu/tree.h
+++ b/kernel/rcu/tree.h
@@ -57,7 +57,7 @@ struct rcu_node {
 					/*  some rcu_state fields as well as */
 					/*  following. */
 	unsigned long gp_seq;	/* Track rsp->rcu_gp_seq. */
-	unsigned long gp_seq_needed; /* Track rsp->rcu_gp_seq_needed. */
+	unsigned long gp_seq_needed; /* Track the furthest future gp request seen */
 	unsigned long completedqs; /* All QSes done for this node. */
 	unsigned long qsmask;	/* CPUs or groups that need to switch in */
 				/*  order for current grace period to proceed.*/
@@ -163,7 +163,7 @@ union rcu_noqs {
 struct rcu_data {
 	/* 1) quiescent-state and grace-period handling : */
 	unsigned long	gp_seq;		/* Track rsp->rcu_gp_seq counter. */
-	unsigned long	gp_seq_needed;	/* Track rsp->rcu_gp_seq_needed ctr. */
+	unsigned long	gp_seq_needed;	/* Track the furthest future gp request seen */
 	union rcu_noqs	cpu_no_qs;	/* No QSes yet for this CPU. */
 	bool		core_needs_qs;	/* Core waits for quiesc state. */
 	bool		beenonline;	/* CPU online at least once. */
-- 
2.19.0.444.g18242da7ef-goog


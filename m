Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 626737D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 18 Apr 2019 13:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733192AbfDRNUW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Apr 2019 09:20:22 -0400
Received: from terminus.zytor.com ([198.137.202.136]:45309 "EHLO
        terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731317AbfDRNUV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Apr 2019 09:20:21 -0400
Received: from terminus.zytor.com (localhost [127.0.0.1])
        by terminus.zytor.com (8.15.2/8.15.2) with ESMTPS id x3IDK3hM201549
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 18 Apr 2019 06:20:03 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 terminus.zytor.com x3IDK3hM201549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2019041745; t=1555593604;
        bh=3asjTbSBgJoFaUsAgbc9HXc9yPvu7F7RlRZcpsuB/X8=;
        h=Date:From:Cc:Reply-To:To:Subject:From;
        b=nevVB4zvPI3cVVfLElFOffFCSCkvplOLzbZqLeoiMG0Z+Ak1tg0C1qGZvL17v9xqb
         c1SVPMK+FexQdCAY8j+q8pTRrIEV42PNcrgiKpjYppl1u4sPFgNIO7HjiY4tju1z9Z
         ozLaLcXC4qF8Qdmurz67Vh1gPWBexgj2NxPtqdeycV+nvLcsuxiVtsCDnz6en9R+Xu
         V+Ykipbovao0HZc7GMGLvseRqaQ7X1pEfPMGUesnsYUjJ8/sPRP7tkKJDtvyVus4sI
         kqk4vhJtnLpxMiHVJK3Af0E3obuEXIIZVHdIGwKI6fR4+W2DaEcYkFQ/taushWWq8n
         qoXGsnsRavukw==
Received: (from tipbot@localhost)
        by terminus.zytor.com (8.15.2/8.15.2/Submit) id x3IDK2lO201541;
        Thu, 18 Apr 2019 06:20:02 -0700
Date:   Thu, 18 Apr 2019 06:20:02 -0700
X-Authentication-Warning: terminus.zytor.com: tipbot set sender to tipbot@zytor.com using -f
From:   "tip-bot for Paul E. McKenney" <tipbot@zytor.com>
Message-ID: <tip-1755ecedc485e8a898ac27b90be664784ddb6b57@git.kernel.org>
Cc:     tglx@linutronix.de, hpa@zytor.com, davem@davemloft.net,
        mhiramat@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
        anil.s.keshavamurthy@intel.com, naveen.n.rao@linux.ibm.com,
        mingo@kernel.org, paulmck@linux.ibm.com
Reply-To: paulmck@linux.ibm.com, linux-kernel@vger.kernel.org,
          naveen.n.rao@linux.ibm.com, corbet@lwn.net, davem@davemloft.net,
          hpa@zytor.com, tglx@linutronix.de,
          anil.s.keshavamurthy@intel.com, mingo@kernel.org,
          linux-doc@vger.kernel.org, mhiramat@kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip:core/rcu] doc/kprobes: Update obsolete RCU update functions
Git-Commit-ID: 1755ecedc485e8a898ac27b90be664784ddb6b57
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot.git.kernel.org>
Robot-Unsubscribe: Contact <mailto:hpa@kernel.org> to get blacklisted from
 these emails
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit-ID:  1755ecedc485e8a898ac27b90be664784ddb6b57
Gitweb:     https://git.kernel.org/tip/1755ecedc485e8a898ac27b90be664784ddb6b57
Author:     Paul E. McKenney <paulmck@linux.ibm.com>
AuthorDate: Wed, 9 Jan 2019 14:50:29 -0800
Committer:  Paul E. McKenney <paulmck@linux.ibm.com>
CommitDate: Wed, 27 Mar 2019 13:03:48 -0700

doc/kprobes: Update obsolete RCU update functions

The RCU flavors have been consolidated, so this commit replaces mentions
of the now-obsolete synchronize_sched() function with synchronize_rcu().

Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: <linux-doc@vger.kernel.org>
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 Documentation/kprobes.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/kprobes.txt b/Documentation/kprobes.txt
index 10f4499e677c..ee60e519438a 100644
--- a/Documentation/kprobes.txt
+++ b/Documentation/kprobes.txt
@@ -243,10 +243,10 @@ Optimization
 ^^^^^^^^^^^^
 
 The Kprobe-optimizer doesn't insert the jump instruction immediately;
-rather, it calls synchronize_sched() for safety first, because it's
+rather, it calls synchronize_rcu() for safety first, because it's
 possible for a CPU to be interrupted in the middle of executing the
-optimized region [3]_.  As you know, synchronize_sched() can ensure
-that all interruptions that were active when synchronize_sched()
+optimized region [3]_.  As you know, synchronize_rcu() can ensure
+that all interruptions that were active when synchronize_rcu()
 was called are done, but only if CONFIG_PREEMPT=n.  So, this version
 of kprobe optimization supports only kernels with CONFIG_PREEMPT=n [4]_.
 

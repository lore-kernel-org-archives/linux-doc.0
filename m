Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1DA217D087
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Oct 2018 23:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbeJFGTZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Oct 2018 02:19:25 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39351 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbeJFGTY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Oct 2018 02:19:24 -0400
Received: by mail-pg1-f194.google.com with SMTP id r9-v6so5341783pgv.6
        for <linux-doc@vger.kernel.org>; Fri, 05 Oct 2018 16:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j29U8JQnih/0IvhrWQU7iPNzapwYGDDk3J+T5RCZwvY=;
        b=aMkoVR+pEgL2tFS3HBxRLn6jJ2z+wF43kpa9cl2Hljty+Hh5S3g9pPagp42NJFs8/G
         3zzdncwdNkOmchInZum09BlkhcWTUGWVcGExDsjG/wjh05nOfWFBXn4JHeaMfpWz9owB
         CjSierXYLuo3xhSpR5jdRg5biUomrTlViHvZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j29U8JQnih/0IvhrWQU7iPNzapwYGDDk3J+T5RCZwvY=;
        b=OktmlXjkUn1la3flpHbIMpMHx6SQ+Q0Cm5KiwyGbWwHwUoy/UnRHfELR70vtX0zuBN
         iRBRH/39t6omgd5zmnk8OGwvxT2zbD4VjP7ibUCYBYbLf0M6yI+SRY1Uo+7pBQnDFr4c
         cSgVfZJw4HoJ0MPc2QzWWlKvL/Fu1dtd1EGMPVhY7pBSgIQTVSol4hetFcJ+fHoYxf4e
         NxfDZqJ1FWNXgYO1wfeLqx5sNqPGimg8VEVpg1iifynhrweH+j2ctUcnHwD24QHuMz0X
         H6Tl1WEoiFHCTE7n89j72lvPc3trPse5mvtQoQXzZu68qzbYcUvhhgpKZvI1Ut8A6Tq/
         06cQ==
X-Gm-Message-State: ABuFfojgLNbTA+TgtuezaBbqhrZMG/uTE3OJqNxFF55vUbTAXXRe8KBc
        cz2vJmc7gz6e4s7u/h0+tWAGeg==
X-Google-Smtp-Source: ACcGV60zqjgKLaM1bZKOR8qOjI2/NfHaB0+qT5FoxTRwa0lnQO/qhesCYetR65uNNG1Gr19BbnhWDw==
X-Received: by 2002:a63:4343:: with SMTP id q64-v6mr12329067pga.276.1538781509185;
        Fri, 05 Oct 2018 16:18:29 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id q76-v6sm16641028pfa.18.2018.10.05.16.18.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Oct 2018 16:18:28 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>, pantin@google.com
Subject: [PATCH RFC 1/5] doc: rcu: Update core and full API in whatisRCU
Date:   Fri,  5 Oct 2018 16:18:10 -0700
Message-Id: <20181005231815.170433-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <20181005231815.170433-1-joel@joelfernandes.org>
References: <20181005231815.170433-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

RCU consolidation effort causes the update side of the RCU API to be
consistent across all the 3 RCU flavors (normal, sched, bh). Update the
full API in the whatisRCU document accordingly so we are encouraging
folks to use the consolidated API than using the ones for the individual
flavors (which if I understand correcty, could be removed in the
future).

Also rcu_dereference is documented to be the same for all 3 mechanisms
(even before the consolidation), however its actually different - as
using the right rcu_dereference primitive (such as rcu_dereference_bh
for bh) is needed to make lock debugging work correctly. This update
also corrects that.

Also, add local_bh_disable() and local_bh_enable() as softirq
protection primitives and correct a grammar error in a quiz answer.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/RCU/whatisRCU.txt | 55 +++++++++++++++++----------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/Documentation/RCU/whatisRCU.txt b/Documentation/RCU/whatisRCU.txt
index 86d82f7f3500..2e8d1c0a824f 100644
--- a/Documentation/RCU/whatisRCU.txt
+++ b/Documentation/RCU/whatisRCU.txt
@@ -322,28 +322,27 @@ to their callers and (2) call_rcu() callbacks may be invoked.  Efficient
 implementations of the RCU infrastructure make heavy use of batching in
 order to amortize their overhead over many uses of the corresponding APIs.
 
-There are no fewer than three RCU mechanisms in the Linux kernel; the
-diagram above shows the first one, which is by far the most commonly used.
-The rcu_dereference() and rcu_assign_pointer() primitives are used for
-all three mechanisms, but different defer and protect primitives are
-used as follows:
+There are atleast three flavors of RCU usage in the Linux kernel. The diagram
+above shows the most common one. On the updater side, the rcu_assign_pointer(),
+sychronize_rcu() and call_rcu() primitives used are the same for all three
+flavors. However for protection (on the reader side), the primitives used vary
+depending on the flavor:
 
-	Defer			Protect
+a.	rcu_read_lock() / rcu_read_unlock()
+	rcu_dereference()
 
-a.	synchronize_rcu()	rcu_read_lock() / rcu_read_unlock()
-	call_rcu()		rcu_dereference()
+b.	rcu_read_lock_bh() / rcu_read_unlock_bh()
+	local_bh_disable() / local_bh_enable()
+	rcu_dereference_bh()
 
-b.	synchronize_rcu_bh()	rcu_read_lock_bh() / rcu_read_unlock_bh()
-	call_rcu_bh()		rcu_dereference_bh()
+c.	rcu_read_lock_sched() / rcu_read_unlock_sched()
+	preempt_disable() / preempt_enable()
+	local_irq_save() / local_irq_restore()
+	hardirq enter / hardirq exit
+	NMI enter / NMI exit
+	rcu_dereference_sched()
 
-c.	synchronize_sched()	rcu_read_lock_sched() / rcu_read_unlock_sched()
-	call_rcu_sched()	preempt_disable() / preempt_enable()
-				local_irq_save() / local_irq_restore()
-				hardirq enter / hardirq exit
-				NMI enter / NMI exit
-				rcu_dereference_sched()
-
-These three mechanisms are used as follows:
+These three flavors are used as follows:
 
 a.	RCU applied to normal data structures.
 
@@ -867,18 +866,20 @@ RCU:	Critical sections	Grace period		Barrier
 
 bh:	Critical sections	Grace period		Barrier
 
-	rcu_read_lock_bh	call_rcu_bh		rcu_barrier_bh
-	rcu_read_unlock_bh	synchronize_rcu_bh
-	rcu_dereference_bh	synchronize_rcu_bh_expedited
+	rcu_read_lock_bh	call_rcu		rcu_barrier
+	rcu_read_unlock_bh	synchronize_rcu
+	[local_bh_disable]	synchronize_rcu_expedited
+	[and friends]
+	rcu_dereference_bh
 	rcu_dereference_bh_check
 	rcu_dereference_bh_protected
 	rcu_read_lock_bh_held
 
 sched:	Critical sections	Grace period		Barrier
 
-	rcu_read_lock_sched	synchronize_sched	rcu_barrier_sched
-	rcu_read_unlock_sched	call_rcu_sched
-	[preempt_disable]	synchronize_sched_expedited
+	rcu_read_lock_sched	call_rcu		rcu_barrier
+	rcu_read_unlock_sched	synchronize_rcu
+	[preempt_disable]	synchronize_rcu_expedited
 	[and friends]
 	rcu_read_lock_sched_notrace
 	rcu_read_unlock_sched_notrace
@@ -890,8 +891,8 @@ sched:	Critical sections	Grace period		Barrier
 
 SRCU:	Critical sections	Grace period		Barrier
 
-	srcu_read_lock		synchronize_srcu	srcu_barrier
-	srcu_read_unlock	call_srcu
+	srcu_read_lock		call_srcu		srcu_barrier
+	srcu_read_unlock	synchronize_srcu
 	srcu_dereference	synchronize_srcu_expedited
 	srcu_dereference_check
 	srcu_read_lock_held
@@ -1034,7 +1035,7 @@ Answer:		Just as PREEMPT_RT permits preemption of spinlock
 		spinlocks blocking while in RCU read-side critical
 		sections.
 
-		Why the apparent inconsistency?  Because it is it
+		Why the apparent inconsistency?  Because it is
 		possible to use priority boosting to keep the RCU
 		grace periods short if need be (for example, if running
 		short of memory).  In contrast, if blocking waiting
-- 
2.19.0.605.g01d371f741-goog


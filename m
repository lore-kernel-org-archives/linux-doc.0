Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 72C117D072
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 10:02:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753409AbeFGKCQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 06:02:16 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:51616 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753047AbeFGKCP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jun 2018 06:02:15 -0400
Received: by mail-wm0-f65.google.com with SMTP id r15-v6so16721613wmc.1
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 03:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=X16pk0Ml23pL4XoS0LJ114RDqw7fQNqIijYPiOAf2eg=;
        b=hlHO9gtRedmyvuH6CHklUNngEGgzS2QkGqbiGXI82d4nL48dsB7wviNWQOtdG6cjz9
         4xbwietGMWJ3/eWXy0yrLSQroMXzyax5YpTdn4O0FE1Qc6w81AY5jGUsUWYRGXHv1Tz/
         vc3JtPJDkOyLf/lwFqYCEek+y81V8AfJnsh3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=X16pk0Ml23pL4XoS0LJ114RDqw7fQNqIijYPiOAf2eg=;
        b=irC+jR7zs7VrAa179OdactFvd2qewFDP89U3s+SppCrjWW+jjNxmEzfxIlDg/hKwbM
         BzK4cfVNSMHWJ+DnOswuLiFRgZii952WvK/jWvdFgXkpeB7Jx98c9NLWrlsXJFpIY/Ct
         50uZc+ezhL6ThD9WH1WMy7FHDMv1TqLeIMZwPXVSlivm8v0FErrA8FgDqNuzxiBEQY7Q
         eC5FxZ7OWpjxTytZiu6okziI+HpfzGF9JfX2inQuv4Yr2lieLO3Qd1g7zbr0KYBO2DxA
         S1iBehspArlLP6RakGVegkGmaXvzrwWUNLptDdWSC7VMffRxIc42SyY1oZlsNb3T4IUq
         DGXw==
X-Gm-Message-State: APt69E0z1puXpRTH251vRYKe7Au/I5VJlt//vhZVElgFdbJtpiwFgp/7
        jDdQ+LzqQ+ap73lHPbwwXHZADw==
X-Google-Smtp-Source: ADUXVKJ4HVVXtY0zhwY8YjydA2gEIp+RlChA7vgSrcszRIwVtJl7tX006Wl/V/itwFTjtQs10M/FkA==
X-Received: by 2002:a1c:581:: with SMTP id 123-v6mr1177187wmf.58.1528365733231;
        Thu, 07 Jun 2018 03:02:13 -0700 (PDT)
Received: from andrea.amarulasolutions.com (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id b80-v6sm2161583wmf.2.2018.06.07.03.02.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 03:02:12 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Andrea Parri <andrea.parri@amarulasolutions.com>,
        "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] doc: Update synchronize_rcu() definition in whatisRCU.txt
Date:   Thu,  7 Jun 2018 12:01:57 +0200
Message-Id: <1528365717-7213-1-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The synchronize_rcu() definition based on RW-locks in whatisRCU.txt
does not meet the "Memory-Barrier Guarantees" in Requirements.html;
for example, the following SB-like test:

    P0:                      P1:

    WRITE_ONCE(x, 1);        WRITE_ONCE(y, 1);
    synchronize_rcu();       smp_mb();
    r0 = READ_ONCE(y);       r1 = READ_ONCE(x);

should not be allowed to reach the state "r0 = 0 AND r1 = 0", but
the current write_lock()+write_unlock() definition can not ensure
this. Remedies this by inserting an smp_mb__after_spinlock().

Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Cc: Josh Triplett <josh@joshtriplett.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/RCU/whatisRCU.txt | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/RCU/whatisRCU.txt b/Documentation/RCU/whatisRCU.txt
index a27fbfb0efb82..86a54ff911fc2 100644
--- a/Documentation/RCU/whatisRCU.txt
+++ b/Documentation/RCU/whatisRCU.txt
@@ -586,6 +586,7 @@ It is extremely simple:
 	void synchronize_rcu(void)
 	{
 		write_lock(&rcu_gp_mutex);
+		smp_mb__after_spinlock();
 		write_unlock(&rcu_gp_mutex);
 	}
 
@@ -607,12 +608,15 @@ don't forget about them when submitting patches making use of RCU!]
 
 The rcu_read_lock() and rcu_read_unlock() primitive read-acquire
 and release a global reader-writer lock.  The synchronize_rcu()
-primitive write-acquires this same lock, then immediately releases
-it.  This means that once synchronize_rcu() exits, all RCU read-side
-critical sections that were in progress before synchronize_rcu() was
-called are guaranteed to have completed -- there is no way that
-synchronize_rcu() would have been able to write-acquire the lock
-otherwise.
+primitive write-acquires this same lock, then releases it.  This means
+that once synchronize_rcu() exits, all RCU read-side critical sections
+that were in progress before synchronize_rcu() was called are guaranteed
+to have completed -- there is no way that synchronize_rcu() would have
+been able to write-acquire the lock otherwise.  The smp_mb__after_spinlock()
+promotes synchronize_rcu() to a full memory barrier in compliance with
+the "Memory-Barrier Guarantees" listed in:
+
+	Documentation/RCU/Design/Requirements/Requirements.html.
 
 It is possible to nest rcu_read_lock(), since reader-writer locks may
 be recursively acquired.  Note also that rcu_read_lock() is immune
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 660447D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sun, 11 Aug 2019 22:11:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfHKWLa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 11 Aug 2019 18:11:30 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40212 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfHKWL3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Aug 2019 18:11:29 -0400
Received: by mail-pf1-f193.google.com with SMTP id p184so48756280pfp.7
        for <linux-doc@vger.kernel.org>; Sun, 11 Aug 2019 15:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jg1q7sKCNt8sI7DQNayH9inWmrGqOZwwN13K5ONIY4Q=;
        b=RNMJIQZoGD+AKdhoRPPti5I51AMHvV5mYDXKAJvWLLTIXhov2hAB/mlubzCGJZZvqN
         jdFGMPAG0ui/vmgBiTmzrK1TSmtU4Ff8BsjO/AOMv/ogYfOTU7XEwv4oYwpoynaUuXlz
         FB+/0/PFQfK8A6SidEG+2RrPrN0tWz6fx7rwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jg1q7sKCNt8sI7DQNayH9inWmrGqOZwwN13K5ONIY4Q=;
        b=af3VV7Temd8ob1kGsz7c4XkRHUCz54JHCLauB4i2e238r8b89eo2bDLmefkhkwyUgT
         T2+Jriz1JfvuIyzyVOfhD4uprahhb2xt8IwMQT1oKKxLcAGxg90e6+5Kf3C4P5e4Azq2
         yljw1Shm/yxuwztLchf6Rn3gQ1p4WMWbUQq4EBkR0Fs0JZJIltZGiMJa0LURJrgXm7EV
         XYBG/GkjMyGRxmqmAVvTwzZbdGsjwER4fgg8GM5F/Q0g/uqbjFjtM3448bkvdmxD5Mra
         FCcjBsk6cN/5DQFGRsIPETY8X4tw/xXnKGr4fI2cyAxyC5JvZ06haP53F4L5NEgH9aqk
         GJqw==
X-Gm-Message-State: APjAAAXMsGeaF+ocjSCOSgHwZcG14k+snEFJ9Zngnu08n25rU0WHOFxX
        ptp0e6PwSHmto/ay6WO01vza8Q==
X-Google-Smtp-Source: APXvYqwV0Q84Ts/sU/Wiyc5e58Q2BXvfPrlpDhgpdlrMav0oBqexshnN2vV/yXZRyBgkrd69z686NQ==
X-Received: by 2002:a62:e901:: with SMTP id j1mr33444864pfh.189.1565561489050;
        Sun, 11 Aug 2019 15:11:29 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id n10sm31376428pgv.67.2019.08.11.15.11.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 15:11:27 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>
Subject: [PATCH 1/3] workqueue: Convert for_each_wq to use built-in list check (v2)
Date:   Sun, 11 Aug 2019 18:11:09 -0400
Message-Id: <20190811221111.99401-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

list_for_each_entry_rcu now has support to check for RCU reader sections
as well as lock. Just use the support in it, instead of explicitly
checking in the caller.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 kernel/workqueue.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 601d61150b65..e882477ebf6e 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -364,11 +364,6 @@ static void workqueue_sysfs_unregister(struct workqueue_struct *wq);
 			 !lockdep_is_held(&wq_pool_mutex),		\
 			 "RCU or wq_pool_mutex should be held")
 
-#define assert_rcu_or_wq_mutex(wq)					\
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held() &&			\
-			 !lockdep_is_held(&wq->mutex),			\
-			 "RCU or wq->mutex should be held")
-
 #define assert_rcu_or_wq_mutex_or_pool_mutex(wq)			\
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held() &&			\
 			 !lockdep_is_held(&wq->mutex) &&		\
@@ -425,9 +420,8 @@ static void workqueue_sysfs_unregister(struct workqueue_struct *wq);
  * ignored.
  */
 #define for_each_pwq(pwq, wq)						\
-	list_for_each_entry_rcu((pwq), &(wq)->pwqs, pwqs_node)		\
-		if (({ assert_rcu_or_wq_mutex(wq); false; })) { }	\
-		else
+	list_for_each_entry_rcu((pwq), &(wq)->pwqs, pwqs_node,		\
+				 lock_is_held(&(wq->mutex).dep_map))
 
 #ifdef CONFIG_DEBUG_OBJECTS_WORK
 
-- 
2.23.0.rc1.153.gdeed80330f-goog


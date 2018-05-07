Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A3BB7DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 09:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752217AbeEGJgE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 05:36:04 -0400
Received: from osg.samsung.com ([64.30.133.232]:46532 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752088AbeEGJgC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 05:36:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 43EB5233FC;
        Mon,  7 May 2018 02:36:02 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sF-vfeQJVgJ4; Mon,  7 May 2018 02:36:01 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.109.86.dynamic.adsl.gvt.net.br [177.41.109.86])
        by osg.samsung.com (Postfix) with ESMTPSA id 284D6233D9;
        Mon,  7 May 2018 02:36:01 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fFcYo-00087k-VZ; Mon, 07 May 2018 06:35:58 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>
Subject: [PATCH 10/18] rcu: rcupdate.h: get rid of Sphinx warnings at rcu_pointer_handoff()
Date:   Mon,  7 May 2018 06:35:46 -0300
Message-Id: <a87d742e81124ddfeaa5b83daf10c91758c1b025.1525684985.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The code example at rcupdate.h currently produce lots of warnings:

	./include/linux/rcupdate.h:572: WARNING: Unexpected indentation.
	./include/linux/rcupdate.h:576: WARNING: Unexpected indentation.
	./include/linux/rcupdate.h:580: WARNING: Block quote ends without a blank line; unexpected unindent.
	./include/linux/rcupdate.h:582: WARNING: Block quote ends without a blank line; unexpected unindent.
	./include/linux/rcupdate.h:582: WARNING: Inline literal start-string without end-string.

Change it to a code-block.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 include/linux/rcupdate.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 36360d07f25b..c890d10978fa 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -568,8 +568,8 @@ static inline void rcu_preempt_sleep_check(void) { }
  * This is simply an identity function, but it documents where a pointer
  * is handed off from RCU to some other synchronization mechanism, for
  * example, reference counting or locking.  In C11, it would map to
- * kill_dependency().  It could be used as follows:
- * ``
+ * kill_dependency().  It could be used as follows::
+ *
  *	rcu_read_lock();
  *	p = rcu_dereference(gp);
  *	long_lived = is_long_lived(p);
@@ -580,7 +580,6 @@ static inline void rcu_preempt_sleep_check(void) { }
  *			p = rcu_pointer_handoff(p);
  *	}
  *	rcu_read_unlock();
- *``
  */
 #define rcu_pointer_handoff(p) (p)
 
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

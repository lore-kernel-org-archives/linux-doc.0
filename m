Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 431127DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 21:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759373AbeD0VBz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 17:01:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48160 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1759291AbeD0VAy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Apr 2018 17:00:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C8C7B4022909;
        Fri, 27 Apr 2018 21:00:53 +0000 (UTC)
Received: from llong.com (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8104510B2B45;
        Fri, 27 Apr 2018 21:00:53 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v6 5/8] ipc: Clamp semmni to the real IPCMNI limit
Date:   Fri, 27 Apr 2018 17:00:35 -0400
Message-Id: <1524862838-8247-6-git-send-email-longman@redhat.com>
In-Reply-To: <1524862838-8247-1-git-send-email-longman@redhat.com>
References: <1524862838-8247-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Fri, 27 Apr 2018 21:00:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Fri, 27 Apr 2018 21:00:53 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For SysV semaphores, the semmni value is the last part of the 4-element
sem number array. To make semmni behave in a similar way to msgmni
and shmmni, we can't directly use the _minmax handler. Instead,
a special sem specific handler is added to check the last argument
to make sure that it is clamped to the [0, IPCMNI] range and prints
a warning message once when an out-of-range value is being written.
This does require duplicating some of the code in the _minmax handlers.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 ipc/ipc_sysctl.c | 12 +++++++++++-
 ipc/sem.c        | 25 +++++++++++++++++++++++++
 ipc/util.h       |  4 ++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/ipc/ipc_sysctl.c b/ipc/ipc_sysctl.c
index d71f949..478e634 100644
--- a/ipc/ipc_sysctl.c
+++ b/ipc/ipc_sysctl.c
@@ -88,12 +88,22 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
 	return proc_dointvec_minmax(&ipc_table, write, buffer, lenp, ppos);
 }
 
+static int proc_ipc_sem_dointvec(struct ctl_table *table, int write,
+	void __user *buffer, size_t *lenp, loff_t *ppos)
+{
+	int ret = proc_ipc_dointvec(table, write, buffer, lenp, ppos);
+
+	sem_check_semmni(table, current->nsproxy->ipc_ns);
+	return ret;
+}
+
 #else
 #define proc_ipc_doulongvec_minmax NULL
 #define proc_ipc_dointvec	   NULL
 #define proc_ipc_dointvec_minmax   NULL
 #define proc_ipc_dointvec_minmax_orphans   NULL
 #define proc_ipc_auto_msgmni	   NULL
+#define proc_ipc_sem_dointvec	   NULL
 #endif
 
 static int zero;
@@ -177,7 +187,7 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
 		.data		= &init_ipc_ns.sem_ctls,
 		.maxlen		= 4*sizeof(int),
 		.mode		= 0644,
-		.proc_handler	= proc_ipc_dointvec,
+		.proc_handler	= proc_ipc_sem_dointvec,
 	},
 #ifdef CONFIG_CHECKPOINT_RESTORE
 	{
diff --git a/ipc/sem.c b/ipc/sem.c
index 06be75d..96bdec6 100644
--- a/ipc/sem.c
+++ b/ipc/sem.c
@@ -2397,3 +2397,28 @@ static int sysvipc_sem_proc_show(struct seq_file *s, void *it)
 	return 0;
 }
 #endif
+
+#ifdef CONFIG_PROC_SYSCTL
+/*
+ * Check to see if semmni is out of range and clamp it if necessary.
+ */
+void sem_check_semmni(struct ctl_table *table, struct ipc_namespace *ns)
+{
+	bool clamped = false;
+
+	/*
+	 * Clamp semmni to the range [0, IPCMNI].
+	 */
+	if (ns->sc_semmni < 0) {
+		ns->sc_semmni = 0;
+		clamped = true;
+	}
+	if (ns->sc_semmni > IPCMNI) {
+		ns->sc_semmni = IPCMNI;
+		clamped = true;
+	}
+	if (clamped)
+		pr_warn_ratelimited("sysctl: \"sem[3]\" was set out of range [%d, %d], clamped to %d.\n",
+				     0, IPCMNI, ns->sc_semmni);
+}
+#endif
diff --git a/ipc/util.h b/ipc/util.h
index acc5159..7c20871 100644
--- a/ipc/util.h
+++ b/ipc/util.h
@@ -218,6 +218,10 @@ int ipcget(struct ipc_namespace *ns, struct ipc_ids *ids,
 void free_ipcs(struct ipc_namespace *ns, struct ipc_ids *ids,
 		void (*free)(struct ipc_namespace *, struct kern_ipc_perm *));
 
+#ifdef CONFIG_PROC_SYSCTL
+extern void sem_check_semmni(struct ctl_table *table, struct ipc_namespace *ns);
+#endif
+
 #ifdef CONFIG_COMPAT
 #include <linux/compat.h>
 struct compat_ipc_perm {
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

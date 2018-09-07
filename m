Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4152E7DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Sep 2018 20:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbeIHBMQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Sep 2018 21:12:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47902 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726114AbeIHBLs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Sep 2018 21:11:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E8BAA34679;
        Fri,  7 Sep 2018 20:29:11 +0000 (UTC)
Received: from llong.com (dhcp-17-8.bos.redhat.com [10.18.17.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9196F2027EB6;
        Fri,  7 Sep 2018 20:29:11 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Takashi Iwai <tiwai@suse.de>, Davidlohr Bueso <dbueso@suse.de>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v9 2/4] ipc: IPCMNI limit check for semmni
Date:   Fri,  7 Sep 2018 16:28:55 -0400
Message-Id: <1536352137-12003-3-git-send-email-longman@redhat.com>
In-Reply-To: <1536352137-12003-1-git-send-email-longman@redhat.com>
References: <1536352137-12003-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Fri, 07 Sep 2018 20:29:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Fri, 07 Sep 2018 20:29:12 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For SysV semaphores, the semmni value is the last part of the 4-element
sem number array. To make semmni behave in a similar way to msgmni and
shmmni, we can't directly use the _minmax handler. Instead, a special
sem specific handler is added to check the last argument to make sure
that it is limited to the [0, IPCMNI] range. An error will be returned
if this is not the case.

Signed-off-by: Waiman Long <longman@redhat.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
---
 ipc/ipc_sysctl.c | 23 ++++++++++++++++++++++-
 ipc/util.h       |  9 +++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/ipc/ipc_sysctl.c b/ipc/ipc_sysctl.c
index f87cb29..49f9bf4 100644
--- a/ipc/ipc_sysctl.c
+++ b/ipc/ipc_sysctl.c
@@ -88,12 +88,33 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
 	return proc_dointvec_minmax(&ipc_table, write, buffer, lenp, ppos);
 }
 
+static int proc_ipc_sem_dointvec(struct ctl_table *table, int write,
+	void __user *buffer, size_t *lenp, loff_t *ppos)
+{
+	int ret, semmni;
+	struct ipc_namespace *ns = current->nsproxy->ipc_ns;
+
+	semmni = ns->sem_ctls[3];
+	ret = proc_ipc_dointvec(table, write, buffer, lenp, ppos);
+
+	if (!ret)
+		ret = sem_check_semmni(current->nsproxy->ipc_ns);
+
+	/*
+	 * Reset the semmni value if an error happens.
+	 */
+	if (ret)
+		ns->sem_ctls[3] = semmni;
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
@@ -175,7 +196,7 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
 		.data		= &init_ipc_ns.sem_ctls,
 		.maxlen		= 4*sizeof(int),
 		.mode		= 0644,
-		.proc_handler	= proc_ipc_dointvec,
+		.proc_handler	= proc_ipc_sem_dointvec,
 	},
 #ifdef CONFIG_CHECKPOINT_RESTORE
 	{
diff --git a/ipc/util.h b/ipc/util.h
index 0a159f6..65108c1 100644
--- a/ipc/util.h
+++ b/ipc/util.h
@@ -217,6 +217,15 @@ int ipcget(struct ipc_namespace *ns, struct ipc_ids *ids,
 void free_ipcs(struct ipc_namespace *ns, struct ipc_ids *ids,
 		void (*free)(struct ipc_namespace *, struct kern_ipc_perm *));
 
+static inline int sem_check_semmni(struct ipc_namespace *ns) {
+	/*
+	 * Check semmni range [0, IPCMNI]
+	 * semmni is the last element of sem_ctls[4] array
+	 */
+	return ((ns->sem_ctls[3] < 0) || (ns->sem_ctls[3] > IPCMNI))
+		? -ERANGE : 0;
+}
+
 #ifdef CONFIG_COMPAT
 #include <linux/compat.h>
 struct compat_ipc_perm {
-- 
1.8.3.1


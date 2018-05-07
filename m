Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 461F97DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 21:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753215AbeEGVBt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 17:01:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48870 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752847AbeEGU7X (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 16:59:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 618B5406E897;
        Mon,  7 May 2018 20:59:22 +0000 (UTC)
Received: from llong.com (ovpn-120-35.rdu2.redhat.com [10.10.120.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D6E392166BB2;
        Mon,  7 May 2018 20:59:21 +0000 (UTC)
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
Subject: [PATCH v7 3/4] ipc: Allow boot time extension of IPCMNI from 32k to 2M
Date:   Mon,  7 May 2018 16:59:11 -0400
Message-Id: <1525726752-29281-4-git-send-email-longman@redhat.com>
In-Reply-To: <1525726752-29281-1-git-send-email-longman@redhat.com>
References: <1525726752-29281-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Mon, 07 May 2018 20:59:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Mon, 07 May 2018 20:59:22 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The maximum number of unique System V IPC identifiers was limited to
32k.  That limit should be big enough for most use cases.

However, there are some users out there requesting for more. To satisfy
the need of those users, a new boot time kernel option "ipcmni_extend"
is added to extend the IPCMNI value to 2M. This is a 64X increase which
hopefully is big enough for them.

This new option does have the side effect of reducing the maximum
number of unique sequence numbers from 64k down to 1k. So it is
a trade-off.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 ++
 ipc/ipc_sysctl.c                                | 12 ++++++-
 ipc/util.c                                      | 12 +++----
 ipc/util.h                                      | 42 +++++++++++++++++++------
 4 files changed, 52 insertions(+), 17 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 11fc28e..00bc0cb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1735,6 +1735,9 @@
 	ip=		[IP_PNP]
 			See Documentation/filesystems/nfs/nfsroot.txt.
 
+	ipcmni_extend	[KNL] Extend the maximum number of unique System V
+			IPC identifiers from 32768 to 2097152.
+
 	irqaffinity=	[SMP] Set the default irq affinity mask
 			The argument is a cpu list, as described above.
 
diff --git a/ipc/ipc_sysctl.c b/ipc/ipc_sysctl.c
index 49f9bf4..d62335f 100644
--- a/ipc/ipc_sysctl.c
+++ b/ipc/ipc_sysctl.c
@@ -120,7 +120,8 @@ static int proc_ipc_sem_dointvec(struct ctl_table *table, int write,
 static int zero;
 static int one = 1;
 static int int_max = INT_MAX;
-static int ipc_mni = IPCMNI;
+int ipc_mni __read_mostly = IPCMNI;
+int ipc_mni_shift __read_mostly = IPCMNI_SHIFT;
 
 static struct ctl_table ipc_kern_table[] = {
 	{
@@ -246,3 +247,12 @@ static int __init ipc_sysctl_init(void)
 }
 
 device_initcall(ipc_sysctl_init);
+
+static int __init ipc_mni_extend(char *str)
+{
+	ipc_mni = IPCMNI_EXTEND;
+	ipc_mni_shift = IPCMNI_EXTEND_SHIFT;
+	pr_info("IPCMNI extended to %d.\n", ipc_mni);
+	return 0;
+}
+early_param("ipcmni_extend", ipc_mni_extend);
diff --git a/ipc/util.c b/ipc/util.c
index 4e81182..782a8d0 100644
--- a/ipc/util.c
+++ b/ipc/util.c
@@ -113,7 +113,7 @@ static int __init ipc_init(void)
  * @ids: ipc identifier set
  *
  * Set up the sequence range to use for the ipc identifier range (limited
- * below IPCMNI) then initialise the keys hashtable and ids idr.
+ * below ipc_mni) then initialise the keys hashtable and ids idr.
  */
 int ipc_init_ids(struct ipc_ids *ids)
 {
@@ -214,7 +214,7 @@ static inline int ipc_buildid(int id, struct ipc_ids *ids,
 		ids->next_id = -1;
 	}
 
-	return SEQ_MULTIPLIER * new->seq + id;
+	return (new->seq << SEQ_SHIFT) + id;
 }
 
 #else
@@ -228,7 +228,7 @@ static inline int ipc_buildid(int id, struct ipc_ids *ids,
 	if (ids->seq > IPCID_SEQ_MAX)
 		ids->seq = 0;
 
-	return SEQ_MULTIPLIER * new->seq + id;
+	return (new->seq << SEQ_SHIFT) + id;
 }
 
 #endif /* CONFIG_CHECKPOINT_RESTORE */
@@ -252,8 +252,8 @@ int ipc_addid(struct ipc_ids *ids, struct kern_ipc_perm *new, int limit)
 	kgid_t egid;
 	int id, err;
 
-	if (limit > IPCMNI)
-		limit = IPCMNI;
+	if (limit > ipc_mni)
+		limit = ipc_mni;
 
 	if (!ids->tables_initialized || ids->in_use >= limit)
 		return -ENOSPC;
@@ -777,7 +777,7 @@ static struct kern_ipc_perm *sysvipc_find_ipc(struct ipc_ids *ids, loff_t pos,
 	if (total >= ids->in_use)
 		return NULL;
 
-	for (; pos < IPCMNI; pos++) {
+	for (; pos < ipc_mni; pos++) {
 		ipc = idr_find(&ids->ipcs_idr, pos);
 		if (ipc != NULL) {
 			*new_pos = pos + 1;
diff --git a/ipc/util.h b/ipc/util.h
index 8b413f1..9df177f 100644
--- a/ipc/util.h
+++ b/ipc/util.h
@@ -15,8 +15,30 @@
 #include <linux/err.h>
 #include <linux/ipc_namespace.h>
 
-#define IPCMNI 32768  /* <= MAX_INT limit for ipc arrays (including sysctl changes) */
-#define SEQ_MULTIPLIER	(IPCMNI)
+/*
+ * By default, the ipc arrays can have up to 32k (15 bits) entries.
+ * When IPCMNI extension mode is turned on, the ipc arrays can have up
+ * to 2M (21 bits) entries. However, the space for sequence number will
+ * be shrunk from 16 bits to 10 bits.
+ */
+#define IPCMNI_SHIFT		15
+#define IPCMNI_EXTEND_SHIFT	21
+#define IPCMNI			(1 << IPCMNI_SHIFT)
+#define IPCMNI_EXTEND		(1 << IPCMNI_EXTEND_SHIFT)
+
+#ifdef CONFIG_SYSVIPC_SYSCTL
+extern int ipc_mni;
+extern int ipc_mni_shift;
+
+#define SEQ_SHIFT		ipc_mni_shift
+#define SEQ_MASK		((1 << ipc_mni_shift) - 1)
+
+#else /* CONFIG_SYSVIPC_SYSCTL */
+
+#define ipc_mni 		IPCMNI
+#define SEQ_SHIFT		IPCMNI_SHIFT
+#define SEQ_MASK		((1 << IPCMNI_SHIFT) - 1)
+#endif /* CONFIG_SYSVIPC_SYSCTL */
 
 int sem_init(void);
 int msg_init(void);
@@ -96,9 +118,9 @@ void __init ipc_init_proc_interface(const char *path, const char *header,
 #define IPC_MSG_IDS	1
 #define IPC_SHM_IDS	2
 
-#define ipcid_to_idx(id) ((id) % SEQ_MULTIPLIER)
-#define ipcid_to_seqx(id) ((id) / SEQ_MULTIPLIER)
-#define IPCID_SEQ_MAX min_t(int, INT_MAX/SEQ_MULTIPLIER, USHRT_MAX)
+#define ipcid_to_idx(id)  ((id) & SEQ_MASK)
+#define ipcid_to_seqx(id) ((id) >> SEQ_SHIFT)
+#define IPCID_SEQ_MAX	  (INT_MAX >> SEQ_SHIFT)
 
 /* must be called with ids->rwsem acquired for writing */
 int ipc_addid(struct ipc_ids *, struct kern_ipc_perm *, int);
@@ -123,8 +145,8 @@ static inline int ipc_get_maxid(struct ipc_ids *ids)
 	if (ids->in_use == 0)
 		return -1;
 
-	if (ids->in_use == IPCMNI)
-		return IPCMNI - 1;
+	if (ids->in_use == ipc_mni)
+		return ipc_mni - 1;
 
 	return ids->max_id;
 }
@@ -175,7 +197,7 @@ static inline void ipc_update_pid(struct pid **pos, struct pid *pid)
 
 static inline int ipc_checkid(struct kern_ipc_perm *ipcp, int uid)
 {
-	return uid / SEQ_MULTIPLIER != ipcp->seq;
+	return (uid >> SEQ_SHIFT) != ipcp->seq;
 }
 
 static inline void ipc_lock_object(struct kern_ipc_perm *perm)
@@ -220,10 +242,10 @@ void free_ipcs(struct ipc_namespace *ns, struct ipc_ids *ids,
 
 static inline int sem_check_semmni(struct ipc_namespace *ns) {
 	/*
-	 * Check semmni range [0, IPCMNI]
+	 * Check semmni range [0, ipc_mni]
 	 * semmni is the last element of sem_ctls[4] array
 	 */
-	return ((ns->sem_ctls[3] < 0) || (ns->sem_ctls[3] > IPCMNI))
+	return ((ns->sem_ctls[3] < 0) || (ns->sem_ctls[3] > ipc_mni))
 		? -ERANGE : 0;
 }
 
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

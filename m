Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0FEA47E6AD
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 18:16:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753132AbeCPSOh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 14:14:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41126 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752813AbeCPSOe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Mar 2018 14:14:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5BD95406E96C;
        Fri, 16 Mar 2018 18:14:33 +0000 (UTC)
Received: from llong.com (dhcp-17-75.bos.redhat.com [10.18.17.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 13FB32017E81;
        Fri, 16 Mar 2018 18:14:33 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v5 2/9] proc/sysctl: Provide additional ctl_table.flags checks
Date:   Fri, 16 Mar 2018 14:13:43 -0400
Message-Id: <1521224030-2185-3-git-send-email-longman@redhat.com>
In-Reply-To: <1521224030-2185-1-git-send-email-longman@redhat.com>
References: <1521224030-2185-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Fri, 16 Mar 2018 18:14:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Fri, 16 Mar 2018 18:14:33 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Checking code is added to provide the following additional
ctl_table.flags checks:

 1) No unknown flag is allowed.
 2) Minimum of a range cannot be larger than the maximum value.
 3) The signed and unsigned flags are mutually exclusive.
 4) The proc_handler should be consistent with the signed or unsigned
    flags.

Two new flags are added to indicate if the min/max values are signed
or unsigned - CTL_FLAGS_SIGNED_RANGE & CTL_FLAGS_UNSIGNED_RANGE.
These 2 flags can be optionally enabled for range checking purpose.
But either one of them must be set with CTL_FLAGS_CLAMP_RANGE.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 fs/proc/proc_sysctl.c  | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/sysctl.h | 16 +++++++++++--
 2 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 493c975..2863ea1 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -1092,6 +1092,66 @@ static int sysctl_check_table_array(const char *path, struct ctl_table *table)
 	return err;
 }
 
+static int sysctl_check_flags(const char *path, struct ctl_table *table)
+{
+	int err = 0;
+	uint16_t sign_flags = CTL_FLAGS_SIGNED_RANGE|CTL_FLAGS_UNSIGNED_RANGE;
+
+	if ((table->flags & ~CTL_TABLE_FLAGS_ALL) ||
+	   ((table->flags & sign_flags) == sign_flags))
+		err = sysctl_err(path, table, "invalid flags");
+
+	if (table->flags & (CTL_FLAGS_CLAMP_RANGE | sign_flags)) {
+		int range_err = 0;
+		bool is_int = (table->maxlen == sizeof(int));
+
+		if (!is_int && (table->maxlen != sizeof(long))) {
+			range_err++;
+		} else if (!table->extra1 || !table->extra2) {
+			/* No min > max checking needed */
+		} else if (table->flags & CTL_FLAGS_UNSIGNED_RANGE) {
+			unsigned long min, max;
+
+			min = is_int ? *(unsigned int *)table->extra1
+				     : *(unsigned long *)table->extra1;
+			max = is_int ? *(unsigned int *)table->extra2
+				     : *(unsigned long *)table->extra2;
+			range_err += (min > max);
+		} else if (table->flags & CTL_FLAGS_SIGNED_RANGE) {
+
+			long min, max;
+
+			min = is_int ? *(int *)table->extra1
+				     : *(long *)table->extra1;
+			max = is_int ? *(int *)table->extra2
+				     : *(long *)table->extra2;
+			range_err += (min > max);
+		} else {
+			/*
+			 * Either CTL_FLAGS_UNSIGNED_RANGE or
+			 * CTL_FLAGS_SIGNED_RANGE should be set.
+			 */
+			range_err++;
+		}
+
+		/*
+		 * proc_handler and flag consistency check.
+		 */
+		if (((table->proc_handler == proc_douintvec_minmax)   ||
+		     (table->proc_handler == proc_doulongvec_minmax)) &&
+		    !(table->flags & CTL_FLAGS_UNSIGNED_RANGE))
+			range_err++;
+
+		if ((table->proc_handler == proc_dointvec_minmax) &&
+		   !(table->flags & CTL_FLAGS_SIGNED_RANGE))
+			range_err++;
+
+		if (range_err)
+			err |= sysctl_err(path, table, "Invalid range");
+	}
+	return err;
+}
+
 static int sysctl_check_table(const char *path, struct ctl_table *table)
 {
 	int err = 0;
@@ -1111,6 +1171,8 @@ static int sysctl_check_table(const char *path, struct ctl_table *table)
 		    (table->proc_handler == proc_doulongvec_ms_jiffies_minmax)) {
 			if (!table->data)
 				err |= sysctl_err(path, table, "No data");
+			if (table->flags)
+				err |= sysctl_check_flags(path, table);
 			if (!table->maxlen)
 				err |= sysctl_err(path, table, "No maxlen");
 			else
diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index e446e1f..088f032 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -134,14 +134,26 @@ struct ctl_table
  *	the input value. No lower bound or upper bound checking will be
  *	done if the corresponding minimum or maximum value isn't provided.
  *
+ * @CTL_FLAGS_SIGNED_RANGE: Set to indicate that the extra1 and extra2
+ *	fields are pointers to minimum and maximum signed values of
+ *	an allowable range.
+ *
+ * @CTL_FLAGS_UNSIGNED_RANGE: Set to indicate that the extra1 and extra2
+ *	fields are pointers to minimum and maximum unsigned values of
+ *	an allowable range.
+ *
  * At most 16 different flags are allowed.
  */
 enum ctl_table_flags {
 	CTL_FLAGS_CLAMP_RANGE		= BIT(0),
-	__CTL_FLAGS_MAX			= BIT(1),
+	CTL_FLAGS_SIGNED_RANGE		= BIT(1),
+	CTL_FLAGS_UNSIGNED_RANGE	= BIT(2),
+	__CTL_FLAGS_MAX			= BIT(3),
 };
 
-#define CTL_TABLE_FLAGS_ALL	(__CTL_FLAGS_MAX - 1)
+#define CTL_TABLE_FLAGS_ALL		(__CTL_FLAGS_MAX - 1)
+#define CTL_FLAGS_CLAMP_RANGE_SIGNED	(CTL_FLAGS_CLAMP_RANGE|CTL_FLAGS_SIGNED_RANGE)
+#define CTL_FLAGS_CLAMP_RANGE_UNSIGNED	(CTL_FLAGS_CLAMP_RANGE|CTL_FLAGS_UNSIGNED_RANGE)
 
 struct ctl_node {
 	struct rb_node node;
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

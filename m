Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1BACA7E677
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 18:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751820AbeCPSOi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 14:14:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39064 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752829AbeCPSOe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Mar 2018 14:14:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A6ECC40201A3;
        Fri, 16 Mar 2018 18:14:33 +0000 (UTC)
Received: from llong.com (dhcp-17-75.bos.redhat.com [10.18.17.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 615752026E04;
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
Subject: [PATCH v5 3/9] sysctl: Warn when a clamped sysctl parameter is set out of range
Date:   Fri, 16 Mar 2018 14:13:44 -0400
Message-Id: <1521224030-2185-4-git-send-email-longman@redhat.com>
In-Reply-To: <1521224030-2185-1-git-send-email-longman@redhat.com>
References: <1521224030-2185-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Fri, 16 Mar 2018 18:14:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Fri, 16 Mar 2018 18:14:33 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Even with clamped sysctl parameters, it is still not that straight
forward to figure out the exact range of those parameters. One may
try to write extreme parameter values to see if they get clamped.
To make it easier, a warning with the expected range will now be
printed into the kernel ring buffer when a clamped sysctl parameter
receives an out of range value.

The pr_warn_ratelimited() macro is used to limit the number of warning
messages that can be printed within a given period of time.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/sysctl.c | 44 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index af351ed..a9e3ed4 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -17,6 +17,7 @@
  * The list_for_each() macro wasn't appropriate for the sysctl loop.
  *  Removed it and replaced it with older style, 03/23/00, Bill Wendling
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/module.h>
 #include <linux/aio.h>
@@ -2505,6 +2506,7 @@ static int proc_dointvec_minmax_sysadmin(struct ctl_table *table, int write,
  * @min: pointer to minimum allowable value
  * @max: pointer to maximum allowable value
  * @flags: pointer to flags
+ * @name: sysctl parameter name
  *
  * The do_proc_dointvec_minmax_conv_param structure provides the
  * minimum and maximum values for doing range checking for those sysctl
@@ -2514,6 +2516,7 @@ struct do_proc_dointvec_minmax_conv_param {
 	int *min;
 	int *max;
 	uint16_t *flags;
+	const char *name;
 };
 
 static int do_proc_dointvec_minmax_conv(bool *negp, unsigned long *lvalp,
@@ -2521,24 +2524,35 @@ static int do_proc_dointvec_minmax_conv(bool *negp, unsigned long *lvalp,
 					int write, void *data)
 {
 	struct do_proc_dointvec_minmax_conv_param *param = data;
+
 	if (write) {
 		int val = *negp ? -*lvalp : *lvalp;
+		bool clamped = false;
 		bool clamp = param->flags &&
 			   (*param->flags & CTL_FLAGS_CLAMP_RANGE);
 
 		if (param->min && *param->min > val) {
-			if (clamp)
+			if (clamp) {
 				val = *param->min;
-			else
+				clamped = true;
+			} else {
 				return -EINVAL;
+			}
 		}
 		if (param->max && *param->max < val) {
-			if (clamp)
+			if (clamp) {
 				val = *param->max;
-			else
+				clamped = true;
+			} else {
 				return -EINVAL;
+			}
 		}
 		*valp = val;
+		if (clamped && param->name)
+			pr_warn_ratelimited("\"%s\" was set out of range [%d, %d], clamped to %d.\n",
+				param->name,
+				param->min ? *param->min : -INT_MAX,
+				param->max ? *param->max :  INT_MAX, val);
 	} else {
 		int val = *valp;
 		if (val < 0) {
@@ -2576,6 +2590,7 @@ int proc_dointvec_minmax(struct ctl_table *table, int write,
 		.min = (int *) table->extra1,
 		.max = (int *) table->extra2,
 		.flags = &table->flags,
+		.name  = table->procname,
 	};
 	return do_proc_dointvec(table, write, buffer, lenp, ppos,
 				do_proc_dointvec_minmax_conv, &param);
@@ -2586,6 +2601,7 @@ int proc_dointvec_minmax(struct ctl_table *table, int write,
  * @min: pointer to minimum allowable value
  * @max: pointer to maximum allowable value
  * @flags: pointer to flags
+ * @name: sysctl parameter name
  *
  * The do_proc_douintvec_minmax_conv_param structure provides the
  * minimum and maximum values for doing range checking for those sysctl
@@ -2595,6 +2611,7 @@ struct do_proc_douintvec_minmax_conv_param {
 	unsigned int *min;
 	unsigned int *max;
 	uint16_t *flags;
+	const char *name;
 };
 
 static int do_proc_douintvec_minmax_conv(unsigned long *lvalp,
@@ -2605,6 +2622,7 @@ static int do_proc_douintvec_minmax_conv(unsigned long *lvalp,
 
 	if (write) {
 		unsigned int val = *lvalp;
+		bool clamped = false;
 		bool clamp = param->flags &&
 			   (*param->flags & CTL_FLAGS_CLAMP_RANGE);
 
@@ -2612,18 +2630,27 @@ static int do_proc_douintvec_minmax_conv(unsigned long *lvalp,
 			return -EINVAL;
 
 		if (param->min && *param->min > val) {
-			if (clamp)
+			if (clamp) {
 				val = *param->min;
-			else
+				clamped = true;
+			} else {
 				return -ERANGE;
+			}
 		}
 		if (param->max && *param->max < val) {
-			if (clamp)
+			if (clamp) {
 				val = *param->max;
-			else
+				clamped = true;
+			} else {
 				return -ERANGE;
+			}
 		}
 		*valp = val;
+		if (clamped && param->name)
+			pr_warn_ratelimited("\"%s\" was set out of range [%u, %u], clamped to %u.\n",
+				param->name,
+				param->min ? *param->min : 0,
+				param->max ? *param->max : UINT_MAX, val);
 	} else {
 		unsigned int val = *valp;
 		*lvalp = (unsigned long) val;
@@ -2659,6 +2686,7 @@ int proc_douintvec_minmax(struct ctl_table *table, int write,
 		.min = (unsigned int *) table->extra1,
 		.max = (unsigned int *) table->extra2,
 		.flags = &table->flags,
+		.name  = table->procname,
 	};
 	return do_proc_douintvec(table, write, buffer, lenp, ppos,
 				 do_proc_douintvec_minmax_conv, &param);
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

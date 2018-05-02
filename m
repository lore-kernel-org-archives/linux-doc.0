Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DD5397E22E
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 15:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751463AbeEBPyO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 11:54:14 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54846 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751100AbeEBPyL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 11:54:11 -0400
Received: from 2.general.tyhicks.us.vpn ([10.172.64.53] helo=sec.l.tihix.com)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <tyhicks@canonical.com>)
        id 1fDu54-0007uo-2l; Wed, 02 May 2018 15:54:10 +0000
From:   Tyler Hicks <tyhicks@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@redhat.com>,
        Steve Grubb <sgrubb@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-audit@redhat.com,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 1/4] seccomp: Separate read and write code for actions_logged sysctl
Date:   Wed,  2 May 2018 15:53:17 +0000
Message-Id: <1525276400-7161-2-git-send-email-tyhicks@canonical.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525276400-7161-1-git-send-email-tyhicks@canonical.com>
References: <1525276400-7161-1-git-send-email-tyhicks@canonical.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Break the read and write paths of the kernel.seccomp.actions_logged
sysctl into separate functions to maintain readability. An upcoming
change will need to audit writes, but not reads, of this sysctl which
would introduce too many conditional code paths on whether or not the
'write' parameter evaluates to true.

Signed-off-by: Tyler Hicks <tyhicks@canonical.com>
---
 kernel/seccomp.c | 60 +++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index dc77548..f4afe67 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1199,48 +1199,64 @@ static bool seccomp_actions_logged_from_names(u32 *actions_logged, char *names)
 	return true;
 }
 
-static int seccomp_actions_logged_handler(struct ctl_table *ro_table, int write,
-					  void __user *buffer, size_t *lenp,
-					  loff_t *ppos)
+static int read_actions_logged(struct ctl_table *ro_table, void __user *buffer,
+			       size_t *lenp, loff_t *ppos)
 {
 	char names[sizeof(seccomp_actions_avail)];
 	struct ctl_table table;
+
+	memset(names, 0, sizeof(names));
+
+	if (!seccomp_names_from_actions_logged(names, sizeof(names),
+					       seccomp_actions_logged))
+		return -EINVAL;
+
+	table = *ro_table;
+	table.data = names;
+	table.maxlen = sizeof(names);
+	return proc_dostring(&table, 0, buffer, lenp, ppos);
+}
+
+static int write_actions_logged(struct ctl_table *ro_table, void __user *buffer,
+				size_t *lenp, loff_t *ppos)
+{
+	char names[sizeof(seccomp_actions_avail)];
+	struct ctl_table table;
+	u32 actions_logged;
 	int ret;
 
-	if (write && !capable(CAP_SYS_ADMIN))
+	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
 	memset(names, 0, sizeof(names));
 
-	if (!write) {
-		if (!seccomp_names_from_actions_logged(names, sizeof(names),
-						       seccomp_actions_logged))
-			return -EINVAL;
-	}
-
 	table = *ro_table;
 	table.data = names;
 	table.maxlen = sizeof(names);
-	ret = proc_dostring(&table, write, buffer, lenp, ppos);
+	ret = proc_dostring(&table, 1, buffer, lenp, ppos);
 	if (ret)
 		return ret;
 
-	if (write) {
-		u32 actions_logged;
-
-		if (!seccomp_actions_logged_from_names(&actions_logged,
-						       table.data))
-			return -EINVAL;
-
-		if (actions_logged & SECCOMP_LOG_ALLOW)
-			return -EINVAL;
+	if (!seccomp_actions_logged_from_names(&actions_logged, table.data))
+		return -EINVAL;
 
-		seccomp_actions_logged = actions_logged;
-	}
+	if (actions_logged & SECCOMP_LOG_ALLOW)
+		return -EINVAL;
 
+	seccomp_actions_logged = actions_logged;
 	return 0;
 }
 
+static int seccomp_actions_logged_handler(struct ctl_table *ro_table, int write,
+					  void __user *buffer, size_t *lenp,
+					  loff_t *ppos)
+{
+	if (write)
+		return write_actions_logged(ro_table, buffer, lenp, ppos);
+	else
+		return read_actions_logged(ro_table, buffer, lenp, ppos);
+}
+
 static struct ctl_path seccomp_sysctl_path[] = {
 	{ .procname = "kernel", },
 	{ .procname = "seccomp", },
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

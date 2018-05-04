Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C53B37E27D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 May 2018 01:10:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751190AbeEDBKP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 21:10:15 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52101 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751336AbeEDBKN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 21:10:13 -0400
Received: from 2.general.tyhicks.us.vpn ([10.172.64.53] helo=sec.ubuntu-ci)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <tyhicks@canonical.com>)
        id 1fEPDr-0008Hm-K5; Fri, 04 May 2018 01:09:19 +0000
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
Subject: [PATCH v3 2/4] seccomp: Configurable separator for the actions_logged string
Date:   Fri,  4 May 2018 01:08:13 +0000
Message-Id: <1525396095-27737-3-git-send-email-tyhicks@canonical.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525396095-27737-1-git-send-email-tyhicks@canonical.com>
References: <1525396095-27737-1-git-send-email-tyhicks@canonical.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The function that converts a bitmask of seccomp actions that are
allowed to be logged is currently only used for constructing the display
string for the kernel.seccomp.actions_logged sysctl. That string wants a
space character to be used for the separator between actions.

A future patch will make use of the same function for building a string
that will be sent to the audit subsystem for tracking modifications to
the kernel.seccomp.actions_logged sysctl. That string will need to use a
comma as a separator. This patch allows the separator character to be
configurable to meet both needs.

Signed-off-by: Tyler Hicks <tyhicks@canonical.com>
---
 kernel/seccomp.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index f4afe67..b36ac1e 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1135,10 +1135,11 @@ static const struct seccomp_log_name seccomp_log_names[] = {
 };
 
 static bool seccomp_names_from_actions_logged(char *names, size_t size,
-					      u32 actions_logged)
+					      u32 actions_logged,
+					      const char *sep)
 {
 	const struct seccomp_log_name *cur;
-	bool append_space = false;
+	bool append_sep = false;
 
 	for (cur = seccomp_log_names; cur->name && size; cur++) {
 		ssize_t ret;
@@ -1146,15 +1147,15 @@ static bool seccomp_names_from_actions_logged(char *names, size_t size,
 		if (!(actions_logged & cur->log))
 			continue;
 
-		if (append_space) {
-			ret = strscpy(names, " ", size);
+		if (append_sep) {
+			ret = strscpy(names, sep, size);
 			if (ret < 0)
 				return false;
 
 			names += ret;
 			size -= ret;
 		} else
-			append_space = true;
+			append_sep = true;
 
 		ret = strscpy(names, cur->name, size);
 		if (ret < 0)
@@ -1208,7 +1209,7 @@ static int read_actions_logged(struct ctl_table *ro_table, void __user *buffer,
 	memset(names, 0, sizeof(names));
 
 	if (!seccomp_names_from_actions_logged(names, sizeof(names),
-					       seccomp_actions_logged))
+					       seccomp_actions_logged, " "))
 		return -EINVAL;
 
 	table = *ro_table;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

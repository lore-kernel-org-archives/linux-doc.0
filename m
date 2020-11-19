Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF64C6379F
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 14:32:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B64C246A7
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 14:32:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJB6gCfM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgKSObr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:31:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:49884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727513AbgKSObr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Nov 2020 09:31:47 -0500
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE6F024199;
        Thu, 19 Nov 2020 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605796306;
        bh=O8+jAFYQl2dODQWvN3RH1jZ6c1/18NJosW5saVgQ94k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VJB6gCfMjOZQoVzyk6QeEPQp7uSD5VfKMIBWtnUdANC9orC1ic45svHaItuDYa6Nm
         MqOBb5mxd32QwFdMv5cjGSUAj9xMgSuJMO7wOxn0pCWruQSkb1/OMkw0bn7j7WVcfW
         SHCmy2UOHQVQXY+sQgedzbVICWwZGZIgCeIA68O8=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Chen Yu <yu.c.chen@intel.com>, Chen Yu <yu.chen.surf@gmail.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [RFC PATCH 1/3] bootconfig: Use hexadecimal ASCII string for size and checksum
Date:   Thu, 19 Nov 2020 23:31:42 +0900
Message-Id: <160579630249.503380.8122135672657958396.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <160579629161.503380.9118263439060046721.stgit@devnote2>
References: <160579629161.503380.9118263439060046721.stgit@devnote2>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To make the bootconfig format more platform independent, use
8-bytes hexadecimal ASCII string for size and checksum field
in the footer. This will allow us to apply bootconfig to the
cross build initrd without caring the endianness.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 init/main.c |   20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/init/main.c b/init/main.c
index 20baced721ad..b82f23cff709 100644
--- a/init/main.c
+++ b/init/main.c
@@ -267,8 +267,8 @@ early_param("loglevel", loglevel);
 static void * __init get_boot_config_from_initrd(u32 *_size, u32 *_csum)
 {
 	u32 size, csum;
+	char buf[9];
 	char *data;
-	u32 *hdr;
 	int i;
 
 	if (!initrd_end)
@@ -287,11 +287,21 @@ static void * __init get_boot_config_from_initrd(u32 *_size, u32 *_csum)
 	return NULL;
 
 found:
-	hdr = (u32 *)(data - 8);
-	size = hdr[0];
-	csum = hdr[1];
+	buf[8] = '\0';
+	data -= 8;
+	memcpy(buf, data, 8);
+	if (kstrtou32(buf, 16, &csum) != 0) {
+		pr_err("bootconfig checksum field is invalid\n");
+		return NULL;
+	}
+	data -= 8;
+	memcpy(buf, data, 8);
+	if (kstrtou32(buf, 16, &size) != 0) {
+		pr_err("bootconfig size field is invalid\n");
+		return NULL;
+	}
+	data -= size;
 
-	data = ((void *)hdr) - size;
 	if ((unsigned long)data < initrd_start) {
 		pr_err("bootconfig size %d is greater than initrd size %ld\n",
 			size, initrd_end - initrd_start);


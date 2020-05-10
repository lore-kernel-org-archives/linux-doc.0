Return-Path: <SRS0=r+xA=6Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D48EC38A2A
	for <linux-doc@archiver.kernel.org>; Sun, 10 May 2020 20:25:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80A8F206F5
	for <linux-doc@archiver.kernel.org>; Sun, 10 May 2020 20:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SE/Lj2r/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbgEJUYw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 10 May 2020 16:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729380AbgEJUYs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 May 2020 16:24:48 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF0FC05BD0A
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2020 13:24:48 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t11so3559385pgg.2
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2020 13:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e8QxXpTtzEc0PFUpgGtgZUc+FvTwN2g4UuYupfacY68=;
        b=SE/Lj2r/qm5MRAqEmy91aIMpwxOMaSbPzJm9LffMRTM1bMYU65FQ1TKG3X0ZDbyYio
         7B7iJyomdn5ZaPKTBC2NPCyLpN+6NjzvPW1RdCc5OrFF7OGirTC6irYkn7I1yMOmA0QU
         6ab1OTO/QvQNAoQqtEtzq1eDx2y9kcPmeWYbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e8QxXpTtzEc0PFUpgGtgZUc+FvTwN2g4UuYupfacY68=;
        b=OdXhCYQR+Sf1pcvyINVMynKJiRzAYXa12JaaBZ0yyHx2fHeof3of608loqZh/kOkwK
         xWmagkITeatWHVazebCIcy4CUJfMCXhP9NiGlyGNWvJjQyfGYvozYN06wW+tnyKkZ5em
         1IMoXtmuNbHigFaQq+EKNqW/EDozx6qrZu9rIGiBBMyIhoArmarPdrgwF5Q2euMzcFBu
         ZVvzEg9K8Iken41jmOrgNGm2vWLPL+McV+TxZSVpuLRLQWbVXZ29+THOpMNuOpyCzcM5
         o3BxUExGR9hRqyU3IgbV1m2yAu1vN8DCVk3oJG9x8w6JUlud4/i/Lue4SilGj9ESSBo/
         VKvw==
X-Gm-Message-State: AGi0PuYttNRz7EKHIyAiDi64epybkGnMJ9Rz0DktpbvzxLc3HhW/MUjZ
        byMFBD5uk8KsQ6Q8C3JjDDiyQA==
X-Google-Smtp-Source: APiQypJP9SdsFTI/n79iIdc/+hcTxLTAwENcl6uTzDuzTIjiRCcw0DdJASm1sZtZg0sIzx1RfipUbw==
X-Received: by 2002:a63:a61:: with SMTP id z33mr11625145pgk.440.1589142288307;
        Sun, 10 May 2020 13:24:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c10sm7271971pfm.50.2020.05.10.13.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 13:24:45 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Rob Herring <robh@kernel.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: [PATCH v7 07/18] printk: Introduce kmsg_dump_reason_str()
Date:   Sun, 10 May 2020 13:24:25 -0700
Message-Id: <20200510202436.63222-8-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510202436.63222-1-keescook@chromium.org>
References: <20200510202436.63222-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pstore subsystem already had a private version of this function.
With the coming addition of the pstore/zone driver, this needs to be
shared. As it really should live with printk, move it there instead.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c      | 22 +---------------------
 include/linux/kmsg_dump.h |  7 +++++++
 kernel/printk/printk.c    | 21 +++++++++++++++++++++
 3 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 90d146fbc7d2..a9e297eefdff 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -135,26 +135,6 @@ enum pstore_type_id pstore_name_to_type(const char *name)
 }
 EXPORT_SYMBOL_GPL(pstore_name_to_type);
 
-static const char *get_reason_str(enum kmsg_dump_reason reason)
-{
-	switch (reason) {
-	case KMSG_DUMP_PANIC:
-		return "Panic";
-	case KMSG_DUMP_OOPS:
-		return "Oops";
-	case KMSG_DUMP_EMERG:
-		return "Emergency";
-	case KMSG_DUMP_RESTART:
-		return "Restart";
-	case KMSG_DUMP_HALT:
-		return "Halt";
-	case KMSG_DUMP_POWEROFF:
-		return "Poweroff";
-	default:
-		return "Unknown";
-	}
-}
-
 static void pstore_timer_kick(void)
 {
 	if (pstore_update_ms < 0)
@@ -407,7 +387,7 @@ static void pstore_dump(struct kmsg_dumper *dumper,
 	unsigned int	part = 1;
 	int		ret;
 
-	why = get_reason_str(reason);
+	why = kmsg_dump_reason_str(reason);
 
 	if (down_trylock(&psinfo->buf_lock)) {
 		/* Failed to acquire lock: give up if we cannot wait. */
diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index cfc042066be7..b3ddb0b2ee40 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -72,6 +72,8 @@ void kmsg_dump_rewind(struct kmsg_dumper *dumper);
 int kmsg_dump_register(struct kmsg_dumper *dumper);
 
 int kmsg_dump_unregister(struct kmsg_dumper *dumper);
+
+const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason);
 #else
 static inline void kmsg_dump(enum kmsg_dump_reason reason)
 {
@@ -113,6 +115,11 @@ static inline int kmsg_dump_unregister(struct kmsg_dumper *dumper)
 {
 	return -EINVAL;
 }
+
+static inline const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason)
+{
+	return "Disabled";
+}
 #endif
 
 #endif /* _LINUX_KMSG_DUMP_H */
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 1aab69a8a2bf..67a284830d74 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3144,6 +3144,27 @@ EXPORT_SYMBOL_GPL(kmsg_dump_unregister);
 static bool always_kmsg_dump;
 module_param_named(always_kmsg_dump, always_kmsg_dump, bool, S_IRUGO | S_IWUSR);
 
+const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason)
+{
+	switch (reason) {
+	case KMSG_DUMP_PANIC:
+		return "Panic";
+	case KMSG_DUMP_OOPS:
+		return "Oops";
+	case KMSG_DUMP_EMERG:
+		return "Emergency";
+	case KMSG_DUMP_RESTART:
+		return "Restart";
+	case KMSG_DUMP_HALT:
+		return "Halt";
+	case KMSG_DUMP_POWEROFF:
+		return "Poweroff";
+	default:
+		return "Unknown";
+	}
+}
+EXPORT_SYMBOL_GPL(kmsg_dump_reason_str);
+
 /**
  * kmsg_dump - dump kernel log to kernel message dumpers.
  * @reason: the reason (oops, panic etc) for dumping
-- 
2.20.1


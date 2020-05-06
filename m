Return-Path: <SRS0=EZYx=6U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DE0C47257
	for <linux-doc@archiver.kernel.org>; Wed,  6 May 2020 21:16:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6815A2075A
	for <linux-doc@archiver.kernel.org>; Wed,  6 May 2020 21:16:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cq9duf0K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730049AbgEFVQC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 May 2020 17:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729724AbgEFVPc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 May 2020 17:15:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9769FC061BD3
        for <linux-doc@vger.kernel.org>; Wed,  6 May 2020 14:15:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id v63so1743578pfb.10
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2020 14:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UTadiU/eZ1q2VGZ0zHQqmJyy/ggoeusOcwyRzYvVDUc=;
        b=cq9duf0KIITAA+Ma8qYIxaZ1ZPr3t1w/UF75OOETMqQdQmgs22XTCQOGl6oiQEjz7p
         BgKpBL77SS7JZ5xo55zIXSOsqMrKyT1b27dFGHrBuSz/quzXybhAwKS4r8OJ1QwyxhGQ
         B7rHm2bNXagzf+t9CQEiLLeU6Hp5erNLSitjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UTadiU/eZ1q2VGZ0zHQqmJyy/ggoeusOcwyRzYvVDUc=;
        b=tgXSS5xSLtB4FRAruGRA9TrO2zBCDcDGrngIV8Y91rTKWisv979sJJlyuu1HvfL2F6
         NHWpFSHlIA6iDAyMiH5EEr1q3Cc6c1MFSRX4dH6nqCrZrr9Ic5dDMZpa5DfGboUdgg03
         cycHzmRBHvOlJaendc7WP38icrh+/wzDqM37ZTRwiXlaIHxLDUirhQuH46eYWpUbV0Ur
         gFwPP832r6bqL+fug9M3OZr3v22q3PK7NK07fsVuXF/YqkMlOtt1xSkX8aHgnkgLqQM1
         dB810nHl1aGa6rIjdisf3ZgtQLLwXaJ5EgRGVNtZQ6XLN7ODQdiHSTQ2gNooBHh9hw1z
         hb/w==
X-Gm-Message-State: AGi0PuYdHIW9TRmWR+sRRFB5IzuLSHU4wUgfDe9Xr/dG32rVDHWFBX8V
        vNImkw4i2XVUB32k6rkOQgn5Hw==
X-Google-Smtp-Source: APiQypJMGq3U5ddizQcOsBKxOLGbBmDpeYTINpkjDXZZ8zOo3aE8YDsIBWjDo4JQqzR3y3Z1flDR4Q==
X-Received: by 2002:aa7:9546:: with SMTP id w6mr10197340pfq.114.1588799732130;
        Wed, 06 May 2020 14:15:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m19sm5619332pjv.30.2020.05.06.14.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 14:15:29 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>, jmorris@namei.org,
        sashal@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/6] printk: honor the max_reason field in kmsg_dumper
Date:   Wed,  6 May 2020 14:15:18 -0700
Message-Id: <20200506211523.15077-2-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200506211523.15077-1-keescook@chromium.org>
References: <20200506211523.15077-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Pavel Tatashin <pasha.tatashin@soleen.com>

kmsg_dump() allows to dump kmesg buffer for various system events: oops,
panic, reboot, etc. It provides an interface to register a callback call
for clients, and in that callback interface there is a field "max_reason"
which gets ignored unless always_kmsg_dump is passed as kernel parameter.

Allow clients to decide max_reason, and keep the current behavior when
max_reason is not set.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Link: https://lore.kernel.org/r/20200505154510.93506-2-pasha.tatashin@soleen.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/kmsg_dump.h |  1 +
 kernel/printk/printk.c    | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 2e7a1e032c71..cfc042066be7 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -28,6 +28,7 @@ enum kmsg_dump_reason {
 	KMSG_DUMP_RESTART,
 	KMSG_DUMP_HALT,
 	KMSG_DUMP_POWEROFF,
+	KMSG_DUMP_MAX
 };
 
 /**
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 9a9b6156270b..1aab69a8a2bf 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3157,12 +3157,19 @@ void kmsg_dump(enum kmsg_dump_reason reason)
 	struct kmsg_dumper *dumper;
 	unsigned long flags;
 
-	if ((reason > KMSG_DUMP_OOPS) && !always_kmsg_dump)
-		return;
-
 	rcu_read_lock();
 	list_for_each_entry_rcu(dumper, &dump_list, list) {
-		if (dumper->max_reason && reason > dumper->max_reason)
+		enum kmsg_dump_reason cur_reason = dumper->max_reason;
+
+		/*
+		 * If client has not provided a specific max_reason, default
+		 * to KMSG_DUMP_OOPS, unless always_kmsg_dump was set.
+		 */
+		if (cur_reason == KMSG_DUMP_UNDEF) {
+			cur_reason = always_kmsg_dump ? KMSG_DUMP_MAX :
+							KMSG_DUMP_OOPS;
+		}
+		if (reason > cur_reason)
 			continue;
 
 		/* initialize iterator with data about the stored records */
-- 
2.20.1


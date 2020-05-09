Return-Path: <SRS0=LvDp=6X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89691C47255
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:42:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 606BD217BA
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RuZPdRe+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgEIXmN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 9 May 2020 19:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726026AbgEIXlN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 May 2020 19:41:13 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5F9C05BD09
        for <linux-doc@vger.kernel.org>; Sat,  9 May 2020 16:41:13 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t7so2309305plr.0
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2020 16:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ktEJvuLjRdGObd9XB4X6c1FTgen2GQ5GeA/f/mZmo1s=;
        b=RuZPdRe+nPlXR2Wghynp6EaZXEF3PmMRUKWq3UhSrMw5KSyGMRrXrJUrEYeeYU0QkC
         aEXywVcy0CUFBRMX3cgqnjfIRSaj1yKbvZ6axZjddC5td3NHGNffkW2Q2GN/0akezbLS
         /pWG4ef9tXfkFKV7zr0n/YTXQrNLfW/pHjh5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ktEJvuLjRdGObd9XB4X6c1FTgen2GQ5GeA/f/mZmo1s=;
        b=be2K2WfX5CcYW8i45woK8v+7tiKfwMA+TIuXOLbDJzVTe670w+dls8zI3TfNDSB7Zw
         e3jSWsSXfU8HfYog3CGR22XiTKk2SJiwalRaSHKcaxrKsOFHAdWxqbNdWL5Hyfu/wRtk
         cbuQau6WDlEO+Byt2xrPj4HgFoQkqFjX7igK/I+59fXPf6T/tSACJaOUQN8bguu6/cPT
         7WG/iw9XtGT8FHterq87E1hQ9lJTQhlWJQBZNRwHwJr/A8gDSrAtqErnijr4dGxv/vFX
         DnJJ2BVoCc7VqDDCB8kUsyXQZUQd8TIV2MhpuEheRF1q0aEEMpWHpQbbXTGmbaabDvl/
         ymFg==
X-Gm-Message-State: AGi0PuaMPN96co3eZC96MQBShY6U28oQCvFrK8412SLo5qf1aeTPKYlb
        qXql1qTJWTWLqgrSYBkq4916Rg==
X-Google-Smtp-Source: APiQypL1EXW3F6aL7oQ3YuFrJpxdm1M/IrMTRuCAs/8mFzNUWDw/GJrsXHUoRltpWyjMpF83R+iPCA==
X-Received: by 2002:a17:902:a604:: with SMTP id u4mr8730033plq.196.1589067673301;
        Sat, 09 May 2020 16:41:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j2sm5636068pfb.73.2020.05.09.16.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 16:41:10 -0700 (PDT)
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
Subject: [PATCH v6 06/18] pstore/ftrace: Provide ftrace log merging routine
Date:   Sat,  9 May 2020 16:40:51 -0700
Message-Id: <20200509234103.46544-7-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509234103.46544-1-keescook@chromium.org>
References: <20200509234103.46544-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move the ftrace log merging logic out of pstore/ram into pstore/ftrace
so other backends can use it, like pstore/zone.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/ftrace.c   | 54 +++++++++++++++++++++++++++++++++++++++++
 fs/pstore/internal.h |  9 +++++++
 fs/pstore/ram.c      | 57 +++-----------------------------------------
 3 files changed, 66 insertions(+), 54 deletions(-)

diff --git a/fs/pstore/ftrace.c b/fs/pstore/ftrace.c
index bfbfc2698070..5c0450701293 100644
--- a/fs/pstore/ftrace.c
+++ b/fs/pstore/ftrace.c
@@ -16,6 +16,7 @@
 #include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/cache.h>
+#include <linux/slab.h>
 #include <asm/barrier.h>
 #include "internal.h"
 
@@ -132,3 +133,56 @@ void pstore_unregister_ftrace(void)
 
 	debugfs_remove_recursive(pstore_ftrace_dir);
 }
+
+ssize_t pstore_ftrace_combine_log(char **dest_log, size_t *dest_log_size,
+				  const char *src_log, size_t src_log_size)
+{
+	size_t dest_size, src_size, total, dest_off, src_off;
+	size_t dest_idx = 0, src_idx = 0, merged_idx = 0;
+	void *merged_buf;
+	struct pstore_ftrace_record *drec, *srec, *mrec;
+	size_t record_size = sizeof(struct pstore_ftrace_record);
+
+	dest_off = *dest_log_size % record_size;
+	dest_size = *dest_log_size - dest_off;
+
+	src_off = src_log_size % record_size;
+	src_size = src_log_size - src_off;
+
+	total = dest_size + src_size;
+	merged_buf = kmalloc(total, GFP_KERNEL);
+	if (!merged_buf)
+		return -ENOMEM;
+
+	drec = (struct pstore_ftrace_record *)(*dest_log + dest_off);
+	srec = (struct pstore_ftrace_record *)(src_log + src_off);
+	mrec = (struct pstore_ftrace_record *)(merged_buf);
+
+	while (dest_size > 0 && src_size > 0) {
+		if (pstore_ftrace_read_timestamp(&drec[dest_idx]) <
+		    pstore_ftrace_read_timestamp(&srec[src_idx])) {
+			mrec[merged_idx++] = drec[dest_idx++];
+			dest_size -= record_size;
+		} else {
+			mrec[merged_idx++] = srec[src_idx++];
+			src_size -= record_size;
+		}
+	}
+
+	while (dest_size > 0) {
+		mrec[merged_idx++] = drec[dest_idx++];
+		dest_size -= record_size;
+	}
+
+	while (src_size > 0) {
+		mrec[merged_idx++] = srec[src_idx++];
+		src_size -= record_size;
+	}
+
+	kfree(*dest_log);
+	*dest_log = merged_buf;
+	*dest_log_size = total;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pstore_ftrace_combine_log);
diff --git a/fs/pstore/internal.h b/fs/pstore/internal.h
index 8efd72d93b10..7fb219042f13 100644
--- a/fs/pstore/internal.h
+++ b/fs/pstore/internal.h
@@ -12,9 +12,18 @@ extern unsigned long kmsg_bytes;
 #ifdef CONFIG_PSTORE_FTRACE
 extern void pstore_register_ftrace(void);
 extern void pstore_unregister_ftrace(void);
+ssize_t pstore_ftrace_combine_log(char **dest_log, size_t *dest_log_size,
+				  const char *src_log, size_t src_log_size);
 #else
 static inline void pstore_register_ftrace(void) {}
 static inline void pstore_unregister_ftrace(void) {}
+static inline ssize_t
+pstore_ftrace_combine_log(char **dest_log, size_t *dest_log_size,
+			  const char *src_log, size_t src_log_size)
+{
+	*dest_log_size = 0;
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_PSTORE_PMSG
diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 672ad80646c5..b7929fdc0c72 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -21,6 +21,7 @@
 #include <linux/pstore_ram.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include "internal.h"
 
 #define RAMOOPS_KERNMSG_HDR "===="
 #define MIN_MEM_SIZE 4096UL
@@ -172,59 +173,6 @@ static bool prz_ok(struct persistent_ram_zone *prz)
 			   persistent_ram_ecc_string(prz, NULL, 0));
 }
 
-static
-ssize_t ftrace_log_combine(char **dest_log, size_t *dest_log_size,
-			   const char *src_log, size_t src_log_size)
-{
-	size_t dest_size, src_size, total, dest_off, src_off;
-	size_t dest_idx = 0, src_idx = 0, merged_idx = 0;
-	void *merged_buf;
-	struct pstore_ftrace_record *drec, *srec, *mrec;
-	size_t record_size = sizeof(struct pstore_ftrace_record);
-
-	dest_off = *dest_log_size % record_size;
-	dest_size = *dest_log_size - dest_off;
-
-	src_off = src_log_size % record_size;
-	src_size = src_log_size - src_off;
-
-	total = dest_size + src_size;
-	merged_buf = kmalloc(total, GFP_KERNEL);
-	if (!merged_buf)
-		return -ENOMEM;
-
-	drec = (struct pstore_ftrace_record *)(*dest_log + dest_off);
-	srec = (struct pstore_ftrace_record *)(src_log + src_off);
-	mrec = (struct pstore_ftrace_record *)(merged_buf);
-
-	while (dest_size > 0 && src_size > 0) {
-		if (pstore_ftrace_read_timestamp(&drec[dest_idx]) <
-		    pstore_ftrace_read_timestamp(&srec[src_idx])) {
-			mrec[merged_idx++] = drec[dest_idx++];
-			dest_size -= record_size;
-		} else {
-			mrec[merged_idx++] = srec[src_idx++];
-			src_size -= record_size;
-		}
-	}
-
-	while (dest_size > 0) {
-		mrec[merged_idx++] = drec[dest_idx++];
-		dest_size -= record_size;
-	}
-
-	while (src_size > 0) {
-		mrec[merged_idx++] = srec[src_idx++];
-		src_size -= record_size;
-	}
-
-	kfree(*dest_log);
-	*dest_log = merged_buf;
-	*dest_log_size = total;
-
-	return 0;
-}
-
 static ssize_t ramoops_pstore_read(struct pstore_record *record)
 {
 	ssize_t size = 0;
@@ -297,7 +245,8 @@ static ssize_t ramoops_pstore_read(struct pstore_record *record)
 						prz_next->corrected_bytes;
 				tmp_prz->bad_blocks += prz_next->bad_blocks;
 
-				size = ftrace_log_combine(&tmp_prz->old_log,
+				size = pstore_ftrace_combine_log(
+						&tmp_prz->old_log,
 						&tmp_prz->old_log_size,
 						prz_next->old_log,
 						prz_next->old_log_size);
-- 
2.20.1


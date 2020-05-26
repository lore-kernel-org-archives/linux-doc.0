Return-Path: <SRS0=tUtt=7I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E88C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 26 May 2020 14:58:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D4222068D
	for <linux-doc@archiver.kernel.org>; Tue, 26 May 2020 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590505107;
	bh=dZeLXoUBQtKDHLLwUZOY5erPD//Mcj+l4J+EmoZeztE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Z+CTSkdgHFK3qZyHuwIjjcjG2GKv62FDEh3atlwnmdHrx85LtcDsiBWByo2HVjHgN
	 9y4fVf7ifQvn9co5MOpgRu1lqlCWbaUwXjpCHYvWXWy6Ou0lev2jurxYNtroJGcvK0
	 7YF9Jcgl5pwg7eGYBpoCOq3ZY14iZm1/QrvBagBo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730210AbgEZO6Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 May 2020 10:58:25 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38198 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730023AbgEZO6Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 May 2020 10:58:24 -0400
Received: by mail-pf1-f195.google.com with SMTP id q8so10286604pfu.5
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2020 07:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UXRYeaDc02XdMrQZXPWL4bjUJlIpwN0dvTWzE8/MMVk=;
        b=c6RJ6/aFMlsiBhQQ+J2WHzuwzLNaco+qg/cDVzVv5nPVZd0Z1UrZdI0GiKp8WeeiH5
         x6ckyqB6IixnwPwY3wKyRJmIrpiIhPlNgG4TbPdPftMZdH7tFDcSPQd8wMVlqgCW77H6
         QS41UNACHKfSoBL5+1coa/AH8h9zPI+58CwPNEufpHhQou+947zZt7fnsr1nOTk+1e09
         Ljad32QHCGRynG/HRp72Q1379wXznDHtykTjgkwBPeeFKyZ4eioTAwNPXW8r+es0FWyu
         GdX7Yhr+58wEh5SdDygGG2GjTeNLClTeC1RnIOf0rNC/NGARjgyw8OpoeZ0ReMlyo/8S
         miMg==
X-Gm-Message-State: AOAM532ZiPapqUP0U0tvasKU8mR8VOFuVa2tOpf7Porx9pKCTsW8Rm46
        2HI7W1tgMI3Zw6BFy/9tFLdNiQPEDHYcgA==
X-Google-Smtp-Source: ABdhPJxhJCHpvoDARrls5uBNp6uuAO5hQ0tNFtxOIQrU72UK9jrxPs19Wzow+004us7H80dmMzs/5g==
X-Received: by 2002:a65:6801:: with SMTP id l1mr1437517pgt.73.1590505103150;
        Tue, 26 May 2020 07:58:23 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id x13sm15122851pfn.200.2020.05.26.07.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 07:58:22 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id 6982C41D12; Tue, 26 May 2020 14:58:18 +0000 (UTC)
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     jeyu@kernel.org, davem@davemloft.net, kuba@kernel.org
Cc:     michael.chan@broadcom.com, dchickles@marvell.com,
        sburla@marvell.com, fmanlunas@marvell.com, aelior@marvell.com,
        GR-everest-linux-l2@marvell.com, kvalo@codeaurora.org,
        johannes@sipsolutions.net, akpm@linux-foundation.org,
        arnd@arndb.de, rostedt@goodmis.org, mingo@redhat.com,
        aquini@redhat.com, cai@lca.pw, dyoung@redhat.com, bhe@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, gpiccoli@canonical.com,
        pmladek@suse.com, tiwai@suse.de, schlad@suse.de,
        andriy.shevchenko@linux.intel.com, derosier@gmail.com,
        keescook@chromium.org, daniel.vetter@ffwll.ch, will@kernel.org,
        mchehab+samsung@kernel.org, vkoul@kernel.org,
        mchehab+huawei@kernel.org, robh@kernel.org, mhiramat@kernel.org,
        sfr@canb.auug.org.au, linux@dominikbrodowski.net,
        glider@google.com, paulmck@kernel.org, elver@google.com,
        bauerman@linux.ibm.com, yamada.masahiro@socionext.com,
        samitolvanen@google.com, yzaikin@google.com, dvyukov@google.com,
        rdunlap@infradead.org, corbet@lwn.net, dianders@chromium.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v3 4/8] panic: make taint data type clearer
Date:   Tue, 26 May 2020 14:58:11 +0000
Message-Id: <20200526145815.6415-5-mcgrof@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200526145815.6415-1-mcgrof@kernel.org>
References: <20200526145815.6415-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Let us be clearer about the the data type for the taint flag.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 include/asm-generic/bug.h | 4 ++--
 include/linux/kernel.h    | 4 ++--
 kernel/panic.c            | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index c94e33ae3e7b..87dbe57301f4 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -80,7 +80,7 @@ struct bug_entry {
  */
 #ifndef __WARN_FLAGS
 extern __printf(4, 5)
-void warn_slowpath_fmt(const char *file, const int line, unsigned taint,
+void warn_slowpath_fmt(const char *file, const int line, unsigned int taint,
 		       const char *fmt, ...);
 #define __WARN()		__WARN_printf(TAINT_WARN, NULL)
 #define __WARN_printf(taint, arg...) do {				\
@@ -110,7 +110,7 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 struct warn_args;
 struct pt_regs;
 
-void __warn(const char *file, int line, void *caller, unsigned taint,
+void __warn(const char *file, int line, void *caller, unsigned int taint,
 	    struct pt_regs *regs, struct warn_args *args);
 
 #ifndef WARN_ON
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index a1974907c320..d154844eb9cd 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -563,8 +563,8 @@ enum lockdep_ok {
 	LOCKDEP_STILL_OK,
 	LOCKDEP_NOW_UNRELIABLE
 };
-extern void add_taint(unsigned flag, enum lockdep_ok);
-extern int test_taint(unsigned flag);
+extern void add_taint(unsigned int flag, enum lockdep_ok);
+extern int test_taint(unsigned int flag);
 extern unsigned long get_taint(void);
 extern int root_mountflags;
 
diff --git a/kernel/panic.c b/kernel/panic.c
index cb1c5619e983..3cfe84318ecf 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -421,7 +421,7 @@ const char *print_tainted(void)
 	return buf;
 }
 
-int test_taint(unsigned flag)
+int test_taint(unsigned int flag)
 {
 	return test_bit(flag, &tainted_mask);
 }
@@ -440,7 +440,7 @@ unsigned long get_taint(void)
  * If something bad has gone wrong, you'll want @lockdebug_ok = false, but for
  * some notewortht-but-not-corrupting cases, it can be set to true.
  */
-void add_taint(unsigned flag, enum lockdep_ok lockdep_ok)
+void add_taint(unsigned int flag, enum lockdep_ok lockdep_ok)
 {
 	if (lockdep_ok == LOCKDEP_NOW_UNRELIABLE && __debug_locks_off()) {
 		pr_warn("Disabling lock debugging due to kernel taint\n");
@@ -579,7 +579,7 @@ struct warn_args {
 	va_list args;
 };
 
-void __warn(const char *file, int line, void *caller, unsigned taint,
+void __warn(const char *file, int line, void *caller, unsigned int taint,
 	    struct pt_regs *regs, struct warn_args *args)
 {
 	disable_trace_on_warning();
@@ -622,7 +622,7 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
 }
 
 #ifndef __WARN_FLAGS
-void warn_slowpath_fmt(const char *file, int line, unsigned taint,
+void warn_slowpath_fmt(const char *file, int line, unsigned int taint,
 		       const char *fmt, ...)
 {
 	struct warn_args args;
-- 
2.26.2


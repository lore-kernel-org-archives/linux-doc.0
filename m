Return-Path: <SRS0=QTCz=7W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BF6C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  9 Jun 2020 15:49:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1DA920801
	for <linux-doc@archiver.kernel.org>; Tue,  9 Jun 2020 15:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="TVj3AUwj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730952AbgFIPtl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Jun 2020 11:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729538AbgFIPtk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jun 2020 11:49:40 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC632C05BD1E
        for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2020 08:49:39 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id w90so17932914qtd.8
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2020 08:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aamBfUVvoW+I1FckAdhDPHQXT+91l+K8y9C2/z2lzpY=;
        b=TVj3AUwjdHhgOS/UsJt3I4WBAS5288jBPcsWleGqHnUXiyCul2rp94CL0/1mwGvvX1
         i6BPUh4v9SrBcjpJ+56ylSsSvWUix8AQRtic+IXBsxfFD1gLaYggg2pLMKvXaAzwf5lg
         WR9bYaFLabrEuDNtY4k4KiAARy1qC/Q4I7Ork181bh11NzMa07BoFf+7MZlaEtIguJ0S
         oO4StrOL7n2tnB8RIOthpCFAQj6/4/PgV2qUbCxvFu0vQUsBgJKAwRzEUWVUumixmLFW
         VtcWYmNKWjKSR00shtzDCnw+klAsjKHTQJturD8B3OXszS2Tf1m6bIGho5em+MwIk+Gh
         1Q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aamBfUVvoW+I1FckAdhDPHQXT+91l+K8y9C2/z2lzpY=;
        b=FN5UCbkYCTc02rj1QXwVKhDSOeElfMwXUZjMz+KSCDnrEvl1yB8oa/29lCueiInAK4
         hx94yV456nXs4a5YHCB8rtMYXrqVpDIGRSS3Ec8x1op9tyU3kx/JSOMdMukYm1NytK+R
         NZAbIfBXCtwbTcj85OO7YZOi6qIaz2zXgOTJbTUgEH5SqazXY8G7Ev38e+NQNe3u3Epn
         M5XaqxVTrntgXR9g+sGyzpKQW9ZjwWhidH6h7/RXjfsh2EEYf0JQng0UgzaQm4X37cWi
         NLfLW2VvM+zzrk0tGmlK25tdbesNuUctUM9n6TcRC/2GVMAv3sx4ojNGST5XLPaKF9un
         SBWg==
X-Gm-Message-State: AOAM531WJ09v0uwQqTriARiSa3DQA/qmEjffH6iuhaeKAArGWOO27ova
        T7ea+tduCQ2Yr7dLJYAbw6b7CQ==
X-Google-Smtp-Source: ABdhPJyexKtgKw0Na12v2fQarkZs1qD57/UTjBDZT4NbbY+4AAKnXxgi0Om7xbKWi+9mZMaPZT4cFg==
X-Received: by 2002:ac8:7c8f:: with SMTP id y15mr30027983qtv.248.1591717778675;
        Tue, 09 Jun 2020 08:49:38 -0700 (PDT)
Received: from localhost (mobile-166-173-249-132.mycingular.net. [166.173.249.132])
        by smtp.gmail.com with ESMTPSA id o3sm11123146qkj.97.2020.06.09.08.49.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 08:49:37 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     daniel.vetter@ffwll.ch, airlied@gmail.com, ppaalanen@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, seanpaul@chromium.org,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        robdclark@gmail.com, rostedt@goodmis.org,
        ville.syrjala@linux.intel.com, chris@chris-wilson.co.uk,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v6 13/13] drm/print: Add tracefs support to the drm logging helpers
Date:   Tue,  9 Jun 2020 11:49:19 -0400
Message-Id: <20200609154932.696-1-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <202006090859.AP8QhpSU%lkp@intel.com>
References: <202006090859.AP8QhpSU%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This patch adds a new module parameter called drm.trace which accepts
the same mask as drm.debug. When a debug category is enabled, log
messages will be put in a new tracefs instance called drm for
consumption.

Using the new tracefs instance will allow distros to enable drm logging
in production without impacting performance or spamming the system
logs.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.195540-1-sean@poorly.run #v1
Link: https://lists.freedesktop.org/archives/dri-devel/2019-November/243230.html #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20191212203301.142437-1-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20200114172155.215463-1-sean@poorly.run #v4

Changes in v5:
-Re-write to use trace_array and the tracefs instance support

Changes in v6:
-Fix old-style function definition warnings
Reported-by: kernel test robot <lkp@intel.com>
---
 Documentation/gpu/drm-uapi.rst |   6 +
 drivers/gpu/drm/drm_drv.c      |   3 +
 drivers/gpu/drm/drm_print.c    | 209 ++++++++++++++++++++++++++++-----
 include/drm/drm_print.h        |  63 ++++++++--
 4 files changed, 241 insertions(+), 40 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 56fec6ed1ad8..1c1c4d043f40 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -312,6 +312,12 @@ Debugfs Support
 .. kernel-doc:: drivers/gpu/drm/drm_debugfs.c
    :export:
 
+DRM Tracing
+---------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_print.c
+   :doc: DRM Tracing
+
 Sysfs Support
 =============
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index bc38322f306e..88404af74c9b 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1108,12 +1108,15 @@ static void drm_core_exit(void)
 	drm_sysfs_destroy();
 	idr_destroy(&drm_minors_idr);
 	drm_connector_ida_destroy();
+	drm_trace_cleanup();
 }
 
 static int __init drm_core_init(void)
 {
 	int ret;
 
+	drm_trace_init();
+
 	drm_connector_ida_init();
 	idr_init(&drm_minors_idr);
 
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 4d984a01b3a3..18dfbd43c23b 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -31,6 +31,7 @@
 #include <linux/moduleparam.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/trace.h>
 
 #include <drm/drm.h>
 #include <drm/drm_drv.h>
@@ -43,17 +44,34 @@
 unsigned int __drm_debug_syslog;
 EXPORT_SYMBOL(__drm_debug_syslog);
 
-MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
-"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
-"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"
-"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"
-"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"
-"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"
-"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
-"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
-"\t\tBit 8 (0x100) will enable DP messages (displayport code)");
+/*
+ * __drm_debug_trace: Enable debug output in drm tracing instance.
+ * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
+ */
+unsigned int __drm_debug_trace;
+EXPORT_SYMBOL(__drm_debug_trace);
+
+#define DEBUG_PARM_DESC(dst) \
+"Enable debug output to " dst ", where each bit enables a debug category.\n" \
+"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n" \
+"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n" \
+"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n" \
+"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n" \
+"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n" \
+"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n" \
+"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n" \
+"\t\tBit 8 (0x100) will enable DP messages (displayport code)"
+
+MODULE_PARM_DESC(debug, DEBUG_PARM_DESC("syslog"));
 module_param_named(debug, __drm_debug_syslog, int, 0600);
 
+MODULE_PARM_DESC(trace, DEBUG_PARM_DESC("tracefs"));
+module_param_named(trace, __drm_debug_trace, int, 0600);
+
+#ifdef CONFIG_TRACING
+struct trace_array *trace_arr;
+#endif
+
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
 {
 	struct drm_print_iterator *iterator = p->arg;
@@ -166,6 +184,20 @@ void __drm_printfn_debug_syslog(struct drm_printer *p, struct va_format *vaf)
 }
 EXPORT_SYMBOL(__drm_printfn_debug_syslog);
 
+void __drm_printfn_trace(struct drm_printer *p, struct va_format *vaf)
+{
+	drm_trace_printf("%s %pV", p->prefix, vaf);
+}
+EXPORT_SYMBOL(__drm_printfn_trace);
+
+void __drm_printfn_debug_syslog_and_trace(struct drm_printer *p,
+					   struct va_format *vaf)
+{
+	pr_debug("%s %pV", p->prefix, vaf);
+	drm_trace_printf("%s %pV", p->prefix, vaf);
+}
+EXPORT_SYMBOL(__drm_printfn_debug_syslog_and_trace);
+
 void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
 {
 	pr_err("*ERROR* %s %pV", p->prefix, vaf);
@@ -246,6 +278,14 @@ void drm_dev_printk(const struct device *dev, const char *level,
 	struct va_format vaf;
 	va_list args;
 
+	va_start(args, format);
+	vaf.fmt = format;
+	vaf.va = &args;
+	drm_trace_printf("%s%s[" DRM_NAME ":%ps] %pV",
+			 dev ? dev_name(dev) : "",dev ? " " : "",
+			 __builtin_return_address(0), &vaf);
+	va_end(args);
+
 	va_start(args, format);
 	vaf.fmt = format;
 	vaf.va = &args;
@@ -267,21 +307,30 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
-		return;
+	if (drm_debug_syslog_enabled(category)) {
+		va_start(args, format);
+		vaf.fmt = format;
+		vaf.va = &args;
 
-	va_start(args, format);
-	vaf.fmt = format;
-	vaf.va = &args;
+		if (dev)
+			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
+				__builtin_return_address(0), &vaf);
+		else
+			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
+			__builtin_return_address(0), &vaf);
 
-	if (dev)
-		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
-			   __builtin_return_address(0), &vaf);
-	else
-		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
-		       __builtin_return_address(0), &vaf);
+		va_end(args);
+	}
 
-	va_end(args);
+	if (drm_debug_trace_enabled(category)) {
+		va_start(args, format);
+		vaf.fmt = format;
+		vaf.va = &args;
+		drm_trace_printf("%s%s[" DRM_NAME ":%ps] %pV",
+				 dev ? dev_name(dev) : "", dev ? " " : "",
+				 __builtin_return_address(0), &vaf);
+		va_end(args);
+	}
 }
 EXPORT_SYMBOL(drm_dev_dbg);
 
@@ -290,17 +339,25 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
-		return;
+	if (drm_debug_syslog_enabled(category)) {
+		va_start(args, format);
+		vaf.fmt = format;
+		vaf.va = &args;
 
-	va_start(args, format);
-	vaf.fmt = format;
-	vaf.va = &args;
+		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
+		__builtin_return_address(0), &vaf);
 
-	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
-	       __builtin_return_address(0), &vaf);
+		va_end(args);
+	}
 
-	va_end(args);
+	if (drm_debug_trace_enabled(category)) {
+		va_start(args, format);
+		vaf.fmt = format;
+		vaf.va = &args;
+		drm_trace_printf("[" DRM_NAME ":%ps] %pV",
+				 __builtin_return_address(0), &vaf);
+		va_end(args);
+	}
 }
 EXPORT_SYMBOL(__drm_dbg);
 
@@ -347,3 +404,97 @@ void drm_print_regset32(struct drm_printer *p, struct debugfs_regset32 *regset)
 	}
 }
 EXPORT_SYMBOL(drm_print_regset32);
+
+
+/**
+ * DOC: DRM Tracing
+ *
+ * *tl;dr* DRM tracing is a lightweight alternative to traditional DRM debug
+ * logging.
+ *
+ * While DRM logging is quite convenient when reproducing a specific issue, it
+ * doesn't help when something goes wrong unexpectedly. There are a couple
+ * reasons why one does not want to enable DRM logging at all times:
+ *
+ * 1. We don't want to overwhelm syslog with drm spam, others have to use it too
+ * 2. Console logging is slow
+ *
+ * DRM tracing aims to solve both these problems.
+ *
+ * To use DRM tracing, set the drm.trace module parameter (via cmdline or sysfs)
+ * to a DRM debug category mask (this is a bitmask of &drm_debug_category
+ * values):
+ * ::
+ *
+ *    eg: echo 0x106 > /sys/module/drm/parameters/trace
+ *
+ * Once active, all log messages in the specified categories will be written to
+ * the DRM trace. Once at capacity, the trace will overwrite old messages with
+ * new ones. At any point, one can read the trace file to extract the previous N
+ * DRM messages:
+ * ::
+ *
+ *    eg: cat /sys/kernel/tracing/instances/drm/trace
+ *
+ * Considerations
+ * **************
+ * The trace is subsystem wide, so if you have multiple devices active, they
+ * will be adding logs to the same trace.
+ *
+ * The contents of the DRM Trace are **not** considered UABI. **DO NOT depend on
+ * the values of these traces in your userspace.** These traces are intended for
+ * entertainment purposes only. The contents of these logs carry no warranty,
+ * expressed or implied.
+ */
+
+
+#ifdef CONFIG_TRACING
+
+/**
+ * drm_trace_init - initializes the drm trace array
+ *
+ * This function fetches (or creates) the drm trace array. This should be called
+ * once on drm subsystem creation and matched with drm_trace_cleanup().
+ */
+void drm_trace_init(void)
+{
+	trace_arr = trace_array_get_by_name("drm");
+	if (!trace_arr)
+		return;
+}
+EXPORT_SYMBOL(drm_trace_init);
+
+/**
+ * drm_trace_printf - adds an entry to the drm tracefs instance
+ * @format: printf format of the message to add to the trace
+ *
+ * This function adds a new entry in the drm tracefs instance
+ */
+void drm_trace_printf(const char *format, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, format);
+	vaf.fmt = format;
+	vaf.va = &args;
+	trace_array_printk(trace_arr, _THIS_IP_, "%pV", &vaf);
+	va_end(args);
+}
+
+/**
+ * drm_trace_cleanup - destroys the drm trace array
+ *
+ * This function destroys the drm trace array created with drm_trace_init. This
+ * should be called once on drm subsystem close and matched with
+ * drm_trace_init().
+ */
+void drm_trace_cleanup(void)
+{
+	if (trace_arr) {
+		trace_array_put(trace_arr);
+		trace_array_destroy(trace_arr);
+	}
+}
+EXPORT_SYMBOL(drm_trace_cleanup);
+#endif
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 8987b98bbfda..284f7d325056 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -36,12 +36,13 @@
 
 /* Do *not* use outside of drm_print.[ch]! */
 extern unsigned int __drm_debug_syslog;
+extern unsigned int __drm_debug_trace;
 
 /**
  * DOC: print
  *
  * A simple wrapper for dev_printk(), seq_printf(), etc.  Allows same
- * debug code to be used for both debugfs and printk logging.
+ * debug code to be used for debugfs, printk and tracefs logging.
  *
  * For example::
  *
@@ -86,6 +87,9 @@ void __drm_printfn_seq_file(struct drm_printer *p, struct va_format *vaf);
 void __drm_puts_seq_file(struct drm_printer *p, const char *str);
 void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
 void __drm_printfn_debug_syslog(struct drm_printer *p, struct va_format *vaf);
+void __drm_printfn_trace(struct drm_printer *p, struct va_format *vaf);
+void __drm_printfn_debug_syslog_and_trace(struct drm_printer *p,
+					   struct va_format *vaf);
 void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
 void __drm_printfn_noop(struct drm_printer *p, struct va_format *vaf);
 
@@ -219,7 +223,8 @@ static inline struct drm_printer drm_info_printer(struct device *dev)
 }
 
 /**
- * drm_debug_printer - construct a &drm_printer that outputs to pr_debug()
+ * drm_debug_printer - construct a &drm_printer that outputs to pr_debug() and
+ * drm tracefs
  * @prefix: debug output prefix
  *
  * RETURNS:
@@ -228,7 +233,7 @@ static inline struct drm_printer drm_info_printer(struct device *dev)
 static inline struct drm_printer drm_debug_printer(const char *prefix)
 {
 	struct drm_printer p = {
-		.printfn = __drm_printfn_debug_syslog,
+		.printfn = __drm_printfn_debug_syslog_and_trace,
 		.prefix = prefix
 	};
 	return p;
@@ -254,14 +259,14 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  * enum drm_debug_category - The DRM debug categories
  *
  * Each of the DRM debug logging macros use a specific category, and the logging
- * is filtered by the drm.debug module parameter. This enum specifies the values
- * for the interface.
+ * is filtered by the drm.debug and drm.trace module parameters. This enum
+ * specifies the values for the interface.
  *
  * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, except
  * DRM_DEBUG() logs to DRM_UT_CORE.
  *
- * Enabling verbose debug messages is done through the drm.debug parameter, each
- * category being enabled by a bit:
+ * Enabling verbose debug messages is done through the drm.debug and drm.trace
+ * parameters, each category being enabled by a bit:
  *
  *  - drm.debug=0x1 will enable CORE messages
  *  - drm.debug=0x2 will enable DRIVER messages
@@ -270,10 +275,14 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  *  - drm.debug=0x1ff will enable all messages
  *
  * An interesting feature is that it's possible to enable verbose logging at
- * run-time by echoing the debug value in its sysfs node::
+ * run-time by echoing the debug category value in its sysfs node::
  *
+ *   # For syslog logging:
  *   # echo 0xf > /sys/module/drm/parameters/debug
  *
+ *   # For tracefs logging:
+ *   # echo 0xf > /sys/module/drm/parameters/trace
+ *
  */
 enum drm_debug_category {
 	/**
@@ -325,14 +334,20 @@ static inline bool drm_debug_syslog_enabled(enum drm_debug_category category)
 	return unlikely(__drm_debug_syslog & category);
 }
 
+static inline bool drm_debug_trace_enabled(enum drm_debug_category category)
+{
+	return unlikely(__drm_debug_trace & category);
+}
+
 static inline bool drm_debug_enabled(enum drm_debug_category category)
 {
-	return drm_debug_syslog_enabled(category);
+	return drm_debug_syslog_enabled(category) ||
+	       drm_debug_trace_enabled(category);
 }
 
 /**
  * drm_debug_category_printer - construct a &drm_printer that outputs to
- * pr_debug() if enabled for the given category.
+ * pr_debug() and/or the drm tracefs instance if enabled for the given category.
  * @category: the DRM_UT_* message category this message belongs to
  * @prefix: trace output prefix
  *
@@ -347,8 +362,13 @@ drm_debug_category_printer(enum drm_debug_category category,
 		.prefix = prefix
 	};
 
-	if (drm_debug_syslog_enabled(category)) {
+	if (drm_debug_syslog_enabled(category) &&
+	    drm_debug_trace_enabled(category)) {
+		p.printfn = __drm_printfn_debug_syslog_and_trace;
+	} else if (drm_debug_syslog_enabled(category)) {
 		p.printfn = __drm_printfn_debug_syslog;
+	} else if (drm_debug_trace_enabled(category)) {
+		p.printfn = __drm_printfn_trace;
 	} else {
 		WARN(1, "Debug category %d is inactive.", category);
 		p.printfn = __drm_printfn_noop;
@@ -357,6 +377,27 @@ drm_debug_category_printer(enum drm_debug_category category,
 	return p;
 }
 
+
+#ifdef CONFIG_TRACING
+void drm_trace_init(void);
+__printf(1, 2)
+void drm_trace_printf(const char *format, ...);
+void drm_trace_cleanup(void);
+#else
+static inline void drm_trace_init(void)
+{
+}
+
+__printf(1, 2)
+static inline void drm_trace_printf(const char *format, ...)
+{
+}
+
+static inline void drm_trace_cleanup(void)
+{
+}
+#endif
+
 /*
  * struct device based logging
  *
-- 
Sean Paul, Software Engineer, Google / Chromium OS


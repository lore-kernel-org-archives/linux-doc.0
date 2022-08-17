Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E747C25B08
	for <linux-doc@archiver.kernel.org>; Wed, 17 Aug 2022 16:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240810AbiHQQtZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Aug 2022 12:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240758AbiHQQtK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Aug 2022 12:49:10 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0392E9D0
        for <linux-doc@vger.kernel.org>; Wed, 17 Aug 2022 09:49:01 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id y20-20020a170903011400b0016f06421a83so8554400plc.12
        for <linux-doc@vger.kernel.org>; Wed, 17 Aug 2022 09:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=6fi31d4oZFoiAlastJlr4uk2tud8gMSfIkLdTl5R4Po=;
        b=G6j6HwTSiblMTLD+qy/eK+MFUxGp81drgLLb6HCNJxAB8kfdio9xzGsQPZXkzx1yD/
         f1i1B8dgDjaWt5f1m3rAwltz6vxpIdt85v7IziML9SHAnslSWa62rNYQWxFSNemcsli9
         1q56ph3nHqVm89d8urWS8CuZaceQWEi8B8b/qJGVSvosPuPK8qCQN4T4wSKvb//9lkx9
         zN83+N34psHqYCzpRUF/t8TiqCmss6FGJegeMqdytyzJROeA63ns60PgXTf++4+MH1Vp
         OiSL+oIwQhlxp/jcZTlptzlZlAHxXUfdrauMbl1ABU6HJPs7nP1E46Zhasxm4Gc4saSR
         U8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=6fi31d4oZFoiAlastJlr4uk2tud8gMSfIkLdTl5R4Po=;
        b=Qsx7TdgiZtXG0mPUtyXRbVXLyq9wXjtKZlO4MZ/QQCDwVnOGaIvHA12RFZN+ttaW4s
         gM19TR/tN9kX8aRxU1RhEMlVHA3SDEw4JHp4Ax7Xs15ALehu022ybwBTyfbxkr8qVSaZ
         xNbHGYcJrVonIo0ePKcYX+t3bOP3s2et6Lq3F/1CTOMJLJ2mC0mKYp9bCEyVKEEZBG4W
         hHneKWkTfpazHihbAtno5i/PFNzs9HaNIl5Q1aq4JBB2CH9O1xPuLxF1y6o0sVpbsjrk
         CKAErARU+cV5h8UI4/fSXK6Q3g51kwUm6hY7e5ak6fUJwf2GmLEn7I/FewRwKPsf7uDQ
         2I6A==
X-Gm-Message-State: ACgBeo0EXtS2r6tm69B+Qe+f4piHMkbwyw3rKW9SxOMXydJAm9oVd8gD
        NV6Ubaxvk5bQQ9VsN8NgkUdRKLpoOAhxARA=
X-Google-Smtp-Source: AA6agR6BoEu8ZqNocP5kwKnBOuHffos9GZHKSREHvPSsPi4apunzh92jlUDI6Q6uAnuks6uBbKSAG8Ngm42Ejcg2
X-Received: from joefradley-custom-96.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:831])
 (user=joefradley job=sendgmr) by 2002:a05:6a00:1d2a:b0:535:2aea:e8ea with
 SMTP id a42-20020a056a001d2a00b005352aeae8eamr8927987pfx.29.1660754940093;
 Wed, 17 Aug 2022 09:49:00 -0700 (PDT)
Date:   Wed, 17 Aug 2022 09:48:49 -0700
In-Reply-To: <20220817164851.3574140-1-joefradley@google.com>
Message-Id: <20220817164851.3574140-2-joefradley@google.com>
Mime-Version: 1.0
References: <20220817164851.3574140-1-joefradley@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH 1/2] kunit: add kunit.enable to enable/disable KUnit test
From:   Joe Fradley <joefradley@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <davidgow@google.com>
Cc:     Joe Fradley <joefradley@google.com>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds the kunit.enable module parameter that will need to be
set to true in addition to KUNIT being enabled for KUnit tests to run.
The default value is true giving backwards compatibility. However, for
the production+testing use case the new config option
KUNIT_ENABLE_DEFAULT_DISABLED can be enabled to default kunit.enable to
false requiring the tester to opt-in by passing kunit.enable=1 to
the kernel.

Signed-off-by: Joe Fradley <joefradley@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 ++++++
 lib/kunit/Kconfig                             |  8 ++++++++
 lib/kunit/test.c                              | 20 +++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d7f30902fda0..ab4c7d133c38 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2436,6 +2436,12 @@
 			0: force disabled
 			1: force enabled
 
+	kunit.enable=	[KUNIT] Enable executing KUnit tests. Requires
+			CONFIG_KUNIT to be set to be fully enabled. The
+			default value can be overridden to disabled via
+			KUNIT_ENABLE_DEFAULT_DISABLED.
+			Default is 1 (enabled)
+
 	kvm.ignore_msrs=[KVM] Ignore guest accesses to unhandled MSRs.
 			Default is 0 (don't ignore, but inject #GP)
 
diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index 0b5dfb001bac..5d6db58dbe9b 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -59,4 +59,12 @@ config KUNIT_ALL_TESTS
 
 	  If unsure, say N.
 
+config KUNIT_ENABLE_DEFAULT_DISABLED
+	bool "Require boot parameter to enable KUnit test execution"
+	help
+	  Sets the default value of the kernel parameter kunit.enable to 0
+	  (disabled). This means to fully enable kunit, config KUNIT needs
+	  to be enabled along with `kunit.enable=1` passed to the kernel. This
+	  allows KUnit to be opt-in at boot time.
+
 endif # KUNIT
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index b73d5bb5c473..e6f98e16e8ae 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -54,6 +54,17 @@ void __kunit_fail_current_test(const char *file, int line, const char *fmt, ...)
 EXPORT_SYMBOL_GPL(__kunit_fail_current_test);
 #endif
 
+/*
+ * Enable KUnit tests to run.
+ */
+#ifdef CONFIG_KUNIT_ENABLE_DEFAULT_DISABLED
+static bool enable_param;
+#else
+static bool enable_param = true;
+#endif
+module_param_named(enable, enable_param, bool, 0);
+MODULE_PARM_DESC(enable, "Enable KUnit tests to run");
+
 /*
  * KUnit statistic mode:
  * 0 - disabled
@@ -590,6 +601,12 @@ int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_
 {
 	unsigned int i;
 
+	if (!enable_param && num_suites > 0) {
+		pr_info("kunit: deactivated, cannot load %s\n",
+			suites != NULL && suites[0] != NULL ? suites[0]->name : "NULL");
+		return -EPERM;
+	}
+
 	for (i = 0; i < num_suites; i++) {
 		kunit_init_suite(suites[i]);
 		kunit_run_tests(suites[i]);
@@ -607,6 +624,9 @@ void __kunit_test_suites_exit(struct kunit_suite **suites, int num_suites)
 {
 	unsigned int i;
 
+	if (!enable_param)
+		return;
+
 	for (i = 0; i < num_suites; i++)
 		kunit_exit_suite(suites[i]);
 
-- 
2.37.1.595.g718a3a8f04-goog


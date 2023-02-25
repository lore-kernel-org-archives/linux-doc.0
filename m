Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2864BC7EE2D
	for <linux-doc@archiver.kernel.org>; Sat, 25 Feb 2023 03:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjBYD1Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Feb 2023 22:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYD1X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 22:27:23 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1313A2E0E2
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 19:27:22 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id w23so1528961qtn.6
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 19:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHZn/4jVwdf9ks/OwO+bD/mVMTUWc6RD0o1MFPaoins=;
        b=uWe2Eq/pQEOLMRSgOscVYonTTeemsUXyln69+nf8Sz3ofpiEzS0YByxb7etlBtq48M
         sjCaQHukuiKkINk/J55L+okWI8+Xj0r4CvKlbWypHbaNwU8rD61e9idS1KyTtMpNWxkn
         bt9aL0KuJNsosHX5ft2ZfOuKTaG3O6J4aaY7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHZn/4jVwdf9ks/OwO+bD/mVMTUWc6RD0o1MFPaoins=;
        b=0Fil74jVbw6z+QfR9mI/rP+LPSa17QH03EDoG/n57mxVybja1fmrRb/p+1K7Tzbs8h
         MKhouZ6+Flh6VKfHgHj+o5dbTycAXgngZF0GFr8je34Wl3PUUjyuK4VmFB6AiipBRpVp
         MB2LYbYM+n7AgaYZguJPycZbWuWh3SrIP3SYUCj9k9fGh5yF2HXwtwaYmhJ0EqsoMxRY
         KLOjLv9hKA9cARzhYKnDjWBAKA7YxmvVIySmfH6APXvSgLNct7t2nZIezcolA2sIHS4+
         zuBza7J5bQ4xVfxq8dql90butOSgdV02GlukUy4ssDxRVcEQRQ7WT6MuE7Xfoxc3N1Xx
         Xl4A==
X-Gm-Message-State: AO0yUKWuHNOkAykjvs1nH04/lwGkzUCj1oRI59pOr8u3urB2msp3vZ8r
        +xvqSx8xhOYG+d7GsKtCXyPQgw==
X-Google-Smtp-Source: AK7set9jKPYMDa8XZ0dtgPkmrvVNYP2FuM/ERN9t8ZX4eZkP2mjoEofdOgM5Sy2W2VxeU1t7ejdoYQ==
X-Received: by 2002:a05:622a:5c6:b0:3b8:2602:9a35 with SMTP id d6-20020a05622a05c600b003b826029a35mr18302538qtb.52.1677295641071;
        Fri, 24 Feb 2023 19:27:21 -0800 (PST)
Received: from joelboxx.c.googlers.com.com (129.239.188.35.bc.googleusercontent.com. [35.188.239.129])
        by smtp.gmail.com with ESMTPSA id c20-20020ac853d4000000b003b62bc6cd1csm671146qtq.82.2023.02.24.19.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 19:27:20 -0800 (PST)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
        rcu@vger.kernel.org
Subject: [PATCH RFC] rcu: Add a minimum time for marking boot as completed
Date:   Sat, 25 Feb 2023 03:27:16 +0000
Message-Id: <20230225032716.3320124-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On many systems, a great deal of boot happens after the kernel thinks the boot
has completed. It is difficult to determine if the system has really booted
from the kernel side. Some features like lazy-RCU can risk slowing down boot
time if, say, a callback has been added that the boot synchronously depends on.

Further, it is better to boot systems which pass 'rcu_normal_after_boot' to
stay expedited for as long as the system is still booting.

For these reasons, this commit adds a config option
'CONFIG_RCU_BOOT_END_DELAY' and a boot parameter rcupdate.boot_end_delay.

By default, this value is 20s. A system designer can choose to specify a value
here to keep RCU from marking boot completion.  The boot sequence will not be
marked ended until at least boot_end_delay milliseconds have passed.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 .../admin-guide/kernel-parameters.txt         |  4 +++
 kernel/rcu/Kconfig                            | 12 +++++++++
 kernel/rcu/update.c                           | 25 +++++++++++++++++--
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2429b5e3184b..0943139fdf01 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5085,6 +5085,10 @@
 	rcutorture.verbose= [KNL]
 			Enable additional printk() statements.
 
+	rcupdate.boot_end_delay= [KNL]
+			Minimum time that must elapse before the boot
+			sequence can be marked as completed.
+
 	rcupdate.rcu_cpu_stall_ftrace_dump= [KNL]
 			Dump ftrace buffer after reporting RCU CPU
 			stall warning.
diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
index 9071182b1284..1033a38bddad 100644
--- a/kernel/rcu/Kconfig
+++ b/kernel/rcu/Kconfig
@@ -217,6 +217,18 @@ config RCU_BOOST_DELAY
 
 	  Accept the default if unsure.
 
+config RCU_BOOT_END_DELAY
+	int "Minimum delay before RCU considers boot has completed"
+	range 0 120000
+	default 20000
+	help
+	  This option specifies the minmum time since boot before which
+	  RCU believes the system is booted. The actual delay can be
+	  higher than this if the kernel takes a long time to initialize
+	  but it will never be smaller than this.
+
+	  Accept the default if unsure.
+
 config RCU_EXP_KTHREAD
 	bool "Perform RCU expedited work in a real-time kthread"
 	depends on RCU_BOOST && RCU_EXPERT
diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
index 19bf6fa3ee6a..5b73341d9b89 100644
--- a/kernel/rcu/update.c
+++ b/kernel/rcu/update.c
@@ -62,6 +62,10 @@ module_param(rcu_normal_after_boot, int, 0444);
 #endif
 #endif /* #ifndef CONFIG_TINY_RCU */
 
+/* Minimum time until RCU considers boot as completed. */
+static int boot_end_delay = CONFIG_RCU_BOOT_END_DELAY;
+module_param(boot_end_delay, int, 0444);
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 /**
  * rcu_read_lock_held_common() - might we be in RCU-sched read-side critical section?
@@ -225,12 +229,29 @@ void rcu_unexpedite_gp(void)
 EXPORT_SYMBOL_GPL(rcu_unexpedite_gp);
 
 static bool rcu_boot_ended __read_mostly;
-
 /*
- * Inform RCU of the end of the in-kernel boot sequence.
+ * Inform RCU of the end of the in-kernel boot sequence. The boot sequence will
+ * not be marked ended until at least boot_end_delay milliseconds have passed.
  */
+void rcu_end_inkernel_boot(void);
+static void boot_rcu_work_fn(struct work_struct *work)
+{
+	rcu_end_inkernel_boot();
+}
+static DECLARE_DELAYED_WORK(boot_rcu_work, boot_rcu_work_fn);
+
 void rcu_end_inkernel_boot(void)
 {
+	if (boot_end_delay) {
+		u64 boot_ms = ktime_get_boot_fast_ns() / 1000000UL;
+
+		if (boot_ms < boot_end_delay) {
+			schedule_delayed_work(&boot_rcu_work,
+					boot_end_delay - boot_ms);
+			return;
+		}
+	}
+
 	rcu_unexpedite_gp();
 	rcu_async_relax();
 	if (rcu_normal_after_boot)
-- 
2.39.2.637.g21b0678d19-goog


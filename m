Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 35EE37D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbeIYGXi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:23:38 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:47008 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728752AbeIYGXi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:23:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id b129-v6so10098332pga.13
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WY5TD/qDFMJ34JwZfEBo6JanVUZJJF8/8bw/2Z0I5Ks=;
        b=ad+sZQATuWdk6AndQBTL0nmCWHhRmmAZ2jmMc/EyW4mX+Ze5HVxR2eWO0h0An+IRml
         Iwz0K/cBSAVyyFBwz4I5M1M82ZaJUq3Inw0vJOjp+lfTVIE+KEIrS5HSkpyk+6MtC4yP
         eY29Qevl9HTQBH9y7wio5SajsLELfKkv9gpPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WY5TD/qDFMJ34JwZfEBo6JanVUZJJF8/8bw/2Z0I5Ks=;
        b=DvdwmBx2pSZrG+w56vXMspPlGV3ps8kdMA/2TqPVTclHBKjGMCFOop6LhFN5eRIS5w
         SQ5QzM9T0l5PdvWKBnHMRq8p61or7w2Fqvuw1rdulguNqIynhBnXzE1LuyrOuCoHq3gX
         N4ojl37gmPZMqlT8JEa4402r4Bx0ghxxO8QyOhjip0rrspGmZE0X/prWZnUaEZOq2QxO
         WiAeWLmQwviB1/u4BZg68wHwGOhw0hWXYodctXU8YfLwRLvsJxl4vvT1KjOiEecJgMfL
         KIyEOFvxN6nvMR9VDzB5/S+67aL6l04wi5DrCPSrxCA/MjouFBTVcrtD501QNmeAA4Bd
         EFow==
X-Gm-Message-State: ABuFfog+LgFaB9iAnu7u7/A859QOk3P78TRlhHmvW/cvlIjDqOdNtlVF
        Klt3U3spTjL1WTb0sVy5cfDusxvXrQg=
X-Google-Smtp-Source: ACcGV624e9WPRdNCN+ahEVelzIQg0ROt1JYZfg4RMPCOwoVwx1r3r9cBCAns+VcTzdjfk6l65r0MIA==
X-Received: by 2002:a62:8ad1:: with SMTP id o78-v6mr978330pfk.17.1537834732471;
        Mon, 24 Sep 2018 17:18:52 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id t128-v6sm313731pfc.90.2018.09.24.17.18.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Sep 2018 17:18:48 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     James Morris <jmorris@namei.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH security-next v3 13/29] LoadPin: Rename "enable" to "enforce"
Date:   Mon, 24 Sep 2018 17:18:16 -0700
Message-Id: <20180925001832.18322-14-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

LoadPin's "enable" setting is really about enforcement, not whether
or not the LSM is using LSM hooks. Instead, split this out so that LSM
enabling can be logically distinct from whether enforcement is happening
(for example, the pinning happens when the LSM is enabled, but the pin
is only checked when "enforce" is set). This allows LoadPin to continue
to operate sanely in test environments once LSM enable/disable is
centrally handled (i.e. we want LoadPin to be enabled separately from
its enforcement).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/loadpin/Kconfig   |  4 ++--
 security/loadpin/loadpin.c | 21 +++++++++++----------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/security/loadpin/Kconfig b/security/loadpin/Kconfig
index dd01aa91e521..8653608a3693 100644
--- a/security/loadpin/Kconfig
+++ b/security/loadpin/Kconfig
@@ -10,10 +10,10 @@ config SECURITY_LOADPIN
 	  have a root filesystem backed by a read-only device such as
 	  dm-verity or a CDROM.
 
-config SECURITY_LOADPIN_ENABLED
+config SECURITY_LOADPIN_ENFORCING
 	bool "Enforce LoadPin at boot"
 	depends on SECURITY_LOADPIN
 	help
 	  If selected, LoadPin will enforce pinning at boot. If not
 	  selected, it can be enabled at boot with the kernel parameter
-	  "loadpin.enabled=1".
+	  "loadpin.enforcing=1".
diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
index 0716af28808a..d8a68a6f6fef 100644
--- a/security/loadpin/loadpin.c
+++ b/security/loadpin/loadpin.c
@@ -44,7 +44,7 @@ static void report_load(const char *origin, struct file *file, char *operation)
 	kfree(pathname);
 }
 
-static int enabled = IS_ENABLED(CONFIG_SECURITY_LOADPIN_ENABLED);
+static int enforcing = IS_ENABLED(CONFIG_SECURITY_LOADPIN_ENFORCING);
 static struct super_block *pinned_root;
 static DEFINE_SPINLOCK(pinned_root_spinlock);
 
@@ -60,8 +60,8 @@ static struct ctl_path loadpin_sysctl_path[] = {
 
 static struct ctl_table loadpin_sysctl_table[] = {
 	{
-		.procname       = "enabled",
-		.data           = &enabled,
+		.procname       = "enforcing",
+		.data           = &enforcing,
 		.maxlen         = sizeof(int),
 		.mode           = 0644,
 		.proc_handler   = proc_dointvec_minmax,
@@ -97,7 +97,7 @@ static void check_pinning_enforcement(struct super_block *mnt_sb)
 					   loadpin_sysctl_table))
 			pr_notice("sysctl registration failed!\n");
 		else
-			pr_info("load pinning can be disabled.\n");
+			pr_info("enforcement can be disabled.\n");
 	} else
 		pr_info("load pinning engaged.\n");
 }
@@ -128,7 +128,7 @@ static int loadpin_read_file(struct file *file, enum kernel_read_file_id id)
 
 	/* This handles the older init_module API that has a NULL file. */
 	if (!file) {
-		if (!enabled) {
+		if (!enforcing) {
 			report_load(origin, NULL, "old-api-pinning-ignored");
 			return 0;
 		}
@@ -151,7 +151,7 @@ static int loadpin_read_file(struct file *file, enum kernel_read_file_id id)
 		 * Unlock now since it's only pinned_root we care about.
 		 * In the worst case, we will (correctly) report pinning
 		 * failures before we have announced that pinning is
-		 * enabled. This would be purely cosmetic.
+		 * enforcing. This would be purely cosmetic.
 		 */
 		spin_unlock(&pinned_root_spinlock);
 		check_pinning_enforcement(pinned_root);
@@ -161,7 +161,7 @@ static int loadpin_read_file(struct file *file, enum kernel_read_file_id id)
 	}
 
 	if (IS_ERR_OR_NULL(pinned_root) || load_root != pinned_root) {
-		if (unlikely(!enabled)) {
+		if (unlikely(!enforcing)) {
 			report_load(origin, file, "pinning-ignored");
 			return 0;
 		}
@@ -186,10 +186,11 @@ static struct security_hook_list loadpin_hooks[] __lsm_ro_after_init = {
 
 void __init loadpin_add_hooks(void)
 {
-	pr_info("ready to pin (currently %sabled)", enabled ? "en" : "dis");
+	pr_info("ready to pin (currently %senforcing)\n",
+		enforcing ? "" : "not ");
 	security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks), "loadpin");
 }
 
 /* Should not be mutable after boot, so not listed in sysfs (perm == 0). */
-module_param(enabled, int, 0);
-MODULE_PARM_DESC(enabled, "Pin module/firmware loading (default: true)");
+module_param(enforcing, int, 0);
+MODULE_PARM_DESC(enforcing, "Enforce module/firmware pinning");
-- 
2.17.1


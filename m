Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F61D7DD2A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 00:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbeJKHno (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 03:43:44 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36560 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbeJKHnn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Oct 2018 03:43:43 -0400
Received: by mail-pg1-f196.google.com with SMTP id f18-v6so3284656pgv.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Oct 2018 17:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9oGsxFd1lYWYAorYyN9hIBrjHAPxot319f0edyopgaA=;
        b=anZ9tL1PA/A7rUVRlnGvXfA1RrTh3Rl+L9f8RGaTp3W6wYeJEIdrEvUDt+++H9nwI5
         +SSz/JUU3Fj6H3VQP4MEL83+vnQ4ISidqkmm6l19mIxm+FslYKv5SHX4K0daMZ7riVM/
         8PrbhtZGbF/S8ELKZ8XiOBJqS1BJafhlmhcpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9oGsxFd1lYWYAorYyN9hIBrjHAPxot319f0edyopgaA=;
        b=lHjpqVavM4iMSsarnKkt0IzmqkadnqvdkRoT6K3polLnGWpvjStJvnAvVN543cOnO1
         dku/uJPn4owWhlL+9YUfwpMIGchvpgENFX7b5U44s6fFdq6tbMRUG7VvWo6hFUC/k8Uk
         D1wrINMLH9S9Mza1yBHgvxobCqFdj0uQLQft5OPjSmu6UqLwGmpcYVyqjsjxhc0IEN6g
         eHSskha65qUBlbTm6i1/BJVryoMaQh1xWrLIKghP1gobY47Zipk7Qi3W1/O7xpJntAmx
         4c21wsrniXztjD7AzrnPpL2vr3lrGctAR/59PW2GseMx3XhrjQ0t6YjTXXQjr6VoICgA
         izhg==
X-Gm-Message-State: ABuFfoilWMumo8BPZvaSGmdNBIm2hwjF39taO4l+if3WVmZic7XzPSwW
        n24lqZl2GnU5xTgjsbqxgyc6zA==
X-Google-Smtp-Source: ACcGV60LUQF72bP/Wa30XRftKl+C/LebjcC1hyRFYuci9cH0ZA+wlWrXoxfVnBxvygE5UPg+mAqHxQ==
X-Received: by 2002:a62:c2c1:: with SMTP id w62-v6mr16418780pfk.35.1539217148718;
        Wed, 10 Oct 2018 17:19:08 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id r65-v6sm35307981pfj.5.2018.10.10.17.18.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Oct 2018 17:19:06 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     James Morris <jmorris@namei.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jordan Glover <Golden_Miller83@protonmail.ch>,
        LSM <linux-security-module@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH security-next v5 13/30] LoadPin: Rename boot param "enabled" to "enforce"
Date:   Wed, 10 Oct 2018 17:18:29 -0700
Message-Id: <20181011001846.30964-14-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011001846.30964-1-keescook@chromium.org>
References: <20181011001846.30964-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

LoadPin's "enabled" setting is really about enforcement, not whether
or not the LSM is using LSM hooks. Instead, split this out so that LSM
enabling can be logically distinct from whether enforcement is happening
(for example, the pinning happens when the LSM is enabled, but the pin
is only checked when "enforce" is set). This allows LoadPin to continue
to operate sanely in test environments once LSM enable/disable is
centrally handled (i.e. we want LoadPin to be enabled separately from
its enforcement).

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
---
 security/loadpin/Kconfig   |  4 ++--
 security/loadpin/loadpin.c | 21 +++++++++++----------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/security/loadpin/Kconfig b/security/loadpin/Kconfig
index dd01aa91e521..a0d70d82b98e 100644
--- a/security/loadpin/Kconfig
+++ b/security/loadpin/Kconfig
@@ -10,10 +10,10 @@ config SECURITY_LOADPIN
 	  have a root filesystem backed by a read-only device such as
 	  dm-verity or a CDROM.
 
-config SECURITY_LOADPIN_ENABLED
+config SECURITY_LOADPIN_ENFORCE
 	bool "Enforce LoadPin at boot"
 	depends on SECURITY_LOADPIN
 	help
 	  If selected, LoadPin will enforce pinning at boot. If not
 	  selected, it can be enabled at boot with the kernel parameter
-	  "loadpin.enabled=1".
+	  "loadpin.enforce=1".
diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
index 0716af28808a..a2dc146b6364 100644
--- a/security/loadpin/loadpin.c
+++ b/security/loadpin/loadpin.c
@@ -44,7 +44,7 @@ static void report_load(const char *origin, struct file *file, char *operation)
 	kfree(pathname);
 }
 
-static int enabled = IS_ENABLED(CONFIG_SECURITY_LOADPIN_ENABLED);
+static int enforce = IS_ENABLED(CONFIG_SECURITY_LOADPIN_ENFORCE);
 static struct super_block *pinned_root;
 static DEFINE_SPINLOCK(pinned_root_spinlock);
 
@@ -60,8 +60,8 @@ static struct ctl_path loadpin_sysctl_path[] = {
 
 static struct ctl_table loadpin_sysctl_table[] = {
 	{
-		.procname       = "enabled",
-		.data           = &enabled,
+		.procname       = "enforce",
+		.data           = &enforce,
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
+		if (!enforce) {
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
+		if (unlikely(!enforce)) {
 			report_load(origin, file, "pinning-ignored");
 			return 0;
 		}
@@ -186,10 +186,11 @@ static struct security_hook_list loadpin_hooks[] __lsm_ro_after_init = {
 
 void __init loadpin_add_hooks(void)
 {
-	pr_info("ready to pin (currently %sabled)", enabled ? "en" : "dis");
+	pr_info("ready to pin (currently %senforcing)\n",
+		enforce ? "" : "not ");
 	security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks), "loadpin");
 }
 
 /* Should not be mutable after boot, so not listed in sysfs (perm == 0). */
-module_param(enabled, int, 0);
-MODULE_PARM_DESC(enabled, "Pin module/firmware loading (default: true)");
+module_param(enforce, int, 0);
+MODULE_PARM_DESC(enforce, "Enforce module/firmware pinning");
-- 
2.17.1


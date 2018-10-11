Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9D9B57D8D9
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 00:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbeJKHuv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 03:50:51 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36796 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbeJKHuc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Oct 2018 03:50:32 -0400
Received: by mail-pl1-f193.google.com with SMTP id y11-v6so3294168plt.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Oct 2018 17:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=piFJbUUnA3DqTyvccR0Ze8PG9upbNm6UGtvVT6YJ0+U=;
        b=aswPjPNs9bK0tyjPisDP2i0c3HxiZJd9dkzq0IXlaPWuNK/z/NLKaysyb/tEQZqYWj
         yuGe5dqHCdG/xOcXFanWAqPLhny9RIpqjtlmHncMmOeuzfPAtcL0wcwGNsgThWiWIPSO
         3SeL8e8kMJ2pbTd18YM/XwjcsAG1VY1VIQRhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=piFJbUUnA3DqTyvccR0Ze8PG9upbNm6UGtvVT6YJ0+U=;
        b=YJlUkxQpMQhgDyCqcvPh9e0b8g8guGCYwD6lR6pfxvOlI/v6QKRKsAmiTqgRUWlF0w
         i9Yev8weBn7ORQS8PKsrk88XPp9KFfuxce3cG6C2LSZ/AwaEcaXnZrHMqdO32HlMVkP2
         cB+ZRU6cL6BfQ4IqpoGcv0sFDHsxl7Npm05abErH7az8PpOARKqVpcWj/aNmXfJUoQUk
         RoQMMo0YnhR3cgmW5Kq5HxA5oTfn/HOpbja5BCbwj1ZFQfVCrJRkic5KFiKzr5FOfObN
         RxxfGfqNLFA5yNpddtEywUW0hczQXscwKM5eyyK11d5SY4qXgwQ+NnVOJJ9QH+k3LcIr
         Z20Q==
X-Gm-Message-State: ABuFfohki2prf1m47T/mEAZnPeUUJ4dL5GIG47JA1AK/tb3/zKDLmojT
        RbwLi+VSkH86HdIFU1AePX9f9A==
X-Google-Smtp-Source: ACcGV61GWZ/jEH6+pjl/Cg7EY2qZq9fOqxOtf2HYn5v8u6IR+5Y73sAiWB+W5hGJ2mYIohWFcE/jNQ==
X-Received: by 2002:a17:902:6e17:: with SMTP id u23-v6mr36037411plk.28.1539217556469;
        Wed, 10 Oct 2018 17:25:56 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id c28-v6sm82620821pfk.48.2018.10.10.17.25.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Oct 2018 17:25:50 -0700 (PDT)
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
Subject: [PATCH security-next v5 28/30] Yama: Initialize as ordered LSM
Date:   Wed, 10 Oct 2018 17:18:44 -0700
Message-Id: <20181011001846.30964-29-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011001846.30964-1-keescook@chromium.org>
References: <20181011001846.30964-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This converts Yama from being a direct "minor" LSM into an ordered LSM.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/lsm_hooks.h | 5 -----
 security/Kconfig          | 2 +-
 security/security.c       | 1 -
 security/yama/yama_lsm.c  | 8 +++++++-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index e6893ff9ca2b..833ec0f03795 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2087,10 +2087,5 @@ static inline void security_delete_hooks(struct security_hook_list *hooks,
 #endif /* CONFIG_SECURITY_WRITABLE_HOOKS */
 
 extern void __init capability_add_hooks(void);
-#ifdef CONFIG_SECURITY_YAMA
-extern void __init yama_add_hooks(void);
-#else
-static inline void __init yama_add_hooks(void) { }
-#endif
 
 #endif /* ! __LINUX_LSM_HOOKS_H */
diff --git a/security/Kconfig b/security/Kconfig
index 550bd7032ab2..f2a04f922ede 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -241,7 +241,7 @@ source security/integrity/Kconfig
 
 config LSM
 	string "Ordered list of enabled LSMs"
-	default "loadpin,integrity,selinux,smack,tomoyo,apparmor"
+	default "yama,loadpin,integrity,selinux,smack,tomoyo,apparmor"
 	help
 	  A comma-separated list of LSMs, in initialization order.
 	  Any LSMs left off this list will be ignored. This can be
diff --git a/security/security.c b/security/security.c
index 6ad1262aa6ab..2eb8afdd945d 100644
--- a/security/security.c
+++ b/security/security.c
@@ -264,7 +264,6 @@ int __init security_init(void)
 	 * Load minor LSMs, with the capability module always first.
 	 */
 	capability_add_hooks();
-	yama_add_hooks();
 
 	/* Load LSMs in specified order. */
 	ordered_lsm_init();
diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index ffda91a4a1aa..eb1da1303d2e 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -477,9 +477,15 @@ static void __init yama_init_sysctl(void)
 static inline void yama_init_sysctl(void) { }
 #endif /* CONFIG_SYSCTL */
 
-void __init yama_add_hooks(void)
+static int __init yama_init(void)
 {
 	pr_info("Yama: becoming mindful.\n");
 	security_add_hooks(yama_hooks, ARRAY_SIZE(yama_hooks), "yama");
 	yama_init_sysctl();
+	return 0;
 }
+
+DEFINE_LSM(yama) = {
+	.name = "yama",
+	.init = yama_init,
+};
-- 
2.17.1


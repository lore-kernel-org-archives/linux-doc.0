Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5B0817D8E9
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 00:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbeJBHgI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:36:08 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:35302 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727283AbeJBHf5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:35:57 -0400
Received: by mail-it1-f194.google.com with SMTP id p64-v6so1097821itp.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 17:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mIdjYFq7c7fTSRHDRwel+J92+FbxHNrJN5VYoG9wIDw=;
        b=BfoqLPXHxS93a/rzG/RVvfy+1Iq2aaNB5YzWDrysVIaxLdWw4ehaA2CZvl9Z9zHI96
         2LQJlqERAi6K4wDOcLfhdsnl9Y26y+WRtuKNULt/9hYyFfikUF9eOeKLy5yNg+BbdFPJ
         /8cUXpz0dMgGR4zDMQvHVQlbj0h3fi3jlodDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mIdjYFq7c7fTSRHDRwel+J92+FbxHNrJN5VYoG9wIDw=;
        b=mWaM3/Wyqu+0sHTkYE+fk6C00leeXE6eDggYwptd3RVF+98lNX2BbTAjJ6XcUlgmqY
         /3s24LQfzPI25WgJUTj3zy1FC9MtKW6h1wnOX2sZByu/nh13QCGiTWrt9EFV9FQ/DU8X
         8z/Gnq30WikJWett+ZOWJN8/b90Y4lractqQQMSxASHFWJdBcTmFdJkl1ednPtGJMQpF
         PiJxWI8NIYHINGWzUftdH3T3RExREe8Q2h0/wKt/wgz5sDyq1wRbFpuXgv+P4DPOAiuA
         CzxqCvZdEoOiH1lPXaNVadSHEzP0an0N5lB1+TEazQk85zn/ggL67T5ukXMNKKxmpP82
         60QA==
X-Gm-Message-State: ABuFfog24fMy2z+cwZRi/OFgVxuO62iGIl6FG3ti0g/Pl3hjDS0mAwZE
        /fQ7e9+ppNQC0UKVtEfFcxOFDw==
X-Google-Smtp-Source: ACcGV61bYTcllSbQSE6iCf++jH0jSlvI9K8UkWobmBPZcKEWmJ0mZxzh/SXlpclmCIFbzD6V+C7mCQ==
X-Received: by 2002:a63:1624:: with SMTP id w36-v6mr12343353pgl.409.1538441728333;
        Mon, 01 Oct 2018 17:55:28 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id q23-v6sm22030901pfd.44.2018.10.01.17.55.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Oct 2018 17:55:25 -0700 (PDT)
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
Subject: [PATCH security-next v4 31/32] LSM: Separate idea of "major" LSM from "exclusive" LSM
Date:   Mon,  1 Oct 2018 17:55:04 -0700
Message-Id: <20181002005505.6112-32-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to both support old "security=" Legacy Major LSM selection, and
handling real exclusivity, this creates LSM_FLAG_EXCLUSIVE and updates
the selection logic to handle them.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/lsm_hooks.h  |  1 +
 security/apparmor/lsm.c    |  2 +-
 security/security.c        | 12 ++++++++++++
 security/selinux/hooks.c   |  2 +-
 security/smack/smack_lsm.c |  2 +-
 security/tomoyo/tomoyo.c   |  2 +-
 6 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 36e7a716fdfe..2c9cf89a20ad 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2040,6 +2040,7 @@ extern void security_add_hooks(struct security_hook_list *hooks, int count,
 				char *lsm);
 
 #define LSM_FLAG_LEGACY_MAJOR	BIT(0)
+#define LSM_FLAG_EXCLUSIVE	BIT(1)
 
 enum lsm_order {
 	LSM_ORDER_FIRST = -1,	/* This is only for capabilities. */
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 4cd96a66ed6f..4eb74a6f2020 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1599,7 +1599,7 @@ static int __init apparmor_init(void)
 
 DEFINE_LSM(apparmor) = {
 	.name = "apparmor",
-	.flags = LSM_FLAG_LEGACY_MAJOR,
+	.flags = LSM_FLAG_LEGACY_MAJOR | LSM_FLAG_EXCLUSIVE,
 	.enabled = &apparmor_enabled,
 	.init = apparmor_init,
 };
diff --git a/security/security.c b/security/security.c
index 813dab3b5b97..7d542e78b7e8 100644
--- a/security/security.c
+++ b/security/security.c
@@ -52,6 +52,7 @@ static __initconst const char * const builtin_lsm_order = CONFIG_LSM_ORDER;
 
 /* Ordered list of LSMs to initialize. */
 static __initdata struct lsm_info **ordered_lsms;
+static __initdata struct lsm_info *exclusive;
 
 static __initdata bool debug;
 #define init_debug(...)						\
@@ -196,6 +197,12 @@ static bool __init lsm_allowed(struct lsm_info *lsm)
 	if (!is_enabled(lsm))
 		return false;
 
+	/* Not allowed if another exclusive LSM already initialized. */
+	if ((lsm->flags & LSM_FLAG_EXCLUSIVE) && exclusive) {
+		init_debug("exclusive disabled: %s\n", lsm->name);
+		return false;
+	}
+
 	return true;
 }
 
@@ -211,6 +218,11 @@ static void __init maybe_initialize_lsm(struct lsm_info *lsm)
 	if (enabled) {
 		int ret;
 
+		if ((lsm->flags & LSM_FLAG_EXCLUSIVE) && !exclusive) {
+			exclusive = lsm;
+			init_debug("exclusive: %s\n", lsm->name);
+		}
+
 		init_debug("initializing %s\n", lsm->name);
 		ret = lsm->init();
 		WARN(ret, "%s failed to initialize: %d\n", lsm->name, ret);
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 8f5eea097612..c070d3761ddc 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -7181,7 +7181,7 @@ void selinux_complete_init(void)
    all processes and objects when they are created. */
 DEFINE_LSM(selinux) = {
 	.name = "selinux",
-	.flags = LSM_FLAG_LEGACY_MAJOR,
+	.flags = LSM_FLAG_LEGACY_MAJOR | LSM_FLAG_EXCLUSIVE,
 	.enabled = &selinux_enabled,
 	.init = selinux_init,
 };
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index f243044d5a55..92e4baa342f8 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4881,6 +4881,6 @@ static __init int smack_init(void)
  */
 DEFINE_LSM(smack) = {
 	.name = "smack",
-	.flags = LSM_FLAG_LEGACY_MAJOR,
+	.flags = LSM_FLAG_LEGACY_MAJOR | LSM_FLAG_EXCLUSIVE,
 	.init = smack_init,
 };
diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index a46f6bc1e97c..daff7d7897ad 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -550,6 +550,6 @@ static int __init tomoyo_init(void)
 
 DEFINE_LSM(tomoyo) = {
 	.name = "tomoyo",
-	.flags = LSM_FLAG_LEGACY_MAJOR,
+	.flags = LSM_FLAG_LEGACY_MAJOR | LSM_FLAG_EXCLUSIVE,
 	.init = tomoyo_init,
 };
-- 
2.17.1


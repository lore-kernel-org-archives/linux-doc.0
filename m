Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C992B7D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 00:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbeJBHf5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:35:57 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40714 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727271AbeJBHfz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:35:55 -0400
Received: by mail-io1-f67.google.com with SMTP id w16-v6so249397iom.7
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 17:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=88yNmB93L+BeJMXb+ZnphW8xbUqHcnKdcEWbXKGRC9A=;
        b=KSl617SZmT6xVrVo5MS9RYC65CkNeOqI8elrrzzl13+qjaa43JoaDliahLsXPxL/su
         iV9dDCiT7CgdNShKcQNcKuAstxIl3n3dXzeRyxw7ndGGbYIs+Ea4FvutycrVipZ/O/uK
         Jra0YMGH8BP8b+S/i43TNy/ruRNmpKlKAYH1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=88yNmB93L+BeJMXb+ZnphW8xbUqHcnKdcEWbXKGRC9A=;
        b=ejEjkOppz/IzTVF1AtH/DPDcKpjxmCxGHJqznC6nMbWE+Hrbmwn1mN8HX/bClhs35K
         2lVfzup5uHGAN/4bYwrhtzLtajK1pucEibrGN9VZB5mgPXzTk8kX0F+3UViExJDdOMop
         VJIX0Bjj4vAYMHcIBSCjvpaebXlVtUJjpv+5W5CnkA99uJcnMu284OiiN6/ELJ4YUayT
         p0797XrjLR4OGOMmFr2/ABRp5WutWh/w6ZCo4JGEX+jD4eOAPtNmTOvCCt1hphCk+Wtt
         UK9bFW6UQCxbpP/e+GB+0up9h2ZOFeB47KKYyEAwmEWHovxdk/6/9X0XKaM54Oa7ho/t
         xY9w==
X-Gm-Message-State: ABuFfohpFZmQdVW4LzefRhOKgTBKaHRiw45DcZDcFOQBAaNC4GMdfnoo
        Ri4L92+3+MoqmMi05iHr/92K/g==
X-Google-Smtp-Source: ACcGV63Xf6rpQAAEnrsQzCwEHnDQOXA2rN/lP4c4Ax94cVNFBVC+BwLkBf/Uux1IQMd3NSEeXF2WqA==
X-Received: by 2002:a17:902:5e3:: with SMTP id f90-v6mr14573303plf.286.1538441726356;
        Mon, 01 Oct 2018 17:55:26 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id h132-v6sm22401519pfc.100.2018.10.01.17.55.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Oct 2018 17:55:24 -0700 (PDT)
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
Subject: [PATCH security-next v4 32/32] LSM: Add all exclusive LSMs to ordered initialization
Date:   Mon,  1 Oct 2018 17:55:05 -0700
Message-Id: <20181002005505.6112-33-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This removes CONFIG_DEFAULT_SECURITY in favor of the explicit build-time
ordering offered by CONFIG_LSM_ORDER, and adds all the exclusive LSMs to
the ordered LSM initialization. The old meaning of CONFIG_DEFAULT_SECURITY
is now captured by which exclusive LSM is listed first in the LSM order.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/Kconfig    | 43 ++++---------------------------------------
 security/security.c | 23 +----------------------
 2 files changed, 5 insertions(+), 61 deletions(-)

diff --git a/security/Kconfig b/security/Kconfig
index c459d2b4c7bd..cc8bb1c344f5 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -239,43 +239,6 @@ source security/yama/Kconfig
 
 source security/integrity/Kconfig
 
-choice
-	prompt "Default security module"
-	default DEFAULT_SECURITY_SELINUX if SECURITY_SELINUX
-	default DEFAULT_SECURITY_SMACK if SECURITY_SMACK
-	default DEFAULT_SECURITY_TOMOYO if SECURITY_TOMOYO
-	default DEFAULT_SECURITY_APPARMOR if SECURITY_APPARMOR
-	default DEFAULT_SECURITY_DAC
-
-	help
-	  Select the security module that will be used by default if the
-	  kernel parameter security= is not specified.
-
-	config DEFAULT_SECURITY_SELINUX
-		bool "SELinux" if SECURITY_SELINUX=y
-
-	config DEFAULT_SECURITY_SMACK
-		bool "Simplified Mandatory Access Control" if SECURITY_SMACK=y
-
-	config DEFAULT_SECURITY_TOMOYO
-		bool "TOMOYO" if SECURITY_TOMOYO=y
-
-	config DEFAULT_SECURITY_APPARMOR
-		bool "AppArmor" if SECURITY_APPARMOR=y
-
-	config DEFAULT_SECURITY_DAC
-		bool "Unix Discretionary Access Controls"
-
-endchoice
-
-config DEFAULT_SECURITY
-	string
-	default "selinux" if DEFAULT_SECURITY_SELINUX
-	default "smack" if DEFAULT_SECURITY_SMACK
-	default "tomoyo" if DEFAULT_SECURITY_TOMOYO
-	default "apparmor" if DEFAULT_SECURITY_APPARMOR
-	default "" if DEFAULT_SECURITY_DAC
-
 config LSM_ENABLE
 	string "LSMs to enable at boot time"
 	default "all"
@@ -293,12 +256,14 @@ config LSM_ENABLE
 
 config LSM_ORDER
 	string "Default initialization order of builtin LSMs"
-	default "yama,loadpin,integrity"
+	default "yama,loadpin,integrity,selinux,smack,tomoyo,apparmor"
 	help
 	  A comma-separated list of LSMs, in initialization order.
 	  Any LSMs left off this list will be link-order initialized
 	  after any listed LSMs. Any LSMs listed here but not built in
-	  the kernel will be ignored.
+	  the kernel will be ignored. If the boot parameter
+	  "lsm.order=" is used, it will override this order, with any
+	  unlisted LSMs falling back to the order of this config, etc.
 
 	  If unsure, leave this as the default.
 
diff --git a/security/security.c b/security/security.c
index 7d542e78b7e8..d682342b6450 100644
--- a/security/security.c
+++ b/security/security.c
@@ -146,7 +146,6 @@ static void __init parse_lsm_order(const char *order, const char *origin)
 
 		for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
 			if (lsm->order == LSM_ORDER_MUTABLE &&
-			    (lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0 &&
 			    strcmp(lsm->name, name) == 0) {
 				append_ordered_lsm(lsm, origin);
 				found = true;
@@ -178,8 +177,7 @@ static void __init prepare_lsm_order(void)
 
 	/* Add any missing LSMs, in link order. */
 	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-		if (lsm->order == LSM_ORDER_MUTABLE &&
-		    (lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
+		if (lsm->order == LSM_ORDER_MUTABLE)
 			append_ordered_lsm(lsm, "link-time");
 	}
 
@@ -237,18 +235,6 @@ static void __init ordered_lsm_init(void)
 		maybe_initialize_lsm(*lsm);
 }
 
-static void __init major_lsm_init(void)
-{
-	struct lsm_info *lsm;
-
-	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-		if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
-			continue;
-
-		maybe_initialize_lsm(lsm);
-	}
-}
-
 static void __init parse_lsm_enable(const char *str,
 				    bool enabled)
 {
@@ -282,8 +268,6 @@ static void __init prepare_lsm_enable(void)
 	parse_lsm_enable(chosen_lsm_disable, false);
 
 	/* Process "security=", if given. */
-	if (!chosen_major_lsm)
-		chosen_major_lsm = CONFIG_DEFAULT_SECURITY;
 	if (chosen_major_lsm) {
 		struct lsm_info *lsm;
 
@@ -326,11 +310,6 @@ int __init security_init(void)
 	prepare_lsm_order();
 	ordered_lsm_init();
 
-	/*
-	 * Load all the remaining security modules.
-	 */
-	major_lsm_init();
-
 	kfree(ordered_lsms);
 	return 0;
 }
-- 
2.17.1


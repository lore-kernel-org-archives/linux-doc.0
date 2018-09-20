Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C01B7D584
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387951AbeITWOA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:14:00 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38278 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732580AbeITWN7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:13:59 -0400
Received: by mail-pf1-f194.google.com with SMTP id x17-v6so4621827pfh.5
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YyF6kpLEfrFex/HC+oKIW2jqtybLXS1AfKX+lo13bNY=;
        b=nsCfeKZpoq3Pp89tq13radVGs1vX9l3ELOuaw1bzKyIBqGLeeu9rlODZS//Zc4IVdC
         bU61PK6NbuK4AtAyOhQRGtQG9Xav3iPEd6etVwfDqkuyp/C6yDJQyKwExus3KkQLOxA9
         8xB/gkGF2VEDNczWK8YkSp5Wq1h0wF8CxtitQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YyF6kpLEfrFex/HC+oKIW2jqtybLXS1AfKX+lo13bNY=;
        b=aUg36/l/YkW4gB4y7YZhdmTsQURDsTQohDhrjhCJgsuNbIYUUh6zr+O4Hp3yB9QP+s
         xnY79/vHYWSnTLM2id5Lty6B0NAsbjK/XyROPZmGdz2bq9ZidW58UxRZZKNYFTqryyoB
         Jv65FhDQf7rvsbVcx1RmmNl3ktkG17WShj15zdmGNIALi4AsIpZw/tUVtOZ19Hq8fWr8
         eedcABQJK3KWG8vnFpRD2xc/4izadBHpkLWhLkpNtmg+X571QVtw6YPiyL4AV2hQAJrF
         Maj5To/2BaraBVXzvABEg4amZ3VdNdY7E+po9HeGjuXXoCpkJEXU00LrceVbtI2dfPDj
         ERCQ==
X-Gm-Message-State: APzg51BtUaR6dmfEwPZ3NdXTmgIlG8GRX6miZhJNtnbvaaZC7Uv157bs
        xY5f5Q8TzzAXFkEwYeBPNAIOmg==
X-Google-Smtp-Source: ANB0VdYU7iVU9M/J4njOyrm31WTT/cS8ghctZrY/AlqI+WRVqWW+wKEzcVrjYsUSlOyq1Y8dGHUsgQ==
X-Received: by 2002:a62:6cc6:: with SMTP id h189-v6mr4344417pfc.23.1537460981986;
        Thu, 20 Sep 2018 09:29:41 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id 1-v6sm41990073pfk.134.2018.09.20.09.29.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Sep 2018 09:29:39 -0700 (PDT)
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
Subject: [PATCH security-next v2 26/26] LSM: Add all exclusive LSMs to ordered initialization
Date:   Thu, 20 Sep 2018 09:23:38 -0700
Message-Id: <20180920162338.21060-27-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This removes CONFIG_DEFAULT_SECURITY in favor of the explicit build-time
ordering offered by CONFIG_LSM_ORDER, and adds all the exclusive LSMs
to the ordered LSM initialization.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/Kconfig    | 39 +--------------------------------------
 security/security.c | 23 +----------------------
 2 files changed, 2 insertions(+), 60 deletions(-)

diff --git a/security/Kconfig b/security/Kconfig
index 33c9ac3cb759..a2e365420919 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -239,46 +239,9 @@ source security/yama/Kconfig
 
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
 config LSM_ORDER
 	string "Default initialization order of builtin LSMs"
-	default "yama,loadpin,integrity"
+	default "yama,loadpin,integrity,selinux,smack,tomoyo,apparmor"
 	help
 	  A comma-separated list of LSMs, in initialization order.
 	  Any LSMs left off this list will be link-order initialized
diff --git a/security/security.c b/security/security.c
index f076fdc6b451..628e62fda5fe 100644
--- a/security/security.c
+++ b/security/security.c
@@ -130,7 +130,6 @@ static void __init parse_lsm_order(const char *order, const char *origin)
 
 		for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
 			if (lsm->order == LSM_ORDER_MUTABLE &&
-			    (lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0 &&
 			    strcmp(lsm->name, name) == 0) {
 				append_ordered_lsm(lsm, origin);
 				found = true;
@@ -163,8 +162,7 @@ static void __init prepare_lsm_order(void)
 
 	/* Add any missing LSMs, in link order. */
 	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-		if (lsm->order == LSM_ORDER_MUTABLE &&
-		    (lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
+		if (lsm->order == LSM_ORDER_MUTABLE)
 			append_ordered_lsm(lsm, "link-time");
 	}
 
@@ -222,18 +220,6 @@ static void __init ordered_lsm_init(void)
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
 /**
  * security_init - initializes the security framework
  *
@@ -253,8 +239,6 @@ int __init security_init(void)
 				GFP_KERNEL);
 
 	/* Process "security=", if given. */
-	if (!chosen_major_lsm)
-		chosen_major_lsm = CONFIG_DEFAULT_SECURITY;
 	if (chosen_major_lsm) {
 		struct lsm_info *lsm;
 
@@ -275,11 +259,6 @@ int __init security_init(void)
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


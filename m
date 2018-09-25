Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 617537D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbeIYGaH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:30:07 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43561 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbeIYGaG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:30:06 -0400
Received: by mail-pf1-f196.google.com with SMTP id j26-v6so9917426pfi.10
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rFbalDbpQVU7OjIRnEIJaOE4IoeEsoACg+mJq3logWg=;
        b=Rb1e51WfosNEyxho7niYo0jwgJozShnawgN0RvO94pmSSasn3ejlf9zF4xjlXWH+MO
         vAB+tb8PWXeSsckb73K6klVcoIg12gBRKyhNcH9TtfXRerFF28YW66ZYCE5/uOaeVB+R
         UqiWF71G8MavAmfFWHbsH00ci8WC5tgkle7yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rFbalDbpQVU7OjIRnEIJaOE4IoeEsoACg+mJq3logWg=;
        b=M9svoXScJIFD99SbDoCWxGYsmDVhVk0KdgauQwmrFn2BL9N4JIFyzkwpyEQQf6Ar2R
         5hNSyVvMP8CMtbDYita0MnS2pO5du7uhDoCjxu4BDSoH0JiHRl0mAeGfMw9G8U0Beyie
         tfF7AdH9K9YnhtKcbZVtAMxzC79Z2jxG8WlmNJGco8ppFKUhjbkDJLUfxuekqDIbDqhw
         sR2UO30V4Pxat+Ahru9C5zOllKc+zm4M8aJr75AszzxNAPqMC+jHFSrX11Xncy3EIGGO
         8FG9PhDMF1Z6a84QLHR0i/YdD833g+0Gp62pKgrEtXe/1TszNUBvf/NDz7lRbkADMx5O
         T1Bg==
X-Gm-Message-State: ABuFfogcVx9AoPyga0UGawDqwesEkvpd/wKeE2FPYcFQ5jK0q+Mx3kEq
        XXJEt+edF7iCtAKFNB69/Qo4rA==
X-Google-Smtp-Source: ACcGV60ICBAe/yeo6RFqvOeHMxrBoCezDuR3lZYuExK++14x98wfiinzSx1BGg33GwSYslDVoPhbmg==
X-Received: by 2002:a63:68c7:: with SMTP id d190-v6mr915939pgc.135.1537835118165;
        Mon, 24 Sep 2018 17:25:18 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id 3-v6sm683001pfq.10.2018.09.24.17.25.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Sep 2018 17:25:16 -0700 (PDT)
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
Subject: [PATCH security-next v3 17/29] LSM: Introduce CONFIG_LSM_ENABLE
Date:   Mon, 24 Sep 2018 17:18:20 -0700
Message-Id: <20180925001832.18322-18-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To provide a set of default-enabled LSMs at boot, this introduces the
new CONFIG_LSM_ENABLE. A value of "all" means all builtin LSMs are
enabled by default. Any unlisted LSMs will be implicitly disabled
(excepting those with LSM-specific CONFIGs for enabling/disabling).

The behavior of the LSM-specific CONFIGs for SELinux are AppArmor
unchanged: the default-enabled state for those LSMs remains controlled
through their LSM-specific "enable" CONFIGs.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/lsm_hooks.h | 2 +-
 security/Kconfig          | 8 ++++++++
 security/security.c       | 4 +++-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 95798f212dbf..ab23f1bc6d77 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2044,7 +2044,7 @@ extern void security_add_hooks(struct security_hook_list *hooks, int count,
 struct lsm_info {
 	const char *name;	/* Populated automatically. */
 	unsigned long flags;	/* Optional: flags describing LSM */
-	int *enabled;		/* Optional: NULL means enabled. */
+	int *enabled;		/* Optional: NULL checks CONFIG_LSM_ENABLE */
 	int (*init)(void);
 };
 
diff --git a/security/Kconfig b/security/Kconfig
index 27d8b2688f75..71306b046270 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -276,5 +276,13 @@ config DEFAULT_SECURITY
 	default "apparmor" if DEFAULT_SECURITY_APPARMOR
 	default "" if DEFAULT_SECURITY_DAC
 
+config LSM_ENABLE
+	string "LSMs to enable at boot time"
+	default "all"
+	help
+	  A comma-separate list of LSMs to enable by default at boot. The
+	  default is "all", to enable all LSM modules at boot. Any LSMs
+	  not listed here will be disabled by default.
+
 endmenu
 
diff --git a/security/security.c b/security/security.c
index a8107d54b3d3..7ecb9879a863 100644
--- a/security/security.c
+++ b/security/security.c
@@ -45,6 +45,8 @@ char *lsm_names;
 static __initdata char chosen_lsm[SECURITY_NAME_MAX + 1] =
 	CONFIG_DEFAULT_SECURITY;
 
+static __initconst const char * const builtin_lsm_enable = CONFIG_LSM_ENABLE;
+
 static bool debug __initdata;
 #define init_debug(...)						\
 	do {							\
@@ -182,7 +184,7 @@ static void __init parse_lsm_enable(const char *str,
 static void __init prepare_lsm_enable(void)
 {
 	/* Prepare defaults. */
-	parse_lsm_enable("all", default_enabled, true);
+	parse_lsm_enable(builtin_lsm_enable, default_enabled, true);
 }
 
 /**
-- 
2.17.1


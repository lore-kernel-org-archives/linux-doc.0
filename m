Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 106427D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 01:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbeJBHo7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:44:59 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:37376 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbeJBHo6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:44:58 -0400
Received: by mail-it1-f193.google.com with SMTP id m9-v6so1116179ita.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 18:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0RYipdsIhsetP9y77Y83cY+AYnVXjoUOFr0d0L1Gup4=;
        b=WEfbzd0L4U24y99D5LFveDvCDTC2jDhleO7GYaIn21f52QkqSxmL7zow5OZDB6DGLy
         UcgA6UvB3ar3il1u9qh29ybZoPMhAWAhAtczzIcPWb19JAa5U/3mpQrhCKsLUPbIQZGJ
         2YQahoVdMA460SQ0PtPTgn/N1srQmFlB322ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0RYipdsIhsetP9y77Y83cY+AYnVXjoUOFr0d0L1Gup4=;
        b=WHWJkbLRmIivdaW9Ydqvto//4W1LWW2Gyw7ZP//K6H2b1K+aBou9gAcQYO9gWdtR5m
         ScDuA2YbKj6Fj/UHc6x6xcQIzDmp603/2wZydHZu/Jh/CxNr5Ad6u5IZ5C/rFC+GwAPn
         M7wLZ2PkoXkTJr1Rc3j6SR7Bu/iqM9ywwIH2Lz6HqNwt5MmsykF7nTJ+GKPDtU399XfZ
         8FN4wN+XBUu4oT3nGHWqgPsZWbHNXlaGwB40bgn43ArIYoNAaNnkyIp7YccQ1x4wnK8F
         L73Ja5dJHQ0s15iEBc0Z8uBGKosum79Hwp0SK/N+jtTIHSCARGLFaA3vcAkSoWrNyUHu
         Yr4w==
X-Gm-Message-State: ABuFfohyt36EKiTGC+G95wC4GpWFq5U/eaGd8I5qhHKx/6pZUiJpOD+5
        q6werNGbfMm0jNrOvu3sFZ/rcg==
X-Google-Smtp-Source: ACcGV60efYAt7b30NyxgEaD1regdxKPx79Oq12am8usQIO4dJRW8ygNRFu5Dhr1PSd0MwqicM9r/SQ==
X-Received: by 2002:a63:6ec4:: with SMTP id j187-v6mr12395919pgc.3.1538442265802;
        Mon, 01 Oct 2018 18:04:25 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id c2-v6sm19748936pfo.107.2018.10.01.18.04.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Oct 2018 18:04:24 -0700 (PDT)
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
Subject: [PATCH security-next v4 18/32] LSM: Introduce lsm.enable= and lsm.disable=
Date:   Mon,  1 Oct 2018 17:54:51 -0700
Message-Id: <20181002005505.6112-19-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This introduces the "lsm.enable=..." and "lsm.disable=..." boot parameters
which each can contain a comma-separated list of LSMs to enable or
disable, respectively. The string "all" matches all LSMs.

This has very similar functionality to the existing per-LSM enable
handling ("apparmor.enabled=...", etc), but provides a centralized
place to perform the changes. These parameters take precedent over any
LSM-specific boot parameters.

Disabling an LSM means it will not be considered when performing
initializations. Enabling an LSM means either undoing a previous
LSM-specific boot parameter disabling or a undoing a default-disabled
CONFIG setting.

For example: "lsm.disable=apparmor apparmor.enabled=1" will result in
AppArmor being disabled. "selinux.enabled=0 lsm.enable=selinux" will
result in SELinux being enabled.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
---
 .../admin-guide/kernel-parameters.txt         | 12 ++++++++++
 security/Kconfig                              |  4 +++-
 security/security.c                           | 22 +++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 32d323ee9218..67c90985d2b8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2276,6 +2276,18 @@
 
 	lsm.debug	[SECURITY] Enable LSM initialization debugging output.
 
+	lsm.disable=lsm1,...,lsmN
+			[SECURITY] Comma-separated list of LSMs to disable
+			at boot time. This overrides "lsm.enable=",
+			CONFIG_LSM_ENABLE, and any per-LSM CONFIGs and boot
+			parameters.
+
+	lsm.enable=lsm1,...,lsmN
+			[SECURITY] Comma-separated list of LSMs to enable
+			at boot time. This overrides any omissions from
+			CONFIG_LSM_ENABLE, and any per-LSM CONFIGs and
+			boot parameters.
+
 	machvec=	[IA-64] Force the use of a particular machine-vector
 			(machvec) in a generic kernel.
 			Example: machvec=hpzx1_swiotlb
diff --git a/security/Kconfig b/security/Kconfig
index ac23feba584d..1e57619fd561 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -282,7 +282,9 @@ config LSM_ENABLE
 	help
 	  A comma-separated list of LSMs to enable by default at boot. The
 	  default is "all", to enable all LSM modules at boot. Any LSMs
-	  not listed here will be disabled by default.
+	  not listed here will be disabled by default. This can be
+	  changed with the "lsm.enable=" and "lsm.disable=" boot
+	  parameters.
 
 endmenu
 
diff --git a/security/security.c b/security/security.c
index 35601000176b..3fff2d1d1ec4 100644
--- a/security/security.c
+++ b/security/security.c
@@ -44,6 +44,8 @@ char *lsm_names;
 /* Boot-time LSM user choice */
 static __initdata char chosen_lsm[SECURITY_NAME_MAX + 1] =
 	CONFIG_DEFAULT_SECURITY;
+static __initdata const char *chosen_lsm_enable;
+static __initdata const char *chosen_lsm_disable;
 
 static __initconst const char * const builtin_lsm_enable = CONFIG_LSM_ENABLE;
 
@@ -185,6 +187,10 @@ static void __init prepare_lsm_enable(void)
 {
 	/* Prepare defaults. */
 	parse_lsm_enable(builtin_lsm_enable, default_enabled, true);
+
+	/* Process "lsm.enable=" and "lsm.disable=", if given. */
+	parse_lsm_enable(chosen_lsm_enable, set_enabled, true);
+	parse_lsm_enable(chosen_lsm_disable, set_enabled, false);
 }
 
 /**
@@ -240,6 +246,22 @@ static int __init enable_debug(char *str)
 }
 __setup("lsm.debug", enable_debug);
 
+/* Explicitly enable a list of LSMs. */
+static int __init enable_lsm(char *str)
+{
+	chosen_lsm_enable = str;
+	return 1;
+}
+__setup("lsm.enable=", enable_lsm);
+
+/* Explicitly disable a list of LSMs. */
+static int __init disable_lsm(char *str)
+{
+	chosen_lsm_disable = str;
+	return 1;
+}
+__setup("lsm.disable=", disable_lsm);
+
 static bool match_last_lsm(const char *list, const char *lsm)
 {
 	const char *last;
-- 
2.17.1


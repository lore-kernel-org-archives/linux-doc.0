Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9ADC37E3FF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbeITWIN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:08:13 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36793 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387997AbeITWIM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:08:12 -0400
Received: by mail-pl1-f196.google.com with SMTP id p5-v6so4591160plk.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BeQr1Ga9Sqhtx/dPF+aE8dyd+vsJj9zy6kl28UiVeAk=;
        b=elzC9uC1o2GlCzazWMRmW2T/zPif2g6mcBiq1AAUZceUWdpId51CJVMf4iR72gRdBp
         DX/BibWfxSZ3QvHjxYqQATZs+zJvKRqk0kURi52o8AJ+7o9/aT3tyqvEnPehPNnm1HRR
         2ol7Ye++YfusTRcsUD18+j+QH/jYBKgm/Dirg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BeQr1Ga9Sqhtx/dPF+aE8dyd+vsJj9zy6kl28UiVeAk=;
        b=lvZlwNI+q/CFJAHt5VeTfO+I/e3qJsfNDZTO9iWH0lzG/JbIanOLg0BILx7ctSS2Xe
         fPwbkgxMjQxt+Mnb3XF0cZc9QjT2qLuoYUwPQNNt0nPGXZv8ByxqMa3UNw6uFMa/oMJs
         icW7z7FxSMRTnTnIGJJISbu0JnvQ97JVlfvYEEFyzoswt/T3fpuJT6lfs/COesn1BieZ
         W70qhH1CfOp39pqbvkygPx3TxXfplln4U00lPC7okQkKlKGy0VKWYdidRfL4hQW3iCBM
         nZMl7IKgNcQrrSqv0E0JpZEJa8aMeJtk8ibIh9yv9ZHXfjzrgW4cAU5iTa5efPhM9kpr
         pxJw==
X-Gm-Message-State: APzg51B4oDDTuQ6wtqYlBTLTzWNOzyK3LOjnNWI58QJkJQZq0pisjwpz
        krWq8sPAsumjBoEOY7ejLtW9DQ==
X-Google-Smtp-Source: ANB0VdZIKRqCF7z+uK4jPaPynnK4mPQ/Q4Y27pQUjt2G6mLiv/ZVjYDMyWCbRqCD7RHjkQ+313TCuw==
X-Received: by 2002:a17:902:b28:: with SMTP id 37-v6mr40461495plq.337.1537460637592;
        Thu, 20 Sep 2018 09:23:57 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id h124-v6sm2689731pfg.112.2018.09.20.09.23.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Sep 2018 09:23:55 -0700 (PDT)
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
Subject: [PATCH security-next v2 13/26] LSM: Plumb visibility into optional "enabled" state
Date:   Thu, 20 Sep 2018 09:23:25 -0700
Message-Id: <20180920162338.21060-14-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In preparation for lifting the "is this LSM enabled?" logic out of the
individual LSMs, pass in any special enabled state tracking (as needed
for SELinux, AppArmor, and LoadPin). This must be an "int" to include
handling cases where "enabled" is exposed via sysctl which has no "bool"
type (i.e. LoadPin's use).

LoadPin's "enabled" tracking will be added later when it gets added to
the "ordered LSM" stack.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/lsm_hooks.h | 1 +
 security/apparmor/lsm.c   | 5 +++--
 security/selinux/hooks.c  | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 38cbefabff71..118e12f678df 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2044,6 +2044,7 @@ extern void security_add_hooks(struct security_hook_list *hooks, int count,
 struct lsm_info {
 	const char *name;	/* Populated automatically. */
 	unsigned long flags;	/* Optional: flags describing LSM */
+	int *enabled;		/* Optional: NULL means enabled. */
 	int (*init)(void);
 };
 
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 4c5f63e9aeba..d03133a267f2 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1303,8 +1303,8 @@ bool aa_g_paranoid_load = true;
 module_param_named(paranoid_load, aa_g_paranoid_load, aabool, S_IRUGO);
 
 /* Boot time disable flag */
-static bool apparmor_enabled = CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE;
-module_param_named(enabled, apparmor_enabled, bool, S_IRUGO);
+static int apparmor_enabled = CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE;
+module_param_named(enabled, apparmor_enabled, int, 0444);
 
 static int __init apparmor_enabled_setup(char *str)
 {
@@ -1608,5 +1608,6 @@ static int __init apparmor_init(void)
 
 DEFINE_LSM(apparmor)
 	.flags = LSM_FLAG_LEGACY_MAJOR,
+	.enabled = &apparmor_enabled,
 	.init = apparmor_init,
 END_LSM;
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 615cf6498c0f..3f999ed98cfd 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -7204,6 +7204,7 @@ void selinux_complete_init(void)
    all processes and objects when they are created. */
 DEFINE_LSM(selinux)
 	.flags = LSM_FLAG_LEGACY_MAJOR,
+	.enabled = &selinux_enabled,
 	.init = selinux_init,
 END_LSM;
 
-- 
2.17.1


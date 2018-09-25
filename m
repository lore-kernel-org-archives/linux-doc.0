Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CAECE7DE79
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbeIYGas (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:30:48 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41982 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbeIYGaG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:30:06 -0400
Received: by mail-pg1-f194.google.com with SMTP id z3-v6so5151283pgv.8
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dcnxUGdM4FO17eHYuUfeuK9JPR89ogJMNeQRUezwAjU=;
        b=AQGOY/Zdh0wpfhlnTaQch+gsKeEk2rOe2ektyYESqmESf62tM1EDmSsoYn5JLLhMdK
         9JTT3o7hxp+V3R+MkaEoprJW2RdJp6xsOqZiUW+kkUTc+7yXMlxIUNZ99LlmGuyRWG1I
         BZNXLBlfyMJjcLD/IL+KADS6U0NNut/sGwkw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dcnxUGdM4FO17eHYuUfeuK9JPR89ogJMNeQRUezwAjU=;
        b=FuiLc9G8PwK+ElsB9wI5cGWRIB5L5ELjCCLuMajlKcmTXzYFdGmyAHSU1jdID1NoNr
         kOlWtAfm4uZ9qyz1OM+/+SIfTjx/6C3EgyOQrueQolEo/opFlfLMqc3HfBASLzC3rgB2
         K4PokF2g3yZPAEruKqt9tmdYJ3f8eLA2AYFc3dKlAm+qr2YfU0srJLuWZGEGWAddbHmq
         1jr89bPPb5n/mHa+xBsBJ13hdFk4Qj+GIpoKm1jNKgPZKOa6iBP+JQXIv91rtJ/su0GN
         o3GRi2Pyz5i/CS+DncoGTtLiNhAV3wtG5k5pcpl/s7aAfpxEEssda1EdgNJ4m9uxIJA+
         onJw==
X-Gm-Message-State: ABuFfogRvrgQeqajd6fDYSk8G9D3EEbp3iNdUy+83JIJUH8KMVknk8xj
        +nPT2wStHN7F7odOID20FcOgTA==
X-Google-Smtp-Source: ACcGV61HtB92YOXRXmkR76dq/+KIjtfUVl08OEqnkPLog6Kn7C2bYotCF2Fw84bvv1/Jn61is2xzkQ==
X-Received: by 2002:a63:e918:: with SMTP id i24-v6mr992063pgh.64.1537835119019;
        Mon, 24 Sep 2018 17:25:19 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id g15-v6sm562058pfg.98.2018.09.24.17.25.15
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
Subject: [PATCH security-next v3 19/29] LSM: Prepare for reorganizing "security=" logic
Date:   Mon, 24 Sep 2018 17:18:22 -0700
Message-Id: <20180925001832.18322-20-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This moves the string handling for "security=" boot parameter into
a stored pointer instead of a string duplicate. This will allow
easier handling of the string when switching logic to use the coming
enable/disable infrastructure.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/security.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/security/security.c b/security/security.c
index 456a3f73bc36..e325fcc41f00 100644
--- a/security/security.c
+++ b/security/security.c
@@ -34,18 +34,14 @@
 
 #define MAX_LSM_EVM_XATTR	2
 
-/* Maximum number of letters for an LSM name string */
-#define SECURITY_NAME_MAX	10
-
 struct security_hook_heads security_hook_heads __lsm_ro_after_init;
 static ATOMIC_NOTIFIER_HEAD(lsm_notifier_chain);
 
 char *lsm_names;
 /* Boot-time LSM user choice */
-static __initdata char chosen_lsm[SECURITY_NAME_MAX + 1] =
-	CONFIG_DEFAULT_SECURITY;
 static __initdata const char *chosen_lsm_enable;
 static __initdata const char *chosen_lsm_disable;
+static __initdata const char *chosen_major_lsm;
 
 static __initconst const char * const builtin_lsm_enable = CONFIG_LSM_ENABLE;
 
@@ -112,7 +108,7 @@ static bool __init lsm_allowed(struct lsm_info *lsm)
 		return true;
 
 	/* Disabled if this LSM isn't the chosen one. */
-	if (strcmp(lsm->name, chosen_lsm) != 0)
+	if (strcmp(lsm->name, chosen_major_lsm) != 0)
 		return false;
 
 	return true;
@@ -191,6 +187,9 @@ static void __init prepare_lsm_enable(void)
 	/* Process "lsm.enable=" and "lsm.disable=", if given. */
 	parse_lsm_enable(chosen_lsm_enable, set_enabled, true);
 	parse_lsm_enable(chosen_lsm_disable, set_enabled, false);
+
+	if (!chosen_major_lsm)
+		chosen_major_lsm = CONFIG_DEFAULT_SECURITY;
 }
 
 /**
@@ -231,12 +230,12 @@ int __init security_init(void)
 }
 
 /* Save user chosen LSM */
-static int __init choose_lsm(char *str)
+static int __init choose_major_lsm(char *str)
 {
-	strncpy(chosen_lsm, str, SECURITY_NAME_MAX);
+	chosen_major_lsm = str;
 	return 1;
 }
-__setup("security=", choose_lsm);
+__setup("security=", choose_major_lsm);
 
 /* Enable LSM order debugging. */
 static int __init enable_debug(char *str)
-- 
2.17.1


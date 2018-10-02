Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A0D4B7D087
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 01:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbeJBHo7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:44:59 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:51266 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbeJBHo5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:44:57 -0400
Received: by mail-it1-f194.google.com with SMTP id 74-v6so1026563itw.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 18:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TJOVK3ymMMejAlxuU1TJP5KKpaIPAoNY/QahRvn63YY=;
        b=ZsdqSfIGNbNUhHM6zlEaEFFGv3nj9drdpPB8Mt1PGYPbL5KYZehXxoK0eHNYVMlgCj
         PRw+u2Za+yMrjJl3ijH/HKyhpg2I+2BE4hgpH37xW+/KtJmpxNFkHfjL9bUJsIBuULlU
         XXk7yIxOOtA/BOYUntvSB7WzxvAXl/UwE9l08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TJOVK3ymMMejAlxuU1TJP5KKpaIPAoNY/QahRvn63YY=;
        b=E/F97JvzhGBaU7OG2QZqwjhS3KZGXzS3Swx+AGiqPFBxX6iRPoyP5uvbAfJUzqzbY8
         +taSGV/v850Fl0XCPXipzT+HXi0lk3Mqo66Gyutd2JLCVwFNyEFwLW4AfsPZozGm/W4T
         uicwnlPS87PKtsKxc/VQzVIaJiCRaWmykbq6h+I8nh9jKx395JNppqDMoqx4cHV/ENZO
         mI06ZNrr4EIlP/vQtJK0meknknq/yQ7Oa7IDF5cYhpQmYiosvbBtvrmPqShGBcpKQ4QV
         pfA+Dh7t1xrX/1M0WraJIFU67wjPNVwJP1xovU9djl1R2tX/A6BnSV04NwCI29c7JIac
         ju6Q==
X-Gm-Message-State: ABuFfoj3qptkqCndQ2adk4piIIDiKw30dAnyTTY7Oc18pUhbzoJGimYB
        DsQhThCQASPTIaRXfH8QM8ziYQ==
X-Google-Smtp-Source: ACcGV63wWN6vR8b5T4rL69Rt1lzONxTKJR/V7oSgbKmWlib7Vgd4hI6QxRLbvZiBWyuQkP+JNnx3bg==
X-Received: by 2002:a63:6ce:: with SMTP id 197-v6mr12170408pgg.338.1538442266621;
        Mon, 01 Oct 2018 18:04:26 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id a79-v6sm22262669pfa.124.2018.10.01.18.04.23
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
Subject: [PATCH security-next v4 19/32] LSM: Prepare for reorganizing "security=" logic
Date:   Mon,  1 Oct 2018 17:54:52 -0700
Message-Id: <20181002005505.6112-20-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This moves the string handling for "security=" boot parameter into
a stored pointer instead of a string duplicate. This will allow
easier handling of the string when switching logic to use the coming
enable/disable infrastructure.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
---
 security/security.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/security/security.c b/security/security.c
index 3fff2d1d1ec4..455ba2767965 100644
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


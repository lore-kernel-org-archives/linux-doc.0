Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E4E7A7E425
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbeITWI1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:08:27 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34152 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732037AbeITWIQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:08:16 -0400
Received: by mail-pg1-f195.google.com with SMTP id d19-v6so4687492pgv.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iBGZ2JAq52GVO7DMel4vdKBb6P5PB4Nfw1MCI4/fUVo=;
        b=Y+GIwIYy1i7nEwQqJoICogiY+6igMki3L7ZSogo14PNlABRQEWW34ENWdENkTFLofS
         VhQA+q4UDjAGnttTPca83jRHMhW/Gu5ldBqLc+69eTE+JfGKI1AG2zUBJ54LLLFP/a3c
         h05HMkTWAnnhgCgfOpjEbBN/gOjdl7ZB/G+Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iBGZ2JAq52GVO7DMel4vdKBb6P5PB4Nfw1MCI4/fUVo=;
        b=E+Lkl65x/D4r6BmACS4a810cUVSlb7CJH3UtHUohqlPSuLr7bbt6E7m4ii0CGGp84G
         0HQSkb2ie0NriMCXrAwyy2JzUxV51RI94Th5MQbomlqHgml6hIlh5uFYT4kqDnyJMc2e
         3X2EDWgwoPQkrwm6I+zWMRWJVQnPaBV8aQ2gGSgitPMagoUS7bRzxTqRkB2oNkEuefta
         T0xvjmRPQRurBBRMfS5s54OJtE0LVT9ydS8MvFLBHp9JFcXVnWW0h6O34lQoLIcY1xZF
         qXsZjo+Hi9laM9FgtsN4bi1cHr0uV2iHvbt26mSWIXvCDD5KFXiixMalGsDev/UQzDil
         45IQ==
X-Gm-Message-State: APzg51Csp5j2jWSvCcrI9Pv+WmpS1HTMQ7/ZDgja6cBGmzSlwQPzTh+v
        +0OsNcrfT8tVhO/o8bJBt5yA0w==
X-Google-Smtp-Source: ANB0VdZvPEYthdJSOrAqvxPARMZrpWIfjJvEAEpojcDbp8zFuDwP3KnBJnX8gt0DwiFHtCoAvxq55A==
X-Received: by 2002:a65:5a81:: with SMTP id c1-v6mr37761175pgt.120.1537460640540;
        Thu, 20 Sep 2018 09:24:00 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id v186-v6sm30118436pgd.25.2018.09.20.09.23.51
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
Subject: [PATCH security-next v2 19/26] LSM: Introduce CONFIG_LSM_ORDER
Date:   Thu, 20 Sep 2018 09:23:31 -0700
Message-Id: <20180920162338.21060-20-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This provides a way to declare LSM initialization order via Kconfig.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/Kconfig    | 11 +++++++++++
 security/security.c | 38 +++++++++++++++++++++++++++++++++++---
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/security/Kconfig b/security/Kconfig
index 27d8b2688f75..de8202886c1d 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -276,5 +276,16 @@ config DEFAULT_SECURITY
 	default "apparmor" if DEFAULT_SECURITY_APPARMOR
 	default "" if DEFAULT_SECURITY_DAC
 
+config LSM_ORDER
+	string "Default initialization order of builtin LSMs"
+	default "integrity"
+	help
+	  A comma-separated list of LSMs, in initialization order.
+	  Any LSMs left off this list will be link-order initialized
+	  after any listed LSMs. Any LSMs listed here but not built in
+	  the kernel will be ignored.
+
+	  If unsure, leave this as the default.
+
 endmenu
 
diff --git a/security/security.c b/security/security.c
index 2541a512a0f7..063ee2466e58 100644
--- a/security/security.c
+++ b/security/security.c
@@ -44,6 +44,8 @@ char *lsm_names;
 /* Boot-time LSM user choice */
 static __initdata const char *chosen_major_lsm;
 
+static __initconst const char * const builtin_lsm_order = CONFIG_LSM_ORDER;
+
 /* Ordered list of LSMs to initialize. */
 static __initdata struct lsm_info **ordered_lsms;
 
@@ -108,14 +110,44 @@ static void __init append_ordered_lsm(struct lsm_info *lsm, const char *from)
 		   (!lsm->enabled || *lsm->enabled) ? "en" : "dis");
 }
 
-/* Populate ordered LSMs list from hard-coded list of LSMs. */
+/* Populate ordered LSMs list from given string. */
+static void __init parse_lsm_order(const char *order, const char *origin)
+{
+	struct lsm_info *lsm;
+	char *sep, *name, *next;
+
+	sep = kstrdup(order, GFP_KERNEL);
+	next = sep;
+	/* Walk the list, looking for matching LSMs. */
+	while ((name = strsep(&next, ",")) != NULL) {
+		bool found = false;
+
+		for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+			if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0 &&
+			    strcmp(lsm->name, name) == 0) {
+				append_ordered_lsm(lsm, origin);
+				found = true;
+			}
+		}
+
+		if (!found)
+			init_debug("%s ignored: %s\n", origin, name);
+	}
+	kfree(sep);
+}
+
+/* Populate ordered LSMs list from builtin list of LSMs. */
 static void __init prepare_lsm_order(void)
 {
 	struct lsm_info *lsm;
 
+	/* Parse order from builtin list. */
+	parse_lsm_order(builtin_lsm_order, "builtin");
+
+	/* Add any missing LSMs, in link order. */
 	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-		if (strcmp(lsm->name, "integrity") == 0)
-			append_ordered_lsm(lsm, "builtin");
+		if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
+			append_ordered_lsm(lsm, "link-time");
 	}
 }
 
-- 
2.17.1


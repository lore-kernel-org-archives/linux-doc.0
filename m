Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7CF067E3AC
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:33:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733046AbeITWO1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:14:27 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40771 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387830AbeITWN6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:13:58 -0400
Received: by mail-pg1-f194.google.com with SMTP id l63-v6so4675280pga.7
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=41JHmeDth85/sNORiIQtTjoZxJboPyIhG2VUHSXPrw4=;
        b=TFR75zUMSBYV6OzQ8u3KsAh7xal3TluRRyzCQLFAJSMAKoYAAV3M6kgk/YYUMghamW
         akAKBaq8KzANA9fQtvmAbpse10jx1isEpkGT0gSYCv4f8sdW1dStxj9Prkz2OQj7Gzo7
         g1Vh/SqzTjgvW9OmOiMOTGaeec56bLp2wKXwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=41JHmeDth85/sNORiIQtTjoZxJboPyIhG2VUHSXPrw4=;
        b=fDuQSywVBzGlU31sGf7+ohEpUq5SlFeLKJ2fT4UjjrO2NLwMunpG1MCeGj43cRztyc
         cygmSTJ+2YsvwNeyXJRaofr90Gj6Avf0EEsDQKPuN1kCKdoVmtrJRmf9vo6riEwbZIfK
         anjTfQZhdBKden6Cc7JwUb7gw5x/VjkvJT2bNoRMvm5yj8+w3IWtTXymiAt7yCT9V8aD
         C7V7pFttXFzCZSt03QXNaNjNLylVPO2UNgzs7CJOHZKXqXO0Ykjcvdg2g+rNfjyuWJYN
         E44Il7+aJlBHfIZk6iVT2pKNi/MmShvM/PAOxrUcfjSO9dKMPyjoYdH0vL3ydQR2sXy6
         QrRA==
X-Gm-Message-State: APzg51DWjcfOhElNYv+E8fO0kvXa19IMGzvjlrWeAA8ks7kIfDahIa3P
        RNV0w3zvyK5som1kj2ewMWj1hg==
X-Google-Smtp-Source: ANB0VdYGQequYNqg7c2EkZwIpIiquIJI+a/sd93UBEOLXGlgfGTjqtmeUJc52hzjUAAqriiQ6CoSBQ==
X-Received: by 2002:a63:70e:: with SMTP id 14-v6mr2838215pgh.70.1537460981100;
        Thu, 20 Sep 2018 09:29:41 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id h69-v6sm58906828pfh.13.2018.09.20.09.29.36
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
Subject: [PATCH security-next v2 17/26] LSM: Refactor "security=" in terms of enable/disable
Date:   Thu, 20 Sep 2018 09:23:29 -0700
Message-Id: <20180920162338.21060-18-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For what are marked as the Legacy Major LSMs, make them effectively
exclusive when selected on the "security=" boot parameter, to handle
the future case of when a previously major LSMs become non-exclusive
(e.g. when TOMOYO starts blob-sharing).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/security.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/security/security.c b/security/security.c
index 5cacbcefbc32..25a019cc4a2b 100644
--- a/security/security.c
+++ b/security/security.c
@@ -81,14 +81,6 @@ static bool __init lsm_allowed(struct lsm_info *lsm)
 	if (lsm->enabled && !*lsm->enabled)
 		return false;
 
-	/* Skip major-specific checks if not a major LSM. */
-	if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
-		return true;
-
-	/* Disabled if this LSM isn't the chosen one. */
-	if (strcmp(lsm->name, chosen_major_lsm) != 0)
-		return false;
-
 	return true;
 }
 
@@ -150,8 +142,24 @@ int __init security_init(void)
 	     i++)
 		INIT_HLIST_HEAD(&list[i]);
 
+	/* Process "security=", if given. */
 	if (!chosen_major_lsm)
 		chosen_major_lsm = CONFIG_DEFAULT_SECURITY;
+	if (chosen_major_lsm) {
+		struct lsm_info *lsm;
+
+		/*
+		 * To match the original "security=" behavior, this
+		 * explicitly does NOT fallback to another Legacy Major
+		 * if the selected one was separately disabled: disable
+		 * all non-matching Legacy Major LSMs.
+		 */
+		for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+			if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) &&
+			    strcmp(lsm->name, chosen_major_lsm) != 0)
+				set_enabled(lsm, false);
+		}
+	}
 
 	/*
 	 * Load minor LSMs, with the capability module always first.
-- 
2.17.1


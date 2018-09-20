Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9262D7DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:33:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387647AbeITWN5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:13:57 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45992 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732564AbeITWNz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:13:55 -0400
Received: by mail-pg1-f193.google.com with SMTP id w9-v6so1480794pgc.12
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OMVxv/mM/FRrUnvXJYDNolN8Wngtjq4Uk/5dWWv+svs=;
        b=QJjoUbzD9oq0tyVU10SP6ZNpYGIF4w0Q6U6p3REGjcOex7DaqVGoDrvR8SwFKFkDac
         mosFjX9J0FmHG4lr4C9jOkgzWlTjFYkLld1LPNW/rTqFtIsmxfhS7LNwBqdA3BdivXML
         152Dguuq4gYyb7POSkGfLehxp0ryOPeTyqYbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OMVxv/mM/FRrUnvXJYDNolN8Wngtjq4Uk/5dWWv+svs=;
        b=Tmvwnb5zT5lgtP+GwA83PkzYVJG4WETmTlKoK4EAFp6UE64dmiQr5gKqyWeHV0Z8ep
         t13bKqNUqkB6SJm7ZYEp7dTUz8t2SHNv1s6ufNXLF2Gt9OA9sGr8M6cMkwyBaqIg/543
         7aelnIxRYEGDc5a6bKe4XrOUmlDtUv7kCc5rQSAvoVVPjhf844JSJdeyeT4Bi2c9LfIy
         r+QoxCTv6JhDSSAda+nRZGQNFH6LnaozfurDVxgTrmq97doUEhFnlMjW3tjCGkAkLwKv
         r0gnr4mXaTOUN8+GfUM0qdp3OzM1LRmCcsarWAKEPrnzJfOme3xxbrYAQZ51epIRA6pg
         C86g==
X-Gm-Message-State: APzg51CQhcLwfWelun1wHu1AjkJAJkmoiN2gwq+OV2hgxzJD0kWnJAKI
        tgTKpR+xIS++PjnCwPdSrr3lsA==
X-Google-Smtp-Source: ANB0VdbBmfcyhsWW+AiGrOHR7fzlwnYIjDFCLIHPq3WhkZ4PpJaDKGn7QWCBLiIw8jUxj/JK01GDgA==
X-Received: by 2002:a63:ed4f:: with SMTP id m15-v6mr35229465pgk.147.1537460978098;
        Thu, 20 Sep 2018 09:29:38 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id s195-v6sm53078190pgs.76.2018.09.20.09.29.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Sep 2018 09:29:34 -0700 (PDT)
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
Subject: [PATCH security-next v2 18/26] LSM: Build ordered list of ordered LSMs for init
Date:   Thu, 20 Sep 2018 09:23:30 -0700
Message-Id: <20180920162338.21060-19-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This constructs a list of ordered LSMs to initialize, using a hard-coded
list of only "integrity": minor LSMs continue to have direct hook calls,
and major LSMs continue to initialize separately.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/security.c | 59 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/security/security.c b/security/security.c
index 25a019cc4a2b..2541a512a0f7 100644
--- a/security/security.c
+++ b/security/security.c
@@ -34,6 +34,9 @@
 
 #define MAX_LSM_EVM_XATTR	2
 
+/* How many LSMs were built into the kernel? */
+#define LSM_COUNT (__end_lsm_info - __start_lsm_info)
+
 struct security_hook_heads security_hook_heads __lsm_ro_after_init;
 static ATOMIC_NOTIFIER_HEAD(lsm_notifier_chain);
 
@@ -41,6 +44,9 @@ char *lsm_names;
 /* Boot-time LSM user choice */
 static __initdata const char *chosen_major_lsm;
 
+/* Ordered list of LSMs to initialize. */
+static __initdata struct lsm_info **ordered_lsms;
+
 static bool debug __initdata;
 #define init_debug(...)						\
 	do {							\
@@ -74,6 +80,45 @@ static void __init set_enabled(struct lsm_info *lsm, bool enabled)
 	}
 }
 
+/* Is an LSM already listed in the ordered LSMs list? */
+static bool __init exists_ordered_lsm(struct lsm_info *lsm)
+{
+	struct lsm_info **check;
+
+	for (check = ordered_lsms; *check; check++)
+		if (*check == lsm)
+			return true;
+
+	return false;
+}
+
+/* Append an LSM to the list of ordered LSMs to initialize. */
+static int last_lsm __initdata;
+static void __init append_ordered_lsm(struct lsm_info *lsm, const char *from)
+{
+	/* Ignore duplicate selections. */
+	if (exists_ordered_lsm(lsm))
+		return;
+
+	if (WARN(last_lsm == LSM_COUNT, "%s: out of LSM slots!?\n", from))
+		return;
+
+	ordered_lsms[last_lsm++] = lsm;
+	init_debug("%s ordering: %s (%sabled)\n", from, lsm->name,
+		   (!lsm->enabled || *lsm->enabled) ? "en" : "dis");
+}
+
+/* Populate ordered LSMs list from hard-coded list of LSMs. */
+static void __init prepare_lsm_order(void)
+{
+	struct lsm_info *lsm;
+
+	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+		if (strcmp(lsm->name, "integrity") == 0)
+			append_ordered_lsm(lsm, "builtin");
+	}
+}
+
 /* Is an LSM allowed to be enabled? */
 static bool __init lsm_allowed(struct lsm_info *lsm)
 {
@@ -104,14 +149,10 @@ static void __init maybe_initialize_lsm(struct lsm_info *lsm)
 
 static void __init ordered_lsm_init(void)
 {
-	struct lsm_info *lsm;
-
-	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-		if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) != 0)
-			continue;
+	struct lsm_info **lsm;
 
-		maybe_initialize_lsm(lsm);
-	}
+	for (lsm = ordered_lsms; *lsm; lsm++)
+		maybe_initialize_lsm(*lsm);
 }
 
 static void __init major_lsm_init(void)
@@ -141,6 +182,8 @@ int __init security_init(void)
 	for (i = 0; i < sizeof(security_hook_heads) / sizeof(struct hlist_head);
 	     i++)
 		INIT_HLIST_HEAD(&list[i]);
+	ordered_lsms = kcalloc(LSM_COUNT + 1, sizeof(*ordered_lsms),
+				GFP_KERNEL);
 
 	/* Process "security=", if given. */
 	if (!chosen_major_lsm)
@@ -169,6 +212,7 @@ int __init security_init(void)
 	loadpin_add_hooks();
 
 	/* Load LSMs in specified order. */
+	prepare_lsm_order();
 	ordered_lsm_init();
 
 	/*
@@ -176,6 +220,7 @@ int __init security_init(void)
 	 */
 	major_lsm_init();
 
+	kfree(ordered_lsms);
 	return 0;
 }
 
-- 
2.17.1


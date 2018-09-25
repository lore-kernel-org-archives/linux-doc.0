Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EDFE07E3A9
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:19:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbeIYGXp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:23:45 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37337 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbeIYGXo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:23:44 -0400
Received: by mail-pf1-f193.google.com with SMTP id c14-v6so114378pfi.4
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FSgldt3bPHeF5iFdvu16EuWQiqi5PthEyk829crGPAE=;
        b=Qm3PiI0i/KOlH8XTHdlAltE6Dume1a//MCmxmyktr55LnxqVFXPvoHg1vr7LDR1vAC
         rignWwTdniVYmTUOOqgUsC5EKEKq62QzBD4ADvRDK2nj54evH8LeFHNrm8wZ4Kb1K/iT
         d2JPmCit2ACMlPeIAIXmDigtIfhdqkGFfPBnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FSgldt3bPHeF5iFdvu16EuWQiqi5PthEyk829crGPAE=;
        b=n15X2Rjclur/55+N/9QTw91Q4IbRbTPqpforZzVkUu0ldt0EJU8+C4RUEcRTyNGGbV
         gTGXIjPzSp5ad++af1SJwNyDOHBy4TChzrC1rJCeUZjDSQD+YGmdX05z2Cl6Dv1q7pnA
         iO0xIPdaDZeMQNZl/p5SQLCpR5ADm5NEQVt3WFR8IwXMSqClyy4Iip5Fq5T0kKoUWb63
         roZmD+Pug2gNG3sDFAY+OaflQYo9S8wnhZ62E3GSKqdFLctezMWZ8kuK2uA+fER/Lyvy
         xWObKRbZV59FF2XgE5hKa29C5bIFrvifM+205hEhEHxNl59qNzihd7YPzP/NxRTdNLu3
         TrQQ==
X-Gm-Message-State: ABuFfoiZGGuyS48UErKMGYpym/2tWKPl5HRLM1zp3IY2Mdwd3TMhB8y7
        4d3Xpv0UX/V85DOkWgrR6Bzaag==
X-Google-Smtp-Source: ACcGV61c14UKfKbzpEIBsQVKW3LwKSWYCDC7uG4VRfY0+u6lXN6scvnXZFQJFxGLq27t88JL3X5VSQ==
X-Received: by 2002:a17:902:c85:: with SMTP id 5-v6mr948803plt.141.1537834739008;
        Mon, 24 Sep 2018 17:18:59 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id u184-v6sm676442pgd.27.2018.09.24.17.18.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Sep 2018 17:18:50 -0700 (PDT)
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
Subject: [PATCH security-next v3 21/29] LSM: Build ordered list of ordered LSMs for init
Date:   Mon, 24 Sep 2018 17:18:24 -0700
Message-Id: <20180925001832.18322-22-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
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
index a98549b334af..ef1ced0a3a50 100644
--- a/security/security.c
+++ b/security/security.c
@@ -34,6 +34,9 @@
 
 #define MAX_LSM_EVM_XATTR	2
 
+/* How many LSMs were built into the kernel? */
+#define LSM_COUNT (__end_lsm_info - __start_lsm_info)
+
 struct security_hook_heads security_hook_heads __lsm_ro_after_init;
 static ATOMIC_NOTIFIER_HEAD(lsm_notifier_chain);
 
@@ -45,6 +48,9 @@ static __initdata const char *chosen_major_lsm;
 
 static __initconst const char * const builtin_lsm_enable = CONFIG_LSM_ENABLE;
 
+/* Ordered list of LSMs to initialize. */
+static __initdata struct lsm_info **ordered_lsms;
+
 static bool debug __initdata;
 #define init_debug(...)						\
 	do {							\
@@ -96,6 +102,45 @@ static void __init set_enabled(struct lsm_info *lsm, bool enabled)
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
+		   is_enabled(lsm) ? "en" : "dis");
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
 /* Is an LSM allowed to be initialized? */
 static bool __init lsm_allowed(struct lsm_info *lsm)
 {
@@ -126,14 +171,10 @@ static void __init maybe_initialize_lsm(struct lsm_info *lsm)
 
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
@@ -215,6 +256,8 @@ int __init security_init(void)
 	for (i = 0; i < sizeof(security_hook_heads) / sizeof(struct hlist_head);
 	     i++)
 		INIT_HLIST_HEAD(&list[i]);
+	ordered_lsms = kcalloc(LSM_COUNT + 1, sizeof(*ordered_lsms),
+				GFP_KERNEL);
 
 	/* Figure out which LSMs are enabled and disabled. */
 	prepare_lsm_enable();
@@ -227,6 +270,7 @@ int __init security_init(void)
 	loadpin_add_hooks();
 
 	/* Load LSMs in specified order. */
+	prepare_lsm_order();
 	ordered_lsm_init();
 
 	/*
@@ -234,6 +278,7 @@ int __init security_init(void)
 	 */
 	major_lsm_init();
 
+	kfree(ordered_lsms);
 	return 0;
 }
 
-- 
2.17.1


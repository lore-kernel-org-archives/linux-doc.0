Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B86FB7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 00:25:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbeJKHuY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 03:50:24 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34399 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbeJKHuX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Oct 2018 03:50:23 -0400
Received: by mail-pg1-f196.google.com with SMTP id g12-v6so3288957pgs.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Oct 2018 17:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7MWm0+P/X+39HL+s8UrwNL/nmKrjGJUnQdRflWFBBLo=;
        b=YFYFaZPMiA6bx2pBhzXKXyqcvud3xTvKW0vJDgjtV6OcljqJzfkIJb+k5aN2/OZBYT
         kbI9yzJnnTLUovU2SMPJRQFQFeSFoyQFDA3QRihYt9w+bBySiUFFWRS32h8iANEVHkKW
         cbje0S0KgD59l7H3FViEsEmzw7NNEAKCa1FcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7MWm0+P/X+39HL+s8UrwNL/nmKrjGJUnQdRflWFBBLo=;
        b=FuHzV98inESjGoeDum6NwRY5N/rRARnqRSZ0svYA7G0wvVzDgxGv1TCuG7bofhTz3d
         Oxz5MSBl/H2eCmu8f5kkk4N6KW/AOEwPjerNMCxS/r956p21adOx5MGk3dvyOsQZFuj1
         VzSKwYRxDkZiC5QOic/Ui2FY5ZAikA9JtzMeSAr/mEDk/+/pIupF/GdXvj838O3zJjAP
         CzSylWolbLb168Mj8BtfJuDAhfK44gHRuOkLLGeOFDqHYOA+lxDH2NmM3wk86J/P1liK
         AclNOO3zr5gD19rLXMzFehnGDZUyzReXSYW9NmzwOQcprN5II/497sitTPuMQdchWc85
         xTwA==
X-Gm-Message-State: ABuFfojIyM1E6oBGxKqbSoVzvfbSHb7TPtz90AQKhTZ59MFKc1wFcW59
        LgltItvljOhfZAUSLCblXvD2gA==
X-Google-Smtp-Source: ACcGV61//8vWC9oFusndN9PkH+YwosFItNb/PjHYIYtOo0iGstbSGUkswUC9yvVOa8ZTf9yTjit4tA==
X-Received: by 2002:a62:c60a:: with SMTP id m10-v6mr36286695pfg.15.1539217547310;
        Wed, 10 Oct 2018 17:25:47 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id l83-v6sm62173135pfi.172.2018.10.10.17.25.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Oct 2018 17:25:45 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     James Morris <jmorris@namei.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jordan Glover <Golden_Miller83@protonmail.ch>,
        LSM <linux-security-module@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH security-next v5 17/30] LSM: Introduce CONFIG_LSM
Date:   Wed, 10 Oct 2018 17:18:33 -0700
Message-Id: <20181011001846.30964-18-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011001846.30964-1-keescook@chromium.org>
References: <20181011001846.30964-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This provides a way to declare LSM initialization order via the new
CONFIG_LSM. Currently only non-major LSMs are recognized. This will
be expanded in future patches.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/Kconfig    |  9 +++++++++
 security/security.c | 27 ++++++++++++++++++++++-----
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/security/Kconfig b/security/Kconfig
index 27d8b2688f75..005634f7c4bb 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -276,5 +276,14 @@ config DEFAULT_SECURITY
 	default "apparmor" if DEFAULT_SECURITY_APPARMOR
 	default "" if DEFAULT_SECURITY_DAC
 
+config LSM
+	string "Ordered list of enabled LSMs"
+	default "integrity"
+	help
+	  A comma-separated list of LSMs, in initialization order.
+	  Any LSMs left off this list will be ignored.
+
+	  If unsure, leave this as the default.
+
 endmenu
 
diff --git a/security/security.c b/security/security.c
index 9bb15d697287..1c4889bce917 100644
--- a/security/security.c
+++ b/security/security.c
@@ -48,6 +48,8 @@ char *lsm_names;
 static __initdata char chosen_lsm[SECURITY_NAME_MAX + 1] =
 	CONFIG_DEFAULT_SECURITY;
 
+static __initconst const char * const builtin_lsm_order = CONFIG_LSM;
+
 /* Ordered list of LSMs to initialize. */
 static __initdata struct lsm_info **ordered_lsms;
 
@@ -155,15 +157,30 @@ static void __init maybe_initialize_lsm(struct lsm_info *lsm)
 	}
 }
 
-/* Populate ordered LSMs list from single LSM name. */
+/* Populate ordered LSMs list from comma-separated LSM name list. */
 static void __init ordered_lsm_parse(const char *order, const char *origin)
 {
 	struct lsm_info *lsm;
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
 
-	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-		if (strcmp(lsm->name, order) == 0)
-			append_ordered_lsm(lsm, origin);
+		if (!found)
+			init_debug("%s ignored: %s\n", origin, name);
 	}
+	kfree(sep);
 }
 
 static void __init ordered_lsm_init(void)
@@ -173,7 +190,7 @@ static void __init ordered_lsm_init(void)
 	ordered_lsms = kcalloc(LSM_COUNT + 1, sizeof(*ordered_lsms),
 				GFP_KERNEL);
 
-	ordered_lsm_parse("integrity", "builtin");
+	ordered_lsm_parse(builtin_lsm_order, "builtin");
 
 	for (lsm = ordered_lsms; *lsm; lsm++)
 		maybe_initialize_lsm(*lsm);
-- 
2.17.1


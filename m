Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BCF097D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 01:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbeJBHpA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:45:00 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36968 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbeJBHo7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:44:59 -0400
Received: by mail-io1-f68.google.com with SMTP id v14-v6so289611iob.4
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 18:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ks3HdAgDKLMMPmesm6MVfQ5et4OmzqciJ/tnMRsEDA8=;
        b=PU3VlaY/JJxOXfVs1rxXb/rtRH+f+o/ysjXlqktQ0scZ98ix2EBT9uYMAlSLWhHAgb
         kYovQAdSj5zeNBmWXdY6TAUA+LqS6IIZIwjObdlfUHccDRhlkel3XnNEFeB6cDNBrgaK
         4x4+vpRp4BAl6ses/FATsmZJWY7cNA3BfcScc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ks3HdAgDKLMMPmesm6MVfQ5et4OmzqciJ/tnMRsEDA8=;
        b=L3tpycld670Pf02zR2XHI8i14Z+pLmfDq8DRF7CTknmTnvxCcveqnGv4bnenA9UvQc
         5GMKmsQKd/6WFLYJiC+DLVrrfImT4groIiql2DWAyHJCt/65Wsm2TNRKNn9XcFANqqz9
         kBPVbwD/F5NTq1fxq3PEDqBnRUQPaTzqtSdP4t4CPn/VIp8j1kEVii/GQGm5q0HNLfSf
         JRQVSUaHfeoqIL2Yfypd7CIHkjZ0Hay/nLODC5+EvHdJZ7g320jqIcCZWoX/4IBjU9Fu
         xQiCA/4cZbUkM5akPMDpR4gGfEPhCwmp1QPOx0ETBkj14PWr8MGzvPX8xz0KQuqNC5R8
         TJjA==
X-Gm-Message-State: ABuFfogCIdSQ8PmG33BXwjujIeWcM2XVM/oK0F0MHVhNqBmUYngH14Qq
        u/8TcKv9h1ve0dtBQpzr2NkLMA==
X-Google-Smtp-Source: ACcGV62y3FiVazsys9HJMkgofRwcIjXme51N9qYTXIuCfyzTJ5a4dq9OZMwYYg0P4bdFXsiVxkxu2Q==
X-Received: by 2002:a17:902:8a89:: with SMTP id p9-v6mr14549464plo.183.1538442267459;
        Mon, 01 Oct 2018 18:04:27 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id 187-v6sm26488822pfu.129.2018.10.01.18.04.23
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
Subject: [PATCH security-next v4 16/32] LSM: Prepare for arbitrary LSM enabling
Date:   Mon,  1 Oct 2018 17:54:49 -0700
Message-Id: <20181002005505.6112-17-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Before now, all the LSMs that did not specify an "enable" variable in their
struct lsm_info were considered enabled by default. This prepares to make
LSM enabling more explicit. For all LSMs without an explicit "enable"
variable, a hard-coded storage location is chosen, and all LSMs without
an external "enable" state have their state explicitly set to "enabled".

This code appears more complex than it needs to be (comma-separated
list parsing and "set" function parameter) because its use will be
expanded on in the following patches to provide more explicit enabling.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
---
 security/security.c | 69 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/security/security.c b/security/security.c
index 4e5e67b82b7b..9459b4ee4fd9 100644
--- a/security/security.c
+++ b/security/security.c
@@ -54,17 +54,46 @@ static __initdata bool debug;
 
 static bool __init is_enabled(struct lsm_info *lsm)
 {
-	if (!lsm->enabled || *lsm->enabled)
-		return true;
+	if (WARN_ON(!lsm->enabled))
+		return false;
 
-	return false;
+	return *lsm->enabled;
 }
 
 /* Mark an LSM's enabled flag, if it exists. */
-static void __init set_enabled(struct lsm_info *lsm, bool enabled)
+static int lsm_enabled_true __initdata = 1;
+static int lsm_enabled_false __initdata = 0;
+
+static void __init default_enabled(struct lsm_info *lsm, bool enabled)
 {
+	/* If storage location already set, skip this one. */
 	if (lsm->enabled)
+		return;
+
+	/*
+	 * When an LSM hasn't configured an enable variable, we can use
+	 * a hard-coded location for storing the default enabled state.
+	 */
+	if (enabled)
+		lsm->enabled = &lsm_enabled_true;
+	else
+		lsm->enabled = &lsm_enabled_false;
+}
+
+static void __init set_enabled(struct lsm_info *lsm, bool enabled)
+{
+	if (WARN_ON(!lsm->enabled))
+		return;
+
+	if (lsm->enabled == &lsm_enabled_true) {
+		if (!enabled)
+			lsm->enabled = &lsm_enabled_false;
+	} else if (lsm->enabled == &lsm_enabled_false) {
+		if (enabled)
+			lsm->enabled = &lsm_enabled_true;
+	} else {
 		*lsm->enabled = enabled;
+	}
 }
 
 /* Is an LSM allowed to be initialized? */
@@ -127,6 +156,35 @@ static void __init major_lsm_init(void)
 	}
 }
 
+static void __init parse_lsm_enable(const char *str,
+				    void (*set)(struct lsm_info *, bool),
+				    bool enabled)
+{
+	char *sep, *name, *next;
+
+	if (!str)
+		return;
+
+	sep = kstrdup(str, GFP_KERNEL);
+	next = sep;
+	while ((name = strsep(&next, ",")) != NULL) {
+		struct lsm_info *lsm;
+
+		for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+			if (strcmp(name, "all") == 0 ||
+			    strcmp(name, lsm->name) == 0)
+				set(lsm, enabled);
+		}
+	}
+	kfree(sep);
+}
+
+static void __init prepare_lsm_enable(void)
+{
+	/* Prepare defaults. */
+	parse_lsm_enable("all", default_enabled, true);
+}
+
 /**
  * security_init - initializes the security framework
  *
@@ -143,6 +201,9 @@ int __init security_init(void)
 	     i++)
 		INIT_HLIST_HEAD(&list[i]);
 
+	/* Figure out which LSMs are enabled and disabled. */
+	prepare_lsm_enable();
+
 	/*
 	 * Load minor LSMs, with the capability module always first.
 	 */
-- 
2.17.1


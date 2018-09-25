Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 477E77E3A2
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbeIYGXn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:23:43 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38369 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbeIYGXk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:23:40 -0400
Received: by mail-pg1-f195.google.com with SMTP id r77-v6so4989783pgr.5
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/oQfTEGvfpO3aaeUDyhL3QKvWtsv1A9GazilfvGgv5Y=;
        b=EzCvaDR/khY1s3OqJfIVV4l2yS9aIoxaHwDltpgQYuBKUUAnFwa6eFifvAbSopZUEh
         nxMDgE2aAfX7BMTSloXu8x/h4cOc0na7zbdYW2TV1qVXWdnhYVZFEDIbfpOE1ZST6mTK
         rZjh6suXDIPx6vbWsrVTYfCrGpkCJD4uvrI/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/oQfTEGvfpO3aaeUDyhL3QKvWtsv1A9GazilfvGgv5Y=;
        b=YFOgQozLI3laOa/fX/NOBTwSgUm+Dx8oRtzb3zynif1K1k717V1dxXAIfLZDenedjG
         v9gsEReJ8LnpLxViQCa/jCgaKLE8v3INYnN4/wZg1ALSlu2zq0Jtl4gy4SFh7pbjdLhG
         zczxnpBIibb8UDyl+Um73dBKKaOUfPTB4GEf67BtezoBaKxsvOeKvENyJHDR32xS8ZU8
         jeOp0vyWZie6AwTXIA3u7bLgVHIMRZMJt3akmts6D6OSABOX1glnnMhJtFkxruF7/7rB
         oEqg9kV9h02yRMR/1h4S9R+SPBAli3822c/t/uLvBmccgHvlxRqvuBoCBYJpo76XS6P8
         TThQ==
X-Gm-Message-State: ABuFfoi+oJvq3pFwXCQRpna/Y0pALyjyfzOC6/EJOpPeTbya6DP0oF8B
        xrqqwVtbsJrlISviPlZ3+uHOFQ==
X-Google-Smtp-Source: ACcGV61XWkI7jvMLgtkghMB5HT597VzTM/ppDIrjP2n2mSyP7lazRyZE6y0sWfJY3wUQqUMDr+n4Iw==
X-Received: by 2002:a62:ad9:: with SMTP id 86-v6mr974854pfk.57.1537834734311;
        Mon, 24 Sep 2018 17:18:54 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id c23-v6sm610745pfh.26.2018.09.24.17.18.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Sep 2018 17:18:48 -0700 (PDT)
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
Subject: [PATCH security-next v3 16/29] LSM: Prepare for arbitrary LSM enabling
Date:   Mon, 24 Sep 2018 17:18:19 -0700
Message-Id: <20180925001832.18322-17-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
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
---
 security/security.c | 69 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/security/security.c b/security/security.c
index 056b36cf6245..a8107d54b3d3 100644
--- a/security/security.c
+++ b/security/security.c
@@ -54,17 +54,46 @@ static bool debug __initdata;
 
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


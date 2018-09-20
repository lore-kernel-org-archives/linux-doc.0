Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 54F6A7DE59
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:33:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732761AbeITWN4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:13:56 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:47024 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732579AbeITWN4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:13:56 -0400
Received: by mail-pl1-f195.google.com with SMTP id t20-v6so1157522ply.13
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7l709grnLXa9oQiRnFPwrOzUkGynv4IeKIf/MUAXVHs=;
        b=diA1Ewv2L1phtaHaAAs4/dJeM9Te3mTsr7aQyT/xI0o125u7jSHaLan4NDpa17zERo
         Rmr3aAQqSkzid/XqaZdX50GgqxKM4KlgjfWf0nTD04ENAuoBt1vsr4k5BTAx3dd7Y1t7
         gzxh2xyWyC7+Sdf0b7NNUlytHLLTxEUlFn0II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7l709grnLXa9oQiRnFPwrOzUkGynv4IeKIf/MUAXVHs=;
        b=ZDvMpcw9BBh4Y1eFMVBNBsYwkjIU9Q2NWxV0SvAV0WpGOV3M+egMT6hlvppx9SYhbW
         mCUTPpOFCKeuk28XzWkRBdSCMU13pjN+kevxbpinfV9vnG/qliKEKUKhOuQGqCQqKNRh
         8YGH8ksy1Dwx796PwS3GuaJZTxFDJkD0brhyjEra6lkU7g99hw6IoEA1zphjxLdYwed3
         0yb5qsGFOFKdbZju9sbxXLP8y96JrJqRFYQQyG4/RvJPN9T/rLoj94cxN1jHgUCb+kFl
         6JNvz2I4m+zQa9x0rZ2HKxvCk2d/71UvuF3QE8pJH/LOi13n5Mj67AUJ51LHiXp5Fgos
         i/7w==
X-Gm-Message-State: APzg51AFplPfWs2Pqg0i62FpTpgWv2ixKaYrOnnYGD07XKPM5OKqmtc3
        Wk0BMQT1rSP4MfA5P5nFCkK2UQ==
X-Google-Smtp-Source: ANB0VdYGAMZBkkXSsAsP05hNfsLJK1nnfZstGVYeCc0KpbZXXFZnfAk/P//p8yM8sOf+E1i3FUS0Ww==
X-Received: by 2002:a17:902:28a4:: with SMTP id f33-v6mr40383199plb.297.1537460978969;
        Thu, 20 Sep 2018 09:29:38 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id v6-v6sm36606523pfa.28.2018.09.20.09.29.34
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
Subject: [PATCH security-next v2 23/26] LSM: Introduce enum lsm_order
Date:   Thu, 20 Sep 2018 09:23:35 -0700
Message-Id: <20180920162338.21060-24-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In preparation for distinguishing the "capability" LSM from other LSMs,
it must be ordered first. This introduces LSM_ORDER_MUTABLE for the
general LSMs, LSM_ORDER_FIRST for capabilities, and LSM_ORDER_LAST for
anything that must run last (e.g. Landlock may use this in the future).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/lsm_hooks.h |  7 +++++++
 security/security.c       | 22 ++++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index d75a42eb3ddd..bf29851baf47 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2041,8 +2041,15 @@ extern void security_add_hooks(struct security_hook_list *hooks, int count,
 
 #define LSM_FLAG_LEGACY_MAJOR	(1 << 0)
 
+enum lsm_order {
+	LSM_ORDER_FIRST = -1,	/* This is only for capabilities. */
+	LSM_ORDER_MUTABLE = 0,
+	LSM_ORDER_LAST,
+};
+
 struct lsm_info {
 	const char *name;	/* Populated automatically. */
+	enum lsm_order order;	/* Optional: default is LSM_ORDER_MUTABLE */
 	unsigned long flags;	/* Optional: flags describing LSM */
 	int *enabled;		/* Optional: NULL means enabled. */
 	int (*init)(void);
diff --git a/security/security.c b/security/security.c
index 3fba28de789b..d649e7dea4c4 100644
--- a/security/security.c
+++ b/security/security.c
@@ -62,6 +62,10 @@ static int lsm_enabled_true __initdata = 1;
 static int lsm_enabled_false __initdata = 0;
 static void __init set_enabled(struct lsm_info *lsm, bool enabled)
 {
+	/* First LSM cannot have enablement changed. */
+	if (lsm->order == LSM_ORDER_FIRST)
+		return;
+
 	if (!lsm->enabled) {
 		/*
 		 * If the LSM hasn't configured an enable flag, we
@@ -124,7 +128,8 @@ static void __init parse_lsm_order(const char *order, const char *origin)
 		bool found = false;
 
 		for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-			if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0 &&
+			if (lsm->order == LSM_ORDER_MUTABLE &&
+			    (lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0 &&
 			    strcmp(lsm->name, name) == 0) {
 				append_ordered_lsm(lsm, origin);
 				found = true;
@@ -142,6 +147,12 @@ static void __init prepare_lsm_order(void)
 {
 	struct lsm_info *lsm;
 
+	/* LSM_ORDER_FIRST is always first. */
+	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+		if (lsm->order == LSM_ORDER_FIRST)
+			append_ordered_lsm(lsm, "first");
+	}
+
 	/* Parse order from commandline, if present. */
 	if (chosen_lsm_order)
 		parse_lsm_order(chosen_lsm_order, "cmdline");
@@ -151,9 +162,16 @@ static void __init prepare_lsm_order(void)
 
 	/* Add any missing LSMs, in link order. */
 	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-		if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
+		if (lsm->order == LSM_ORDER_MUTABLE &&
+		    (lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
 			append_ordered_lsm(lsm, "link-time");
 	}
+
+	/* LSM_ORDER_LAST is always last. */
+	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+		if (lsm->order == LSM_ORDER_LAST)
+			append_ordered_lsm(lsm, "last");
+	}
 }
 
 /* Is an LSM allowed to be enabled? */
-- 
2.17.1


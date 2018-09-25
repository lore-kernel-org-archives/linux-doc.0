Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 826557E0C1
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbeIYGaN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:30:13 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41590 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbeIYGaM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:30:12 -0400
Received: by mail-pf1-f196.google.com with SMTP id m77-v6so1225050pfi.8
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v+bgLsnYIEjOih3SRhhO7dkDnRKEzVCMNAzz+EjXpHg=;
        b=ck2/wFpivCOb7/CK8KeVglR5VoDX76r4hYd79A+wfNOLkLEcgXUGgqVnxKYwcMc6ML
         AkdbGwQzpJBB0VMnsxFyv5d0oAj9FQy+OjJoFd0UqtkzGX+cjXhY8HcVbQ0ZOy8EFzFj
         bVWb4JREC6bs66N2yNnqhi/DBFx/kunb4Td3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v+bgLsnYIEjOih3SRhhO7dkDnRKEzVCMNAzz+EjXpHg=;
        b=Vo26ogJ3UodP2SJOE3JjnD0HHKedkciDCFxKZxcDFH9s4cjubHLwpJwCYj4c6MBrVj
         a+jUZLfCK4qMVCXYrXe7y9f5IT55K75nCEcPVjNoCWwddjpjR7EyZ6uHGQ+Qbv21/EoK
         dO1Ww/AFF7Vy5NMUj3xtdK/WvhlyzdpDBvcIdCbVt/f1iU8fU5JUysJnxRPT51UBnNjP
         quzdrL11WQ0BowtLHntYSKnKhsBqfrZFcxWSP0UepIuj8AZLkbRyH7mXB26gL3tjBqrG
         FME9ev/RdtGbq3qy/OyV7LjWLYPruvlzLcoNkHS3p9ifmjI3yUiBS+5YA4Vk638wYkTQ
         SaYQ==
X-Gm-Message-State: ABuFfog/SbLgjV1/1rt16izT8CBdSCJrCJOcl/Vip5UN7RoVOoRbL3xl
        0kZC4+ov5YuIrdi4xDgQArSVCg==
X-Google-Smtp-Source: ACcGV61GzfRbyoeVB/zFFoHIWLaMdn1xpYcS7i99l+puB02zFzFGRU00KqLtZ5DjuLibaUXmes51yQ==
X-Received: by 2002:a63:6f45:: with SMTP id k66-v6mr923000pgc.360.1537835124567;
        Mon, 24 Sep 2018 17:25:24 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id a11-v6sm497393pgv.29.2018.09.24.17.25.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Sep 2018 17:25:20 -0700 (PDT)
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
Subject: [PATCH security-next v3 26/29] LSM: Introduce enum lsm_order
Date:   Mon, 24 Sep 2018 17:18:29 -0700
Message-Id: <20180925001832.18322-27-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
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
 security/security.c       | 18 ++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 5be95c6155b4..b38902ea0be5 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2041,8 +2041,15 @@ extern void security_add_hooks(struct security_hook_list *hooks, int count,
 
 #define LSM_FLAG_LEGACY_MAJOR	BIT(0)
 
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
 	int *enabled;		/* Optional: NULL checks CONFIG_LSM_ENABLE */
 	int (*init)(void);
diff --git a/security/security.c b/security/security.c
index c4ba5832ef2f..8b93afa75e3c 100644
--- a/security/security.c
+++ b/security/security.c
@@ -148,7 +148,8 @@ static void __init parse_lsm_order(const char *order, const char *origin)
 		bool found = false;
 
 		for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-			if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0 &&
+			if (lsm->order == LSM_ORDER_MUTABLE &&
+			    (lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0 &&
 			    strcmp(lsm->name, name) == 0) {
 				append_ordered_lsm(lsm, origin);
 				found = true;
@@ -166,6 +167,12 @@ static void __init prepare_lsm_order(void)
 {
 	struct lsm_info *lsm;
 
+	/* LSM_ORDER_FIRST is always first. */
+	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+		if (lsm->order == LSM_ORDER_FIRST)
+			append_ordered_lsm(lsm, "first");
+	}
+
 	/* Parse order from commandline, if present. */
 	parse_lsm_order(chosen_lsm_order, "cmdline");
 
@@ -174,9 +181,16 @@ static void __init prepare_lsm_order(void)
 
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
 
 /* Is an LSM allowed to be initialized? */
-- 
2.17.1


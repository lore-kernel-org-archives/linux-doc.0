Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 78C607E421
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732034AbeITWIR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:08:17 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44360 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388044AbeITWIR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:08:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id k21-v6so4602962pff.11
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dj661ofWrIevUkOjpEMxgFKe/xflRUudjm72RcAWxpw=;
        b=Xzr75PuyPMjChpDxxAd5r9+6AhusmkdlEV7ZXnkFp2FPl71FEA54aVfPu+dM0YsmIm
         H6NdFLUQLe52sx2DUbIErzIspSGfK7goeUapLNpocp32yG/9QttxEMIaLS5ZyNRMOIMq
         JNpwTsplJpOu7B1JqZoAohZ1ajUhXKjse6UTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dj661ofWrIevUkOjpEMxgFKe/xflRUudjm72RcAWxpw=;
        b=cbwY8Xn99IwXYeXbPylNYxrTvP7IKxAf9qPtg1rF91UlZR+Y+Ni5MwdgWB6d3fx+55
         3caNIjdmjhpTIbsTXKuc0WJk9XO+JG3L50TDK9z9Vfqh6atZ2qYysbCGv72E0wpyu4r9
         KRbqXHVeRgz2kFH+ZcWuD/Ir/tP0ojQjRg/jdW7UZcD6sr1CZLRSexs3jPv+aevEJSqk
         djNKRiLuOvlgv4DfUa6XWonXYsdvceW0o+TU/I25CX/maRbNOunjsdyf68dGRyhfvTxA
         YgpdofKd8KPX5AIESOpvnxoVg70tdbK0fVHc+DHIxjS3Dl7JJkhfrvjH2fIJEl3Xmr5r
         ao2g==
X-Gm-Message-State: APzg51BRY6N/s9s4p3uUCij2xJeFUl0ioafICYpt8ctgh/7FaDbeAHxK
        9ihNj8IwkwMeVrxovn8iD++sHQ==
X-Google-Smtp-Source: ANB0VdbJcBJwMpwmb9zXr7Z7Qd6q4z6PAesnSk3HeYG6TpgInkqve2K79penv0deet2X1EVWY44wJA==
X-Received: by 2002:a62:f909:: with SMTP id o9-v6mr41908083pfh.141.1537460641405;
        Thu, 20 Sep 2018 09:24:01 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id v8-v6sm30976479pff.120.2018.09.20.09.23.52
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
Subject: [PATCH security-next v2 20/26] LSM: Introduce "lsm.order=" for boottime ordering
Date:   Thu, 20 Sep 2018 09:23:32 -0700
Message-Id: <20180920162338.21060-21-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide a way to reorder LSM initialization using the new "lsm.order="
comma-separated list of LSMs. Any LSMs not listed will be added in builtin
order.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 security/security.c                             | 15 ++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 32d323ee9218..5ac4c1056ffa 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2276,6 +2276,11 @@
 
 	lsm.debug	[SECURITY] Enable LSM initialization debugging output.
 
+	lsm.order=lsm1,...,lsmN
+			[SECURITY] Choose order of LSM initialization. Any
+			builtin LSMs not listed here will be implicitly
+			added to the list in builtin order.
+
 	machvec=	[IA-64] Force the use of a particular machine-vector
 			(machvec) in a generic kernel.
 			Example: machvec=hpzx1_swiotlb
diff --git a/security/security.c b/security/security.c
index 063ee2466e58..4db194f81419 100644
--- a/security/security.c
+++ b/security/security.c
@@ -43,6 +43,7 @@ static ATOMIC_NOTIFIER_HEAD(lsm_notifier_chain);
 char *lsm_names;
 /* Boot-time LSM user choice */
 static __initdata const char *chosen_major_lsm;
+static __initdata const char *chosen_lsm_order;
 
 static __initconst const char * const builtin_lsm_order = CONFIG_LSM_ORDER;
 
@@ -136,11 +137,15 @@ static void __init parse_lsm_order(const char *order, const char *origin)
 	kfree(sep);
 }
 
-/* Populate ordered LSMs list from builtin list of LSMs. */
+/* Populate ordered LSMs list from commandline and builtin list of LSMs. */
 static void __init prepare_lsm_order(void)
 {
 	struct lsm_info *lsm;
 
+	/* Parse order from commandline, if present. */
+	if (chosen_lsm_order)
+		parse_lsm_order(chosen_lsm_order, "cmdline");
+
 	/* Parse order from builtin list. */
 	parse_lsm_order(builtin_lsm_order, "builtin");
 
@@ -264,6 +269,14 @@ static int __init choose_major_lsm(char *str)
 }
 __setup("security=", choose_major_lsm);
 
+/* Explicitly choose LSM initialization order. */
+static int __init choose_lsm_order(char *str)
+{
+	chosen_lsm_order = str;
+	return 1;
+}
+__setup("lsm.order=", choose_lsm_order);
+
 /* Enable LSM order debugging. */
 static int __init enable_debug(char *str)
 {
-- 
2.17.1


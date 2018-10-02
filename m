Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F02FD7D08D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 00:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbeJBHfu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:35:50 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:40690 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbeJBHfr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:35:47 -0400
Received: by mail-io1-f65.google.com with SMTP id w16-v6so248927iom.7
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 17:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=coT3X8tVSAJpPw1SxEOHYVe3MlpWDyaK1fjOEndGqVU=;
        b=Yyh9c4r8HcXrwZjSirhotaTthk0NLxyrtfg2GQ7LiwXyRWVrGXiqMbqkV3uB+JQeHX
         Ky4m5kQaHYTjykplveV9uXn+Jr4rkzA1xy9fT5MN/3FZAWAL25XsEqeC4Ivn5+OM24dA
         Qjyc28qKorbF5wVPtDI+GqrsRr5cj1zQEAEFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=coT3X8tVSAJpPw1SxEOHYVe3MlpWDyaK1fjOEndGqVU=;
        b=p7R5NMTxPuEIqc33phOi9jl8FeM7iJUygmuxsOQdkSZiccXxBztbCM8ZytZqIZmSp5
         cu1C+ODVVm8Y0XviB3ZV+uM/m9iKaphbZ83f8ER7jr/JnfCShxS7qRWe7TO8BT/SxoMQ
         woepP/ocu2bHt2UxK16bCJElOidLGSyt/cJnNj5Le9OHMfvxIjWnRV564qDr7FticoSg
         OW8g2yWcZ0RbEQFalsTWT/AIkrpwN7LHu4UhF0CdiS+Z81dNGv7yEpcmrMMALTKXqCjC
         fTu92fkkOmevG9+ZVjJLN48eCnqyCdn7AgHmkRlBUgnPVdG4oTx7fuwd4AUTx4LomcAZ
         ip7g==
X-Gm-Message-State: ABuFfogDYK5oIsOqeUGjNLf/AoAYWgVRuCaVw0OXdWzpVHYvw8IWGReD
        5xwQHc4hhL3wC53ts05VAmk28Q==
X-Google-Smtp-Source: ACcGV63tp0dya/BwK7kLX+SamR9uh0bF+urMU28li1ahwLqBO+PzK9MSvE7XVoKBGj/2VRv+EfxjRg==
X-Received: by 2002:a17:902:9f8c:: with SMTP id g12-v6mr14307634plq.309.1538441718186;
        Mon, 01 Oct 2018 17:55:18 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id a2-v6sm17051135pgc.68.2018.10.01.17.55.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Oct 2018 17:55:13 -0700 (PDT)
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
Subject: [PATCH security-next v4 09/32] LSM: Provide init debugging infrastructure
Date:   Mon,  1 Oct 2018 17:54:42 -0700
Message-Id: <20181002005505.6112-10-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Booting with "lsm.debug" will report future details on how LSM ordering
decisions are being made.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
---
 .../admin-guide/kernel-parameters.txt          |  2 ++
 security/security.c                            | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9871e649ffef..32d323ee9218 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2274,6 +2274,8 @@
 	ltpc=		[NET]
 			Format: <io>,<irq>,<dma>
 
+	lsm.debug	[SECURITY] Enable LSM initialization debugging output.
+
 	machvec=	[IA-64] Force the use of a particular machine-vector
 			(machvec) in a generic kernel.
 			Example: machvec=hpzx1_swiotlb
diff --git a/security/security.c b/security/security.c
index e74f46fba591..395f804f6a91 100644
--- a/security/security.c
+++ b/security/security.c
@@ -12,6 +12,8 @@
  *	(at your option) any later version.
  */
 
+#define pr_fmt(fmt) "LSM: " fmt
+
 #include <linux/bpf.h>
 #include <linux/capability.h>
 #include <linux/dcache.h>
@@ -43,11 +45,19 @@ char *lsm_names;
 static __initdata char chosen_lsm[SECURITY_NAME_MAX + 1] =
 	CONFIG_DEFAULT_SECURITY;
 
+static __initdata bool debug;
+#define init_debug(...)						\
+	do {							\
+		if (debug)					\
+			pr_info(__VA_ARGS__);			\
+	} while (0)
+
 static void __init major_lsm_init(void)
 {
 	struct lsm_info *lsm;
 
 	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+		init_debug("initializing %s\n", lsm->name);
 		lsm->init();
 	}
 }
@@ -91,6 +101,14 @@ static int __init choose_lsm(char *str)
 }
 __setup("security=", choose_lsm);
 
+/* Enable LSM order debugging. */
+static int __init enable_debug(char *str)
+{
+	debug = true;
+	return 1;
+}
+__setup("lsm.debug", enable_debug);
+
 static bool match_last_lsm(const char *list, const char *lsm)
 {
 	const char *last;
-- 
2.17.1


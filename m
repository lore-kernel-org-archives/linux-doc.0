Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 12A117D099
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 00:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbeJKHnl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 03:43:41 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46723 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbeJKHnl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Oct 2018 03:43:41 -0400
Received: by mail-pg1-f194.google.com with SMTP id a5-v6so3257086pgv.13
        for <linux-doc@vger.kernel.org>; Wed, 10 Oct 2018 17:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K8Z4hRQ9RjNB3cw7dID4X7rT0mlxEqRr67feJ2NB/9c=;
        b=B9/2xlN/BrGlJ2jEJ0k8X5eCznO9gGb86L7kP3gEAlTRWjvKke3tLyWsCO63usDSsB
         FZfgrRb1sQrXPB/GT2lJ2OgWtPdonIT7DCAAIFQyxtAPY5OhrkW1baX6/pUqa4pPu7jz
         9r/HS+A0PFL4QnzSYF1GhOOYUhJ5/7UBcVFhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K8Z4hRQ9RjNB3cw7dID4X7rT0mlxEqRr67feJ2NB/9c=;
        b=SCKvmCaU0rQVlILQmzh6vtAuBX+dTrB6yCcJFP/vKSitl9kbm+F59EhnjYmH0aWSWb
         XiyXE+AGQTZmqo0439Q4Yt1BSkKPp/C/ttF3bNi1Xw9bAoDjQ1I080EDPwPerL2kgbb6
         SNfoFGBtx5VznXZELzIx2mVtiNo1dtJWayRYMeZRTSvZwkp+TRf6AyMIPAtwaWq7bT2r
         hP/3iNMiOhKkxM3Wj7jJ5Va2FuAi9hul1kM3N9p37V/QnhC6IIA4/117LtGNwBToWgxm
         Ve1i8TjDmKGSryDIfWQ4DqX9/uIOH2a6+gW652J/hJOyGrVs5jZjK9RY2Hjc+Z1da5/b
         Hlpg==
X-Gm-Message-State: ABuFfoj6rASgEKFRb7CIaTKjiNuHXfmVGw8fNBGYgYk5p03cNLSiRkIr
        yvz/y+YLsQLPgaT7xnJ8k0vsfw==
X-Google-Smtp-Source: ACcGV60VLYbwdHOrzl5sFJ1cCwZRzKXIvXxg77pXFxsGRdNxcZiuZS1nq8GwLdI1uOIzhhF6+PxITg==
X-Received: by 2002:a62:36c3:: with SMTP id d186-v6mr29685315pfa.133.1539217146434;
        Wed, 10 Oct 2018 17:19:06 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id a15-v6sm23591467pff.8.2018.10.10.17.18.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Oct 2018 17:18:58 -0700 (PDT)
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
Subject: [PATCH security-next v5 12/30] LSM: Provide separate ordered initialization
Date:   Wed, 10 Oct 2018 17:18:28 -0700
Message-Id: <20181011001846.30964-13-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011001846.30964-1-keescook@chromium.org>
References: <20181011001846.30964-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This provides a place for ordered LSMs to be initialized, separate from
the "major" LSMs. This is mainly a copy/paste from major_lsm_init() to
ordered_lsm_init(), but it will change drastically in later patches.

What is not obvious in the patch is that this change moves the integrity
LSM from major_lsm_init() into ordered_lsm_init(), since it is not marked
with the LSM_FLAG_LEGACY_MAJOR. As it is the only LSM in the "ordered"
list, there is no reordering yet created.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
---
 security/security.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/security/security.c b/security/security.c
index 2055af907eba..ebbbb672ced5 100644
--- a/security/security.c
+++ b/security/security.c
@@ -52,12 +52,30 @@ static __initdata bool debug;
 			pr_info(__VA_ARGS__);			\
 	} while (0)
 
+static void __init ordered_lsm_init(void)
+{
+	struct lsm_info *lsm;
+	int ret;
+
+	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+		if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) != 0)
+			continue;
+
+		init_debug("initializing %s\n", lsm->name);
+		ret = lsm->init();
+		WARN(ret, "%s failed to initialize: %d\n", lsm->name, ret);
+	}
+}
+
 static void __init major_lsm_init(void)
 {
 	struct lsm_info *lsm;
 	int ret;
 
 	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+		if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
+			continue;
+
 		init_debug("initializing %s\n", lsm->name);
 		ret = lsm->init();
 		WARN(ret, "%s failed to initialize: %d\n", lsm->name, ret);
@@ -87,6 +105,9 @@ int __init security_init(void)
 	yama_add_hooks();
 	loadpin_add_hooks();
 
+	/* Load LSMs in specified order. */
+	ordered_lsm_init();
+
 	/*
 	 * Load all the remaining security modules.
 	 */
-- 
2.17.1


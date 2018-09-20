Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 85F977E3E6
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387967AbeITWIM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:08:12 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34755 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387934AbeITWIM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:08:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id k19-v6so4623550pfi.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5TLT0f4fZoyxcv+w2j50Rd/UuLy9YsMhEgdbx0R13nc=;
        b=NcJsP5U7+6EjbMYMW/1hKk0ViAKeIKbOwSryqKk9/eHnu/JNS3v455kWl9dqpuTSad
         n1PM/V5avOJVVhiZNSOP29Lu+gwCBWTDm7IuaVNDeJ3mqZ74bFvrebnJkJ+ya3E7i47b
         K1VdaGsa0XsaJcgdETZ5UzHBZ0beZPmKkGiMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5TLT0f4fZoyxcv+w2j50Rd/UuLy9YsMhEgdbx0R13nc=;
        b=rv8D0PgNHE9eiMJ8LA7wgmFp5ibQJrzb7q27X5X8OdL0XAo4KDZ1ppTRA6O0lv6n8R
         SIO4AaxDyrjttWPk7HfpVMn8l931YocW6rY9w46HOXPdns4bmsyE6O0uy5Q4B5GonFsO
         sW4orEG8bgiemPc3kuBaeMmDOIUbewbQyCV6sg9uuVNGCgSZF9TsYmfJ6vD62csymj0c
         OqOwrk1uxFBDU50u1gEIjHgYROIMfPW5/vbx7i0nqBynYoHcX0wyT6ttDqY1SXLoZhAF
         i0W26cFzl6JE086FBKtOtYbONc5TviflVIsOu/+tePmkFbnUtWQebjCzDYQrkTGbTiPU
         V2Nw==
X-Gm-Message-State: APzg51AMGTfSCAm2V3uxcxuelp/7OZ7OxfKPEp06JnpLv/IjPfnAdVDb
        SGGe+p/cotIyLVD+qDa4lrjrzA==
X-Google-Smtp-Source: ANB0VdYW0MALpG9oTE9XugslpbedkEsOoy0kcbuST9d9nAaqNY9z2OOA7lkuvgfGacPYikmr/Q4DBw==
X-Received: by 2002:a62:1e81:: with SMTP id e123-v6mr42012574pfe.24.1537460636734;
        Thu, 20 Sep 2018 09:23:56 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id x23-v6sm35186397pge.61.2018.09.20.09.23.48
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
Subject: [PATCH security-next v2 12/26] LSM: Provide separate ordered initialization
Date:   Thu, 20 Sep 2018 09:23:24 -0700
Message-Id: <20180920162338.21060-13-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
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
---
 security/security.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/security/security.c b/security/security.c
index 1f055936a746..a886a978214a 100644
--- a/security/security.c
+++ b/security/security.c
@@ -52,12 +52,30 @@ static bool debug __initdata;
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


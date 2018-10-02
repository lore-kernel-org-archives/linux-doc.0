Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 04F0E7D087
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 00:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbeJBHgu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:36:50 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:47074 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbeJBHft (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:35:49 -0400
Received: by mail-io1-f65.google.com with SMTP id t7-v6so227071ioj.13
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 17:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K8Z4hRQ9RjNB3cw7dID4X7rT0mlxEqRr67feJ2NB/9c=;
        b=LVblWbAN149pKjvi/TQyVOztj+MqZCELBs+pFQ9zZZ3rdPQ6OerOCyG+HZhHoBDDjl
         1NVwR//kQ8OUuQWlwoAJ4UCW8/0/iPcqdVvmX1BNm/AeUZa1CEUyYmx5vPGGuWpXyxW9
         +ZAoaVcHw740JE62LbcteksEmFJ+XduA8WsdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K8Z4hRQ9RjNB3cw7dID4X7rT0mlxEqRr67feJ2NB/9c=;
        b=oyj1N+Tyc5Qg/hg4JqGe0jXIhqXAitxmk6tKoFWLRkB8ih91jROHc0v/6XVNxH6r0/
         CjjxmyD+QAaHV0vLMFZBdFztNfdGejCKPgrgq7Cv0ZLWBXnuat2FOM/uMkzOTek/mZhj
         5Lltc3pDyFlCpWuZD0j1HDGut8PdETuBYWxhGtOixMG7RZ8l++q14yTr8UkFz4c8Wr5H
         xCOYweCIsQ0QmuTpmTLyU+ahvvASNNtROPQQxQtrfu7DZn+GVXBkm/IXIVq9O6tXqWOr
         a9ccb2IW7cuP6eazuNGWqikeusVQEQEbcH9MdVkSrCsjqj59thjrfeIhy2DimusraWwS
         UQKw==
X-Gm-Message-State: ABuFfoj0rOtvRcVz8FNlIevvEKujUx+LK7SLdvB/k60lUbG+REhTZKGS
        Qbhs4m8WLTwTCRcnVgWgBMwJ6Q==
X-Google-Smtp-Source: ACcGV61Yh5odpPljfpf/x5pe7VMxniMUxoCMKTJVM9vJoaM2HKQGI3bYyKYfYszwYr7bvyCBRp8WpQ==
X-Received: by 2002:a62:8490:: with SMTP id k138-v6mr13802325pfd.177.1538441720500;
        Mon, 01 Oct 2018 17:55:20 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id z22-v6sm19576710pgk.21.2018.10.01.17.55.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Oct 2018 17:55:16 -0700 (PDT)
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
Subject: [PATCH security-next v4 12/32] LSM: Provide separate ordered initialization
Date:   Mon,  1 Oct 2018 17:54:45 -0700
Message-Id: <20181002005505.6112-13-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
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


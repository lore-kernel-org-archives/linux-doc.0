Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE9587DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbeITWIB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:08:01 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37876 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730920AbeITWIB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:08:01 -0400
Received: by mail-pf1-f193.google.com with SMTP id h69-v6so4617646pfd.4
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6U8FlYD7rP2Z5yax3KFt9x7tHnPEb9jrVgAj32rVTY4=;
        b=HbO2ILhaYLf62Pv3wdaaDJfzQZgQ1+PDbxZ0KHrORB0lZI7Wb4ITajVIUAolZK+xSw
         dRr+KYaGHsGZaqcf4fAS0Yae3lKiyx4u3J5giCdbz8Ufapsfv7Y7dDb3izCeEJJl8Vbo
         4Qs3vDXLKFzhO0SmOXPzHluoAjr/t2f83vk4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6U8FlYD7rP2Z5yax3KFt9x7tHnPEb9jrVgAj32rVTY4=;
        b=RhVNldfwIPE4GLqZwpV+qxMMTQTqhwv7O3vyGjnIoVgmj4RsE9kFEWCs6SOY5URPoU
         Y+4ULKuh7OvZJdgxgy1RdqcWGnKRQkfJNH3vLr4NTfm9gqMh8inxn7elR9UR2tqlPFbC
         e/0/onXUnnLQyUu7VUyvqAE7geK/Jf8gaakIXqZ4yIp7/BgNRq8HnlggJwUGCNWgYmal
         H7cdMp4nEqvKh9Nw2cCNAke2oDg+pH022n0WA+7nI2rPIPHdzk6OMesm8e8dnd85ZrPe
         u5paBtNgxMrfEGe9Dk1umqZtw+V6B4i3pzTFsBtV9HtX4qdlP2e2MrmvOMUKoBvW3o47
         o/9A==
X-Gm-Message-State: APzg51DAS0O7bIfydcQ0P58r969xzIe70R2ap52HzM94O6HO93TOxDVf
        N9zAx2u1djzV2YxVjiVxGtuFiw==
X-Google-Smtp-Source: ANB0VdawAFpy+a77fH7yllH2w72CFcyI8KJ6tWMfLUy6ixaafh3O6z0z8V7/jXvGa9Y1csDrEYUt6Q==
X-Received: by 2002:a62:2904:: with SMTP id p4-v6mr19948279pfp.128.1537460625624;
        Thu, 20 Sep 2018 09:23:45 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id w5-v6sm29290713pfn.44.2018.09.20.09.23.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Sep 2018 09:23:43 -0700 (PDT)
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
Subject: [PATCH security-next v2 01/26] LSM: Correctly announce start of LSM initialization
Date:   Thu, 20 Sep 2018 09:23:13 -0700
Message-Id: <20180920162338.21060-2-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For a while now, the LSM core has said it was "initializED", rather than
"initializING". This adjust the report to be more accurate (i.e. before
this was reported before any LSMs had been initialized.)

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/security.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/security.c b/security/security.c
index 736e78da1ab9..4cbcf244a965 100644
--- a/security/security.c
+++ b/security/security.c
@@ -72,10 +72,11 @@ int __init security_init(void)
 	int i;
 	struct hlist_head *list = (struct hlist_head *) &security_hook_heads;
 
+	pr_info("Security Framework initializing\n");
+
 	for (i = 0; i < sizeof(security_hook_heads) / sizeof(struct hlist_head);
 	     i++)
 		INIT_HLIST_HEAD(&list[i]);
-	pr_info("Security Framework initialized\n");
 
 	/*
 	 * Load minor LSMs, with the capability module always first.
-- 
2.17.1


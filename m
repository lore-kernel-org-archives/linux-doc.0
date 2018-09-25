Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 205657D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:21:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbeIYGXY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:23:24 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39943 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbeIYGXY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:23:24 -0400
Received: by mail-pf1-f195.google.com with SMTP id s5-v6so2137856pfj.7
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qTlAiVyKmDi3nh8j1vnhRyGyfYh9dCrYAglaiQr2kEE=;
        b=Q4TLlttf9SWn5R1kA4WKpqdKlAuU/moC7pj+yvqlTzhZ9TjtdSCLF5usqIPtccSGoi
         OZy0pj6ErE+sjgLo47Aab7JIt8McPZewwEjok1ZFsQKb8RuaobSqi5WmzDB4ZMNZNU3u
         kOTs9NQ4HosS561qozeDshv+3XH966lxETk+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qTlAiVyKmDi3nh8j1vnhRyGyfYh9dCrYAglaiQr2kEE=;
        b=Dv9nEYHz97MHyX7Fn2KEgo9lpRMc2JWHP7qMeYakmkohb+AOVA2aufEEylNZ905C6w
         9DLteu6Y9jH311JgyuQZY0LyylbMj7OSiWSI1cNbEhYzFz0Z4RYGN1QULHxkRefnamIb
         fQk9itB2HGvxzIVahmuSYm5HUiB9mOm9Nf5yBB5gguOq8UWmRSg83REhj90jpuYRcNsO
         5PUUCtn8XOhXDICEUTMtfRMhHcKj3VHJSgk5d/hTIzSxC0SSUR1yX1n1qlSnoWs0WKf+
         lsU5yiCIiljGDWv2Z+9FpwHLR4u9XzjNlDz1mB0AqW3d1JvzroKJSUe85uoB8f4+hTUK
         1ccg==
X-Gm-Message-State: ABuFfohMjKvMLOrOPkYTvP7qVSC+JnLQ9896qdKfk+o4kufX7wkfbox4
        1cLOdREeRMh+r+0yH0uOpSzjLQ==
X-Google-Smtp-Source: ACcGV61BbY+qRvMi0uguvVPD4XNfbPTK2hiuRCRimHQGsL2x+DlosRZLJnDT4FbWIxBqTfLYeiTjLg==
X-Received: by 2002:a17:902:509:: with SMTP id 9-v6mr286688plf.155.1537834718469;
        Mon, 24 Sep 2018 17:18:38 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id f184-v6sm594491pfc.88.2018.09.24.17.18.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Sep 2018 17:18:37 -0700 (PDT)
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
Subject: [PATCH security-next v3 01/29] LSM: Correctly announce start of LSM initialization
Date:   Mon, 24 Sep 2018 17:18:04 -0700
Message-Id: <20180925001832.18322-2-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For a while now, the LSM core has said it was "initializED", rather than
"initializING". This adjust the report to be more accurate (i.e. before
this was reported before any LSMs had been initialized.)

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
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


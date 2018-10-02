Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 494D97D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 00:55:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbeJBHfi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:35:38 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:54528 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbeJBHfi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:35:38 -0400
Received: by mail-it1-f195.google.com with SMTP id l191-v6so968231ita.4
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 17:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IXAQXo8qYO7Phx51B4l5S6pXkNyNEOESCjmeHP9RP9w=;
        b=Bnahr/QLCrNsJ8TWSsahdb+QGVVFBbeR/0nyOsALLqJ2T1glx6C6d0tuDJpXi7fbAF
         PPlxqY6Bck8UXZK7ehNakGpSPOxX5louwwsJaiDYrisK91ErhYgzMImgqRnXwa+k+vkT
         VyYodMohirOBipctB8pO4zCceRDFTfVL+DLKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IXAQXo8qYO7Phx51B4l5S6pXkNyNEOESCjmeHP9RP9w=;
        b=SvtQtJsjd6+HT2cZvX1H3BNvXxdOXCaRs2fr7T7XlmBAaDK01wtZlWyrsM1KjUQUNz
         GoIIfZP8QcroVLgFHs0Ds9tdcov08TjGygvPeNC5iXD7KSPefhWZVc8Wl44fEwj1Cq+9
         ovgb2AMf5mT3vEYF3yY6RKzvPVqaSriDZC0UUW/gMvkJE+8JOvy6KUWctKNwhLS7sECV
         zdDKa0dxgve/vY6FTt8yZybFg64v35VGiUO9Z8Iuws4LTK+wMv/YqeYpaZlHUctsKCYM
         Wz5jOTEDqEPs+Ms1m5lxl8fHPoLxcHI6AfW0Dg81/VCOn8knrn4HcI0NiAFnMVNpK9OE
         C4kQ==
X-Gm-Message-State: ABuFfogKDMOpFq2UyZ9UWvH8RgXlc9QJ7KYT3wEzQvzIWbVQu2I7FbDn
        imbpCsDvKApBLD5n3SYGlq1xnw==
X-Google-Smtp-Source: ACcGV61fF2ffo5hUqIRxzJx+K3m1QqxSM3Gv7EN7ydYx6fijhyJbY+HgSxR+yDBplRklq/QxI6ipaQ==
X-Received: by 2002:a63:f711:: with SMTP id x17-v6mr12313817pgh.322.1538441709615;
        Mon, 01 Oct 2018 17:55:09 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id r205-v6sm20888048pgr.11.2018.10.01.17.55.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Oct 2018 17:55:08 -0700 (PDT)
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
Subject: [PATCH security-next v4 01/32] LSM: Correctly announce start of LSM initialization
Date:   Mon,  1 Oct 2018 17:54:34 -0700
Message-Id: <20181002005505.6112-2-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For a while now, the LSM core has said it was "initializED", rather than
"initializING". This adjust the report to be more accurate (i.e. before
this was reported before any LSMs had been initialized.)

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: James Morris <james.morris@microsoft.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
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


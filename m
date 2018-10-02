Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9D4627D08D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 00:55:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbeJBHfj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:35:39 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:36870 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbeJBHfi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:35:38 -0400
Received: by mail-it1-f193.google.com with SMTP id m9-v6so1078968ita.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 17:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bIT+tXwbFhC2CafNKpV0+tN2sDk8GJo0u4BK9sb0Eh8=;
        b=Tz8qvHp3hxRFPV0bnG5Hj58E41gyvJnQh2r8vAH0P1D9HJAGjJEa3X6evdDXXGuuAS
         gmRQFCMre0fPm25KWaO7GeovUmXyx2F365gyFoYts9mQ/5aZaFlCGJEYQrMNbNE4ELQo
         bTBSoKvA7W/jq34KzqhNGno+0vWrFevvrDdZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bIT+tXwbFhC2CafNKpV0+tN2sDk8GJo0u4BK9sb0Eh8=;
        b=ZmftBKH5jlrluch09PuUNwPMH1iO2DkM63tfn5c0bG/uAeNgiMZ0kjKgluDayjYysf
         9Y0YrEBhpVPFlDEiJK2h3LH/y04nAJu1UNZoowkju+ZeupmAJh6D2qdG7o9/Cv/BHJ1V
         To9CqmcsTPDLmRJJyaJm39OysP6nVLc3pAwjL6TTo0DzAYUmfx7/wk441m0VnKXdJ9fH
         ivk3U/V4rp/jcdWQApXt5teGQxDGjkS47Cvw4B9XNM2WDrwW8L3VK6pkUwI3nV9Gqs4n
         4fGTISYcss18tIfU1bQZkJ+U9nb/9SHAA9y1r0KBnV6xflDPZIRqBNnlLWxhZI9Fd+UN
         MeOQ==
X-Gm-Message-State: ABuFfoio2EPFQ3swPxSDwg2wdgKTVWdvVA6FoK5Yt5B1n6Io3Jk1Mkzl
        ZY/jHjidcvjCK+5nficgu1IAQRZUvdA=
X-Google-Smtp-Source: ACcGV60a/X/a9MvokUO2/Y1Oz2x2K9ojPHg9s7U5exN/J2alUEsp0qSlBZ4iMJWE05KUN6kxefI81Q==
X-Received: by 2002:a63:6054:: with SMTP id u81-v6mr12048973pgb.74.1538441710527;
        Mon, 01 Oct 2018 17:55:10 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id r1-v6sm20166862pff.145.2018.10.01.17.55.07
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
Subject: [PATCH security-next v4 04/32] LSM: Remove initcall tracing
Date:   Mon,  1 Oct 2018 17:54:37 -0700
Message-Id: <20181002005505.6112-5-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This partially reverts commit 58eacfffc417 ("init, tracing: instrument
security and console initcall trace events") since security init calls
are about to no longer resemble regular init calls.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/security.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/security/security.c b/security/security.c
index 892fe6b691cf..41a5da2c7faf 100644
--- a/security/security.c
+++ b/security/security.c
@@ -30,8 +30,6 @@
 #include <linux/string.h>
 #include <net/flow.h>
 
-#include <trace/events/initcall.h>
-
 #define MAX_LSM_EVM_XATTR	2
 
 /* Maximum number of letters for an LSM name string */
@@ -47,17 +45,13 @@ static __initdata char chosen_lsm[SECURITY_NAME_MAX + 1] =
 
 static void __init do_security_initcalls(void)
 {
-	int ret;
 	initcall_t call;
 	initcall_entry_t *ce;
 
 	ce = __start_lsm_info;
-	trace_initcall_level("security");
 	while (ce < __end_lsm_info) {
 		call = initcall_from_entry(ce);
-		trace_initcall_start(call);
-		ret = call();
-		trace_initcall_finish(call, ret);
+		call();
 		ce++;
 	}
 }
-- 
2.17.1


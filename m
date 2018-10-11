Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8717C7D8D7
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 00:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbeJKHnc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 03:43:32 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38464 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbeJKHna (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Oct 2018 03:43:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id f29-v6so3446206pff.5
        for <linux-doc@vger.kernel.org>; Wed, 10 Oct 2018 17:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6eNmHSp4+Q45IaDkZQNXs6+kAcMRIeE3x4RWtQQ9mBQ=;
        b=DYvDVjc7Xan2EP/iEUqXrj2yKnSYlFhkr34DGSQencgIOy831Os9HD8kGEcDUqRW2h
         UOL8vxl7DRRzpkbIlRy98nY2vb37prMlBtAdV5CW1oBx4Fcq9fOA0MMLfYvLGRJNoexU
         bCKXaqd5HJ3BxFRz5OUOZpuy6tl1f0EMKGnbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6eNmHSp4+Q45IaDkZQNXs6+kAcMRIeE3x4RWtQQ9mBQ=;
        b=KBVb7MCJDuJATa9PqJXvPHvxPv5IV9dcpw+gzi1Xux4b0hLHqTwNmiG5tPlsPusBrk
         BGArwex97KhCcMUiFQCeelbKXKc9g4zy3+Za1V47k71sfsoR19mR5GOvarOLbr9a1t9H
         ICGKn+GrE2xhEPlVwTA16/lSYmXtXlN/YSaSCnMEkTo19oPZwz7Xw9HrZ9NO15eNAK04
         ts9G9HATz39AsL9QEYe9hxdFkZEn96f4aG0L722dYDZm6nNJqYPoaUU1ca4xdsojvUy8
         YbHswlYfNTIZ+dQ8wNoLRTCLuDbxbS4ikfabSSuaSWMGcnC6fhroHZLf4yOZiFLsv5cI
         Z9Mg==
X-Gm-Message-State: ABuFfohuY5jO8VdwRi03Gdbwem9oS+0DJnzXgNvtcWhWgpVkf1mBgs/i
        CvZznARx6Hc2UNTz0SJqFZ7Z+Q==
X-Google-Smtp-Source: ACcGV63dDeOHLSBcNV01IpVUAP0l7q9lWEPVHsR2O3jUsO5dLyP0b5mqaSyhlTir4maRP3nKsSTw+g==
X-Received: by 2002:a63:5605:: with SMTP id k5-v6mr31688220pgb.189.1539217135713;
        Wed, 10 Oct 2018 17:18:55 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id 72-v6sm49719749pfr.115.2018.10.10.17.18.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Oct 2018 17:18:52 -0700 (PDT)
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
Subject: [PATCH security-next v5 04/30] LSM: Remove initcall tracing
Date:   Wed, 10 Oct 2018 17:18:20 -0700
Message-Id: <20181011001846.30964-5-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011001846.30964-1-keescook@chromium.org>
References: <20181011001846.30964-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This partially reverts commit 58eacfffc417 ("init, tracing: instrument
security and console initcall trace events") since security init calls
are about to no longer resemble regular init calls.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: James Morris <james.morris@microsoft.com>
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


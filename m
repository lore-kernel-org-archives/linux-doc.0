Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C29807D87C
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbeITWIA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:08:00 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34902 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbeITWIA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:08:00 -0400
Received: by mail-pf1-f195.google.com with SMTP id p12-v6so4619412pfh.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HAekkvj+upuXCbRczMVdl859lF9VoTKVAjIU/VJ2coM=;
        b=QfxwvVp8tome4GK1jZVeIc9mB7z/4XM7KhcwWc279YFu1tRN6sQ/MZCqtZjreQ6xiE
         LQuHejng8P2HpZMrD4oJhARbDCcKXyAKv1A/tYHOqf7NRN37Mn6HzCuThF78wuNzMinJ
         AYPsa4SZ5AtoWzI9vYzGRSlh2u4Qe4YSN8ZVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HAekkvj+upuXCbRczMVdl859lF9VoTKVAjIU/VJ2coM=;
        b=gXR2BUxieE40phVIT08E3shLZNgG+nKFQOvexBRJWSvpduJv2T8OBitBCYVbCDccKC
         chWZM2KFWOLeGceEwsUq6s2EPg0lMm2fFkpHL1Cd3NkrStqS7qQ9iHJKxrcSYwkW52sj
         zQSyllHoiHdgOEyGojcZoP8ZpcEd1U05TQefjQabfvuEhCvirhCZW6nmBkyhZCqul9Jz
         J5KTHn3brNoCpDNusC6mG4juF68ncpSDrZh3YpLTi1Ti/9P6lNexX5acUnfSUWWbQSCf
         oBNIyg1SGZZptLtzTT3Ieh6OWYs/bwsp1m+5oD7esMkFliKa1lve9wIkiBQ4nE0g/pZq
         /seQ==
X-Gm-Message-State: APzg51BDZI319hay555pV6APgQDsBp0rACqMNnhJFMJbMdXWHeOqUPQy
        69uKLUtBOswJwR56fIL55v7JtA==
X-Google-Smtp-Source: ANB0VdaLGaDTdYZ+gaoCAYoLtM95f6E7F0R+Yx3SsZgG8m8OHAeuEDYEanCZYNIk0v/TfAhThYTHoQ==
X-Received: by 2002:a65:66d4:: with SMTP id c20-v6mr34957476pgw.55.1537460624804;
        Thu, 20 Sep 2018 09:23:44 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id 185-v6sm38786730pge.82.2018.09.20.09.23.43
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
Subject: [PATCH security-next v2 04/26] LSM: Remove initcall tracing
Date:   Thu, 20 Sep 2018 09:23:16 -0700
Message-Id: <20180920162338.21060-5-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This partially reverts commit 58eacfffc417 ("init, tracing: instrument
security and console initcall trace events") since security init calls
are about to no longer resemble regular init calls.

Signed-off-by: Kees Cook <keescook@chromium.org>
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


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 155DD7D584
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:33:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbeITWNx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:13:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33563 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727680AbeITWNx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:13:53 -0400
Received: by mail-pf1-f194.google.com with SMTP id d4-v6so4633471pfn.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1R3OyL5qZwtVctuoKGY5KtAiw4R0ChLxsIprVubIdKY=;
        b=cA2l9yp59kBSM66Ek4dMpVBzmjS7OG6j+25ylPsFYwXzqkxEtpMvK6SDkZX3dOIcIu
         mrm1eg624plsw7/ZZKLEZnBJbvTnhPCkZQYgZLEKEgHngwO8enaDtRK5tTaC1emHaP5x
         YcwoB9yIPKsJV2Tg/RHhGh/a4OEeQ/q3PVUl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1R3OyL5qZwtVctuoKGY5KtAiw4R0ChLxsIprVubIdKY=;
        b=c2nwT4p7DPcjdhQdIJvMAlhWrdbnlam0na/EeQwyqnmIrrDqb1YOJsYz3TvLW1pnQ+
         UwbtUB0Au5x3JBXKog8n1+yVVXjZE5NZi4/PvNdGsxmTGUfkME0mMVI4uk1KAZFb6iRV
         XiaJQsHa39EwCclcfTIcZEkq7xK5ytWQQwuP8QUts8u17j10fd1sRGUbX8MGAI5/U8yU
         vJiu1vsUgykIwhj74Wo3jJEWF+/6GvdbEevYOfKBav5pc6l5WHd0TVTY6yc5v/Scl8ck
         AIwieKXMKUdCJGltIkNvs/D+ty9kqsKWOq9hStXjDTlfRkLw76CAan+u3Xa61VE808UV
         96DA==
X-Gm-Message-State: APzg51C0c4dhUsDHMdSOE5XzPAU4CyqOfvIBZx1twKHAto2616DDHune
        KEdeVDdTgnM4aoHvMhd8c+jBwQ==
X-Google-Smtp-Source: ANB0VdaCGJFsG0abGS3ayfdSrynwn6t5dkQ3yO8PdUO2g3QQMkoeUCg4ag80XRiM4VXRM9lKq9+dNg==
X-Received: by 2002:a65:41c6:: with SMTP id b6-v6mr38007537pgq.174.1537460975559;
        Thu, 20 Sep 2018 09:29:35 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id 77-v6sm30867694pga.40.2018.09.20.09.29.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Sep 2018 09:29:34 -0700 (PDT)
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
Subject: [PATCH security-next v2 24/26] capability: Mark as LSM_ORDER_FIRST
Date:   Thu, 20 Sep 2018 09:23:36 -0700
Message-Id: <20180920162338.21060-25-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This converts capabilities to use the new LSM_ORDER_FIRST position.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/lsm_hooks.h | 2 --
 security/commoncap.c      | 8 +++++++-
 security/security.c       | 5 -----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index bf29851baf47..8e843eaacffb 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2098,6 +2098,4 @@ static inline void security_delete_hooks(struct security_hook_list *hooks,
 #define __lsm_ro_after_init	__ro_after_init
 #endif /* CONFIG_SECURITY_WRITABLE_HOOKS */
 
-extern void __init capability_add_hooks(void);
-
 #endif /* ! __LINUX_LSM_HOOKS_H */
diff --git a/security/commoncap.c b/security/commoncap.c
index 2e489d6a3ac8..7a6abaec65de 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -1366,10 +1366,16 @@ struct security_hook_list capability_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(vm_enough_memory, cap_vm_enough_memory),
 };
 
-void __init capability_add_hooks(void)
+static int __init capability_init(void)
 {
 	security_add_hooks(capability_hooks, ARRAY_SIZE(capability_hooks),
 				"capability");
+	return 0;
 }
 
+DEFINE_LSM(capability)
+	.order = LSM_ORDER_FIRST,
+	.init = capability_init,
+END_LSM;
+
 #endif /* CONFIG_SECURITY */
diff --git a/security/security.c b/security/security.c
index d649e7dea4c4..a40e938db1b0 100644
--- a/security/security.c
+++ b/security/security.c
@@ -259,11 +259,6 @@ int __init security_init(void)
 		}
 	}
 
-	/*
-	 * Load minor LSMs, with the capability module always first.
-	 */
-	capability_add_hooks();
-
 	/* Load LSMs in specified order. */
 	prepare_lsm_order();
 	ordered_lsm_init();
-- 
2.17.1


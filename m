Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 60A8B7E3FF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388033AbeITWOu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:14:50 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34164 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731454AbeITWNx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:13:53 -0400
Received: by mail-pf1-f195.google.com with SMTP id k19-v6so4630695pfi.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tsetHmbHtbB8Q2wYkAKstIlnga8YtXpHnQUIrVUO534=;
        b=ZBHtfier3glAHL8I5BrGe6Wb7UgenNswMqxrBqIh4mKU+MXH4UwkhbAXFjotqtMk+Y
         CSEmOC5N7WdwHBO/GDuoVxlzU1mctr+yLIlZv3EmgetiSQiO3rCXCzsGnTVccg057NVq
         cN51eqbqqnp6+kZwFHW+DHcrqje/6IZPIKZT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tsetHmbHtbB8Q2wYkAKstIlnga8YtXpHnQUIrVUO534=;
        b=CLWqk07MNQGCnMm06Z0lK5lWQvAKiIhYesQdQ7hgKmFUifoHr4oLZcDxewDEIBfjsO
         nNEjzVes8ss9xkjoAd/9RXEEswHAec2LJGrv2Q81chFr+W6QrZwyz362EUsBgq9NE14x
         qbMfUPoQd8Hoq0+M4vwLXx+9qKg8zx9dBitZ2QF9xyIIDiBKGFnJXBiWW64KPdsYsHIW
         ALC1Yz8Ov+W8Y2TPr5udGLmT1SRYuGe5Nr56Z0digrSTdbt4dPHLQyp+qTz65IPdpaV8
         gSemDkuEE6SVN9CE34b/cbMS6g7gR+ShK7k7htGg8I9OSje2LXZdAxYe96bf79CPvI/8
         JtOQ==
X-Gm-Message-State: APzg51C2rp3jJL2RvGmIyZdzkuYbeKzkLXCya0Jm17kewX08N5qrK4pz
        4Xj1aD/SGuAePJx7aKe0/dpEFw==
X-Google-Smtp-Source: ANB0VdZNvMD9myH4I88djpe+yI51TlOnU02qnnGGHQlE4SttFxcjWLPSVeO42jR8q0fSeC3w04knqg==
X-Received: by 2002:a63:fb57:: with SMTP id w23-v6mr37541095pgj.441.1537460976381;
        Thu, 20 Sep 2018 09:29:36 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id p73-v6sm43149286pfk.186.2018.09.20.09.29.34
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
Subject: [PATCH security-next v2 21/26] LoadPin: Initialize as ordered LSM
Date:   Thu, 20 Sep 2018 09:23:33 -0700
Message-Id: <20180920162338.21060-22-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This converts LoadPin from being a direct "minor" LSM into an ordered LSM.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/lsm_hooks.h  |  5 -----
 security/Kconfig           |  2 +-
 security/loadpin/loadpin.c | 10 ++++++++--
 security/security.c        |  1 -
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index ec1c0a97dfe3..7a38ffdd690f 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2097,10 +2097,5 @@ extern void __init yama_add_hooks(void);
 #else
 static inline void __init yama_add_hooks(void) { }
 #endif
-#ifdef CONFIG_SECURITY_LOADPIN
-void __init loadpin_add_hooks(void);
-#else
-static inline void loadpin_add_hooks(void) { };
-#endif
 
 #endif /* ! __LINUX_LSM_HOOKS_H */
diff --git a/security/Kconfig b/security/Kconfig
index de8202886c1d..f2003bd03ef6 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -278,7 +278,7 @@ config DEFAULT_SECURITY
 
 config LSM_ORDER
 	string "Default initialization order of builtin LSMs"
-	default "integrity"
+	default "loadpin,integrity"
 	help
 	  A comma-separated list of LSMs, in initialization order.
 	  Any LSMs left off this list will be link-order initialized
diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
index 0716af28808a..e638fba7363d 100644
--- a/security/loadpin/loadpin.c
+++ b/security/loadpin/loadpin.c
@@ -184,12 +184,18 @@ static struct security_hook_list loadpin_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(kernel_load_data, loadpin_load_data),
 };
 
-void __init loadpin_add_hooks(void)
+static int __init loadpin_init(void)
 {
-	pr_info("ready to pin (currently %sabled)", enabled ? "en" : "dis");
+	pr_info("ready to pin\n");
 	security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks), "loadpin");
+	return 0;
 }
 
+DEFINE_LSM(loadpin)
+	.enabled = &enabled,
+	.init = loadpin_init,
+END_LSM;
+
 /* Should not be mutable after boot, so not listed in sysfs (perm == 0). */
 module_param(enabled, int, 0);
 MODULE_PARM_DESC(enabled, "Pin module/firmware loading (default: true)");
diff --git a/security/security.c b/security/security.c
index 4db194f81419..9ffb76b7655b 100644
--- a/security/security.c
+++ b/security/security.c
@@ -246,7 +246,6 @@ int __init security_init(void)
 	 */
 	capability_add_hooks();
 	yama_add_hooks();
-	loadpin_add_hooks();
 
 	/* Load LSMs in specified order. */
 	prepare_lsm_order();
-- 
2.17.1


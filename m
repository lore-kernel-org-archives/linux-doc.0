Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 55C1F7DD50
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbeIYGZA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:25:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45276 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728617AbeIYGXc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:23:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id t70-v6so5308986pgd.12
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6EfxT0zcae6A5rzLbELC2IqQ09YDT4L0Am/o9GdvmCQ=;
        b=ca8HuJEN8GvhdrrGWOJGHlywVNTjjXI23kAJOqur2gPvgJq4UX3WPgibnW/GvLJ6LX
         sBljd7tWuue+7KP85zge+rgxoKYQ7HtIsfSzJedqK/WdiGbpKo6YLJJRwGLnz8V5oDlO
         LNqPGr1y0SSZvAPde8tK7oZ9JRyQ2MKjS1bt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6EfxT0zcae6A5rzLbELC2IqQ09YDT4L0Am/o9GdvmCQ=;
        b=Zr7P+kH/E5Y9vNqqsCOWmORMJoxF9l1JrJDu9V67XCtaJ1WaCKJhdjIZEFrsasanKO
         4urSvsBXkMeH6xH8EiNlBKJ8QWetzzKRW5ThpmwNjumflcXovMk3xujHE4hKCa+F5V/F
         dLC8CQMv8fcRkIe5n4G/pcSs3w4j1ananoHMUEtD+iY21+1TjeDPrbWjSIDQA/LNGgGF
         /ckLMIFv5SMqnq3j8iMTlQrhvZyuCwgGdhYESM+K8ZGIFzwexXsIqDzrhNmTBrlsCUQK
         GZzaSUv1xQx586wTvvujj8fOzzlVrWmQ4XwFB83y47gzWX7kvCqbyQHbUtyQL6ZjhApB
         pLJw==
X-Gm-Message-State: ABuFfoiPNHGCUXH9KTwgdnwwrfFJCklle1EtrcJHYa3q+G36rxEGVHT6
        k7IoIEjpmjI5LO/zjGFGBriiKg==
X-Google-Smtp-Source: ACcGV61sgt2d0oFLTpcaL284CJN9GYkgWTcz9hrEiYPZ5KRo/A/eEWo/lu+MeTxLrEIDpJQw98EHPQ==
X-Received: by 2002:a63:700e:: with SMTP id l14-v6mr860909pgc.359.1537834726429;
        Mon, 24 Sep 2018 17:18:46 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id a75-v6sm540713pfa.124.2018.09.24.17.18.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Sep 2018 17:18:42 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     James Morris <jmorris@namei.org>
Cc:     Kees Cook <keescook@chromium.org>,
        John Johansen <john.johansen@canonical.com>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH security-next v3 07/29] LSM: Convert security_initcall() into DEFINE_LSM()
Date:   Mon, 24 Sep 2018 17:18:10 -0700
Message-Id: <20180925001832.18322-8-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Instead of using argument-based initializers, switch to defining the
contents of struct lsm_info on a per-LSM basis. This also drops
the final use of the now inaccurate "initcall" naming.

Cc: John Johansen <john.johansen@canonical.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Stephen Smalley <sds@tycho.nsa.gov>
Cc: Casey Schaufler <casey@schaufler-ca.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: linux-security-module@vger.kernel.org
Cc: selinux@tycho.nsa.gov
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/lsm_hooks.h  | 6 ++++--
 security/apparmor/lsm.c    | 4 +++-
 security/integrity/iint.c  | 4 +++-
 security/selinux/hooks.c   | 4 +++-
 security/smack/smack_lsm.c | 4 +++-
 security/tomoyo/tomoyo.c   | 4 +++-
 6 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index ad04761e5587..02ec717189f9 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2045,11 +2045,13 @@ struct lsm_info {
 
 extern struct lsm_info __start_lsm_info[], __end_lsm_info[];
 
-#define security_initcall(lsm)						\
+#define DEFINE_LSM(lsm)							\
 	static struct lsm_info __lsm_##lsm				\
 		__used __section(.lsm_info.init)			\
 		__aligned(sizeof(unsigned long))			\
-		= { .init = lsm, }
+		= {							\
+
+#define END_LSM	  }
 
 #ifdef CONFIG_SECURITY_SELINUX_DISABLE
 /*
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 8b8b70620bbe..7fa7b4464cf4 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1606,4 +1606,6 @@ static int __init apparmor_init(void)
 	return error;
 }
 
-security_initcall(apparmor_init);
+DEFINE_LSM(apparmor)
+	.init = apparmor_init,
+END_LSM;
diff --git a/security/integrity/iint.c b/security/integrity/iint.c
index 70d21b566955..20e60df929a3 100644
--- a/security/integrity/iint.c
+++ b/security/integrity/iint.c
@@ -175,7 +175,9 @@ static int __init integrity_iintcache_init(void)
 			      0, SLAB_PANIC, init_once);
 	return 0;
 }
-security_initcall(integrity_iintcache_init);
+DEFINE_LSM(integrity)
+	.init = integrity_iintcache_init,
+END_LSM;
 
 
 /*
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index ad9a9b8e9979..469a90806bc6 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -7202,7 +7202,9 @@ void selinux_complete_init(void)
 
 /* SELinux requires early initialization in order to label
    all processes and objects when they are created. */
-security_initcall(selinux_init);
+DEFINE_LSM(selinux)
+	.init = selinux_init,
+END_LSM;
 
 #if defined(CONFIG_NETFILTER)
 
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 340fc30ad85d..1e1ace718e75 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4882,4 +4882,6 @@ static __init int smack_init(void)
  * Smack requires early initialization in order to label
  * all processes and objects when they are created.
  */
-security_initcall(smack_init);
+DEFINE_LSM(smack)
+	.init = smack_init,
+END_LSM;
diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index 9f932e2d6852..a280d4eab456 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -550,4 +550,6 @@ static int __init tomoyo_init(void)
 	return 0;
 }
 
-security_initcall(tomoyo_init);
+DEFINE_LSM(tomoyo)
+	.init = tomoyo_init,
+END_LSM;
-- 
2.17.1


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5AD3B7D082
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 00:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbeJKHn2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 03:43:28 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41804 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbeJKHn2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Oct 2018 03:43:28 -0400
Received: by mail-pf1-f195.google.com with SMTP id m77-v6so3436504pfi.8
        for <linux-doc@vger.kernel.org>; Wed, 10 Oct 2018 17:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BNwJMOTTBg+xIR0Zs6W8eU/Z+0Zh4DQ+gRWYfOJdHJk=;
        b=eswuuMyUcqsBjLTBfAB22g9uhe1PlJ8+V/+KeDKDtQQX4iBQuW1eOEKeqzSReQQSaM
         EndljOTeVmhtFg8Y6C9BnvuOOSU0eHaz+xjkWESbjrCvyGdGTOzW2lnF6H0X1jQCdmwq
         ItsjiPNv7g08aVWXJvoW3MYJA84QSOLjysRrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BNwJMOTTBg+xIR0Zs6W8eU/Z+0Zh4DQ+gRWYfOJdHJk=;
        b=fhIq0LA/tpNtJapeK/sNySEMsejv9yEME56YhA7GGAhTXDB+H0XCDxlDNeOgKdclAv
         BMdSY0YVEiKQdmHajFC6Ac47SiaVxCxhl2F3S9RjaWNs+JMLQgLpBOux5EVdHnIEIcEZ
         /Tftv1sJHeCnigYi0VLa4p96/ACUTXRrMUbc3rYlg6lxm+H/7ysMIuosyvKaeX8kWT8T
         aO9n9XeQVZjYZg2WkVp4MhduweqxQZzhuvt9B+bcn0nKWylqQmlFGw/X2Q5n03sqV9Xi
         +R7Bd+0B/sYuxPTPqWedhQbm8UP297Pv0Rl3m15ckK0oeVf8rdtAPr4kGnQRtME4l13Q
         regQ==
X-Gm-Message-State: ABuFfogKrAtlHQxyrU89Z2kdRbmdfoeDEobWZztS6amsdv8Sw0VoN6qd
        DmWVEKCjie0tN2OZKuxxNz2neg==
X-Google-Smtp-Source: ACcGV60R0wKzvkdI8mQ1Qw4xoZj8qzhNGByRSzvOxOWIR3tU81mhVfzxBcRPL9cm6vs7aeQ+Ww2Lgw==
X-Received: by 2002:a63:d502:: with SMTP id c2-v6mr31625882pgg.324.1539217133914;
        Wed, 10 Oct 2018 17:18:53 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id 189-v6sm40061286pfe.121.2018.10.10.17.18.52
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
Subject: [PATCH security-next v5 03/30] LSM: Rename .security_initcall section to .lsm_info
Date:   Wed, 10 Oct 2018 17:18:19 -0700
Message-Id: <20181011001846.30964-4-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011001846.30964-1-keescook@chromium.org>
References: <20181011001846.30964-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In preparation for switching from initcall to just a regular set of
pointers in a section, rename the internal section name.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: James Morris <james.morris@microsoft.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
---
 include/asm-generic/vmlinux.lds.h | 10 +++++-----
 include/linux/init.h              |  4 ++--
 security/security.c               |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 934a45395547..5079a969e612 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -787,14 +787,14 @@
 		__con_initcall_end = .;
 
 #define SECURITY_INITCALL						\
-		__security_initcall_start = .;				\
-		KEEP(*(.security_initcall.init))			\
-		__security_initcall_end = .;
+		__start_lsm_info = .;					\
+		KEEP(*(.lsm_info.init))					\
+		__end_lsm_info = .;
 
 /* Older linker script style for security init. */
 #define SECURITY_INIT							\
-	.security_initcall.init : AT(ADDR(.security_initcall.init) - LOAD_OFFSET) { \
-		SECURITY_INITCALL					\
+	.lsm_info.init : AT(ADDR(.lsm_info.init) - LOAD_OFFSET) {	\
+		LSM_INFO						\
 	}
 
 #ifdef CONFIG_BLK_DEV_INITRD
diff --git a/include/linux/init.h b/include/linux/init.h
index 2538d176dd1f..77636539e77c 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -133,7 +133,7 @@ static inline initcall_t initcall_from_entry(initcall_entry_t *entry)
 #endif
 
 extern initcall_entry_t __con_initcall_start[], __con_initcall_end[];
-extern initcall_entry_t __security_initcall_start[], __security_initcall_end[];
+extern initcall_entry_t __start_lsm_info[], __end_lsm_info[];
 
 /* Used for contructor calls. */
 typedef void (*ctor_fn_t)(void);
@@ -236,7 +236,7 @@ extern bool initcall_debug;
 	static exitcall_t __exitcall_##fn __exit_call = fn
 
 #define console_initcall(fn)	___define_initcall(fn,, .con_initcall)
-#define security_initcall(fn)	___define_initcall(fn,, .security_initcall)
+#define security_initcall(fn)	___define_initcall(fn,, .lsm_info)
 
 struct obs_kernel_param {
 	const char *str;
diff --git a/security/security.c b/security/security.c
index 4cbcf244a965..892fe6b691cf 100644
--- a/security/security.c
+++ b/security/security.c
@@ -51,9 +51,9 @@ static void __init do_security_initcalls(void)
 	initcall_t call;
 	initcall_entry_t *ce;
 
-	ce = __security_initcall_start;
+	ce = __start_lsm_info;
 	trace_initcall_level("security");
-	while (ce < __security_initcall_end) {
+	while (ce < __end_lsm_info) {
 		call = initcall_from_entry(ce);
 		trace_initcall_start(call);
 		ret = call();
-- 
2.17.1


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0FD2D7DE79
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731043AbeITWIC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:08:02 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40300 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731026AbeITWIB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:08:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id l63-v6so4667705pga.7
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7oLt+UyUV2ENUMfahE30oZMAbkN/vc8yjBSX4FMTFtA=;
        b=CuQtP/EXRBI//RpTHKKpycLO/IuoqXvrZC29yhw6dIITEnaRncBsaCbUxjj4bs/WXZ
         9xTHNF0iCjJz6cj4MtGp14Eb5NImNKDCaPwFoYIGh9iDemUcePAtn85+nR/Y/PiTrCGu
         dcINqEWU/5IESVCvgaYIl/FxjP6PQVMzc7qDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7oLt+UyUV2ENUMfahE30oZMAbkN/vc8yjBSX4FMTFtA=;
        b=YH/tsl3nwhOlswYdiWgB0eofkWXhTrnzVdmcl7RMwbU+CmLSuaYdcK3YUyvenqXKyB
         ZkbKtsrAO93OWipMl6+WIDZhg1eBAriaUzojuSTrKHeIdNh1pHSg7a2/MtJStBC+Y8HQ
         Oa0Zrsfk6kr1XgyPY6U9laksUv5eFeMWBEXET3Enqb8N97r7lz2vUGCd4Iq/Q0NHlSPc
         lofi3a/8Lrn1ALy0PYpLx9Wbzwa+5ziCb417KYl2xwd0CYc49qNDfMh953kMRUyzC6OD
         IrkeENjH/5zrY2mpnmZBrH6cqR9YqjEySLPl5JytlGuovReNRIRKpJZYgmr5mjPP0MFK
         2OYw==
X-Gm-Message-State: APzg51DicsGyHg7bs24LcJBBYOg+723SBG+6xBzQrpaA3NG52woTuQhj
        XDKqZcf3E7dapQH90QFIrZLhHw==
X-Google-Smtp-Source: ANB0VdYk8MDlvFWW3vhFoXMGFTOa4QnAcK1x5dAggknC151k9hQ485/C2dOd9iulD/7cR9TgSW+GFw==
X-Received: by 2002:a62:c4da:: with SMTP id h87-v6mr42252838pfk.39.1537460626529;
        Thu, 20 Sep 2018 09:23:46 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id i76-v6sm9501380pgc.20.2018.09.20.09.23.43
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
Subject: [PATCH security-next v2 03/26] LSM: Rename .security_initcall section to .lsm_info
Date:   Thu, 20 Sep 2018 09:23:15 -0700
Message-Id: <20180920162338.21060-4-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In preparation for switching from initcall to just a regular set of
pointers in a section, rename the internal section name.

Signed-off-by: Kees Cook <keescook@chromium.org>
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


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 027FC7DE7B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:20:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728492AbeIYGXa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:23:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43010 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728282AbeIYGX2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:23:28 -0400
Received: by mail-pf1-f196.google.com with SMTP id j26-v6so9907807pfi.10
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SJSMq1IylsdmDC6tKe2QXG4rx4NTxkWXmcEscNNPrNQ=;
        b=UpIzsCl5FvnGIXOYOS5hU7C0YL8/S4Y7+Iu2kiG/v6so5wwTQXrzw35wrpyCpEL897
         sxUfG0q2+0cUvDcYRWkPSiOyVJk4YQGr/pZwOUo4ipAp+aFACSLSOnU3azlAGxzkPNj7
         mpW7AWWrtVaksxrjiVZSpG+Ewns9rmBDjgwRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SJSMq1IylsdmDC6tKe2QXG4rx4NTxkWXmcEscNNPrNQ=;
        b=FxySTawJpkfTXFmwd5sxfaooTHy0alUcdrjDzoQQ59+sW1qngOBv7/c8Hx9hrrynFE
         1nG/AAfkSzj3mSkvVOGw2tjlpIPxxnSKrFNwdu4eriDlu4YDQeZHl7yeq6XJW3I4W/rR
         td09Z4reDRoLqvnjw7qx86ScTTBFXHR8yW6FfmkLhq9dqSWGUsSI7aUved/BYJfnZ2cH
         yXYjIOaFYxlp6UV7dNR9hr92nUhTwbFeQJBamrFxHgjGtAPNk2s7fugnACzCIcuS703b
         G9F725NKIYE4KLpOTEAAGSVL4yv/t2DGtlezPL8ZCuD34qZ5+8tES0WYHWcl+FwcaJZW
         /AVw==
X-Gm-Message-State: ABuFfogDdMvldEksIjrsU25Svc1RP+SWU814dVzEWxH/hB/bJaXkVulX
        63MDsZf5daz7NshsU3ejPWsh+g==
X-Google-Smtp-Source: ACcGV61mKHO+aF35FoDAEPJrqFH6Bd/hDjOvjLpCfYhZZWXD+Oz2LX6VxlVxJzxlp3g7CAigQgdZPw==
X-Received: by 2002:a17:902:6b44:: with SMTP id g4-v6mr1002294plt.50.1537834722042;
        Mon, 24 Sep 2018 17:18:42 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id h82-v6sm549378pfa.173.2018.09.24.17.18.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Sep 2018 17:18:37 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     James Morris <jmorris@namei.org>
Cc:     Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arch@vger.kernel.org,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH security-next v3 02/29] vmlinux.lds.h: Avoid copy/paste of security_init section
Date:   Mon, 24 Sep 2018 17:18:05 -0700
Message-Id: <20180925001832.18322-3-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Avoid copy/paste by defining SECURITY_INIT in terms of SECURITY_INITCALL.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/asm-generic/vmlinux.lds.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 7b75ff6e2fce..934a45395547 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -473,13 +473,6 @@
 #define RODATA          RO_DATA_SECTION(4096)
 #define RO_DATA(align)  RO_DATA_SECTION(align)
 
-#define SECURITY_INIT							\
-	.security_initcall.init : AT(ADDR(.security_initcall.init) - LOAD_OFFSET) { \
-		__security_initcall_start = .;				\
-		KEEP(*(.security_initcall.init))			\
-		__security_initcall_end = .;				\
-	}
-
 /*
  * .text section. Map to function alignment to avoid address changes
  * during second ld run in second ld pass when generating System.map
@@ -798,6 +791,12 @@
 		KEEP(*(.security_initcall.init))			\
 		__security_initcall_end = .;
 
+/* Older linker script style for security init. */
+#define SECURITY_INIT							\
+	.security_initcall.init : AT(ADDR(.security_initcall.init) - LOAD_OFFSET) { \
+		SECURITY_INITCALL					\
+	}
+
 #ifdef CONFIG_BLK_DEV_INITRD
 #define INIT_RAM_FS							\
 	. = ALIGN(4);							\
-- 
2.17.1


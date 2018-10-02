Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 894747D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 00:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbeJBHhd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:37:33 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:36129 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbeJBHfl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:35:41 -0400
Received: by mail-it1-f195.google.com with SMTP id c85-v6so1090375itd.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 17:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bDWn21iauCiQfJ3Cfx0b4/V/Z6uec1GQQMOYX0nkvvY=;
        b=GAcR6tP9URv886m1xLxqEkbz7YdEIPtmlOXupq5g2EXLl32Y9kAajKKDmJnKpSlbBV
         rLEBx20E5RrgQhPahPVvIDZNhfmaScUj9mX/sjntvnTzTNHuAHznGA7psqHqUnYdsXf9
         7S4K20h9JonYDs+o+8wdIfvtkRVU8XCaqZInk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bDWn21iauCiQfJ3Cfx0b4/V/Z6uec1GQQMOYX0nkvvY=;
        b=kzluDjrwS9FawfPt4irbgIvNVmBrDNHJGOSEs85r/f27FoX9gXx4axMVV3CToS3AHy
         bfbthpKnf3uvKSlQzhU/a5nkraspi1PQ2HVAKQbPltVoY/CFUTACeOov4QEqSwotcoem
         bemOPt8aTL0AbaGxKVYbUKPbFCwIInBJ4gRTEWo/M+pES82o1Mkbw++qQenxV/nBJGyh
         YBt321iBQQDJtMrQdXsijomBBsjBlZWadCg8ud0vjVWCKW+zMB2CDFxXkch3WgGuRLxE
         XvOz69nDeRdTM4jz+sb7i6B7mjWbijfbZ6LLi2ogVIAGxz2Un7Zs89GDHIXCkaj2plJh
         F4sg==
X-Gm-Message-State: ABuFfoiVVXw9Tul8NWDQHKX00E55umdfvz1II4CVfZVQlgLw7PLL6W9y
        t/8QAc0ibiCMgkrLP9V5jBgk2UiKUHc=
X-Google-Smtp-Source: ACcGV61AqGxKtv9I9HjmCYv04cw6b4KEf5MttqybCinUm3ePWLIaBa+yoUlDm4hJymYZNebTGzkDIg==
X-Received: by 2002:a63:9712:: with SMTP id n18-v6mr12323822pge.69.1538441712326;
        Mon, 01 Oct 2018 17:55:12 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id c79-v6sm12054717pfb.147.2018.10.01.17.55.07
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
Subject: [PATCH security-next v4 02/32] vmlinux.lds.h: Avoid copy/paste of security_init section
Date:   Mon,  1 Oct 2018 17:54:35 -0700
Message-Id: <20181002005505.6112-3-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Avoid copy/paste by defining SECURITY_INIT in terms of SECURITY_INITCALL.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: James Morris <james.morris@microsoft.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
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


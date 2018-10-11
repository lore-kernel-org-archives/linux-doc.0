Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C6A6F7D082
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 00:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbeJKHpQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 03:45:16 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36544 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbeJKHn3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Oct 2018 03:43:29 -0400
Received: by mail-pg1-f195.google.com with SMTP id f18-v6so3284442pgv.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Oct 2018 17:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bDWn21iauCiQfJ3Cfx0b4/V/Z6uec1GQQMOYX0nkvvY=;
        b=Xwj7zAd7o3O2JcY0kcZZG4H3ZzsBZN2h22etq7KW5DrBAEz2HFkfKtbV3xYAIj+aoy
         Drhm2j90nYteN293T3dFfQaxzyDgIUEkZRXnG2nT5xu3tGKvV1+m679GQe7WG22M1L3C
         JLDq2NSIwQnYNCgInmj9vRHK2sP4QYPZx5AB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bDWn21iauCiQfJ3Cfx0b4/V/Z6uec1GQQMOYX0nkvvY=;
        b=WBiKJGmvI2w5NFSdLZ105lYCeoDcAgSo5dLPdF+EbuCuzRlGRxjaARV526cKUivjk0
         6x37KiiVEhjafHCpjOyL62Xzg/LdT+gLK25fK6gPC3EkCvO3KazJfPb+ZZsymt7aCtqn
         SuIiaR18PRkjuUCAIcOR+bSVcXe23rJSUcnbdjWdgDDAAk+MpQBtDuIPnOi4bUWtHPfq
         8r/T+j7badZYpjWeehK1QUHWQXMvWjfeFsnY6uTNSHJA4d9kDuyHI96hdlx2IHQlWzWm
         0ud1GEnWSfNl89zYTyszRjRcuVyG5KWveK9Tj7tyQvnsm+U8ykDTtZwzW/l/hQ/6wfQ+
         OPJA==
X-Gm-Message-State: ABuFfojZgCk546XnTEV+zEE3UnpV/KAfHHo74dcyjncXU0cbMKDezkir
        p3mhFmRkK2lrlTWgKz5olovcrA==
X-Google-Smtp-Source: ACcGV612ePGWjZSnSVnkJWI72VTdAwSwjkJBr8Clo+EW8R3IaRuKzQIL3VMJ5iIeFtUhLnj2Xs6/VQ==
X-Received: by 2002:a63:5f03:: with SMTP id t3-v6mr32042429pgb.68.1539217134774;
        Wed, 10 Oct 2018 17:18:54 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id a16-v6sm27290397pfi.49.2018.10.10.17.18.52
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
Subject: [PATCH security-next v5 02/30] vmlinux.lds.h: Avoid copy/paste of security_init section
Date:   Wed, 10 Oct 2018 17:18:18 -0700
Message-Id: <20181011001846.30964-3-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011001846.30964-1-keescook@chromium.org>
References: <20181011001846.30964-1-keescook@chromium.org>
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


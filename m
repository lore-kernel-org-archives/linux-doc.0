Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C9E57DD4C
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 12:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbeLJMvz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 07:51:55 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36346 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727456AbeLJMvQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Dec 2018 07:51:16 -0500
Received: by mail-wr1-f67.google.com with SMTP id u3so10374928wrs.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Dec 2018 04:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=spp1yx5uWvAgxErNR01vKeP4ipxAKNr5cbWijdqL/NI=;
        b=tvsXwVCKLmRdJsM+euD1t0rVUHOOn+/ZTTi3MnnQ9yebryAkbI4hvbPXubAR8j9xbT
         rSzx3Kyplc8mI1Q5cCWawts1mVwnbRT/UG0tp4Xvt5MDVVu5AjP34+MyjU+t6RTFt/1F
         GtjCSp16Bsb0olrw8ju4ga21oFPvQHFAjGiXj06kBSulY2fBvH1/8yimSxJdEzM0IjDe
         S2UHXqy/PlTnElD5PvCE/Ei8NOK6WhW4AzfjK1G4NAKHmzILpvArpdT0x23Ci7QVw1Jf
         siaqLTUGCqHPMIili1iJlbBGd6qfhARL0xDVAgzKR2wFfvkvY0Mi96XrFZLLMJ9KfrPg
         c6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=spp1yx5uWvAgxErNR01vKeP4ipxAKNr5cbWijdqL/NI=;
        b=YiFpvmsRoDAFof4X67+6ac1Gz8yFm9EfQmGCTSoCkoYhDjlobI4xOpukR1Lt8jsSPh
         QZXxRGeY5F3ZQvqKok9+XK9i8859OQ/pzYxfEY7KFryH8T2V1hqHHiC0NQ/3r10n66mC
         nWCsavlBqIHPmH7jxUDX/huJvzC+XUE8Mq73yx52ANvyjl0fmAVpx6NyDBpP1/pyJBKo
         pkFOypn+Ox9TdFyo8zqa8IcZAcmw+eb99fJ198Ji0hwpMFBOKDYGrev9nKwE7gRV1Vy4
         v/IJsPTufScKfV11ULorRhuD/gTJmUiu2A2eB7ntwvb/u+uR+DHJOluaEeme+BFIBPX+
         iQvQ==
X-Gm-Message-State: AA+aEWYiQorw+hDWe8H2F3mrbJbRhsT81xAUKsov5t8I8iCzc7AwdmAg
        MHEtxV5tWtOnfCPXP0Ved9gn0g==
X-Google-Smtp-Source: AFSGD/WK6voMtzDjeOrD0p0dIVtqA5GSBJDXWoYR6ofaTs6wbsSMRcTZb/d4/4QZpcv/PkUOjr5HNQ==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr9182121wrw.316.1544446274117;
        Mon, 10 Dec 2018 04:51:14 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id l197sm36893363wma.44.2018.12.10.04.51.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 04:51:13 -0800 (PST)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v9 3/8] arm64: untag user addresses in access_ok and __uaccess_mask_ptr
Date:   Mon, 10 Dec 2018 13:51:00 +0100
Message-Id: <674252952827b57f4259876cd4ddf802f3539356.1544445454.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.rc2.403.gdbc3b29805-goog
In-Reply-To: <cover.1544445454.git.andreyknvl@google.com>
References: <cover.1544445454.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

copy_from_user (and a few other similar functions) are used to copy data
from user memory into the kernel memory or vice versa. Since a user can
provided a tagged pointer to one of the syscalls that use copy_from_user,
we need to correctly handle such pointers.

Do this by untagging user pointers in access_ok and in __uaccess_mask_ptr,
before performing access validity checks.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/uaccess.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 3c3864ba3cc1..d28c3b1314ce 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -104,7 +104,8 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
 #define untagged_addr(addr)		\
 	((__typeof__(addr))sign_extend64((u64)(addr), 55))
 
-#define access_ok(type, addr, size)	__range_ok(addr, size)
+#define access_ok(type, addr, size)	\
+	__range_ok(untagged_addr(addr), size)
 #define user_addr_max			get_fs
 
 #define _ASM_EXTABLE(from, to)						\
@@ -236,7 +237,8 @@ static inline void uaccess_enable_not_uao(void)
 
 /*
  * Sanitise a uaccess pointer such that it becomes NULL if above the
- * current addr_limit.
+ * current addr_limit. In case the pointer is tagged (has the top byte set),
+ * untag the pointer before checking.
  */
 #define uaccess_mask_ptr(ptr) (__typeof__(ptr))__uaccess_mask_ptr(ptr)
 static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
@@ -244,10 +246,11 @@ static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
 	void __user *safe_ptr;
 
 	asm volatile(
-	"	bics	xzr, %1, %2\n"
+	"	bics	xzr, %3, %2\n"
 	"	csel	%0, %1, xzr, eq\n"
 	: "=&r" (safe_ptr)
-	: "r" (ptr), "r" (current_thread_info()->addr_limit)
+	: "r" (ptr), "r" (current_thread_info()->addr_limit),
+	  "r" (untagged_addr(ptr))
 	: "cc");
 
 	csdb();
-- 
2.20.0.rc2.403.gdbc3b29805-goog


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B2AAC7D8A4
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Feb 2019 12:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfBVMyp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Feb 2019 07:54:45 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46378 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfBVMxf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Feb 2019 07:53:35 -0500
Received: by mail-wr1-f65.google.com with SMTP id i16so2223103wrs.13
        for <linux-doc@vger.kernel.org>; Fri, 22 Feb 2019 04:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LYedl6oW+X0hODfB6yBlRZE+wsBGKemR/gV1w08gXes=;
        b=IZO5qs1iTdFS0J8b6mUPkT96MHj4TvOOl4p+NkYj+K5QoPzgtV+ykf7Zu+OkLcqN2H
         XG3Gh3bG0jBem6M7NTIzz/wK5zl+vCUUNfkfJALSmU8Wj9A1u4sBy3ay4BW4/EmB0HRO
         rjkA4MwD6TdBTXlf++HuBJnMCfJk5iZzI3+4sXCvRuZvNLxSnSX00w7f+r2eMb9tbUeZ
         wKQkxlkxUte2ekBF+Cqk930FiD2BqGhYurasbJZ5Cy6szPm8dYUDDnFl+i7USfSEW4tE
         b+242VIYnFJCUhKNVLIKvM7y8Jwt7Fku92E8DCxmA2ENAr03DmnPf5Nks+jfBd0lKf0N
         y0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LYedl6oW+X0hODfB6yBlRZE+wsBGKemR/gV1w08gXes=;
        b=jwIz9ZYVjBvyt5BEoDEZvwU+tmvyn7HbLLKbbpHTJjuDdY/fJbGiNouNnfitNl826n
         rcfgY0oyk4loR3TqddV/CR1njU1syS3R4jOK6cIOlbBUWfrTOQE6rCoMs6haM4bGLnhR
         TzmvHExrUz63+O0XyAgrT+RupGIElVjAH1bNswNtlQ8VoojKxJszV9JCsxuJTp4N1/YW
         eSGdlR+hJfzNu6eBdfi+pT5qNHo8hFbgLs6on/QOV68PSNdSj3O2lYsodpC+esV74X0K
         TRnRXrvewoKzDJPvlPql/T4JLhqvUjBgsvuAEiu1EfQRhWjyz51czo2GTUwceFZdh4BW
         vDbA==
X-Gm-Message-State: AHQUAubyp8gxG11OmENTJxMqBzan3JbaeELRof/byiczmekz+9pM+8NL
        IN9G8nNRbYjCZ6ku5N2FuZWYHQ==
X-Google-Smtp-Source: AHgI3Ibs8M2cAwjQZj6orbXxkxYi8LGidQwEOKdpOteZ9oefSzL6DNYvYhuV2aOjewxHuzIPLDjC/Q==
X-Received: by 2002:adf:e90b:: with SMTP id f11mr2972186wrm.36.1550840013762;
        Fri, 22 Feb 2019 04:53:33 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:13:8ce:d7fa:9f4c:492])
        by smtp.gmail.com with ESMTPSA id o14sm808209wrp.34.2019.02.22.04.53.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Feb 2019 04:53:32 -0800 (PST)
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
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
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
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v10 02/12] arm64: untag user pointers in access_ok and __uaccess_mask_ptr
Date:   Fri, 22 Feb 2019 13:53:14 +0100
Message-Id: <e069abcfd4d2289a32f0a1e5b13701b99c42f82e.1550839937.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.rc0.258.g878e2cd30e-goog
In-Reply-To: <cover.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
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

Note, that this patch only temporarily untags the pointers to perform the
checks, but then passes them as is into the kernel internals.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/uaccess.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 547d7a0c9d05..9b9291abda88 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -95,7 +95,7 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
 	return ret;
 }
 
-#define access_ok(addr, size)	__range_ok(addr, size)
+#define access_ok(addr, size)	__range_ok(untagged_addr(addr), size)
 #define user_addr_max			get_fs
 
 #define _ASM_EXTABLE(from, to)						\
@@ -227,7 +227,8 @@ static inline void uaccess_enable_not_uao(void)
 
 /*
  * Sanitise a uaccess pointer such that it becomes NULL if above the
- * current addr_limit.
+ * current addr_limit. In case the pointer is tagged (has the top byte set),
+ * untag the pointer before checking.
  */
 #define uaccess_mask_ptr(ptr) (__typeof__(ptr))__uaccess_mask_ptr(ptr)
 static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
@@ -235,10 +236,11 @@ static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
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
2.21.0.rc0.258.g878e2cd30e-goog


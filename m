Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B7E437D87C
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 11:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbeH3PoF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 11:44:05 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:51350 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728237AbeH3PnJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 11:43:09 -0400
Received: by mail-wm0-f67.google.com with SMTP id y2-v6so1656123wma.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LhBQZOJZ5CY1iejYHh5r+OO80KOFbC9w+x7Kw+7XH2c=;
        b=qhLN0+XlBq6jHDTlSlKfMMmJjUqASaVSiAZ0zywVXpAg+VpUOeqdiJHj/wArfR65XG
         Ut3JLptVruN/PBv/xjcMUVNG81WIKCO+dMG9qK6HWxTAtR/EtQB8CpaH9QF+IGCW4BWn
         YSmQMOUq6FSuRhvb8AempV8E+YLZPSUlE4hF2263DyPfege/APAPyWSrGUaOUqwNEiw3
         O4IibHRF1/nN9/UDdjKaDCSYnTyG5+kjDhFJC2srV9nASdDLL5E5WdrKISQHKKrQN0eP
         M8nLl+weFtfn/3yYYPWxYTFB3bviLyYR2P+BrZHk7c4uvaVyPrL5NiMZclTO4/7ZClBg
         Xtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LhBQZOJZ5CY1iejYHh5r+OO80KOFbC9w+x7Kw+7XH2c=;
        b=LZvXRUHntj1v6u2vyumTGNk3opr/uiDKOGHGke/9VCZVIGHrJccwL5T8Q6Y+jBvgV1
         fFN2JuuEvDchLPyqvAdzXQN2DBFRXSrcpi/nspPa/zdEUO3cXho08HkniWQPiMUx+t3D
         enH2MGB53QJQKDOfogw8y2o8eUruWTS8rrGphmD+PxtHqQtcT9/SC39kwku7th+llSzb
         Pnyk4i7SVAdq5PV9Ypi2Jmw1PGedauexRmVb6ylD0WW4t2yBP3oj9e+h6FJYaiWsULOr
         CESWCi/BZGgwg52RP45SgxCjjJkpi+3ITP3bMHcDmAgqZ9K+ESAouZLSwDbpfQiL3+ja
         2KqA==
X-Gm-Message-State: APzg51CC9GnGNQYo39bs9jVJx2tmwObAhgkh4LkO0F2z4P/ZRM/km6tt
        cGHxcUuxY0gZgqQbhUpPk1Rj/A==
X-Google-Smtp-Source: ANB0Vdb475utvdy0BbImRrjLj8t24oq22bP1K+3VkFe8W8AFPMSWX/v25NfkMksN2tme/fdtdkw3XA==
X-Received: by 2002:a1c:7915:: with SMTP id l21-v6mr1693369wme.136.1535629285313;
        Thu, 30 Aug 2018 04:41:25 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z184-v6sm2175218wmz.0.2018.08.30.04.41.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Aug 2018 04:41:24 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
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
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v6 03/11] arm64: untag user addresses in access_ok and __uaccess_mask_ptr
Date:   Thu, 30 Aug 2018 13:41:08 +0200
Message-Id: <7a37e7363328f4aa10706c0294242eaa5e4e9e89.1535629099.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
In-Reply-To: <cover.1535629099.git.andreyknvl@google.com>
References: <cover.1535629099.git.andreyknvl@google.com>
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

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/uaccess.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 2d6451cbaa86..fa7318d3d7d5 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -105,7 +105,8 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
 #define untagged_addr(addr)		\
 	((__typeof__(addr))sign_extend64((__u64)(addr), 55))
 
-#define access_ok(type, addr, size)	__range_ok(addr, size)
+#define access_ok(type, addr, size)	\
+	__range_ok(untagged_addr(addr), size)
 #define user_addr_max			get_fs
 
 #define _ASM_EXTABLE(from, to)						\
@@ -237,7 +238,8 @@ static inline void uaccess_enable_not_uao(void)
 
 /*
  * Sanitise a uaccess pointer such that it becomes NULL if above the
- * current addr_limit.
+ * current addr_limit. In case the pointer is tagged (has the top byte set),
+ * untag the pointer before checking.
  */
 #define uaccess_mask_ptr(ptr) (__typeof__(ptr))__uaccess_mask_ptr(ptr)
 static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
@@ -245,10 +247,11 @@ static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
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
2.19.0.rc0.228.g281dcd1b4d0-goog


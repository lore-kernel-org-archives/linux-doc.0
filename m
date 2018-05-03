Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D1F017E280
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 14:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751484AbeECOQj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 10:16:39 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:45255 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751316AbeECOQA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 10:16:00 -0400
Received: by mail-wr0-f193.google.com with SMTP id p5-v6so17772903wre.12
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=ctyxioGiNTZ7rpdFbKdyZtiNPRmeyeSFA/d5IrA7HX8=;
        b=hryGsx/yxTmgjv4bZv8g8mXRkFPYEd6EltiF5RFvZ96FGFw+N+FiaCYSgucX74CTrN
         Q+UenCZ/98WaZggEUBXp8aEUycrM2o8FNOFNm0oNq8YgJz6N8q8NcEyhnEOw5yT1uxhs
         yCJLdo7Lm0Z70ZqM4uRbI0jAR2EGbJGI/iJszvGU8bVp+c8BpSqNrSv2yums7mzpPAMv
         uaPZp9+wUtBsxhuB5+RUDZxzNdnVm50xv3vsddL6fYrqN00cFI7IYe6CtP7d+lFB6S68
         LFbUGv2Umtjp0+ObFIzYawnGxdiD2wu97vu5kI3cIquxhPtIY5kS7TAp5mqROWSdXSsP
         48Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=ctyxioGiNTZ7rpdFbKdyZtiNPRmeyeSFA/d5IrA7HX8=;
        b=dIxsnU6n1AYwKr2RYP9pATqa4eg0+VES1//0t5w/jcq0kk6dJCR6OigqjuuuTo6/f2
         PkMWUE9/CwExQNaTDvqKbt4l+F4b0fdrT9tKJnFtYE42JZJ9B5aYLHRQttGZ9Al/yS5l
         hKM9gfvkdHRMc30q6GUZae627dCR1tKwQbIsedjMIRow5cXExdvQqFTW5VOhm/ibOSiF
         Kw+cD/6nHuxrjOPwBXY64hti4KgxKN1ny/vgWibQBJlK8ZMgT0MrwrsROTX2cxV3QvoW
         QRX3Gp4lIdKE7cQWPCF5/AoaL0gO3xOmakuod4ZB9VPE7iUFRjiIT8n533ruRyMLT+QF
         SacA==
X-Gm-Message-State: ALQs6tDtoIIku6LswqDqqFBVXwgztaz95mbl/AZ5Ej7blzjOtrP0n0qQ
        Cl2LdlUKhAoud/06cFBlLm3Usg==
X-Google-Smtp-Source: AB8JxZpawo+iTN3j3wND3dZiwHsLK73Ji/eDYkcylrk4gUPBNiMOM8Uttu/rSNJkfJl7Xbmq767iZw==
X-Received: by 2002:adf:9444:: with SMTP id 62-v6mr17792664wrq.264.1525356953516;
        Thu, 03 May 2018 07:15:53 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id u20-v6sm22090298wru.33.2018.05.03.07.15.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 May 2018 07:15:52 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v2 3/6] arm64: untag user addresses in access_ok and __uaccess_mask_ptr
Date:   Thu,  3 May 2018 16:15:41 +0200
Message-Id: <20bddb7a15984ba05eb1d248162a845af246449b.1525356769.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
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
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

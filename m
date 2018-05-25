Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1E0F27DF8E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 17:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967331AbeEYRWk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 13:22:40 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:42876 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967562AbeEYRVZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 13:21:25 -0400
Received: by mail-wr0-f195.google.com with SMTP id w10-v6so10443904wrk.9
        for <linux-doc@vger.kernel.org>; Fri, 25 May 2018 10:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=soSxvk8tz+HMI+9osTf5bW8A1wo3JVkLgkcX5odLmWA=;
        b=ddm4tSYv32Ehswqlrf+yGJhke6pId3pIxYmA0VIMwyasJAFP2AQY/YNzyqdYkvsYlU
         PT9v4uxtoqA/UaKe+ZjrzC06vVDSF39evOrhMiH+aF8bD5oBtf5Nqyb/NF+el2tArnPu
         i9GvOLHq16wIeyN3Ojb2QR0IjTKaVDT6/PYHx4qBwUNy/VZj0l7srbJsogAMp2VCtszg
         4XgDY/iwgnqbeHRWO985XlIz03sxzhjQKW+g7W+Ds9CSh6mtkrBfGv+hoI/Qilw/chE9
         3MrQWVJASZJKIQXdS1/RUAcOYnxevnfE+6lmBP8GzaX7hucx++QvJ5uXaPKGFGrO2MH/
         XoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=soSxvk8tz+HMI+9osTf5bW8A1wo3JVkLgkcX5odLmWA=;
        b=P/Brt1W/t4ftOB0Pb0huZWhdqESRfJP5BEqT0ZXzky2WADgDz/swQg5R6iUvqfACRm
         b6nWN/sie3QYIM9W7DYYp41gP3UXH5qatSYIQax3sV7qKS0MyEHTtKODMAefBdmdz/NV
         6xTV5gZlznENNvPktfjF5Sq4tk17ouCdd08aUJJdHVn0jIVYABqQdmtYR1MPgn9SB+Ti
         6+QYRHzr2mGmGVzrzOlpgHrFc5us3VFckgitZgV6pj6nQgG1+m6pe6N3hDNcZ0IOpF33
         SJ/3PbMflhQSz8JCUDeIQyK90vco/HQm68Ea4D1KKnaSltWraUZ/eEOqQoYq5MnXyJjS
         QarQ==
X-Gm-Message-State: ALKqPwfO0dvjgjML5FlDYCZWqA6tiiJ7AcSVEa4ZfraTV3T48uo6n8TV
        rmMt/Y/TYFPONbvG5EeAwUY+UA==
X-Google-Smtp-Source: AB8JxZqTFpWuWoXOTf7secDy7ByY17hOe2t3oSNMGcuWVSp4mCg2G7wwL8D5VIpq/ET7c74OvQVxGA==
X-Received: by 2002:adf:e542:: with SMTP id z2-v6mr3124714wrm.111.1527268883792;
        Fri, 25 May 2018 10:21:23 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id s5-v6sm26579964wra.48.2018.05.25.10.21.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 May 2018 10:21:23 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v3 3/6] arm64: untag user addresses in access_ok and __uaccess_mask_ptr
Date:   Fri, 25 May 2018 19:21:13 +0200
Message-Id: <13e2b2fc8d95fda2441d3ed818451e5b5570bcde.1527268727.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.921.gf22659ad46-goog
In-Reply-To: <cover.1527268727.git.andreyknvl@google.com>
References: <cover.1527268727.git.andreyknvl@google.com>
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
2.17.0.921.gf22659ad46-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

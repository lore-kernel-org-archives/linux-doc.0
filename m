Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A4ED57D927
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 13:13:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbeJBT4J (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 15:56:09 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52963 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbeJBT4I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 15:56:08 -0400
Received: by mail-wm1-f65.google.com with SMTP id 189-v6so2214638wmw.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UwxTkI+pYsHu40iHWOY4wB/R27fPZGDmoFBeZbslwgQ=;
        b=uOQ+FfmUC+RaS3QyuW/9cJe9RH7pk1ltGJ/08pMGtCZU0scrsbZfvGCfzNFlnYWeR5
         g4Vr9xESUkQ3uzvvWZq0xdqiM4GWXtOzvpTeiJAGBAFrgtHYW5APJNvA76dSQYg6AQ6U
         +HnGxnOWKMtPLutPQOCuJNs520+lOBa8RK6H5554UVrF0vYcw9e7fDpm51uyEaclf9he
         mlrY9jl92q9OeuR3mYmCoOs+LQInROEeHRG03TikcJ97tIw0t2mAJ68JeLA3lwRgRJ8x
         Pq5kHnJz2EmX3aXhV7wv8Shr2/YuRwwklttZlbsqxMfB4W5wvp501g+TByqSV28przNS
         TNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UwxTkI+pYsHu40iHWOY4wB/R27fPZGDmoFBeZbslwgQ=;
        b=Sw/YbKdACWkuBoin9e54AspDVhS5/fqXeKg3muio0QgpDB/ILac8yKFqkUh9v10Bjw
         eqeJzf7lW8ZTFGI+VFrtCIgKXwnNyQDAxLPablAIDmWYQk+HCK2XOjgTxZ2w3ULid3Yi
         aXo+sUnwbmGyDcyh7+d9un4glgwhMyUET+7OLZLLXayqiy7sJGOm4OASfCgzYuXAlSDU
         mlwnpH9DlcBTSeyGGlWy3o87qnbCtHqUfyLm5kIVlnhG5hm6BchCiRvhy5OOpO3rtCqr
         F/HMtGAfLgXU6nims2qor2BHFn1pitcS9BrYkiHqxnT3zAWYq//8AW1BEprqjT31wdqz
         zEig==
X-Gm-Message-State: ABuFfohoZbnAOhf0J1oGqHcW/+7GIOuNDPwnvF09DJhj5KODbydnMhn/
        tp9YDNOK9UXayPrryVxDqzKt5w==
X-Google-Smtp-Source: ACcGV622sDyFt3S8csEmXThpDBNFNMvaRauKoxqXv/A4k50G/uwAP10xj9S7JvVx/Gl6W/hzjmgNeA==
X-Received: by 2002:a1c:d4b:: with SMTP id 72-v6mr1969892wmn.102.1538485970324;
        Tue, 02 Oct 2018 06:12:50 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id v10-v6sm17458681wrp.0.2018.10.02.06.12.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 06:12:49 -0700 (PDT)
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
Subject: [PATCH v7 3/8] arm64: untag user addresses in access_ok and __uaccess_mask_ptr
Date:   Tue,  2 Oct 2018 15:12:38 +0200
Message-Id: <2b957e4f0a3133480dda9d9c8aeceb9b9d9378eb.1538485901.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <cover.1538485901.git.andreyknvl@google.com>
References: <cover.1538485901.git.andreyknvl@google.com>
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
2.19.0.605.g01d371f741-goog


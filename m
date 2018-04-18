Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 03F1A7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 18:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752813AbeDRSyi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 14:54:38 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:34131 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752986AbeDRSxZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 14:53:25 -0400
Received: by mail-wr0-f195.google.com with SMTP id d19-v6so7552576wre.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 11:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=QMF8XDyX8uZ/Zov9SXCN5rgufNs9uhqTRQTKwFRg5lw=;
        b=qegfrnN0cCtdmFWqXkd90xJKq1gbjC8qNHtX3IHunpIIynqrx2W/uivKsgTea4Y1fM
         BhQG9auXFDq622f2XQh5bRE3A3Kforf0aEdykQ3VJSfyFSZgUEKC2IAHyqv0CV1uW5jw
         DwXvlQKDQF9NL6PrtUTUqvXBHlVJ/CnbtmKQL40MDJGQ9DqoXYNJjz5A267tmGPJL6op
         17Fk1pBsQ37OWfdW0p25gHfwSMtOVmqNwvRzGV87SK/ooQNPEnVbj6MYJs6TkgFOnYA/
         mmE3HxrqLnoBv5IetibPqvEBAH9jkhI1TzpH2CP8z4lr2ODSutrXLINC1RkLZmcjAnAd
         50dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=QMF8XDyX8uZ/Zov9SXCN5rgufNs9uhqTRQTKwFRg5lw=;
        b=HQF6Mt1OfEHXRGYgqfPCubqM1SpKozD/oekdH0QsbP6AhJ3HUZQWj3HhYwbkibNcjN
         +XDvSFkWY+cgMqkiNMpR6EgjbEhDVxxhsY9FrAJzm3NZ/Fzvq28KS/YieGS5yQjSyr+M
         JLPuvq+66eZBjy/cYxo0kStlbZLBApzt3CTMIgdNO6kP2v99QzrWpQurI15w7QMMs4Hs
         YTNLZ7qDgza+1FNgqKP8m1YQL/hLG3RevrGCE7FX24TryJelf2/xUE7DPxzzn64Yf2aL
         c5vZoUTnztnOObJ71FBTmmoA562kVB8fR6MS6cCSwyjeAu3CGvuoD0iSYAyNvK3QtBwq
         0PIg==
X-Gm-Message-State: ALQs6tC7at5uTCkR9sudd6zX1COLqTtGc50TtWbFqfb0zIVeg6oYbu9g
        rOr2Oe6LUdU4zm5zxp22yLJjWQ==
X-Google-Smtp-Source: AIpwx492GvuhPEjMG2W8I64jHz+nZayfp/4zSvo+ArBaT/Wb6JPZpMMwmnLtMw3uOBQMOx8/SrQWJQ==
X-Received: by 2002:adf:a98f:: with SMTP id b15-v6mr2440629wrd.48.1524077603355;
        Wed, 18 Apr 2018 11:53:23 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id k79sm2616735wmg.39.2018.04.18.11.53.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 11:53:22 -0700 (PDT)
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
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>
Subject: [PATCH 3/6] arm64: untag user addresses in copy_from_user and others
Date:   Wed, 18 Apr 2018 20:53:12 +0200
Message-Id: <949c343a4b02b41b80f324c2b7cd56b75e6a04f3.1524077494.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

copy_from_user (and a few other similar functions) are used to copy data
from user memory into the kernel memory or vice versa. Since a user can
provided a tagged pointer to one of the syscalls that use copy_from_user,
we need to correctly handle such pointers.

Do this by untagging user pointers in access_ok and in __uaccess_mask_ptr.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/uaccess.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 2d6451cbaa86..24a221678fe3 100644
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
@@ -238,12 +239,15 @@ static inline void uaccess_enable_not_uao(void)
 /*
  * Sanitise a uaccess pointer such that it becomes NULL if above the
  * current addr_limit.
+ * Also untag user pointers that have the top byte tag set.
  */
 #define uaccess_mask_ptr(ptr) (__typeof__(ptr))__uaccess_mask_ptr(ptr)
 static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
 {
 	void __user *safe_ptr;
 
+	ptr = untagged_addr(ptr);
+
 	asm volatile(
 	"	bics	xzr, %1, %2\n"
 	"	csel	%0, %1, xzr, eq\n"
-- 
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

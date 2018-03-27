Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 343BE7DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 16:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755477AbeC0Q54 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 12:57:56 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36335 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754200AbeC0Q5x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 12:57:53 -0400
Received: by mail-wm0-f65.google.com with SMTP id x82so160263wmg.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Mar 2018 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=PQDvPwpCCj++tEzmkEClg/xNExzGMoMf+mTY7ONA9sM=;
        b=ADn0rmiuJ9XMM6PYDzfTZVuW5CPYnKWZBN/2cGETCgpoqcygh9M5u3blB9njWr8Re+
         Ut+uFZmTsK60HI1Jcl6sLhzGhaTNCal3v1v31Uw1yLenf4qO1bduAucD9HAo+XI1WVpp
         vvATKMr+BXh3qUgY2ja3gImPbJpWvsf9XdLPep6eVNyEOD4VehwyH0vASDitWzdKi8jI
         RYMrKQyKpgHfH0xnORC4RZwf7UU2E3EN5wwujgEijY0vzEHO3O4sXAXYaZy/eK730CKW
         uc7VAhsT1Lt5vkZkYhfWdXjnNDJaVfTSyR10wD1nqo+XpLmTmgfOy8db9Rjpe69AnI6K
         vSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=PQDvPwpCCj++tEzmkEClg/xNExzGMoMf+mTY7ONA9sM=;
        b=g0/MfZ7U9uIK/yuUGo6+NqdicTkk9CIhsSaEgNS9148o0XUJ9CGxA+ithX3CurXv6q
         vWnxQ/8q51b0l0APnfeU9wDDzv8MMf+TOXokbpp0ytEhAePW0DtN4P9QHPGzOvPtud2n
         6/q5DR3G2lbLGINt9JoKle8I7IcgG995AQnvZjMaEqIVbLGKpXrdSSrLNkTW6iiSzvFr
         ZK0L3vQeQ8ryAuxr4ey4knM/07ZqSasvNyPv4SufUihJgoNoT0Gun/t/YUmzEpyWykb2
         jEdSVPA0NFU2q8iAVbNZkzHx9IvaAq9pDOxdcwI1hudv1DrecG2YpMNboB8eN4tsuGDT
         gIWg==
X-Gm-Message-State: AElRT7F2eJXNOYmrds9g4hDa03S2EKoHEtkpUB0V8/x7dtNiU7VpKj0H
        2nMDnrNXJ+5zi2MZ7zIE3PMd4g==
X-Google-Smtp-Source: AIpwx4/r7QqaBNv+zh63HY6pUE+6nXfgV70QA44S2r+rRUeb7OeXVCpu+eEC5+uPaXYYZWHThL86gA==
X-Received: by 10.28.5.145 with SMTP id 139mr35642wmf.31.1522169871428;
        Tue, 27 Mar 2018 09:57:51 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id 93sm1622992wrh.46.2018.03.27.09.57.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 09:57:50 -0700 (PDT)
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
Subject: [RFC PATCH v2 3/6] arm64: untag user addresses in copy_from_user and others
Date:   Tue, 27 Mar 2018 18:57:39 +0200
Message-Id: <22d41e0e1439ed0d13b2a2ca4b7c8317131f7ea9.1522169685.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.rc0.231.g781580f067-goog
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
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
2.17.0.rc0.231.g781580f067-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

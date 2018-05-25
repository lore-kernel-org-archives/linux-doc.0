Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4C7337DF93
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 17:22:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967518AbeEYRWD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 13:22:03 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:36160 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967592AbeEYRV2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 13:21:28 -0400
Received: by mail-wr0-f195.google.com with SMTP id k5-v6so10442163wrn.3
        for <linux-doc@vger.kernel.org>; Fri, 25 May 2018 10:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yZP0biNYmIhGSM1a5h0e7cWrGAjsco28ACLkrXaSiyQ=;
        b=RIIFfTCzVWK7Zyh0oktok2JvdAghpLR7bMVgP0HLy5S/3rf973xF/QTZa9wQ4nx3aj
         B5/8Y3jnetkBcUAgzBdFNU7x8AlCBRL5YeJL6/vIOhrkUu5zU+miM0wPnwG0CTLVG34S
         DrbvkfdwjwE+iAOEk+pfOwiOfr4Mm7Bb//gGhAdNO3yIWPXCg5X3/q+qK3YPna2B/Q9E
         WmI81zGTsyiusSTsdc91LKPHkWW84UJVnPhxqK4NndtlCScLQh5dI8k9ttH2NhCU3UGa
         YG9XimfWqivTL31V3XR9qvQ/7wtb69FdJPXsx3bXqikWT3afPL7ohHdfusqP0jARtB7Y
         x8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yZP0biNYmIhGSM1a5h0e7cWrGAjsco28ACLkrXaSiyQ=;
        b=uKBx3/URvSeICnD7UkhQM5ipK9Ur6/SZUmH3mI1YBRJrktl2cmIlWbdColHLuHvFwd
         12E5/UGPAaNa9bztOSKdJJjfV8cOj9kozeLIqTkY81Bm0zTuvX8qrFvKHcGopm6PiOff
         mpMcsVeGeZosqu+d8ulhQh6dGK27VvPOaKjoluBBn2nZUukVbBBmhkz3Q6XIM/2Wr7F/
         z7mgCj1mxLx53Q8p0ND+0yDrmvp9doGL6n6FQBPagfeMvwibJ9y7Cj+64ZuGb0AyeXnB
         f+b6K5vyQqkff/BrEylphBFV7GoVrhpyQix0i9VDgdh0/sTQfa8xA25VmVb2kCvLwLfc
         qfuA==
X-Gm-Message-State: ALKqPwdeshyldWe/2q9b1J7rHPSm9F8VE3mGiJ4iw7UBxrRWEM0HfwLm
        HrT+hyTCPuwhkxW1MGOBKHeGLA==
X-Google-Smtp-Source: AB8JxZrWLPpHy6ArAulKgNALwWbIej1CZbxkjhsfiuGM4htKA2cPxuSLOdhOSxZxVMdS8vws4FCybA==
X-Received: by 2002:adf:8756:: with SMTP id 22-v6mr2654907wrz.117.1527268886845;
        Fri, 25 May 2018 10:21:26 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id s5-v6sm26579964wra.48.2018.05.25.10.21.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 May 2018 10:21:26 -0700 (PDT)
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
Subject: [PATCH v3 5/6] lib, arm64: untag addrs passed to strncpy_from_user and strnlen_user
Date:   Fri, 25 May 2018 19:21:15 +0200
Message-Id: <011bbed9ae9404e2f8939e2bcda459387038089f.1527268727.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.921.gf22659ad46-goog
In-Reply-To: <cover.1527268727.git.andreyknvl@google.com>
References: <cover.1527268727.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

strncpy_from_user and strnlen_user accept user addresses as arguments, and
do not go through the same path as copy_from_user and others, so here we
need to handle the case of tagged user addresses separately.

Untag user pointers passed to these functions.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 lib/strncpy_from_user.c | 2 ++
 lib/strnlen_user.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index b53e1b5d80f4..97467cd2bc59 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -106,6 +106,8 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
+	src = untagged_addr(src);
+
 	max_addr = user_addr_max();
 	src_addr = (unsigned long)src;
 	if (likely(src_addr < max_addr)) {
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 60d0bbda8f5e..8b5f56466e00 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -108,6 +108,8 @@ long strnlen_user(const char __user *str, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
+	str = untagged_addr(str);
+
 	max_addr = user_addr_max();
 	src_addr = (unsigned long)str;
 	if (likely(src_addr < max_addr)) {
-- 
2.17.0.921.gf22659ad46-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

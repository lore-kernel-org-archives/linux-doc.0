Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC0067E3E3
	for <lwn-linux-doc@archive.lwn.net>; Mon,  6 Aug 2018 16:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387519AbeHFSuw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 6 Aug 2018 14:50:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37336 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387569AbeHFSuw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Aug 2018 14:50:52 -0400
Received: by mail-wr1-f68.google.com with SMTP id u12-v6so12994656wrr.4
        for <linux-doc@vger.kernel.org>; Mon, 06 Aug 2018 09:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YBeH5wb0hNzlivAoVU1htfthx3SJVx7ZblkVtJGW9ZA=;
        b=ZfDD4//e+nKU3Jk48Adjac7R2nCCq1HmUAoIcnD0wQGnnbJdjWUlD2Aytat6evC4LS
         VVCRE4GradGfF7mcdUatpkfkbS3oUExjCB/oJKRWeOgr7D4ns0ZdM/ecmR+rDEiJijY5
         S5Sn5a3jb2HgFLP5cDZykHlUrABGLypRXZBcf03L4NF2mJDMuWsf2I0cBuuPGn4R+s/1
         lH0SekuGSZvecQg1AancsSigJdj1Yu9rEv5ENqjlxw1iJ0P7zjekaIIfk0F3yh9DLnKi
         TZpN0Zr9j707UzVmqzktL466xYpXyXTkduX6zmE7Ee23DujIeKOV8ZkSblww3yE0f9TH
         8Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YBeH5wb0hNzlivAoVU1htfthx3SJVx7ZblkVtJGW9ZA=;
        b=i8UiMZsOAmLpZtej7uvxtycO/Ue6xv5hPkjBuk0cZ4T8LaAdLy17Gp6YFJMzxyENH3
         /WzQVmAWugtFeRLyoqM2pxQQGO6WCkHpRRQiUZK6s3EfSNg6+SJqFX9aYbz9kugCHWkX
         XrSQ3PMPXCRhKQgADjk01zCS0xvc4fJ5l72ynpyX1qwv9nnngHCOFieVrcFoigEr2LX4
         X9CzHca8vq4MlrdtS9u1Q/BXzob/bwyL1jjcF9G84iZ/ToOVayu8kBNJCiIaduEuPwMb
         yg8/Hsa3ho03PhnnHdDQy8PRBbf4oauglJJ9/20da2GL01VnRq0nSko2y5LzutOgQDr8
         HRWQ==
X-Gm-Message-State: AOUpUlFkRYYgFKEqzW6ZRkduKtK4eJZoT/ovLJCZR0w9tUuXAdbzf7Aw
        G8d/fWQ3FDocb4MJAGkc0AQYNQ==
X-Google-Smtp-Source: AAOMgpcsiooZAsa7Co5DL90XZQSeO75lLqOzA0ZY/k14f/rzEmHb2gPZjF9ufPSZOUffbBSYdCeBEQ==
X-Received: by 2002:adf:91e5:: with SMTP id 92-v6mr10363242wri.124.1533573656582;
        Mon, 06 Aug 2018 09:40:56 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id 66-v6sm16385790wmw.34.2018.08.06.09.40.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Aug 2018 09:40:55 -0700 (PDT)
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
Subject: [PATCH v5 02/10] uaccess: add untagged_addr definition for other arches
Date:   Mon,  6 Aug 2018 18:40:37 +0200
Message-Id: <d57a69a1174247d52b388564b26bfdfeaed727be.1533573460.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.597.ga71716f1ad-goog
In-Reply-To: <cover.1533573460.git.andreyknvl@google.com>
References: <cover.1533573460.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To allow arm64 syscalls accept tagged pointers from userspace, we must
untag them when they are passed to the kernel. Since untagging is done in
generic parts of the kernel, the untagged_addr macro needs to be defined
for all architectures.

Define it as a noop for other architectures besides arm64.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 include/linux/uaccess.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index efe79c1cdd47..c045b4eff95e 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -13,6 +13,10 @@
 
 #include <asm/uaccess.h>
 
+#ifndef untagged_addr
+#define untagged_addr(addr) addr
+#endif
+
 /*
  * Architectures should provide two primitives (raw_copy_{to,from}_user())
  * and get rid of their private instances of copy_{to,from}_user() and
-- 
2.18.0.597.ga71716f1ad-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A5437D08E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Nov 2018 14:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbeKIAMy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 19:12:54 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52667 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbeKIAMK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Nov 2018 19:12:10 -0500
Received: by mail-wm1-f67.google.com with SMTP id r11-v6so1494905wmb.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Nov 2018 06:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/pjzuvui9d85lC6ebp/JjM8l8T1XFTIxfHxdlRMSnSU=;
        b=g1wof77b/ahW159tl/OaMLW0P96a0/zVeZFYRh5g6v6wbToBXd28iFvOASCK8yKV5Y
         xHNqterZqD2KmkFcVcFGm+gkEQeG54Jf/H+takvz8wjdH3wdoMPjV1aR/aoFl8xbW+mR
         3CDZOO7tD7iSEUdTMb+jOu+oyFpmUCbQR6pdxco9Vh1tL70iQ5jUycXJ0G3WmOgyULXv
         HP7R7bmaLmZ4EHXVI9J9sCIzpUalSy8bFlzRzUf2kwtLgyxlzPRWUrnL1K4XN9LUvolW
         Y96dsy0e/tD1Mz+ow6abkTbXTuAvzZ6CsMX4iIrftNJRgkfaRW/cIVRWqwbUc26iosdQ
         6XAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/pjzuvui9d85lC6ebp/JjM8l8T1XFTIxfHxdlRMSnSU=;
        b=brxgWgRZuJEEpP7ABTf0vkpoYwOym2M9XyQspRktnSMGGyahxKrot4svaMZA4ljMwG
         gYsVtcmHlnNryFb8t9MikkaYcHV87OEviHNursUs8N3oghin/Ep3zSfe5tVNrvsDWTte
         TLF39ig0ctbWuEHD08u4dL8gm/DOa5lyBEnK3DxgT5kAuoIKEg4kFT6l0lG0gwRCnVOQ
         6NT66SZ9jJFyz3HEarPkGy9UjeTzYHOKfIH12dSVb53n2vnG93allWMhM7F51kb8ZDD2
         3vFut/tBI8aq0spwXmbAz2JxfdzwGPo2pd+/7wgjdMoqB4al4u8izbl4NQYZoyRFWPjO
         1TYg==
X-Gm-Message-State: AGRZ1gIOJdOqsQrpgROvDJMx2gUDaAMhwvUTzsjK23h0s8zVZNUuw93V
        9joxkJ8vX672tXNR/ZxeTJxxXw==
X-Google-Smtp-Source: AJdET5fJjnrcqJrwZDIF+kL6S1eyNF+VEauTvj/4nlfwZhoIa13mwXNXonwu4vWqr6lN/+fSYDs+KQ==
X-Received: by 2002:a1c:13d2:: with SMTP id 201-v6mr1411054wmt.58.1541687782962;
        Thu, 08 Nov 2018 06:36:22 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id k5-v6sm5421068wre.82.2018.11.08.06.36.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 06:36:22 -0800 (PST)
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
Subject: [PATCH v8 2/8] uaccess: add untagged_addr definition for other arches
Date:   Thu,  8 Nov 2018 15:36:09 +0100
Message-Id: <c9028422854fb5bfb79d798397b30d4701207062.1541687720.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <cover.1541687720.git.andreyknvl@google.com>
References: <cover.1541687720.git.andreyknvl@google.com>
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
2.19.1.930.g4563a0d9d0-goog


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 395F57E397
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 18:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404688AbeKTDvf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 22:51:35 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42980 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404678AbeKTDvd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 22:51:33 -0500
Received: by mail-wr1-f66.google.com with SMTP id u5-v6so27650826wrn.9
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 09:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FwKg6/9dBzGs42zHBzot5G3OJIBxXRkYl3JEBLj4VCI=;
        b=XRgFtW78jY8uE+DLOcRj01/ohwGwYRVTHOZm6kkIX3wG78z6h1mGRsYa7WH0kSmPHo
         AgJRvOnjXH+ryNrZV51t7wuW1nLUfyd7dVxMwdnHcE1gRgWDB5jR5a/noGVOeHj4w0B/
         8yuVzlMIRzVf2cnjqzvYbrpnoyo7e5Z1CXPyIYr53fB2+Pb1yBVNk+oDQlS/I+ZOm6do
         prUWxiNXpr1bUnZo7OoJTcsYxMaIWv4nn4nKD3LFFs3CROs/kb+6dwYChGBQKiN105SH
         5TdFEGUtGrIXnGkfkToX+7nV2GhomixqpcmF0F6aS6F+opCc3zhUMsY2CplJVtJK3cYR
         otIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FwKg6/9dBzGs42zHBzot5G3OJIBxXRkYl3JEBLj4VCI=;
        b=KJcSBSgzJwR8bF4bIVFTsYOB6YpAetL+0JetqlDhDYKalzk06rFGNl/Gf+Bj1FxH0h
         jJRHip+J8KKflIbwTnC0n+7tdbzGDWNFkYEVyle7ED/hrwYsXTfzWbvXoP2rIY8QikMT
         iKFjC63hatmQlnlpm7kfWWvWJCr8m1OhzZwZe8lB2bNva7tLnyAOr098klZzTh9l99vk
         L+rb6OJKt4+2ROx+m7YfHXb6uNcP540ZbCzFhF+8Ol25WO0xhpW3v1iCjiAd7LE4Jk6g
         WUpRnnOQ6qQxmSBnsrEJ3cuxQu5HO+L3UYqo08pL0m5/D91hWIrgI8cyoeZlSTUozVqL
         p/Jw==
X-Gm-Message-State: AA+aEWYjNgvwoRD+cLRpVIf2pUfYXtpG6t4OFziF368LSzW2ejf/RkZU
        sNruZyeVy3hA4SgtCKMa18k5+A==
X-Google-Smtp-Source: AFSGD/WHNP7mi0wPd7mMILK100bob8aXhZpnIiD+3cKXrZDRq6mGPKEPk5lZq9uwmj5IXWtJqjVhRQ==
X-Received: by 2002:adf:a357:: with SMTP id d23mr5758176wrb.195.1542648428411;
        Mon, 19 Nov 2018 09:27:08 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id l143-v6sm23685190wmb.23.2018.11.19.09.27.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Nov 2018 09:27:07 -0800 (PST)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sparse@vger.kernel.org, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org
Cc:     Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v11 09/24] arm64: move untagged_addr macro from uaccess.h to memory.h
Date:   Mon, 19 Nov 2018 18:26:25 +0100
Message-Id: <0288334225edc99d98d70c896494e19c3bd9361a.1542648335.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.1215.g8438c0b245-goog
In-Reply-To: <cover.1542648335.git.andreyknvl@google.com>
References: <cover.1542648335.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move the untagged_addr() macro from arch/arm64/include/asm/uaccess.h
to arch/arm64/include/asm/memory.h to be later reused by KASAN.

Also make the untagged_addr() macro accept all kinds of address types
(void *, unsigned long, etc.). This allows not to specify type casts in
each place where the macro is used. This is done by using __typeof__.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/memory.h  | 8 ++++++++
 arch/arm64/include/asm/uaccess.h | 7 -------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 05fbc7ffcd31..deb95be44392 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -73,6 +73,14 @@
 #define KERNEL_START      _text
 #define KERNEL_END        _end
 
+/*
+ * When dealing with data aborts, watchpoints, or instruction traps we may end
+ * up with a tagged userland pointer. Clear the tag to get a sane pointer to
+ * pass on to access_ok(), for instance.
+ */
+#define untagged_addr(addr)	\
+	(__typeof__(addr))sign_extend64((__u64)(addr), 55)
+
 /*
  * Generic and tag-based KASAN require 1/8th and 1/16th of the kernel virtual
  * address space for the shadow region respectively. They can bloat the stack
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 07c34087bd5e..281a1e47263d 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -96,13 +96,6 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
 	return ret;
 }
 
-/*
- * When dealing with data aborts, watchpoints, or instruction traps we may end
- * up with a tagged userland pointer. Clear the tag to get a sane pointer to
- * pass on to access_ok(), for instance.
- */
-#define untagged_addr(addr)		sign_extend64(addr, 55)
-
 #define access_ok(type, addr, size)	__range_ok(addr, size)
 #define user_addr_max			get_fs
 
-- 
2.19.1.1215.g8438c0b245-goog


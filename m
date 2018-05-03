Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 46DD57E688
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 14:19:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751145AbeECOSk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 10:18:40 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:46716 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbeECOPv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 10:15:51 -0400
Received: by mail-wr0-f193.google.com with SMTP id o2-v6so14884175wrj.13
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 07:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=xUzcMaOTF1xTWiYdFgJJTAKZY8fgLS4Wayk3qwMg3og=;
        b=Gaf2GpyxAxLLoEg/CKyWWUvIWN4HcJRL4Rimd/ht7vvHJX816/tibX3CWOFjYC+6T3
         7HmRrsInR/22Q+MkhZKSHPFRat/wqedQxsYsmJAhTLfKsGz1yG0KQGBx3nNyoid5TzxL
         kOCRNjalXQfwJMmlhjoD03riy05CxYfO1J5T9nx1K+z64VQ+sdUyxGV5q6ztG+EaJHGx
         yeOLltdJeRHMPfdz4lJ5/Q3aYev19/+IT/lEWmCAsqzLgzuT00PAGyjRJ0aQnLPvxOT3
         rzqWse8l4mkNArFjlU4ArkeOO6+D28wDXRl4FfSx1JfYdf6X2rTIjor/Va0msDCRSNcb
         uKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=xUzcMaOTF1xTWiYdFgJJTAKZY8fgLS4Wayk3qwMg3og=;
        b=MYgVnqAiQsmITTodOdYp27aj/LKEokd2ysqcwjOxFEe85WmzL/DyIedideIfkaACs2
         Wl/m1SxJxgNxYIreYu/ySVYlDrP56GO/9En7C0UwSFne31TyLRf5xLPBolgxhbzyj8//
         MqnghlUunNCfGIVX1CCcMQozzWtNTp4cRElF6SaN8KcNdFI2iH2K6V838y3n7fw7jHjL
         C3EoJ6GktYXGSAzhogMLAXHDhXUTG747xAUAhxagmjqawuhmnLInN6myXTuhUiBDnrS2
         n1e0TvdqWZQ4ib6EvEFA5OM27KvjVjeRMinra4s33Q1FcUS3R69oigVfe0eLU/NZAKXr
         zRPw==
X-Gm-Message-State: ALQs6tCuYVyT7P9VADVtBWK/4G2kWQhsuwvVNi/J13FP+JmGGYNKcOhu
        ucyTlMztQuP1B2zKRUv+1QFJvg==
X-Google-Smtp-Source: AB8JxZrm/imnlmPwzpExlXduL2x4spddcr4ddWYXxEzYjIk+xY0vq8dipS9QYyUmHsWZ+eYk+o2xjA==
X-Received: by 2002:adf:e642:: with SMTP id b2-v6mr17276262wrn.172.1525356950011;
        Thu, 03 May 2018 07:15:50 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id u20-v6sm22090298wru.33.2018.05.03.07.15.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 May 2018 07:15:49 -0700 (PDT)
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
Subject: [PATCH v2 1/6] arm64: add type casts to untagged_addr macro
Date:   Thu,  3 May 2018 16:15:39 +0200
Message-Id: <54622375c498b1e0037e26074cd2ba500ca7cbd6.1525356769.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch makes the untagged_addr macro accept all kinds of address types
(void *, unsigned long, etc.) and allows not to specify type casts in each
place where it is used. This is done by using __typeof__.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/uaccess.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index e66b0fca99c2..2d6451cbaa86 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -102,7 +102,8 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
  * up with a tagged userland pointer. Clear the tag to get a sane pointer to
  * pass on to access_ok(), for instance.
  */
-#define untagged_addr(addr)		sign_extend64(addr, 55)
+#define untagged_addr(addr)		\
+	((__typeof__(addr))sign_extend64((__u64)(addr), 55))
 
 #define access_ok(type, addr, size)	__range_ok(addr, size)
 #define user_addr_max			get_fs
-- 
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

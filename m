Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8C6FE7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 11:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbeH3PnI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 11:43:08 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36307 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbeH3PnG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 11:43:06 -0400
Received: by mail-wm0-f65.google.com with SMTP id j192-v6so1688970wmj.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 04:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=83X0Ly3GNFYkIBH/BFHbUkVhejW7zXmTm47ETsZa+AI=;
        b=K+wpn7aJOFLmPZBtmJEtbDEIz8wwRyqKm90YcGp+HMvxjAN9pVZ9cCtV/gejD6CHx8
         CCRwiS6KNOavKWrpApClDZVkUNnM1PpPI0sPj53nn54bQD/sBRG7JsNHHoX4PU66BtJs
         sWQPtl9p71g3J5ENln6J0XiGFBCetgKOUOzChKveAkosXimFhJVQQlzelgwZoNQSSMrk
         bcDUcVPQoIRyS/FnXWMTu46L+C5BZMmJ8YmSSpruskuUgtBE+n6hxzvCGEZKPoQmzw5o
         IloxmtP6GY49QXdlXgn3aXUqKYfzJKfo4M4OVXaCo+jBOHmqanbdshjSYmo4j7v976ox
         Mgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=83X0Ly3GNFYkIBH/BFHbUkVhejW7zXmTm47ETsZa+AI=;
        b=FJ6KGzSTo/kvW8sYazSmU4V6rAZ9DSkFbaHHX0eNQJ73pD9s6gZBemZ4Y6ZYvFIZR4
         ZdbIHL80iNb26XSMzDhzxugTXWisIL9ELUatA4bWLoUQxu4xo77qd0DJgU+z9EivMymE
         WFiRSgLfTWPJoJxyo8c/VV252mSnQihWCv/Bd3Bng28KCngmaIDXR5GjUGDmmxWJotMt
         Lkdz+3ISvAUw4YBhFgvhOIps3JO47nwPTsouPoAi5mbPy+CGnTMnwzpSiTD51CjGh9JC
         M7uPcRNpVWVXBMfA2SPAd+OskXqyAdQALQgyNIPIMX2NDHxWfpedwftyUpERR3uD/iYN
         T75Q==
X-Gm-Message-State: APzg51CTx3945CajIwqb3bCjdu8NuFdJUPlMATPhNSNvaytvzUMAuhjJ
        A0m0i+mSHoHMB/wrQf3NHeo5+A==
X-Google-Smtp-Source: ANB0VdblrnnClBYraLmPvStLXRnR3nCTmyxCJTD1zNjyPyVzvdcT/vtJe4+4mlXiStIG6mJaA/B2LQ==
X-Received: by 2002:a1c:9e4d:: with SMTP id h74-v6mr1596295wme.70.1535629282357;
        Thu, 30 Aug 2018 04:41:22 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z184-v6sm2175218wmz.0.2018.08.30.04.41.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Aug 2018 04:41:21 -0700 (PDT)
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
Subject: [PATCH v6 01/11] arm64: add type casts to untagged_addr macro
Date:   Thu, 30 Aug 2018 13:41:06 +0200
Message-Id: <fb5fa982f99419a3099031cf20ddb9957e627886.1535629099.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
In-Reply-To: <cover.1535629099.git.andreyknvl@google.com>
References: <cover.1535629099.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.19.0.rc0.228.g281dcd1b4d0-goog


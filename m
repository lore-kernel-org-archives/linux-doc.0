Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E09437D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Nov 2018 14:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbeKIAMK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 19:12:10 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39974 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbeKIAMJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Nov 2018 19:12:09 -0500
Received: by mail-wr1-f66.google.com with SMTP id i17-v6so21504150wre.7
        for <linux-doc@vger.kernel.org>; Thu, 08 Nov 2018 06:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CyHAJ7bm8yqliTwjL59/PERrC1/EJlU4Hst47qO5nm4=;
        b=hTQIa3cT8mQ6PRrw+ArPxNwUIt8G3xNjt0LPrCZ2+3MjH5B+tB03HhLfo9JtaDflG7
         1WS5ukgZJKhb3Ft+7oWDzcuhvWXYYqx0oGvId1rHas5NYbuZlzgh+jsCM0J8W0xqrJa0
         OhmkLb2QT3xrgFMUjfPkpf38HSHLQ5o2uSKcXbsGzJDAc1p3wW4syg78MncnKzkxdlQ2
         jTset9xpCPu5advaWYtuw31DIxNZhkWjXoUPz18Ntq6yzfcR8/4GKmf2sUarr6Qq88IJ
         IhHrM2tjOxLBZ3p5PAc6ad18rgsGMiuDoHvHKgFHyyMONd2xM9xj5Hbiv/hkt+t/CGAx
         Vh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CyHAJ7bm8yqliTwjL59/PERrC1/EJlU4Hst47qO5nm4=;
        b=DA0JKXGev5kcFHC5+lh57LM/b5wcOtcRWdrdCiGcsT0oGRlSP9z3eQwYpJy6MkALm1
         JU4Zp9hVs6Woqwc1C1PPGLIWitmiyugq6szAl1asmw0i6IBbrgq2iRuUdZRsGIvYuwkn
         bf8hEncYd4F9lJeT45CNbT1P4FkIjCsKS6kKPnLhpWnK7U4Df0LFXppoMvmHSHQGwOnN
         x8kQoZz95HnA+PmR2hJkEhFzi0eSKxnEy/ExPUqL1cIABu76GqMdJwhZIKN8ng2h/gNv
         Kq15CyNvVgOxYc7rDRuhlKo6IGzJHAk89ub2TvFM0fZJiH4EZS2BvKdWR/64ZE/023Cc
         jXqw==
X-Gm-Message-State: AGRZ1gL01QbxOz2T17eOyF6eboDx5b1Pc0FN4NVH0FB/iaItg1wmU9Em
        i7YjpeA80aQ2vRpS49CaWeRLUQ==
X-Google-Smtp-Source: AJdET5d0FY6pZsoxQnT5NEn9m/O0HpttSzArfI8Y3zJIn/M/EFbpljwG8ooaFhLFbogzGGQcdQFN0w==
X-Received: by 2002:adf:c752:: with SMTP id b18-v6mr4088793wrh.197.1541687781406;
        Thu, 08 Nov 2018 06:36:21 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id k5-v6sm5421068wre.82.2018.11.08.06.36.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 06:36:20 -0800 (PST)
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
Subject: [PATCH v8 1/8] arm64: add type casts to untagged_addr macro
Date:   Thu,  8 Nov 2018 15:36:08 +0100
Message-Id: <4a4063a3e074608b99cf22ab447fecc36d056251.1541687720.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <cover.1541687720.git.andreyknvl@google.com>
References: <cover.1541687720.git.andreyknvl@google.com>
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
index 07c34087bd5e..c1325271e368 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -101,7 +101,8 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
  * up with a tagged userland pointer. Clear the tag to get a sane pointer to
  * pass on to access_ok(), for instance.
  */
-#define untagged_addr(addr)		sign_extend64(addr, 55)
+#define untagged_addr(addr)		\
+	((__typeof__(addr))sign_extend64((__u64)(addr), 55))
 
 #define access_ok(type, addr, size)	__range_ok(addr, size)
 #define user_addr_max			get_fs
-- 
2.19.1.930.g4563a0d9d0-goog


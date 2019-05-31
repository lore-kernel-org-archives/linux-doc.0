Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9D3DE7D90F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 31 May 2019 15:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfEaPLn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 31 May 2019 11:11:43 -0400
Received: from mail-vs1-f73.google.com ([209.85.217.73]:40815 "EHLO
        mail-vs1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbfEaPLm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 May 2019 11:11:42 -0400
Received: by mail-vs1-f73.google.com with SMTP id s124so1858876vsb.7
        for <linux-doc@vger.kernel.org>; Fri, 31 May 2019 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LNEghw4B+GvmCMDyCJlZQOSF0gWgpI6UWg+d86gG2mc=;
        b=ozkPZplAJd4r//3+vEEoJahNvXQO1X4ZigVyEubSdIpqctPhuNZLdlWXMYpzn67h0X
         JreDTRTgDzX6i2a85Ia9Q+9zBKklei2FPPQbxVrT8uDoUQNOpsN/p8+BkJ1SU3yDiMNw
         1KJBsS9Szx7t+Z3QsoD17P8MBZba3PqICFgjsntr0+BzPLbSbFLUzxrI2rNF4WXbIr6B
         NjlRCy5ykAL5B1aiDgvaccG0XHNZwMHu3r2aBEaZOLLrreJ9CrY7Ieugpp59+Z5NF2U0
         xuVrgPGdqr3vuv5BoBXZKO31zh2+kuZ3KqXUUmM1Uym7mHKx3LiZMdKIk+7MQPDnNV1p
         ikKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LNEghw4B+GvmCMDyCJlZQOSF0gWgpI6UWg+d86gG2mc=;
        b=ItxvRIX883as4cwelXWrKiMwKaQv9Xz5FhIDL3MCBqgSRGVnKQRsbDgq5INiuYmOuj
         k2viYfserYK2N0Db3iG5PfRkNIz9x9laV4KUqzcDrT3gUKq2yiKm2mwudL5A7BD5xFP/
         Vsw+w5lw4yktOsYiBuTm6CmJA2FO8zdLecDho6TV1MuKE0yOU21sZPuHPTBEcJSl3Y0T
         YZ/VwaLGmXAKDvph3ijSf/dPPcSYxPZuyNfGY7Jvt6PzbAVHic8G9mEJwfW0L6ZYtggv
         fXidvk37ktpMqTjXg+NfntQ7/EEtFVSXW0Majm01Pd/7PPyqtIJrebGwYwOTmG8Sc4Dy
         YnKw==
X-Gm-Message-State: APjAAAWXyh8BltfmH9F50Mz0JTAr/65MEWLW8HI5rs8O9uCd63Hp58uj
        OUpEfOIJqbJcvgQ1JnbVb4B0VbEBMQ==
X-Google-Smtp-Source: APXvYqxMRxD/zc6HiE9yfl3teIOaD5ernl+4NfEmJo1Hwn7xZzxHUm1PC8Ix91D9Z/1irN8QwfsHq9covg==
X-Received: by 2002:ac5:c215:: with SMTP id m21mr4221628vkk.84.1559315501278;
 Fri, 31 May 2019 08:11:41 -0700 (PDT)
Date:   Fri, 31 May 2019 17:08:30 +0200
In-Reply-To: <20190531150828.157832-1-elver@google.com>
Message-Id: <20190531150828.157832-3-elver@google.com>
Mime-Version: 1.0
References: <20190531150828.157832-1-elver@google.com>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
Subject: [PATCH v3 2/3] x86: Use static_cpu_has in uaccess region to avoid instrumentation
From:   Marco Elver <elver@google.com>
To:     peterz@infradead.org, aryabinin@virtuozzo.com, dvyukov@google.com,
        glider@google.com, andreyknvl@google.com, mark.rutland@arm.com,
        hpa@zytor.com
Cc:     corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        x86@kernel.org, arnd@arndb.de, jpoimboe@redhat.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, kasan-dev@googlegroups.com,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch is a pre-requisite for enabling KASAN bitops instrumentation;
using static_cpu_has instead of boot_cpu_has avoids instrumentation of
test_bit inside the uaccess region. With instrumentation, the KASAN
check would otherwise be flagged by objtool.

For consistency, kernel/signal.c was changed to mirror this change,
however, is never instrumented with KASAN (currently unsupported under
x86 32bit).

Signed-off-by: Marco Elver <elver@google.com>
Suggested-by: H. Peter Anvin <hpa@zytor.com>
---
Changes in v3:
* Use static_cpu_has instead of moving boot_cpu_has outside uaccess
  region.

Changes in v2:
* Replaces patch: 'tools/objtool: add kasan_check_* to uaccess
  whitelist'
---
 arch/x86/ia32/ia32_signal.c | 2 +-
 arch/x86/kernel/signal.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/ia32/ia32_signal.c b/arch/x86/ia32/ia32_signal.c
index 629d1ee05599..1cee10091b9f 100644
--- a/arch/x86/ia32/ia32_signal.c
+++ b/arch/x86/ia32/ia32_signal.c
@@ -358,7 +358,7 @@ int ia32_setup_rt_frame(int sig, struct ksignal *ksig,
 		put_user_ex(ptr_to_compat(&frame->uc), &frame->puc);
 
 		/* Create the ucontext.  */
-		if (boot_cpu_has(X86_FEATURE_XSAVE))
+		if (static_cpu_has(X86_FEATURE_XSAVE))
 			put_user_ex(UC_FP_XSTATE, &frame->uc.uc_flags);
 		else
 			put_user_ex(0, &frame->uc.uc_flags);
diff --git a/arch/x86/kernel/signal.c b/arch/x86/kernel/signal.c
index 364813cea647..52eb1d551aed 100644
--- a/arch/x86/kernel/signal.c
+++ b/arch/x86/kernel/signal.c
@@ -391,7 +391,7 @@ static int __setup_rt_frame(int sig, struct ksignal *ksig,
 		put_user_ex(&frame->uc, &frame->puc);
 
 		/* Create the ucontext.  */
-		if (boot_cpu_has(X86_FEATURE_XSAVE))
+		if (static_cpu_has(X86_FEATURE_XSAVE))
 			put_user_ex(UC_FP_XSTATE, &frame->uc.uc_flags);
 		else
 			put_user_ex(0, &frame->uc.uc_flags);
-- 
2.22.0.rc1.257.g3120a18244-goog


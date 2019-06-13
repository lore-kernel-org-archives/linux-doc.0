Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8F4F67D923
	for <lwn-linux-doc@archive.lwn.net>; Thu, 13 Jun 2019 15:19:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732290AbfFMPTm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 13 Jun 2019 11:19:42 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:39115 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732128AbfFMNAN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jun 2019 09:00:13 -0400
Received: by mail-vk1-f202.google.com with SMTP id d14so3943093vka.6
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2019 06:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qVLSMyZ68L0nEVi2BC3Nmk92s+29uFb8AJSu612sAz8=;
        b=dGsiipATNwnIhD09a+ywJNlX3kBy1BoKT7QWeOJevth/ZUI14cAzOgTEiSkcc3R/Nl
         Drd86Fo+aCob34AQ8IH4uRaXQm2UoTNyga1ijOW77hPSr0dcOURGrH9TCJ1kgyoeWL4J
         ZLzEO2AM/eFNuZlbbmZCmt4El6Iis/EKF52EsbeWlsmyQgs/bnuOWFqd5mDvTgFOkof1
         Kj1PMVruAz2bcZYTVmpImnfDwa3lSrtjiWlHuZ9+mGV0CEB/kd0ZzLsY/IMRsFbd29zw
         3RiWuyVwae3KlTxcOKNUoF0rJhpy7X3PrabbmlukMUCXkR24heBWe7GJNMo2FiFU5h2N
         mrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qVLSMyZ68L0nEVi2BC3Nmk92s+29uFb8AJSu612sAz8=;
        b=PCVe5ORTbMrT7ASQ/2C9i3snGT3coQXlaewHOJIe1328w7V5am779ZodDA3hKOJt+a
         2X3EEZxxCInzTys6O8GJuNT960wfR64sg4h4Qh01D5VkJtsgIUq4Qx5WjVtqTpAqHEBn
         vqe1YM/Jz9qyK+JWP5DTATS05qKmHQzXtkcwTbls9e1oj5ndjG9nSh6LzagOL8q5FW7z
         SjXHcpGB5zm73ZDGsNLKIbu9SqAn3UzcCTohj5RMajGruZCnzS9sonFuGbGq8QamrXUc
         glz9VzsZxsVHKhNQeB+UtYVnNM1mIb+e0vki/jmjsIxXaJCdJJ727hh5O+s40N4vmBE5
         WsLA==
X-Gm-Message-State: APjAAAV2JO85NVsb/qN02qSydX7UMp+2tsDe52mOtvBAX3vhHz3N6bJL
        9jcrSSZZySr9poazzmPtEKvydqRtsw==
X-Google-Smtp-Source: APXvYqwIkh5ybwW5U+fhYXS+Mg+H4Dpu74Esg4xJJN0/7fjc8NfndIfgq1BqUiUvvatAz90Z2v/hm+wCyQ==
X-Received: by 2002:a1f:16c9:: with SMTP id 192mr19622676vkw.54.1560430811770;
 Thu, 13 Jun 2019 06:00:11 -0700 (PDT)
Date:   Thu, 13 Jun 2019 14:59:49 +0200
In-Reply-To: <20190613125950.197667-1-elver@google.com>
Message-Id: <20190613125950.197667-3-elver@google.com>
Mime-Version: 1.0
References: <20190613125950.197667-1-elver@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v5 2/3] x86: Use static_cpu_has in uaccess region to avoid instrumentation
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
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
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
2.22.0.rc2.383.gf4fbbf30c2-goog


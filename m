Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BE8C49361
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 23:30:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AF6D60FE9
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 23:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234564AbhFRXc5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Jun 2021 19:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234510AbhFRXc5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jun 2021 19:32:57 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49418C061767
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 16:30:46 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id x13-20020a0cfe0d0000b0290264540cb5d3so5713804qvr.17
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 16:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=GT5JptlSj0sw8R+tCH0fy57H3f0kVdV+hvtI1tBUIUc=;
        b=wVvV0Fa27Lb8Z2PV4NyLQF0JST7GyFqtwIfj5zFP8Eu3Xd2dSDFul/J5JcatnGCqBp
         WHzYKm7IJw9gZZ7RTvDfwn0Yh/hGoUEzSwjmzc1rPHCQoRrVcLOgABGbYfk5aZvmSLqd
         nG+DOtRKevSmvJQ3bhBaNDfnFORd+r4y7b9HyNathMtcpwzOUFgidNCS4w3ATAFXgbKU
         gZDXVkpQd8ENg99w2pJF6BpddYfpwMuwKQHAL512uKb8pUDS6IFhlddSTCYcNKf+TZl5
         T2q8gF1TV3Ceac2665HCszeNI48gex0VE0aHX97LJYAkY3YBmJH0eVtarlXN4h2hAzG2
         6vPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GT5JptlSj0sw8R+tCH0fy57H3f0kVdV+hvtI1tBUIUc=;
        b=hjcXNwCeVTyg41jFORYdn0ib2sjndgm4ZjboSElC5yuUsLNUKy9aRyvGlqa9E9RYpI
         QPKIz8zlGLggEbK0BGyQXNagdH76pe+CipBR42FcOFadud6pRfiBd3ARCKmJOftMrcaJ
         jz/VSfkCHmq9AK5utpvh2v3YovUZtYuXMl7bPrmXR7T8syz7o05efnakpQMJOpbRHg0n
         RRXPPPrXMflOKBknzDfU8f5j5MvG55+uLJLjJ92F59PzVDBNXk2CtCcpjK4DIWVGpV/M
         8NscvlVzdjmaj3UpzdXI+ISGQaD6NsnJLnT6BzVXUFFp4g6SEMtT0OuwVw4hkIQlL0qu
         FrnA==
X-Gm-Message-State: AOAM531D/caS8ZWvpTETA/NKIrFHCcbDldwBqySmGdvIWxqCYefOBAQD
        3dSSbrYE+/tdteredCbDqR3oNuH5IQnFEoUo7po=
X-Google-Smtp-Source: ABdhPJzxlJWcj8oyBsJfqxL8nOlQwZvVqBAOvLuh7YDYpvbPPeYy1z90tcGn2hRA4kY1Kr+cbeWpGFgv0DeVM1hOqr0=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:7c41:e84c:8fcb:6664])
 (user=ndesaulniers job=sendgmr) by 2002:a25:bb08:: with SMTP id
 z8mr17100019ybg.188.1624059045337; Fri, 18 Jun 2021 16:30:45 -0700 (PDT)
Date:   Fri, 18 Jun 2021 16:30:22 -0700
In-Reply-To: <20210618233023.1360185-1-ndesaulniers@google.com>
Message-Id: <20210618233023.1360185-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210618233023.1360185-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
Subject: [PATCH 1/2] compiler_attributes.h: define __no_profile, add to noinstr
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

noinstr implies that we would like the compiler to avoid instrumenting a
function.  Add support for the compiler attribute no_profile to
compiler_attributes.h, then add __no_profile to the definition of
noinstr.

Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Link: https://lore.kernel.org/lkml/20210614162018.GD68749@worktop.programming.kicks-ass.net/
Link: https://reviews.llvm.org/D104475
Link: https://reviews.llvm.org/D104257
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80223
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/linux/compiler_attributes.h | 12 ++++++++++++
 include/linux/compiler_types.h      |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index c043b8d2b17b..cf584a1908b3 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -33,6 +33,7 @@
 # define __GCC4_has_attribute___externally_visible__  1
 # define __GCC4_has_attribute___no_caller_saved_registers__ 0
 # define __GCC4_has_attribute___noclone__             1
+# define __GCC4_has_attribute___no_profile            0
 # define __GCC4_has_attribute___nonstring__           0
 # define __GCC4_has_attribute___no_sanitize_address__ (__GNUC_MINOR__ >= 8)
 # define __GCC4_has_attribute___no_sanitize_undefined__ (__GNUC_MINOR__ >= 9)
@@ -237,6 +238,17 @@
 # define __nonstring
 #endif
 
+/*
+ * Optional: only supported since clang >= 13
+ *      gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80223
+ *    clang: https://clang.llvm.org/docs/AttributeReference.html#no_profile
+ */
+#if __has_attribute(__no_profile__)
+# define __no_profile                  __attribute__((__no_profile__))
+#else
+# define __no_profile
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-noreturn-function-attribute
  * clang: https://clang.llvm.org/docs/AttributeReference.html#noreturn
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index d29bda7f6ebd..d509169860f1 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -210,7 +210,7 @@ struct ftrace_likely_data {
 /* Section for code which can't be instrumented at all */
 #define noinstr								\
 	noinline notrace __attribute((__section__(".noinstr.text")))	\
-	__no_kcsan __no_sanitize_address
+	__no_kcsan __no_sanitize_address __no_profile
 
 #endif /* __KERNEL__ */
 
-- 
2.32.0.288.g62a8d224e6-goog


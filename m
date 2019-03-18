Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7737C7D91B
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 17:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfCRRSA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 13:18:00 -0400
Received: from mail-io1-f74.google.com ([209.85.166.74]:40229 "EHLO
        mail-io1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbfCRRR7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 13:17:59 -0400
Received: by mail-io1-f74.google.com with SMTP id e72so7858172iof.7
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 10:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=k1ksHzqcIFCs0rlhYrsau26vl3ocVueBBoKnHNKxr50=;
        b=oz1fvLMfcGfF81Olx8UNQHEZSNueq6Qn8HIXigOddOJDAD2tg4UjJfuFuQZjoILWrg
         CZQbFlcBOVlSuoBIyl+jHf6+DdY1aYxqiZ+PbKmfk+lr5pHfcoSSl29R6PrgmkRv2+Vt
         jaBUYlq/IjUpt3LjnPub3yHlYsiou77HiwqH/RPJgcNyMlQiwfZhgtvbqZ2qkfe+w8YV
         JszqgrO+qE+QbtWQuzywwpj8p6QWhPyanRNQsRRsaA1VHxFYfquhluxhBFXc65JKlppp
         Ta4otXITXmaoRx/+KSZjVysEXe12wNPaDhCUR3L2hY/+Bjcp+T9no9YB/s9yH1290+KX
         DWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=k1ksHzqcIFCs0rlhYrsau26vl3ocVueBBoKnHNKxr50=;
        b=Dpa1oq9PXtBUCldl97LobZ4jPAiDif0xQKEpvsDqphEazpb24LyLGY8TNXZgb0mqhJ
         HuCeISxG+YroCNEm22u16+YIwGdQtAtLxM7FXgfqDVI6QxSFvU451ICSbJVL/oqh6UJH
         pNFMQ7rJEtBR0SmM34Tc5/ORrr3P9A1gBUcUpmt3d2SJl93Eknf/L6JapwB35s9Yt3Z0
         T1RIB6pCjTEFspfOzQP/u4w0s39UWUY81zAKD1lNzgCFrh5LID45WLpDugyLUKBteU/K
         qRZSjBda3gFN/1NrquVJMwnY+ikQoVjfPpTwa9Fn/A0n6AnKz0qJyyIA9KOIbhEV/tI0
         YNSg==
X-Gm-Message-State: APjAAAWZ94YWMLBu7MyDHPgPZYZ8vHlng9DAVgEreDKHwDWncG4b3uf6
        GA7cSLBnN+lV+LAsO7lnW8OFQfgk/oT+n1y3
X-Google-Smtp-Source: APXvYqzY2/zsv7O6GF0gVVMoQ0dZ1/muXN5k1+3Ljt96vcewESoCRYK8ve5Pym7TRNy6ing4+VelgBsDa+oWzLVC
X-Received: by 2002:a24:29c5:: with SMTP id p188mr10832598itp.4.1552929478230;
 Mon, 18 Mar 2019 10:17:58 -0700 (PDT)
Date:   Mon, 18 Mar 2019 18:17:35 +0100
In-Reply-To: <cover.1552929301.git.andreyknvl@google.com>
Message-Id: <f7fa36ec55ed4b45f61d841f9b726772a04cc0a5.1552929301.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1552929301.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.225.g810b269d1ac-goog
Subject: [PATCH v12 03/13] lib, arm64: untag user pointers in strn*_user
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
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
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
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

strncpy_from_user and strnlen_user accept user addresses as arguments, and
do not go through the same path as copy_from_user and others, so here we
need to handle the case of tagged user addresses separately.

Untag user pointers passed to these functions.

Note, that this patch only temporarily untags the pointers to perform
validity checks, but then uses them as is to perform user memory accesses.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 lib/strncpy_from_user.c | 3 ++-
 lib/strnlen_user.c      | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index 58eacd41526c..6209bb9507c7 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -6,6 +6,7 @@
 #include <linux/uaccess.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
+#include <linux/mm.h>
 
 #include <asm/byteorder.h>
 #include <asm/word-at-a-time.h>
@@ -107,7 +108,7 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 		return 0;
 
 	max_addr = user_addr_max();
-	src_addr = (unsigned long)src;
+	src_addr = (unsigned long)untagged_addr(src);
 	if (likely(src_addr < max_addr)) {
 		unsigned long max = max_addr - src_addr;
 		long retval;
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 1c1a1b0e38a5..8ca3d2ac32ec 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -2,6 +2,7 @@
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/uaccess.h>
+#include <linux/mm.h>
 
 #include <asm/word-at-a-time.h>
 
@@ -109,7 +110,7 @@ long strnlen_user(const char __user *str, long count)
 		return 0;
 
 	max_addr = user_addr_max();
-	src_addr = (unsigned long)str;
+	src_addr = (unsigned long)untagged_addr(str);
 	if (likely(src_addr < max_addr)) {
 		unsigned long max = max_addr - src_addr;
 		long retval;
-- 
2.21.0.225.g810b269d1ac-goog


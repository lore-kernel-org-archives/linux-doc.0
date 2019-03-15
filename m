Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CFD1E7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Mar 2019 19:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbfCOTwn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Mar 2019 15:52:43 -0400
Received: from mail-yw1-f73.google.com ([209.85.161.73]:39884 "EHLO
        mail-yw1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727565AbfCOTwZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Mar 2019 15:52:25 -0400
Received: by mail-yw1-f73.google.com with SMTP id f67so13134476ywa.6
        for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2019 12:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=sAfWvHiPwt89rwowuJd122MWpb2hIcncHtjST15rjKY=;
        b=m8TjLlxTJg+rOoEWUReYdn8rdh11EMoghrFHbVAb9WAMjVa0U/T9FqdGOvqwTZpUfm
         vVbcFLqWrP3TVwdj34DrYszJNIoQ9EJXeAXrC/wvs/z5IYKQAqYP9RwBD+8emDJu5PVP
         Vo+huuqc6PHspT4+rXUR6NPieF9KLiWfhrJ7gi13d3MatbDKM4RF0bkO2DrrarQnmyYR
         3h3NjRcSXCNOJ75ka4ui6zatbnk/g1PfEFqJlZRnqOTJFOnY1jqqoDx3fG9sQrGexBtX
         ZZ96/DuknTpKXEYqtVY62yQBCWP1T+ifr5PT3FJRXj7RVMG+M4Fgps93zJ4tkNbNYwin
         RjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sAfWvHiPwt89rwowuJd122MWpb2hIcncHtjST15rjKY=;
        b=RCZRfpYaLHxEMsKS7UBCkVhwezRSXjomtePylK1FI1HxqzVZX5S9/z5D93+wtMjHoQ
         9/B9BRPgAP3l5SWatXYuCiSRbfCV947RTMBRUVz0juZy21bqEcQdr2D5zRXZbp+YYVLr
         5PEppydlSkMwbNsbIDL1LIZw9tIBwBTi20gvfEaJdC1jJA/pwCH2ehNkdZsKt+ii/GYJ
         7xNHnqxQO41Xmj0MiU/0tk/09V5qe8YlQmjX+t+x200jz3RFeO09cU4QDJ65Dn+1cFtB
         5VH52FxXm3HcKXei74RmLi0irWyQhnbbUJTQ9p6ZP95oHbDACCG+AAKe+niG6nmJ3kfd
         bh9g==
X-Gm-Message-State: APjAAAWuOQCeKt65E9WFgdkwXUQw1xqxcDSttTaZtbFPPh7UIwCA5/FQ
        f2xz/Fpd4uNqm8Y0zkr2yr3EcmDbXEmAEJQF
X-Google-Smtp-Source: APXvYqx6fJ/Xf2Wycfnq24ZgFIr73HZ4gPKerA6ul2fF+VVXr0NweKm2RI8g9OR3XNR3hwcUmUxVL0qXK1MAydWo
X-Received: by 2002:a25:41c2:: with SMTP id o185mr2528725yba.96.1552679544923;
 Fri, 15 Mar 2019 12:52:24 -0700 (PDT)
Date:   Fri, 15 Mar 2019 20:51:37 +0100
In-Reply-To: <cover.1552679409.git.andreyknvl@google.com>
Message-Id: <bf0abceeaf32e6b9cdbc9dde45cc5966b5747ec4.1552679409.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1552679409.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.360.g471c308f928-goog
Subject: [PATCH v11 13/14] arm64: update Documentation/arm64/tagged-pointers.txt
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

Document the ABI changes in Documentation/arm64/tagged-pointers.txt.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 Documentation/arm64/tagged-pointers.txt | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/Documentation/arm64/tagged-pointers.txt b/Documentation/arm64/tagged-pointers.txt
index a25a99e82bb1..07fdddeacad0 100644
--- a/Documentation/arm64/tagged-pointers.txt
+++ b/Documentation/arm64/tagged-pointers.txt
@@ -17,13 +17,15 @@ this byte for application use.
 Passing tagged addresses to the kernel
 --------------------------------------
 
-All interpretation of userspace memory addresses by the kernel assumes
-an address tag of 0x00.
+The kernel supports tags in pointer arguments (including pointers in
+structures) of syscalls, however such pointers must point to memory ranges
+obtained by anonymous mmap() or brk().
 
-This includes, but is not limited to, addresses found in:
+The kernel supports tags in user fault addresses. However the fault_address
+field in the sigcontext struct will contain an untagged address.
 
- - pointer arguments to system calls, including pointers in structures
-   passed to system calls,
+All other interpretations of userspace memory addresses by the kernel
+assume an address tag of 0x00, in particular:
 
  - the stack pointer (sp), e.g. when interpreting it to deliver a
    signal,
@@ -33,11 +35,7 @@ This includes, but is not limited to, addresses found in:
 
 Using non-zero address tags in any of these locations may result in an
 error code being returned, a (fatal) signal being raised, or other modes
-of failure.
-
-For these reasons, passing non-zero address tags to the kernel via
-system calls is forbidden, and using a non-zero address tag for sp is
-strongly discouraged.
+of failure. Using a non-zero address tag for sp is strongly discouraged.
 
 Programs maintaining a frame pointer and frame records that use non-zero
 address tags may suffer impaired or inaccurate debug and profiling
-- 
2.21.0.360.g471c308f928-goog


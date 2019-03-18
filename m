Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 396127D917
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 17:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbfCRRTv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 13:19:51 -0400
Received: from mail-it1-f202.google.com ([209.85.166.202]:58547 "EHLO
        mail-it1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfCRRRx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 13:17:53 -0400
Received: by mail-it1-f202.google.com with SMTP id 9so15132263ita.8
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=20ADMBvUHCnrZbwN97RAJ/EQy38heFRI/sJcSeCbm08=;
        b=ZCnCpHapZTf/qLS1N3vuiLVDpuei/65u8OAdfxmbj9C6UycfT7l0asJ7ukPP0vA4Qi
         HwZtqNnAkTEZNxdFQ6ErXg2Ws9tH+1NRLw2LH+z6sEsmpFcEdBiI9Wc+uKPOo3gmlZBe
         qurf9ufUqK/sY8KXNWAv2He9kNybaZ4j8MY9rM8iGvsQzRNy7m2xQuCJRiBD6UV/MuZG
         ZknYNqa6eOMfTCYDnGvBMcFPTyz86UhzqH2sZgKXS34VV/J9Ek9ZWHRf9Zq9g9xbx/V/
         tDLUy208+7acHrCH16I/7nTUTuPpcoiSwjw+gJftawG7U+l13wzbQ4qY22WWvgzkuT8P
         l0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=20ADMBvUHCnrZbwN97RAJ/EQy38heFRI/sJcSeCbm08=;
        b=AcOeFzKrQNfTli2D8RmdEUzdA50w4rtxxJFsNDZ1A5Kp0fCVb+Zls8CQ9RmCro6O1j
         UdiDkaHshq3NZ3b4PiIGLkdTNWYJmTcahF1NJt2i58Pb5cqSCZCc36N8HgChnu7V8BiF
         Z6Zr39VU2IGnLObxXh+3K1K6bPc0DF/q4qbH/iwr6cG7YgT8MgO4lGpb6MhkgqohDivK
         G2gS3emK8sZ1KUS1tpI0MSUhHpyDAEwsl1ZrtLceDehLRecxOnAn7B99HI9Djup522m5
         h+nTGqXIYOUzZR01jVOwbg2vx34s7WMcaPyu8DEh4X5lEwk0GEg5F35Z3kdaGGP15e+z
         KOgA==
X-Gm-Message-State: APjAAAVYFpY+LDqAU5WGFoV9osQkLGtONSHao5xKQ0iHC0OG41e73PBU
        XsjPzBJGgPjo85awz1WrGt32h6hZ4Ceht03X
X-Google-Smtp-Source: APXvYqyopOaWYQMzQnTkhFFHOoZPkt1VBsocl/ck7RQXsYYUFcmBQwiieFFWtWCSqUlJhczEtHKAp8R/wIOv7CVC
X-Received: by 2002:a24:4503:: with SMTP id y3mr10296221ita.32.1552929472134;
 Mon, 18 Mar 2019 10:17:52 -0700 (PDT)
Date:   Mon, 18 Mar 2019 18:17:33 +0100
In-Reply-To: <cover.1552929301.git.andreyknvl@google.com>
Message-Id: <bee403f76b40f37c6790d144a4142f293e0a7d9f.1552929301.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1552929301.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.225.g810b269d1ac-goog
Subject: [PATCH v12 01/13] uaccess: add untagged_addr definition for other arches
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

To allow arm64 syscalls to accept tagged pointers from userspace, we must
untag them when they are passed to the kernel. Since untagging is done in
generic parts of the kernel, the untagged_addr macro needs to be defined
for all architectures.

Define it as a noop for architectures other than arm64.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 include/linux/mm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 76769749b5a5..4d674518d392 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -99,6 +99,10 @@ extern int mmap_rnd_compat_bits __read_mostly;
 #include <asm/pgtable.h>
 #include <asm/processor.h>
 
+#ifndef untagged_addr
+#define untagged_addr(addr) (addr)
+#endif
+
 #ifndef __pa_symbol
 #define __pa_symbol(x)  __pa(RELOC_HIDE((unsigned long)(x), 0))
 #endif
-- 
2.21.0.225.g810b269d1ac-goog


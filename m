Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1A49B7D9ED
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 17:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfCRRSZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 13:18:25 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:56590 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbfCRRSY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 13:18:24 -0400
Received: by mail-qk1-f201.google.com with SMTP id s87so11188581qks.23
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 10:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=y0pmDLbK+7BSAh5x56WEIsXOyLAwrKLQOAsadcipF54=;
        b=n6mK8qGBi8yC21LmjABra3FF+XTvfgLYZr9bPF1sHZ9sen0usXtJo9r8UWpIWYoDEs
         YEss5ttEDAL6lIbgFyj4X628k4cUup4CCMJ0VLQ4ftrPTG+rRMptHjumdErdUDl9ISYY
         rB+TuyC09kttxpZuExC8/+TH8Y8tVKRukuxPYVczcjDCqo+QtLbM9TmxH0fH4rTQxur3
         7pLUDwD0Z21jyoNe+FO+hi4d+W5N8IZjBamLALgbuY36eoX0Noj2JHkXsAIpP352R88b
         ntHc4rkT8wXoHbCbhE2dgY+nunbgZmc/Jf/sc4zQqGibHR6/JS9I5KqLldKTT6WFAxiu
         sHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=y0pmDLbK+7BSAh5x56WEIsXOyLAwrKLQOAsadcipF54=;
        b=TKSAMZMka4+kbegJh/EbcOQJ//vkXfQcZkSk1EDlLpPsn4Jud8VtOW+w38eCIHJJLp
         zWmRIQ1J14UVpty6JwEU/wGhk+6rSa7Z/3arqBoIZi1jGt+7YlY11HhmrTpIsBDxXQC+
         M8tUd12ph0XBExTruhFeiYKm79AbFN/G2yTyV/Kmx1t1hdlEvf+xIJYk9Ky3OItVZgNO
         ZV8o+IOXdBTH3mT+0TTAmW5V/oR/ojbM9U563cXY0q6J0HI4GIUpNpTj5k/wm/8/u8Tn
         rlN+pXVewLS8ulK04NegPD3uYcN0irocuvcAg+59P/Xyw4cfAmsFNOcqULDMMuc2EMVr
         1vdA==
X-Gm-Message-State: APjAAAXdFCIjB3Ul1BzJtzQVd5+cCd2NEEkE0A7/DMpPS99KHIgwVA56
        Bp+ufbixurU/nYVuT7UDRB6ixCG0rVz/RNXu
X-Google-Smtp-Source: APXvYqycOMQXhB7LunCtJ2mSN8JG36V+ND4YFbv89PhbTN2edqY1ONzRmnxPOCaXOMvcqg83reHV4EVl11OVLG5G
X-Received: by 2002:ac8:2e7a:: with SMTP id s55mr10982902qta.34.1552929502878;
 Mon, 18 Mar 2019 10:18:22 -0700 (PDT)
Date:   Mon, 18 Mar 2019 18:17:43 +0100
In-Reply-To: <cover.1552929301.git.andreyknvl@google.com>
Message-Id: <b24adf53a968b50ba84630f86136ee1251e12a9d.1552929301.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1552929301.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.225.g810b269d1ac-goog
Subject: [PATCH v12 11/13] uprobes, arm64: untag user pointers in find_active_uprobe
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

find_active_uprobe() uses provided user pointer (obtained via
instruction_pointer(regs)) for vma lookups, which can only by done with
untagged pointers.

Untag the user pointer in this function.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 kernel/events/uprobes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index c5cde87329c7..d3a2716a813a 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1992,6 +1992,8 @@ static struct uprobe *find_active_uprobe(unsigned long bp_vaddr, int *is_swbp)
 	struct uprobe *uprobe = NULL;
 	struct vm_area_struct *vma;
 
+	bp_vaddr = untagged_addr(bp_vaddr);
+
 	down_read(&mm->mmap_sem);
 	vma = find_vma(mm, bp_vaddr);
 	if (vma && vma->vm_start <= bp_vaddr) {
-- 
2.21.0.225.g810b269d1ac-goog


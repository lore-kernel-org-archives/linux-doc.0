Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 140D57D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Feb 2019 12:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfBVMyN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Feb 2019 07:54:13 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45033 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727294AbfBVMxv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Feb 2019 07:53:51 -0500
Received: by mail-wr1-f65.google.com with SMTP id w2so2232586wrt.11
        for <linux-doc@vger.kernel.org>; Fri, 22 Feb 2019 04:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mpZDvMXD49QdxJt8wpvUxUfka//FLmK5Q3bpesHxKPk=;
        b=N/CagzxODuKekdv/276f71hXtTpFv4KVsTM9wpsQCTigrrhdbo1a8DtexWnL0uLpkO
         18omeTVoB8fzJ0j5vhRXb57XZU1dQgAzOHIdQfbKZw9pdxjklam5LDKdghq0pF7kUS4k
         TSktr+912xlWRX6ndEx5vBw3TcYrt2b8W0OjFZ0QWHqpApAu8Ul9v1iLffz1Em/x0Xya
         i4dGp/mgL49JMPe5c8rQczRqypr/Nip2+Eha9JF7UL97GTTb+ns7m5QrUYDBTdT9jbCq
         BDRsMTGNRmV1HHpb/DISeZc2DQhKRnEurBM5elN5TifJa0lXs64tIKkY6Q2oGNBe/Q7A
         j6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mpZDvMXD49QdxJt8wpvUxUfka//FLmK5Q3bpesHxKPk=;
        b=aiTgUXSrWjVbxJXwJgnTERBZeAcM/q+7Zc+b6cCmvjswTIW85w1myHpuhDnL5fI91i
         4KO0xoP+IPcMv8fE/lc7N933YfTfHU7AvQM6mIAKZSiaJZ+faFtVXme5JWGL4Mk9L3mv
         MMR7lyZSoDDeKcjk0knjJP0NYOhGhomXFQbH5qQKgj+ZW3QF8t8eT3l4sPwc99wAUNJv
         J0hIM2u4r1Tlz2QIELLPj14t1FJ+Eu7Fx6JuzNqyiTlvNuEbXnU8WxppgaUw+G62gchm
         yvXpL2/+3PZnarVnnD7MXywxUIbReGehNZJ1BCx+7sTJSl/Cetc82qtNQMEJXJbg5Geh
         fh/g==
X-Gm-Message-State: AHQUAuai5sidAf5LRK/sZnJJ3nZn7ZZWTfWwbukfIaPmAztB4zlZj1/3
        c3AH0qvlS519AnB7akyWylsC4g==
X-Google-Smtp-Source: AHgI3IavQme072cpLVKWYOoRpuCla4tOdeXjezjFtFrbJI9VPdNaXp7MfZlgZAflIs5r0SUzqIri2w==
X-Received: by 2002:adf:fecd:: with SMTP id q13mr2883485wrs.3.1550840029193;
        Fri, 22 Feb 2019 04:53:49 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:13:8ce:d7fa:9f4c:492])
        by smtp.gmail.com with ESMTPSA id o14sm808209wrp.34.2019.02.22.04.53.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Feb 2019 04:53:48 -0800 (PST)
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
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v10 10/12] tracing, arm64: untag user pointers in seq_print_user_ip
Date:   Fri, 22 Feb 2019 13:53:22 +0100
Message-Id: <99b59c349ed81d4b204353f54b89f930f01d6ee3.1550839937.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.rc0.258.g878e2cd30e-goog
In-Reply-To: <cover.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

seq_print_user_ip() uses provided user pointers for vma lookups, which
can only by done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 kernel/trace/trace_output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index 54373d93e251..7c893328f97b 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -379,7 +379,7 @@ static int seq_print_user_ip(struct trace_seq *s, struct mm_struct *mm,
 		const struct vm_area_struct *vma;
 
 		down_read(&mm->mmap_sem);
-		vma = find_vma(mm, ip);
+		vma = find_vma(mm, untagged_addr(ip));
 		if (vma) {
 			file = vma->vm_file;
 			vmstart = vma->vm_start;
-- 
2.21.0.rc0.258.g878e2cd30e-goog


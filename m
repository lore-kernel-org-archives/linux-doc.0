Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8C45A7DC63
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 17:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbfCRRSN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 13:18:13 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:52795 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbfCRRSL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 13:18:11 -0400
Received: by mail-pf1-f202.google.com with SMTP id a72so19765554pfj.19
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 10:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=MRHHZYm6qbbddi64ikktRuAjn8BoXK8Gf7bv/2tC2r0=;
        b=YFFN0pzAH8aZKTAjwEnRibFpDgHMBLVgE+Y/H6BldyMJfISdxeV4TieTiwWBUf4++h
         5qPE8agzsmBOu94H7aWR8TKMxJHOgpBxp+05T//MmjQV6X0IOo3LoMT6g453xDS32JNL
         uEO1aHTq8Rnk2u7skv3uFK7PlcfyAPVOgEppwAZwtzGwNkP4ro6UBD/uLtdfnq9xy7XW
         XO0COxSTv1Jmnv80OnZ2/0dsLvQrl7sHFJMan50DHp20r8EaWagDzYNNog4tZOIZ3oMY
         w/ooiTzJSI12lW99h0KIupXV6luZppWPt/ReHe66F1061arfZzk+YHF0fBmf1FEO1sRB
         IxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MRHHZYm6qbbddi64ikktRuAjn8BoXK8Gf7bv/2tC2r0=;
        b=J5NtvExSEC1ItiddJ08I8PKoIAzo4zr0Em1EkauPG8rAnlcIQcWWtGaLt0N78ssP2s
         cBkmwNQkjAD8+3Y0HNAWQhu3R2bu/LYO1O/BQt0LkFuHmW1YtmPQKU+KAPineT1PqEzW
         vqtAV9E+7xJuvz6V5zPHP150OFaiSdZH5Kc6oN4icZt13x+sPVE6jBBdYiTomh3z2Xaz
         mNigDguD+DUeIVQlIMs4SmD5OKrURDBT6kEJZYWhhi+kRExiMC39/ypQVoZS3L/gNll5
         NNauKwyt/DZcL0qo5lP1LkI4ZNQBIabZK/SmjL2iAvVl/YbFpy7Vtg2mefRRRafqS++O
         KYTQ==
X-Gm-Message-State: APjAAAWKZRy336gqcGuSgrC/hH2CvFK5cnwuFHVS0IrNPmKBe5Qzi5Bu
        vxpry3/LeNhsRmV3LeoUHV/NlBnyMnfPuyRm
X-Google-Smtp-Source: APXvYqwaXHvEHlP/j2S09wr/+VgOKvwauhGMa/tD/zVNDmmjkYJkKZn9iKzY6FKhtrC83z5lWNUQLgPCNgcfil0L
X-Received: by 2002:a63:4964:: with SMTP id y36mr7052420pgk.60.1552929490581;
 Mon, 18 Mar 2019 10:18:10 -0700 (PDT)
Date:   Mon, 18 Mar 2019 18:17:39 +0100
In-Reply-To: <cover.1552929301.git.andreyknvl@google.com>
Message-Id: <4368bfa2a799442392ee9582dd1cccb8c96e524d.1552929301.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1552929301.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.225.g810b269d1ac-goog
Subject: [PATCH v12 07/13] fs, arm64: untag user pointers in fs/userfaultfd.c
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

userfaultfd_register() and userfaultfd_unregister() use provided user
pointers for vma lookups, which can only by done with untagged pointers.

Untag user pointers in these functions.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 fs/userfaultfd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 89800fc7dc9d..a3b70e0d9756 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -1320,6 +1320,9 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
 		goto out;
 	}
 
+	uffdio_register.range.start =
+		untagged_addr(uffdio_register.range.start);
+
 	ret = validate_range(mm, uffdio_register.range.start,
 			     uffdio_register.range.len);
 	if (ret)
@@ -1507,6 +1510,8 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 	if (copy_from_user(&uffdio_unregister, buf, sizeof(uffdio_unregister)))
 		goto out;
 
+	uffdio_unregister.start = untagged_addr(uffdio_unregister.start);
+
 	ret = validate_range(mm, uffdio_unregister.start,
 			     uffdio_unregister.len);
 	if (ret)
-- 
2.21.0.225.g810b269d1ac-goog


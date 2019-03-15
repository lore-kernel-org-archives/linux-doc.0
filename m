Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E705D7D982
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Mar 2019 19:54:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbfCOTxw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Mar 2019 15:53:52 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:55355 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727371AbfCOTwG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Mar 2019 15:52:06 -0400
Received: by mail-qt1-f202.google.com with SMTP id h51so1938338qte.22
        for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2019 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=z6K/c9VtqxQi5aBAmUht43d+X7x4sfj8BAD1AB++2bA=;
        b=BOrKvCBJgVmoeAFlZRf59PYgkXTKjrRMRrX63X976vqS2WZ9qHZEKHeBVwJtTWhSuu
         lUvSWiTVC/sbszWaQppDDR/3GWTkX31v65WrFbh4cWKv7GdWuy0PXeDkNLjKRPen898X
         V9cymVDbaCKNbzgoG3JjfivP1S/Za/rbL9bJ2fcItc9gQOVwpi9wJOepWPz1VdAZPUT1
         cjQr07t64SwJCV+OZh/j0pkNHMF9Z/MNDj5cHLhFPLalavSnR7OPvVyx0xN4qyU3goh4
         CsFQJ7ZthwFgkdSG7A7Q7uo8+32OwkFTx9gfh1M9rs57t4EWTuZWy/0ZLkAzrIEKwWdx
         tB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=z6K/c9VtqxQi5aBAmUht43d+X7x4sfj8BAD1AB++2bA=;
        b=KvBwh0e7PX47gQy5/54Dp7OPxT8guGy/qhH6JSZUrGPeui4qtJWx/qJX5AD4DsNjZc
         EV1TBJrj6ApI9uejQ9NHrJbqdweHGxO6kS0VOMMwXWoTdLD9yvXFmwxR1sRik/HTyjbT
         JzQyBB2tE+uhfedG1ibHripeiPudBjnJp9p8sUHB0vs8/b49HLDDq8xq4ev3URl/58Hf
         kCSoAZFhM8eb7bwyP79hLa+5lD0a3NZkxD3BsaEVGgr9zBVo8FcS0jXF6RgDOkdxlnd8
         laFXiegRzD0lj4Zz8917a6Pc/aqta2jPD6JzkW6qSYceFmtH0IceZ1JLr8dW+aqMYZx4
         XR2w==
X-Gm-Message-State: APjAAAWLFD2ZogodgwUEXZcaJmuVwJEkMuKDPmW8dICJVydYo2OueeT6
        6FDP9bzrUz2y7l8Sl2rLq3FFpISw6qFygzmO
X-Google-Smtp-Source: APXvYqwJfi74QVD/zofU2P0/g2gg7ooywVFBEIF7szplHks32+LZURK6/93aOzRnjw5Hkh4ZybpGRgonk8XbJOel
X-Received: by 2002:ac8:3798:: with SMTP id d24mr3191740qtc.40.1552679526081;
 Fri, 15 Mar 2019 12:52:06 -0700 (PDT)
Date:   Fri, 15 Mar 2019 20:51:31 +0100
In-Reply-To: <cover.1552679409.git.andreyknvl@google.com>
Message-Id: <4368bfa2a799442392ee9582dd1cccb8c96e524d.1552679409.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1552679409.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.360.g471c308f928-goog
Subject: [PATCH v11 07/14] fs, arm64: untag user pointers in fs/userfaultfd.c
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
2.21.0.360.g471c308f928-goog


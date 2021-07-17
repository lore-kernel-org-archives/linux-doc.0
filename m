Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B11C636CD
	for <linux-doc@archiver.kernel.org>; Sat, 17 Jul 2021 02:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1949F61278
	for <linux-doc@archiver.kernel.org>; Sat, 17 Jul 2021 02:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232662AbhGQDBl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Jul 2021 23:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhGQDBk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jul 2021 23:01:40 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E8AC061760
        for <linux-doc@vger.kernel.org>; Fri, 16 Jul 2021 19:58:43 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id d9so12899353ioo.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Jul 2021 19:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=brOM+DfdNwlc3UsxEzMLpJktJX1yD7cB7Dsb6KaxPcE=;
        b=DIvva8ayH6+sZXZWK1X/BmgtFoZ6Skd6ek87kkcwfDefy1QK3YAg6R/XEsJzGF1hg8
         jXbmzEQy/XMz8v9jAWv8HckIxjLHaEU6vWb5LwLOJQg0pG4a+8ltWUzbkzZrzngAWXEd
         laCghktTbLxY47ow4V6TECMjveyTZNEwmaW0elp5YBqDZAf5TfFc275/YNWSJMKGs5pt
         p0FN95JPHARsau4IiJECtubyQ1J/3MC3OlircFS4zisCQ4q+h96WZeJ+ZzwRbByMeDQ6
         w8/m3uwqgsZAe9j6/+ekgeYqIaEoTR+WP6oQajcJTb2bs77Mn9EnW8JthQBKjv5be68h
         zasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=brOM+DfdNwlc3UsxEzMLpJktJX1yD7cB7Dsb6KaxPcE=;
        b=a2VXsp5ZK1M+KSDrJpm7UFEOhJLS9snD/hF/JPXPYTNJM4rxkPuKGRugiYAhoAPqEx
         TTJcLi1s7yWQ4PQINStv514QK87MnlBN+lPfduW9YGKWXzSzXMptNuM1PNImcE7pSopH
         llxm0GB6w755YWqcMlIvXDil6X7jJ9IXyhvJYgZXW6RolhviXIxqmnaT1Y4NHF36l6Ia
         gaNxWW1YegeR2Yukbif84mxSFMPtb0gP/FQT44GK5VWQ+4U+vTNqaAytL2iVZ08nILUU
         /JiqVI5EX5K48fCIGsqRR8k4LQf1aM1bVOOuKDYtgFLmxbnZrNsIqpkiUYe0HiL9UscN
         w7oQ==
X-Gm-Message-State: AOAM533XeDc95DadPGdqGKRibFuLVCQH6IdtQKe8D9uyg2CIBbPDP5+v
        QuxkAfILLqadDpf5EdnWOHImJJHPiM6I2WiKC1eAwg==
X-Google-Smtp-Source: ABdhPJw+FY1DaVW7I/zvmejB5/eZra1YdFnjbI32Ud4P/SrH4MECH1mx28jRyRryX2xisFNJx64ZGI85MZ7lGi1KfLk=
X-Received: by 2002:a02:cab9:: with SMTP id e25mr3644621jap.25.1626490722855;
 Fri, 16 Jul 2021 19:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210619092002.1791322-1-pcc@google.com> <20210628122455.sqo77q4jfxtiwt5b@box.shutemov.name>
In-Reply-To: <20210628122455.sqo77q4jfxtiwt5b@box.shutemov.name>
From:   Peter Collingbourne <pcc@google.com>
Date:   Fri, 16 Jul 2021 19:58:31 -0700
Message-ID: <CAMn1gO4P_VcLsFi4kSNNeqgtcWANdhyMGDb2TOj6VjC0mSgV1g@mail.gmail.com>
Subject: Re: [PATCH v4] mm: introduce reference pages
To:     "Kirill A. Shutemov" <kirill@shutemov.name>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Jann Horn <jannh@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        kernel test robot <lkp@intel.com>,
        Linux API <linux-api@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 28, 2021 at 5:24 AM Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Sat, Jun 19, 2021 at 02:20:02AM -0700, Peter Collingbourne wrote:
> >   #include <stdio.h>
> >   #include <stdlib.h>
> >   #include <string.h>
> >   #include <sys/mman.h>
> >   #include <unistd.h>
> >
> >   constexpr unsigned char pattern_byte = 0xaa;
> >
> >   #define PAGE_SIZE 4096
> >
> >   _Alignas(PAGE_SIZE) static unsigned char pattern[PAGE_SIZE];
> >
> >   int main(int argc, char **argv) {
> >     if (argc < 3)
> >       return 1;
> >     bool use_refpage = argc > 3;
> >     size_t mmap_size = atoi(argv[1]);
> >     size_t touch_size = atoi(argv[2]);
> >
> >     int refpage_fd;
> >     if (use_refpage) {
> >       memset(pattern, pattern_byte, PAGE_SIZE);
> >       refpage_fd = syscall(448, pattern, 0);
> >     }
> >     for (unsigned i = 0; i != 1000; ++i) {
> >       char *p;
> >       if (use_refpage) {
> >         p = (char *)mmap(0, mmap_size, PROT_READ | PROT_WRITE, MAP_PRIVATE,
> >                          refpage_fd, 0);
> >       } else {
> >         p = (char *)mmap(0, mmap_size, PROT_READ | PROT_WRITE,
> >                          MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> >         memset(p, pattern_byte, mmap_size);
> >       }
> >       for (unsigned j = 0; j < touch_size; j += PAGE_SIZE)
> >         p[j] = 0;
> >       munmap(p, mmap_size);
> >     }
> >   }
>
> I don't like the inteface. It is tied to PAGE_SIZE and this doesn't seem
> to be very future looking. How would it work with THPs?

The idea with this interface is that the FD would be passed to mmap,
and anything that uses mmap already needs to be tied to the page size
to some extent.

For THPs I would expect that the kernel would duplicate the contents
of the page as needed.

Another reason that I thought to use a page size based interface was
to allow future optimizations that may reuse the actual page passed to
the syscall. So for example if libc.so contained a page filled with
the required pattern and the allocator passed a pointer to that page
then it could be shared between all of the processes on the system
that link against that libc.

But I suppose that such optimizations would not require passing in a
whole page like that. For pattern based optimizations we could use a
reference counted hash table or something, and for larger patterns we
could activate the optimization only if the size argument were equal
to the page size.

> Maybe we should cosider passing down a filling pattern to kernel and let
> kernel allocate appropriate page size on read page fault? The pattern has
> to be power of 2 and limited in lenght.

Okay, so this sounds like my idea for handling THPs except applied to
any size. This seems reasonable enough to me, however in order to
optimize use cases where the page is only ever read, let's have the
kernel prepare the reference page instead of recreating it every time.
In v5 I've adopted Matthew's proposed prototype:

int refpage_create(const void *__user content, unsigned int size,
                unsigned long pattern, unsigned long flags);

Peter

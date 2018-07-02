Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E97D37DFA5
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 00:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753603AbeGBXjz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Jul 2018 19:39:55 -0400
Received: from mail-ua0-f195.google.com ([209.85.217.195]:40857 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753404AbeGBXjx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Jul 2018 19:39:53 -0400
Received: by mail-ua0-f195.google.com with SMTP id j17-v6so73359uap.7
        for <linux-doc@vger.kernel.org>; Mon, 02 Jul 2018 16:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=9K+icf9Tq+L6chtSmDn+WHr0nVbD9w3yEqnxZuuW1z8=;
        b=fbPWFguSuI8+CQyYmKDPLIDBcZZdBRgHyfiLwFCxnOOEqxSpHUceGlGIefKWLLjM86
         S4TYDGRwq+ko6WkLq4qA3Gvgn6lCJSclShwxMYJZnlUZAFx2IWUrHbT2Ie4qZdBxSfc2
         HGVhvOAAQVYHWtFMe0q7Qsr1ZfDNY5MzSEZtFAE4V/WmNq519Pg1G2Mc46VcUCInD5vk
         nvRkZudXctIFtmMzTGxstxP+N9Nb31NF1b3FqpCDqDVY42te8AluRUvXMG5aHwfxrEpX
         w8TqX3Fk54zTDWgbgQJAy+A3OXUBbLtS6l7S4DUZuby9PqMkdB+iS7jr+KccY20PMwGM
         3xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=9K+icf9Tq+L6chtSmDn+WHr0nVbD9w3yEqnxZuuW1z8=;
        b=mvFsC+nGOjkI8Y+tDjVCbH37jTDhlvl3rnV+M6tndGkECMfuVxSa8VudGXAI8mGLiX
         0kLvdnmkXCZrW/HOyUa2jqm0Lyp5mD3691us0cioSpB918KSYdRvTbWw27EyWyk2e3PF
         To02002b2PqFGNS6DO19qMk0/QTfrgcx+Kkdu5mlGqbPeWZScctNbwEHIJI/KY6vScCr
         TlEBUwdEPTRNp7Vi9q8pZgls8UZyrcObcq0uXfUu2thYvQwsUhA8t8IR4+jMwGRuCsid
         uA9EGOhCkvF6W17uhbFjLmTrajhZ98uHMy0AGrmuXfu/RKHbUIpSu23SSjZxFVRX290W
         MoLw==
X-Gm-Message-State: APt69E0xAFoLcWON1vzhaY91oQ4BAn/rOnr6OMfGYFDY/VgBQg9oowup
        fgJHTJpcPkFQuoPLhage6sy4mwkoMQ2D/Brc/O0C/w==
X-Google-Smtp-Source: AAOMgpdrvFVAAzt8J/rPMu+d7Eq7KLvym2WfvUKcKZHHVnPKL1kFwmqEd/rco5qHFjvvctreYcIjfGwSI2GGvVvXpck=
X-Received: by 2002:ab0:5013:: with SMTP id b19-v6mr17286927uaa.92.1530574792246;
 Mon, 02 Jul 2018 16:39:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9d83:0:0:0:0:0 with HTTP; Mon, 2 Jul 2018 16:39:51 -0700 (PDT)
In-Reply-To: <20180702203321.GA8371@bombadil.infradead.org>
References: <cover.1530018818.git.andreyknvl@google.com> <20180627160800.3dc7f9ee41c0badbf7342520@linux-foundation.org>
 <CAN=P9pivApAo76Kjc0TUDE0kvJn0pET=47xU6e=ioZV2VqO0Rg@mail.gmail.com> <20180702203321.GA8371@bombadil.infradead.org>
From:   Evgenii Stepanov <eugenis@google.com>
Date:   Mon, 2 Jul 2018 16:39:51 -0700
Message-ID: <CAFKCwrg=3J-ARaOJgc73oRE7hQxs1VV7YiZEPS7Dt8Gfn6cWQA@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] khwasan: kernel hardware assisted address sanitizer
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Kostya Serebryany <kcc@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 2, 2018 at 1:33 PM, Matthew Wilcox <willy@infradead.org> wrote:
> On Wed, Jun 27, 2018 at 05:04:28PM -0700, Kostya Serebryany wrote:
>> The problem is more significant on mobile devices than on desktop/server.
>> I'd love to have [K]HWASAN on x86_64 as well, but it's less trivial since x86_64
>> doesn't have an analog of aarch64's top-byte-ignore hardware feature.
>
> Well, can we emulate it in software?
>
> We've got 48 bits of virtual address space on x86.  If we need all 8
> bits, then that takes us down to 40 bits (39 bits for user and 39 bits
> for kernel).  My laptop only has 34 bits of physical memory, so could
> we come up with a memory layout which works for me?

Yes, probably.

We've tried this in userspace by mapping a file multiple times, but
that's very slow, likely because of the extra TLB pressure.
It should be possible to achieve better performance in the kernel with
some page table tricks (i.e. if we take top 8 bits out of 48, then
there would be only two second-level tables, and the top-level table
will look like [p1, p2, p1, p2, ...]). I'm not 100% sure if that would
work.

I don't think this should be part of this patchset, but it's good to
keep this in mind.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

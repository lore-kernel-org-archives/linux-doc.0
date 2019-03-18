Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9D52E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 13:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbfCRNOp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 09:14:45 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44750 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727645AbfCRNOp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 09:14:45 -0400
Received: by mail-pf1-f193.google.com with SMTP id a3so11227949pff.11
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ivs9Ld1Cr5PW6vV2Rbbcl0Dzr7SZ2d3KOy8/STfF8A=;
        b=oBTjxWG0FPo2AisxixE5yc78gPUfLiKvFgiqW/PaDdUDoiy6wl4lIVi3A/mTKnJ0Mi
         zUOLSVZxC9hW893jS8ZhWErR02LcQZuEwaUehFiokdS3EeaxD01M//0i5N97fYoJ13hs
         4G3IljxWh8BwJgGict+arC31MtC27jws/hHnyABdKhWEEiDGh7NKhLigUonEO6+KOlSL
         3USQUM4iKqMTMbn2g6Ah+RFkp4aYcCJZ4BS8w7iWOrUqVYcWexIjpGAtdd3efZdlcCUO
         p7CFeinhJ6NC8l+UdkOHPfrLASSKPleS1Ys2ekWEuevSk7fjYkyy2ScgbpNBmFCOUU6H
         I79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ivs9Ld1Cr5PW6vV2Rbbcl0Dzr7SZ2d3KOy8/STfF8A=;
        b=PHAWQkf7GzZZ3IayB2CeFQYdI0JFzyYIWam2zEyCbHQfvD4CS72dUwp2K4n4WzNDXH
         1vrfJvQqlCLCUSM28PuekBLNdikL1xm/Tpr++7UUgbEoF+9IOvo+VXGKKIwT1jac/CEJ
         PXQi0RNmykt8btt9xMbcVxBi+EX79Uq7vx9qNZhhsMU4xxvEIBVD3q/VBh8y1ED3nZR/
         xFIFV+cli0ekcVRT87lCqVcJGHCSshDqtes/j5W8E1D9HYNDxaEduB6vkVCmS2LCmqZG
         NdGBHE5nd1eoyfrL5bBd8KFdBr4fJyMFx7guXPWzASShxBilTjsOGjQ+xA5lvfQxm2uE
         6tgw==
X-Gm-Message-State: APjAAAVlo0vAtAFdnpyxXHqwgDW8RcD0/FZVRts0W3YzUyXGCUOdsFDs
        kx6/ZqT6PaBEankY2tkNlPUfJAhbjkQ/ufNWAH81ww==
X-Google-Smtp-Source: APXvYqzzaA64U7KtW5o2Iu/H+zw+3YlvxqyrHvqmN+ESRE331EC2V1D1mVi9n99A6ltAqp+SQeSIw+RkaEm4xazCMNc=
X-Received: by 2002:a63:68c9:: with SMTP id d192mr18023180pgc.264.1552914883949;
 Mon, 18 Mar 2019 06:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1552679409.git.andreyknvl@google.com> <56d3373c1c5007d776fcd5de4523f4b9da341fb6.1552679409.git.andreyknvl@google.com>
 <04c5b2de-7fde-7625-9d42-228160879ea0@gmail.com>
In-Reply-To: <04c5b2de-7fde-7625-9d42-228160879ea0@gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 18 Mar 2019 14:14:33 +0100
Message-ID: <CAAeHK+xXLypBpF1EE73KuzQAo0E6Y=apS46wo+swo2AB6cy3YA@mail.gmail.com>
Subject: Re: [PATCH v11 08/14] net, arm64: untag user pointers in tcp_zerocopy_receive
To:     Eric Dumazet <eric.dumazet@gmail.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
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
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 15, 2019 at 9:03 PM Eric Dumazet <eric.dumazet@gmail.com> wrote:
>
>
>
> On 03/15/2019 12:51 PM, Andrey Konovalov wrote:
> > This patch is a part of a series that extends arm64 kernel ABI to allow to
> > pass tagged user pointers (with the top byte set to something else other
> > than 0x00) as syscall arguments.
> >
> > tcp_zerocopy_receive() uses provided user pointers for vma lookups, which
> > can only by done with untagged pointers.
> >
> > Untag user pointers in this function.
> >
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > ---
> >  net/ipv4/tcp.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> > index 6baa6dc1b13b..89db3b4fc753 100644
> > --- a/net/ipv4/tcp.c
> > +++ b/net/ipv4/tcp.c
> > @@ -1758,6 +1758,8 @@ static int tcp_zerocopy_receive(struct sock *sk,
> >       int inq;
> >       int ret;
> >
> > +     address = untagged_addr(address);
> > +
> >       if (address & (PAGE_SIZE - 1) || address != zc->address)
>
> The second test will fail, if the top bits are changed in address but not in zc->address

Will fix in v12, thanks Eric!

>
> >               return -EINVAL;
> >
> >
>

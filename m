Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A987B7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 13:17:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbfCRNRG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 09:17:06 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35840 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbfCRNRG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 09:17:06 -0400
Received: by mail-pf1-f195.google.com with SMTP id p10so4430877pff.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 06:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XMsQCnO3d2N5DODeaXx9kIQiZQAAX2gcah3MrcQIGq4=;
        b=Mz1wBwJj6aCIZctfrRgE6qXPvX+DxKzIewaAWG2rsnRyqxyHSntUGvgMk83TJr4D9R
         vQY040rQcugdz84sOkhKoPh+5b61cRyUPyZHiun1V7TlGA4yTVG73h6PtP07QDgLiuwE
         n+Y726W4fhoevokV4KYe1eN7kRnGOw2ACjkFgmQCINLKKX731h86aGsk7vt7KFXu5VD/
         IvAIbnkhPmKhNvITYDEkPKJcLWmUjR47kAvs4vZgz0S2NXlFkFNzVMsgyzV5Se0Oxdq4
         +rOKDCv24NM7YvtykGdF3O1VGaaySN2ax6qOyIngXLA9yS4tWIS96p9YD5FbV0UfdUAj
         Rnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XMsQCnO3d2N5DODeaXx9kIQiZQAAX2gcah3MrcQIGq4=;
        b=ZPdU3JVpi47aD2PdwrjEHsyK3kmhNMHVDQs7OCTcNQGcFzXU1TUYAeXIRD98XgxKH+
         1KR/9FrlbVydrMMUxOLwDhMmzc87SRARA6nN2c5V+Jqi9CP6Z3bLUGOMKRqLvuoWxyZ8
         xhRYL5WRvVZaiJDnM15QhOR01L7/StuLSGbzJ/GELoESms70zBnDx0QCgamE7p4y7DIT
         5xOo7q+j1n3mn2cJybfiTV0DLkCM8vSaW6F69ZXgFQ3ryarORS7+N7A5dJue01nN47nP
         nUUddW2YQZs6AO+kVeNqv8Wzut+oSHaAsjD9lenFp+W0EuXim4XEglVJ8cS7myecbnPg
         duCQ==
X-Gm-Message-State: APjAAAVnjeQUp62dfet7xfQsNiKljxgjR2+rSbSg5AQW22UdqQkIZhyV
        swqldG66/8zQ2ipnFnIzD6DHfPDKkh1u28NcTrzaew==
X-Google-Smtp-Source: APXvYqznUx/0uvWyFAaioSmzSqQCdEUiA7lTMwL0ocTN2RjTJ+d/Q8++zm5Ul1FUymXrEWoCrhT4qzyR9aFgyliP2CQ=
X-Received: by 2002:a62:6383:: with SMTP id x125mr18765188pfb.239.1552915025400;
 Mon, 18 Mar 2019 06:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1552679409.git.andreyknvl@google.com> <56d3373c1c5007d776fcd5de4523f4b9da341fb6.1552679409.git.andreyknvl@google.com>
 <04c5b2de-7fde-7625-9d42-228160879ea0@gmail.com> <CAAeHK+xXLypBpF1EE73KuzQAo0E6Y=apS46wo+swo2AB6cy3YA@mail.gmail.com>
In-Reply-To: <CAAeHK+xXLypBpF1EE73KuzQAo0E6Y=apS46wo+swo2AB6cy3YA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 18 Mar 2019 14:16:54 +0100
Message-ID: <CAAeHK+yxcG=KBjG0A5BicBA7Zwu6LR6t=g5b-9EAPXA8_Dfm2g@mail.gmail.com>
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

On Mon, Mar 18, 2019 at 2:14 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Fri, Mar 15, 2019 at 9:03 PM Eric Dumazet <eric.dumazet@gmail.com> wrote:
> >
> >
> >
> > On 03/15/2019 12:51 PM, Andrey Konovalov wrote:
> > > This patch is a part of a series that extends arm64 kernel ABI to allow to
> > > pass tagged user pointers (with the top byte set to something else other
> > > than 0x00) as syscall arguments.
> > >
> > > tcp_zerocopy_receive() uses provided user pointers for vma lookups, which
> > > can only by done with untagged pointers.
> > >
> > > Untag user pointers in this function.
> > >
> > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > > ---
> > >  net/ipv4/tcp.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> > > index 6baa6dc1b13b..89db3b4fc753 100644
> > > --- a/net/ipv4/tcp.c
> > > +++ b/net/ipv4/tcp.c
> > > @@ -1758,6 +1758,8 @@ static int tcp_zerocopy_receive(struct sock *sk,
> > >       int inq;
> > >       int ret;
> > >
> > > +     address = untagged_addr(address);
> > > +
> > >       if (address & (PAGE_SIZE - 1) || address != zc->address)
> >
> > The second test will fail, if the top bits are changed in address but not in zc->address
>
> Will fix in v12, thanks Eric!

Looking at the code, what's the point of this address != zc->address
check? Should I just remove it?

>
> >
> > >               return -EINVAL;
> > >
> > >
> >

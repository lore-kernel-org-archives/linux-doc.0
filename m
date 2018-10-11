Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF9817D087
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 20:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbeJLEYi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Oct 2018 00:24:38 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39922 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbeJLEYi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Oct 2018 00:24:38 -0400
Received: by mail-wr1-f65.google.com with SMTP id 61-v6so11164514wrb.6
        for <linux-doc@vger.kernel.org>; Thu, 11 Oct 2018 13:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2KOjYX4ILxhVDuX6J6Xn9Mm3TnCRr6/YJJVFH//h0z0=;
        b=qf9Z9hyN2c2yKMz3WdOpddxPJjgvuo0I3a46tr2NvcS7QB39fqUd9gTIS2y4W7PJXq
         Z7uBYutIYxNO7oi674TDwQwAMRQ3KrRyT2FmiV9yI9fn1qCcYAlJNteiz43pVAICcHP3
         yZORwyGV2PWTS1t869CuGydLZqeBHfRMS2818tCCykHx7wVCuZIEF28DwbjpLl9YyA77
         ZH24VcEccP8QsYrGWVk3g/YV+kZQ+uQhV5ih8Kda39hgenvbh/lww6lOh651YZfwTNSU
         DW8J6NAIyUc8NRnu98kIsMc+FbosreYcoJMcd8ql4u582720ioG4sjzP0R46A9mOhqSb
         4ynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2KOjYX4ILxhVDuX6J6Xn9Mm3TnCRr6/YJJVFH//h0z0=;
        b=DF8g6SpuKF6ZvfsUDcP+OxanRomfN83MtYIa3EomHLQA5+C0QZr5dKcGSDYlD+hCSH
         pGmn+xP6uGSfgCrBk3ccG9nONjs/g14PQSDZ9yfU5Rgf+yaAQwOY5H9uzwBI+0QxJuAH
         HOA+P79SFC3khBKWXvkZHPCxll7aJVEeWzlq1oMpUGmX6oQC2EmmyL/WXU3aGd3/b4B8
         NKMvlJ8iy8RlneHv01x6d7WQKAFnYJH/tcemx3NncTllyBrNt/vq9AnuWUE+Yrs8OOO0
         oQ+4UPflZ9+OxbPEnc4PXpvhwmUgOJmbVmlyiW74WtvZgj+Tc4KeqbZZFz4JhLMhht1c
         EdQg==
X-Gm-Message-State: ABuFfoiuFMC4y+cEgmCR5PYfUED9NcOWLlbLaWaJQa6nFC3jXJRwMyj5
        4lxLkbMMeduyJIJjJrga0EREiJ6YSmoa3hD1aO2uHg==
X-Google-Smtp-Source: ACcGV60HIxYyBNiUnMvakya55CP3CUl/NaIFpl6QVhqly2z1o3gWSMhqUq8ac+FZHQjvpCBwvEBHwEPI/JKW6gBnJO8=
X-Received: by 2002:adf:b188:: with SMTP id q8-v6mr2950881wra.95.1539291338385;
 Thu, 11 Oct 2018 13:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20181011151523.27101-1-yu-cheng.yu@intel.com> <20181011151523.27101-8-yu-cheng.yu@intel.com>
 <CAG48ez3R7XL8MX_sjff1FFYuARX_58wA_=ACbv2im-XJKR8tvA@mail.gmail.com>
In-Reply-To: <CAG48ez3R7XL8MX_sjff1FFYuARX_58wA_=ACbv2im-XJKR8tvA@mail.gmail.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Thu, 11 Oct 2018 13:55:26 -0700
Message-ID: <CALCETrUJ1t_K=FQExa_K0yg+aXkPot6wn6RHBPDc3BsAxtmMBw@mail.gmail.com>
Subject: Re: [PATCH v5 07/27] mm/mmap: Create a guard area between VMAs
To:     Jann Horn <jannh@google.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        Daniel Micay <danielmicay@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 11, 2018 at 1:39 PM Jann Horn <jannh@google.com> wrote:
>
> On Thu, Oct 11, 2018 at 5:20 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> > Create a guard area between VMAs to detect memory corruption.
> [...]
> > +config VM_AREA_GUARD
> > +       bool "VM area guard"
> > +       default n
> > +       help
> > +         Create a guard area between VM areas so that access beyond
> > +         limit can be detected.
> > +
> >  endmenu
>
> Sorry to bring this up so late, but Daniel Micay pointed out to me
> that, given that VMA guards will raise the number of VMAs by
> inhibiting vma_merge(), people are more likely to run into
> /proc/sys/vm/max_map_count (which limits the number of VMAs to ~65k by
> default, and can't easily be raised without risking an overflow of
> page->_mapcount on systems with over ~800GiB of RAM, see
> https://lore.kernel.org/lkml/20180208021112.GB14918@bombadil.infradead.org/
> and replies) with this change.
>
> Playing with glibc's memory allocator, it looks like glibc will use
> mmap() for 128KB allocations; so at 65530*128KB=8GB of memory usage in
> 128KB chunks, an application could run out of VMAs.

Ugh.

Do we have a free VM flag so we could do VM_GUARD to force a guard
page?  (And to make sure that, when a new VMA is allocated, it won't
be directly adjacent to a VM_GUARD VMA.)

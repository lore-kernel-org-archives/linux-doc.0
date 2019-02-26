Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 72D207D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Feb 2019 14:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbfBZOlj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Feb 2019 09:41:39 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40555 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbfBZOli (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Feb 2019 09:41:38 -0500
Received: by mail-pf1-f196.google.com with SMTP id h1so6341866pfo.7
        for <linux-doc@vger.kernel.org>; Tue, 26 Feb 2019 06:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ORID1v1ozYXyKv1mw/ofFm5kiuOuJ/TBoHbnGpDrQY0=;
        b=Jk4s/BkFrIcxrk4e9Mx5smnm1MMtapGUCpafH868xdIWYkLK7M78NPFfkO1hXlBR3s
         fHSFCSGQY90XYaDQqb63dSKPREtSbEi2GwRgT00jYvnEy0yQetugEzlFqBmtB3qipsAd
         q/rhOJ6CKsqxpXxBDrJDcb0ls8JRx8hPmbNL5pXQCFMY5+3weHhsnBcu5hbxiUG4WqQl
         pBEq1Wji+wh6z+8emU3AosXH6snGNQBpu8akU3FP96jjwWcneLVMTgn776abphESvY54
         iMhXTsCqkSEIu1VQDJchEorqdn4d1RpFfWm51ZaV3ypfOUhUpwNhpwhi50tHIgnGBRqu
         SjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ORID1v1ozYXyKv1mw/ofFm5kiuOuJ/TBoHbnGpDrQY0=;
        b=SJVfLQO+Svv6RyfmsE0MNAR13beyJPURdYXaVYEszORLqdzmDxOs8a9JLq/P+HFeCm
         ifWEE/kmfhCjBw/4zc7XTbWZmB2SyFM8jHjMHtJYOc2yvhRfx+Cnm7/k7XzBLS7wC5ch
         7dMx2/X2dlktxGJFWvaO9aJBEVTannOI9QVsqHwp9uk5cf3QUtnxfi6QPBdJw7UmrFcQ
         cMua+CK/4P7WFb2FILtwNrS5oJdg30v2lQuEMCLeBhHfPzBv4rsGvmYuhQFW4UlwHStf
         RnZdrOpOyvHAloueknWXojrYc0K9/xf7duELeyWy6KISz32evFB9klOyB3qDMG6/x+9p
         jMNw==
X-Gm-Message-State: AHQUAubDi/DiyQxok9f2ZWHXmcLEyTQjr4fnP/WyjsREojqM1+cCVypg
        wtGyqO2JoMPJm7zN+chVRPdpo0/8oMjC3BNb8luOqg==
X-Google-Smtp-Source: AHgI3IZRaeChYbi2J79TLZ2OQNrL+zd2lHSInwkIpfXgbjWxpzJly0F0LoxycLTV6qaHuDyyWxELKtQh0Gjyn9jKmaE=
X-Received: by 2002:a62:4299:: with SMTP id h25mr26113838pfd.165.1551192097850;
 Tue, 26 Feb 2019 06:41:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550839937.git.andreyknvl@google.com> <3875fa863b755d8cb43afa7bb0fe543e5fd05a5d.1550839937.git.andreyknvl@google.com>
 <81ea4e77-90a4-4fd9-2bc8-135e0da30044@intel.com>
In-Reply-To: <81ea4e77-90a4-4fd9-2bc8-135e0da30044@intel.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 26 Feb 2019 15:41:26 +0100
Message-ID: <CAAeHK+z2qw__Kpeih2mEyhVJ-gbor1vYsOZddT5E71JDiSg7pg@mail.gmail.com>
Subject: Re: [PATCH v10 04/12] mm, arm64: untag user pointers passed to memory syscalls
To:     Dave Hansen <dave.hansen@intel.com>
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
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

On Sat, Feb 23, 2019 at 12:07 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 2/22/19 4:53 AM, Andrey Konovalov wrote:
> > --- a/mm/mprotect.c
> > +++ b/mm/mprotect.c
> > @@ -578,6 +578,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
> >  SYSCALL_DEFINE3(mprotect, unsigned long, start, size_t, len,
> >               unsigned long, prot)
> >  {
> > +     start = untagged_addr(start);
> >       return do_mprotect_pkey(start, len, prot, -1);
> >  }
> >
> > @@ -586,6 +587,7 @@ SYSCALL_DEFINE3(mprotect, unsigned long, start, size_t, len,
> >  SYSCALL_DEFINE4(pkey_mprotect, unsigned long, start, size_t, len,
> >               unsigned long, prot, int, pkey)
> >  {
> > +     start = untagged_addr(start);
> >       return do_mprotect_pkey(start, len, prot, pkey);
> >  }
>
> This seems to have taken the approach of going as close as possible to
> the syscall boundary and untagging the pointer there.  I guess that's
> OK, but it does lead to more churn than necessary.  For instance, why
> not just do the untagging in do_mprotect_pkey()?

I think that makes more sense, will do in the next version, thanks!

>
> I think that's an overall design question.  I kinda asked the same thing
> about patching call sites vs. VMA lookup functions.

Replied in the other thread.

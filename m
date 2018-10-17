Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 721867D088
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Oct 2018 20:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbeJREXF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Oct 2018 00:23:05 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:45551 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbeJREXF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Oct 2018 00:23:05 -0400
Received: by mail-vs1-f66.google.com with SMTP id g201so21618285vsd.12
        for <linux-doc@vger.kernel.org>; Wed, 17 Oct 2018 13:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Pr6NILnK9XPPFR1l7yWWQR1rB4C+P+FS3n0AEKO7BDc=;
        b=jFTSmNWcTSIZZDas/tokxDkKeXwVqvdP8rJM+77xs9AZTjaexvX2dUIPs4xLjjDKSh
         +AX49Tw5r5ZMagEjB+V1pfcaOmg6w3YkqkQBLEdmYe4d2FLS+GJIOijnGYVNW4ZZN9IH
         D5/on1OvnJNyMlxm/whqMRxocDIYosAk7twGiO5umyoKuNbWwvWCZX+pp4hFO0Qngwd7
         XiTus8y3yRkeJfOEbw0sivgKk4taWzRfcy2c3xSwlgYHuXTyvM2m9+30YrG7K7/wdu8P
         PnQDiHV8yTFHJig2dpbV0uzA2UEosH7yC30zsllsNGmYHp1pwnjuLsBDbttR6+kvNVs6
         sTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pr6NILnK9XPPFR1l7yWWQR1rB4C+P+FS3n0AEKO7BDc=;
        b=PHHgD13NpotLb0g9jGxiOYZ2B1njex9Uxd4ZpWw8la8BADrg2x7F3Md/lhW7I0TeCy
         6GD6bPmQGhFDM5uuXTZ4F0zmS/qgqDfL0kkzTJHvy9Tp6R/dd3PGxrYDpV0cjKZl9GHf
         vMThpwebDxcLHPUcujE8+qawapVPGy/88Thjd0OLtMsFmeFkkWCFC4VwNl5GBtSLEQof
         N9Q6Lt4c3hOLRnXPoAiOz00qkToVGppv2SJ627fVP2HtpJjUllDBmccrKySyYv9figYD
         pCFaTfNyopTks2XcGn99xnEv+iqCMgdZbrYA6UhqG9qppmB5YIy2ZIm3TkaDkx9QCtcn
         +cAg==
X-Gm-Message-State: ABuFfoj5u+Lbhd00EKCh6L+kdTARVN4TAppky1heyJGgobw9K5qUe24D
        KwA35lsYRNH3gHYSyHzb+J5OJWCk4lnrDGwAXsOd0A==
X-Google-Smtp-Source: ACcGV614G6SFgmx8peyJRntxyx0NM+UT3dhzKzJPGVvfnII3gg0iB/VlFcXvwMUg6OOQdlMUR6C1eojNh45/NWxdfTA=
X-Received: by 2002:a67:3f94:: with SMTP id q20mr11298747vsi.1.1539807942636;
 Wed, 17 Oct 2018 13:25:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:c284:0:0:0:0:0 with HTTP; Wed, 17 Oct 2018 13:25:42
 -0700 (PDT)
In-Reply-To: <CAAeHK+yEZTLjgSj8YUzeJec9Pp2TwuLT5nCa1OpfBLXJkx_hhg@mail.gmail.com>
References: <cover.1538485901.git.andreyknvl@google.com> <be684ce5-92fd-e970-b002-83452cf50abd@arm.com>
 <CAAeHK+yEZTLjgSj8YUzeJec9Pp2TwuLT5nCa1OpfBLXJkx_hhg@mail.gmail.com>
From:   Evgenii Stepanov <eugenis@google.com>
Date:   Wed, 17 Oct 2018 13:25:42 -0700
Message-ID: <CAFKCwrh4-BvFB_R1J0LWcbfeR=d02OazowFuMU+hmq8Y=Dx+4w@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] arm64: untag user pointers passed to the kernel
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 17, 2018 at 7:20 AM, Andrey Konovalov <andreyknvl@google.com> w=
rote:
> On Wed, Oct 17, 2018 at 4:06 PM, Vincenzo Frascino
> <vincenzo.frascino@arm.com> wrote:
>> Hi Andrey,
>> I have been thinking a bit lately on how to address the problem of user =
tagged pointers passed to the kernel through syscalls, and IMHO probably th=
e best way we have to catch them all and make sure that the approach is mai=
ntainable in the long term is to introduce shims that tag/untag the pointer=
s passed to the kernel.
>>
>> In details, what I am proposing can live either in userspace (preferred =
solution so that we do not have to relax the ABI) or in kernel space and ca=
n be summarized as follows:
>>  - A shim is specific to a syscall and is called by the libc when it nee=
ds to invoke the respective syscall.
>>  - It is required only if the syscall accepts pointers.
>>  - It saves the tags of a pointers passed to the syscall in memory (same=
 approach if the we are passing a struct that contains pointers to the kern=
el, with the difference that all the tags of the pointers in the struct nee=
d to be saved singularly)
>>  - Untags the pointers
>>  - Invokes the syscall
>>  - Retags the pointers with the tags stored in memory
>>  - Returns
>>
>> What do you think?
>
> Hi Vincenzo,
>
> If I correctly understand what you are proposing, I'm not sure if that
> would work with the countless number of different ioctl calls. For
> example when an ioctl accepts a struct with a bunch of pointer fields.
> In this case a shim like the one you propose can't live in userspace,
> since libc doesn't know about the interface of all ioctls, so it can't
> know which fields to untag. The kernel knows about those interfaces
> (since the kernel implements them), but then we would need a custom
> shim for each ioctl variation, which doesn't seem practical.

The current patchset handles majority of pointers in a just a few
common places, like copy_from_user. Userspace shims will need to untag
& retag all pointer arguments - we are looking at hundreds if not
thousands of shims. They will also be located in a different code base
from the syscall / ioctl implementations, which would make them
impossible to keep up to date.

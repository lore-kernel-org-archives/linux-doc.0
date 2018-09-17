Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E47187D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 17 Sep 2018 18:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbeIRALR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Sep 2018 20:11:17 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44075 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbeIRALN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Sep 2018 20:11:13 -0400
Received: by mail-io1-f67.google.com with SMTP id 75-v6so12326301iou.11
        for <linux-doc@vger.kernel.org>; Mon, 17 Sep 2018 11:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=O5u7wMaeEk5fXb1J01fxLI6QHGCxyT5enhFPS6rHyRY=;
        b=jd4FM5IS7f0vh3csEHwSv5NUA9rtXE8KD/0+x/dX+blaJ/pXqQWvnWocszCWRJZBXi
         hndcTDC2awQIUnUZ1MTmL+mMNOQeAfV+izh37HjkSQikTpg2Uo5/17R4Ewx2avfgt1wt
         fHTsZ1b+jqs6ayOY0OrEyRGl8lttRhvBtheJh1c0bj8sfhmEbkEPZSlm2UJtnzQ2FW6H
         KaSDYmij4gIw28uvGEAJ1DkwDMj4pp0BKH3feLAgNIS252NtcFAqD6/QiW7ec2qZG59w
         5nKdbV95/DByG5Qk1YlSh1RsHBaRiG1TPf/kvBlxPuZRZQy7VSPOPTWb8VnttqG/Nd4t
         G5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=O5u7wMaeEk5fXb1J01fxLI6QHGCxyT5enhFPS6rHyRY=;
        b=feIZ23++/Hdj/vDQc/TefqJHrgC+SsItnzw7SzBlnSyDDl3INtyZzB7oJnf+ACB7wl
         QgbQl42kEaM7ZUciGEIw4PnYjEppvzvE/rpNQO0rG4yKFDUJvbDyG7qDNrB6QcOmVqXL
         XNjE//4P1MB0z5lqpihJPP9nTPD+KI8l4jpCbrkiVgUbD8IBO0CZfdM3qlJct/9yFXMZ
         wv/D3yoJLubx65s9KIZ0hoL6XCvOYcafGNsheOQxHcKi14DWiM6+LUAZVrdtgEQoyPDE
         N2Cz5tBjgDbI8JLF7OeclRRrPUozWI3FvV2yIqn7wyyHnkgMJZMqpXydSzaq6gegbD4v
         Jujg==
X-Gm-Message-State: APzg51ClMW9NyLoh4B0jEBlWgYIoHxr9IkKjfnIA6/fvFMq6AuKqNEYO
        e0z/y32TkIqOvzNlvVNdXus9jTUNYG1Rwr7BYg0pGQ==
X-Google-Smtp-Source: ANB0Vda9zHAY8xmHgUHbwXkczsykCuIOYRyirwb3bmL+ueoCcJnoaS2qc01BLkxqLf9gMfP9X77u+IXTvbF74xI/lqc=
X-Received: by 2002:a6b:2147:: with SMTP id h68-v6mr21760951ioh.192.1537209757392;
 Mon, 17 Sep 2018 11:42:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:c54e:0:0:0:0:0 with HTTP; Mon, 17 Sep 2018 11:42:36
 -0700 (PDT)
In-Reply-To: <CACT4Y+baDKvmpKJ4SKoEuZG4ir2xRGscQ7Ro4hkVAX3jwiWnFg@mail.gmail.com>
References: <cover.1535462971.git.andreyknvl@google.com> <868c9168481ff5103034ac1e37b830d28ed5f4ee.1535462971.git.andreyknvl@google.com>
 <CACT4Y+baDKvmpKJ4SKoEuZG4ir2xRGscQ7Ro4hkVAX3jwiWnFg@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 17 Sep 2018 20:42:36 +0200
Message-ID: <CAAeHK+yvVgV6LA8PgJz6ysCo+X38tCyLrMVhKOe08tFyZP_F0Q@mail.gmail.com>
Subject: Re: [PATCH v6 03/18] khwasan: add CONFIG_KASAN_GENERIC and CONFIG_KASAN_HW
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
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

On Wed, Sep 12, 2018 at 4:47 PM, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Wed, Aug 29, 2018 at 1:35 PM, Andrey Konovalov <andreyknvl@google.com> wrote:

>>
>>  #define __no_sanitize_address __attribute__((no_sanitize("address")))
>> +#define __no_sanitize_hwaddress __attribute__((no_sanitize("hwaddress")))
>
> It seems that it would be better to have just 1 attribute for both types.
> Currently __no_sanitize_address is used just in a single place. But if
> it ever used more, people will need to always spell both which looks
> unnecessary, or, worse will only fix asan but forget about khwasan.
>
> If we do just:
>
> #define __no_sanitize_address __attribute__((no_sanitize("address",
> "hwaddress")))
>
> Then we don't need any changes in compiler-gcc.h nor in compiler.h,
> and no chance or forgetting one of them.

Will do in v7.

>>  config KASAN
>> -       bool "KASan: runtime memory debugger"
>> +       bool "KASAN: runtime memory debugger"
>> +       help
>> +         Enables KASAN (KernelAddressSANitizer) - runtime memory debugger,
>> +         designed to find out-of-bounds accesses and use-after-free bugs.
>
> Perhaps also give link to Documentation/dev-tools/kasan.rst while we are here.

Will do in v7.

>
>> +
>> +choice
>> +       prompt "KASAN mode"
>> +       depends on KASAN
>> +       default KASAN_GENERIC
>> +       help
>> +         KASAN has two modes: KASAN (a classic version, similar to userspace
>
> In these few sentences we call the old mode with 3 different terms:
> "generic", "classic" and "KASAN" :)
> This is somewhat confusing. Let's call it "generic" throughout (here
> and in the docs patch). "Generic" as in "supported on multiple arch
> and not-dependent on hardware features". "Classic" makes sense for
> people who knew KASAN before, but for future readers in won't make
> sense.

Will use "generic" in v7.

>>
>> +if HAVE_ARCH_KASAN_HW
>
> This choice looks somewhat weird on non-arm64. It's kinda a choice
> menu, but one can't really choose anything. Should we put the whole
> choice under HAVE_ARCH_KASAN_HW, and just select KASAN_GENERIC
> otherwise? I don't know what't the practice here. Andrey R?

I think having one option that is auto selected is fine.

>> +config KASAN_HW
>> +       bool "KHWASAN: the hardware assisted mode"

Do we need a hyphen here? hardware-assisted?

Yes, will fix in v7.

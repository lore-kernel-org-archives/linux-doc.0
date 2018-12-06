Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 221EC7D08E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 10:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbeLFKTQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 05:19:16 -0500
Received: from mail-it1-f195.google.com ([209.85.166.195]:37463 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbeLFKTQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Dec 2018 05:19:16 -0500
Received: by mail-it1-f195.google.com with SMTP id b5so548913iti.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Dec 2018 02:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8E9PbE8KN4ACuzYfCxgB7Qnel5iCJrJXGdqLgrAraZs=;
        b=upjF35iYD3/uGdNNZCfP2U5fqUW4lGBU094scjynoWN24nJtSnzyCQqcxaHybWVzTh
         N7OgaX+UfENuRID4VRbgfPpcQ05YxW/GrXX7KSfwHvgsxXk9r2GrrDY4aLYQCQVJ0kUU
         8fYkkUxjwlHn2HmF6nNqAzHdGXlJFCh1hl/+X29kSZfPHToJyc0fP0es/GufFNCHXI0k
         dQommNJoqgPlcdZVHypT9FoOksl1wBVsNfqws9WrDxqG4GMb1RlcISoT2fD1aRQFOr2G
         fxXmsxtpUjaz06HCMwqJHoHFG/6thVs2Ar/RV4WKGYensUIUeX6CPLjCG6/demjq4LZu
         d7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8E9PbE8KN4ACuzYfCxgB7Qnel5iCJrJXGdqLgrAraZs=;
        b=mO1oXWzyq/UPD0vwSKDyoLZYduqMGIN1yMqWVU+XTvvvlb0RxseknIa5p5/7dm+rzD
         kuJkKl6/cAbjR9ctF5iW2t8kHgUFHm/JLZe+iMd/v8UXOWC8m6FjZ/b5nYXey/cHqG5L
         SiNZvdt10nGnQp6qYKyalzZ2S4S/6CfE4zMwlmFpx2ViLoToze3R8/RJYZuMrn0XR68v
         oYjlOyhjUlSkr0R2dXOFRoMGGQTeSoijx1LxltvwW69a+fcyGaIUOpqmQEXvCXLLBVk2
         S6zK9gLHj2lTLI7Qt4LxNsFcAMDgDDSXj53+mC0ogATgNVlaD5+gWZ0yhCxzlLucbSh9
         mgQw==
X-Gm-Message-State: AA+aEWZqArzr3FmWmIwb4XVrOjRBT8MfK0+jIs7TKxbI0hzkYWBDoI5K
        KQ1YQcnOlAxXxsb4ibnGJ8KCXNInKkMdC5XMsGfsXA==
X-Google-Smtp-Source: AFSGD/UlXjTp0eoz8N48OkTtlNnBxX8SmW0cQOYEM9DQprpIXPKQHJY+yksBfJAv3tL7v8D5cexmCQZLv1b9UiGEGNE=
X-Received: by 2002:a24:2716:: with SMTP id g22mr16771301ita.40.1544091555752;
 Thu, 06 Dec 2018 02:19:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543337629.git.andreyknvl@google.com> <20728567aae93b5eb88a6636c94c1af73db7cdbc.1543337629.git.andreyknvl@google.com>
 <CAMo8BfK5aEGae--xvboLxMXTe1orA7kmLR_uFNCqC6M-a=Om5Q@mail.gmail.com>
In-Reply-To: <CAMo8BfK5aEGae--xvboLxMXTe1orA7kmLR_uFNCqC6M-a=Om5Q@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 6 Dec 2018 11:19:04 +0100
Message-ID: <CAAeHK+zprEaJMexWRZj1QbuygL0dOC5LqJRok8cairfLw=VVvw@mail.gmail.com>
Subject: Re: [PATCH v12 05/25] kasan: add CONFIG_KASAN_GENERIC and CONFIG_KASAN_SW_TAGS
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
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
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kostya Serebryany <kcc@google.com>,
        Evgenii Stepanov <eugenis@google.com>,
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

On Tue, Dec 4, 2018 at 11:24 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Hello,
>
> On Tue, Nov 27, 2018 at 9:00 AM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > This commit splits the current CONFIG_KASAN config option into two:
> > 1. CONFIG_KASAN_GENERIC, that enables the generic KASAN mode (the one
> >    that exists now);
> > 2. CONFIG_KASAN_SW_TAGS, that enables the software tag-based KASAN mode.
>
> [...]
>
> > --- a/lib/Kconfig.kasan
> > +++ b/lib/Kconfig.kasan
> > @@ -1,35 +1,95 @@
> > +# This config refers to the generic KASAN mode.
> >  config HAVE_ARCH_KASAN
> >         bool
> >
> > +config HAVE_ARCH_KASAN_SW_TAGS
> > +       bool
> > +
> > +config CC_HAS_KASAN_GENERIC
> > +       def_bool $(cc-option, -fsanitize=kernel-address)
> > +
> > +config CC_HAS_KASAN_SW_TAGS
> > +       def_bool $(cc-option, -fsanitize=kernel-hwaddress)
> > +
> >  if HAVE_ARCH_KASAN
> >
> >  config KASAN
> > -       bool "KASan: runtime memory debugger"
> > +       bool "KASAN: runtime memory debugger"
> > +       help
> > +         Enables KASAN (KernelAddressSANitizer) - runtime memory debugger,
> > +         designed to find out-of-bounds accesses and use-after-free bugs.
> > +         See Documentation/dev-tools/kasan.rst for details.
>
> Perhaps KASAN should depend on
> CC_HAS_KASAN_GENERIC || CC_HAS_KASAN_SW_TAGS,
> otherwise make all*config may enable KASAN
> for a compiler that does not have any -fsanitize=kernel-*address
> support, resulting in build failures like this:
>   http://kisskb.ellerman.id.au/kisskb/buildresult/13606170/log/

Will fix in v13, thanks!

>
> --
> Thanks.
> -- Max
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To post to this group, send email to kasan-dev@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/CAMo8BfK5aEGae--xvboLxMXTe1orA7kmLR_uFNCqC6M-a%3DOm5Q%40mail.gmail.com.
> For more options, visit https://groups.google.com/d/optout.

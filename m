Return-Path: <SRS0=RyWP=3G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCF5C33CB6
	for <linux-doc@archiver.kernel.org>; Fri, 17 Jan 2020 10:13:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A42982467E
	for <linux-doc@archiver.kernel.org>; Fri, 17 Jan 2020 10:13:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JZtAPVZY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgAQKNo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Jan 2020 05:13:44 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35706 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728640AbgAQKNn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Jan 2020 05:13:43 -0500
Received: by mail-lj1-f196.google.com with SMTP id j1so25860862lja.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Jan 2020 02:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Jhg4+UAB/mfmS/kvRrF2GKzyf6Tn27Jkcr+2SRy5OE=;
        b=JZtAPVZYG36wekyZYFjYNz63EBXhO9thOFOWavIBZaF6brqIuhH4QmJ/RyadxDwpF0
         tqgFwvmRZU0d+6gq48nDYrfnWBrIl3KOTVFbOF61H5AArNOBt1AibiaQIjhbyQC/WHxx
         sOODAD9I5mWn8l27u+y/scXSDEhjqTKzIRFMwxzcYLbaMMGOccVWGfbBWhocsqUwR6oq
         RemQe435CNyIhBtHlQ7mcxMtfEMn3o1ymJjbc7YMxccJ5nsZwkBdmzi7ZDN+5mhbKkSN
         TwPEwzfhUp+wIdlP/gLVlMTVYunVs+iJ2ljt5qt6juxEuO8jex7ENFPo0JSlG56g2Aiz
         uy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Jhg4+UAB/mfmS/kvRrF2GKzyf6Tn27Jkcr+2SRy5OE=;
        b=MDTsYQqpNaK/23Lj0qtamyHhRNmjkw448D86F2HNALT2079UQytVYVN/z5Vp8FJ36f
         ZWBGJzFWxdOpkPEwe3oW6EWQx7wqj5UKVH7SSAScHUxVmKaV5sfKw4cgENhDpaP7ft3I
         wEpbkL5aVox7TRTMeWP39m6YdZfHlCR+xDJNZKzv49P0x0sp5fa7k9DFdxVXsL4sjy02
         W98x0x32kXBFxJXZzYwxcARiAYjE3ur1DCYMo7fSxulC4SqQM45wkcI3kAjYjNpvjWBJ
         Ufzjofyv6rB4jUWmR7yDJiYaz7IAgtwnp62EtNNWT4w9eT12N4nh/x2E3TucpKO9KXnv
         HBEw==
X-Gm-Message-State: APjAAAVeHN7n3PjbPz+mUu+Em0DZclPj92FFesGCXjy+c9DedXldCt8T
        wM7mYRn4crpWdxdZ4tCpw/73dkBNh0lDwWroxrOKWQ==
X-Google-Smtp-Source: APXvYqwMboC6xc8+uyhTbyFk+OuGSIgc+KbllCY1pv69DqczX6VA3ZVNZ98GcDj4lK4WjnF/z3/hoHDiXYy2YV86J+4=
X-Received: by 2002:a2e:918c:: with SMTP id f12mr5288808ljg.66.1579256021661;
 Fri, 17 Jan 2020 02:13:41 -0800 (PST)
MIME-Version: 1.0
References: <20190617221134.9930-1-f.fainelli@gmail.com> <20191114181243.q37rxoo3seds6oxy@pengutronix.de>
 <7322163f-e08e-a6b7-b143-e9d59917ee5b@gmail.com> <20191115070842.2x7psp243nfo76co@pengutronix.de>
 <20191115114416.ba6lmwb7q4gmepzc@pengutronix.de> <60bda4a9-f4f8-3641-2612-17fab3173b29@gmail.com>
In-Reply-To: <60bda4a9-f4f8-3641-2612-17fab3173b29@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jan 2020 11:13:30 +0100
Message-ID: <CACRpkdYJR3gQCb4WXwF4tGzk+tT7jMcV9=nDK0PFkeh+0G11bA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] KASan for arm
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michal Hocko <mhocko@suse.com>,
        Julien Thierry <julien.thierry@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        David Howells <dhowells@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        kvmarm@lists.cs.columbia.edu, Jonathan Corbet <corbet@lwn.net>,
        Abbott Liu <liuwenliang@huawei.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        drjones@redhat.com, Vladimir Murzin <vladimir.murzin@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Jinbum Park <jinb.park7@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Landley <rob@landley.net>, philip@cog.systems,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Garnier <thgarnie@google.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 19, 2019 at 1:14 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 11/15/19 3:44 AM, Marco Felsch wrote:
> >
> > With your v7 it is working on my imx6 but unfortunately I can't run my
> > gstreamer testcase. My CPU load goes to 100% after starting gstreamer
> > and nothing happens.. But the test_kasan module works =) So I decided to
> > check a imx6quadplus but this target did not boot.. I used another
> > toolchain for the imx6quadplus gcc-9 instead of gcc-8. So it seems that
> > something went wrong during compilation. Because you didn't changed
> > something within the logic.
> >
> > I wonder why we must not define the CONFIG_KASAN_SHADOW_OFFSET for arm.
>
> That is was oversight. I have pushed updates to the branch here:
>
> https://github.com/ffainelli/linux/pull/new/kasan-v7

I just git Kasan back on my radar because it needs to be fixed some day.

I took this branch for a ride on some QEMU and some real hardware.
Here I use the test module and just hacked it into the kernel instead of
as a module, it then crashes predictably but performs all the KASan
tests first and it works file, as in provokes the right warnings from
KASan.

Tested systems:

QEMU ARM RealView PBA8
QEMU ARM RealView PBX A9
QEMU ARM Versatile AB
Hardware Integrator CP
Hardware Versatile AB with IB2

Can we start to submit these patches to Russell's patch tracker?
Any more testing I should be doing?

Yours,
Linus Walleij

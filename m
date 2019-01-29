Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B75EC7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 14:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbfA2OeU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 09:34:20 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:39022 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfA2OeU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 09:34:20 -0500
Received: by mail-io1-f67.google.com with SMTP id k7so16436410iob.6
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 06:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mmotDk+tv7WqQKlIqsD4nkJEwWqiebe3Ae3Mjvh36Vs=;
        b=IPb/iugS2OSQHbTEVpBLTwBipfP5TavWvlo72N10xLbwKpolCjeLEAgPqLMwBeMF4A
         yx+grP4mN/naq3Y08C8Ij2RstG/AuBKPZnFfXRhfZfTx/QYl8HeNWwg2bLCg/+q9dAsL
         y27G79iVKHmdlelat5SwAj1XqK5s0pniFjojQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mmotDk+tv7WqQKlIqsD4nkJEwWqiebe3Ae3Mjvh36Vs=;
        b=InM8ak3tZFujYHSGLk0E6IDIOh7I9tY97uQ/R3+PkScDmiPKHvpr39ExIt0FuLZDSV
         3ih2YJJILG6LMil02kGS1Sb8SjQbZ7Es2rpADypV6aFHbQ492Rr0eHLXy1uGxyWnL9ZX
         9xQx1N1QZkytNcs1SUSokXdGJGwkX8mHLw8CiHJT6mHL4niQaBLqz9osChXHwcfbq8TM
         sXgMv0NQy6dt5y6jeEmWoUPI/tNJZC46wPtlT+G3rbJ4zJ323AGxRGJO5ucE9ahdO9GR
         ypAPN/1GcYohMiBGPDY2nXUtBZ48gUEfuDsyikt7ypVt5+/Q/h2M8374i6MzBRav4zjl
         FJBg==
X-Gm-Message-State: AHQUAuaHvhiWiPIpMrTSq3ZN2BUKOPLZOqYMG104tx8c7yDzDp7+Y6HX
        1XRYJgDMAOJi7pW/keVM58GMdB6vfGV3T+7HJ0G8xQ==
X-Google-Smtp-Source: ALg8bN7MMrwk+mDhe1MAT62s0PJe2rrA2KEAm7wdRDHXrdh4GEcylnlhpDq5vV5o5XFaFGE662HzS6BFV0hRef3SsE0=
X-Received: by 2002:a5d:8410:: with SMTP id i16mr15346210ion.173.1548772459410;
 Tue, 29 Jan 2019 06:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20190129092150.15184-1-ard.biesheuvel@linaro.org>
 <20190129092150.15184-3-ard.biesheuvel@linaro.org> <0ea153fd-1c2b-c4e6-54d9-e31189f1b90c@suse.de>
 <CAKv+Gu8S-EFdVtuKHEtV=3Mi7tKWjxEbjovAdspaKTzmUwAfjQ@mail.gmail.com> <15bc4db9-779b-93b3-3e6a-be8cda07be67@suse.de>
In-Reply-To: <15bc4db9-779b-93b3-3e6a-be8cda07be67@suse.de>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Tue, 29 Jan 2019 15:34:08 +0100
Message-ID: <CAKv+Gu8vWfbKBssebBnVrALhdf2W5+6GpVHEtLFEn66Dr5R-zw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] efi: x86: convert x86 EFI earlyprintk into generic
 earlycon implementation
To:     Alexander Graf <agraf@suse.de>
Cc:     linux-efi <linux-efi@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Leif Lindholm <leif.lindholm@linaro.org>,
        Graeme Gregory <graeme.gregory@linaro.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Peter Jones <pjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 29 Jan 2019 at 15:04, Alexander Graf <agraf@suse.de> wrote:
>
> On 01/29/2019 02:41 PM, Ard Biesheuvel wrote:
> > Hi Alex,
> >
> > On Tue, 29 Jan 2019 at 14:37, Alexander Graf <agraf@suse.de> wrote:
> >> On 01/29/2019 10:21 AM, Ard Biesheuvel wrote:
> >>> Move the x86 EFI earlyprintk implementation to a shared location under
> >>> drivers/firmware and tweak it slightly so we can expose it as an earlycon
> >>> implementation (which is generic) rather than earlyprintk (which is only
> >>> implemented for a few architectures)
> >>>
> >>> This also involves switching to write-combine mappings by default (which
> >>> is required on ARM since device mappings lack memory semantics, and so
> >>> memcpy/memset may not be used on them), and adding support for shared
> >>> memory framebuffers on cache coherent non-x86 systems (which do not
> >>> tolerate mismatched attributes)
> >>>
> >>> Note that 32-bit ARM does not populate its struct screen_info early
> >>> enough for earlycon=efifb to work, so it is disabled there.
> >>>
> >>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> >>> ---
> >>>    Documentation/admin-guide/kernel-parameters.txt |   8 +-
> >>>    arch/x86/Kconfig.debug                          |  10 -
> >>>    arch/x86/include/asm/efi.h                      |   1 -
> >>>    arch/x86/kernel/early_printk.c                  |   4 -
> >>>    arch/x86/platform/efi/Makefile                  |   1 -
> >>>    arch/x86/platform/efi/early_printk.c            | 240 --------------------
> >>>    drivers/firmware/efi/Kconfig                    |   6 +
> >>>    drivers/firmware/efi/Makefile                   |   1 +
> >>>    drivers/firmware/efi/earlycon.c                 | 208 +++++++++++++++++
> >>>    9 files changed, 222 insertions(+), 257 deletions(-)
> >>>
> >> [...]
> >>
> >>> +static int __init efi_earlycon_setup(struct earlycon_device *device,
> >>> +                                  const char *opt)
> >>> +{
> >>> +     struct screen_info *si;
> >>> +     u16 xres, yres;
> >>> +     u32 i;
> >>> +
> >>> +     if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI)
> >>> +             return -ENODEV;
> >>> +
> >>> +     fb_base = screen_info.lfb_base;
> >>> +     if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> >>> +             fb_base |= (u64)screen_info.ext_lfb_base << 32;
> >>> +
> >>> +     if (opt && !strcmp(opt, "ram"))
> >>> +             fb_prot = PAGE_KERNEL;
> >>> +     else
> >>> +             fb_prot = pgprot_writecombine(PAGE_KERNEL);
> >> Can you determine the default from the UEFI memory map?
> >>
> > No. This is being called way before we parse the system table and the
> > memory map. Given that this is debug code, duplicating a significant
> > chunk of that work here (and run the risk of crashing here due to
> > unexpected contents in those tables) is not a great idea imo.
>
> I see. Maybe we will want to have something there, but I tend to agree
> that for now we should keep bits as simple as possible.
>
> >
> >> Also, doesn't the current logic map it as WC on x86 too? Is that
> >> intentional?
> >>
> > Yes. As mentioned in the cover letter, this aligns it with efifb which
> > also uses WC by default (although there, it can be overridden for
> > performance reasons, but due to the debug nature of earlycon, this
> > doesn't matter, since higher performance only makes it more difficult
> > to capture the log on your phone camera)
>
> Well, the cover letter really only talks about arm :). But yeah, I think
> it's probably a good idea to map it WC regardless.
>

Fair enough.

> Overall, I would've preferred to have a larger patch set with more, but
> smaller changes that refactor the code. But it seems to be reviewable
> enough still. Let's cross our fingers it doesn't break :).
>
>
> Reviewed-by: Alexander Graf <agraf@suse.de>
>

Thanks

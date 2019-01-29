Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 04B3E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 13:42:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfA2NmD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 08:42:03 -0500
Received: from mail-it1-f193.google.com ([209.85.166.193]:50598 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfA2NmD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 08:42:03 -0500
Received: by mail-it1-f193.google.com with SMTP id z7so4542895iti.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 05:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x+grDnfJAgABtQck5U8w0dV8K15R3XKvjTcRJHODgYc=;
        b=Y3IP0wvuqC21SeSVWa7tbdHF56eK4V3Xt2wEOtobUJhl994ogC2F+8R9x6Pi8zz/QL
         HNNuhW2m/8tcyhkCB/T8Fmf7ZXyAo4MUEeST+ThVa7vaheQDC3sb0OIku3qHb2fi5GjE
         S4BUTHXU15uZXG0wcZ1eWyxSLrRNvya9zONc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x+grDnfJAgABtQck5U8w0dV8K15R3XKvjTcRJHODgYc=;
        b=MZluJlJLVyCIAvpeBLycW6Z1LHFFD/PVgUvBGOgdo+4ecbg+Y/DCqiYXyRaiUkMlyD
         1p78dRvNmt9ADmZ5slradzvqDLTxYSGZfdeeUwPGxJjL94HiJNDBEnVvQfd57ex0Qb2+
         hD+qwliKcrf1LRNLUlF3YtZIPxXMhfQnopG4xqYP85KeGb2WTvO4YR17HHtyc8P/13XB
         QwfEwNzq/EMfVk3OI1Cf+mD4c23I2bypRHnppt8m8usmi3xdkuFXpRpxYWiYaZpIapaB
         yY7/sTKb189LgNP56M+aLF3/c6IJwK42WHeZrGtCCiuGQUCr+baLsRkV6w/psHTW8jxj
         mleg==
X-Gm-Message-State: AJcUukfxb5zSvkY38bsxpFAr2UTHd/73xNHgAsbQKPd57meIisekYyju
        T/XEm39mZiOQfOoxe3Cyh2QYRZNMYTvOOPjMHSG5/w==
X-Google-Smtp-Source: ALg8bN7UyWyKFb9uvZGUPSUWycoNnAcz9hygaP3G1aIVad4kO2ykZQcImcWPq0KZipgupcGTDyexgU96kBjGOT0x4DM=
X-Received: by 2002:a24:710:: with SMTP id f16mr11287836itf.121.1548769322146;
 Tue, 29 Jan 2019 05:42:02 -0800 (PST)
MIME-Version: 1.0
References: <20190129092150.15184-1-ard.biesheuvel@linaro.org>
 <20190129092150.15184-3-ard.biesheuvel@linaro.org> <0ea153fd-1c2b-c4e6-54d9-e31189f1b90c@suse.de>
In-Reply-To: <0ea153fd-1c2b-c4e6-54d9-e31189f1b90c@suse.de>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Tue, 29 Jan 2019 14:41:51 +0100
Message-ID: <CAKv+Gu8S-EFdVtuKHEtV=3Mi7tKWjxEbjovAdspaKTzmUwAfjQ@mail.gmail.com>
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

Hi Alex,

On Tue, 29 Jan 2019 at 14:37, Alexander Graf <agraf@suse.de> wrote:
>
> On 01/29/2019 10:21 AM, Ard Biesheuvel wrote:
> > Move the x86 EFI earlyprintk implementation to a shared location under
> > drivers/firmware and tweak it slightly so we can expose it as an earlycon
> > implementation (which is generic) rather than earlyprintk (which is only
> > implemented for a few architectures)
> >
> > This also involves switching to write-combine mappings by default (which
> > is required on ARM since device mappings lack memory semantics, and so
> > memcpy/memset may not be used on them), and adding support for shared
> > memory framebuffers on cache coherent non-x86 systems (which do not
> > tolerate mismatched attributes)
> >
> > Note that 32-bit ARM does not populate its struct screen_info early
> > enough for earlycon=efifb to work, so it is disabled there.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > ---
> >   Documentation/admin-guide/kernel-parameters.txt |   8 +-
> >   arch/x86/Kconfig.debug                          |  10 -
> >   arch/x86/include/asm/efi.h                      |   1 -
> >   arch/x86/kernel/early_printk.c                  |   4 -
> >   arch/x86/platform/efi/Makefile                  |   1 -
> >   arch/x86/platform/efi/early_printk.c            | 240 --------------------
> >   drivers/firmware/efi/Kconfig                    |   6 +
> >   drivers/firmware/efi/Makefile                   |   1 +
> >   drivers/firmware/efi/earlycon.c                 | 208 +++++++++++++++++
> >   9 files changed, 222 insertions(+), 257 deletions(-)
> >
>
> [...]
>
> > +static int __init efi_earlycon_setup(struct earlycon_device *device,
> > +                                  const char *opt)
> > +{
> > +     struct screen_info *si;
> > +     u16 xres, yres;
> > +     u32 i;
> > +
> > +     if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI)
> > +             return -ENODEV;
> > +
> > +     fb_base = screen_info.lfb_base;
> > +     if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> > +             fb_base |= (u64)screen_info.ext_lfb_base << 32;
> > +
> > +     if (opt && !strcmp(opt, "ram"))
> > +             fb_prot = PAGE_KERNEL;
> > +     else
> > +             fb_prot = pgprot_writecombine(PAGE_KERNEL);
>
> Can you determine the default from the UEFI memory map?
>

No. This is being called way before we parse the system table and the
memory map. Given that this is debug code, duplicating a significant
chunk of that work here (and run the risk of crashing here due to
unexpected contents in those tables) is not a great idea imo.

> Also, doesn't the current logic map it as WC on x86 too? Is that
> intentional?
>

Yes. As mentioned in the cover letter, this aligns it with efifb which
also uses WC by default (although there, it can be overridden for
performance reasons, but due to the debug nature of earlycon, this
doesn't matter, since higher performance only makes it more difficult
to capture the log on your phone camera)


> > +
> > +     si = &screen_info;
> > +     xres = si->lfb_width;
> > +     yres = si->lfb_height;
> > +
> > +     /*
> > +      * efi_earlycon_write_char() implicitly assumes a framebuffer with
> > +      * 32-bits per pixel.
> > +      */
> > +     if (si->lfb_depth != 32)
> > +             return -ENODEV;
> > +
> > +     font = get_default_font(xres, yres, -1, -1);
> > +     if (!font)
> > +             return -ENODEV;
> > +
> > +     efi_y = rounddown(yres, font->height) - font->height;
> > +     for (i = 0; i < (yres - efi_y) / font->height; i++)
> > +             efi_earlycon_scroll_up();
> > +
> > +     device->con->write = efi_earlycon_write;
> > +     return 0;
> > +}
> > +EARLYCON_DECLARE(efifb, efi_earlycon_setup);
>
>

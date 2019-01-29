Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6DF2E7D982
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 13:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbfA2NhM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 08:37:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:57644 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728023AbfA2NhK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Jan 2019 08:37:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0A4EDAD25;
        Tue, 29 Jan 2019 13:37:09 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] efi: x86: convert x86 EFI earlyprintk into generic
 earlycon implementation
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        linux-efi@vger.kernel.org
Cc:     corbet@lwn.net, leif.lindholm@linaro.org,
        graeme.gregory@linaro.org, mingo@redhat.com, tglx@linutronix.de,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        pjones@redhat.com
References: <20190129092150.15184-1-ard.biesheuvel@linaro.org>
 <20190129092150.15184-3-ard.biesheuvel@linaro.org>
From:   Alexander Graf <agraf@suse.de>
Message-ID: <0ea153fd-1c2b-c4e6-54d9-e31189f1b90c@suse.de>
Date:   Tue, 29 Jan 2019 14:37:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190129092150.15184-3-ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/29/2019 10:21 AM, Ard Biesheuvel wrote:
> Move the x86 EFI earlyprintk implementation to a shared location under
> drivers/firmware and tweak it slightly so we can expose it as an earlycon
> implementation (which is generic) rather than earlyprintk (which is only
> implemented for a few architectures)
>
> This also involves switching to write-combine mappings by default (which
> is required on ARM since device mappings lack memory semantics, and so
> memcpy/memset may not be used on them), and adding support for shared
> memory framebuffers on cache coherent non-x86 systems (which do not
> tolerate mismatched attributes)
>
> Note that 32-bit ARM does not populate its struct screen_info early
> enough for earlycon=efifb to work, so it is disabled there.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>   Documentation/admin-guide/kernel-parameters.txt |   8 +-
>   arch/x86/Kconfig.debug                          |  10 -
>   arch/x86/include/asm/efi.h                      |   1 -
>   arch/x86/kernel/early_printk.c                  |   4 -
>   arch/x86/platform/efi/Makefile                  |   1 -
>   arch/x86/platform/efi/early_printk.c            | 240 --------------------
>   drivers/firmware/efi/Kconfig                    |   6 +
>   drivers/firmware/efi/Makefile                   |   1 +
>   drivers/firmware/efi/earlycon.c                 | 208 +++++++++++++++++
>   9 files changed, 222 insertions(+), 257 deletions(-)
>

[...]

> +static int __init efi_earlycon_setup(struct earlycon_device *device,
> +				     const char *opt)
> +{
> +	struct screen_info *si;
> +	u16 xres, yres;
> +	u32 i;
> +
> +	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI)
> +		return -ENODEV;
> +
> +	fb_base = screen_info.lfb_base;
> +	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> +		fb_base |= (u64)screen_info.ext_lfb_base << 32;
> +
> +	if (opt && !strcmp(opt, "ram"))
> +		fb_prot = PAGE_KERNEL;
> +	else
> +		fb_prot = pgprot_writecombine(PAGE_KERNEL);

Can you determine the default from the UEFI memory map?

Also, doesn't the current logic map it as WC on x86 too? Is that 
intentional?


Alex

> +
> +	si = &screen_info;
> +	xres = si->lfb_width;
> +	yres = si->lfb_height;
> +
> +	/*
> +	 * efi_earlycon_write_char() implicitly assumes a framebuffer with
> +	 * 32-bits per pixel.
> +	 */
> +	if (si->lfb_depth != 32)
> +		return -ENODEV;
> +
> +	font = get_default_font(xres, yres, -1, -1);
> +	if (!font)
> +		return -ENODEV;
> +
> +	efi_y = rounddown(yres, font->height) - font->height;
> +	for (i = 0; i < (yres - efi_y) / font->height; i++)
> +		efi_earlycon_scroll_up();
> +
> +	device->con->write = efi_earlycon_write;
> +	return 0;
> +}
> +EARLYCON_DECLARE(efifb, efi_earlycon_setup);



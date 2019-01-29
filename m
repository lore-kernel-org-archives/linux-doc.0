Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 43C267D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 14:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbfA2OEZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 09:04:25 -0500
Received: from mx2.suse.de ([195.135.220.15]:36226 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725808AbfA2OEZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Jan 2019 09:04:25 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 729A6AEFE;
        Tue, 29 Jan 2019 14:04:23 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] efi: x86: convert x86 EFI earlyprintk into generic
 earlycon implementation
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     linux-efi <linux-efi@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Leif Lindholm <leif.lindholm@linaro.org>,
        Graeme Gregory <graeme.gregory@linaro.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Peter Jones <pjones@redhat.com>
References: <20190129092150.15184-1-ard.biesheuvel@linaro.org>
 <20190129092150.15184-3-ard.biesheuvel@linaro.org>
 <0ea153fd-1c2b-c4e6-54d9-e31189f1b90c@suse.de>
 <CAKv+Gu8S-EFdVtuKHEtV=3Mi7tKWjxEbjovAdspaKTzmUwAfjQ@mail.gmail.com>
From:   Alexander Graf <agraf@suse.de>
Message-ID: <15bc4db9-779b-93b3-3e6a-be8cda07be67@suse.de>
Date:   Tue, 29 Jan 2019 15:04:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu8S-EFdVtuKHEtV=3Mi7tKWjxEbjovAdspaKTzmUwAfjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/29/2019 02:41 PM, Ard Biesheuvel wrote:
> Hi Alex,
>
> On Tue, 29 Jan 2019 at 14:37, Alexander Graf <agraf@suse.de> wrote:
>> On 01/29/2019 10:21 AM, Ard Biesheuvel wrote:
>>> Move the x86 EFI earlyprintk implementation to a shared location under
>>> drivers/firmware and tweak it slightly so we can expose it as an earlycon
>>> implementation (which is generic) rather than earlyprintk (which is only
>>> implemented for a few architectures)
>>>
>>> This also involves switching to write-combine mappings by default (which
>>> is required on ARM since device mappings lack memory semantics, and so
>>> memcpy/memset may not be used on them), and adding support for shared
>>> memory framebuffers on cache coherent non-x86 systems (which do not
>>> tolerate mismatched attributes)
>>>
>>> Note that 32-bit ARM does not populate its struct screen_info early
>>> enough for earlycon=efifb to work, so it is disabled there.
>>>
>>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>> ---
>>>    Documentation/admin-guide/kernel-parameters.txt |   8 +-
>>>    arch/x86/Kconfig.debug                          |  10 -
>>>    arch/x86/include/asm/efi.h                      |   1 -
>>>    arch/x86/kernel/early_printk.c                  |   4 -
>>>    arch/x86/platform/efi/Makefile                  |   1 -
>>>    arch/x86/platform/efi/early_printk.c            | 240 --------------------
>>>    drivers/firmware/efi/Kconfig                    |   6 +
>>>    drivers/firmware/efi/Makefile                   |   1 +
>>>    drivers/firmware/efi/earlycon.c                 | 208 +++++++++++++++++
>>>    9 files changed, 222 insertions(+), 257 deletions(-)
>>>
>> [...]
>>
>>> +static int __init efi_earlycon_setup(struct earlycon_device *device,
>>> +                                  const char *opt)
>>> +{
>>> +     struct screen_info *si;
>>> +     u16 xres, yres;
>>> +     u32 i;
>>> +
>>> +     if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI)
>>> +             return -ENODEV;
>>> +
>>> +     fb_base = screen_info.lfb_base;
>>> +     if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
>>> +             fb_base |= (u64)screen_info.ext_lfb_base << 32;
>>> +
>>> +     if (opt && !strcmp(opt, "ram"))
>>> +             fb_prot = PAGE_KERNEL;
>>> +     else
>>> +             fb_prot = pgprot_writecombine(PAGE_KERNEL);
>> Can you determine the default from the UEFI memory map?
>>
> No. This is being called way before we parse the system table and the
> memory map. Given that this is debug code, duplicating a significant
> chunk of that work here (and run the risk of crashing here due to
> unexpected contents in those tables) is not a great idea imo.

I see. Maybe we will want to have something there, but I tend to agree 
that for now we should keep bits as simple as possible.

>
>> Also, doesn't the current logic map it as WC on x86 too? Is that
>> intentional?
>>
> Yes. As mentioned in the cover letter, this aligns it with efifb which
> also uses WC by default (although there, it can be overridden for
> performance reasons, but due to the debug nature of earlycon, this
> doesn't matter, since higher performance only makes it more difficult
> to capture the log on your phone camera)

Well, the cover letter really only talks about arm :). But yeah, I think 
it's probably a good idea to map it WC regardless.

Overall, I would've preferred to have a larger patch set with more, but 
smaller changes that refactor the code. But it seems to be reviewable 
enough still. Let's cross our fingers it doesn't break :).


Reviewed-by: Alexander Graf <agraf@suse.de>

Thanks,

Alex


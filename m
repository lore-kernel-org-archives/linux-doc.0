Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 937007D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 15:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731040AbeKNBAB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 20:00:01 -0500
Received: from mail-it1-f193.google.com ([209.85.166.193]:38994 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbeKNBAB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 20:00:01 -0500
Received: by mail-it1-f193.google.com with SMTP id m15so18815423itl.4
        for <linux-doc@vger.kernel.org>; Tue, 13 Nov 2018 07:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=PPSJrmodoa7QV4l6U8MnmFeoVgFhWGsbzLEFcuk4hQk=;
        b=bKn8PID6S/qWJrBi5KxahwpVWArLmzzCrZF85aWoqPGXi6RKiQ/uvc+x/vBbGFIxdi
         g7D4t28P8AEhlrVBUFGrN6w8MdQkrAw/LikH64rSNvZKSuLZco04dEty8gcDLQfvFLrb
         ZbZwzVKJ3PsXgM7h75LChPuLMXEYCF7ZXjL3nlK1PNhmdnMDPgTaSXbkvWW2c9S1uAUy
         k7yFAJjdLbCu+GGbmIEHg/W6UoTU7XvX7+kjK03sOAGCKqWBPkuI7SfntSqt6CelOq4s
         5sNzxxt4ve0rlYXnwdLZplQw7pvmk7W4EdfI41+gY4tHElsHLHip1BaAXmpB88p0a4/O
         e5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=PPSJrmodoa7QV4l6U8MnmFeoVgFhWGsbzLEFcuk4hQk=;
        b=ubeAHIRnF4mZe1M/tUi9XK3IT9ztd1pkH49qI4sb160GKxYzYW7P1dUJDBRXPGC9oO
         ZfO0eMtYeuoyyFNakZAgXD9PaCZ6Q94XVNgNBE5GYNWDEnMb4HjZGuIhsf60exkd7pib
         RD/+cJK5mHZN170XGPynsAKXp+hseB3oOVN9jd0ZSvkN5pWpLRj27CcSQ3beWGIYQSLr
         YAaS5E+zznA3zwxAwyppa/KPG6jZSKBYX8GkBkect2DMpQ7vsJnfEZR8Z5fj5vO0UWLC
         n5/u+Ohl4OtqsMrqyR4TbCQRlzYqx73Csy/FARgOcYNh9mnVb7gHfahUHJ4iCAYFeSZ3
         XBAw==
X-Gm-Message-State: AGRZ1gKoTdXW9oduJbWrTEQ+97UVi5Iwffhyk5BCcYxg2DLgWVHv21rK
        1ZAfPnJJpJYQU7wzEI7sg110Nn1aXimL74vkriOlsg==
X-Google-Smtp-Source: AJdET5fUC+/pIZADWTfzdfyy8I5RQcOi5Ucxk+fCB2Zm2I3eiEuX4YXYzXVvUme6iHaQpP8Uydpo2Eo2WSlNoaQiP+0=
X-Received: by 2002:a24:1642:: with SMTP id a63mr3516503ita.40.1542121288206;
 Tue, 13 Nov 2018 07:01:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:7050:0:0:0:0:0 with HTTP; Tue, 13 Nov 2018 07:01:27
 -0800 (PST)
In-Reply-To: <20181108122228.xqwhpkjritrvqneq@lakrids.cambridge.arm.com>
References: <cover.1541525354.git.andreyknvl@google.com> <4891a504adf61c0daf1e83642b6f7519328dfd5f.1541525354.git.andreyknvl@google.com>
 <20181108122228.xqwhpkjritrvqneq@lakrids.cambridge.arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Nov 2018 16:01:27 +0100
Message-ID: <CAAeHK+xPkbg_9P9oCkS-iB8S81vTxD3p5SbyWHy-vrp2ybkKmg@mail.gmail.com>
Subject: Re: [PATCH v10 12/22] kasan, arm64: fix up fault handling logic
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
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
        kasan-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
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

On Thu, Nov 8, 2018 at 1:22 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> On Tue, Nov 06, 2018 at 06:30:27PM +0100, Andrey Konovalov wrote:
>> show_pte in arm64 fault handling relies on the fact that the top byte of
>> a kernel pointer is 0xff, which isn't always the case with tag-based
>> KASAN.
>
> That's for the TTBR1 check, right?
>
> i.e. for the following to work:
>
>         if (addr >= VA_START)
>
> ... we need the tag bits to be an extension of bit 55...
>
>>
>> This patch resets the top byte in show_pte.
>>
>> Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
>> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>> ---
>>  arch/arm64/mm/fault.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index 7d9571f4ae3d..d9a84d6f3343 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -32,6 +32,7 @@
>>  #include <linux/perf_event.h>
>>  #include <linux/preempt.h>
>>  #include <linux/hugetlb.h>
>> +#include <linux/kasan.h>
>>
>>  #include <asm/bug.h>
>>  #include <asm/cmpxchg.h>
>> @@ -141,6 +142,8 @@ void show_pte(unsigned long addr)
>>       pgd_t *pgdp;
>>       pgd_t pgd;
>>
>> +     addr = (unsigned long)kasan_reset_tag((void *)addr);
>
> ... but this ORs in (0xffUL << 56), which is not correct for addresses
> which aren't TTBR1 addresses to begin with, where bit 55 is clear, and
> throws away useful information.
>
> We could use untagged_addr() here, but that wouldn't be right for
> kernels which don't use TBI1, and we'd erroneously report addresses
> under the TTBR1 range as being in the TTBR1 range.
>
> I also see that the entry assembly for el{1,0}_{da,ia} clears the tag
> for EL0 addresses.
>
> So we could have:
>
> static inline bool is_ttbr0_addr(unsigned long addr)
> {
>         /* entry assembly clears tags for TTBR0 addrs */
>         return addr < TASK_SIZE_64;
> }
>
> static inline bool is_ttbr1_addr(unsigned long addr)
> {
>         /* TTBR1 addresses may have a tag if HWKASAN is in use */
>         return arch_kasan_reset_tag(addr) >= VA_START;
> }
>
> ... and use those in the conditionals, leaving the addr as-is for
> reporting purposes.

Actually it looks like 276e9327 ("arm64: entry: improve data abort
handling of tagged pointers") already takes care of both user and
kernel fault addresses and correctly removes tags from them. So I
think we need to drop this patch.

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 78BE57D2EE
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 15:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbeH3T6y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 15:58:54 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:39979 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbeH3T6y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 15:58:54 -0400
Received: by mail-wm0-f65.google.com with SMTP id 207-v6so2525559wme.5
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=1B9jTJpTxMr9BjTsN5NpKawAR/FkrVdKtbrbRzOGgX8=;
        b=YexaT6UAt+AOzzePc3Q6kX7ioc1pVcT6K++YtGBngvAS3ugSP0mLTM2H+ACdoqBHJR
         TqLNtuGMFDmaHMQLG6fA8PUxeG/tQRiOuE8H/eAKinbw5o/cpMqiNruzWwB33R64ecJe
         KDudkjXMJXsz4GhSqptLgwRy9RxOATl7IA2iF4305bN2kIfk/8rzIfHGcZRSOeF7YyXx
         49uv7S7dnmNQmTrK9SMZkGumUOm2xLv8vS+efV+H00QkWXzygqDYidPp/rJKr+SD1esG
         Zt/01ylQvX+fVZ6Ppxqq9egFbQiTNHYP6Pw4z9LsCWgqJI2pLa/TEyfkfiSUUTndVm4z
         93kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=1B9jTJpTxMr9BjTsN5NpKawAR/FkrVdKtbrbRzOGgX8=;
        b=SgCnxS3r4ypG6YUVvSgIPTJavwQt/cuC94K3iVJWeftzQlZWEBegDMnngV3JrdA3hq
         5iGXOBQ1F4mV4UC7tQyjvvM8TVtJze89y3kF9ZF55vi5dPKXzwyOgHv1P6DLLqBJXcwP
         o5i7SvxWuxEH19jXsfZmScxI/Sc/IjSi/3CMczcQDj3iApMrdLteKf4sCyTKcVHxO/xK
         AH++cBnSqrbysZFuQh1iUCtCQQ/NXt19ZDv/emTaIuzRYySS4w9rKIUrCbUBjlE+IYXZ
         h/4onxgmrNcAR6W4tEC1BSEvbZM7XzLA9wsXCsNDByU6ic+44WsI3QVk0YMlWmyL1luY
         L9dw==
X-Gm-Message-State: APzg51A0jSXy4F46XB401eiDlObJtmnNdY63Jp64o4t9lSG8mHEFv/kv
        rToJYGWSy+UhSZQ/xygkf9PzO3wZCC+AIsA+AfbtRA==
X-Google-Smtp-Source: ANB0VdZ2AA1funcEltk5U7SYaUsz8ZL30CqhXGpZMP1OMxnN7qZ+B/a097EBJ+O5oCqVMXMRqZMnRpNPH0ZQpoRaL+o=
X-Received: by 2002:a1c:ef0f:: with SMTP id n15-v6mr2156920wmh.116.1535644564917;
 Thu, 30 Aug 2018 08:56:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:548:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 08:55:44 -0700 (PDT)
In-Reply-To: <CAG48ez3uZrC-9uJ0uMoVPTtxRXRN8D+3zs5FknZD2woTT6mazg@mail.gmail.com>
References: <20180830143904.3168-1-yu-cheng.yu@intel.com> <20180830143904.3168-20-yu-cheng.yu@intel.com>
 <CAG48ez3uZrC-9uJ0uMoVPTtxRXRN8D+3zs5FknZD2woTT6mazg@mail.gmail.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Thu, 30 Aug 2018 08:55:44 -0700
Message-ID: <CALCETrW78UKt6AQJeN8GkhtxjuASnH1PV5QSpzQtDz9-2d3Asw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 19/24] x86/cet/shstk: Introduce WRUSS instruction
To:     Jann Horn <jannh@google.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromiun.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 30, 2018 at 8:39 AM, Jann Horn <jannh@google.com> wrote:
> On Thu, Aug 30, 2018 at 4:44 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>>
>> WRUSS is a new kernel-mode instruction but writes directly
>> to user shadow stack memory.  This is used to construct
>> a return address on the shadow stack for the signal
>> handler.
>>
>> This instruction can fault if the user shadow stack is
>> invalid shadow stack memory.  In that case, the kernel does
>> fixup.
>>
>> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> [...]
>> +static inline int write_user_shstk_64(unsigned long addr, unsigned long val)
>> +{
>> +       int err = 0;
>> +
>> +       asm volatile("1: wrussq %1, (%0)\n"
>> +                    "2:\n"
>> +                    _ASM_EXTABLE_HANDLE(1b, 2b, ex_handler_wruss)
>> +                    :
>> +                    : "r" (addr), "r" (val));
>> +
>> +       return err;
>> +}
>
> What's up with "err"? You set it to zero, and then you return it, but
> nothing can ever set it to non-zero, right?
>
>> +__visible bool ex_handler_wruss(const struct exception_table_entry *fixup,
>> +                               struct pt_regs *regs, int trapnr)
>> +{
>> +       regs->ip = ex_fixup_addr(fixup);
>> +       regs->ax = -1;
>> +       return true;
>> +}
>
> And here you just write into regs->ax, but your "asm volatile" doesn't
> reserve that register. This looks wrong to me.
>
> I think you probably want to add something like an explicit
> `"+&a"(err)` output to the asm statements.

We require asm goto support these days.  How about using that?  You
won't even need a special exception handler.

Also, please change the BUG to WARN in the you-did-it-wrong 32-bit
case.  And return -EFAULT.

--Andy

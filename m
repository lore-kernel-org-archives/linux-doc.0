Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 149847E679
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 14:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751723AbeEBOjO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 10:39:14 -0400
Received: from mail-io0-f181.google.com ([209.85.223.181]:33577 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751011AbeEBOin (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 10:38:43 -0400
Received: by mail-io0-f181.google.com with SMTP id e78-v6so17766002iod.0
        for <linux-doc@vger.kernel.org>; Wed, 02 May 2018 07:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=DXU0ue7x0O5Z2LY9ESQDuy7uCc1Z+sCJDx4n4/AVxi0=;
        b=luHD/RO1La6szXOb/gXy3Bvu+/E/XrJ/gok1+jQEQffbnQSEx7JuMnQtiGhSlZdv0R
         MSIMlO20Rfq0IcIRFDssYiRWmz5RU3jur+AEN/McN2S0Ici319daoCieMzRf4mye9/1N
         mRDX/1yWYz7zfbZ+nX+I4UnSt6fm0IsudnL9+ETje/gb6kCcP1wuuwmna40kYFHBBT/5
         NFKTQR0Acm8ovNqJMmD8PXJdmrfqrZ5rB0d7hRb+bY7Tbd1vrELdngAb2IrjiuGCtCnx
         DBkVaOwQ7oiFGO1spGEukUoFcHmjKwSQFDUCXjU/kfOT+Ide1qhdjlS7SWXX6IdREGb+
         xb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=DXU0ue7x0O5Z2LY9ESQDuy7uCc1Z+sCJDx4n4/AVxi0=;
        b=XxWLjMqiagkuaIr+qrr0XnnWbE2PUdv266EQOBuXkggLjAARq2CYt6ayhJLxdVEB4L
         At7qsFYhE/vpk2HFm1ZF4lWV6rw9z+FwtxwZ9bBTaTloxR1fiQeLQ6n4qxhvt9tlRFhW
         RcCyn/H9SN9U1JrCBAdOU624fN8jW4qfZf4afvhZPgfu4XYIXvbGmWB9aBRu5HJJRWhv
         79HHebULlwenaCnXWN8HHAU7K7WAaGvxoam9c9THRBekc+9hn9mgLhq2ax5S7QPNKtCE
         qARDFfW8i2BNj5KCL5YDivMQdp5NcFnd7p3heM5udTTXXFtK1RlAt527a0dr3lwSv2RL
         T7rw==
X-Gm-Message-State: ALQs6tAKXsGT3IqodLhXR8Bz6SfaZ/Yf/iEuk5kIORSS18rcYIj288Id
        gBQPw5g5e3YKEHKSJ57SwYdGkJcOTUyeAyR3nnwUOA==
X-Google-Smtp-Source: AB8JxZoV9iQFv8pLmN1CdwSNsYbEoZN8AXd9juaA1vjowJKYmTHzaBfy/MraSWa0Wr0qBhTDIEYnj9EbtK4zMco6wvU=
X-Received: by 2002:a6b:bb02:: with SMTP id l2-v6mr21990289iof.31.1525271922969;
 Wed, 02 May 2018 07:38:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:6658:0:0:0:0:0 with HTTP; Wed, 2 May 2018 07:38:42 -0700 (PDT)
In-Reply-To: <20180426174714.4jtb72q56w3xonsa@armageddon.cambridge.arm.com>
References: <cover.1524077494.git.andreyknvl@google.com> <0db34d04fa16be162336106e3b4a94f3dacc0af4.1524077494.git.andreyknvl@google.com>
 <20180426174714.4jtb72q56w3xonsa@armageddon.cambridge.arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 2 May 2018 16:38:42 +0200
Message-ID: <CAAeHK+zY8p9E4FZa7mbdgR=wR0u-RDS552dn=h9fKRC-ArYLdw@mail.gmail.com>
Subject: Re: [PATCH 4/6] mm, arm64: untag user addresses in mm/gup.c
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 26, 2018 at 7:47 PM, Catalin Marinas
<catalin.marinas@arm.com> wrote:

My approach with this was to add untagging to every gup.c function
that is exposed for external use, but perhaps adding untagging only
where it is actually required is a better approach.

> On Wed, Apr 18, 2018 at 08:53:13PM +0200, Andrey Konovalov wrote:
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 76af4cfeaf68..fb375de7d40d 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -386,6 +386,8 @@ struct page *follow_page_mask(struct vm_area_struct *vma,
>>       struct page *page;
>>       struct mm_struct *mm = vma->vm_mm;
>>
>> +     address = untagged_addr(address);
>> +
>>       *page_mask = 0;
>>
>>       /* make this handle hugepd */
>
> Does having a tagged address here makes any difference? I couldn't hit a
> failure with my simple tests (LD_PRELOAD a library that randomly adds
> tags to pointers returned by malloc).

I think you're right, follow_page_mask is only called from
__get_user_pages, which already untagged the address. I'll remove
untagging here.

>
>> @@ -647,6 +649,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
>>       if (!nr_pages)
>>               return 0;
>>
>> +     start = untagged_addr(start);
>> +
>>       VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
>>
>>       /*
>> @@ -801,6 +805,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
>>       struct vm_area_struct *vma;
>>       int ret, major = 0;
>>
>> +     address = untagged_addr(address);
>> +
>>       if (unlocked)
>>               fault_flags |= FAULT_FLAG_ALLOW_RETRY;
>>
>> @@ -854,6 +860,8 @@ static __always_inline long __get_user_pages_locked(struct task_struct *tsk,
>>       long ret, pages_done;
>>       bool lock_dropped;
>>
>> +     start = untagged_addr(start);
>> +
>>       if (locked) {
>>               /* if VM_FAULT_RETRY can be returned, vmas become invalid */
>>               BUG_ON(vmas);
>
> Isn't __get_user_pages() untagging enough to cover this case as well?
> Can this function not cope with tagged pointers?

Yes, I think you're right here as well. I'll remove untagging here.

>
>> @@ -1751,6 +1759,8 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
>>       unsigned long flags;
>>       int nr = 0;
>>
>> +     start = untagged_addr(start);
>> +
>>       start &= PAGE_MASK;
>>       addr = start;
>>       len = (unsigned long) nr_pages << PAGE_SHIFT;
>> @@ -1803,6 +1813,8 @@ int get_user_pages_fast(unsigned long start, int nr_pages, int write,
>>       unsigned long addr, len, end;
>>       int nr = 0, ret = 0;
>>
>> +     start = untagged_addr(start);
>> +
>>       start &= PAGE_MASK;
>>       addr = start;
>>       len = (unsigned long) nr_pages << PAGE_SHIFT;
>
> Have you hit a problem with the fast gup functions and tagged pointers?
> The page table walking macros (e.g. p*d_index()) should mask the tag out
> already.

I didn't hit a problem, but the plan was to add untagging to all gup.c
interface functions as I mentioned above. Here get_user_pages_fast can
cope with tagged addresses as long as gup_pgd_range can. And looks
like the latter can indeed do that since it only uses addr through the
page table walking macros you mentioned. I'll remove untagging here as
well.

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

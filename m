Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E098AC4320E
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 21:42:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1B4360F39
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 21:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243518AbhHZVnN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Aug 2021 17:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34578 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232675AbhHZVnN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Aug 2021 17:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630014145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m2FmJSXlEr2qCecPowyaOlZhRz8GpI4FUiMuAU7OKCg=;
        b=NUiTSeFLafmtEYoPlRDeBwAhV/mZu+Ieg7zF48AsvSjZiFZLE9z9wWHjLKyNvh2UHNA1RG
        s+OV6I16+Qweh3kFGfVnbnGlrfm4Mo0kxsXpr6IkhOAhXafFqycnM2f3tQN6G3/vAesu/e
        KKEutuaziGSYMYaI+jqbpyoUypaO7og=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286--EI-1L50MvS1CqKEBFcLOA-1; Thu, 26 Aug 2021 17:42:23 -0400
X-MC-Unique: -EI-1L50MvS1CqKEBFcLOA-1
Received: by mail-wm1-f69.google.com with SMTP id x125-20020a1c3183000000b002e73f079eefso3570164wmx.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Aug 2021 14:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=m2FmJSXlEr2qCecPowyaOlZhRz8GpI4FUiMuAU7OKCg=;
        b=H3ZZ6YSzbrBEnBHXsWjeof9Tg/95M+EeI6zqwCIGj3xRAkh+U0zDmZoyQOaxltjsE7
         WUAgM6X7MC/mEIFHaxTXnXYyCQG1Y2ZXGYfyEHbD0qe7Z/ARTC59S5rmak9So9bT2Cmq
         ljOmJvYakzyQo3sgmbxsZsPXw9CJgol//I8MT3gZ/+RuBkm5D2VIGlmo/at976OvJNQE
         +CGQAd2/eM2d+bNGqhOr82PjTEu9f3apvqzgDLiZrhfki8B2OCSdIOT9x0kxBI0/MKla
         GFb7zYO5gIe4KGuAxECmRll/O98Ocf77Iw2c2NsjQ9POEaTJUZ7PcmWW4YQ0cGoeGPUr
         F8MQ==
X-Gm-Message-State: AOAM531bsw8HmNGk0OU0Bk7NaffMTPDKt71mLOSXez8Tpn5EQJhQF2WN
        h8VIh9R4q/gCSn+Mbpl7SUgmnU2MtCJ0wytrPSUugts+Sw9/xDENrltsay8nUuxvkovF/8FqAs0
        nB9oroLr/hwSKrjKu8UEC
X-Received: by 2002:adf:9783:: with SMTP id s3mr6606186wrb.349.1630014142698;
        Thu, 26 Aug 2021 14:42:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCkhqn+UwHShsb4JKtbEqOs0TLDQOFLz7yJC8vYxiDcumhU3BYy/FLLwouM+xIIp2eUTNUgA==
X-Received: by 2002:adf:9783:: with SMTP id s3mr6606161wrb.349.1630014142475;
        Thu, 26 Aug 2021 14:42:22 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23dec.dip0.t-ipconnect.de. [79.242.61.236])
        by smtp.gmail.com with ESMTPSA id i21sm4261721wrb.62.2021.08.26.14.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 14:42:21 -0700 (PDT)
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     akpm@linux-foundation.org, markubo@amazon.com,
        SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, dwmw@amazon.com,
        elver@google.com, fan.du@intel.com, foersleo@amazon.de,
        greg@kroah.com, gthelen@google.com, guoju.fgj@alibaba-inc.com,
        jgowans@amazon.com, joe@perches.com, mgorman@suse.de,
        mheyne@amazon.de, minchan@kernel.org, mingo@redhat.com,
        namhyung@kernel.org, peterz@infradead.org, riel@surriel.com,
        rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org,
        shakeelb@google.com, shuah@kernel.org, sieberf@amazon.com,
        snu@zelle79.org, vbabka@suse.cz, vdavydov.dev@gmail.com,
        zgf574564920@gmail.com, linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210826172920.4877-1-sjpark@amazon.de>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v34 05/13] mm/damon: Implement primitives for the virtual
 memory address spaces
Message-ID: <3b094493-9c1e-6024-bfd5-7eca66399b7e@redhat.com>
Date:   Thu, 26 Aug 2021 23:42:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826172920.4877-1-sjpark@amazon.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26.08.21 19:29, SeongJae Park wrote:
> From: SeongJae Park <sjpark@amazon.de>
> 
> Hello David,
> 
> 
> On Thu, 26 Aug 2021 16:09:23 +0200 David Hildenbrand <david@redhat.com> wrote:
> 
>>> +static void damon_va_mkold(struct mm_struct *mm, unsigned long addr)
>>> +{
>>> +	pte_t *pte = NULL;
>>> +	pmd_t *pmd = NULL;
>>> +	spinlock_t *ptl;
>>> +
>>
>> I just stumbled over this, sorry for the dumb questions:
> 
> Appreciate for the great questions!
> 
>>
>>
>> a) What do we know about that region we are messing with?
>>
>> AFAIU, just like follow_pte() and follow_pfn(), follow_invalidate_pte()
>> should only be called on VM_IO and raw VM_PFNMAP mappings in general
>> (see the doc of follow_pte()). Do you even know that it's within a
>> single VMA and that there are no concurrent modifications?
> 
> We have no idea about the region at this moment.  However, if we successfully
> get the pte or pmd under the protection of the page table lock, we ensure the
> page for the pte or pmd is a online LRU-page with damon_get_page(), before
> updating the pte or pmd's PAGE_ACCESSED bit.  We release the page table lock
> only after the update.
> 
> And concurrent VMA change doesn't matter here because we read and write only
> the page table.  If the address is not mapped or not backed by LRU pages, we
> simply treat it as not accessed.

reading/writing page tables is the real problem.

> 
>>
>> b) Which locks are we holding?
>>
>> I hope we're holding the mmap lock in read mode at least. Or how are you
>> making sure there are no concurrent modifications to page tables / VMA
>> layout ... ?
>>
>>> +	if (follow_invalidate_pte(mm, addr, NULL, &pte, &pmd, &ptl))
> 
> All the operations are protected by the page table lock of the pte or pmd, so
> no concurrent page table modification would happen.  As previously mentioned,
> because we read and update only page table, we don't care about VMAs and
> therefore we don't need to hold mmap lock here.

See below, that's unfortunately not sufficient.

> 
> Outside of this function, DAMON reads the VMAs to know which address ranges are
> not mapped, and avoid inefficiently checking access to the area with the
> information.  Nevertheless, it happens only occasionally (once per 60 seconds
> by default), and it holds the mmap read lock in the case.
> 
> Nonetheless, I agree the usage of follow_invalidate_pte() here could make
> readers very confusing.  It would be better to implement and use DAMON's own
> page table walk logic.  Of course, I might missing something important.  If you
> think so, please don't hesitate at yelling to me.


I'm certainly not going to yell :) But unfortunately I'll have to tell 
you that what you are doing is in my understanding fundamentally broken.

See, page tables might get removed any time
a) By munmap() code even while holding the mmap semaphore in read (!)
b) By khugepaged holding the mmap lock in write mode

The rules are (ignoring the rmap side of things)

a) You can walk page tables inside a known VMA with the mmap semaphore 
held in read mode. If you drop the mmap sem, you have to re-validate the 
VMA! Anything could have changed in the meantime. This is essentially 
what mm/pagewalk.c does.

b) You can walk page tables ignoring VMAs with the mmap semaphore held 
in write mode.

c) You can walk page tables lockless if the architecture supports it and 
you have interrupts disabled the hole time. But you are not allowed to 
write.

With what you're doing, you might end up reading random garbage as page 
table pointers, or writing random garbage to pages that are no longer 
used as page tables.

Take a look at mm/gup.c:lockless_pages_from_mm() to see how difficult it 
is to walk page tables lockless. And it only works because page table 
freeing code synchronizes either via IPI or fake-rcu before actually 
freeing a page table.

follow_invalidate_pte() is, in general, the wrong thing to use. It's 
specialized to VM_IO and VM_PFNMAP. take a look at the difference in 
complexity between follow_invalidate_pte() and mm/pagewalk.c!

I'm really sorry, but as far as I can tell, this is locking-wise broken 
and follow_invalidate_pte() is the wrong interface to use here.

Someone can most certainly correct me if I'm wrong, or if I'm missing 
something regarding your implementation, but if you take a look around, 
you won't find any code walking page tables without at least holding the 
mmap sem in read mode -- for a good reason.

-- 
Thanks,

David / dhildenb


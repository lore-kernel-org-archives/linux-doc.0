Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81282C432BE
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 16:19:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67CD3601FD
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 16:19:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234050AbhIAQUK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Sep 2021 12:20:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45308 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245139AbhIAQUG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Sep 2021 12:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630513147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hn3nm0nrge1oo599gvCipHpqJl0l71Bvv3viUvrNNYo=;
        b=G0zQF1ZIce/b/DyFZim1RLWpyzTPFJN0EYyXi5F9xtM7XMRileWj3YsfW+LOvXdGfn3v0s
        1RysMVeBo78HXfLoeZ04YUlypD3DNFL6OsvCR76cuED0l9Ty5NP9I7tv923mWYpRZ480Hv
        MGva8yl4C5Cm0Z/a1l7456cmlmeTy58=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-IWFz0figPrmdpxsgCSurdQ-1; Wed, 01 Sep 2021 12:19:06 -0400
X-MC-Unique: IWFz0figPrmdpxsgCSurdQ-1
Received: by mail-wm1-f70.google.com with SMTP id j135-20020a1c238d000000b002e87aa95b5aso27190wmj.4
        for <linux-doc@vger.kernel.org>; Wed, 01 Sep 2021 09:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Hn3nm0nrge1oo599gvCipHpqJl0l71Bvv3viUvrNNYo=;
        b=Aen2pcwjp6HnbZj+hMhRavVZUbByYnuECiw+lgQSPMUs3R0kgkSlnsdqSZ3cQ/jfYk
         nDZBqi+SVEq6M2bnTfPofd21eD0rPp2GI5cxalFvk6tVB35/gp23Gc95/aqprqlNXMD3
         2ZSX1BzmKO5OkYZFPqKZ6N9SZy0AMDqNpVzU2f1z91RMgvGMzV+QwmbFUeNDxNC+QBHe
         tb2qfHYeZdPcfvAIJGdgU4eGCvHAYM6hbux7DCr3Gbw8SbXYqxjbOcbjDWcs0t77gUwS
         Wws5FL3Tdalp6Cvivh+wxgAAdexgvjdHqyzpX4fYr4e8d7Ibi1g5lfqghhh63HfTHLZQ
         //pg==
X-Gm-Message-State: AOAM531t9oP1PukhKKcD8ovDffpVdTDWIWN1MkpbaFQCfGNLtJsO3TXa
        zbFYf/dOvbQerhzgOJZca4IvGu/+RLXeIRIpzSG0f/bdva/UadozGOteavyKkeiwS5cc0jchy8C
        PaQRkPBixOFZ6R5iVNFQJ
X-Received: by 2002:adf:b743:: with SMTP id n3mr159628wre.243.1630513144955;
        Wed, 01 Sep 2021 09:19:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEYLc2dpFRaSAx0QwjaB09K1WszhkZSJzjN1zqt2OPHmSgyO/J5GfdeLl1RcvC1vWTCn0HHQ==
X-Received: by 2002:adf:b743:: with SMTP id n3mr159584wre.243.1630513144716;
        Wed, 01 Sep 2021 09:19:04 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23f71.dip0.t-ipconnect.de. [79.242.63.113])
        by smtp.gmail.com with ESMTPSA id w9sm22106619wrs.7.2021.09.01.09.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 09:19:04 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] mm: free user PTE page table pages
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <20210819031858.98043-7-zhengqi.arch@bytedance.com>
 <20210901135314.GA1859446@nvidia.com>
 <0c9766c9-6e8b-5445-83dc-9f2b71a76b4f@redhat.com>
 <20210901153247.GJ1721383@nvidia.com>
 <7789261d-6a64-c47b-be6c-c9be680e5d33@redhat.com>
 <20210901161613.GN1721383@nvidia.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e8ebb0bb-b268-c43b-6fc1-e5240dc085c9@redhat.com>
Date:   Wed, 1 Sep 2021 18:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901161613.GN1721383@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01.09.21 18:16, Jason Gunthorpe wrote:
> On Wed, Sep 01, 2021 at 06:13:07PM +0200, David Hildenbrand wrote:
>> On 01.09.21 17:32, Jason Gunthorpe wrote:
>>> On Wed, Sep 01, 2021 at 03:57:09PM +0200, David Hildenbrand wrote:
>>>> On 01.09.21 15:53, Jason Gunthorpe wrote:
>>>>> On Thu, Aug 19, 2021 at 11:18:55AM +0800, Qi Zheng wrote:
>>>>>
>>>>>> diff --git a/mm/gup.c b/mm/gup.c
>>>>>> index 2630ed1bb4f4..30757f3b176c 100644
>>>>>> +++ b/mm/gup.c
>>>>>> @@ -500,6 +500,9 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>>>>>>     	if (unlikely(pmd_bad(*pmd)))
>>>>>>     		return no_page_table(vma, flags);
>>>>>> +	if (!pte_try_get(mm, pmd))
>>>>>> +		return no_page_table(vma, flags);
>>>>>> +
>>>>>>     	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
>>>>>
>>>>> This is not good on a performance path, the pte_try_get() is
>>>>> locking/locking the same lock that pte_offset_map_lock() is getting.
>>>>
>>>> Yes, and we really need patch #8, anything else is just confusing reviewers.
>>>
>>> It is a bit better with patch 8, but it is still not optimal, we don't
>>> need to do the atomic work at all if the entire ptep is accessed while
>>> locked. So the above is stil not what I would expect here, even with
>>> RCU.
>>>
>>> eg I would expect that this kind of change would work first with the
>>> existing paired acessors, ie
>>>
>>> 	pte = pte_offset_map(pmd, address);
>>> 	pte_unmap(pte);
>>>
>>> Should handle the refcount under the covers, and same kind of idea for
>>> the _locked/_unlocked varient.
>>
>> See my other mail.
> 
> Do you have a reference?

Reply to the other mail you just send.

> 
>>> Only places that don't already use that pairing should get modified.
>>>
>>> To do this we have to extend the API so that pte_offset_map() can
>>> fail, or very cleverly return some kind of global non-present pte page
>>> (I wonder if the zero page would work?)
>>
>> I explored both ideas (returning NULL, return a specially prepared page) and
>> it didn't work in some cases where we unmap+remap etc.
> 
> I wouldn't think it works everywhere, bit it works in a lot of places,
> and it is a heck of a lot better than what is proposed here. I'd
> rather see the places that can use it be moved, and the few places
> that can't be opencoded.

Well, I used ptep_get_map_lock() and friends. But hacking directly into 
ptep_map_lock() and friends wasn't possible due to all the corner cases.

-- 
Thanks,

David / dhildenb


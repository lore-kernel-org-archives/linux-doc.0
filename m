Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7179C432BE
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 16:13:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E824610A8
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 16:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233985AbhIAQOX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Sep 2021 12:14:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45027 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231468AbhIAQOW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Sep 2021 12:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630512805;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jNQNf94w2B/KUb1e/ecylvdoWjqK4Psx9JHN1btjTDc=;
        b=jAqxGrNkwD9K8m9OvOox8e14nAYhINugnlpnypJSDIQUueC8kf3ev+sonzFGonowf92nLh
        Bt23WwymaM/vi4j6sG212QXpUtB3TuZxX9lqwLwDXraGuA8cyDMOPy4JZWGpoWcyyw6G80
        AZps+VtbF3VIouKdaZo/R+4eeLdbnqs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-KpYighUsNTiEi_RvxnY2og-1; Wed, 01 Sep 2021 12:13:24 -0400
X-MC-Unique: KpYighUsNTiEi_RvxnY2og-1
Received: by mail-wm1-f70.google.com with SMTP id f128-20020a1c3886000000b002e887c95e07so25198wma.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Sep 2021 09:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jNQNf94w2B/KUb1e/ecylvdoWjqK4Psx9JHN1btjTDc=;
        b=AFSZg52gnKt6Gwp89Ws2zgFiActjXfOO0JBvVUKjemWwgetb72rTSzAgbGY3EV5ESy
         /QgixWYQEn3e3roN6Mj4cEip17KWZ4ka1xwV8NOIf+Yv65RI6ScWYCCmW4w2X9nmGfbg
         9lo/74tajVo65eigMvCDxrwN1kJH9EKu59MwMgsFRBpugF9/Y5UJ0dKGTQQwtLBPPGNF
         ZmIaIJ9s44vEODwU5jhz5IBDkGn6WfpoS19yC2cMVtttpr6j+qPd1G4k+LddHgduT9+m
         5N2R0HYL3ZiVNIFlIcxGzub0hNs0nmzLnGLRB469zQvB+T23mQOJRoge9jXL5Rqpr4/2
         hazw==
X-Gm-Message-State: AOAM531oBHrkWwVWY5XTFQDiv/+elhDKx1TsKK7tBo8o5jHvEhy6hvup
        MdHHO7MiftxqeWu/HFbMHi1cd5q+b52HIKXZGgscj1Eg+wyOris0VHB2yN6gUgdMGNJqNy9gCqj
        ybPutMPX7QkTsjHCr2B8P
X-Received: by 2002:a05:600c:b4e:: with SMTP id k14mr251922wmr.139.1630512803550;
        Wed, 01 Sep 2021 09:13:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyO4LkyCGLZr018Y/LoACRfCBfu0mckb3LIj0CvAOTwgWxvrwipGnQx7hqOjzn46NjmwWENpw==
X-Received: by 2002:a05:600c:b4e:: with SMTP id k14mr251893wmr.139.1630512803372;
        Wed, 01 Sep 2021 09:13:23 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23f71.dip0.t-ipconnect.de. [79.242.63.113])
        by smtp.gmail.com with ESMTPSA id s205sm21756wme.4.2021.09.01.09.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 09:13:22 -0700 (PDT)
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
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 6/9] mm: free user PTE page table pages
Message-ID: <7789261d-6a64-c47b-be6c-c9be680e5d33@redhat.com>
Date:   Wed, 1 Sep 2021 18:13:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901153247.GJ1721383@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01.09.21 17:32, Jason Gunthorpe wrote:
> On Wed, Sep 01, 2021 at 03:57:09PM +0200, David Hildenbrand wrote:
>> On 01.09.21 15:53, Jason Gunthorpe wrote:
>>> On Thu, Aug 19, 2021 at 11:18:55AM +0800, Qi Zheng wrote:
>>>
>>>> diff --git a/mm/gup.c b/mm/gup.c
>>>> index 2630ed1bb4f4..30757f3b176c 100644
>>>> +++ b/mm/gup.c
>>>> @@ -500,6 +500,9 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>>>>    	if (unlikely(pmd_bad(*pmd)))
>>>>    		return no_page_table(vma, flags);
>>>> +	if (!pte_try_get(mm, pmd))
>>>> +		return no_page_table(vma, flags);
>>>> +
>>>>    	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
>>>
>>> This is not good on a performance path, the pte_try_get() is
>>> locking/locking the same lock that pte_offset_map_lock() is getting.
>>
>> Yes, and we really need patch #8, anything else is just confusing reviewers.
> 
> It is a bit better with patch 8, but it is still not optimal, we don't
> need to do the atomic work at all if the entire ptep is accessed while
> locked. So the above is stil not what I would expect here, even with
> RCU.
> 
> eg I would expect that this kind of change would work first with the
> existing paired acessors, ie
> 
> 	pte = pte_offset_map(pmd, address);
> 	pte_unmap(pte);
> 
> Should handle the refcount under the covers, and same kind of idea for
> the _locked/_unlocked varient.

See my other mail.

> 
> Only places that don't already use that pairing should get modified.
> 
> To do this we have to extend the API so that pte_offset_map() can
> fail, or very cleverly return some kind of global non-present pte page
> (I wonder if the zero page would work?)

I explored both ideas (returning NULL, return a specially prepared page) 
and it didn't work in some cases where we unmap+remap etc.

> 
>>> Also, I don't really understand how this scheme works with
>>> get_user_pages_fast.
>>
>> With the RCU change it in #8 it should work just fine, because RCU
>> synchronize has to wait either until all other CPUs have left the RCU read
>> section, or re-enabled interrupts.
> 
> So at this point in the series fast gup is broken, that does mean the
> series presentation really needs to be reworked. The better
> presentation is to add the API changes, with a
> no-functional-difference implementation, push the new API in well
> split patches to all the consumption sites, then change the API to
> have the new semantics.

Exactly my thoughts.

> 
> RCU and refcount to free the page levels seems like a reasonable
> approach, but I have to say I haven't thought it through fully - are
> all the contexts that have the pte deref safe to do call_rcu?


Very good question. I'd assume so.


-- 
Thanks,

David / dhildenb


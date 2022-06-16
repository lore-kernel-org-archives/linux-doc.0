Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0ECC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jun 2022 07:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359142AbiFPHVm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Jun 2022 03:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiFPHVl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 03:21:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 70D1C5C358
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 00:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655364099;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BmKGnuktFvztcVSafDwftRNZMdy1HHQkqyAtAvqCv2M=;
        b=ey4hXQOLOtvuKJwI420i3r3d8IGovESa+aitn74MkSxucY2gkiUMu0n5G5Hz3bFh2UzZZe
        dsVNaArbbhuNEXkaiR8FeEWbvBs7rmDP0pAXRHli0EFob+0+MBH5gcAN/G5/3TNHuq9/n5
        23HdyIcEz/s0s8+UZHngMYNB947NLIg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-ldyt9U_OMR2nvYAmiBFh9w-1; Thu, 16 Jun 2022 03:21:38 -0400
X-MC-Unique: ldyt9U_OMR2nvYAmiBFh9w-1
Received: by mail-wr1-f70.google.com with SMTP id s14-20020adfa28e000000b0020ac7532f08so60622wra.15
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 00:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=BmKGnuktFvztcVSafDwftRNZMdy1HHQkqyAtAvqCv2M=;
        b=m6n5mrAnHu8H3cM32SzUn/sz7i6FPiaPNNCbYXwq6yLJU5bxfObqSRAAb1zKvWs9b3
         jD8plzfw1a+3sMsvp4R7gXudTzZ1WS58YTkIk51aodAk41MeG+mDJrEDeeGp/TVUe5+X
         8Wd+LMMnVUpk2y1OULOzXvM+DIwBDHzg0oJSKAHdko95n+8IrjaSd6mmLjdNfQ33wki+
         /3GNhNc1Bgfovygnxme1GQa6VF1Rkhk/7eXbkNmz4MU0IJGzwo2ZwkYkEXNjtIMJh7ZP
         QaZUElKtr6SzqkHtWE0HrHyEh4p6zxr1L8WcN5XxR8Iig6w/skRt96dsCrrMxFEiK0Z2
         dGOw==
X-Gm-Message-State: AJIora/vS+OzXB+d7HrhIEN7bTf1VNLBpUeDN/325DJm4y5zJnR2YfEK
        MG9tf/7xrirDLD67qRS8MHEx5lYbWpvX8nbfBq3xqEGRpt+xud0kB+jTOpzb5UB4qaOEh/ZMBLo
        6yDT41lpT1lLKyKPLjwM5
X-Received: by 2002:a5d:584c:0:b0:218:4e98:770a with SMTP id i12-20020a5d584c000000b002184e98770amr3205376wrf.271.1655364096972;
        Thu, 16 Jun 2022 00:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sCHqyHd8fBXb2/1perTt3JC0gqX+eoIPsBJarFVdNDwHFuc2T2urts+Aswd2WJYMkghrY7ow==
X-Received: by 2002:a5d:584c:0:b0:218:4e98:770a with SMTP id i12-20020a5d584c000000b002184e98770amr3205359wrf.271.1655364096688;
        Thu, 16 Jun 2022 00:21:36 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:2d00:73d7:5fab:cc8a:e48c? (p200300cbc70b2d0073d75fabcc8ae48c.dip0.t-ipconnect.de. [2003:cb:c70b:2d00:73d7:5fab:cc8a:e48c])
        by smtp.gmail.com with ESMTPSA id t2-20020a1c4602000000b0039db60fa340sm4809654wma.33.2022.06.16.00.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 00:21:36 -0700 (PDT)
Message-ID: <abf6bd60-b944-100e-b327-97365d366ed8@redhat.com>
Date:   Thu, 16 Jun 2022 09:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/2] mm: memory_hotplug: introduce
 SECTION_CANNOT_OPTIMIZE_VMEMMAP
Content-Language: en-US
To:     Muchun Song <songmuchun@bytedance.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, paulmck@kernel.org,
        mike.kravetz@oracle.com, osalvador@suse.de,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com
References: <20220520025538.21144-1-songmuchun@bytedance.com>
 <20220520025538.21144-3-songmuchun@bytedance.com>
 <53024884-0182-df5f-9ca2-00652c64ce36@redhat.com>
 <YqqZOj+zby1fLGv/@FVFYT0MHHV2J.usts.net>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YqqZOj+zby1fLGv/@FVFYT0MHHV2J.usts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16.06.22 04:45, Muchun Song wrote:
> On Wed, Jun 15, 2022 at 11:51:49AM +0200, David Hildenbrand wrote:
>> On 20.05.22 04:55, Muchun Song wrote:
>>> For now, the feature of hugetlb_free_vmemmap is not compatible with the
>>> feature of memory_hotplug.memmap_on_memory, and hugetlb_free_vmemmap
>>> takes precedence over memory_hotplug.memmap_on_memory. However, someone
>>> wants to make memory_hotplug.memmap_on_memory takes precedence over
>>> hugetlb_free_vmemmap since memmap_on_memory makes it more likely to
>>> succeed memory hotplug in close-to-OOM situations.  So the decision
>>> of making hugetlb_free_vmemmap take precedence is not wise and elegant.
>>> The proper approach is to have hugetlb_vmemmap.c do the check whether
>>> the section which the HugeTLB pages belong to can be optimized.  If
>>> the section's vmemmap pages are allocated from the added memory block
>>> itself, hugetlb_free_vmemmap should refuse to optimize the vmemmap,
>>> otherwise, do the optimization.  Then both kernel parameters are
>>> compatible.  So this patch introduces SECTION_CANNOT_OPTIMIZE_VMEMMAP
>>> to indicate whether the section could be optimized.
>>>
>>
>> In theory, we have that information stored in the relevant memory block,
>> but I assume that lookup in the xarray + locking is impractical.
>>
>> I wonder if we can derive that information simply from the vmemmap pages
>> themselves, because *drumroll*
>>
>> For one vmemmap page (the first one), the vmemmap corresponds to itself
>> -- what?!
>>
>>
>> [	hotplugged memory	]
>> [ memmap ][      usable memory	]
>>       |    |                    |
>>   ^---     |                    |
>>    ^-------                     |
>>          ^----------------------
>>
>> The memmap of the first page of hotplugged memory falls onto itself.
>> We'd have to derive from actual "usable memory" that condition.
>>
>>
>> We currently support memmap_on_memory memory only within fixed-size
>> memory blocks. So "hotplugged memory" is guaranteed to be aligned to
>> memory_block_size_bytes() and the size is memory_block_size_bytes().
>>
>> If we'd have a page falling into usbale memory, we'd simply lookup the
>> first page and test if the vmemmap maps to itself.
>>
> 
> I think this can work. Should we use this approach in next version?
> 

Either that or more preferable, flagging the vmemmap pages eventually.
That's might be future proof.

>>
>> Of course, once we'd support variable-sized memory blocks, it would be
>> different.
>>
>>
>> An easier/future-proof approach might simply be flagging the vmemmap
>> pages as being special. We reuse page flags for that, which don't have
>> semantics yet (i.e., PG_reserved indicates a boot-time allocation via
>> memblock).
>>
> 
> I think you mean flag vmemmap pages' struct page as PG_reserved if it
> can be optimized, right? When the vmemmap pages are allocated in
> hugetlb_vmemmap_alloc(), is it valid to flag them as PG_reserved (they
> are allocated from buddy allocator not memblock)?
> 

Sorry I wasn't clear. I'd flag them with some other
not-yet-used-for-vmemmap-pages flag. Reusing PG_reserved could result in
trouble.


-- 
Thanks,

David / dhildenb


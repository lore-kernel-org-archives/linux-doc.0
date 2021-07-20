Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC6FC636C8
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jul 2021 07:28:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8E0C611C1
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jul 2021 07:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbhGTGsE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jul 2021 02:48:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30172 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230449AbhGTGr7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jul 2021 02:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626766117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kRtDACrxYPJ8ZPr9xqT886xL4OQGjMMieEXBqQ/h2Xw=;
        b=YaPBZo59oZauKqeKkNQLthPikM6MoBZkp8fKrXgVr1aQjljOYfZ6ubenOCT/ESoye56Qz+
        bMnUQmOwIrYuZR3nI/lowq8w1+IpYC7WK+qLmeoX6XY1Fsn7ESttm9BDGgVpYTrBU6H72H
        4/3RiD6idDTwO4/zGvtzYt7eSIlOWUo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-10UR0CMkMTW0irRHjmJ0kQ-1; Tue, 20 Jul 2021 03:28:34 -0400
X-MC-Unique: 10UR0CMkMTW0irRHjmJ0kQ-1
Received: by mail-wm1-f71.google.com with SMTP id c14-20020a05600c0aceb0290248831d46e4so486045wmr.6
        for <linux-doc@vger.kernel.org>; Tue, 20 Jul 2021 00:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kRtDACrxYPJ8ZPr9xqT886xL4OQGjMMieEXBqQ/h2Xw=;
        b=VytEs8kNnQjHQCHRrfShLpXahQ1OOk0a6XfThxbZprmoZiFoT5fDX9IpM/XeGCxJFb
         366zcCopM0GhBH5hGMcObVpvMeERt/pVRV/3VYy1qvMCG5VItxIS2jda5EI+9NmsRbv2
         NgGgiLGr4RO1LZg/J2UM2ff3TE/nYmPkY39zFKFLw5Eoox22b2ZTj+FQeBi+zdcfT4aj
         yRXbruESYafxDpTFcWqwRd536QTDgHZLMIBLxkcaQXKrlCb0/7bp5xePnOwX7ATIP2+r
         CQDYhCFy6ljf7bOezpA0S4glccVkL4m1qkQFyUSqpO58tBF+LzOftbHUxXzSQXD6cCQa
         thWg==
X-Gm-Message-State: AOAM531RPAdIpW/b+9YM4ekHdmRuFw+bjdmJNA04C9TM/B3qe44DvjS1
        6XCKlP2pX9WeGp4BklwLKHT5MZJ/hcdMvjIHt0aRRUaLG+yI/bx+vpHvZeHT15Uav6HV41LCtHW
        OIEvkZrjbywAETkeKETxqSCtQvXQHqyBGLNgojrOdKXAlwzAr5TI5/bBhJULTPTo7s1iO
X-Received: by 2002:a05:600c:430c:: with SMTP id p12mr36758973wme.16.1626766113325;
        Tue, 20 Jul 2021 00:28:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzMxJ6tkE66HwBF8toIqiHp2xtf7yK65y8S1dwets2ANEWlErBZCm5ceoCHkuw+2exOcaa8w==
X-Received: by 2002:a05:600c:430c:: with SMTP id p12mr36758942wme.16.1626766113065;
        Tue, 20 Jul 2021 00:28:33 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f? (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de. [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
        by smtp.gmail.com with ESMTPSA id o29sm17750919wms.13.2021.07.20.00.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 00:28:32 -0700 (PDT)
To:     Peter Collingbourne <pcc@google.com>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        Matthew Wilcox <willy@infradead.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Michal Hocko <mhocko@kernel.org>, Jann Horn <jannh@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        kernel test robot <lkp@intel.com>,
        Linux API <linux-api@vger.kernel.org>,
        linux-doc@vger.kernel.org
References: <20210619092002.1791322-1-pcc@google.com>
 <30e92457-d540-159c-4c4e-0b8f0d2a1838@redhat.com>
 <CAMn1gO529Ua1LJBM=vdwT8Cz+CXSvJcuGhuqotSuiUyjTBDfAQ@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4] mm: introduce reference pages
Message-ID: <0345cd7b-0196-1c67-6b6c-a5638a66171b@redhat.com>
Date:   Tue, 20 Jul 2021 09:28:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMn1gO529Ua1LJBM=vdwT8Cz+CXSvJcuGhuqotSuiUyjTBDfAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


>>> --- a/include/linux/gfp.h
>>> +++ b/include/linux/gfp.h
>>> @@ -55,8 +55,9 @@ struct vm_area_struct;
>>>    #define ___GFP_ACCOUNT              0x400000u
>>>    #define ___GFP_ZEROTAGS             0x800000u
>>>    #define ___GFP_SKIP_KASAN_POISON    0x1000000u
>>> +#define ___GFP_NOZERO                0x2000000u
>>
>> Oh god, please no. We've discussed this a couple of times already:
>> whatever leaves the page allcoator shall be zeroed. No exceptions, not
>> even for other allocators (like hugetlb).
>>
>> Introducing something like that to the whole system, including random
>> drivers, destroys the whole purpose of the security feature. Please
>> don't burry something so controversial in your patch.
> 
> Got it -- I was unaware that this was controversial.
> 
> Avoiding the double initialization does help a bit in benchmarks, at
> least for the fully faulted case. The alternative approach that I was
> thinking of was to somehow plumb the required pattern into the page
> allocator (which would maintain the invariant that the pages are
> initialized, but not necessarily with zeroes), but this would require
> touching several layers of the allocator.  I suppose that this doesn't
> need to be done immediately though -- we can deal with the double
> initialization for now and avoid it somehow in a followup.

As it's a clear optimization, it should definitely be separated from 
this "introduction" patch.

I agree that the logic for optimizing initialization of a page in this 
case should best reside in page_alloc.c, for example providing a helper 
for optimizing the initialization in there. We already pass alloc_flags 
internally, maybe we can then reuse that to minimize changes.

-- 
Thanks,

David / dhildenb


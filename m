Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE329C001B0
	for <linux-doc@archiver.kernel.org>; Thu, 10 Aug 2023 22:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbjHJWRo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Aug 2023 18:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjHJWRn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Aug 2023 18:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E342D41
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 15:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691705816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ExdQSgIsU8Qpzn8/coG+1H8VMTOqwdmuE5djP/V5DWM=;
        b=CS0hkXfV7vwL1+qeEg6YLEw9gc6zOEe+RKLLeGA4p2Z2a+Cv1NwuE6DJ7UapPfbpqXmzhq
        90wZUUmB8DTyAaS87IndRToY+FpNg/uI+K+rS/nioIvArtd8GdaDMj8ap/StDQemQrl6T1
        7TrTrzRnIyGhXDNh2wN5Egr3Q3RZWf8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-I4OaSVH6Nx2ulWrbVK6cIg-1; Thu, 10 Aug 2023 18:16:55 -0400
X-MC-Unique: I4OaSVH6Nx2ulWrbVK6cIg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3176ace3f58so890502f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 15:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691705814; x=1692310614;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExdQSgIsU8Qpzn8/coG+1H8VMTOqwdmuE5djP/V5DWM=;
        b=Q3YaZRU6eF60OaDif7gmf2YAiKodY8XrTvxaoop7nESHtO0lsh38XvhK/OJngYDy5T
         fWrtsrFc2nfWgwrZ3NPwl08ArEYUlhv+kp/Bg7+xbfnm+DLf4tOiI2QRkKMhUhbBNLVj
         pLPQpqlpMbCQEQQMS4uJcbqbXOuCNUZVJ8QaqBnuzkj/tzu5rbw4X8hcJRuaAne/7alA
         3W0jjQ8Kurs5wQrCmp00L/IyU+1e7nBThnOEGv+LuFyCbfigMjl1q8Z50xlTHCzpyCLB
         3nAH66UsXek9mIJIwIit09BCNcaqdi7pW250fyOm/wFau8q3rGA7I7X2+Gk0imGjSb8F
         DY4A==
X-Gm-Message-State: AOJu0YwloEYbn1jR/Q7Sok0WFoMc6M8tF1QMSz/hLPnmdEUKZGLWGUO3
        nPm6sVyavon4IjB6oIb1rmsB1D+mcLbGUHC7Rs+5M4sWrfoL/NVoPC6nxCKnwF84iSvQ6QbrZgh
        Yb5wO2lpHgcly9Mio+Vvc
X-Received: by 2002:a5d:6787:0:b0:313:fbd0:9810 with SMTP id v7-20020a5d6787000000b00313fbd09810mr2628786wru.4.1691705813861;
        Thu, 10 Aug 2023 15:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtLfNPGRKQt+xEbb3eLq+Srig0g08UmptGpsx6FqAE53yp4YBydO8+CdRSSlBgc3OvAUBYww==
X-Received: by 2002:a5d:6787:0:b0:313:fbd0:9810 with SMTP id v7-20020a5d6787000000b00313fbd09810mr2628772wru.4.1691705813490;
        Thu, 10 Aug 2023 15:16:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71a:8a00:8200:f041:4b87:a8be? (p200300cbc71a8a008200f0414b87a8be.dip0.t-ipconnect.de. [2003:cb:c71a:8a00:8200:f041:4b87:a8be])
        by smtp.gmail.com with ESMTPSA id j2-20020adfff82000000b003195504c754sm1657171wrr.31.2023.08.10.15.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 15:16:53 -0700 (PDT)
Message-ID: <0ec6c371-c183-a8aa-614b-a23abbf3b233@redhat.com>
Date:   Fri, 11 Aug 2023 00:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Peter Xu <peterx@redhat.com>
Cc:     Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
References: <20230809083256.699513-1-david@redhat.com> <ZNQD4pxo8svpGmvX@x1n>
 <e5e29217-11d3-a84b-9e29-44acc72222f3@redhat.com>
 <155bd03e-b75c-4d2d-a89d-a12271ada71b@arm.com> <ZNUbNDiciFefJngZ@x1n>
 <db3c4d94-a0a9-6703-6fe0-e1b8851e531f@redhat.com> <ZNVPJ9xxd2oarR3I@x1n>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
In-Reply-To: <ZNVPJ9xxd2oarR3I@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>> Okay, so your speculation right now is:
>>
>> 1) The change in cacheline might be problematic.
>>
>> 2) The additional atomic operation might be problematic.
>>
>>> then measure the split (by e.g. mprotect() at offset 1M on a 4K?) time it
>>> takes before/after this patch.
>>
>> I can certainly try getting some numbers on that. If you're aware of other
>> micro-benchmarks that would likely notice slower pte-mapping of THPs, please
>> let me know.
> 
> Thanks.

If I effectively only measure the real PTE->PMD remapping (only measure 
the for loop that mprotects() one 4k page inside each of 512 THPs ) 
without any of the mmap+populate+munmap, I can certainly measure a real 
difference.

I briefly looked at some perf data across the overall benchmark runtime.

For page_remove_rmap(), the new atomic_dec() doesn't seem to be 
significant. Data indicates that it's significantly less relevant than a 
later atomic_add_negative().

For page_add_anon_rmap(), it's a bit fuzzy. Definitely, the 
atomic_inc_return_relaxed(mapped) seems to stick out, but I cannot rule 
out that the atomic_add() also plays a role.


The PTE->PMD remapping effectively does (__split_huge_pmd_locked())

for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
	...
	page_add_anon_rmap(page + i, vma, addr, RMAP_NONE);
	...
}
...
page_remove_rmap(page, vma, true);


Inside that loop we're repeatedly accessing the total_mapcount and 
_nr_pages_mapped. So my best guess would have been that both are already 
hot in the cache.

RMAP batching certainly sounds like a good idea for 
__split_huge_pmd_locked(), independent of this patch.


What would probably also interesting is observing happens when we unmap 
a single PTE of a THP and we cannot batch, to see if the 
page_remove_rmap() matters in the bigger scale.

I'll do some more digging tomorrow to clarify some details. Running some 
kernel compile tests with thp=always at least didn't reveal any 
surprises so far.

-- 
Cheers,

David / dhildenb


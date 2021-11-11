Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3933CC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 11 Nov 2021 13:01:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17F72611C9
	for <linux-doc@archiver.kernel.org>; Thu, 11 Nov 2021 13:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbhKKNEj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Nov 2021 08:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbhKKNEi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Nov 2021 08:04:38 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8D9C061766
        for <linux-doc@vger.kernel.org>; Thu, 11 Nov 2021 05:01:49 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id y5so5556675pfb.4
        for <linux-doc@vger.kernel.org>; Thu, 11 Nov 2021 05:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=bps4ioSjssDqexG7TCttpX6rWJKGqfhYrDDqLvwy90M=;
        b=TI+5R/rLqjNZN86oVUGfTx/pCWAFM/BoHTQEt4z5bzQdTqWJM7q1nsPjpdvvnoajFq
         1kAOPpuH3oS8/kLCZox//UbMPT42abP70DWyUIzCp6ARREB1TDcA2k15YhtqC34cBt0c
         h0YkAhBHCwExL5BVHAKkE/hUIRI+qo3rhKRjyXbBkYkwKU3hovOBBb/hyv/fcv/zg08N
         Ym2RTO8vPeTzXQyuHhoZyM5rCWGw8UI8pK96Jdcnb86RHOBHZxrvqK5V+FcygAAzDBa+
         WZFHnSjYSx25UoZa5x2otp6pDbBhzidm/vFNhx/b8qQauht/Bn00wx0ocd2hlbH4VaQq
         Toyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bps4ioSjssDqexG7TCttpX6rWJKGqfhYrDDqLvwy90M=;
        b=6pJK5Rh4+GFJVaZwSoQc2dbGyxcEmjSpygBLFhXNM06UfqRsEgQsc6OoPUoFyG4B6O
         5NyxUM+46rI74/A/5tSWAOEjS/S/VWHPjpzwcwDjPtw9XxKnG1el1w2NfSwaC0idVKFI
         Td92UVKrZJ+NjXvSrH/9+1dmNSY/cPenzGFAidZeQeuXYYfdUlNXpUf0sH89RKi1yz/o
         DwU53KlCgtqmmxC7xhL8G0jgY0JOXwkY2VbBP/hVB7I3onPNIVzwB8h9PgoP2vac+DLa
         VCakHPayqNqEgAg2hek7x2Z9Gobf2U155S7LGEtuzxBhVJdKqwteafMCX/1lImhMMdp2
         UZAQ==
X-Gm-Message-State: AOAM533U2NSECE4pS7akUNMWTRXlURcOHRW0GppQsDHbmkCiKoJc39P5
        RW97GSUgedREZjWLXTFk6j1BPA==
X-Google-Smtp-Source: ABdhPJxkJ/QhSqPEiOZwSY+bDiTl+pmqtTYDvWS9ljzUpvQfkCP/5UixXtVDUn0gjMXzYyF+SWYcFg==
X-Received: by 2002:a63:7c0d:: with SMTP id x13mr4419686pgc.410.1636635709355;
        Thu, 11 Nov 2021 05:01:49 -0800 (PST)
Received: from [10.254.173.217] ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id y18sm3908650pfa.142.2021.11.11.05.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 05:01:48 -0800 (PST)
Message-ID: <acd69270-bd2b-dd84-d3b2-05ed91e99bf6@bytedance.com>
Date:   Thu, 11 Nov 2021 21:01:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v3 00/15] Free user PTE page table pages
To:     David Hildenbrand <david@redhat.com>,
        Jason Gunthorpe <jgg@nvidia.com>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com
References: <20211110105428.32458-1-zhengqi.arch@bytedance.com>
 <20211110125601.GQ1740502@nvidia.com>
 <8d0bc258-58ba-52c5-2e0d-a588489f2572@redhat.com>
 <20211110143859.GS1740502@nvidia.com>
 <6ac9cc0d-7dea-0e19-51b3-625ec6561ac7@redhat.com>
 <20211110163925.GX1740502@nvidia.com>
 <7c97d86f-57f4-f764-3e92-1660690a0f24@redhat.com>
 <60515562-5f93-11cd-6c6a-c7cc92ff3bf8@bytedance.com>
 <a052e0ba-a22c-5df1-80b8-d847efacd66e@redhat.com>
 <9ee06b52-4844-7996-fa34-34fc7d4fdc10@bytedance.com>
 <27d73395-70b4-fe4a-4c8d-415b43ff9c1f@redhat.com>
 <2e19ad1b-15f3-7508-c5d5-6c31765f26d3@bytedance.com>
 <1489f02f-d024-b9ec-2ab6-e6efc8a022f1@redhat.com>
 <791ddf94-5ad1-b431-85a1-db9a07579057@bytedance.com>
 <2ffa76f5-ca39-2044-61fa-5398faf16a6c@redhat.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <2ffa76f5-ca39-2044-61fa-5398faf16a6c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 11/11/21 8:51 PM, David Hildenbrand wrote:

>>>>
>>>> In the performance test shown on the cover, we repeatedly performed
>>>> touch and madvise(MADV_DONTNEED) actions, which simulated the case
>>>> you said above.
>>>>
>>>> We did find a small amount of performance regression, but I think it is
>>>> acceptable, and no new perf hotspots have been added.
>>>
>>> That test always accesses 2MiB and does it from a single thread. Things
>>> might (IMHO will) look different when only accessing individual pages
>>> and doing the access from one/multiple separate threads (that's what
>>
>> No, it includes multi-threading:
>>
> 
> Oh sorry, I totally skipped [2].
> 
>> 	while (1) {
>> 		char *c;
>> 		char *start = mmap_area[cpu];
>> 		char *end = mmap_area[cpu] + FAULT_LENGTH;
>> 		pthread_barrier_wait(&barrier);
>> 		//printf("fault into %p-%p\n",start, end);
>>
>> 		for (c = start; c < end; c += PAGE_SIZE)
>> 			*c = 0;
>>
>> 		pthread_barrier_wait(&barrier);
>> 		for (i = 0; cpu==0 && i < num; i++)
>> 			madvise(mmap_area[i], FAULT_LENGTH, MADV_DONTNEED);
>> 		pthread_barrier_wait(&barrier);
>> 	}
>>
>> Thread on cpu0 will use madvise(MADV_DONTNEED) to release the physical
>> memory of threads on other cpu.
>>
> 
> I'll have a more detailed look at the benchmark. On a quick glimpse,

Thank you for your time :)

> looks like the threads are also accessing a full 2MiB range, one page at
> a time, and one thread is zapping the whole 2MiB range. A single CPU
> only accesses memory within one 2MiB range IIRC.
> 
> Having multiple threads just access individual pages within a single 2
> MiB region, and having one thread zap that memory (e.g., simulate
> swapout) could be another benchmark.

LGTM, I will simulate more scenarios for testing.

> 
> We have to make sure to run with THP disabled (e.g., using
> madvise(MADV_NOHUGEPAGE) on the complete mapping in the benchmark
> eventually), because otherwise you might just be populating+zapping THPs
> if they would otherwise be allowed in the environment.

Yes, I turned off THP during testing:

root@~$ cat /sys/kernel/mm/transparent_hugepage/enabled
always madvise [never]

> 

-- 
Thanks,
Qi

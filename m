Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3EBC4320A
	for <linux-doc@archiver.kernel.org>; Thu,  2 Sep 2021 03:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F876610C9
	for <linux-doc@archiver.kernel.org>; Thu,  2 Sep 2021 03:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242407AbhIBDi4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Sep 2021 23:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242235AbhIBDiy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Sep 2021 23:38:54 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8374C061757
        for <linux-doc@vger.kernel.org>; Wed,  1 Sep 2021 20:37:56 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id bg1so323415plb.13
        for <linux-doc@vger.kernel.org>; Wed, 01 Sep 2021 20:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=LMC0ZY88gAL6RTkv4xL+oZp7+cMqJy7aqBDRcgQaHno=;
        b=DIhUPQjEdjNap6fD8xJWky1waFmqa2pCnSzkt7GAV4CHm/Sw0eRIibRXuZETtBYLaf
         3dLjOmCHuCMVNYaai75i/gsqR0cOGfi0sS+B0qhvRZkyMQCIHey3F2O1b58whifEM3H7
         BK4hK6SDPI92ly3Sub5ykDTN972hevgr8S5TKjDOhe9Lj4mZFv+UsRNkQlUsam/xmk9H
         QGBG5EpTU12SM6/qYw2fC+n9aJG9KPysSo7zXFykgNjIkFufvBI3rufxPVBHXFqoux9v
         0EilelqJVkFt/lzhcdnZe6wlDyV9MXP3HcdibQ5DpARN2M6kP3/CzKMREzkT6CziOOuw
         +u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=LMC0ZY88gAL6RTkv4xL+oZp7+cMqJy7aqBDRcgQaHno=;
        b=UZ2WtOGqp5eUvy0aG5K/tx0u0qJHX6IO8hHeUwHKJlbODjwyXN44YPID5rgoGK4myL
         /V4c+JgYP2iCyG44o3qA2lMAlSvmmL9qtmmOXxHaoTruAqAppyYR4ScKaTLpjzFu6F1v
         yXfSi5GbUj4vC7iy4kjs0FxVCbXlGnCRJuN/iMbNPSkFHfrPUN/VpI9OKWNioKfUwyPs
         zPJ9CnZ9XRHmYURt2if5m6xEiVS6nvkZJE4UegOWoUkO5erFC106WsGcr2Ckhfm0mGU5
         kO3vUBxww5vJOljjq0uJZs0Biw8nLayzx8PbvD1veVGAL28R1Ax8CEnC2N3key0J8td+
         F5FQ==
X-Gm-Message-State: AOAM532IrQCz+S4uVVX0a4zYAZWRSm7jbcu2uNhs/AKgVH0+o5NfrldF
        wL8ZJPWHWBDFJv4F/W+xsUJvxA==
X-Google-Smtp-Source: ABdhPJxxY/aETUb7Ba4h6KkazHoICL5lr6pUJsdxkGcVy3wpIwkqPRoNlC+zjR6yU0QsBg+r9vdikA==
X-Received: by 2002:a17:902:684d:b0:138:7bed:7471 with SMTP id f13-20020a170902684d00b001387bed7471mr967257pln.68.1630553876253;
        Wed, 01 Sep 2021 20:37:56 -0700 (PDT)
Received: from [10.254.207.253] ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id 10sm361917pjc.41.2021.09.01.20.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 20:37:55 -0700 (PDT)
Subject: Re: [PATCH v2 0/9] Free user PTE page table pages
To:     David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com, jgg@ziepe.ca
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <5b9348fc-95fe-5be2-e9df-7c906e0c9b81@redhat.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <1a6afa69-a955-9da7-1ff8-818bfcc7131e@bytedance.com>
Date:   Thu, 2 Sep 2021 11:37:49 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5b9348fc-95fe-5be2-e9df-7c906e0c9b81@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/9/1 PM8:32, David Hildenbrand wrote:
> On 19.08.21 05:18, Qi Zheng wrote:
>> Hi,
>>
>> This patch series aims to free user PTE page table pages when all PTE 
>> entries
>> are empty.
>>
>> The beginning of this story is that some malloc libraries(e.g. 
>> jemalloc or
>> tcmalloc) usually allocate the amount of VAs by mmap() and do not 
>> unmap those VAs.
>> They will use madvise(MADV_DONTNEED) to free physical memory if they 
>> want.
>> But the page tables do not be freed by madvise(), so it can produce many
>> page tables when the process touches an enormous virtual address space.
>>
>> The following figures are a memory usage snapshot of one process which 
>> actually
>> happened on our server:
>>
>>     VIRT:  55t
>>     RES:   590g
>>     VmPTE: 110g
>>
>> As we can see, the PTE page tables size is 110g, while the RES is 
>> 590g. In
>> theory, the process only need 1.2g PTE page tables to map those physical
>> memory. The reason why PTE page tables occupy a lot of memory is that
>> madvise(MADV_DONTNEED) only empty the PTE and free physical memory but
>> doesn't free the PTE page table pages. So we can free those empty PTE 
>> page
>> tables to save memory. In the above cases, we can save memory about 
>> 108g(best
>> case). And the larger the difference between the size of VIRT and RES, 
>> the
>> more memory we save.
>>
>> In this patch series, we add a pte_refcount field to the struct page 
>> of page
>> table to track how many users of PTE page table. Similar to the 
>> mechanism of
>> page refcount, the user of PTE page table should hold a refcount to it 
>> before
>> accessing. The PTE page table page will be freed when the last 
>> refcount is
>> dropped.
>>
>> Testing:
>>
>> The following code snippet can show the effect of optimization:
>>
>>     mmap 50G
>>     while (1) {
>>         for (; i < 1024 * 25; i++) {
>>             touch 2M memory
>>             madvise MADV_DONTNEED 2M
>>         }
>>     }
>>
>> As we can see, the memory usage of VmPTE is reduced:
>>
>>             before                        after
>> VIRT               50.0 GB                  50.0 GB
>> RES                3.1 MB                   3.6 MB
>> VmPTE             102640 kB                   248 kB
>>
>> I also have tested the stability by LTP[1] for several weeks. I have 
>> not seen
>> any crash so far.
>>
>> The performance of page fault can be affected because of the 
>> allocation/freeing
>> of PTE page table pages. The following is the test result by using a 
>> micro
>> benchmark[2]:
>>
>> root@~# perf stat -e page-faults --repeat 5 ./multi-fault $threads:
>>
>> threads         before (pf/min)                     after (pf/min)
>>      1                32,085,255                         31,880,833 
>> (-0.64%)
>>      8               101,674,967                        100,588,311 
>> (-1.17%)
>>     16               113,207,000                        112,801,832 
>> (-0.36%)
>>
>> (The "pfn/min" means how many page faults in one minute.)
>>
>> The performance of page fault is ~1% slower than before.
>>
>> This series is based on next-20210812.
>>
>> Comments and suggestions are welcome.
>>
>> Thanks,
>> Qi.
>>
> 
> 
> Some high-level feedback after studying the code:
> 
> 1. Try introducing the new dummy primitives ("API") first, and then 
> convert each subsystem individually; especially, maybe convert the whole 
> pagefault handling in a single patch, because it's far from trivial. 
> This will make this series much easier to digest.
> 
> Then, have a patch that adds actual logic to the dummy primitives via a 
> config option.
> 
> 2. Minimize the API.
> 
> a) pte_alloc_get{,_map,_map_lock}() is really ugly. Maybe restrict it to 
> pte_alloc_get().
> 
> b) pmd_trans_unstable_or_pte_try_get() and friends are really ugly.
> 
> Handle it independently for now, even if it implies duplicate runtime 
> checks.
> 
> if (pmd_trans_unstable() || !pte_try_get()) ...
> 
> We can always optimize later, once we can come up with something cleaner.
> 
> 3. Merge #6, and #7, after factoring out all changes to other subsystems 
> to use the API
> 
> 4. Merge #8 into #6. There is a lot of unnecessary code churn back and 
> forth, and IMHO the whole approach might not make sense without RCU due 
> to the additional locking overhead.
> 
> Or at least, try to not modify the API you introduced in patch #6 or #7 
> in #8 again. Converting all call sites back and forth just makes review 
> quite hard.
> 

Very detailed feedback! Thank you very much for your time and energy,
I will seriously adopt and implement these modification suggestions.

> 
> I am preparing some some cleanups that will make get_locked_pte() and 
> similar a little nicer to handle. I'll send them out this or next week.
> 

Yup, we just simply convert the pte_alloc_map_lock() in
__get_locked_pte() to pte_alloc_get_map_lock(), and then
call the paired pte_put() in the caller of get_locked_pte().
Like the following pattern:

	insert_page
	--> get_locked_pte
	    --> __get_locked_pte
		--> pte_alloc_get_map_lock

	    "do some things"

	    pte_put

This is really ugly and hard to review.

I look forward to your cleanups, besides, can you outline your approach?

Thanks again,
Qi

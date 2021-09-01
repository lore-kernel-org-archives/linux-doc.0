Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E2DC43216
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 12:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62293610E6
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 12:33:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244906AbhIAMew (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Sep 2021 08:34:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40991 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245726AbhIAMdJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Sep 2021 08:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630499532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6Dbvlu5ZSAjtRqG1EufqlUFTIvkyoUz8z7Cc+P05CuE=;
        b=DfwZjh2lGxeQQaF7DKVtU05jIxIl9veN/drFt8hmQzbhDWEoP/WKVIga9VKIVHrppREiE+
        ktoEBGSw+ocWto/vNd7djrM49k3tSTm+D9h5Klt6h9nkyxWcBXfzDCd+a+1NwF6hUB8LJA
        BB/GOJ98ZA9Hvgae11islIRcHkUPtDE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-0Z5vT9p4ONSSpmY1pJk8pg-1; Wed, 01 Sep 2021 08:32:11 -0400
X-MC-Unique: 0Z5vT9p4ONSSpmY1pJk8pg-1
Received: by mail-wr1-f72.google.com with SMTP id q14-20020a5d574e000000b00157b0978ddeso739287wrw.5
        for <linux-doc@vger.kernel.org>; Wed, 01 Sep 2021 05:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6Dbvlu5ZSAjtRqG1EufqlUFTIvkyoUz8z7Cc+P05CuE=;
        b=btO4tm3hCtQMuQumEzWxQz4IwTDkjMohefF/Vqc+c2I8Verte1iHf+pLK9Ct2ZIKcG
         mf9mgjEKfsnUrlDrMTKijoBMR/9Op8xHixw7lodwm3FjCvtcL2hiJQVeMDZZda2La26s
         hLs996aLfq2S27PxLxrR9bHseIhOZ1GZRnzXfVdjJw+t/FcUkaASAFqFfRCV8DshVCmV
         +JnO1qeK0SVSuOxXSlaD7XLZ60papwR3p9y4g5ixLIFf2ePNCmvdMOSiY8CqSNODUnic
         BNyPUDAzmAsXcDgQ9bFIbQeSYmoLPc88hD2BZdeHeSN9VCQjvuLNVAyeKn5hU/slduZi
         yXmA==
X-Gm-Message-State: AOAM530+NJdenQFChdfOfmv6CRsfvkpkwPwqT02PtEvKz5phHpRIg7t3
        ywDs+09BCZhiUsp028mxxv195+WQwEIwZJZuasG+wLg0fTr0kmHYh8D49F03vwGu6XTAF+vaeuS
        fepVwz0Viq7lvRRnF1V8c
X-Received: by 2002:adf:d239:: with SMTP id k25mr9857046wrh.314.1630499530022;
        Wed, 01 Sep 2021 05:32:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgQ3pleHAmLNS3ldiuaJSpYI6aLKAmT2AqtxZ6KQPbyagrUETSbVHG4/qEex808Z3/iRij4A==
X-Received: by 2002:adf:d239:: with SMTP id k25mr9857023wrh.314.1630499529802;
        Wed, 01 Sep 2021 05:32:09 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23f71.dip0.t-ipconnect.de. [79.242.63.113])
        by smtp.gmail.com with ESMTPSA id l15sm4846090wms.38.2021.09.01.05.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 05:32:09 -0700 (PDT)
To:     Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 0/9] Free user PTE page table pages
Message-ID: <5b9348fc-95fe-5be2-e9df-7c906e0c9b81@redhat.com>
Date:   Wed, 1 Sep 2021 14:32:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.08.21 05:18, Qi Zheng wrote:
> Hi,
> 
> This patch series aims to free user PTE page table pages when all PTE entries
> are empty.
> 
> The beginning of this story is that some malloc libraries(e.g. jemalloc or
> tcmalloc) usually allocate the amount of VAs by mmap() and do not unmap those VAs.
> They will use madvise(MADV_DONTNEED) to free physical memory if they want.
> But the page tables do not be freed by madvise(), so it can produce many
> page tables when the process touches an enormous virtual address space.
> 
> The following figures are a memory usage snapshot of one process which actually
> happened on our server:
> 
> 	VIRT:  55t
> 	RES:   590g
> 	VmPTE: 110g
> 
> As we can see, the PTE page tables size is 110g, while the RES is 590g. In
> theory, the process only need 1.2g PTE page tables to map those physical
> memory. The reason why PTE page tables occupy a lot of memory is that
> madvise(MADV_DONTNEED) only empty the PTE and free physical memory but
> doesn't free the PTE page table pages. So we can free those empty PTE page
> tables to save memory. In the above cases, we can save memory about 108g(best
> case). And the larger the difference between the size of VIRT and RES, the
> more memory we save.
> 
> In this patch series, we add a pte_refcount field to the struct page of page
> table to track how many users of PTE page table. Similar to the mechanism of
> page refcount, the user of PTE page table should hold a refcount to it before
> accessing. The PTE page table page will be freed when the last refcount is
> dropped.
> 
> Testing:
> 
> The following code snippet can show the effect of optimization:
> 
> 	mmap 50G
> 	while (1) {
> 		for (; i < 1024 * 25; i++) {
> 			touch 2M memory
> 			madvise MADV_DONTNEED 2M
> 		}
> 	}
> 
> As we can see, the memory usage of VmPTE is reduced:
> 
> 			before		                after
> VIRT		       50.0 GB			      50.0 GB
> RES		        3.1 MB			       3.6 MB
> VmPTE		     102640 kB			       248 kB
> 
> I also have tested the stability by LTP[1] for several weeks. I have not seen
> any crash so far.
> 
> The performance of page fault can be affected because of the allocation/freeing
> of PTE page table pages. The following is the test result by using a micro
> benchmark[2]:
> 
> root@~# perf stat -e page-faults --repeat 5 ./multi-fault $threads:
> 
> threads         before (pf/min)                     after (pf/min)
>      1                32,085,255                         31,880,833 (-0.64%)
>      8               101,674,967                        100,588,311 (-1.17%)
>     16               113,207,000                        112,801,832 (-0.36%)
> 
> (The "pfn/min" means how many page faults in one minute.)
> 
> The performance of page fault is ~1% slower than before.
> 
> This series is based on next-20210812.
> 
> Comments and suggestions are welcome.
> 
> Thanks,
> Qi.
> 


Some high-level feedback after studying the code:

1. Try introducing the new dummy primitives ("API") first, and then 
convert each subsystem individually; especially, maybe convert the whole 
pagefault handling in a single patch, because it's far from trivial. 
This will make this series much easier to digest.

Then, have a patch that adds actual logic to the dummy primitives via a 
config option.

2. Minimize the API.

a) pte_alloc_get{,_map,_map_lock}() is really ugly. Maybe restrict it to 
pte_alloc_get().

b) pmd_trans_unstable_or_pte_try_get() and friends are really ugly.

Handle it independently for now, even if it implies duplicate runtime 
checks.

if (pmd_trans_unstable() || !pte_try_get()) ...

We can always optimize later, once we can come up with something cleaner.

3. Merge #6, and #7, after factoring out all changes to other subsystems 
to use the API

4. Merge #8 into #6. There is a lot of unnecessary code churn back and 
forth, and IMHO the whole approach might not make sense without RCU due 
to the additional locking overhead.

Or at least, try to not modify the API you introduced in patch #6 or #7 
in #8 again. Converting all call sites back and forth just makes review 
quite hard.


I am preparing some some cleanups that will make get_locked_pte() and 
similar a little nicer to handle. I'll send them out this or next week.

-- 
Thanks,

David / dhildenb


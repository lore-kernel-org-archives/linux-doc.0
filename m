Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45836C432BE
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 12:52:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24F7D61041
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 12:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbhHaMxr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Aug 2021 08:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbhHaMxq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Aug 2021 08:53:46 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6373C061575
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 05:52:51 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so1924990pjr.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 05:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=WabTdj9An5z5ILEGVeAkv4WhYJoKZFzGY2Bi+4jqu40=;
        b=QtbFCBQwB7vEOOjsNeuQm4+4/dYAfMe3yCq4qGgDMPEP2HtgL0c0UNl/2IPOdesOwR
         HDN5aoeyLSKvd+pOu/bNSqj8hw6KjAf4fMtcvarHbALjsd0qhaiAcfKjFl/s6XmzbDuw
         vLl3jBaDIzoMLuMw5BwFwqtLcpVMUyTzUszMSRvVcSFXLn4/4JEu/EVetR9Z6cTOAjY5
         cdOVD9RO944Bt20RgMPPgjxMYbMVnck3LxIogxCXaDIWuG4hPo5ECGXyanqvTrD7gEgS
         X9pMjDGgKSHs87IlIUdATLZY0ETAiGXiePf2ln3VFdMx1NnXGtSG8wHIgXcvGnketO+E
         hRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=WabTdj9An5z5ILEGVeAkv4WhYJoKZFzGY2Bi+4jqu40=;
        b=qZCohsZFXZpYPQ6uABvKNw4itWWrHHYOvRZPvNTrVLUeMZc3b7pJkPKKDakUjSnd2k
         7X3ioOggWE3eesmfRAbx9f26X44BqxqF/dLwkBM4q3numjTZDH1JsqBgp0KoDff57+Wr
         fKcRKGp03y5YkMnrRyuDqRzQytpSoBniDrFZ2VgA5YQ+B/Be6fwBUJJCSIFiSyDIQNI5
         pseoW7yi5vG9MO8zVXlqslafsga7pI2X3ldeQiEeMla8L5ESDmT7lkxZxYE0U72XqXAW
         VjJldSw+CoZ3Tuh3tgVIlyfgCIwvkBPGemNFE+RimVJQ5lNve0fZDxl6nBZcizxGgeSq
         dnnw==
X-Gm-Message-State: AOAM533xI8HZE5hGECMiLS41rxshVGIGqtBv7P6ObNHaqAMukiEC6KBf
        UUBbeA++GnaeziNbbvy3wk7nZA==
X-Google-Smtp-Source: ABdhPJzUHSDAap4VmW6faAIG74gQrS2lCsqGRTOMEhdKrHauFD9+QCaCpWYcdIqu3MWTwEcslg6jEA==
X-Received: by 2002:a17:902:c643:b0:138:b603:f944 with SMTP id s3-20020a170902c64300b00138b603f944mr4593654pls.45.1630414371312;
        Tue, 31 Aug 2021 05:52:51 -0700 (PDT)
Received: from [10.254.46.235] ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id s29sm20965758pgl.38.2021.08.31.05.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:52:50 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] mm: remove redundant smp_wmb()
To:     Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210828042306.42886-1-zhengqi.arch@bytedance.com>
 <20210828042306.42886-3-zhengqi.arch@bytedance.com>
 <17a36dfc-cbd1-56c5-46a9-9f4043bb56e6@suse.cz>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <766d0039-02c9-4511-6421-9d2ccfd0cfb2@bytedance.com>
Date:   Tue, 31 Aug 2021 20:52:42 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <17a36dfc-cbd1-56c5-46a9-9f4043bb56e6@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/8/31 PM6:20, Vlastimil Babka wrote:
> On 8/28/21 06:23, Qi Zheng wrote:
>> The smp_wmb() which is in the __pte_alloc() is used to
>> ensure all ptes setup is visible before the pte is made
>> visible to other CPUs by being put into page tables. We
>> only need this when the pte is actually populated, so
>> move it to pte_install(). __pte_alloc_kernel(),
> 
> It's named pmd_install()?

Yes, I will update it in the next version.

> 
>> __p4d_alloc(), __pud_alloc() and __pmd_alloc() are similar
>> to this case.
>>
>> We can also defer smp_wmb() to the place where the pmd entry
>> is really populated by preallocated pte. There are two kinds
>> of user of preallocated pte, one is filemap & finish_fault(),
>> another is THP. The former does not need another smp_wmb()
>> because the smp_wmb() has been done by pte_install().
> 
> Same here.
> 
>> Fortunately, the latter also does not need another smp_wmb()
>> because there is already a smp_wmb() before populating the
>> new pte when the THP uses a preallocated pte to split a huge
>> pmd.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>>   mm/memory.c         | 47 ++++++++++++++++++++---------------------------
>>   mm/sparse-vmemmap.c |  2 +-
>>   2 files changed, 21 insertions(+), 28 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index ef7b1762e996..9c7534187454 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -439,6 +439,20 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
>>   
>>   	if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
>>   		mm_inc_nr_ptes(mm);
>> +		/*
>> +		 * Ensure all pte setup (eg. pte page lock and page clearing) are
>> +		 * visible before the pte is made visible to other CPUs by being
>> +		 * put into page tables.
>> +		 *
>> +		 * The other side of the story is the pointer chasing in the page
>> +		 * table walking code (when walking the page table without locking;
>> +		 * ie. most of the time). Fortunately, these data accesses consist
>> +		 * of a chain of data-dependent loads, meaning most CPUs (alpha
>> +		 * being the notable exception) will already guarantee loads are
>> +		 * seen in-order. See the alpha page table accessors for the
>> +		 * smp_rmb() barriers in page table walking code.
>> +		 */
>> +		smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
> 
> So, could it? :)
> 

Yes, it could, but we don't have smp_wmb__after_spin_lock() now.



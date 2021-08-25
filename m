Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5024C4320A
	for <linux-doc@archiver.kernel.org>; Wed, 25 Aug 2021 16:21:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDD69610E5
	for <linux-doc@archiver.kernel.org>; Wed, 25 Aug 2021 16:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241399AbhHYQV6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Aug 2021 12:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241637AbhHYQVu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Aug 2021 12:21:50 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99686C0611C2
        for <linux-doc@vger.kernel.org>; Wed, 25 Aug 2021 09:20:38 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id q68so195655pga.9
        for <linux-doc@vger.kernel.org>; Wed, 25 Aug 2021 09:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=WfApXgIAJKG8HDMpDxeWIJ0g5a0zCGdRTXnLP/N3w6w=;
        b=yNWmLg4D3MPNwz3iBAd040R8jR3mwmiT7/OveoBUnx9MNH0mZGUVD5U24u+11fAfKu
         a91IZ8N7rdaeM0orJk9dy3N0mjCx0Yu0Sfpiog/Q0vvp5SjYBYa+qB5aucbHlPvnFQxg
         ELDRto3TAI3GsKS4J5a7nQHfFBCd8MS8Em89BuJD8j8ZUk/ROgeXYelhYWzO9Ynho1mq
         Db15kqUQUWEeBPBAI9ezdNAxXbSzajoKJWmZTScnNGMZvCjyw6jXoE8XpGD3UA0+LVPF
         B1qo2b1h/VoOZgU61Jjek+nZEIIsBbUB2TYNMi/CBZ7lLCGLRI69QP+7/KPDIMTjF+5X
         ZxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=WfApXgIAJKG8HDMpDxeWIJ0g5a0zCGdRTXnLP/N3w6w=;
        b=TndnivnDKiAliZzo5GyEVKJiJK8ChT7cgupnDQfbcNzCdgMPibc0a82PcqX/wNDrdY
         L6YhyApK8zaLF8J0Z4bw0UxW3m36MMQrFm32pV+ZSWCUQN4mdNY/dF/V9cba5vJAvF/1
         YeaZgMEj7Y019bOKXOEgivau2txYSEz02vMN9QqRM2VlaJ2UJJvCmRKTDQvQCBI00kUc
         vv+kgBJuJ2IGQ9G3DaFs0Ya/xyLwlRA+YnHSNQlaCpAP7mFwhqgs2XH1eTmHXSITib68
         BobwgjdDKuCJXR0/SrPVXos2uiO9SflduhJjkJAcl6B1VFG5IdqYo6/+WAM5x0KNCZRl
         fvQQ==
X-Gm-Message-State: AOAM531xGhr2N4kAYij9jroISpkdhPW4S0bvoaI/rt42Xu3Bms4OlLMG
        XPgVyExvpvW+z6j3ZFf9rdVhWQ==
X-Google-Smtp-Source: ABdhPJwrAL8hgbvN02uYYKtBnE1DUYV7Xq1vYTj0mWjw2e7+NUaM6k7pyNoflK0khzA8RTUOnBiSQQ==
X-Received: by 2002:a63:2242:: with SMTP id t2mr41795283pgm.111.1629908438181;
        Wed, 25 Aug 2021 09:20:38 -0700 (PDT)
Received: from [10.255.189.11] ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id t13sm121019pjg.25.2021.08.25.09.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 09:20:37 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] mm: introduce pmd_install() helper
To:     David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <20210819031858.98043-2-zhengqi.arch@bytedance.com>
 <edd82170-7149-1abf-6204-f1d665a5fca2@redhat.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <c650ef29-0f9e-02a0-9426-b406a4608c8f@bytedance.com>
Date:   Thu, 26 Aug 2021 00:20:31 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <edd82170-7149-1abf-6204-f1d665a5fca2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/8/25 AM12:26, David Hildenbrand wrote:
> On 19.08.21 05:18, Qi Zheng wrote:
>> Currently we have three times the same few lines repeated in the
>> code. Deduplicate them by newly introduced pmd_install() helper.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   include/linux/mm.h |  1 +
>>   mm/filemap.c       | 11 ++---------
>>   mm/memory.c        | 34 ++++++++++++++++------------------
>>   3 files changed, 19 insertions(+), 27 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index ce8fc0fd6d6e..57e48217bd71 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2471,6 +2471,7 @@ static inline spinlock_t *pud_lock(struct 
>> mm_struct *mm, pud_t *pud)
>>       return ptl;
>>   }
>> +extern void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t 
>> *pte);
>>   extern void __init pagecache_init(void);
>>   extern void __init free_area_init_memoryless_node(int nid);
>>   extern void free_initmem(void);
>> diff --git a/mm/filemap.c b/mm/filemap.c
>> index 53913fced7ae..9f773059c6dc 100644
>> --- a/mm/filemap.c
>> +++ b/mm/filemap.c
>> @@ -3210,15 +3210,8 @@ static bool filemap_map_pmd(struct vm_fault 
>> *vmf, struct page *page)
>>           }
>>       }
>> -    if (pmd_none(*vmf->pmd)) {
>> -        vmf->ptl = pmd_lock(mm, vmf->pmd);
>> -        if (likely(pmd_none(*vmf->pmd))) {
>> -            mm_inc_nr_ptes(mm);
>> -            pmd_populate(mm, vmf->pmd, vmf->prealloc_pte);
>> -            vmf->prealloc_pte = NULL;
>> -        }
>> -        spin_unlock(vmf->ptl);
>> -    }
>> +    if (pmd_none(*vmf->pmd))
>> +        pmd_install(mm, vmf->pmd, &vmf->prealloc_pte);
>>       /* See comment in handle_pte_fault() */
>>       if (pmd_devmap_trans_unstable(vmf->pmd)) {
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 39e7a1495c3c..ef7b1762e996 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -433,9 +433,20 @@ void free_pgtables(struct mmu_gather *tlb, struct 
>> vm_area_struct *vma,
>>       }
>>   }
>> +void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
>> +{
>> +    spinlock_t *ptl = pmd_lock(mm, pmd);
>> +
>> +    if (likely(pmd_none(*pmd))) {    /* Has another populated it ? */
>> +        mm_inc_nr_ptes(mm);
>> +        pmd_populate(mm, pmd, *pte);
>> +        *pte = NULL;
>> +    }
>> +    spin_unlock(ptl);
>> +}
>> +
>>   int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
>>   {
>> -    spinlock_t *ptl;
>>       pgtable_t new = pte_alloc_one(mm);
>>       if (!new)
>>           return -ENOMEM;
>> @@ -455,13 +466,7 @@ int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
>>        */
>>       smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
>> -    ptl = pmd_lock(mm, pmd);
>> -    if (likely(pmd_none(*pmd))) {    /* Has another populated it ? */
>> -        mm_inc_nr_ptes(mm);
>> -        pmd_populate(mm, pmd, new);
>> -        new = NULL;
>> -    }
>> -    spin_unlock(ptl);
>> +    pmd_install(mm, pmd, &new);
>>       if (new)
>>           pte_free(mm, new);
>>       return 0;
>> @@ -4027,17 +4032,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>>                   return ret;
>>           }
>> -        if (vmf->prealloc_pte) {
>> -            vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
>> -            if (likely(pmd_none(*vmf->pmd))) {
>> -                mm_inc_nr_ptes(vma->vm_mm);
>> -                pmd_populate(vma->vm_mm, vmf->pmd, vmf->prealloc_pte);
>> -                vmf->prealloc_pte = NULL;
>> -            }
>> -            spin_unlock(vmf->ptl);
>> -        } else if (unlikely(pte_alloc(vma->vm_mm, vmf->pmd))) {
>> +        if (vmf->prealloc_pte)
>> +            pmd_install(vma->vm_mm, vmf->pmd, &vmf->prealloc_pte);
>> +        else if (unlikely(pte_alloc(vma->vm_mm, vmf->pmd)))
>>               return VM_FAULT_OOM;
>> -        }
>>       }
>>       /* See comment in handle_pte_fault() */
>>
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks for your review, I will add this to the patch v3.

> 
> That's mostly unrelated to the remaining part of the series and can be 
> picked up early.

The implementation of subsequent patches depends on pmd_install().
So I am worried that if this patch is submitted as a separate patch,
subsequent patches will not be updated until this patch is merged.
What do you think?

> 



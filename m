Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BAFC4338F
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 16:26:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 980C861248
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 16:26:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhHXQ1g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Aug 2021 12:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26781 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229557AbhHXQ1b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Aug 2021 12:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629822406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TYtQtl/3C2Gj/kt8xj0pTccd7H5GHAf8Dw42NMrmVXU=;
        b=EI9ve51R/Tg/DSjLA3u72G3VQFsdigo14vN2ZnIJXOHOyYIQtlPCqjwVx3xXyvgjoG2LP6
        CFW8m7tXulukvMIc+cAOW+Z92Uk18CQWFTcVoqeCpFjzQF1otgX3w93rlh2tfIQ83Mmm59
        ywTOo/R2P96nnD9F4P/xCH68CjkrxfE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-ByuQNuGfNbCVAG5hMCXjKA-1; Tue, 24 Aug 2021 12:26:45 -0400
X-MC-Unique: ByuQNuGfNbCVAG5hMCXjKA-1
Received: by mail-wm1-f69.google.com with SMTP id j135-20020a1c238d000000b002e87aa95b5aso652628wmj.4
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 09:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TYtQtl/3C2Gj/kt8xj0pTccd7H5GHAf8Dw42NMrmVXU=;
        b=k0TpWTPoRiIUgKMTdf1QRfQvS+EXKM1qgfiXQk8ze8LkxvmbMcKV5RNuum0uXh3GAJ
         iuu0fun6cVlkhPdzEa3s/fLr+yKhC/2+AcptIxYcaV9ZeMheXfe2Lp8Prf0UDQU/3Gux
         1AOyqjlQF4ZgoNhSlOrNRxpIkP7FBUPtmnhLSjmsGGm+k0/TkQe19MUh0SNcoH1fL/MR
         GB1gqeCkJaPJ5wfj+O1RiwVJ034R0y6ZmFLpgRUXAXgUgF8FkVOMzPPUODUAfx5jqUfG
         x+sEvn+zsO8BC4NeoVrHNlSkBJrU3vkVa6zj4crLsu8TrrIuf1uEd7V65yc4IW20IAVW
         OEFg==
X-Gm-Message-State: AOAM531mILldeRnVjUl4x7Ms1Be1b0jFrawTRJAMPzUZV6EwVJmexLOd
        tQNzIdwgYDM3pht43MAsclZAQqVa2DnO9FnOtyNZhZXPL5m5LFek8k5BmpfSVaUPsH50vnsi/0E
        Cp8TyZI8pBxQedZ4zxpZh
X-Received: by 2002:adf:f101:: with SMTP id r1mr17135271wro.355.1629822404268;
        Tue, 24 Aug 2021 09:26:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx97fjaFa36+aZbM+EMQ9R++YVwrZeW3RMKAV9fGubIm+gCe79sLjVmW3/mIgQ7bDDbaucWcg==
X-Received: by 2002:adf:f101:: with SMTP id r1mr17135258wro.355.1629822404086;
        Tue, 24 Aug 2021 09:26:44 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c4d.dip0.t-ipconnect.de. [79.242.60.77])
        by smtp.gmail.com with ESMTPSA id e2sm19925957wrq.56.2021.08.24.09.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 09:26:43 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] mm: introduce pmd_install() helper
To:     Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <20210819031858.98043-2-zhengqi.arch@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <edd82170-7149-1abf-6204-f1d665a5fca2@redhat.com>
Date:   Tue, 24 Aug 2021 18:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819031858.98043-2-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.08.21 05:18, Qi Zheng wrote:
> Currently we have three times the same few lines repeated in the
> code. Deduplicate them by newly introduced pmd_install() helper.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   include/linux/mm.h |  1 +
>   mm/filemap.c       | 11 ++---------
>   mm/memory.c        | 34 ++++++++++++++++------------------
>   3 files changed, 19 insertions(+), 27 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ce8fc0fd6d6e..57e48217bd71 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2471,6 +2471,7 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
>   	return ptl;
>   }
>   
> +extern void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
>   extern void __init pagecache_init(void);
>   extern void __init free_area_init_memoryless_node(int nid);
>   extern void free_initmem(void);
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 53913fced7ae..9f773059c6dc 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3210,15 +3210,8 @@ static bool filemap_map_pmd(struct vm_fault *vmf, struct page *page)
>   	    }
>   	}
>   
> -	if (pmd_none(*vmf->pmd)) {
> -		vmf->ptl = pmd_lock(mm, vmf->pmd);
> -		if (likely(pmd_none(*vmf->pmd))) {
> -			mm_inc_nr_ptes(mm);
> -			pmd_populate(mm, vmf->pmd, vmf->prealloc_pte);
> -			vmf->prealloc_pte = NULL;
> -		}
> -		spin_unlock(vmf->ptl);
> -	}
> +	if (pmd_none(*vmf->pmd))
> +		pmd_install(mm, vmf->pmd, &vmf->prealloc_pte);
>   
>   	/* See comment in handle_pte_fault() */
>   	if (pmd_devmap_trans_unstable(vmf->pmd)) {
> diff --git a/mm/memory.c b/mm/memory.c
> index 39e7a1495c3c..ef7b1762e996 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -433,9 +433,20 @@ void free_pgtables(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   	}
>   }
>   
> +void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
> +{
> +	spinlock_t *ptl = pmd_lock(mm, pmd);
> +
> +	if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
> +		mm_inc_nr_ptes(mm);
> +		pmd_populate(mm, pmd, *pte);
> +		*pte = NULL;
> +	}
> +	spin_unlock(ptl);
> +}
> +
>   int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
>   {
> -	spinlock_t *ptl;
>   	pgtable_t new = pte_alloc_one(mm);
>   	if (!new)
>   		return -ENOMEM;
> @@ -455,13 +466,7 @@ int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
>   	 */
>   	smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
>   
> -	ptl = pmd_lock(mm, pmd);
> -	if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
> -		mm_inc_nr_ptes(mm);
> -		pmd_populate(mm, pmd, new);
> -		new = NULL;
> -	}
> -	spin_unlock(ptl);
> +	pmd_install(mm, pmd, &new);
>   	if (new)
>   		pte_free(mm, new);
>   	return 0;
> @@ -4027,17 +4032,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>   				return ret;
>   		}
>   
> -		if (vmf->prealloc_pte) {
> -			vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
> -			if (likely(pmd_none(*vmf->pmd))) {
> -				mm_inc_nr_ptes(vma->vm_mm);
> -				pmd_populate(vma->vm_mm, vmf->pmd, vmf->prealloc_pte);
> -				vmf->prealloc_pte = NULL;
> -			}
> -			spin_unlock(vmf->ptl);
> -		} else if (unlikely(pte_alloc(vma->vm_mm, vmf->pmd))) {
> +		if (vmf->prealloc_pte)
> +			pmd_install(vma->vm_mm, vmf->pmd, &vmf->prealloc_pte);
> +		else if (unlikely(pte_alloc(vma->vm_mm, vmf->pmd)))
>   			return VM_FAULT_OOM;
> -		}
>   	}
>   
>   	/* See comment in handle_pte_fault() */
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

That's mostly unrelated to the remaining part of the series and can be 
picked up early.

-- 
Thanks,

David / dhildenb


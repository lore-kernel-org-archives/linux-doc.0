Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B279C4320E
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 10:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7747A60240
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 10:02:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240826AbhHaKDU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Aug 2021 06:03:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28496 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240576AbhHaKDT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Aug 2021 06:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630404144;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jqeS5dJqGL2la3qFAC0w58iwikTbH3qg69LBZX5HqFA=;
        b=DozJFKxDkAL7Hi9hDUAHBwawuAjvJHrJDwqfbIw8jsru+rL4Ptn3BpCziuLRdahSsDxUaI
        Qk1dkdhRDpPpW6HunDPofIxm3mwU1JrSD5MTTJVp/dA3GXreZLzlis7oiz2yB3iFDx6AGQ
        DTE2FCXcEOjASSwYyf1+f7hdDnNu61A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-J0FXNiv4MluBNYWmcOxA0w-1; Tue, 31 Aug 2021 06:02:20 -0400
X-MC-Unique: J0FXNiv4MluBNYWmcOxA0w-1
Received: by mail-wm1-f72.google.com with SMTP id u1-20020a05600c210100b002e74fc5af71so5779394wml.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 03:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jqeS5dJqGL2la3qFAC0w58iwikTbH3qg69LBZX5HqFA=;
        b=EexK9OALcQmu5X3ohiZCS+V2VG5TBGJSd0ba4uwClAwhTnpZUgHVROolVLvZwnzK2f
         vjvyV0pw/uw/S1e6jH+04/MnI81xYWLTu6Ip8u0mINULnaJrS/8HBlEa7hfLhE7DCmRG
         7qE1NXjAgdxIeO2acyNZyU6QjKP5bsEIuEFly4VWkzHcyh7dIZwmbLASm51qmwa0nHvj
         jlyJzmpWgtm7Lt6LeWj52Te9esfl+QVV/vwNsxIDMRJAyKvnY0F6jelju7bTrsLihoFf
         TqrHpPeawtj99GwNggdbJTpzOKtg8q77Vh0CdihZwW//8efzM8BCzwA2R/0Ob06OhdAf
         Aupw==
X-Gm-Message-State: AOAM5333p0AflBBhYv7kwdohVvRwnPt1V8P2+qnmr/LlUnhQt+5amMrW
        xz37tn2d58hpjxhS+NIkHMwMTCEnMB9VI8m0VaU8CZsic3v455huzf60UNARP+lLgZKSc4o4sx4
        jBXkjaXI9wjRzMRiuW0oy
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr31069149wrw.16.1630404139500;
        Tue, 31 Aug 2021 03:02:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKNc4Ju1F4md5mAzye9cqjPnfpX+wtAYfUopsMsDu2iTaFHvQ0m854e37aG8+UXY3KNLHFbg==
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr31069113wrw.16.1630404139279;
        Tue, 31 Aug 2021 03:02:19 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23bf5.dip0.t-ipconnect.de. [79.242.59.245])
        by smtp.gmail.com with ESMTPSA id t7sm19573261wrq.90.2021.08.31.03.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 03:02:18 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] mm: remove redundant smp_wmb()
To:     Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210828042306.42886-1-zhengqi.arch@bytedance.com>
 <20210828042306.42886-3-zhengqi.arch@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <9da807d4-1fcc-72e0-dc9e-91ab9fbeb7c6@redhat.com>
Date:   Tue, 31 Aug 2021 12:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210828042306.42886-3-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28.08.21 06:23, Qi Zheng wrote:
> The smp_wmb() which is in the __pte_alloc() is used to
> ensure all ptes setup is visible before the pte is made
> visible to other CPUs by being put into page tables. We
> only need this when the pte is actually populated, so
> move it to pte_install(). __pte_alloc_kernel(),
> __p4d_alloc(), __pud_alloc() and __pmd_alloc() are similar
> to this case.
> 
> We can also defer smp_wmb() to the place where the pmd entry
> is really populated by preallocated pte. There are two kinds
> of user of preallocated pte, one is filemap & finish_fault(),
> another is THP. The former does not need another smp_wmb()
> because the smp_wmb() has been done by pte_install().
> Fortunately, the latter also does not need another smp_wmb()
> because there is already a smp_wmb() before populating the
> new pte when the THP uses a preallocated pte to split a huge
> pmd.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/memory.c         | 47 ++++++++++++++++++++---------------------------
>   mm/sparse-vmemmap.c |  2 +-
>   2 files changed, 21 insertions(+), 28 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index ef7b1762e996..9c7534187454 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -439,6 +439,20 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
>   
>   	if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
>   		mm_inc_nr_ptes(mm);
> +		/*
> +		 * Ensure all pte setup (eg. pte page lock and page clearing) are
> +		 * visible before the pte is made visible to other CPUs by being
> +		 * put into page tables.
> +		 *
> +		 * The other side of the story is the pointer chasing in the page
> +		 * table walking code (when walking the page table without locking;
> +		 * ie. most of the time). Fortunately, these data accesses consist
> +		 * of a chain of data-dependent loads, meaning most CPUs (alpha
> +		 * being the notable exception) will already guarantee loads are
> +		 * seen in-order. See the alpha page table accessors for the
> +		 * smp_rmb() barriers in page table walking code.
> +		 */
> +		smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
>   		pmd_populate(mm, pmd, *pte);
>   		*pte = NULL;
>   	}
> @@ -451,21 +465,6 @@ int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
>   	if (!new)
>   		return -ENOMEM;
>   
> -	/*
> -	 * Ensure all pte setup (eg. pte page lock and page clearing) are
> -	 * visible before the pte is made visible to other CPUs by being
> -	 * put into page tables.
> -	 *
> -	 * The other side of the story is the pointer chasing in the page
> -	 * table walking code (when walking the page table without locking;
> -	 * ie. most of the time). Fortunately, these data accesses consist
> -	 * of a chain of data-dependent loads, meaning most CPUs (alpha
> -	 * being the notable exception) will already guarantee loads are
> -	 * seen in-order. See the alpha page table accessors for the
> -	 * smp_rmb() barriers in page table walking code.
> -	 */
> -	smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
> -
>   	pmd_install(mm, pmd, &new);
>   	if (new)
>   		pte_free(mm, new);
> @@ -478,10 +477,9 @@ int __pte_alloc_kernel(pmd_t *pmd)
>   	if (!new)
>   		return -ENOMEM;
>   
> -	smp_wmb(); /* See comment in __pte_alloc */
> -
>   	spin_lock(&init_mm.page_table_lock);
>   	if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
> +		smp_wmb(); /* See comment in pmd_install() */
>   		pmd_populate_kernel(&init_mm, pmd, new);
>   		new = NULL;
>   	}
> @@ -3857,7 +3855,6 @@ static vm_fault_t __do_fault(struct vm_fault *vmf)
>   		vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
>   		if (!vmf->prealloc_pte)
>   			return VM_FAULT_OOM;
> -		smp_wmb(); /* See comment in __pte_alloc() */
>   	}
>   
>   	ret = vma->vm_ops->fault(vmf);
> @@ -3919,7 +3916,6 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
>   		vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
>   		if (!vmf->prealloc_pte)
>   			return VM_FAULT_OOM;
> -		smp_wmb(); /* See comment in __pte_alloc() */
>   	}
>   
>   	vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
> @@ -4144,7 +4140,6 @@ static vm_fault_t do_fault_around(struct vm_fault *vmf)
>   		vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
>   		if (!vmf->prealloc_pte)
>   			return VM_FAULT_OOM;
> -		smp_wmb(); /* See comment in __pte_alloc() */
>   	}
>   
>   	return vmf->vma->vm_ops->map_pages(vmf, start_pgoff, end_pgoff);
> @@ -4819,13 +4814,13 @@ int __p4d_alloc(struct mm_struct *mm, pgd_t *pgd, unsigned long address)
>   	if (!new)
>   		return -ENOMEM;
>   
> -	smp_wmb(); /* See comment in __pte_alloc */
> -
>   	spin_lock(&mm->page_table_lock);
>   	if (pgd_present(*pgd))		/* Another has populated it */
>   		p4d_free(mm, new);
> -	else
> +	else {
> +		smp_wmb(); /* See comment in pmd_install() */
>   		pgd_populate(mm, pgd, new);
> +	}

Nit:

if () {

} else {

}

see Documentation/process/coding-style.rst

"This does not apply if only one branch of a conditional statement is a 
single statement; in the latter case use braces in both branches:"


Apart from that, I think this is fine,

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


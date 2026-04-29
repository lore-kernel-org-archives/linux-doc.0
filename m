Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19C1344D80
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 15:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476881; cv=pass; b=aAmu5fLPdwWGx69f50SstvevDbHrcSAHYirJd8DTPCD0cKO7g7ulUBkIbuCxPxTjN5/J8ytwp9LpZQ7yhCbh75OUEGbYC+yXKeNkYcdrxtFKzRyvXhsMwOJGflWtxYNevNZ5qLJcSiSiluYvUFotjr+Q0gAHpHQu2gc8+x5Rd24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476881; c=relaxed/simple;
	bh=Joccb/6m/qotoTKxzfXXj7gjX+oAzcEhjQ92xhr+2jM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qSnOj22s78Ui31iZH4RNByNazlB3TLiqOq5Q+UDR1PNF+hKAsy2gTUguvzuAAEORCgrw7ZOLLrcNSgZCWwEePbXivVyP3vPNbMY2QqOkxxYfMTAFRS4BCnhdS4ErppHchTTzbNZBMbzrI0ZpTKZEy/rN4QrNCXC+aKCrMBA6AFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I0bLYhr4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UJCz0RPY; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I0bLYhr4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UJCz0RPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777476879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x52e0fZe8hqgi5rk/2KtQuEEUkLEozDf77zUuE/vYO4=;
	b=I0bLYhr4fzf1caSxb77CH/zPDidq6lWljOnkZNYAyViSyaTvm/2oJ1NbPJl350fFTH30Ee
	ST0jcQa8xS15cvoeC2gAhkOcAUpOe2G17MER62cL3eHX3BXGKMKqk/9iR6atjcbsTK7+1K
	XuZMaE/ZBsezwUERo8IuIddmShZzblo=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-GvoTUU7GN7-9rV1sm9T8gQ-1; Wed, 29 Apr 2026 11:34:37 -0400
X-MC-Unique: GvoTUU7GN7-9rV1sm9T8gQ-1
X-Mimecast-MFC-AGG-ID: GvoTUU7GN7-9rV1sm9T8gQ_1777476876
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79a51ba2bf9so17867267b3.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 08:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777476876; cv=none;
        d=google.com; s=arc-20240605;
        b=BE4Dkv4BIRaNRbrZFg+YIW9JdH3utgL5r5MLwva+e84ZJY5JBkIUwzGhib6BOr68Hx
         acDkjM2vtyMzeUYqVHjTeLsIN/Yta8wbBLFxJ5/G0kRPAfl+l1vhn7e14F/T2Q3wZPDM
         ITsU6x0D1yZu4cyejZXPgx1vGuE0OFP2J/dPVusJijswEqY988lIfWRs5cL2LjuKccv3
         n80Tkiw3XpFvyW/5wGdxy7oUMxKJGeGnGVzvkwFHUuGg6dnpky/QpOxj9QE8tO0+Rq61
         MriSE/KgH8PrpbgP/8IUDcfYPw4gJL2ngk4DQvFAE/ksV/kdveh9pF9T/LIihuUOuwFS
         IVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x52e0fZe8hqgi5rk/2KtQuEEUkLEozDf77zUuE/vYO4=;
        fh=grfOq5BalAmd2Nc37iIMESYvu/5cpWc4i5WHc3Xal74=;
        b=LRJMe7nVRhNhJqw/mB3eJjYARzR/DDVBaZwYqT11Ee2C7s/Rxe3/75IrCfCzrIeXjt
         tp/8Cd+s1Gic/2vbyxxBHzpgSlDNp2Ex9RFC27upv+LaewHas+7+HSMSNE0yWaZ8Qgml
         9yoV0KptzY9g/z9ZfbFDZKrQJWSAZxEwgDUE3NWW4ikIdA08h3RRcNZDnG46tPyj4Axf
         jrfr4CnnM3xbYfCSbd5Co4mfZFzNAEpiihUcXwUrzgWy6sSpJdQl+2FBG0p4XaqPIAkE
         /pfndrKlLLJYH/OX5MNfhnCp+bjeldzhpGsryLwRLVSN3l34ZRcRoYm1YJpmmcrUPSor
         PKTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777476876; x=1778081676; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x52e0fZe8hqgi5rk/2KtQuEEUkLEozDf77zUuE/vYO4=;
        b=UJCz0RPYoK1WI2cgwklKjGnsxQ6dZahJ2L8RT8PqoM+/LM4WddkY1u3lS0w1atDKLR
         efI5z0xJw0/zHvNY4DyNKJcS85mQ8NeyHW8vwk5uJpt+053F+IkBeuQvdzBY/Yx0ojtG
         E5y25+4PdgIcVG5emuk/bxIFDiVxHTJCpIJxMGxr2TCN080Iq4qDIsydW3kH97cgeMN3
         Ht04pcSBlkmEvCZID8aVnJn3r7Y0auMZQm7IAuXdVu/quZnVfmWo1Om+DoScaHPnloKa
         3t8TvozeRS8fQHjxQ+0/JZs6Ro7e17k5gkKnUf52FGQ5wbI4C8gkO+8coX1RvB0btWhW
         HL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476876; x=1778081676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x52e0fZe8hqgi5rk/2KtQuEEUkLEozDf77zUuE/vYO4=;
        b=MT/QI74lVispGXENoY67Ey66W6wAwl/3UwwSTaAqkFVzGl/0r3XgnTi/qeJE0ERtG8
         nIfiuKk9BeNlG5lXgx7prWrF1g5lLv8L/2+yc/4n5/SWZUB4DYm2Ly8xf4vX3lC91w5F
         P6NEaeLxVmI1uP0+1E1AbhUOEtG3pgaPbF5Ra2pN99hi/rHtLQSvTQZvh8Mya0c0/Snb
         MqidTx/kmGUPojn/Ebtw8LfHswWKwpjOGwZOeqrBEAUaAo2UnCsBfXrkDkfLG2PuALwZ
         yN5vkfstjMN1QEvLzSmYUEzE/7vVFqHn1i9ptxCRN4lR7thc9SqHGXDmXflMki1KroPG
         IOpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+W6H3vMJBoBxq7NaU8O3KSetjyX8j9SykI6CAKAvP420wuvxHekKehAab0F2IrzWRo8L6w3X4rHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWFD7o8HjrV0j7HfnWdnnBMpHsmx8pGOXRR7GGvlJL4DiMNfKn
	kSIkljuMMnUFCSzYw6xnSMHDBR3cprhKNpHkA85BotcKQ3xxiR4p4hrVmto5JtnnRoSfUZyJfYs
	I+GR/nQsaAMpH4SAVSrqM/l/nnxjUGiQirzxzyztWnRJQFPHLKhR0IhECARQt79sSQayYNPOkzQ
	7cYHeuW0k3642S86AV/40pxVncukmaw+qcDzeK
X-Gm-Gg: AeBDievKmYEohXuXNnEOlN6qiIEonjNzyQ7rUOmr3Ak0+WZDFPkuqPglRy2ISdyqhoZ
	qV0OKM74tRCU65mItfk0L9966GaiqjKNeLWlMt9nj4+vcoddjOjaOXKvTf/Mz8x5kCXsbGQ7fcV
	bZWRfouoajXu1Ls4cbC9dwrUv/60pkXxLU947X7hywyWbYE1jWli9WZcSjmUURt59KqXlCSrA1m
	LQB9ZIWYr8j4XDNiEvs9NdE+FoJvdRUs71v1I3CkGcNm5f/Ivg=
X-Received: by 2002:a53:b688:0:b0:650:3138:115 with SMTP id 956f58d0204a3-65beee4a1b0mr6260548d50.36.1777476875803;
        Wed, 29 Apr 2026 08:34:35 -0700 (PDT)
X-Received: by 2002:a53:b688:0:b0:650:3138:115 with SMTP id
 956f58d0204a3-65beee4a1b0mr6260501d50.36.1777476875210; Wed, 29 Apr 2026
 08:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419185750.260784-1-npache@redhat.com> <20260419185750.260784-6-npache@redhat.com>
 <6025c087-378b-4754-b1f2-3c5448b49d6c@kernel.org>
In-Reply-To: <6025c087-378b-4754-b1f2-3c5448b49d6c@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Wed, 29 Apr 2026 09:34:41 -0600
X-Gm-Features: AVHnY4LxGs5gVtTI63RcmHeUNNAvbBe-z9kQhpe1H901TsSecYTyWmk06JRVx0o
Message-ID: <CAA1CXcB-BpuryzNLznU_JS5XLvLmGoT34UK-bpMOPjE0GE1NEA@mail.gmail.com>
Subject: Re: [PATCH 7.2 v16 05/13] mm/khugepaged: generalize
 collapse_huge_page for mTHP collapse
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org
Cc: aarcange@redhat.com, akpm@linux-foundation.org, anshuman.khandual@arm.com, 
	apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	byungchul@sk.com, catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	lance.yang@linux.dev, Liam.Howlett@oracle.com, ljs@kernel.org, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, 
	raquini@redhat.com, rdunlap@infradead.org, richard.weiyang@gmail.com, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"

On 4/27/26 2:13 PM, David Hildenbrand (Arm) wrote:
> On 4/19/26 20:57, Nico Pache wrote:
>> Pass an order and offset to collapse_huge_page to support collapsing anon
>> memory to arbitrary orders within a PMD. order indicates what mTHP size we
>> are attempting to collapse to, and offset indicates were in the PMD to
>> start the collapse attempt.
>>
>> For non-PMD collapse we must leave the anon VMA write locked until after
>> we collapse the mTHP-- in the PMD case all the pages are isolated, but in
>> the mTHP case this is not true, and we must keep the lock to prevent
>> access/changes to the page tables. This can happen if the rmap walkers hit
>> a pmd_none while the PMD entry is currently unavailable due to being
>> temporarily removed during the collapse phase.
>>
>> Signed-off-by: Nico Pache <npache@redhat.com>
>> ---
>>   mm/khugepaged.c | 103 +++++++++++++++++++++++++++---------------------
>>   1 file changed, 57 insertions(+), 46 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 283bb63854a5..ff6f9f1883ed 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -1198,42 +1198,36 @@ static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_stru
>>      return SCAN_SUCCEED;
>>   }
>>
>> -static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long address,
>> -            int referenced, int unmapped, struct collapse_control *cc)
>> +static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long start_addr,
>> +            int referenced, int unmapped, struct collapse_control *cc,
>> +            unsigned int order)
>>   {
>>      LIST_HEAD(compound_pagelist);
>>      pmd_t *pmd, _pmd;
>> -    pte_t *pte;
>> +    pte_t *pte = NULL;
>>      pgtable_t pgtable;
>>      struct folio *folio;
>>      spinlock_t *pmd_ptl, *pte_ptl;
>>      enum scan_result result = SCAN_FAIL;
>>      struct vm_area_struct *vma;
>>      struct mmu_notifier_range range;
>> +    bool anon_vma_locked = false;
>> +    const unsigned long pmd_addr = start_addr & HPAGE_PMD_MASK;
>> +    const unsigned long end_addr = start_addr + (PAGE_SIZE << order);
>
> In general, const read better when they are at the very top of this list.

Ack! still getting in the habit of this, sorry.

>
>>
>> -    VM_BUG_ON(address & ~HPAGE_PMD_MASK);
>> -
>> -    /*
>> -     * Before allocating the hugepage, release the mmap_lock read lock.
>> -     * The allocation can take potentially a long time if it involves
>> -     * sync compaction, and we do not need to hold the mmap_lock during
>> -     * that. We will recheck the vma after taking it again in write mode.
>> -     */
>> -    mmap_read_unlock(mm);
>> -
>
> You should spell out that locking change (moving it to the caller), and why it
> is required, in the patch description.
>
> I'd even have put this into a separate patch, as it's independent to the
> order-passing changes.

Yeah good point ill separate this out into its own patch, I also
realized I never updated the commit message for this patch to properly
describe this change. Whoops.


> [...]
>
>>       */
>>      __folio_mark_uptodate(folio);
>> -    pgtable = pmd_pgtable(_pmd);
>> -
>>      spin_lock(pmd_ptl);
>> -    BUG_ON(!pmd_none(*pmd));
>> -    pgtable_trans_huge_deposit(mm, pmd, pgtable);
>> -    map_anon_folio_pmd_nopf(folio, pmd, vma, address);
>> +    WARN_ON_ONCE(!pmd_none(*pmd));
>> +    if (is_pmd_order(order)) { /* PMD collapse */
>> +            pgtable = pmd_pgtable(_pmd);
>> +            pgtable_trans_huge_deposit(mm, pmd, pgtable);
>> +            map_anon_folio_pmd_nopf(folio, pmd, vma, pmd_addr);
>> +    } else { /* mTHP collapse */
>
> Do both these comments (PMD collapse ...) really add any value? I'd say it's
> pretty self-documenting code already.

Yeah with the new is_pmd_order helper its def a little overkill. I'll
remove them. Thanks!


>
>> +            map_anon_folio_pte_nopf(folio, pte, vma, start_addr, /*uffd_wp=*/ false);
>> +            smp_wmb(); /* make PTEs visible before PMD. See pmd_install() */
>> +            pmd_populate(mm, pmd, pmd_pgtable(_pmd));
>> +    }
>>      spin_unlock(pmd_ptl);
>>
>>      folio = NULL;
>>
>>      result = SCAN_SUCCEED;
>>   out_up_write:
>> +    if (anon_vma_locked)
>> +            anon_vma_unlock_write(vma->anon_vma);
>> +    if (pte)
>> +            pte_unmap(pte);
>


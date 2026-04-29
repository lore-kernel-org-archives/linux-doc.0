Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6768533F8DC
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476865; cv=pass; b=U6PsxbMz53jLmej7vLH+L3t70zVjiR3FvAuyhtU0l2bpLgxdcA+ZIZUE2XolYXu9+vPcaNP7sYgMZvZKPzBdY4aDHjAE68LL1VWbyhYvNR7XokBmb3nbcXaxLlb8H6lkPVU7PpoNft6nveie9QmBtiX1ai7g6Zt8k/rozYAM5sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476865; c=relaxed/simple;
	bh=MISn2YrOcs8ZWohhBTDQuT1oskedcvQX81FLXsBOc48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbFs9TSsWUnNizyDFyXaf7qsbjXfrMX3GRtM2UgqehjPJFq+8UBCmIWqkAFdIa4pvFoAVU38wwaD0ETvexzVF0bm/dp5L3FSa7pZ1ba2X8JNPnBvEZiZtfcqqCWNun2QQb7rmbOyRrYAEkWdX51JsLrBiMFLucOB2FOhVVv7Gfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NSRnQGgA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p+wcTa0U; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NSRnQGgA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p+wcTa0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777476862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HuFfgBtz9KMV/pnRXnzflTopMd89eVVSakVY5rVzpsI=;
	b=NSRnQGgAPouKTerh0XFGhrftVEpJfNUQFmXrB2tEo2IxXMsPDOWVZ1jd/nv4zNNz5QabDg
	Yp3lO+7WIH8TuLFTbEsOgS6ArqNLMOGHMhyFMuMErXDLtSM+Cxjmr1WDNDf1FZB1bd5iO2
	xTRGhWysX6R08djCkzHjjk5qyO10+6w=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-cw5oo-XpOXqCngfh5OI9pw-1; Wed, 29 Apr 2026 11:34:21 -0400
X-MC-Unique: cw5oo-XpOXqCngfh5OI9pw-1
X-Mimecast-MFC-AGG-ID: cw5oo-XpOXqCngfh5OI9pw_1777476860
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-649df163c11so18755243d50.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 08:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777476860; cv=none;
        d=google.com; s=arc-20240605;
        b=Qf0WxjCTKNxI9cZRbenECxNGBru4J+eGnVwmxljBdGtL9LoAmyV2poPAwzSYk471d1
         atzp9TCTzcrxAyqdbYXiuKNBoxhEEmxf/YmHfTtRuf92FHc8lYhFWcwvnnKgGqEDeu4t
         2fKyGCvdfR7mp1RzSxBLaDPIuSroMka298VFcnARR2WlrCsvj8t+gCcDwnSV2Sl1lA06
         EGk3qvczlQoFXQ9rty6t/Bp/pCfsFGLIFU/1Fs1jAaERdxb4CoBrYMuljf5vJs6IHBMq
         qiuxPXhTqfIN/PX+Q2sq7olX6UXobKvRaINGvf+VZzI0D2gQqu/TTXIuI+atlaviUJzC
         NUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HuFfgBtz9KMV/pnRXnzflTopMd89eVVSakVY5rVzpsI=;
        fh=R0TIXQUDA2/CR9cYB2OQniDpUpR6uAYfPqZATFKmyAc=;
        b=YfbyrLvq66tfbePuXZjJyBEFHsaSQqsQeC0/uPzJTH/8LAp45TUl8NtYn/wKNVT7Nq
         eVbkY6OcShOjHpmK5es8gNdNk2ciggT+GXTsZuQ7EzFj0WT02JHln4kyFbqeRVNtHvvI
         QGy9UuUow+tmEtHsZ7JwVeMlTL7ILr5n8A6jVl3n1Wv2HQHaSzD1O+Lvjh+x/nR1fuau
         n8FK2LRsDdP9oRD5i5uOHCn5DCrtcsfUfNXXbn/R6vRSfyJn1nrybgaDKbYeKh9mK9zB
         Q5HnESnfOrtfr03IGy+TyuvLA63gSWnlqt6BbzQG7bOFMWSrjivTBaOknx6OpeBdErwr
         12Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777476860; x=1778081660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuFfgBtz9KMV/pnRXnzflTopMd89eVVSakVY5rVzpsI=;
        b=p+wcTa0Uuy7R6d5ANZ28iRn3dDcSCBBwZ+eMEvoSuIt5ZRB1Vs0qK3FJ4QsIUf4Lcu
         kiOjoaBzvkPQWgaohLglonbzWfugTZqaHW9zF8021gwDdDUsQX+3I1XtY3PFkZZ64VSB
         dToZciG31Aqr7C1D5Noxm7ddjLyoRfULobJWQlm4Qi0zkCQeszmFGzn+ol7OeTEUQNSq
         3nJr4/uVqK8UwbsJH9SDePnhvRFI9frP9/jkDepTPjm/oAotbGZxC4xP2dLRpwzZvSUy
         0K1mVRNiyJYmm92NR8c29FugpMrbFJPMEcadUI323PZKOSvI+2sY+sU4Ivi6FcLQawDc
         ON8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476860; x=1778081660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HuFfgBtz9KMV/pnRXnzflTopMd89eVVSakVY5rVzpsI=;
        b=pAskOZ+9Wtu5iOHrC6c8X2mjAdRKk9Ao3YKyZmcN9DJIAk81v2fAxHVYjuvOiOTeYR
         KTapvLunfCK1r4R0SkVed0CFRTCFtPgsWW5G+9tZoCYZvZJvJEbDdyHsmpeVuHWhIZXY
         q9AG1mqSiZbxlJlagcmvZxmozL/tUWCmBh1o3rLe03DmE69aIjqMULZa8nqspgG/oIkE
         FjPFaUWMzqwrjyBtq3vixI1d/sz9wOfR6fbP1tZZhT0cH7g2+1M9HQB7SdcoSC6+jMNP
         4IdvlITtJroV3UqPq9G3WqvQKAyotiGr9mKrc2VFyxMFzjuvjg4MJZXgCKes4McK57Sv
         2fTQ==
X-Gm-Message-State: AOJu0Yyrf3XQhM4auYyRoXglKjQ/kG6E/P+ePbMMxPexunbpUW0NG1N5
	GUG938gNbz7PGJu2vCzq4+oJMcPCqtN8JNufVrBrHieZiD4pOUhkdYSBCpj530y3nV/8yZI7UaJ
	uWiz6ObZ/NWN2cEDK3EAY3IhsDqsavph7HnDMKC0Igx9lOcFC5tQJsNKkaMH3rQLAH7Ec8pQkw7
	G3hlE8ZeQ7XtrVXnKdWpHtdRB4/dDLqEXKzqNA
X-Gm-Gg: AeBDievZlPjnGfB+9Kqg3AOi7QGPRQuPSu+JFs76YetskV+2At5DPujdd5I5UtJNVS1
	camTbh9ebM7Q1q6bP1TCNjxaog3+U7P/ps5X3IKdNJwRvUPe2GhbhY+q7OPtxl7+n2bVxkncJUd
	QkLNSKKh7vA+CFAn0R0HrgewY5RUmXzOY+cLBmgLyGtr9j2iYcbTybOBQz81GM3xenIxc+Bt6VT
	zSZOuuU3bO135Nq9g3Z+gp0PsgQq4vKoVyr1LajOn5IP4XmOmI=
X-Received: by 2002:a05:690e:42d0:b0:654:4045:f40c with SMTP id 956f58d0204a3-65beee98103mr5731363d50.53.1777476860288;
        Wed, 29 Apr 2026 08:34:20 -0700 (PDT)
X-Received: by 2002:a05:690e:42d0:b0:654:4045:f40c with SMTP id
 956f58d0204a3-65beee98103mr5731328d50.53.1777476859542; Wed, 29 Apr 2026
 08:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419185750.260784-6-npache@redhat.com> <20260420142057.392263-1-usama.arif@linux.dev>
In-Reply-To: <20260420142057.392263-1-usama.arif@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Wed, 29 Apr 2026 09:34:24 -0600
X-Gm-Features: AVHnY4K58vxjzjxYUrb5dAGrEP1k6JdWhwO4Q7LKZOLVwPj1q4pvyOMwTkVSZu4
Message-ID: <CAA1CXcDgFDcsx3-mrnFzNu3zMkinFtEKSv84VKepTihUuRPfKg@mail.gmail.com>
Subject: Re: [PATCH 7.2 v16 05/13] mm/khugepaged: generalize
 collapse_huge_page for mTHP collapse
To: Usama Arif <usama.arif@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	lance.yang@linux.dev, Liam.Howlett@oracle.com, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 4/20/26 8:20 AM, Usama Arif wrote:
> On Sun, 19 Apr 2026 12:57:42 -0600 Nico Pache <npache@redhat.com> wrote:
>
>> Pass an order and offset to collapse_huge_page to support collapsing ano=
n
>> memory to arbitrary orders within a PMD. order indicates what mTHP size =
we
>> are attempting to collapse to, and offset indicates were in the PMD to
>> start the collapse attempt.
>>
>> For non-PMD collapse we must leave the anon VMA write locked until after
>> we collapse the mTHP-- in the PMD case all the pages are isolated, but i=
n
>> the mTHP case this is not true, and we must keep the lock to prevent
>> access/changes to the page tables. This can happen if the rmap walkers h=
it
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
>> @@ -1198,42 +1198,36 @@ static enum scan_result alloc_charge_folio(struc=
t folio **foliop, struct mm_stru
>>      return SCAN_SUCCEED;
>>   }
>>
>> -static enum scan_result collapse_huge_page(struct mm_struct *mm, unsign=
ed long address,
>> -            int referenced, int unmapped, struct collapse_control *cc)
>> +static enum scan_result collapse_huge_page(struct mm_struct *mm, unsign=
ed long start_addr,
>> +            int referenced, int unmapped, struct collapse_control *cc,
>> +            unsigned int order)
>>   {
>>      LIST_HEAD(compound_pagelist);
>>      pmd_t *pmd, _pmd;
>> -    pte_t *pte;
>> +    pte_t *pte =3D NULL;
>>      pgtable_t pgtable;
>>      struct folio *folio;
>>      spinlock_t *pmd_ptl, *pte_ptl;
>>      enum scan_result result =3D SCAN_FAIL;
>>      struct vm_area_struct *vma;
>>      struct mmu_notifier_range range;
>> +    bool anon_vma_locked =3D false;
>> +    const unsigned long pmd_addr =3D start_addr & HPAGE_PMD_MASK;
>> +    const unsigned long end_addr =3D start_addr + (PAGE_SIZE << order);
>>
>> -    VM_BUG_ON(address & ~HPAGE_PMD_MASK);
>> -
>> -    /*
>> -     * Before allocating the hugepage, release the mmap_lock read lock.
>> -     * The allocation can take potentially a long time if it involves
>> -     * sync compaction, and we do not need to hold the mmap_lock during
>> -     * that. We will recheck the vma after taking it again in write mod=
e.
>> -     */
>> -    mmap_read_unlock(mm);
>> -
>
> My understanding now is that the caller will need to drop the mmap_read l=
ock?
>
> This needs explicit documentation at the start of the function IMO. I thi=
nk
> there are callers in later patches and its very easy to miss this.

Yeah as David suggested I will probably seperate this out into its own
patch. And add some proper comments to describe the requirement. I didnt
even realize I had forgot to update the patch to describe this change
(apart from the coverletter). Thank you :)

>
>
>> -    result =3D alloc_charge_folio(&folio, mm, cc, HPAGE_PMD_ORDER);
>> +    result =3D alloc_charge_folio(&folio, mm, cc, order);
>>      if (result !=3D SCAN_SUCCEED)
>>              goto out_nolock;
>>
>>      mmap_read_lock(mm);
>> -    result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc,
>> -                                     HPAGE_PMD_ORDER);
>> +    result =3D hugepage_vma_revalidate(mm, pmd_addr, /*expect_anon=3D*/=
 true,
>> +                                     &vma, cc, order);
>>      if (result !=3D SCAN_SUCCEED) {
>>              mmap_read_unlock(mm);
>>              goto out_nolock;
>>      }
>>
>> -    result =3D find_pmd_or_thp_or_none(mm, address, &pmd);
>> +    result =3D find_pmd_or_thp_or_none(mm, pmd_addr, &pmd);
>>      if (result !=3D SCAN_SUCCEED) {
>>              mmap_read_unlock(mm);
>>              goto out_nolock;
>> @@ -1245,8 +1239,8 @@ static enum scan_result collapse_huge_page(struct =
mm_struct *mm, unsigned long a
>>               * released when it fails. So we jump out_nolock directly i=
n
>>               * that case.  Continuing to collapse causes inconsistency.
>>               */
>> -            result =3D __collapse_huge_page_swapin(mm, vma, address, pm=
d,
>> -                                                 referenced, HPAGE_PMD_=
ORDER);
>> +            result =3D __collapse_huge_page_swapin(mm, vma, start_addr,=
 pmd,
>> +                                                 referenced, order);
>>              if (result !=3D SCAN_SUCCEED)
>>                      goto out_nolock;
>>      }
>> @@ -1261,20 +1255,21 @@ static enum scan_result collapse_huge_page(struc=
t mm_struct *mm, unsigned long a
>>       * mmap_lock.
>>       */
>>      mmap_write_lock(mm);
>> -    result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc,
>> -                                     HPAGE_PMD_ORDER);
>> +    result =3D hugepage_vma_revalidate(mm, pmd_addr, /*expect_anon=3D*/=
 true,
>> +                                     &vma, cc, order);
>>      if (result !=3D SCAN_SUCCEED)
>>              goto out_up_write;
>>      /* check if the pmd is still valid */
>>      vma_start_write(vma);
>> -    result =3D check_pmd_still_valid(mm, address, pmd);
>> +    result =3D check_pmd_still_valid(mm, pmd_addr, pmd);
>>      if (result !=3D SCAN_SUCCEED)
>>              goto out_up_write;
>>
>>      anon_vma_lock_write(vma->anon_vma);
>> +    anon_vma_locked =3D true;
>>
>> -    mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, address,
>> -                            address + HPAGE_PMD_SIZE);
>> +    mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, start_addr=
,
>> +                            end_addr);
>>      mmu_notifier_invalidate_range_start(&range);
>>
>>      pmd_ptl =3D pmd_lock(mm, pmd); /* probably unnecessary */
>> @@ -1286,26 +1281,23 @@ static enum scan_result collapse_huge_page(struc=
t mm_struct *mm, unsigned long a
>>       * Parallel GUP-fast is fine since GUP-fast will back off when
>>       * it detects PMD is changed.
>>       */
>> -    _pmd =3D pmdp_collapse_flush(vma, address, pmd);
>> +    _pmd =3D pmdp_collapse_flush(vma, pmd_addr, pmd);
>
>
> For an mTHP collapse covering, say, 64KiB of a 2MiB PMD, the patch still
> flushes the entire PMD via pmdp_collapse_flush and tlb_remove_table_sync_=
one.
> That triggers cross-CPU TLB shootdowns for ~1.94MiB of unrelated mappings=
 on
> every successful sub-PMD collapse. Probably acceptable as a first cut?

Hmm interesting consideration, I believe this is neccisary from a GUP
perspective as the comment suggests. Me, Dev, and David had discussed
that once that this lands we wanted to play around with a lot of the
locking and previously defined "requirements" to see what is actually
needed. So yeah I think for now we leave it as is. Hopefully we can make
more improvements in the future.

>
>
>>      spin_unlock(pmd_ptl);
>>      mmu_notifier_invalidate_range_end(&range);
>>      tlb_remove_table_sync_one();
>>
>> -    pte =3D pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
>> +    pte =3D pte_offset_map_lock(mm, &_pmd, start_addr, &pte_ptl);
>>      if (pte) {
>> -            result =3D __collapse_huge_page_isolate(vma, address, pte, =
cc,
>> -                                                  HPAGE_PMD_ORDER,
>> -                                                  &compound_pagelist);
>> +            result =3D __collapse_huge_page_isolate(vma, start_addr, pt=
e, cc,
>> +                                                  order, &compound_page=
list);
>>              spin_unlock(pte_ptl);
>>      } else {
>>              result =3D SCAN_NO_PTE_TABLE;
>>      }
>>
>>      if (unlikely(result !=3D SCAN_SUCCEED)) {
>> -            if (pte)
>> -                    pte_unmap(pte);
>>              spin_lock(pmd_ptl);
>> -            BUG_ON(!pmd_none(*pmd));
>> +            WARN_ON_ONCE(!pmd_none(*pmd));
>
> Why was this turned into WARN_ON_ONCE? Would be good to add to commit mes=
sage
> what the reason is if it has been discussed earlier.
>
> The next line writes a PMD entry over an existing one =E2=80=94 that leak=
s the
> previous page table or PMD-mapped folio and can corrupt VA mappings. BUG_=
ON
> failed loudly and safely; WARN_ON_ONCE continues into the corruption and =
falls
> silent after the first hit.

Discussed here:
https://lore.kernel.org/lkml/c781ec19-724b-4c00-9ad6-56b9733cefa0@lucifer.l=
ocal/

But yes im more so on your side that id rather crash the system then
warn if we are potentially corrupting things in memory.

@lorenzo and @david can we come to a definitive consensus on this?

>
>
>>              /*
>>               * We can only use set_pmd_at when establishing
>>               * hugepmds and never for establishing regular pmds that
>> @@ -1313,21 +1305,24 @@ static enum scan_result collapse_huge_page(struc=
t mm_struct *mm, unsigned long a
>>               */
>>              pmd_populate(mm, pmd, pmd_pgtable(_pmd));
>>              spin_unlock(pmd_ptl);
>> -            anon_vma_unlock_write(vma->anon_vma);
>>              goto out_up_write;
>>      }
>>
>>      /*
>> -     * All pages are isolated and locked so anon_vma rmap
>> -     * can't run anymore.
>> +     * For PMD collapse all pages are isolated and locked so anon_vma
>> +     * rmap can't run anymore. For mTHP collapse the PMD entry has been
>> +     * removed and not all pages are isolated and locked, so we must ho=
ld
>> +     * the lock to prevent neighboring folios from attempting to access
>> +     * this PMD until its reinstalled.
>>       */
>> -    anon_vma_unlock_write(vma->anon_vma);
>> +    if (is_pmd_order(order)) {
>> +            anon_vma_unlock_write(vma->anon_vma);
>> +            anon_vma_locked =3D false;
>> +    }
>>
>>      result =3D __collapse_huge_page_copy(pte, folio, pmd, _pmd,
>> -                                       vma, address, pte_ptl,
>> -                                       HPAGE_PMD_ORDER,
>> -                                       &compound_pagelist);
>> -    pte_unmap(pte);
>> +                                       vma, start_addr, pte_ptl,
>> +                                       order, &compound_pagelist);
>>      if (unlikely(result !=3D SCAN_SUCCEED))
>>              goto out_up_write;
>>
>> @@ -1337,18 +1332,27 @@ static enum scan_result collapse_huge_page(struc=
t mm_struct *mm, unsigned long a
>>       * write.
>>       */
>>      __folio_mark_uptodate(folio);
>> -    pgtable =3D pmd_pgtable(_pmd);
>> -
>>      spin_lock(pmd_ptl);
>> -    BUG_ON(!pmd_none(*pmd));
>> -    pgtable_trans_huge_deposit(mm, pmd, pgtable);
>> -    map_anon_folio_pmd_nopf(folio, pmd, vma, address);
>> +    WARN_ON_ONCE(!pmd_none(*pmd));
>> +    if (is_pmd_order(order)) { /* PMD collapse */
>> +            pgtable =3D pmd_pgtable(_pmd);
>> +            pgtable_trans_huge_deposit(mm, pmd, pgtable);
>> +            map_anon_folio_pmd_nopf(folio, pmd, vma, pmd_addr);
>> +    } else { /* mTHP collapse */
>> +            map_anon_folio_pte_nopf(folio, pte, vma, start_addr, /*uffd=
_wp=3D*/ false);
>
> map_anon_folio_pte_nopf calls set_ptes and modifies pagetable, while hold=
ing
> pmd_ptl only. It should be safe as we expect pmd_none. But I think you sh=
ould
> put a comment about this?

Yeah doesnt hurt. Ill try to clarify that.


>
>
>> +            smp_wmb(); /* make PTEs visible before PMD. See pmd_install=
() */
>> +            pmd_populate(mm, pmd, pmd_pgtable(_pmd));
>> +    }
>>      spin_unlock(pmd_ptl);
>>
>>      folio =3D NULL;
>>
>>      result =3D SCAN_SUCCEED;
>>   out_up_write:
>> +    if (anon_vma_locked)
>> +            anon_vma_unlock_write(vma->anon_vma);
>> +    if (pte)
>> +            pte_unmap(pte);
>>      mmap_write_unlock(mm);
>>   out_nolock:
>>      if (folio)
>> @@ -1525,8 +1529,15 @@ static enum scan_result collapse_scan_pmd(struct =
mm_struct *mm,
>>   out_unmap:
>>      pte_unmap_unlock(pte, ptl);
>>      if (result =3D=3D SCAN_SUCCEED) {
>> +            /*
>> +             * Before allocating the hugepage, release the mmap_lock re=
ad lock.
>> +             * The allocation can take potentially a long time if it in=
volves
>> +             * sync compaction, and we do not need to hold the mmap_loc=
k during
>> +             * that. We will recheck the vma after taking it again in w=
rite mode.
>> +             */
>> +            mmap_read_unlock(mm);
>>              result =3D collapse_huge_page(mm, start_addr, referenced,
>> -                                        unmapped, cc);
>> +                                        unmapped, cc, HPAGE_PMD_ORDER);
>>              /* collapse_huge_page will return with the mmap_lock releas=
ed */
>>              *lock_dropped =3D true;
>>      }
>> --
>> 2.53.0
>>
>>
>


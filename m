Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ABE3EDABB
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 19:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860861; cv=none; b=haneYV8Zp00g4ggikr30O67yup8+vRX9omxwzK8eUPTwDoOVsYXsABcZ2ldF251+eMIhhxKDkbULiYguyFKl9SPMQvn2E30E9B8JFmH9AxfqeL93ApFD0ZLydBa6g+Z1CZM63Jco0OOKu9I0L7SUJKVAt7a92Au002uWj/Es09I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860861; c=relaxed/simple;
	bh=bjBP+5pv9q2khBiY6QNLhppdPiTu1grx2pp5fu1Tnys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y25K833AvYKPtNiT89BBNgyL+dKyZe/yT8Oonbw4/ft5f+FbdChWfuaqpP4b/knjRJzqV6Zx1XVPIJ1bZ1AG5RreQHKjTPBqhCeuEvdk2lni9dCrJTISTpKlCauHNRhndqVzyVQKIra45Cmqhu2oTU3StZ4/2WhmYIWeoYM8yPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i3ImtLCd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=REiU9sJN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i3ImtLCd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="REiU9sJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773860859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WixAoxfcL5jhhT83Dfur4OdwyV5TsF5FITSYI32Dans=;
	b=i3ImtLCdmHyTHoCBnkIYMQ8TKml9iSxPWpDAfdbjvEuAypcEj5WA6vWIJ9xrrtZbMEhykr
	Es9xVNw8o77vuDGTrK+9QiWAvznDGmG67ydWHcc0qNS5tyJHjcVTFFN1LwsQO/yb94SAW6
	PxkYUZZaK4AYKun0cPN05IP8fMGccrg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-9u2KX5RTPjyFdinhKSTj6g-1; Wed, 18 Mar 2026 15:07:37 -0400
X-MC-Unique: 9u2KX5RTPjyFdinhKSTj6g-1
X-Mimecast-MFC-AGG-ID: 9u2KX5RTPjyFdinhKSTj6g_1773860857
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c517e405dso17900666d6.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 12:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773860857; x=1774465657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WixAoxfcL5jhhT83Dfur4OdwyV5TsF5FITSYI32Dans=;
        b=REiU9sJNtsK7MwlTu6n+LvxvIe8bygkHoFN9rKOPAfnl1sPQsuHBtQV1ihdgy8iUhE
         L6BaUWvVDkc/vVVRkQB8lN89i9FudF4k23K4hMx2E9Ce5HlB4xjgAhJwe91Cp9jXZhQT
         s7s8XMQk4crQlTxJLb/xkORIrv0nDloBzontT9zucNx6rN1cbG1zbZ0+IaoTyXeyBFn/
         bWK09MzRg/IwHqUBU65V9lEWJvq/Pf8Sla9BaW9Q078eOnPnQAgoJ3crFL2Fj8TWS7lC
         pQbCn2Qz5gWYk4HrME+JHSU69An2ZoPh6i9H0kxdWzrAF5vjqXwxR+Nu6R1ZoLdN9Bs3
         Vw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860857; x=1774465657;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WixAoxfcL5jhhT83Dfur4OdwyV5TsF5FITSYI32Dans=;
        b=HKe+5FzzlssR1DKPHxqxdUQgoUzkeqxzjzDK/gdAsSi+sjAWGjUfsPGM+cfskV1N7v
         Z//KOIQZZVtVQKM0tnK/rjHAhhVLhu8hhTRuVfyezurSczysnoxE4awZvYQLBd3D+8p2
         1eWurs5u9ygad8lwLoBG1SK4LGL1AlgBSE0PJ03amh42nr1/LmA0HdiuNy6DtWUIy18J
         3iCCM5x8+uakjx3PUGWpvtAIrNFsko7hV75m+NV42IpgB7j0o6hwE+4c0eiRnErwkLgr
         dYJbX0dX2LeA236pTEQ01bEn5iwwiphGK2/NQuQYPZATaDo7eY0mu3mZ4dq0fvqHw/1W
         W3+Q==
X-Gm-Message-State: AOJu0YxBH2rOiQh99ThZ6tlXwU2r5KBu+avfpk6ZJGD3u98I84i3hezC
	1QrDEE/+RqPDAq6eb+TtEJT5JfjJEGKh53fYPr5x2n/81qpoPF7S0uPX/EtCf8lfHFn+I0yNytr
	k08kTsA1NWXQfvZSqHn23j2OsAg4/QFwbtloumh0S5XQVgxkSkDEn47o70FXZsQ==
X-Gm-Gg: ATEYQzy9dSP3+VX37++nrqtbNEoUcyemV8nL7lquI/fcL9I+8o7+MUtmwJWkeFsxpmF
	Idpm/9h4zzUbt2WaZpm/GutccFjELqEUm0aBDDCiZ/IsI3nkxlWczY6o6E9y8DNRupkgO2Y1/MH
	mJ7A0Ebq0YYyqSXtAeaKzSEHTUSS+Bkc2u27boLkUGL3Ui/5RaHaxkptosrBR7UvbjeEsUP6Lx9
	VMfk02nqNkoXvXqM3KtRlaY6SVsDMa7quwB3SXbXAhp+h9sdx1lTbYSl1Cl6rnmJzf64v8rRpkJ
	dbqvSYTVLKyBEueaaj9z3Eh8MbD3TzXyzjX12TO+JEUZ3JKmv/eTK8DD7TLLwcNPS+Bs06D1yIe
	LuhPIqFV/ptd6z4SvEzicN8xDANOabEboAQzHGY7dx6x3ZOeNtNVOjEhe4+P+
X-Received: by 2002:a0c:f08f:0:b0:899:fb4e:47aa with SMTP id 6a1803df08f44-89c6b557273mr60066366d6.39.1773860856740;
        Wed, 18 Mar 2026 12:07:36 -0700 (PDT)
X-Received: by 2002:a0c:f08f:0:b0:899:fb4e:47aa with SMTP id 6a1803df08f44-89c6b557273mr60065406d6.39.1773860856280;
        Wed, 18 Mar 2026 12:07:36 -0700 (PDT)
Received: from [192.168.10.111] (c-76-154-99-94.hsd1.co.comcast.net. [76.154.99.94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c6b9e9babsm25191566d6.38.2026.03.18.12.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 12:07:35 -0700 (PDT)
Message-ID: <587c8b0c-3004-49ee-a2eb-ef74aa8c4abb@redhat.com>
Date: Wed, 18 Mar 2026 13:07:31 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-unstable v15 12/13] mm/khugepaged: run khugepaged for
 all orders
To: Lance Yang <lance.yang@linux.dev>, baolin.wang@linux.alibaba.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com,
 akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com,
 baohua@kernel.org, byungchul@sk.com, catalin.marinas@arm.com, cl@gentwo.org,
 corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org,
 dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com,
 jack@suse.cz, jackmanb@google.com, jannh@google.com, jglisse@google.com,
 joshua.hahnjy@gmail.com, kas@kernel.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, mathieu.desnoyers@efficios.com,
 matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com,
 peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com,
 rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com,
 rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com,
 shivankg@amd.com, sunnanyong@huawei.com, surenb@google.com,
 thomas.hellstrom@linux.intel.com, tiwai@suse.de, usamaarif642@gmail.com,
 vbabka@suse.cz, vishal.moola@gmail.com, wangkefeng.wang@huawei.com,
 will@kernel.org, willy@infradead.org, yang@os.amperecomputing.com,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com
References: <20260226032650.234386-1-npache@redhat.com>
 <20260317113611.94006-1-lance.yang@linux.dev>
From: Nico Pache <npache@redhat.com>
Content-Language: en-US, en-ZM
In-Reply-To: <20260317113611.94006-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/17/26 5:36 AM, Lance Yang wrote:
> 
> On Wed, Feb 25, 2026 at 08:26:50PM -0700, Nico Pache wrote:
>> From: Baolin Wang <baolin.wang@linux.alibaba.com>
>>
>> If any order (m)THP is enabled we should allow running khugepaged to
>> attempt scanning and collapsing mTHPs. In order for khugepaged to operate
>> when only mTHP sizes are specified in sysfs, we must modify the predicate
>> function that determines whether it ought to run to do so.
>>
>> This function is currently called hugepage_pmd_enabled(), this patch
>> renames it to hugepage_enabled() and updates the logic to check to
>> determine whether any valid orders may exist which would justify
>> khugepaged running.
>>
>> We must also update collapse_allowable_orders() to check all orders if
>> the vma is anonymous and the collapse is khugepaged.
>>
>> After this patch khugepaged mTHP collapse is fully enabled.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Signed-off-by: Nico Pache <npache@redhat.com>
>> ---
>> mm/khugepaged.c | 30 ++++++++++++++++++------------
>> 1 file changed, 18 insertions(+), 12 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 388d3f2537e2..e8bfcc1d0c9a 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -434,23 +434,23 @@ static inline int collapse_test_exit_or_disable(struct mm_struct *mm)
>> 		mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm);
>> }
>>
>> -static bool hugepage_pmd_enabled(void)
>> +static bool hugepage_enabled(void)
>> {
>> 	/*
>> 	 * We cover the anon, shmem and the file-backed case here; file-backed
>> 	 * hugepages, when configured in, are determined by the global control.
>> -	 * Anon pmd-sized hugepages are determined by the pmd-size control.
>> +	 * Anon hugepages are determined by its per-size mTHP control.
>> 	 * Shmem pmd-sized hugepages are also determined by its pmd-size control,
>> 	 * except when the global shmem_huge is set to SHMEM_HUGE_DENY.
>> 	 */
>> 	if (IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) &&
>> 	    hugepage_global_enabled())
>> 		return true;
>> -	if (test_bit(PMD_ORDER, &huge_anon_orders_always))
>> +	if (READ_ONCE(huge_anon_orders_always))
>> 		return true;
>> -	if (test_bit(PMD_ORDER, &huge_anon_orders_madvise))
>> +	if (READ_ONCE(huge_anon_orders_madvise))
>> 		return true;
>> -	if (test_bit(PMD_ORDER, &huge_anon_orders_inherit) &&
>> +	if (READ_ONCE(huge_anon_orders_inherit) &&
>> 	    hugepage_global_enabled())
>> 		return true;
>> 	if (IS_ENABLED(CONFIG_SHMEM) && shmem_hpage_pmd_enabled())
>> @@ -521,8 +521,14 @@ static unsigned int collapse_max_ptes_none(unsigned int order)
>> static unsigned long collapse_allowable_orders(struct vm_area_struct *vma,
>> 			vm_flags_t vm_flags, bool is_khugepaged)
>> {
>> +	unsigned long orders;
>> 	enum tva_type tva_flags = is_khugepaged ? TVA_KHUGEPAGED : TVA_FORCED_COLLAPSE;
>> -	unsigned long orders = BIT(HPAGE_PMD_ORDER);
>> +
>> +	/* If khugepaged is scanning an anonymous vma, allow mTHP collapse */
>> +	if (is_khugepaged && vma_is_anonymous(vma))
>> +		orders = THP_ORDERS_ALL_ANON;
>> +	else
>> +		orders = BIT(HPAGE_PMD_ORDER);
>>
>> 	return thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
>> }
> 
> IIUC, an anonymous VMA can pass collapse_allowable_orders() even if it
> is smaller than 2MB ...
> 
> But collapse_scan_mm_slot() still scans only full PMD-sized windows:
> 
> 		hstart = round_up(vma->vm_start, HPAGE_PMD_SIZE);
> 		hend = round_down(vma->vm_end, HPAGE_PMD_SIZE);
> 		if (khugepaged_scan.address > hend) {
> 			cc->progress++;
> 			continue;
> 		}
> 
> and hugepage_vma_revalidate() still requires PMD suitability:
> 
> 	/* Always check the PMD order to ensure its not shared by another VMA */
> 	if (!thp_vma_suitable_order(vma, address, PMD_ORDER))
> 		return SCAN_ADDRESS_RANGE;
> 
> 
>> @@ -531,7 +537,7 @@ void khugepaged_enter_vma(struct vm_area_struct *vma,
>> 			  vm_flags_t vm_flags)
>> {
>> 	if (!mm_flags_test(MMF_VM_HUGEPAGE, vma->vm_mm) &&
>> -	    hugepage_pmd_enabled()) {
>> +	    hugepage_enabled()) {
>> 		if (collapse_allowable_orders(vma, vm_flags, /*is_khugepaged=*/true))
>> 			__khugepaged_enter(vma->vm_mm);
> 
> I wonder if we should also require at least one PMD-sized scan window
> here? Not a big deal, just might be good to tighten the gate a bit :)

IIUC, you are worried that we are operating on VMAs smaller than a PMD?
thp_vma_allowable_orders should guard from that via thp_vma_suitable. the
revalidation also checks this in hugepage_vma_revalidate() and is the reason we
must leave the suitable_order check in revalidate() checking the PMD_ORDER than
than the attempted collapse order.

lmk if that clears things up!

Thanks
-- Nico

> 
> Apart from that, LGTM!
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> 


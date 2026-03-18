Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3856368965
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 19:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860557; cv=none; b=PZkdzki69kXC9xKSgREugTJmroaisH7F0NYno0NOHcbdLSt4nGm4dzv70zX04wyY1E4ApVvtYPI0fkt3VLwnvUD8NpYiKX2WtSP1exSvX3wvzilaf/TBmE4KASjfI0rEpj9alIShkF8jrqlvVMmAf8ndeGSvsCN0XMALCnwBQZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860557; c=relaxed/simple;
	bh=aAgozX4R+IZyqKAXRD7JlxsV9lv1s+K8McpE21VRhPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhCAKwVFRIm5HcTJsxr3tLWqJtX43L3BTQSO8i5cfwtIQKdsRGV/piJcalhv2vKAx7gf0R9Cp8WyIKWDgegBasmwWi2YKBbcaGTmDdoLCLPCLlJ1scpZCChvoFuToxtSYa1aUwwuzgGXP8lxiIZhyWeQjCSEUyTnA1EoI2UV1qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y6FoBjCm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AT2Ps/Wv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y6FoBjCm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AT2Ps/Wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773860554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g357sMeT7BRwzLdbf5CPPDzwji1TblDvyv5xWwQUqo4=;
	b=Y6FoBjCmMud04efLGk1k+8ccAJqt77wj6gHtdxVsXh3Shlvnj3DhfH1Ou7+p+0/ho4Rjh9
	obll5YmRsm7F7Nc5nzGODJWEZZwVZ5YQYYoCBmM6JSuzPIPI+xUW6RhjZuSoMAOQk0r0q/
	PDnZOHawPNtmX32wjW8VsrRGpMsgeOk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-W-F-n8jBNgaDDmJwW_oZOA-1; Wed, 18 Mar 2026 15:02:33 -0400
X-MC-Unique: W-F-n8jBNgaDDmJwW_oZOA-1
X-Mimecast-MFC-AGG-ID: W-F-n8jBNgaDDmJwW_oZOA_1773860552
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd80bea54dso123254285a.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 12:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773860552; x=1774465352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g357sMeT7BRwzLdbf5CPPDzwji1TblDvyv5xWwQUqo4=;
        b=AT2Ps/WviALoc72UTH6zqkxOCh6k4ctm2YSVk/dhENkf72xYiYqPCBqEpxO93z1Eq4
         aTNZ1mWluOdYI4OkUf94nWnT5+ZYzCBtlDeDuuprSmmOOEZv4FAGD1JTMpOELEnEQ974
         FvxKJPVwWwIkuyKSfjMQUUptoelLorpBBX4i8J8wZ/+1wnDQ9YoCcECiv/WCwumTNfDs
         1DvXkmqH70sZ27/NP7sL5w19Uv0FfSDliVTxF/YVNhJpSi8WETQrOAb7JrycNEsc00MW
         MgMPIXEJiBnxmAtEPkfXyRicwqxSfm4R4YsuT2ricdR6lWtQPCHUcqJ0pM4sa3CVvBMj
         BMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860552; x=1774465352;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g357sMeT7BRwzLdbf5CPPDzwji1TblDvyv5xWwQUqo4=;
        b=bQHs8AcHFZFvP0vwsW61aHfAWWGWi5U9Y5lKj2BnuGZmkI7ZM4UPiLtbfCn4MMWpbE
         q3ErZcWmrGEp0VN037KVgzZ6tk209ru7bWHe6YAi6WAY2XkMUjDvT1troWuUXuuA7h9v
         2olvDKUu3Alq0vxFPoFrT84NyaR06vMz/i7egA1I53hNHsD/Cuvq+thPddkLXqYLTq2A
         HJjIHuISEMz9QHKJTRWB2RjQM/d2/TLEcu68nJALNiI1TaDa5iFGlNZxCHf6/jD1KrUm
         jBte+mQjBcDGriKkFapj23rskFtFhVi7stfmuPF7qItYQh6/PMOlwfYdOhW6vH2QQ2Df
         WVIQ==
X-Gm-Message-State: AOJu0Yw+0PjKv+e4CR9ZqrOeQjVaqSg+NFQraUP0YdKkNy3vw78T3a5w
	irqNXyFiHlAKJilxp2zYp8h/R8CosoIX5jkGA2sC8vAthkJxSzzWARFus6dev2eyUy6q9sAsubC
	257zC7DtIHs2T26tg7Vn6tlVDLkBgcVhgzGe464zbFNtpXTvxERTz486KE87Rrw==
X-Gm-Gg: ATEYQzyiCYu1d5XNRnB/6QU+sm8rjoAypEWPALei6bDRbwfDjAdTSg42GY2FAWJPiK8
	aEU0IQMgp1+9Lu1L6SdrWjTs0EKiaLACk/mzZ3q/aZL5CnX9kWr0yQD/O+ypYDhnTL7mH0k4oW1
	trPHWmr8lE6qJVd5UI3ymdnuHLBBiZT/mhsT3VlHtDSKK8x02sLYnUSU6MtaXnLifSDHnPHKQau
	OTdRDjI/3S0Aj0X1aOxVS5PevHZ5zdAxJId398HO/4TEEv8E7NRaG83dVHr+9YSzzYd1AhwyxrT
	5KSiZvK/+M95hUKEi+KPxoY330dTwtCJi/YmreJ6y5NXBsS9OzcVQ8UmXHkm864tJRF2/0xglzd
	DLrWlCeK8+sK7lmf12oDdtwMxc4HjlSP68maYjpsR91DYn9OAfkKLPr8ZZ9yR
X-Received: by 2002:a05:620a:2682:b0:8cd:7811:941c with SMTP id af79cd13be357-8cfad35822cmr628908085a.54.1773860552310;
        Wed, 18 Mar 2026 12:02:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:8cd:7811:941c with SMTP id af79cd13be357-8cfad35822cmr628895485a.54.1773860551581;
        Wed, 18 Mar 2026 12:02:31 -0700 (PDT)
Received: from [192.168.10.111] (c-76-154-99-94.hsd1.co.comcast.net. [76.154.99.94])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfad162839sm260663285a.25.2026.03.18.12.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 12:02:31 -0700 (PDT)
Message-ID: <4a1e2d0a-1b8e-4850-bb8b-465841aa7779@redhat.com>
Date: Wed, 18 Mar 2026 13:02:26 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-unstable v15 12/13] mm/khugepaged: run khugepaged for
 all orders
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com,
 akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com,
 catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net,
 dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com,
 gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz,
 jackmanb@google.com, jannh@google.com, jglisse@google.com,
 joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 mathieu.desnoyers@efficios.com, matthew.brost@intel.com,
 mhiramat@kernel.org, mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de,
 rakie.kim@sk.com, raquini@redhat.com, rdunlap@infradead.org,
 richard.weiyang@gmail.com, rientjes@google.com, rostedt@goodmis.org,
 rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com,
 sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com,
 tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz,
 vishal.moola@gmail.com, wangkefeng.wang@huawei.com, will@kernel.org,
 willy@infradead.org, yang@os.amperecomputing.com,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com
References: <20260226031741.230674-1-npache@redhat.com>
 <20260226032650.234386-1-npache@redhat.com>
 <a74178af-54f3-44ba-a007-4eaf49e40ab3@lucifer.local>
From: Nico Pache <npache@redhat.com>
Content-Language: en-US, en-ZM
In-Reply-To: <a74178af-54f3-44ba-a007-4eaf49e40ab3@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/17/26 4:58 AM, Lorenzo Stoakes (Oracle) wrote:
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
> 
> This looks good to me, so:
> 
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Thanks!

> 
>> ---
>>  mm/khugepaged.c | 30 ++++++++++++++++++------------
>>  1 file changed, 18 insertions(+), 12 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 388d3f2537e2..e8bfcc1d0c9a 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -434,23 +434,23 @@ static inline int collapse_test_exit_or_disable(struct mm_struct *mm)
>>  		mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm);
>>  }
>>
>> -static bool hugepage_pmd_enabled(void)
>> +static bool hugepage_enabled(void)
>>  {
>>  	/*
>>  	 * We cover the anon, shmem and the file-backed case here; file-backed
>>  	 * hugepages, when configured in, are determined by the global control.
>> -	 * Anon pmd-sized hugepages are determined by the pmd-size control.
>> +	 * Anon hugepages are determined by its per-size mTHP control.
> 
> Well also PMD right? I mean this terminology sucks because in a sense mTHP
> includes PMD... :)

yeah kinda hard with our verbiage being so broad and overlapping some times.

> 
>>  	 * Shmem pmd-sized hugepages are also determined by its pmd-size control,
>>  	 * except when the global shmem_huge is set to SHMEM_HUGE_DENY.
>>  	 */
>>  	if (IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) &&
>>  	    hugepage_global_enabled())
>>  		return true;
>> -	if (test_bit(PMD_ORDER, &huge_anon_orders_always))
>> +	if (READ_ONCE(huge_anon_orders_always))
>>  		return true;
>> -	if (test_bit(PMD_ORDER, &huge_anon_orders_madvise))
>> +	if (READ_ONCE(huge_anon_orders_madvise))
>>  		return true;
>> -	if (test_bit(PMD_ORDER, &huge_anon_orders_inherit) &&
>> +	if (READ_ONCE(huge_anon_orders_inherit) &&
>>  	    hugepage_global_enabled())
>>  		return true;
>>  	if (IS_ENABLED(CONFIG_SHMEM) && shmem_hpage_pmd_enabled())
>> @@ -521,8 +521,14 @@ static unsigned int collapse_max_ptes_none(unsigned int order)
>>  static unsigned long collapse_allowable_orders(struct vm_area_struct *vma,
>>  			vm_flags_t vm_flags, bool is_khugepaged)
>>  {
>> +	unsigned long orders;
>>  	enum tva_type tva_flags = is_khugepaged ? TVA_KHUGEPAGED : TVA_FORCED_COLLAPSE;
>> -	unsigned long orders = BIT(HPAGE_PMD_ORDER);
>> +
>> +	/* If khugepaged is scanning an anonymous vma, allow mTHP collapse */
>> +	if (is_khugepaged && vma_is_anonymous(vma))
>> +		orders = THP_ORDERS_ALL_ANON;
>> +	else
>> +		orders = BIT(HPAGE_PMD_ORDER);
>>
>>  	return thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
>>  }
>> @@ -531,7 +537,7 @@ void khugepaged_enter_vma(struct vm_area_struct *vma,
>>  			  vm_flags_t vm_flags)
>>  {
>>  	if (!mm_flags_test(MMF_VM_HUGEPAGE, vma->vm_mm) &&
>> -	    hugepage_pmd_enabled()) {
>> +	    hugepage_enabled()) {
>>  		if (collapse_allowable_orders(vma, vm_flags, /*is_khugepaged=*/true))
>>  			__khugepaged_enter(vma->vm_mm);
>>  	}
>> @@ -2929,7 +2935,7 @@ static unsigned int collapse_scan_mm_slot(unsigned int pages, enum scan_result *
>>
>>  static int khugepaged_has_work(void)
>>  {
>> -	return !list_empty(&khugepaged_scan.mm_head) && hugepage_pmd_enabled();
>> +	return !list_empty(&khugepaged_scan.mm_head) && hugepage_enabled();
>>  }
>>
>>  static int khugepaged_wait_event(void)
>> @@ -3002,7 +3008,7 @@ static void khugepaged_wait_work(void)
>>  		return;
>>  	}
>>
>> -	if (hugepage_pmd_enabled())
>> +	if (hugepage_enabled())
>>  		wait_event_freezable(khugepaged_wait, khugepaged_wait_event());
>>  }
>>
>> @@ -3033,7 +3039,7 @@ static void set_recommended_min_free_kbytes(void)
>>  	int nr_zones = 0;
>>  	unsigned long recommended_min;
>>
>> -	if (!hugepage_pmd_enabled()) {
>> +	if (!hugepage_enabled()) {
>>  		calculate_min_free_kbytes();
>>  		goto update_wmarks;
>>  	}
>> @@ -3083,7 +3089,7 @@ int start_stop_khugepaged(void)
>>  	int err = 0;
>>
>>  	mutex_lock(&khugepaged_mutex);
>> -	if (hugepage_pmd_enabled()) {
>> +	if (hugepage_enabled()) {
>>  		if (!khugepaged_thread)
>>  			khugepaged_thread = kthread_run(khugepaged, NULL,
>>  							"khugepaged");
>> @@ -3109,7 +3115,7 @@ int start_stop_khugepaged(void)
>>  void khugepaged_min_free_kbytes_update(void)
>>  {
>>  	mutex_lock(&khugepaged_mutex);
>> -	if (hugepage_pmd_enabled() && khugepaged_thread)
>> +	if (hugepage_enabled() && khugepaged_thread)
>>  		set_recommended_min_free_kbytes();
>>  	mutex_unlock(&khugepaged_mutex);
>>  }
>> --
>> 2.53.0
>>
> 


Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E2A3E6DD0
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001426; cv=none; b=NumZmuZhfH61oFhyUAPfNp2EhqWv6ZiHZSelvdnIBEhcQyJT8aU6foqcV0ZCfe+pG0hCOAXwCUvSp+JkI34lSPabu0iIK74a8Vqo6AIBCyTbiS04kPdXSJWdlhqI3TVMXjXhWssgocNbptwiOAnJ4WP6DJRNJApoZWye/EtsWos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001426; c=relaxed/simple;
	bh=6SUKSJTLXATU6iPS+hpKhJ7YFA9CUvj9MoM3hqwlMW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCOs4ws9+fmRhQz0vqRX66mT5tSN36u+mFurHQLKWJ/6dkGAXekq0CgyJ8fo1vXeM+QtnP78/3UC3/kA99KSaGhFrybkXvDruyGfyM1/UQ3LBujnMl4H+NVdQ7pLyrq+IBXMXhbF3pkm5CTZy6Pr5IWthYFUnAyq1047nZBjog8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OxFA9un9; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OxFA9un9"
Message-ID: <7e36f7f0-b4d5-41c9-b399-9e0079907d33@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781001411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/rAkLlXIlXwRgQb+cLefFBf2z5QC1/Z0DCE0BETG/c=;
	b=OxFA9un9vu0GW542DvVoiEKSZvKgU8m+pFneJhMgeukhwmrYt4Cnz+zD/9qEHska0Zm+it
	w02Mufbjx8vAI7xkfWKQ6k/fxd+dKq5O+h1nA+/pRzFEhofRlBQPjXC2b9LO+W1mqNpYo6
	Ly/xyxg1oW+1zQouZxts70DutOiLlr4=
Date: Tue, 9 Jun 2026 18:36:20 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH mm-unstable v19 11/14] mm/khugepaged: Introduce mTHP
 collapse support
Content-Language: en-US
To: Nico Pache <npache@redhat.com>, "David Hildenbrand (Arm)"
 <david@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com,
 akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com,
 catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net,
 dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net,
 hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com,
 jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com,
 kas@kernel.org, liam@infradead.org, ljs@kernel.org,
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
References: <20260605161422.213817-12-npache@redhat.com>
 <20260606102800.26940-1-lance.yang@linux.dev>
 <2553caae-9e0e-42a7-8b61-d1216f1e81fa@kernel.org>
 <CAA1CXcBY_2372eJru8VoCq90rUMxn7w23hHou68MmXRv48NRXg@mail.gmail.com>
 <b7fb4184-7a99-42c7-8ee2-4c7fa20827c4@kernel.org>
 <CAA1CXcAhw8V+_dYcrqmtZ9ht4Pqz5PPB8EOcDrVCp4DA4y7pLg@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAA1CXcAhw8V+_dYcrqmtZ9ht4Pqz5PPB8EOcDrVCp4DA4y7pLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2026/6/9 17:32, Nico Pache wrote:
> On Tue, Jun 9, 2026 at 3:26 AM David Hildenbrand (Arm) <david@kernel.org> wrote:
>>
>> On 6/9/26 11:06, Nico Pache wrote:
>>> On Mon, Jun 8, 2026 at 8:57 AM David Hildenbrand (Arm) <david@kernel.org> wrote:
>>>>
>>>> On 6/6/26 12:28, Lance Yang wrote:
>>>>>
>>>>>
>>>>> Looks broken for swap PTEs in PMD collapse ...
>>>>>
>>>>> collapse_scan_pmd() allows them up to max_ptes_swap and record them in
>>>>> unmapped, but they don't get a bit in mthp_present_ptes. And then
>>>>> mthp_collapse() does the check above:
>>>>
>>>> Right. I assumed this is implicitly handled by the optimization in collapse_scan_pmd:
>>>>
>>>>          if (enabled_orders != BIT(HPAGE_PMD_ORDER))
>>>>                  max_ptes_none = KHUGEPAGED_MAX_PTES_LIMIT;
>>>>
>>>> But we perform the check a second time.
>>>>
>>>>>
>>>>> nr_occupied_ptes >= nr_ptes - max_ptes_none
>>>>>
>>>>> So max_ptes_none=0 + 511 present PTEs + one allowed swap PTE won't even
>>>>> call collapse_huge_page() for PMD order.
>>>>>
>>>>> Shouldn't we account for them in the PMD-order check? Something like:
>>>>>
>>>>> if (is_pmd_order(order))
>>>>>        nr_occupied_ptes += unmapped;
>>>
>>> This solution seems good for a temporary fixup. but longterm we may
>>> want something else. I'm still not sure how we plan on supporting
>>> swapin without causing creep. So I'd be ok with adding a fix for
>>> legacy PMD behavior until we know how to handle mTHP creep correctly.
>>>
>>>> As an alternative, we could either 1) skip the check there for
>>>> pmd order (as the check was already done); or 2) introduce+maintain
>>>> a bitmap that tracks non-present PTEs.
>>>>
>>>> @@ -1475,7 +1477,9 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
>>>>                  nr_occupied_ptes = bitmap_weight_from(cc->mthp_present_ptes, offset,
>>>>                                                        offset + nr_ptes);
>>>>
>>>> -               if (nr_occupied_ptes >= nr_ptes - max_ptes_none) {
>>>> +               /* Check was already done in the caller. */
>>>> +               if (is_pmd_order(order) ||
>>>> +                   nr_occupied_ptes >= nr_ptes - max_ptes_none) {
>>>>                          enum scan_result ret;
>>>>
>>>>                          collapse_address = address + offset * PAGE_SIZE;
>>>>
>>>> 2) would probably be cleanest long-term.
>>>
>>> That would be best for future swapin support in mTHP, but I still
>>> don't think it solves the creep issue.
>>
>> It wouldn't, we'd simply maintain the state we collect + rely on in separate
>> bitmaps. On swapin, we'd have to update/refresh bitmaps I guess.
> 
> Yeah, I'm saying for the future, it obviously solves this issue here
> as well, but if we have positional tracking of the swapout, shared,
> and none PTEs, I think we can use this to determine whether the
> collapse would lead to creep. If we detect creep would happen it may
> be best to automatically collapse to the N+1 (or greater) candidate.
> Just thinking outloud here.
> 
>>
>>> Perhaps we could combine the
>>> two bitmaps to determine if it would make the future collapse eligible
>>> again? Not sure but ill start thinking about it.
>>>
>>> Should I send a fixup for this using Lance's solution? Or does Lance
>>> want to send a patch out with the fixes tag?
>>
>> If Lance could send a fixup, explaining the situation, that would be nice.

Sure, happy to send a fixup :P

Should I send it as a fixup to be folded into this patch, or as a
separate patch with a Fixes: tag?

Will get one out soon :)

> OK, I'd appreciate that :)

Cheers!


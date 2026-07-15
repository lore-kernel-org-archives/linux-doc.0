Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E162BDC26;
	Wed, 15 Jul 2026 06:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096985; cv=none; b=jY6AfT2JQI/TJluqeC5+1i40OLpo/iFbL3sfmhkkZzJd+8Fxal4VdYGvHSRbfIpca+Ul6B7EJWNsN4wwlPV68eDn3Zay5ava4Lhtf5PnBRJGtPu54GxN+DxaTRTLf5xGWswoLEqLFn5cS45RefbII4yVpF8uw3flZ5/KDWdCiYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096985; c=relaxed/simple;
	bh=u2sF7fL48h+ihp86JzF53Ux7Ty7qYSG7n5VfFl8TZXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JXNWiQ6K1GiOSIkmFBABClY88PfmilY7aKyVDisoO0IFXR4ruKAIKInW3qf0IgbjZ3O3yNikA7eT+EzM9RUAE8toFns7Csg101pR43ox740aUQiVLqCUIawPBw81EGr12vrDGd6dROOG+ojr9rf+O0CD6pvMpaVOqk6D/olm4p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=h/LKNMKO; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="h/LKNMKO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784096978; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Nh7v7Wtu7DNyJmtpITxm7xYwuK7uHIFpoHg4I8VXurU=;
	b=h/LKNMKOkQlZ725D/aKZcVC82cSBk1+SrP+upowIx1BLL9aeB3ZA+M0hO5Y5PTHPRgFFZK5cyIODw8QxKYDDB4dpOWhoBzZUJw9Ehp559ncgHh+8Ka6YgErZDmcEv1Ye04fBj3OgwBvDoco6yYZ8eK/TlbtC695ejrSbf7BNQQ0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X786JOs_1784096975;
Received: from 30.74.144.123(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X786JOs_1784096975 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Jul 2026 14:29:36 +0800
Message-ID: <e3a24af8-c2db-409a-bdb9-1ad48d89d636@linux.alibaba.com>
Date: Wed, 15 Jul 2026 14:29:35 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] mm/khugepaged: extract young page check into
 collapse_is_young() helper
To: Nico Pache <npache@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260706154500.39178-1-npache@redhat.com>
 <20260706154500.39178-3-npache@redhat.com>
 <62b2bd29-28d2-4440-a970-526dd5d5bbe0@linux.alibaba.com>
 <CAA1CXcD7Mta7y3j20TXjWWfMmmYRSjt5Vq=fbbS=aYWcepppug@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAA1CXcD7Mta7y3j20TXjWWfMmmYRSjt5Vq=fbbS=aYWcepppug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/15/26 2:04 PM, Nico Pache wrote:
> On Fri, Jul 10, 2026 at 1:41 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>>
>>
>> On 7/6/26 11:44 PM, Nico Pache wrote:
>>> The change deduplicates the "is this PTE young enough to count as
>>> referenced" condition that was repeated in both
>>> __collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
>>> a single inline helper function.
>>>
>>> Also move the comment and use it as the function header. While we are at
>>> it, updated the comment to clarify that a young pte is a recently accessed
>>> one.
>>>
>>> Signed-off-by: Nico Pache <npache@redhat.com>
>>> ---
>>>    mm/khugepaged.c | 35 +++++++++++++++++++----------------
>>>    1 file changed, 19 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index b3985b854e77..48b008a3c891 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -675,6 +675,23 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
>>>        }
>>>    }
>>>
>>> +/*
>>> + * collapse_is_young() - Check for enough young pte to justify collapsing
>>> + *
>>> + * If collapse was initiated by khugepaged, check that the page has been
>>> + * recently accessed (young pte) to justify collapsing the page.
>>> + *
>>> + * Return: true if the page has been recently accessed (young pte).
>>> + */
>>> +static inline bool collapse_is_young(struct collapse_control *cc, pte_t pteval,
>>> +     struct folio *folio, struct vm_area_struct *vma, unsigned long addr)
>>> +{
>>> +     return cc->is_khugepaged &&
>>> +            (pte_young(pteval) || folio_test_young(folio) ||
>>> +             folio_test_referenced(folio) ||
>>> +             mmu_notifier_test_young(vma->vm_mm, addr));
>>> +}
>>
>> collapse_is_young() is somewhat confusing to me. Would using
>> 'referenced' be a more appropriate name? collapse_folio_is_referenced()?
> 
> I went with collapse_is_referenced since it also checks the PTE not
> just the folio.
> 
>>
>> Also, it feels odd to put 'cc->is_khugepaged' in a helper whose purpose
>> is to check whether a folio has been accessed. I think this helper
>> should be more self-contained and focused solely on checking whether the
>> folio was accessed.
> 
> While I don't wholeheartedly disagree, the point is to clean up the
> code and abstract some of this logic away from the parent functions. I
> prefer doing the khugepaged check inside this new helper because the
> code is much cleaner.

Sure. I don't have a strong opinion, let's see what others perfer :)

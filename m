Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EE215C0
	for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711602395; cv=none; b=Hr2tLghXRMa6XMQuVZPPDOYijIuNMC0vDyse/4w6FmOy0oYlvEmBqdQK+QKdLWT7hpGFJBUU7GMsFuGy7A136eFDHmc0i3MApjtAkBBPbxVdV8THJ+rC3E9APZY8gGEMGksGUa8QF5psu9vlj1MIQdDqpGQ7DoVtu0XH7QGfMfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711602395; c=relaxed/simple;
	bh=T1SzcXw2Fyv8L/CkFGw0iJY3ZP2A+yAknhSiaOuicxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CzWMIxBzAFZtp4x7pKDzmI+3EEhci7BPkrr4kZlEd/Vrr4DEIQzyNuDSePoEwkwiF1A3DDX57mAZM0u+MsKLVELj9FE17/BZDNWMV5721JLBye1profdv1GR2BlB1L7OFSQIJOZCw9G/Z1aOucuugQUXF3Yf7fE/owqaMQITvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V4rzL3Cynz29lXb;
	Thu, 28 Mar 2024 13:03:42 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id A81391A016F;
	Thu, 28 Mar 2024 13:06:22 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 13:06:22 +0800
Message-ID: <3b29afcd-7c40-44be-8886-72df7336a85f@huawei.com>
Date: Thu, 28 Mar 2024 13:06:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mm: memory_hotplug: use more folio in
 do_migrate_range()
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>, Matthew Wilcox <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>, Miaohe Lin
	<linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, David
 Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>, Hugh
 Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
 <20240327141034.3712697-3-wangkefeng.wang@huawei.com>
 <01BB19DC-3807-4954-A04A-55518301B6BA@nvidia.com>
 <ZgQzPVdfF4lFaqs5@casper.infradead.org>
 <1AF9E259-6189-4558-8929-598679808C06@nvidia.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <1AF9E259-6189-4558-8929-598679808C06@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm100001.china.huawei.com (7.185.36.93)



On 2024/3/27 23:10, Zi Yan wrote:
> On 27 Mar 2024, at 10:54, Matthew Wilcox wrote:
> 
>> On Wed, Mar 27, 2024 at 10:45:42AM -0400, Zi Yan wrote:
>>>>   	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
>>>> -		struct folio *folio;
>>>> +		struct page *page, *head;
>>>
>>> You could get rid of head too. It is only used to calculate next pfn,
>>> so pfn = folio_to_pfn(folio) + folio_nr_pages(folio) - 1 would work.
>>>
>>> And the PageHuge(page) and PageTransHuge(page) can be simplified, since
>>> their pfn calculations are the same. Something like:
>>>
>>> if (folio_test_large(folio)) {
>>> 	pfn = folio_to_pfn(folio) + folio_nr_pages(folio) - 1;
>>> 	if (folio_test_hugetlb(folio)) {
>>> 		isolate_hugetlb(folio, &source);
>>> 		continue;
>>> 	}
>>> }
>>
>> How much of this is safe without a refcount on the folio?
> 
> folio_to_pfn() should be fine, isolate_hugetlb() checks the folio
> under hugetlb_lock, but folio_nr_pages() might return a bogus number
> that makes pfn go beyond end_pfn and ends for loop early. The code
> below increases the refcount, so it might be better to move this
> part of the code after refcount is increased.

The PageHWPoison() is per-page check, for hugetlb, it will directly
try to isolate and ignore the PageHWPoison check, I'm not sure about
moveing PageHWPoison ahead, we need to take the i_mmap_lock_write and
add TTU_RMAP_LOCKED for for hugetlb pages in shared mappings when
try_to_unmap(), but now hugetlb pages won't unmap if there is posion
page, if the get_page_unless_zero() is moved ahead, the logical need be
changed a lot, this minimize changes aim to remove isolate_lru/movable_page,
so could we keep it simple, but as your suggested, we could do more
optimization about do_migrate_range() in the next.

Thanks.


> 
> --
> Best Regards,
> Yan, Zi

Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87718485
	for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 05:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711603816; cv=none; b=P5hQESJtwf7W6vNTNAvanQop3SizroUIVi/7FuA9AzVbCAHq7w2Qlgp1koPOBfE7Qf3VAFdYr2LKf3JB4IvUM9jyPf6JBHoCrmZYU+rWfQ09B6jxSOBKRrhnSnyA720ZUyLrwz5+gTcrBT++riISg4sRsj/5xT8ogDqh12KvcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711603816; c=relaxed/simple;
	bh=DbFmghX3q2qgoWL6pKU17bI5hUPNRmfB4+yn7VFFUsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C9KIS1sUPeyA3GRm+iWvIMwy1R5/5T65SXQnAtNAzLfq+/FpIe7+fcffkdcWDBQr4l5/l7Ll6gX1MwDID5Rms6EPKUTEWX5xHcWVsVbFcH0CqR3OkyAiXHL9fbUJ+BKwyt2z7pOQGEKwBmXC1TkjS3z1sqP1vPxoLxXoeWqvVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4V4sVg6TPbz1R8mL;
	Thu, 28 Mar 2024 13:27:23 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F9881A018A;
	Thu, 28 Mar 2024 13:30:04 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 13:30:03 +0800
Message-ID: <d9f40278-e715-4b6f-8f9a-cd50923e58ac@huawei.com>
Date: Thu, 28 Mar 2024 13:30:03 +0800
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
To: Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>
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
 <ZgRCKkU4xLgnpHG8@casper.infradead.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <ZgRCKkU4xLgnpHG8@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm100001.china.huawei.com (7.185.36.93)



On 2024/3/27 23:58, Matthew Wilcox wrote:
> On Wed, Mar 27, 2024 at 11:10:48AM -0400, Zi Yan wrote:
>> On 27 Mar 2024, at 10:54, Matthew Wilcox wrote:
>>> How much of this is safe without a refcount on the folio?
>>
>> folio_to_pfn() should be fine, isolate_hugetlb() checks the folio
>> under hugetlb_lock, but folio_nr_pages() might return a bogus number
>> that makes pfn go beyond end_pfn and ends for loop early. The code
>> below increases the refcount, so it might be better to move this
>> part of the code after refcount is increased.
> 
> I really want to instill a little bit of fear in Kefeng.
> 
> This is all really subtle code because it's running without a refcount.
> I've mostly stayed away from it because I know that I don't know what
> I'm doing.  Kefeng has no idea that he doesn't know what he's doing.
> 
> And so we get these patches, and they're sometimes subtly wrong, and it
> takes a lot of arguing and revision and thinking and Kefeng is doing
> very little of the thinking part!
> 
> Kefeng, please stick to working on code that you understand.  Or take
> the time to learn code you don't understand before sending patches to
> it.  This kind of Leeroy Jenkins approach to development is not good.

Oh, I remember your reminder and be in awe of changes and try to think
more about changes, for this one, I only convert page to folio after
refcount increased with get_page_unless_zero(), and as replied to Zi,
PageHWPoison part need more consideration and this one only aims to
remove isolate_lru/movable_page, so don't touch the page before
get_page_unless_zero().

Thanks for your review and help all the time.

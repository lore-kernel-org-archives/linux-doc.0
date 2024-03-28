Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168BE3A1AB
	for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711630192; cv=none; b=aRKz1b/1t+Oo0G84quIU9F33Z06KEEKPXEWycwWxvYJPVWF8WvYYZJPLqYKW1HQ0NHp7ECA0vmPrUv6ewnMuqApPLsC4gHth2rrFFxsAIE4y9fkOgE6Wuw5U0jQ84io2N6avDQkHX8JN7rMUxoH9c558CPAsEMKdoSdThKIVfVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711630192; c=relaxed/simple;
	bh=NBs0CmJKq67Jl1skj/2b6AA8U2B6bMNsLgz5HOK/zDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Yo69woTDHBo9wtiRz9zDRZzy2M2MEynP9vcl2DLQYaMECghjQFoF7ZonE4oPBRNUypGgugyvnA0xTISQxP3w91LBYQZET3TR+3IHlZdqrhDzXR2yJ3OuQ5m5Ps4FhYXNfMjK9fWvkclLLgTdo0WS7x3CIQsS7Bi6nFL4zDQbFx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V53Fv5blpz1h4FW;
	Thu, 28 Mar 2024 20:46:59 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 1BDB0140258;
	Thu, 28 Mar 2024 20:49:40 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 20:49:39 +0800
Message-ID: <34428d88-d880-46af-a3bd-7eabbc594ec8@huawei.com>
Date: Thu, 28 Mar 2024 20:49:38 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mm: compaction: use isolate_movable_folio() in
 isolate_migratepages_block()
Content-Language: en-US
To: Vishal Moola <vishal.moola@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>, <willy@infradead.org>, Miaohe
 Lin <linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, David
 Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>, Zi Yan
	<ziy@nvidia.com>, Hugh Dickins <hughd@google.com>, Jonathan Corbet
	<corbet@lwn.net>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>, Baolin
 Wang <baolin.wang@linux.alibaba.com>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
 <20240327141034.3712697-5-wangkefeng.wang@huawei.com>
 <ZgRqU9EvZfWR0nP1@fedora>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <ZgRqU9EvZfWR0nP1@fedora>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100001.china.huawei.com (7.185.36.93)



On 2024/3/28 2:49, Vishal Moola wrote:
> On Wed, Mar 27, 2024 at 10:10:32PM +0800, Kefeng Wang wrote:
>> This moves folio_get_nontail_page() before non-lru movable pages check,
>> and directly call isolate_movable_folio() to save compound_head() calls,
>> since the reference count of the non-lru movable page is increased, a
>> folio_put() is need() whether the folio is isolated or not.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   mm/compaction.c | 30 +++++++++++++++---------------
>>   1 file changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/mm/compaction.c b/mm/compaction.c
>> index 807b58e6eb68..74ac65daaed1 100644
>> --- a/mm/compaction.c
>> +++ b/mm/compaction.c
>> @@ -1097,41 +1097,41 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>>   			}
>>   		}
>>   
>> +		/*
>> +		 * Be careful not to clear PageLRU until after we're
>> +		 * sure the page is not being freed elsewhere -- the
>> +		 * page release code relies on it.
>> +		 */
>> +		folio = folio_get_nontail_page(page);
>> +		if (unlikely(!folio))
>> +			goto isolate_fail;
>> +
> 
> If you wanted to move this, I think this should be part of your first
> patch (or prior to it). It would make your first patch be more sensible as

ok, will re-order the patches.

> is. You could then also consider making isolate_movable_folio() more similar
> to folio_isolate_lru() if you really wanted to.

Maybe just rename it folio_isolate_movable and no more changes now.

Thanks.

> 
>>   		/*
>>   		 * Check may be lockless but that's ok as we recheck later.
>>   		 * It's possible to migrate LRU and non-lru movable pages.
>>   		 * Skip any other type of page
>>   		 */
>> -		if (!PageLRU(page)) {
>> +		if (!folio_test_lru(folio)) {
>>   			/*
>>   			 * __PageMovable can return false positive so we need
>>   			 * to verify it under page_lock.
>>   			 */
>> -			if (unlikely(__PageMovable(page)) &&
>> -					!PageIsolated(page)) {
>> +			if (unlikely(__folio_test_movable(folio)) &&
>> +					!folio_test_isolated(folio)) {
>>   				if (locked) {
>>   					unlock_page_lruvec_irqrestore(locked, flags);
>>   					locked = NULL;
>>   				}
>>   
>> -				if (isolate_movable_page(page, mode)) {
>> -					folio = page_folio(page);
>> +				if (isolate_movable_folio(folio, mode)) {
>> +					folio_put(folio);
>>   					goto isolate_success;
>>   				}
>>   			}
>>   
>> -			goto isolate_fail;
>> +			goto isolate_fail_put;
>>   		}
>>   
>> -		/*
>> -		 * Be careful not to clear PageLRU until after we're
>> -		 * sure the page is not being freed elsewhere -- the
>> -		 * page release code relies on it.
>> -		 */
>> -		folio = folio_get_nontail_page(page);
>> -		if (unlikely(!folio))
>> -			goto isolate_fail;
>> -
>>   		/*
>>   		 * Migration will fail if an anonymous page is pinned in memory,
>>   		 * so avoid taking lru_lock and isolating it unnecessarily in an
>> -- 
>> 2.27.0
>>
>>

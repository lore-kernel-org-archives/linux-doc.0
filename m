Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB7041E6AE
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 10:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233228; cv=none; b=kBJaKx2oEvmQajBek7A9xGYtw0FjjBTtpG8u7cZ9hO7SZct3ODzBcL7ucdQIWNq2lJTCZEPbR6XTeghDwHRDukgoMDat6O5eGcHIfJC7Mvvm5+coCNEaqTxYWYaVet1+oZiQPPZpUfSFtwVUdgyzup5MxI7fxb5ol8r4fQb/FoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233228; c=relaxed/simple;
	bh=NoUUPawFCdh8q1cd0Uf3LLuardjWAmCC+8EPb6m5xdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTJRq4ttkIPGzNjAUeUexrlYlLB0RTgDy3AtKDS0vc9Rs4FZdaSnJr+vMBnLbwkFj9/tNgy37rHlR2R8KGgd9MqFrbMV5qUENopLNWMyXFntNT6+Fm14Ia9WIlmdBF/ZeCMijRVGVfQiV32laz9tLq9n9JOKtb2BsQJjSgAib6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BAMGNaI5; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BAMGNaI5"
Message-ID: <c16b32ac-9480-428e-863c-5d35ae4b8eb1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785233224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+4ST+5ErtH1ogsoPtnfqyhNvdoUFNUqI9109/kuVpU=;
	b=BAMGNaI58CLpVPu5snO0OIDpeFc16aV0jyY1YwjLGjZECP8ZM0ecIsGpLQ+WoYlaALWGvL
	Qdlch/7mAYTk/dJA2QUyFWv6gDqz1H+P47l8wGTFdxfXkRYf2XySa5WIBAQxitQl/P1wMJ
	H6krDarkADrNLevdPv7cqBlhBOtrYh0=
Date: Tue, 28 Jul 2026 18:06:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] mm/damon/core: cover discrete System RAM areas with
 per-range regions
To: SJ Park <sj@kernel.org>
Cc: damon@lists.linux.dev, Jiayuan Chen <jiayuan.chen@shopee.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260727142604.85548-1-sj@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260727142604.85548-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 7/27/26 10:26 PM, SJ Park wrote:
> Hello Jiayuan,
>
> On Mon, 27 Jul 2026 17:54:22 +0800 Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
>
>> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>>
>> damon_set_region_system_rams_default(), introduced by commit 70d8797c15d6
>> ("mm/damon: introduce damon_set_region_system_rams_default()"), is used by
>> DAMON_RECLAIM, DAMON_LRU_SORT and DAMON_STAT to set the default monitoring
>> target address range covering all 'System RAM' when the user does not
>> specify a range.  It walks the 'System RAM' resources but keeps only the
>> start of the first resource and the end of the last one, and then sets a
>> single monitoring region spanning that whole [first_start, last_end] range.
>>
>> On systems whose RAM is split into discrete areas that are far apart in the
>> physical address space, that single region also covers the holes between
>> them.  For example:
>>
>>    $ sudo cat /proc/iomem | grep RAM
>>    00001000-0009ffff : System RAM
>>    00100000-4848c017 : System RAM
>>    4848c018-48550c57 : System RAM
>>    48550c58-48551017 : System RAM
>>    48551018-48615c57 : System RAM
>>    48615c58-48616017 : System RAM
>>    48616018-486dac57 : System RAM
>>    486dac58-4e563017 : System RAM
>>    4e563018-4e627c57 : System RAM
>>    4e627c58-4ef39017 : System RAM
>>    4ef39018-4ef3f057 : System RAM
>>    4ef3f058-4efe6017 : System RAM
>>    4efe6018-4efec057 : System RAM
>>    4efec058-50247fff : System RAM
>>    50317000-56720fff : System RAM
>>    56722000-59c19fff : System RAM
>>    6bbfe000-6bbfefff : System RAM
>>    6bc00000-777fffff : System RAM
>>    100000000-1007effffff : System RAM
>>    67e80000000-77e7fffffff : System RAM
>>
>> Here the last two areas (about 1TB starting at 4GiB, and about 1.1TB
>> starting at ~6.5TB) are separated by a ~5.5TB hole, and the single-region
>> setup makes DAMON treat that entire hole as if it were memory.
>>
>> This is harmful in a few ways.  The monitoring target regions are limited
>> by max_nr_regions, so regions that fall into the hole waste that budget and
>> leave fewer regions for the real RAM, coarsening the adaptive regions and
>> degrading the monitoring accuracy.
> The hole would look like not accessed.  As a result, the whole region will be a
> few regions that very cold.  That wouldn't waste the budget that much.  Do you
> have some specific setups that this cannot help?

It's my mistake.

I first saw the kdamond CPU go up, and I assumed it was the number of
regions. I was wrong.

I re-tested and profiled it with perf. It's not the region count — it's
the page-by-page walk of the hole.

On a VM with a 116GiB hole and a single [first,last] span, I enabled
DAMON_LRU_SORT and ran perf on its kdamond:
   30.15%  damon_get_folio
   17.09%  pfn_to_online_page
    2.24%  __nr_to_section
    ...
    0.07%  damon_split_region_at
    0.06%  damon_merge_two_regions

Almost all of it is the per-page folio lookup. Merge and split are ~0.1%.
The cold scheme targets cold, old regions. The hole is never accessed, so
it's always cold and old, and it matches. Then the action walks its whole
empty span page by page, every apply. RECLAIM and LRU_SORT do this by
default. It scales with the hole size, so on the real 5.5TiB machine the
kdamond can't keep up.


>
>> In addition, DAMOS actions on the paddr
>> operations set walk such a region page by page, so a region that covers the
>> hole is walked for its entire (empty) span on every application.
> That makes sense.
>
>> Set a separate monitoring region for each discrete System RAM area instead,
>> coalescing only truly adjacent (no gap in between) resources into one
>> range, so holes between the areas are excluded.  The reported *start and
>> *end still carry the overall first-start and last-end, so the user-visible
>> default range reported via the module parameters is unchanged.
> I'm concerned if this could result in having too many regions.  The gap between

On the region count: can't we just coalesce any hole smaller than
min_region_sz?  After that, the number of ranges is just the number of 
discrete
System RAM areas

> user-visible parameters and internal state is also a concern.


I think monitor_region_start/end is meant to expose the overall range, and
skipping the holes inside it is an implementation detail. Even if we didn't
skip them, the adaptive region count is never 1 anyway — DAMON already
splits [first,last] into many regions. The holes just add a few more, so
the param never matched the internal state exactly to begin with.


> A quick workaround would be adjusting the memory layout in BIOS, using DAMON
> sysfs interface instead, or setting the monitor_region_{start,end} to cover
> only the single area.  Have you considered such workarounds?
>
> Let's complete this high level discussion first.


Right, this is doable today — the DAMON sysfs interface can set multiple

regions manually. This patch is only about convenience.


>
> Thanks,
> SJ
>
> [...]

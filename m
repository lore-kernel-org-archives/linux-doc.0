Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F7C2627EC;
	Tue, 30 Dec 2025 21:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767130962; cv=none; b=ddbUS+T4LGzNd2BcUQOPHvSn7SY78yleb1PSBZ29wIHG6iN0JWenus/vetUHYJ1rgLlnbyI565j7YD9f5/TD4YItUX4gMSk8S93BM6573BlKRj77uH/sHP8hnM1GlbUrNPb1cCkizPyNnyMIZv3cV7BWSDSzfLjYqv5L5okP+ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767130962; c=relaxed/simple;
	bh=vDD527Oy8Bm4F8rGqeZpgVak3XxpV3M7Dw51XP6Clpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMd6TWHITM2CI7h55JQa4lw83zYQwfMam2MX6R6kELSkjJoCL34OUkkML6oM3/Exd6CgwK26+65OgVkRUS/AZCQLwoDQUghWuA0IFa0Yz1+PA3Hzxnn3uHSB+joisaMUnk564L46RzTk9sQH4lTV9L7uKQXTkXhEn6s18BblbPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKKAzT0A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKKAzT0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC5EC4CEFB;
	Tue, 30 Dec 2025 21:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767130962;
	bh=vDD527Oy8Bm4F8rGqeZpgVak3XxpV3M7Dw51XP6Clpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aKKAzT0AOHTF3wCukkrR5NQA3T+2n0I4882tBgClDuVnnveE8wT0QEV9WJgB3A8pf
	 5RWyZQUB+eIi6dbF3pM0E9YACVo7rg8vbCn6U0Fcuaac7+PS6a1Aeajnyj5WjX44Zu
	 zcxBuZ67DffcdsMdkOx4mobUwGke5XYjtZzavqdo8JrbNm02sOfICDifAz2G/E5Ln6
	 yQkBBzc0RNYAjMLKTKOKURwINam7LNU4kO4V5Pkjxly/S6ndVgMPLMB4IWA6w3aa1z
	 dUMzJqH0SVYoKNNt5RgV7BLxvYyNNsMUunkPyjqog5i9OywImEd9UvB2NfGiuKGvLt
	 oGPN/9m8s4gsw==
Message-ID: <a083a5ca-bac8-44b5-8604-638c5eb4102a@kernel.org>
Date: Tue, 30 Dec 2025 22:42:34 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next v2 0/2] THP COW support for private executable file
 mmap
To: Matthew Wilcox <willy@infradead.org>,
 Zhang Qilong <zhangqilong3@huawei.com>
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, corbet@lwn.net,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, wangkefeng.wang@huawei.com,
 sunnanyong@huawei.com, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, lianux.mm@gmail.com,
 Nadav Amit <namit@vmware.com>
References: <20251226100337.4171191-1-zhangqilong3@huawei.com>
 <aVCnMI5gFLTB9UCe@casper.infradead.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <aVCnMI5gFLTB9UCe@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/25 04:42, Matthew Wilcox wrote:
> On Fri, Dec 26, 2025 at 06:03:35PM +0800, Zhang Qilong wrote:
>> The MySQL (Ver 8.0.25) test results on AMD are as follows:
>>
>> -------------------------------------------------------------------
>>                   | Exec mmap Rss(kB)  | Measured tpmC (NewOrders) |
>> -----------------|--------------------|---------------------------|
>>   base(page COW)  |       32868        |        339686             |
>> -----------------|--------------------|---------------------------|
>>   exec THP COW    |       43516        |        371324             |
>> -------------------------------------------------------------------
>>
>> The MySQL using exec THP COW consumes an additional 10648 kB of memory
>> but achieves 9.3% performance improvement in the scenario of hotpatch.
>> Additionally, another our internal program achieves approximately a 5%
>> performance improvement as well.
>>
>> As result, using exec THP COW will consume additional memory. The
>> additional memory consumption may be negligible for the current system.
>> It's necessary to balance the memory consumption with the performance
>> impact.
> 
> I mean ... you say "negligible", I saay "32% extra".  9% performance
> gain is certainly nothing to sneer at (and is consistent with measured
> performance gains from using large folios for, eg, kernel compiles).
> But wow, that's a lot of extra memory.  My feeling is that we shouldn't
> add this functionality, but I'd welcome other opinions.

Also, I wonder whether there aren't other approaches for such code 
patching where user space is able to create THPs more effectively? 
Handling creation of a patched file version etc in user space.

E.g., I'd assume that a single "patched" version (with a single THP) for 
multiple program instances could be beneficial over one patched version 
per program instance.

Which type of code patching does hotpatch perform?

-- 
Cheers

David

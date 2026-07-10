Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2CD3B19D9;
	Fri, 10 Jul 2026 07:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783668558; cv=none; b=WU9r8oIIaSbGImYrbus0t7nBQxpuzOsBA7Xv7bedQK0kXbKNbAuQcUhzYT8ZmUKZ3wWV/ZGgm01gB8jQ0aAsuLNJSId7xnXECx1BnMV1E50WYuL77t2TmYA+pw0qZiwwxA2XXNqptMgkIHvVbqwyHH8PQfwAx3TzxdEqXcocMNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783668558; c=relaxed/simple;
	bh=GIAiIYTND5W98+BvrCFes73Z+CNWSUtOKCwlK9hH/CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ed1jawtnd6TjJSBYHHNCx+HsQF/o56ux3ryyRHFAiYBYFbvf2g9pVx/8xQeje3bw2VCL8PGQNpOjqnwnwfvX0Up69BCbbquGGAo0s5BOC/GdrnvyIGQbgMSW+E5XSThxLd5UzbHWoE/vNgG3kdWnJBDMOmTHs7RV6ICjteukm/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=B+/Cb9fz; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="B+/Cb9fz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783668545; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6R0ZXUQFUwfZgH3nG+djP9eJT2Fdh4nBXbLmCtqMTsk=;
	b=B+/Cb9fztK6jQfqq/7ZRtbe33vpIx4R1s3wtcBxGhQKwzJ3PKBevcyM00UlSSot1t8mh6TBtWgGV45Oavzwd7SeEQ6CeTuudfyZZpL94E/zBKw0hc7Q7MvJ0UM5xY1pQ7VzXwJpTJdYlE+3V+IO8pI08bCKwzomnSw2s6BGvbps=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R881e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X6mtZXo_1783668542;
Received: from 30.74.144.121(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X6mtZXo_1783668542 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 10 Jul 2026 15:29:03 +0800
Message-ID: <037ba54e-d947-4b61-9fa4-961d14f87a43@linux.alibaba.com>
Date: Fri, 10 Jul 2026 15:29:01 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] mm/khugepaged: refactor per-scan state clearing into
 collapse_control_init_scan()
To: Usama Arif <usama.arif@linux.dev>, Nico Pache <npache@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260706170755.3387204-1-usama.arif@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260706170755.3387204-1-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/7/26 1:07 AM, Usama Arif wrote:
> On Mon,  6 Jul 2026 09:44:48 -0600 Nico Pache <npache@redhat.com> wrote:
> 
>> Extract the repeated clearing of node_load, alloc_nmask, and
>> mthp_present_ptes into a helper to reduce duplication in
>> collapse_scan_pmd() and collapse_scan_file(). Althought file scans do not
>> current use the bitmap, they will in the future, and clearing it now is
>> harmless.
>>
>> Signed-off-by: Nico Pache <npache@redhat.com>
>> ---
>>   mm/khugepaged.c | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 617bca76db49..b3985b854e77 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -628,6 +628,17 @@ void __khugepaged_exit(struct mm_struct *mm)
>>   	}
>>   }
>>   
>> +/*
>> + * collapse_control_init_scan() - initialize/reset collapse_control variables
>> + * that require being cleared once per-scan.
>> + */
> 
> Probably don't need the above comment, but apart from that

Agree. The code is self-explanatory.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

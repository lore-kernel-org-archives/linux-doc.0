Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F973DB64A;
	Fri, 10 Jul 2026 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670005; cv=none; b=Mw5+zBqNgTicvArgIRZamE0VoBqHJvYZL7oHJaqjIYD+6asIz8C18AWJRHXLEe0ClutRWOZs+AS5RM9vujZ82Rf8kmATYwFy7+/wZ/8GwpbXU0ge4DTD0iN1cQNVEi86AfcBTIej1JW17Tiyl4QZwUNAHIa7bKyn58mWdFUNnl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670005; c=relaxed/simple;
	bh=/el9B9dmn6AInZvRKDjSL0q9HC4ssjOv77bpWST39zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGVdSDI3yVnyIfmgMAJ0DyZoIWpqUNz0Y9oncRAh0aSTcYj5gGkjVYVHJAP3jNm+reOQy5TRiS09VTQqVIK6j5Ho0dEz3Klj2x1jjB2YCMeu4VWw79Botl4NfHhV+gJE2LgVrAV13extTx/uqHVtxhTEaxnOtiZOVg5akUkT8mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=e56+Jt9o; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="e56+Jt9o"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783669999; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=TM7g+f4DY2IQKDVuMIDRQ7RBAsmrawP7WwfGxU5hrlk=;
	b=e56+Jt9o0Tgm7NeAFxL3kElR9OfKEoce2Pwnr7wkXwerRrx9XOf4q9Eg+gSWnWswWkw3vAY401VKVzew8JrrrYV6tkP4zl5WPrskC2d6ZZGZ9ieKya77xNVNX30mGGz+T27r21n+4xTXGZ5XodnlnSIS6ZDM+G2/l3znC8kF7Lk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X6my5Zf_1783669996;
Received: from 30.74.144.121(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X6my5Zf_1783669996 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 10 Jul 2026 15:53:17 +0800
Message-ID: <c8d1b841-3514-4805-bec1-7064a82b8ffe@linux.alibaba.com>
Date: Fri, 10 Jul 2026 15:53:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] mm: Documentation: clarify where the mTHP stats live
To: Nico Pache <npache@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: Lorenzo Stoakes <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260706154500.39178-1-npache@redhat.com>
 <20260706154500.39178-9-npache@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260706154500.39178-9-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/6/26 11:44 PM, Nico Pache wrote:
> The note about khugepaged counters references /proc/vmstat for the PMD
> case, but never mentions where the mTHPs stats can be found
> (i.e.: /sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/stats/)
> Add a small addition to this section for clarity.
> 
> Also fix a missing period while we are at it.
> 
> Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

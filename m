Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EFD2EA151;
	Tue, 16 Dec 2025 02:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765852993; cv=none; b=BLXjyQoduw3VI/0sHRzZJLOliYuh418+oeyd0W6SLbBSReOiZIETvk6l1KenssZu5xpKoqEjTjtEWFhulDxGRF0NAQtkUmYLblXNgI9QzFW7IOmS0pf6NGPY3lzaF732yWTZo4ype4Sgo7T47C03YsKmnaRe2Z7p9G5okk6hkAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765852993; c=relaxed/simple;
	bh=Jv+loXTV6g1KUJ460fIBTUxe3Rs4OvN9h29r0spZSI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ey+dlYAkuDRaFwWZsJc2NzkXO/HNzo1Vm7zTdaPFGCRKnpUYyxZtX1jJjgIYu+f1Fuo+CAl223CKJHzHEKQ9lK1Gy3WGerAevgUi5zpz8uviFLEYLY1aZ5ARbDbnIhGeg3zN5g7wulvLALw4Zj+gbyfCClTP6LzZqzka0UGvitI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FiJ4d/kC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FiJ4d/kC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3909DC4CEF5;
	Tue, 16 Dec 2025 02:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765852992;
	bh=Jv+loXTV6g1KUJ460fIBTUxe3Rs4OvN9h29r0spZSI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FiJ4d/kCgSuS3a8cUgEaXzpdGvtzN295Q1wqZ76AfXUDvQyKnr1ejNcIKaF4wd6db
	 smH0gQiHsAyD4vmEiFcoSBp4c5XuXri2f02uqS2nbw+Yh0azNf/8FkYwwXhCp1lf93
	 xl0tRxX3OULgVWLItCVQQhV8wY2lwoTAwCTFECwQMh3Dsi6jaC9D0S4ZSeSvrO0NDh
	 YVN9nbfS32jp+Qc2DEP8o9647nhQVLE+yLiF47nvq25+JY9PMlktq9ERwB49ZqTDzk
	 Iz/u5c+w03bVuyUG7CKZVMSckKdYitnSWM4QOvxXqeQsy1KIFcvLlpHcv+NCPkyAXp
	 ufA1BM3VutRtg==
Message-ID: <d86584ef-d32d-476f-a939-10052ca0372e@kernel.org>
Date: Tue, 16 Dec 2025 03:43:03 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next 0/2] THP COW support for private executable file mmap
To: zhangqilong <zhangqilong3@huawei.com>,
 Matthew Wilcox <willy@infradead.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "ziy@nvidia.com" <ziy@nvidia.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
 "npache@redhat.com" <npache@redhat.com>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "dev.jain@arm.com" <dev.jain@arm.com>, "baohua@kernel.org"
 <baohua@kernel.org>, "lance.yang@linux.dev" <lance.yang@linux.dev>,
 "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>,
 "surenb@google.com" <surenb@google.com>, "mhocko@suse.com"
 <mhocko@suse.com>, "Wangkefeng (OS Kernel Lab)"
 <wangkefeng.wang@huawei.com>, Sunnanyong <sunnanyong@huawei.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <e133c19e47324cce97a1c8f3752489c1@huawei.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <e133c19e47324cce97a1c8f3752489c1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 03:24, zhangqilong wrote:
>   > On 12/15/25 15:00, Matthew Wilcox wrote:
>>> On Mon, Dec 15, 2025 at 08:34:05PM +0800, Zhang Qilong wrote:
>>>> This patch series implementate THP COW for private executable file
>>>> mmap. It's major designed to increase the iTLB cache hit rate for hot
>>>> patching application, and we add a new sysfs knob to disable or
>>>> enable it.
>>>
>>> You're going to have to provide data to get this patch in.  We've
>>> deliberately not done this in the past due to memory consumption
>> overhead.
>>> So you need to prove that's now the wrong decision to make.
>>>
>>> Microbenchmarks would be a bare minimum, but what are really needed
>>> are numbers from actual workloads.
>>
>> In addition, the sysfs toggle is rather horrible. It's rather clear that this is not a
>> system-wide setting to be made, as you likely only want that behavior (if at
>> all ...) for a handful of special processes I assume?
> 
> Year, it's not a system-wide setting. We consider enabling this option only when
> applying hot patches to special processes. If the sysfs toggle is unavailable, we will
> evaluate the overall memory impact on the system after removing it. Thanks very
> much for your suggestion.

I don't think we want this as any kind of default behavior. But the 
system toggle is really also not what we want. Could we use some per-VMA 
or per-file hints to affect the policy?

Note that your proposal will likely interact in bad ways with uprobes, 
after removing uprobes again.

-- 
Cheers

David

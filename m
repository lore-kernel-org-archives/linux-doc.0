Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DDA248F57;
	Tue, 30 Dec 2025 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767130194; cv=none; b=KGp7WA0jGit+4nVyMdipKuAKThm9eI1WYedJI5UOtdqiwIYUkHGL54S3xI+3wubIEziXXIsSwZmVTMmS/lP667YAPu44WkyAjvTbeM5QeXGhKHagpSNm8Dc0rO7YjOxhsup/uNxVPoVejYb/5uTpuaFwok258Fb3Uu9xaSfcbbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767130194; c=relaxed/simple;
	bh=IxI611ewVn3TkXYsfQGaKWr165GjWawy7PB3qyN3Nns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLwGBVxz3CaE3DlCT4Vpbwt0ZuPl+IXoVz0P1Q6fgg7/sN8vD0rPWvnTTrAhWWq7W5P0H1Z1JxJ+9XglDQjqhJdzt9hA7GRpIsVtUlqSG4K5/CgUhA9tW+JBnMMPrTXdYNhj79J+rwHKv4YAdIhU2QEZkwoVkqN8nhFC8UHxWe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdwRUS/m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdwRUS/m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57DCC4CEFB;
	Tue, 30 Dec 2025 21:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767130194;
	bh=IxI611ewVn3TkXYsfQGaKWr165GjWawy7PB3qyN3Nns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PdwRUS/mjSsVSh4CCh7bLteLWXUnNX4QT8VbygtGfUnwnXMBxY0ueLUakEtJu4Q1t
	 FGXA4oUgSUNPAtwY8enqcaiqjMYs3/Sczx9pb4GCnqvKPjfMEs9XTjN1DGFXwBEQ/z
	 MwmlkZO5EJ/O4Lb6Yd++MefsClQnVUL+zSwSg7A/7L8kXo/Yv8ex9uFVpJ2f9cS6xP
	 sT0Dp6lZHzFE2rPC3mL9ukeplETs1yOiA0/s18aTq5rbRoJSuw5IsQOjCexd9fY6Ae
	 BB7sdogG80sVMJ8lQc8jtSqKI5U54R5lu/V0wXn7z0qct1woG0EFJzzNv2CAZTtTyM
	 xmynp1euIy9Pw==
Message-ID: <46d418f9-74ae-4801-99da-2e31c019bc79@kernel.org>
Date: Tue, 30 Dec 2025 22:29:45 +0100
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
References: <0ce50058e6254a29baee1271ae0ef31c@huawei.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <0ce50058e6254a29baee1271ae0ef31c@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 08:42, zhangqilong wrote:
>> On 12/16/25 03:24, zhangqilong wrote:
>>>    > On 12/15/25 15:00, Matthew Wilcox wrote:
>>>>> On Mon, Dec 15, 2025 at 08:34:05PM +0800, Zhang Qilong wrote:
>>>>>> This patch series implementate THP COW for private executable file
>>>>>> mmap. It's major designed to increase the iTLB cache hit rate for
>>>>>> hot patching application, and we add a new sysfs knob to disable or
>>>>>> enable it.
>>>>>
>>>>> You're going to have to provide data to get this patch in.  We've
>>>>> deliberately not done this in the past due to memory consumption
>>>> overhead.
>>>>> So you need to prove that's now the wrong decision to make.
>>>>>
>>>>> Microbenchmarks would be a bare minimum, but what are really
>> needed
>>>>> are numbers from actual workloads.
>>>>
>>>> In addition, the sysfs toggle is rather horrible. It's rather clear
>>>> that this is not a system-wide setting to be made, as you likely only
>>>> want that behavior (if at all ...) for a handful of special processes I assume?
>>>
>>> Year, it's not a system-wide setting. We consider enabling this option
>>> only when applying hot patches to special processes. If the sysfs
>>> toggle is unavailable, we will evaluate the overall memory impact on
>>> the system after removing it. Thanks very much for your suggestion.
>>
>> I don't think we want this as any kind of default behavior. But the system
>> toggle is really also not what we want. Could we use some per-VMA or per-
>> file hints to affect the policy?
> 
> It's really a good idea. Maybe could setting a xx flag to VMA, but it need hold write
> lock and touch VMA. let me have a think how to implement per-VMA or per-file policy
> or other better hints.
> 
> I have a thought that, how about adding a new flag(in ptrace, uprobes...) and passing
> to faultin_page() to mark the exec PMD COW policy?
> 
>>
>> Note that your proposal will likely interact in bad ways with uprobes, after
>> removing uprobes again.
> 
> Year, good catch here, it's really need be seriously considered.

I'll reply on v2 with the issue I have in mind.

-- 
Cheers

David

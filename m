Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102253AE1BD
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743689; cv=none; b=QKzbUI2DAEAaY129T8qWxh02b3SQl2MRlVQzM+6FAvsccDhC7Z2ipaS678uPV0FRHdt4CUtg13UBL0vIBMoQFeVM/SoX/MJBBFW2QHpzoFXXJgnTO2yDrMznnVMbDeBX/x48Y2GF1hWEDrvYL5YZeY8bkDze4LoZTkn3ofDycQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743689; c=relaxed/simple;
	bh=1RToCMqJF1yS8LUnOBtMO0FQ6rqRQeOVXAht53Hd4VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOJiu3ZKFGhm8IWV9ftg8KapysJIZNRUbn8/vPlAgeCTEngWTe+R0oabQ1zCVBnXU66TJJEQQk3t3YZhDCle6GspZqGgEdRDCaXv0/aM3z1RVfnQVodBDAOpxrFRDJP6IoBcMQ1uO20gnlHIJuoDlVKtOdjfI8G/mBJldn+TZto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+Yzn4Ef; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+Yzn4Ef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0111F000E9;
	Mon,  3 Aug 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785743686;
	bh=BXJHyJVq8eSCZdvtdT9bf4WhjgSufN7PcFBzUWxZF+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=V+Yzn4Efg4P83a7IPaFwHq0PR/bx3sL1wXB9EPacsg7ju7bcAVds4YxIhmeqxAncl
	 Z3S+cLHbVXvk6+zB8y+gbUja0mrLMgKK9khmLbzMw/fBh6sIKA4VHX9N3nnd1PU/Pp
	 JrydOD2r6vjgmn+y0TgsqKyRrzVFEP1QvF4flOWZygDMG5Nb/td6OfWuNHoMf0QRIL
	 MPGpLZrbMlpWR9UkchWCTJtQCYZcrUZ7xNYniTszsRd3sbDd5MRn++3vFDvDewEZsz
	 HjZpJuWMLbx7WhMH4BZhrbtMWHI2gmLID57Nvk28Ts5qhzHNKti+/qxHocXjtrP21r
	 po2SYR2j/GeMw==
Message-ID: <c075be8b-4213-4ba4-8e95-6377986d7c8c@kernel.org>
Date: Mon, 3 Aug 2026 09:54:38 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: ksm: fix typos in sysfs knob names
To: Jinjiang Tu <tujinjiang@huawei.com>, akpm@linux-foundation.org,
 xu.xin16@zte.com.cn, chengming.zhou@linux.dev, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
 shr@devkernel.io, linux-mm@kvack.org, linux-doc@vger.kernel.org
Cc: wangkefeng.wang@huawei.com, sunnanyong@huawei.com
References: <20260731083526.3953421-1-tujinjiang@huawei.com>
 <20260731083526.3953421-2-tujinjiang@huawei.com>
 <d9236dc0-3332-4fab-aa26-e74d10ad0cda@kernel.org>
 <f1f5c486-f14c-44ad-8285-a9df437f7974@huawei.com>
 <3066dc07-31b5-48ca-b14e-51b284bbb9e1@kernel.org>
 <fe724e58-f525-4eee-9471-d1765f6bdb0e@huawei.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <fe724e58-f525-4eee-9471-d1765f6bdb0e@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/3/26 09:15, Jinjiang Tu wrote:
> 
> 在 2026/7/31 17:25, David Hildenbrand (Arm) 写道:
>> On 7/31/26 11:22, Jinjiang Tu wrote:
>>> 在 2026/7/31 17:11, David Hildenbrand (Arm) 写道:
>>> git log --grep "Fixes" Documentation/
>>>
>>> Many commits in Documentation have fix tag.
>>> I think both are ok, since documentation changes are needed to backport.
>> What? When? How? Where?
>>
>> :)
> 
> These commits only modify Documentation/ files and contains fix tags.
> 
> 0c13ed77dd2b Docs/admin-guide/mm/damon/lru_sort: warn commit_inputs vs param updates race
> 0beba407d458 Docs/admin-guide/mm/damon/reclaim: warn commit_inputs vs param updates race
> d7f00084f686 Docs/admin-guide/mm/damn/lru_sort: fix intervals autotune parameter name
> 652e1a51465f mm: fix docs for the kernel parameter ``thp_anon=``
> 14e70e4660d6 Docs/admin-guide/mm/damon/usage: fix wrong schemes effective quota update command
> da2a06188888 Docs/admin-guide/mm/damon/usage: fix wrong example of DAMOS filter matching sysfs file
> 1beb8ae302a0 Docs/admin-guide/mm/zswap: remove zsmalloc's lack of writeback warning
> 0ff11f103f5d Docs/admin-guide/mm/damon: rename the title of the document
> 465d0eb0dc31 Docs/admin-guide/mm/damon/usage: fix the example code snip
> 205498012513 Docs/admin-guide/damon/reclaim: remove a paragraph that been obsolete due to online tuning support
> dd21bfa425c0 proc: fix documentation and description of pagemap
> a8db400f997c memory-hotplug.rst: fix wrong /sys/module/memory_hotplug/parameters/ path
> d83fe3c99d27 memory-hotplug.rst: fix two instances of "movablecore" that should be "movable_node"
> 72a3e3e25a51 docs: hugetlbpage.rst: fix some warnings
> 8867f6109b84 docs: fix numaperf.rst and add it to the doc tree
> 
> 
> But there are also commits don't contain fix tags. Such as:
> 
> abdca14655fe Docs/admin-guide/mm/damon: fix 'parametrs' typo
> 78a00cac1e96 docs: fix 're-use' -> 'reuse' in documentation
> eb14b12c8c22 Docs/admin-guide/mm/damon/usage: fix and add missing DAMOS filter sysfs files on files hierarchy
> 472098f23323 docs: mm: fix the incorrect 'FileHugeMapped' field

That is not what I asked. You said "since documentation changes are needed to backport".

Who backports documentation fixes and to which tree?

We usually don't backport anything unless we Cc: stable. And distros don't generally
care that much about documentation backports either.

-- 
Cheers,

David

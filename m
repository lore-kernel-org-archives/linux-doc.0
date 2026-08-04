Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F593EC835
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 02:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785809746; cv=none; b=VtmMusAZLu9i+JwIZ6oeBsiayvVtWOBw6VrFXw5QnNx8AOofpkh/qOdQJA8RdlK89anuF8g5a5/vmPI08G5Nf235dPclw2N7mn0NG5D58PQRtfLxQLkoFn//RJ3Ta61+8RA0MXC3C+2EHc9ZXlcUogEjHNEGMVCtO8TngUcpxDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785809746; c=relaxed/simple;
	bh=Gh8Fd4rP94suOy7JCk3n/TSIF7NrslTncc4aDwf2pwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IGa41xBsDNsqseYs0FJuqNBvxfQEUI5Jnxyj/QzAi+qmGFtZH1uwheXeU0KUGEaX7GgTJgqywEbn+0SfGckjSIg3aZs0IlBsYjo7ejWtOxrD1Yqup8QBp3WTplnRsWClHEv2nZkxZzNYz3cTqNBdz2/GKXidy8Z6e/HGZzM4ogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=SLJlQCJN; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="SLJlQCJN"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Gh8Fd4rP94suOy7JCk3n/TSIF7NrslTncc4aDwf2pwE=;
	b=SLJlQCJNlHSpohuZTPY2E+kIwSLZltoJd4ITQeHkQPJypG1mxt9MrUYrwhIdebzDPLQOh/quX
	Ouxsi6vaW71EP9g1xNC+D6myqw5Qol4V70XY9k8vVNBQ92LVezSo2W5z7AkPcRCCFot+/8qnRxM
	OSWBPT68cY3sQs5g6CJHgQg=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hDcMx73QbzLlVT;
	Tue,  4 Aug 2026 10:06:05 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 84433402AB;
	Tue,  4 Aug 2026 10:15:36 +0800 (CST)
Received: from [10.174.178.9] (10.174.178.9) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 4 Aug
 2026 10:15:35 +0800
Message-ID: <32d2d3e5-2cbf-4c95-97b9-5d618dc58378@huawei.com>
Date: Tue, 4 Aug 2026 10:15:34 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: ksm: fix typos in sysfs knob names
To: "David Hildenbrand (Arm)" <david@kernel.org>, <akpm@linux-foundation.org>,
	<xu.xin16@zte.com.cn>, <chengming.zhou@linux.dev>, <ljs@kernel.org>,
	<liam@infradead.org>, <vbabka@kernel.org>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <shr@devkernel.io>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
References: <20260731083526.3953421-1-tujinjiang@huawei.com>
 <20260731083526.3953421-2-tujinjiang@huawei.com>
 <d9236dc0-3332-4fab-aa26-e74d10ad0cda@kernel.org>
 <f1f5c486-f14c-44ad-8285-a9df437f7974@huawei.com>
 <3066dc07-31b5-48ca-b14e-51b284bbb9e1@kernel.org>
 <fe724e58-f525-4eee-9471-d1765f6bdb0e@huawei.com>
 <c075be8b-4213-4ba4-8e95-6377986d7c8c@kernel.org>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <c075be8b-4213-4ba4-8e95-6377986d7c8c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/8/3 15:54, David Hildenbrand (Arm) 写道:
> On 8/3/26 09:15, Jinjiang Tu wrote:
>> 在 2026/7/31 17:25, David Hildenbrand (Arm) 写道:
>>> On 7/31/26 11:22, Jinjiang Tu wrote:
>>>> 在 2026/7/31 17:11, David Hildenbrand (Arm) 写道:
>>>> git log --grep "Fixes" Documentation/
>>>>
>>>> Many commits in Documentation have fix tag.
>>>> I think both are ok, since documentation changes are needed to backport.
>>> What? When? How? Where?
>>>
>>> :)
>> These commits only modify Documentation/ files and contains fix tags.
>>
>> 0c13ed77dd2b Docs/admin-guide/mm/damon/lru_sort: warn commit_inputs vs param updates race
>> 0beba407d458 Docs/admin-guide/mm/damon/reclaim: warn commit_inputs vs param updates race
>> d7f00084f686 Docs/admin-guide/mm/damn/lru_sort: fix intervals autotune parameter name
>> 652e1a51465f mm: fix docs for the kernel parameter ``thp_anon=``
>> 14e70e4660d6 Docs/admin-guide/mm/damon/usage: fix wrong schemes effective quota update command
>> da2a06188888 Docs/admin-guide/mm/damon/usage: fix wrong example of DAMOS filter matching sysfs file
>> 1beb8ae302a0 Docs/admin-guide/mm/zswap: remove zsmalloc's lack of writeback warning
>> 0ff11f103f5d Docs/admin-guide/mm/damon: rename the title of the document
>> 465d0eb0dc31 Docs/admin-guide/mm/damon/usage: fix the example code snip
>> 205498012513 Docs/admin-guide/damon/reclaim: remove a paragraph that been obsolete due to online tuning support
>> dd21bfa425c0 proc: fix documentation and description of pagemap
>> a8db400f997c memory-hotplug.rst: fix wrong /sys/module/memory_hotplug/parameters/ path
>> d83fe3c99d27 memory-hotplug.rst: fix two instances of "movablecore" that should be "movable_node"
>> 72a3e3e25a51 docs: hugetlbpage.rst: fix some warnings
>> 8867f6109b84 docs: fix numaperf.rst and add it to the doc tree
>>
>>
>> But there are also commits don't contain fix tags. Such as:
>>
>> abdca14655fe Docs/admin-guide/mm/damon: fix 'parametrs' typo
>> 78a00cac1e96 docs: fix 're-use' -> 'reuse' in documentation
>> eb14b12c8c22 Docs/admin-guide/mm/damon/usage: fix and add missing DAMOS filter sysfs files on files hierarchy
>> 472098f23323 docs: mm: fix the incorrect 'FileHugeMapped' field
> That is not what I asked. You said "since documentation changes are needed to backport".
>
> Who backports documentation fixes and to which tree?

Sorry, I misspelled the word, what I originally meant was"since documentation changes don't need to be backported".

>
> We usually don't backport anything unless we Cc: stable. And distros don't generally
> care that much about documentation backports either.
>

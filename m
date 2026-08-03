Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B244B340A76
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 07:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785741369; cv=none; b=fdwrl5FstUfhfQZ0CtpmBNdHx/bjUFt7NmyLXss7xM7EszOR9U6ZKEsSHaBhEuwhRi7aoEG5adaYmg2pO1G9DwB0f1Tyf3RHvwYzAOLmuEZGzAWrzvlGo1u+5gyL0CoK5QSe8W2mgPtSxGlFx+WHRHhHofR7/cS0h6x6YOdQQ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785741369; c=relaxed/simple;
	bh=Dnw6NXnk8kwvNdo93WmVYhkyxHlgOe+nTgmTwSoBbA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lHEFFj7gLg4Ml+2CAHfDE5O2KurTOTrzmHoKrUid5l9X2LCKcV9klGQCE4r/3qE84JaDqfccPZjemFos/D2eH9p9QPPtqizw8pFocUtVpQuSrfYu68VUpeqRb9bOVoPtUe+QmJdoFKt8sU+Ro6UF+zhd0VZ/KVHAJw5kKT+uX4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=pk3T118R; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="pk3T118R"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Dnw6NXnk8kwvNdo93WmVYhkyxHlgOe+nTgmTwSoBbA0=;
	b=pk3T118R/N20RkVgzptuQsU4dRxKrumW4ZfmyC+goiTs1lYHKS6TxU524NPqGLdT2dvfZce2Q
	2B7Bk6kr16aPvTvIgWJ6mPvT9ujUaMKg1IFCgniKP9oVjKqIXoeJgDtkdxG78G4NLEdIIvLKdKu
	E89KFLrJXoW3DEMYgfKSc6E=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hD7526HkGzLlX5;
	Mon,  3 Aug 2026 15:06:30 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id E350A4055B;
	Mon,  3 Aug 2026 15:16:00 +0800 (CST)
Received: from [10.174.178.9] (10.174.178.9) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 3 Aug
 2026 15:15:59 +0800
Message-ID: <fe724e58-f525-4eee-9471-d1765f6bdb0e@huawei.com>
Date: Mon, 3 Aug 2026 15:15:59 +0800
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
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <3066dc07-31b5-48ca-b14e-51b284bbb9e1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/7/31 17:25, David Hildenbrand (Arm) 写道:
> On 7/31/26 11:22, Jinjiang Tu wrote:
>> 在 2026/7/31 17:11, David Hildenbrand (Arm) 写道:
>>> On 7/31/26 10:35, Jinjiang Tu wrote:
>>>> The sysfs knob names in mm/ksm.c are "advisor_max_cpu" and
>>>> "advisor_max_pages_to_scan", but the ksm.rst documentation spelled
>>>> both as "adivsor_*", fix the two typos.
>>>>
>>>> Fixes: 0710f38ad26a ("mm/ksm: document ksm advisor and its sysfs knobs")
>>> I'm not sure on fixes tags for documentation stuff.
>> git log --grep "Fixes" Documentation/
>>
>> Many commits in Documentation have fix tag.
>> I think both are ok, since documentation changes are needed to backport.
> What? When? How? Where?
>
> :)

These commits only modify Documentation/ files and contains fix tags.

0c13ed77dd2b Docs/admin-guide/mm/damon/lru_sort: warn commit_inputs vs param updates race
0beba407d458 Docs/admin-guide/mm/damon/reclaim: warn commit_inputs vs param updates race
d7f00084f686 Docs/admin-guide/mm/damn/lru_sort: fix intervals autotune parameter name
652e1a51465f mm: fix docs for the kernel parameter ``thp_anon=``
14e70e4660d6 Docs/admin-guide/mm/damon/usage: fix wrong schemes effective quota update command
da2a06188888 Docs/admin-guide/mm/damon/usage: fix wrong example of DAMOS filter matching sysfs file
1beb8ae302a0 Docs/admin-guide/mm/zswap: remove zsmalloc's lack of writeback warning
0ff11f103f5d Docs/admin-guide/mm/damon: rename the title of the document
465d0eb0dc31 Docs/admin-guide/mm/damon/usage: fix the example code snip
205498012513 Docs/admin-guide/damon/reclaim: remove a paragraph that been obsolete due to online tuning support
dd21bfa425c0 proc: fix documentation and description of pagemap
a8db400f997c memory-hotplug.rst: fix wrong /sys/module/memory_hotplug/parameters/ path
d83fe3c99d27 memory-hotplug.rst: fix two instances of "movablecore" that should be "movable_node"
72a3e3e25a51 docs: hugetlbpage.rst: fix some warnings
8867f6109b84 docs: fix numaperf.rst and add it to the doc tree


But there are also commits don't contain fix tags. Such as:

abdca14655fe Docs/admin-guide/mm/damon: fix 'parametrs' typo
78a00cac1e96 docs: fix 're-use' -> 'reuse' in documentation
eb14b12c8c22 Docs/admin-guide/mm/damon/usage: fix and add missing DAMOS filter sysfs files on files hierarchy
472098f23323 docs: mm: fix the incorrect 'FileHugeMapped' field

>

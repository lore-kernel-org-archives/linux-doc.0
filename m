Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2F6645
	for <linux-doc@vger.kernel.org>; Mon, 21 Apr 2025 01:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745200585; cv=none; b=BKp053Tv0QSnu4iJEMTbXn87z4+zhBA3Ce2DEUweljTyAnZyAUgOY/XiNsgyV6F1kJxPuaj5vU1EXwgVBRG8j7IEwhb8W3KzayI59RR4cMrpOuEtZwlXL2PCQP7F92zR5XveRMo2/tRCZYbYfGZWLszoS3j2oQjY6c/ZvkB2Op8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745200585; c=relaxed/simple;
	bh=qW0eebVbtwYe1JtaobHbcXD+OIbIt+U3+MJFH4UdzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YUK7RR08X58toqHBnsKsinHubwykOz7EK1F5oAy19MoZmy37HXGMGBwR9gUIAvooK50uEJEmEQrxqPtCMlapgbhM8e+gt6hJ6MaKiSew7SJX7VCDOZtZNJ7O11i1/VMlwQXjB5ZIftM5scywuYM/iXzG3Pffl26SdFFr6p9Gung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZgpMt0JkvzQwPB;
	Mon, 21 Apr 2025 09:54:50 +0800 (CST)
Received: from kwepemo200002.china.huawei.com (unknown [7.202.195.209])
	by mail.maildlp.com (Postfix) with ESMTPS id 84FD3180B49;
	Mon, 21 Apr 2025 09:56:11 +0800 (CST)
Received: from [10.174.179.13] (10.174.179.13) by
 kwepemo200002.china.huawei.com (7.202.195.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 21 Apr 2025 09:56:10 +0800
Message-ID: <64eaf1f9-1fab-8dda-ab75-5e48c0a8e0cb@huawei.com>
Date: Mon, 21 Apr 2025 09:56:09 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH] docs: hugetlbpage.rst: add free surplus huge pages
 description
To: Randy Dunlap <rdunlap@infradead.org>, <osalvador@suse.de>,
	<muchun.song@linux.dev>, <akpm@linux-foundation.org>, <david@redhat.com>,
	<corbet@lwn.net>
CC: <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>
References: <20250419073214.2688926-1-tujinjiang@huawei.com>
 <1bb5fadd-583c-4c56-b52f-37eee516c1dd@infradead.org>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <1bb5fadd-583c-4c56-b52f-37eee516c1dd@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemo200002.china.huawei.com (7.202.195.209)


在 2025/4/20 1:20, Randy Dunlap 写道:
>
> On 4/19/25 12:32 AM, Jinjiang Tu wrote:
>> When echo 0 > /proc/sys/vm/nr_hugepages is concurrent with freeing in-use
>> huge pages to the huge page pool, some free huge pages may fail to be
>> destroyed and accounted as surplus. The counts are like below:
>>
>>    HugePages_Total: 1024
>>    HugePages_Free: 1024
>>    HugePages_Surp: 1024
>>
>> When set_max_huge_pages() decrease the pool size, it first return free
>> pages to the buddy allocator, and then account other pages as surplus.
>> Between the two steps, the hugetlb_lock is released to free memory and
>> require the hugetlb_lock again. If another process free huge pages to the
>> pool between the two steps, these free huge pages will be accounted as
>> surplus.
>>
>> Besides, Free surplus huge pages come from failing to restore vmemmap.
>>
>> Once the two situation occurs, users couldn't directly shrink the huge
>> page pool via echo 0 > nr_hugepages, should use one of the two ways to
>> destroy these free surplus huge pages:
>>   1) echo $nr_surplus > nr_hugepages to convert the surplus free huge pages
>> to persistent free huge pages first, and then echo 0 > nr_hugepages to
>> destroy these huge pages.
>>   2) allocate these free surplus huge pages, and will try to destroy them
>> when freeing them.
>>
>> However, there is no documentation to describe it, users may be confused
>> and don't know how to handle in such case. So update the documention.
>>
>> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
>> ---
>>   Documentation/admin-guide/mm/hugetlbpage.rst | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
>> index 67a941903fd2..0456cefae039 100644
>> --- a/Documentation/admin-guide/mm/hugetlbpage.rst
>> +++ b/Documentation/admin-guide/mm/hugetlbpage.rst
>> @@ -239,6 +239,17 @@ this condition holds--that is, until ``nr_hugepages+nr_overcommit_hugepages`` is
>>   increased sufficiently, or the surplus huge pages go out of use and are freed--
>>   no more surplus huge pages will be allowed to be allocated.
>>   
>> +Caveat: Shrinking the persistent huge page pool via ``nr_hugepages`` may be
>> +concurrent with freeing in-use huge pages to the huge page pool, leading to some
>> +huge pages are still in the huge page pool and accounted as surplus. Besides,
>> +When the feature of freeing unused vmemmap pages associated with each hugetlb page
>     when
>
>> +is enabled, free huge page may be accounted as surplus too. In such two cases, users
>> +couldn't directly shrink the huge page pool via echo 0 to ``nr_hugepages``, should
>                                                                                 but should
>
>
> Also, please limit each line to <80 characters.
>
>> +echo $nr_surplus to ``nr_hugepages`` to convert the surplus free huge pages to
>> +persistent free huge pages first, and then echo 0 to ``nr_hugepages`` to destroy
>> +these huge pages. Another way to destroy is allocating these free surplus huge
>> +pages and these huge pages will be tried to destroy when they are freed.
>> +
> But I don't see why this is a user problem to be solved by users...

echo xx > nr_hugepages isn't a atomic operation against huge pages allocation/free, we can't
guarantee all huge pages will be destroyed after this operation. So users have to check if
huge pages are successfully destroyed.

>
>>   With support for multiple huge page pools at run-time available, much of
>>   the huge page userspace interface in ``/proc/sys/vm`` has been duplicated in
>>   sysfs.

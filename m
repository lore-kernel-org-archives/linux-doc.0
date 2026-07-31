Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967253B47D6
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489871; cv=none; b=bshtTlz2VCRB/eUDX3SdZes/idjlSmvHe55eqoaZNyRPM+/cqrkSU1AqngGWn4kzV/2YPImm9YxZsQOG7WycOmfu4mei+HH7JSz6CMl6brZGF0voiUQiP415hOgoDNR+chTtP6TR8g3oYdrt++aQSOqjgNwFi1EGesx3m1PHstE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489871; c=relaxed/simple;
	bh=ZFdUmihOqRupM3eduomyuvXsf2igh0HKi0c22JbELac=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h772SGvGK2P8XoBNE84a6AT4luoktr53hXUedQA7SVX36t/RfvKowCSfI4oUuKffOEb6oKbqhNqAzTHdGT03fSYY2lmy0q97sqrqz3stmJCOVvAaHpcf26emZQ5CNPxiyQjqkMCYURkt+g2i1Nzb7ZPiTZuIGv6fldBQMEpwwdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=bbF1xHMj; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="bbF1xHMj"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fMy1bKNlmKm92iiMqIZc2gaIjdmgUkv45tpOPxAofmE=;
	b=bbF1xHMjNwJo08H1DndeJBncdYtUkRgor62rhqgyyl3/t1whuzxJ9s27VT5konMiyilo9k0Lo
	P7UW0LRbKZvtJgmYIK2+Z9myCjidUNWi7c3plJCX1TKwUfa+7PwS+jwpk5R4IwLR7T71qVmRS72
	VtQNh/dTCxBS8aIcf5sGGzE=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hBL4b4mr4zLlTg;
	Fri, 31 Jul 2026 17:14:55 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id E287540565;
	Fri, 31 Jul 2026 17:24:23 +0800 (CST)
Received: from [10.174.178.9] (10.174.178.9) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 31 Jul
 2026 17:24:22 +0800
Message-ID: <46e3002b-3c1b-48f3-b4cf-88b9725fa07e@huawei.com>
Date: Fri, 31 Jul 2026 17:24:22 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm/ksm: fix advisor_min_pages_to_scan description
To: "David Hildenbrand (Arm)" <david@kernel.org>, <akpm@linux-foundation.org>,
	<xu.xin16@zte.com.cn>, <chengming.zhou@linux.dev>, <ljs@kernel.org>,
	<liam@infradead.org>, <vbabka@kernel.org>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <shr@devkernel.io>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
References: <20260731083526.3953421-1-tujinjiang@huawei.com>
 <20260731083526.3953421-3-tujinjiang@huawei.com>
 <33b55954-71e7-4e8d-868a-0440c1b28ae8@kernel.org>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <33b55954-71e7-4e8d-868a-0440c1b28ae8@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/7/31 17:17, David Hildenbrand (Arm) 写道:
> On 7/31/26 10:35, Jinjiang Tu wrote:
>> Both Documentation/admin-guide/mm/ksm.rst and the comment next to the
>> variable definition in mm/ksm.c describe advisor_min_pages_to_scan as a
>> lower limit of the pages_to_scan parameter, but that is not how the
>> scan-time advisor actually uses it. commit 4e5fa4f5eff6 ("mm/ksm: add ksm
>> advisor") only uses it to initialize ksm_thread_pages_to_scan when the
>> scan-time advisor is enabled. This will mislead the users.
>>
>> The semantics of advisor_min_pages_to_scan was updated in the v2 patchset
>> [1], but the documention wasn't updated.
> s/documention/documentation/
>
>> Update the documentation and comment to match the semantics of
>> advisor_min_pages_to_scan.
>>
>> Link: https://lore.kernel.org/linux-mm/20231028000945.2428830-2-shr@devkernel.io/ [1]
>> Fixes: 0710f38ad26a ("mm/ksm: document ksm advisor and its sysfs knobs")
>> Fixes: 66790e9a735b ("mm/ksm: add sysfs knobs for advisor")
> Drop these.
>
>> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
>> ---
>>   Documentation/admin-guide/mm/ksm.rst | 4 ++--
>>   mm/ksm.c                             | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
>> index c9f533b10f6f..c329ca747b8c 100644
>> --- a/Documentation/admin-guide/mm/ksm.rst
>> +++ b/Documentation/admin-guide/mm/ksm.rst
>> @@ -183,8 +183,8 @@ advisor_target_scan_time
>>           pages. The default value is 200 seconds.
>>   
>>   advisor_min_pages_to_scan
>> -        specifies the lower limit of the ``pages_to_scan`` parameter of the
>> -        scan time advisor. The default is 500.
>> +        specifies the initial value of the ``pages_to_scan`` parameter of
>> +        the scan time advisor. The default is 500.
> Makes sense.
>
>>   
>>   advisor_max_pages_to_scan
>>           specifies the upper limit of the ``pages_to_scan`` parameter of the
>> diff --git a/mm/ksm.c b/mm/ksm.c
>> index 7d5b76478f0b..1e3a9c657a64 100644
>> --- a/mm/ksm.c
>> +++ b/mm/ksm.c
>> @@ -342,7 +342,7 @@ static enum ksm_advisor_type ksm_advisor;
>>    * Only called through the sysfs control interface:
>>    */
>>   
>> -/* At least scan this many pages per batch. */
>> +/* Initial number of pages to scan per batch when the scan-time advisor is enabled. */
>>   static unsigned long ksm_advisor_min_pages_to_scan = 500;
> "when the scan-time advisor is enabled" is clear from the variable name.
>
> So I'd shorten it to "Initial number of pages to scan per batch"

Thanks, will update these.


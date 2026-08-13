Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6157C46A614
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619846; cv=none; b=ALuKK9wTbBYmwDd0aDMY+Zq1UKffMuuLpzuJZ6CJG87V1MZCqozNEyIiVV1phdqirVHoPUhfUadaDSQ35iiXq3180zhyFsybCtFq5YxMInQbHZItpCtYU0NZSzcAhaLj00Hw+AUQShEDSXCwVaWVselVnPc//2tcCgxcRYxJC8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619846; c=relaxed/simple;
	bh=kRlSx2IojWhEtTLTnHF74wzgV6LPHFCVT5YlSUSYfBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FGeG73I4TR1gHgCD45e2bgR/THaanazzePhhuBCWLbHaZKM/XF25Ib4qfLIAXiJs9/Urb3i3jO/GmRLuAzbbZEw8f3CEyZujr7o9ewiQpRCAjW10A7ylpZlIbI2+pHonkBL3fg6V/x/XxSccN53WdAzeJDMSLlZzugXwZus3Vrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=y7c/dPz2; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="y7c/dPz2"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uqDmY3x99GeRYdiCETTV3FiXwwCqkvOTnz+GthI0fBM=;
	b=y7c/dPz28ro3q31Gy+FjZHizteeThz0eP6V+Pu85s5S5LTOXmPnJVa0Xz9tRSJxNnIPDfTI3T
	RfZ7WjSVbaso1xw6KhBu88DZtJoAE8PWe3oi32Bqi5BauBWeLzqPS1vacRhTjKIF390H0fjW7ps
	XFBdV7Nmp0Kv9tgqS3HBUWk=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hLMxb1RCdz12LDV;
	Thu, 13 Aug 2026 19:06:43 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id ABD3640537;
	Thu, 13 Aug 2026 19:17:07 +0800 (CST)
Received: from [10.174.178.9] (10.174.178.9) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 19:17:06 +0800
Message-ID: <b35d14b5-65d8-4b8e-8754-de35f03d4b2d@huawei.com>
Date: Thu, 13 Aug 2026 19:17:05 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm/ksm: fix advisor_min_pages_to_scan description
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
CC: <akpm@linux-foundation.org>, <david@kernel.org>, <xu.xin16@zte.com.cn>,
	<chengming.zhou@linux.dev>, <liam@infradead.org>, <vbabka@kernel.org>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <shr@devkernel.io>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, <wangkefeng.wang@huawei.com>,
	<sunnanyong@huawei.com>
References: <20260813031722.569983-1-tujinjiang@huawei.com>
 <20260813031722.569983-3-tujinjiang@huawei.com> <an2g39TIN9v87enG@lucifer>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <an2g39TIN9v87enG@lucifer>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/8/13 18:56, Lorenzo Stoakes (ARM) 写道:
> On Thu, Aug 13, 2026 at 11:17:22AM +0800, Jinjiang Tu wrote:
>> Both Documentation/admin-guide/mm/ksm.rst and the comment next to the
>> variable definition in mm/ksm.c describe advisor_min_pages_to_scan as a
>> lower limit of the pages_to_scan parameter, but that is not how the
>> scan-time advisor actually uses it. commit 4e5fa4f5eff6 ("mm/ksm: add ksm
>> advisor") only uses it to initialize ksm_thread_pages_to_scan when the
>> scan-time advisor is enabled. This will mislead the users.
>>
>> The semantics of advisor_min_pages_to_scan was updated in the v2 patchset
>> [1], but the documentation wasn't updated.
>>
>> Update the documentation and comment to match the semantics of
>> advisor_min_pages_to_scan.
> Umm, firstly if this were wrong you'd need to change the name of the variable
> too instad of documenting it as something completely distinct.
>
> But secondly AFAICT the logic in scan_time_advisor() suggests that it truly does
> act as a minimum bound as well as being the initial value for
> ksm_thread_pages_to_scan.

As the cover letter[1] said, 'The initial value and the max value for the pages_to_scan parameter can
be limited with:', ksm_advisor_min_pages is used as the initial value, not the min value of pages_to_scan.

The v1 patchset[2] uses ksm_advisor_min_pages as the min value of pages_to_scan, but as David suggested, the
author changed the semantics of advisor_min_pages_to_scan in v2, but forgot to update the comments and variable names.

[2] https://lore.kernel.org/all/20231004190249.829015-1-shr@devkernel.io/

>
> So this patch just looks wrong to me.
>
> But in any case, you are making a claim here yet have provided no evidence for
> it. 'It is just the initial assignment' means nothing - if the logic can then
> only increase it up to the maximum value then it still acts as a minimum.
>
> A brief look at the logic suggests so.
>
> But in any case - the onus is on _you_ to prove that that's not happening.
>
> And even if you could do that, since it is _intended to be a lower bound_, the
> fix wouldn't be alterting comments or documentation, it would be to re-establish
> the minimum as a minimum.
>
>> Link: https://lore.kernel.org/linux-mm/20231028000945.2428830-2-shr@devkernel.io/ [1]
> This patch repeatedly states that it is the minimum time. You have failed to
> provide any analysis to suggest otherwise.
>
>> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
> Assisted-by: ?
>
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
>>
>>   advisor_max_pages_to_scan
>>           specifies the upper limit of the ``pages_to_scan`` parameter of the
>> diff --git a/mm/ksm.c b/mm/ksm.c
>> index 7d5b76478f0b..4a6cf8cf5d60 100644
>> --- a/mm/ksm.c
>> +++ b/mm/ksm.c
>> @@ -342,7 +342,7 @@ static enum ksm_advisor_type ksm_advisor;
>>    * Only called through the sysfs control interface:
>>    */
>>
>> -/* At least scan this many pages per batch. */
>> +/* Initial number of pages to scan per batch. */
>>   static unsigned long ksm_advisor_min_pages_to_scan = 500;
>>
>>   static void set_advisor_defaults(void)
>> --
>> 2.43.0
>>
> --
> Cheers, Lorenzo

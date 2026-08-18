Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A131F16B
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 02:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787020121; cv=none; b=jNiYClZyMS8zNq47WUVf3YQ4KQb3/jRRma1893v/NK5Tzhjk89TzPkqAcwxN0T13FTKUyVsAf/F7yY33H2XLI6URTl2yu9FyCpj01ax4xQAc2xPbRMOvEZFVQiZl7HdW2/GH+NG2Cv6jEYc8tOF2wiZOxFBh+UAoZ67bxX2TjEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787020121; c=relaxed/simple;
	bh=oET+iZnpFVhp2AUTy/ysmzH1x1ySwOna3XVvUgsYxY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dUnTletKNCqG2FoTP+wPzgOXQ0IhUb38RiRjmyHMT0s0pHOcEmbtohhKcQfSI2fMzpolAe3Nbd9CbACqr95TwTHaPWZJAP+lDPcVRRymwjAuHRFQ2Y29UwU5E8Am6Vvf2Xbsda/LkwpC/uY58ybUJqi2rCjFk0uK6IQZvohiOyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=RP+HWovR; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="RP+HWovR"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BwG3+/eW1U2Q5NmRKM3Ulxh9NPgPJjBj/aoaDVhJaoE=;
	b=RP+HWovRAZtuANBcKD7Gh61ix9TlZPCtDw5HwDs4/k54BGKo4OWAWedZY0PLmIWUW6T2q6KWr
	NfHmB/uA3n0a2Lmd0ea5azAf/u1iIKRP5WvJcHfoyu8oUkv0VYB3HApHBU8oMLG/fPfTyoJTiWs
	FzTDe+QvTgEQfs6G2yX8Ea4=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hPCyz2yZkz1K96b;
	Tue, 18 Aug 2026 10:17:47 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 077084055B;
	Tue, 18 Aug 2026 10:28:28 +0800 (CST)
Received: from [10.174.178.9] (10.174.178.9) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 10:28:26 +0800
Message-ID: <9dcc2527-21c5-4092-8ad1-d0755e787931@huawei.com>
Date: Tue, 18 Aug 2026 10:28:25 +0800
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
 <b35d14b5-65d8-4b8e-8754-de35f03d4b2d@huawei.com> <an3RcQgDuhmcAb37@lucifer>
 <238c66fa-8144-4cad-b90c-e7992b14ee6f@huawei.com> <aoM8bbWNeuEbfCdy@lucifer>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <aoM8bbWNeuEbfCdy@lucifer>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/8/18 0:55, Lorenzo Stoakes (ARM) 写道:
> On Mon, Aug 17, 2026 at 10:54:52AM +0800, Jinjiang Tu wrote:
>> 在 2026/8/13 22:32, Lorenzo Stoakes (ARM) 写道:
>>> Please show me the common courtesy of responding to _all_ the review given,
>>> not only the one point you want to respond to.
>>>
>>> I'm not happy with this patch, sorry, for the reasons stated that you chose
>>> to ignore.
>>>
>>> On Thu, Aug 13, 2026 at 07:17:05PM +0800, Jinjiang Tu wrote:
>>>> 在 2026/8/13 18:56, Lorenzo Stoakes (ARM) 写道:
>>>>> On Thu, Aug 13, 2026 at 11:17:22AM +0800, Jinjiang Tu wrote:
>>>>>> Both Documentation/admin-guide/mm/ksm.rst and the comment next to the
>>>>>> variable definition in mm/ksm.c describe advisor_min_pages_to_scan as a
>>>>>> lower limit of the pages_to_scan parameter, but that is not how the
>>>>>> scan-time advisor actually uses it. commit 4e5fa4f5eff6 ("mm/ksm: add ksm
>>>>>> advisor") only uses it to initialize ksm_thread_pages_to_scan when the
>>>>>> scan-time advisor is enabled. This will mislead the users.
>>>>>>
>>>>>> The semantics of advisor_min_pages_to_scan was updated in the v2 patchset
>>>>>> [1], but the documentation wasn't updated.
>>>>>>
>>>>>> Update the documentation and comment to match the semantics of
>>>>>> advisor_min_pages_to_scan.
>>>>> Umm, firstly if this were wrong you'd need to change the name of the variable
>>>>> too instad of documenting it as something completely distinct.
>>>>>
>>>>> But secondly AFAICT the logic in scan_time_advisor() suggests that it truly does
>>>>> act as a minimum bound as well as being the initial value for
>>>>> ksm_thread_pages_to_scan.
>>>> As the cover letter[1] said, 'The initial value and the max value for the pages_to_scan parameter can
>>>> be limited with:', ksm_advisor_min_pages is used as the initial value, not the min value of pages_to_scan.
>>> (Wrap your lines properly please, it's a common courtesy to learn how to
>>> send mail according to community conventions.)
>> Thanks for the reminder, I will follow this in the future.
>>
>>> One of the part of my review you ignored:
>>>
>>> 	But in any case, you are making a claim here yet have provided no
>>> 	evidence for it. 'It is just the initial assignment' means nothing
>>> 	- if the logic can then only increase it up to the maximum value
>>> 	then it still acts as a minimum.
>> ksm_thread_pages_to_scan is adjusted by scan_time_advisor() after a full
>> scan finishes. ksm_thread_pages_to_scan could increase or decrease depend
>> on the real scan time is longer or shorter than the target scan time.
>> The min value of ksm_thread_pages_to_scan is only limited by
>> KSM_ADVISOR_MIN_CPU, so ksm_thread_pages_to_scan could be smaller
>> than ksm_advisor_min_pages_to_scan.
> OK thanks :)
>
> With this explanation put in the commit msg somewhere on respin then we should
> be good.

I will update the commit message in v3.

>
> Probably we want to rename the variable too but can save that for another change
> since the attr is called min still (ugh).

Yes, I have considered to rename the variable, but the sysfs knob name is
advisor_min_pages_to_scan and couldn't be renamed to keep compatibility IIUC.
so I keep the variable name unchanged too, to keep the variable name and sysfs
knob name consistent.

>
>
> --
> Cheers, Lorenzo

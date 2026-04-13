Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B899331A7A;
	Mon, 13 Apr 2026 03:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776051312; cv=none; b=QBTg8bs8Ts08OtupO58nDi8vlFxElZMfxb1Fe4C61BnNVIUSuni69UN8j2uT6hTt5P3OSdzanr/CmmMEUa68PJYplEV2qKY0Xa9bRe0Yih1kRhytTrEK7gfbkNWz3/yfMmCTRzS56N9uNV3czW5eHljkQN2/HU5vWuB+z7tMhl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776051312; c=relaxed/simple;
	bh=mRXhO7OJ91Icrv5CxGoVLbAlzDpQHFAMFe+0hPDPMaw=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ehydnc5kwvmk31AyNSp5F4MAzE1nX8bjWTykVnG4JQzx8Ivt76dtBbFeGMq4+tmONKyr59ZKpxBfnAd5M2ZwzMx+6Rhr2QThV81vi9CHUsN0Fix50+6WFquNa5RyK1uyaTt1VXGA8xvO+ulvYmTzVyHjfA/rUzDCluVSKk7dhtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=dKSsW1eQ; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="dKSsW1eQ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0lo8Xlh8J6AAcOfJlZi1VaS6PaTCJdZoDYuoT/zI/d8=;
	b=dKSsW1eQ1/cdHkunTqu4A83di7BCBCT8wS5h6xfCfFBEtG+7ubbFtUUSG4F+xTed/xU+DmrKw
	x3QDMPf9qZxNXaJsBEiBtWUCvLuNMYdHxo0cKUfN6C8W+bjlayz2F5vMkDY3zRgAIS0r0Wp4nwC
	sDxdhKJu5UjXTPq3WNgEWPo=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fvCYV3Rcdz1K980;
	Mon, 13 Apr 2026 11:28:46 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 3404940571;
	Mon, 13 Apr 2026 11:35:01 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Apr 2026 11:35:01 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Apr 2026 11:35:00 +0800
Subject: Re: [PATCH v2 1/3] mm/memory-failure: report MF_MSG_KERNEL for
 reserved pages
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <kernel-team@meta.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org>
 <20260331-ecc_panic-v2-1-9e40d0f64f7a@debian.org>
 <e074d5de-f494-4995-2521-32de4f2bd34f@huawei.com>
 <adkCtR0LzJ7aWfm-@gmail.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <1265c3f5-9fdc-8718-6323-147fcbf52de4@huawei.com>
Date: Mon, 13 Apr 2026 11:34:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <adkCtR0LzJ7aWfm-@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/4/10 22:03, Breno Leitao wrote:
> On Tue, Apr 07, 2026 at 10:56:39AM +0800, Miaohe Lin wrote:
>> On 2026/3/31 19:00, Breno Leitao wrote:
>>> When get_hwpoison_page() returns a negative value, distinguish
>>> reserved pages from other failure cases by reporting MF_MSG_KERNEL
>>> instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
>>> and should be classified accordingly for proper handling by the
>>> panic_on_unrecoverable_memory_failure mechanism.
>>>
>>> Signed-off-by: Breno Leitao <leitao@debian.org>
>>> ---
>>>  mm/memory-failure.c | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>>> index ee42d4361309..6ff80e01b91a 100644
>>> --- a/mm/memory-failure.c
>>> +++ b/mm/memory-failure.c
>>> @@ -2432,7 +2432,11 @@ int memory_failure(unsigned long pfn, int flags)
>>>  		}
>>>  		goto unlock_mutex;
>>>  	} else if (res < 0) {
>>> -		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
>>> +		if (PageReserved(p))
>>> +			res = action_result(pfn, MF_MSG_KERNEL, MF_IGNORED);
>>
>> Is it safe or common to check page flags without holding extra refcnt?
> 
> 
> Yes, this is safe. At this point the page has HWPoison set, preventing
> reallocation.
> 
> PageReserved is an atomic flag test on struct page memory that's always
> valid for online PFNs.
> 
> Reserved pages are inherently stable (kernel text, firmware, etc.) and
> don't change status dynamically.
> 
> This follows the same pattern as the existing is_free_buddy_page(p)
> check a few lines above, which also reads page state without an extra
> refcount.

Got it. Thanks for your explanation.

Thanks.
.

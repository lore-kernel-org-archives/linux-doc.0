Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0342C4F8;
	Wed, 12 Aug 2026 10:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531964; cv=none; b=k+J+jbrlFK4Vdxet8CikxwIzNiAJda+oiaX61nwqnd6n65rOhxrYWriKagE6hkRJ2HHjAMYJ5Ostitg0F+VszNciRceJVm8AWo61Som0gMeZJuZ4OjfUppV+/j8MsEUQYdjvYyCeEk7RV4vSekKKXVXjUzqIruITPCMo8gw/rDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531964; c=relaxed/simple;
	bh=5wCc2uS0BwdOMTveT2BgXTBGioQIAU6hEpZepCQSyAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZ7Uzxm20gOtwOm/8RRdj8PIE8fqZ2NK+lllYnUDg2cra7WgCdN5Z9S9t2FW84AQXw1sQljVJxTF/vSnBYcp6QMELqEF7K7f3LwmGkeeGGyCUghS4RJAlI//PZr6TwXVgEcYqUnxabMUHGg/OrKVHRnQ6pIuhIMnOSlXs97kec4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VVk9KPEZ; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VVk9KPEZ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786531953; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5SXNks2tZYXAMlHzcZVIQbNtii10CEKmrX+VrYK5fTo=;
	b=VVk9KPEZNPrOv++Pq8ZJ3gYqZX5qyayflJ6hbJi1mlNbzNKrRmeT0f100CbEnhFd7U145MMBiRAHgqDbSIYQWatUchKoFITLn54BN/ojF+IJqJMyN+/X3Gyqtt0dETws0xtWBGl0VHzG/EjJf+XZn2oq0Pdn7SDGlDGQWDcqW9Y=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X8rQc9X_1786531950;
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8rQc9X_1786531950 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 12 Aug 2026 18:52:31 +0800
Message-ID: <6e4aae7b-2c71-4109-945c-6481efde3636@linux.alibaba.com>
Date: Wed, 12 Aug 2026 18:52:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Docs/mm: fix THP policy counts in transhuge
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Song Hu <husong@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org,
 ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, usama.arif@linux.dev, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812080313.330413-1-husong@kylinos.cn>
 <20260812080313.330413-3-husong@kylinos.cn> <anw8ASKdPWW9v86d@lucifer>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <anw8ASKdPWW9v86d@lucifer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/12/26 5:27 PM, Lorenzo Stoakes (ARM) wrote:
> On Wed, Aug 12, 2026 at 04:03:13PM +0800, Song Hu wrote:
>> transhuge.rst claims seven policies for transparent_hugepage_shmem= and
>> four for transparent_hugepage_tmpfs=.  Both boot parameters are parsed by
>> shmem_parse_huge(), which accepts six: always, within_size, advise, never,
>> deny and force.  The "four" applies only to the per-mount huge= option
>> (shmem_param_enums_huge).  Fix both counts to six.
>>
>> Signed-off-by: Song Hu <husong@kylinos.cn>
>> ---
>>   Documentation/admin-guide/mm/transhuge.rst | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
>> index b187d618452f..72e944f49da5 100644
>> --- a/Documentation/admin-guide/mm/transhuge.rst
>> +++ b/Documentation/admin-guide/mm/transhuge.rst
>> @@ -389,14 +389,14 @@ is not defined within a valid ``thp_anon``, its policy will default to
>>   Similarly to ``transparent_hugepage``, you can control the hugepage
>>   allocation policy for the internal shmem mount by using the kernel parameter
>>   ``transparent_hugepage_shmem=<policy>``, where ``<policy>`` is one of the
>> -seven valid policies for shmem (``always``, ``within_size``, ``advise``,
>> +six valid policies for shmem (``always``, ``within_size``, ``advise``,
>>   ``never``, ``deny``, and ``force``).
> 
> I'm not sure we really want to advertise 'special' testing modes like this,
> sorry. These are not modes anybody should be using in practice especially at
> kernel boot. We should probably stop people doing that...!

Yes, 'deny' and 'force' are testing-only configurations and really 
shouldn't be exposed via the kernel command line. I'll clean them up.

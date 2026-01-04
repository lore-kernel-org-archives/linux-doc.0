Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5824279DB7
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 21:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767561927; cv=none; b=Q4mVzLUNNktWlO4xxObMxfSoquwPC1Nfl3FM7bC95ej5fBDCMMFTc/BZ0JM2M6eQitoFdT64OL88UgnS+L2dKgQ1rAOpWqHt1SuTQC2am6Yplc0hWnn/p/vCGs2wcng3LTzUj/33+9n8egubi0RyROdh8VTFJBeLxsIEaAnXUyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767561927; c=relaxed/simple;
	bh=ZsoC2tMVlEa/V20wtG1BE1AXcEXGl7jC4ulSuj+rZGw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=p/agXd5snFkM3H3qnd97QlWNEanrGve1rB50lHIFfeR74/3yJ6imONg4mvxLYHnXG2muOmJDtwLMuvA7OGMTc0EQpEB4aANGzcZQ7qu80N8SMitQqL55wMs9k5XUbntFRY286iCbtwAbujKdSRq3cTFEpMbLcx4u6P94hhJeyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HkAjPYRs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oof5REzp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HkAjPYRs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oof5REzp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767561924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOqQ/3LsDQyPGmsZ/qMD/HHwJen4ANQ7/h6zgU7Vmbg=;
	b=HkAjPYRsH8KlQT8BWYwpQLWMpMkLRq0Gt0OVNGoIgQTG0gk02GZSA6iCgZ29rzXR5v3n+j
	G7r6W4YKs771P/XfSiHN01FU0JXfZDQmAyd6dJYr8nAf6Dy8ZsCmf5uyIfNWZ01Cec30WA
	Ft8RkmJZBzBpUGWHBR95elaNuJbjzdk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-L75L3ahPNpmwlu6QSzSymg-1; Sun, 04 Jan 2026 16:25:23 -0500
X-MC-Unique: L75L3ahPNpmwlu6QSzSymg-1
X-Mimecast-MFC-AGG-ID: L75L3ahPNpmwlu6QSzSymg_1767561923
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a360b8096so372236966d6.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 13:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767561923; x=1768166723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aOqQ/3LsDQyPGmsZ/qMD/HHwJen4ANQ7/h6zgU7Vmbg=;
        b=Oof5REzpqhZ1UbHUIYRBSShC5Ib+bM/NY7sb9TlDleNYvREuuiCXQPIWPmpGRi3sjL
         2Yzsvm/jDpnP6ymlCmxsKRoCW86QiqWU7pn+asJ1hXT1VDLRpyWjqZ9jYQFDvK1jCIvc
         ml7YYrjv/zlePFGGbukjMgkQLNYP0rSXroTgA8Dp+geqkDeJPE/QV1hEjzqPM3tDrpFC
         S/oFYt7cDbpHGa+r6M2NbsZA2gr5GM5P3CpCXWz118tmOna9QTqvaP30IaUPZ2PXFijE
         P6WmXIAl4YAweZQb35p8SlrqNRvhHhn0AZQWnQu5Rj/WuADKG/NscoDwsvwEAfpTqHui
         U3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767561923; x=1768166723;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOqQ/3LsDQyPGmsZ/qMD/HHwJen4ANQ7/h6zgU7Vmbg=;
        b=Mh0T1d1d8bqpxNR0wwn3dW0QqKjmIddU/wREoGqoUgeaQLOXAA04VmfJTz+4B9nZOL
         iCusQcSqGjPpvMF72RpA/MHiZ0fg85gUebRLtFQ6fdP2I4mf+DELIDRiUji0IJmtNZc1
         rbQe57SO4/VsBdof4mUOI9nqzY9CqFTgbP/Ab+P2jpHlWJmaDDSpJP69l+IoRpe1Cu78
         Q1EsPb2Gn8D887VRAmhRo5Of6z0mx0nPG3x6OQROxq3+ws5t1WCctYMrMVblLxtVM1g3
         +O9c3PD3f7+iMPaXv2jlDEPKNk4npcGPEkf7TLZ4KQ2morKoIjCdDepeiIvAzEMVQM91
         XF6A==
X-Forwarded-Encrypted: i=1; AJvYcCVaap5M5UlWYR8K2GHMkQSqk04mKnPkRxHQvPNW/JRXZRFqsdQdSo3Cb+USu3ZFr7jahjadXllSd8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM/q5w3fbtNx5z26heAdvto+nfU9VKgpmtHPiUmPPKjY6TU4Xb
	LiSfuposlNUcBX14AQcs70CcxVtHCC2o6fOmw1yy6DpizFTvGuCi0iyO7JsUdo8afg1wee33X03
	5Bvz5LuMci0kBNZ3jg7oVERNsIxeJPlU0XFYmU0y3a7O13mnRmcX7U9jn36gptQ==
X-Gm-Gg: AY/fxX4YEuYVH/WoLV7g1BhwkvLBrgBrLNYtYSSKnrZWttbN1pYJ1du6Mr2wCwbODdZ
	+YYV/ohhvL0XP/4hjugzGCe2wVxtLBNdALPlB9/PTh6XpQSfAdG8p1cKe77cFCQJ7+Xsw775BVM
	xdIno7Kf3UujLbIYnUaEGEQOiaZvm7a2X+Bln+V6UxW1NFcP5MG7sJ/lgeFTZU6WyjtscfNbTnW
	sR4PoCRREC89QBMfSjxnRwsusTXVnJWMJ6hb11YCIz/Hw5KGdSRHtMqKAmjeTaCX0e8l67B4s/D
	2lcGWVcsadXu/DdKSxxrGf63byL5TBBE//Hod3QWJUKerRbVnWXgeDICTYs4tZMqzmRauQ0gHMF
	Z0S8eqCtTFaE2EGihdQV52DVTRRNozcMCqRc0tAVbH5fUz8C0WQGBG2th
X-Received: by 2002:a05:6214:1256:b0:890:5096:5135 with SMTP id 6a1803df08f44-8905096517dmr136138636d6.68.1767561922716;
        Sun, 04 Jan 2026 13:25:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjEWzmCELS1IKWJk+NFIRBxSBEzNKCkY4OMkGpVYZP90YAaap30Vzj2VWFlb3eK91+sSj6ZQ==
X-Received: by 2002:a05:6214:1256:b0:890:5096:5135 with SMTP id 6a1803df08f44-8905096517dmr136138446d6.68.1767561922268;
        Sun, 04 Jan 2026 13:25:22 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm336419506d6.43.2026.01.04.13.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 13:25:21 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <f8539426-92b0-42f3-99c4-70962c2db96d@redhat.com>
Date: Sun, 4 Jan 2026 16:25:20 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cgroup/for-6.20 PATCH v2 2/4] cgroup/cpuset: Consistently
 compute effective_xcpus in update_cpumasks_hier()
To: Chen Ridong <chenridong@huaweicloud.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Sun Shaojie <sunshaojie@kylinos.cn>
References: <20260101191558.434446-1-longman@redhat.com>
 <20260101191558.434446-3-longman@redhat.com>
 <758f42df-52c2-4660-8ef7-1cbacb9323d2@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <758f42df-52c2-4660-8ef7-1cbacb9323d2@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/26 9:48 PM, Chen Ridong wrote:
>
> On 2026/1/2 3:15, Waiman Long wrote:
>> Since commit f62a5d39368e ("cgroup/cpuset: Remove remote_partition_check()
>> & make update_cpumasks_hier() handle remote partition"), the
>> compute_effective_exclusive_cpumask() helper was extended to
>> strip exclusive CPUs from siblings when computing effective_xcpus
>> (cpuset.cpus.exclusive.effective). This helper was later renamed to
>> compute_excpus() in commit 86bbbd1f33ab ("cpuset: Refactor exclusive
>> CPU mask computation logic").
>>
>> This helper is supposed to be used consistently to compute
>> effective_xcpus. However, there is an exception within the callback
>> critical section in update_cpumasks_hier() when exclusive_cpus of a
>> valid partition root is empty. This can cause effective_xcpus value to
>> differ depending on where exactly it is last computed. Fix this by using
>> compute_excpus() in this case to give a consistent result.
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   kernel/cgroup/cpuset.c | 14 +++++---------
>>   1 file changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index da2b3b51630e..37d118a9ad4d 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -2168,17 +2168,13 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
>>   		spin_lock_irq(&callback_lock);
>>   		cpumask_copy(cp->effective_cpus, tmp->new_cpus);
>>   		cp->partition_root_state = new_prs;
>> -		if (!cpumask_empty(cp->exclusive_cpus) && (cp != cs))
>> -			compute_excpus(cp, cp->effective_xcpus);
>> -
>>   		/*
>> -		 * Make sure effective_xcpus is properly set for a valid
>> -		 * partition root.
>> +		 * Need to compute effective_xcpus if either exclusive_cpus
>> +		 * is non-empty or it is a valid partition root.
>>   		 */
>> -		if ((new_prs > 0) && cpumask_empty(cp->exclusive_cpus))
>> -			cpumask_and(cp->effective_xcpus,
>> -				    cp->cpus_allowed, parent->effective_xcpus);
>> -		else if (new_prs < 0)
>> +		if ((new_prs > 0) || !cpumask_empty(cp->exclusive_cpus))
>> +			compute_excpus(cp, cp->effective_xcpus);
>> +		if (new_prs < 0)
>>   			reset_partition_data(cp);
>>   		spin_unlock_irq(&callback_lock);
>>   
> The code resets partition data only for new_prs < 0. My understanding is that a partition is invalid
> when new_prs <= 0. Shouldn't reset_partition_data() also be called when new_prs = 0? Is there a
> specific reason to skip the reset in that case?

update_cpumasks_hier() is called when changes in a cpuset or hotplug 
affects other cpusets in the hierarchy. With respect to changes in 
partition state, it is either from valid to invalid or vice versa. It 
will not change from a valid partition to member. The only way new_prs = 
0 is when old_prs = 0. Even if the affected cpuset is processed again in 
update_cpumask_hier(), any state change from valid partition to member 
(update_prstate()), reset_partition_data() should have been called 
there. That is why we only care about when new_prs != 0.

The code isn't wrong here. However I can change the condition to 
(new_prs <= 0) if it makes it easier to understand.

Cheers,
Longman


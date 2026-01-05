Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66023C516
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 04:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767585987; cv=none; b=F5NUvRebHQY8xJdEVyoQq1bwPr2lRs6QeWCELcymp0jen0dJqpGViwmj8L1O6ygKBzXVAqllwRC0bwJqvsVaaxQ/tGZoRvXdF+EFJhSvFH7M24OTnLU1y94rRCBdJKAe0G4ZCeJp0UbfRPuZng3vMpLDdfbq8TwhnVla0LNdDWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767585987; c=relaxed/simple;
	bh=2Ign9LzXnCZy9ShLfB1eXWY6kD08zIYXpywwJRNYm1w=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qTIJKm0VEKAhwk8qrvjb5cNvbP3m4X3YQPapfQMrsjDn40MDnvK37AltliqaYn4sH9txvfyV56l+RRkSxYcnIWXK32XZKGjtvGwWsNwl57BVXIke8xD4Z96L3uALv+H0X/+PVW3FpkyK7QN63REwjX1xZdNF1OP6m+WEcvWJDQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Evot1JJQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VR/MY8PJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Evot1JJQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VR/MY8PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767585984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2Ay0P6oqFz3kKz9b4RMbn0EQKm2M2v4BWX6Fzz7A2A=;
	b=Evot1JJQLdQmDoP04HBGNU7OoVTN8ajzhxYRxhktIGzED50dxG5apRBfSkc1mbXonhhoxE
	dejkAumH3KCRhlkBanRTIRdDTcbeRXyTW6o0h47m8KHhvKcwsMpGpD8qY6VbzhoFBymMds
	BGjd+rRqV8QQLjEkzgAzyOs3E50EwX0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-Yf_rUWKtOsiKyR6dckXxTA-1; Sun, 04 Jan 2026 23:06:23 -0500
X-MC-Unique: Yf_rUWKtOsiKyR6dckXxTA-1
X-Mimecast-MFC-AGG-ID: Yf_rUWKtOsiKyR6dckXxTA_1767585982
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bc4493d315so3389743385a.1
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 20:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767585982; x=1768190782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F2Ay0P6oqFz3kKz9b4RMbn0EQKm2M2v4BWX6Fzz7A2A=;
        b=VR/MY8PJNpFne0kYp9v+X1Pwom2sjaq8GZGQPQ5jzlTMUFqbnD1W+vCq1Vo5L2zyKU
         J1/Bx8NbrS8Ste2tNN+vLr+5YCwE8lRmifcX+kO7g8EEVuxYkPQQ2aAP1tWz2QQDiZ23
         eJjQrZJnLJuVqis2J7+0MQEIQ/YPWTHUNUBqW9HeI8vSXlmPCEz2OX8bwHF6J8uAqCp7
         XK9un4LpcVkBOkJTpmx2Pc19/8uBx/kaB16XJtQ2wRiaoQk7+lTpMMWz9/fUdWRfNa1J
         /9tDtG0qncxq3iK9U1upilg9nOPNWxcTe/5sO/Fui9fhycXLiFB5Yb43agQy0ihFd59m
         bivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767585982; x=1768190782;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2Ay0P6oqFz3kKz9b4RMbn0EQKm2M2v4BWX6Fzz7A2A=;
        b=UAhNySFeiev2P4hrA0mmP/dsO/+ftcbr+ydY/KwLg+O8crKc9x6TcWJdEk9Lnafzgk
         N+gOMX4njgwBQtikfAxWHJak9/y932KQArwOeLO8GmqrlF4IvDZMpzChNMSsp2AMMZcf
         Qek3HME4XG+6hL30a6apTkjtCv0UDPkwwPAS44K8Eds9n480dEb4xJ9Bo62R41KWX8Ly
         OsJZpVabmXmfK3trSjXPKm3j5jkyl6gLA42K+TsPMET8xbTHcWwqUZP2IS/yyA6R6Nko
         BeBPODFNLGcMfSELijd6cW/CAZItFNPh7EuS28NEOxG2NRa+rHZnWPsjDWG+0aGm1Pwt
         EmgA==
X-Forwarded-Encrypted: i=1; AJvYcCUAJBvxWc2CDPeQ0r7RSsLexp13IXu7IU62YNSWqDE5M9Ikcob0Kq39vFuihVXVdvEA3RdGIlAswHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgMLbGWEGQkC0k3vkjIY6OMhC7aSU+BOOF182y3Ija8whrSKLX
	unAZDK2z5zQVGXvLmKMMTnmmbrWqhrFSdcNjYq/yX0nj3AWnxvMXT5ICJV5tox6tl4yFecO2yUY
	u+6RGAKfPdhGgXUb3s1twNROYvFw0dzFHsIPE5Wh7uzErlOgjCKWV5A3bGPOLMA==
X-Gm-Gg: AY/fxX5OoDAGJlkQBDtifTWWoGyqqNXSjGLNWoXUXkrr4GP/DjRKXMUIV5ASvOVfdFD
	dgEeUnh7VH3MM/zYMhQe/GWEkgZUozHNr6l2OwshIMRVg/Cqq/LMLl0/ALuuZ5JNtJjsYHggunq
	RszApfP/P8gGgs/gKIEfvskuw8yRgmhtnl6Ws992ugM+0ft7GotwhFHJcjTJVe9QS3xd3jLRrr8
	U7AA5U/5ryGK6+vXJyiK60cqMwWkOe7GmjumFzXgzhU7KZ1p5WIZxMcMDOJtqgH490BtpfTtyMp
	pAGYoaLLguA6/apRnWwK4IyvAt56dewGu60M44FQyPVYNHhllCg6FJ27cTJznrTBSt1X9vBiT1w
	bbQ2xN9ZWCeD21NqbGvD7mpytETiA9LyDaxHzxZUQgQ9FQjVvpSF9IUHy
X-Received: by 2002:a05:620a:4116:b0:8b5:5a03:36df with SMTP id af79cd13be357-8c08f657be8mr7018375385a.3.1767585982494;
        Sun, 04 Jan 2026 20:06:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZZcFdmlbUnig7+iVAJ2yL8eFlW7ffXYP0YAZ/rTdZzKW80JYYsX60b8bsdOJbWu6XqL3dCw==
X-Received: by 2002:a05:620a:4116:b0:8b5:5a03:36df with SMTP id af79cd13be357-8c08f657be8mr7018373585a.3.1767585982067;
        Sun, 04 Jan 2026 20:06:22 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44e314sm337005146d6.49.2026.01.04.20.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 20:06:21 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <f541b93b-7bbf-4530-bca6-dc5b5b1f481c@redhat.com>
Date: Sun, 4 Jan 2026 23:06:20 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cgroup/for-6.20 PATCH v2 2/4] cgroup/cpuset: Consistently
 compute effective_xcpus in update_cpumasks_hier()
To: Chen Ridong <chenridong@huaweicloud.com>, Waiman Long <llong@redhat.com>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Sun Shaojie <sunshaojie@kylinos.cn>
References: <20260101191558.434446-1-longman@redhat.com>
 <20260101191558.434446-3-longman@redhat.com>
 <758f42df-52c2-4660-8ef7-1cbacb9323d2@huaweicloud.com>
 <f8539426-92b0-42f3-99c4-70962c2db96d@redhat.com>
 <c17051c3-82ac-4ca5-8823-33327cadd073@huaweicloud.com>
 <ec6e1ee4-b52e-417f-9413-3dfca0ec8eb3@redhat.com>
 <d49cc8af-509b-44b8-ada4-f8bbdbd37f89@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <d49cc8af-509b-44b8-ada4-f8bbdbd37f89@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/4/26 10:58 PM, Chen Ridong wrote:
>
> On 2026/1/5 11:50, Waiman Long wrote:
>> On 1/4/26 8:15 PM, Chen Ridong wrote:
>>> On 2026/1/5 5:25, Waiman Long wrote:
>>>> On 1/3/26 9:48 PM, Chen Ridong wrote:
>>>>> On 2026/1/2 3:15, Waiman Long wrote:
>>>>>> Since commit f62a5d39368e ("cgroup/cpuset: Remove remote_partition_check()
>>>>>> & make update_cpumasks_hier() handle remote partition"), the
>>>>>> compute_effective_exclusive_cpumask() helper was extended to
>>>>>> strip exclusive CPUs from siblings when computing effective_xcpus
>>>>>> (cpuset.cpus.exclusive.effective). This helper was later renamed to
>>>>>> compute_excpus() in commit 86bbbd1f33ab ("cpuset: Refactor exclusive
>>>>>> CPU mask computation logic").
>>>>>>
>>>>>> This helper is supposed to be used consistently to compute
>>>>>> effective_xcpus. However, there is an exception within the callback
>>>>>> critical section in update_cpumasks_hier() when exclusive_cpus of a
>>>>>> valid partition root is empty. This can cause effective_xcpus value to
>>>>>> differ depending on where exactly it is last computed. Fix this by using
>>>>>> compute_excpus() in this case to give a consistent result.
>>>>>>
>>>>>> Signed-off-by: Waiman Long <longman@redhat.com>
>>>>>> ---
>>>>>>     kernel/cgroup/cpuset.c | 14 +++++---------
>>>>>>     1 file changed, 5 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>>>>>> index da2b3b51630e..37d118a9ad4d 100644
>>>>>> --- a/kernel/cgroup/cpuset.c
>>>>>> +++ b/kernel/cgroup/cpuset.c
>>>>>> @@ -2168,17 +2168,13 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
>>>>>>             spin_lock_irq(&callback_lock);
>>>>>>             cpumask_copy(cp->effective_cpus, tmp->new_cpus);
>>>>>>             cp->partition_root_state = new_prs;
>>>>>> -        if (!cpumask_empty(cp->exclusive_cpus) && (cp != cs))
>>>>>> -            compute_excpus(cp, cp->effective_xcpus);
>>>>>> -
>>>>>>             /*
>>>>>> -         * Make sure effective_xcpus is properly set for a valid
>>>>>> -         * partition root.
>>>>>> +         * Need to compute effective_xcpus if either exclusive_cpus
>>>>>> +         * is non-empty or it is a valid partition root.
>>>>>>              */
>>>>>> -        if ((new_prs > 0) && cpumask_empty(cp->exclusive_cpus))
>>>>>> -            cpumask_and(cp->effective_xcpus,
>>>>>> -                    cp->cpus_allowed, parent->effective_xcpus);
>>>>>> -        else if (new_prs < 0)
>>>>>> +        if ((new_prs > 0) || !cpumask_empty(cp->exclusive_cpus))
>>>>>> +            compute_excpus(cp, cp->effective_xcpus);
>>>>>> +        if (new_prs < 0)
>>>>>>                 reset_partition_data(cp);
>>>>>>             spin_unlock_irq(&callback_lock);
>>>>>>     
>>>>> The code resets partition data only for new_prs < 0. My understanding is that a partition is
>>>>> invalid
>>>>> when new_prs <= 0. Shouldn't reset_partition_data() also be called when new_prs = 0? Is there a
>>>>> specific reason to skip the reset in that case?
>>>> update_cpumasks_hier() is called when changes in a cpuset or hotplug affects other cpusets in the
>>>> hierarchy. With respect to changes in partition state, it is either from valid to invalid or vice
>>>> versa. It will not change from a valid partition to member. The only way new_prs = 0 is when old_prs
>>>> = 0. Even if the affected cpuset is processed again in update_cpumask_hier(), any state change from
>>>> valid partition to member (update_prstate()), reset_partition_data() should have been called there.
>>>> That is why we only care about when new_prs != 0.
>>>>
>>> Thank you for your patience.
>>>
>>>> The code isn't wrong here. However I can change the condition to (new_prs <= 0) if it makes it
>>>> easier to understand.
>>>>
>>> I agree there's nothing wrong with the current logic. However, for clarity, I suggest changing the
>>> condition to (new_prs <= 0). This allows the function's logic to be fully self-consistent and
>>> focused on a single responsibility. This approach would allow us to simplify the code to:
>>>
>>>      if (new_prs > 0)
>>>          compute_excpus(cp, cp->effective_xcpus);
>>>      else
>>>          reset_partition_data(cp);
>>>
>>> Since reset_partition_data() already handles cases whether cp->exclusive_cpus is empty or not, this
>>> implementation would be more concise while correctly covering all scenarios.
>> effective_xcpus should be set when exclusive_cpus is not empty or when the cpuset is a valid
>> partition root. So just checking new_prs for compute_excpus() is not enough.
>>
> If we change the condition to (new_prs <= 0), it will reset the partition data even when we call
> compute_excpus (for !cpumask_empty(cp->exclusive_cpus)), so we should still get the same result, right?

Changing the condition to (new_prs <= 0) won't affect the result except 
for a bit of wasted cpu cycles. That is why I am planning to make the 
change in the next version to make it easier to understand.

Cheers,
Longman


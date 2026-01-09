Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED62D7DC4
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 04:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767932077; cv=none; b=YfXhCXusjlMFNX3/Q4ZmsHNe+JOjbx5iGfOrmJ4rNx+HBx1zz1j1HWsw/e7s7wnWpFGIQjopse8TDPgPDzfV2rzGPcsDOTE1bkLF+0Sh6ykhL+aHJtd7Qp9A2+vS2t7x8YSon4KLM7XbJpEmPB/sfhh7icyM8OaAr83sB2wX+yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767932077; c=relaxed/simple;
	bh=i1fLrSbyd81f0S0PiHsOLrXgKUHshwekbk4YumK+lKk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kkwd5va2bikdMwAF3SXO/AnQBCdXJL/gwOCV8ccSHNhI9qQlCD1piCkfZ+yuCml46EjtWSj7kECLPlV5bMbw+XPYXTEA4dsU5Sj0Xo6ap3j9snrNPt/uJGxz1oBK4Lk+/VZJILlS3goLWU0WolSL3bkbZY8czrPUJxjvMTs8GWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJ+3J3Jq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TSc44ls3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJ+3J3Jq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TSc44ls3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767932074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nghXJ/jMMYOZQxSCZgT2jI2VxzkfVAzdpBsOhl57SOs=;
	b=iJ+3J3JqwZXyutTQStn4nqfkYLaVbxZA0EYTUwDZoQGuZ26TGoB6I4Uu5CPA2uTRXho067
	T/u3cvxqHRCCfrg8neXmkW1c3sAsjLCF2pKNykfeTtmukN5D7LNDfv21p/tQYhNWiUqD/T
	4yNnd8ZjwiTsGp4SPb0yWSmdajS/Hik=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-pMEZR2HwMXW8ZVLaA7LB-g-1; Thu, 08 Jan 2026 23:14:33 -0500
X-MC-Unique: pMEZR2HwMXW8ZVLaA7LB-g-1
X-Mimecast-MFC-AGG-ID: pMEZR2HwMXW8ZVLaA7LB-g_1767932073
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e2342803so977501885a.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 20:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767932073; x=1768536873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nghXJ/jMMYOZQxSCZgT2jI2VxzkfVAzdpBsOhl57SOs=;
        b=TSc44ls3TAH3YV2Kg6ngUt8IlNeqgthONicsUZm8s+nIAT9mW71/3W8Q+wFFWiF6I8
         fsH/vn56Gzx2csUgUGccErNsq5jfwC6qdg1gSpJ/U6UsnB4t0nx6Th29hJGBpv59dE/A
         XhyTBIm/VdQN9VCIat53UbUrjh/5fq63obVKLfFGv3cD3/WKGwN+Wu6Rm1rnfFd5JuvO
         DrnYEt9N16xsbt2M2MOiPLZjrpPkS5Q0TLAU609yh9nyYn6eDdZvGFzOLUdmG/dWsDoX
         ymJrTtp22x91QxOEoZ9gwlCL8nWhGQc9PoJfxdIdm/jmYcTRzC00JzXETpN/k9S9K+vm
         f0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767932073; x=1768536873;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nghXJ/jMMYOZQxSCZgT2jI2VxzkfVAzdpBsOhl57SOs=;
        b=BFkyJH6Lwyml9SUWWsl8F7Lx3eRlu6pHtTjAj5bi89YNVlegOcYLdnEkCyZDzUabjG
         +OVeeVTzr6HPWOmMBpRSLvUYIIhngDcmu0NjgeNR5DIhei7fLsJ8OciVteckIdMITVGA
         u/y15XfATBJ9PGoChg6ZwIGM4Up6gJBvDF1RXecyHgx/8KMWTxWng9xjU+GZekA1MhxP
         kyAhGLPRXwcTM23iEOFfSS2ZgFDj4yiD9ZjKmeC8LQmBYRsbaTin7mTk098x/W/9qGGc
         Bg6ByjWlo3mRtH9YYOEE6L7R4DEVZhMaXJl5rNsI8YKeDzcEJDFzsS0K3rYg2XGHg9oS
         c1uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv47mWEETbVJi38SE8fU41dDLv/K3gcswNRZBGXVYmATHRFYQFfUa7g6FwqZ9nMGEiKHLSM9leCOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlWgKGY+uK+nvSpJR5p9x46LOLIE4KMDTQYJkBxU0ge9GxaMX2
	+1nVxEK1/ezP1XSvSwG7KT+lvFCY7ygcepdihpqp3gb2KZmvLOED2J2W1ud72uyLB5U5K8Nbz/7
	PLX5ASclWk3FazXwEVD5AUn7JYK2qFp9jrVof1yF7vWY2DcOVmWvLCw0UtBCYAg==
X-Gm-Gg: AY/fxX6Lda6gQd1OUJ3V7DF4xXf1eRxaAtPy3mvG0iJCIn0jenN6pTdZueOwlRugPhZ
	HwHKPobRdlDvt/CjqOSGfi0YsU1G20QpdzFraKz/8Krqvui+ggj549KOhaqjbSQxnzKxjmow2hJ
	c85DY6GVtjkC/kq1KsMWk4z4kXmgPq6PTILVXClPC0a6Oh5LY/PDsUtyU9+pW0QdPm9206/6v99
	/257YuTkWq3fMr0HhNrIYRA5iOknmwmhcVtS6htqkwmI2JxNF2uSb+Vxw7Gh8EjMOCzhLbRMR1G
	VA3Q5bB8b0QR1n8D3drBs8AuaQgHDnP/z2okLy2MHWur8qfiyIjFdSW4QZphtd5dWcNIv5ef2+I
	DxR+6QtSGdHA3XETD68mX6gjSuz6zlUFlJf3yuubBZ7BBbGkU3otxkLNz
X-Received: by 2002:a05:620a:4804:b0:8b2:e0ad:eb97 with SMTP id af79cd13be357-8c3894172cbmr1167824785a.83.1767932071821;
        Thu, 08 Jan 2026 20:14:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfApg85dIzy0/UVGbmmnaqdWN/LcvlttlnRbWN6UZZYR6Gg703S6psJlUfwcLoLX8mA87/aw==
X-Received: by 2002:a05:620a:4804:b0:8b2:e0ad:eb97 with SMTP id af79cd13be357-8c3894172cbmr1167822485a.83.1767932071381;
        Thu, 08 Jan 2026 20:14:31 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm730500485a.5.2026.01.08.20.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 20:14:30 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <828377cf-4a64-48b4-887e-8f71ebed502c@redhat.com>
Date: Thu, 8 Jan 2026 23:14:28 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cgroup/for-6.20 PATCH v2 3/4] cgroup/cpuset: Don't fail
 cpuset.cpus change in v2
To: Chen Ridong <chenridong@huaweicloud.com>, Waiman Long <llong@redhat.com>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Sun Shaojie <sunshaojie@kylinos.cn>
References: <20260101191558.434446-1-longman@redhat.com>
 <20260101191558.434446-4-longman@redhat.com>
 <efdcd90c-95ed-4cfc-af9a-3dc0e8f0a488@huaweicloud.com>
 <6eedf67b-3538-4fd1-903b-b7d8db4ff43d@redhat.com>
 <7a3ec392-2e86-4693-aa9f-1e668a668b9c@huaweicloud.com>
 <85f4bca2-e355-49ce-81e9-3b8080082545@redhat.com>
 <38ab0503-3176-43a0-b6b5-09de0fd9eb75@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <38ab0503-3176-43a0-b6b5-09de0fd9eb75@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/26 2:00 AM, Chen Ridong wrote:
>
> On 2026/1/5 11:59, Waiman Long wrote:
>> On 1/4/26 8:35 PM, Chen Ridong wrote:
>>> On 2026/1/5 5:48, Waiman Long wrote:
>>>> On 1/4/26 2:09 AM, Chen Ridong wrote:
>>>>> On 2026/1/2 3:15, Waiman Long wrote:
>>>>>> Commit fe8cd2736e75 ("cgroup/cpuset: Delay setting of CS_CPU_EXCLUSIVE
>>>>>> until valid partition") introduced a new check to disallow the setting
>>>>>> of a new cpuset.cpus.exclusive value that is a superset of a sibling's
>>>>>> cpuset.cpus value so that there will at least be one CPU left in the
>>>>>> sibling in case the cpuset becomes a valid partition root. This new
>>>>>> check does have the side effect of failing a cpuset.cpus change that
>>>>>> make it a subset of a sibling's cpuset.cpus.exclusive value.
>>>>>>
>>>>>> With v2, users are supposed to be allowed to set whatever value they
>>>>>> want in cpuset.cpus without failure. To maintain this rule, the check
>>>>>> is now restricted to only when cpuset.cpus.exclusive is being changed
>>>>>> not when cpuset.cpus is changed.
>>>>>>
>>>>> Hi, Longman,
>>>>>
>>>>> You've emphasized that modifying cpuset.cpus should never fail. While I haven't found this
>>>>> explicitly documented. Should we add it?
>>>>>
>>>>> More importantly, does this mean the "never fail" rule has higher priority than the exclusive CPU
>>>>> constraints? This seems to be the underlying assumption in this patch.
>>>> Before the introduction of cpuset partition, writing to cpuset.cpus will only fail if the cpu list
>>>> is invalid like containing CPUs outside of the valid cpu range. What I mean by "never-fail" is that
>>>> if the cpu list is valid, the write action should not fail. The rule is not explicitly stated in the
>>>> documentation, but it is a pre-existing behavior which we should try to keep to avoid breaking
>>>> existing applications.
>>>>
>>> There are two conditions that can cause a cpuset.cpus write operation to fail: ENOSPC (No space left
>>> on device) and EBUSY.
>>>
>>> I just want to ensure the behavior aligns with our design intent.
>>>
>>> Consider this example:
>>>
>>> # cd /sys/fs/cgroup/
>>> # mkdir test
>>> # echo 1 > test/cpuset.cpus
>>> # echo $$ > test/cgroup.procs
>>> # echo 0 > /sys/devices/system/cpu/cpu1/online
>>> # echo > test/cpuset.cpus
>>> -bash: echo: write error: No space left on device
>>>
>>> In cgroups v2, if the test cgroup becomes empty, it could inherit the parent's effective CPUs. My
>>> question is: Should we still fail to clear cpuset.cpus (returning an error) when the cgroup is
>>> populated?
>> Good catch. This error is for v1. It shouldn't apply for v2. Yes, I think we should fix that for v2.
>>
> The EBUSY check (through cpuset_cpumask_can_shrink) is necessary, correct?

Yes, it is a check needed by the deadline scheduler irrespective of if 
v1 or v2 is used.


>
> Since the subsequent patch modifies exclusive checking for v1, should we consolidate all v1-related
> code into a separate function like cpuset1_validate_change() (maybe come duplicate code)?, it would
> allow us to isolate v1 logic and avoid having to account for v1 implementation details in future
> features.
>
> In other words:
>
> validate_change(...)
> {
>      if (!is_in_v2_mode())
>          return cpuset1_validate_change(cur, trial);
>      ...
>      // only v2 code here
> }
>
Yes, we could move the code to cpuset1_validate_change().

Cheers,
Longman

cpuset1_validate_change


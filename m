Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437BC22655B
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 22:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767565585; cv=none; b=lTewujFQK5mLimpbQaMABW1VFcuz+Ax/a7gra93fOBy9/i48/DLwUWDiXElXmybKsJlflWup1yAWFaQrG8GDkOPMDSR/KBxhY0R0ga111MhH5jPkI7AmE35SQ0L3F8gcnCqGG3vvh7gQrGqCe8pNP2JgQOECEDpP7m+s17WXj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767565585; c=relaxed/simple;
	bh=18zqbZPHCZfC4IECcFh5Oo9n88sS/9RdXF1BYxgm8CY=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ECKPbefbwhdrJH2ODbipcrZsU81Ct4Fng5jz0l3EhObQKHcKU416fgJTQaApfEaqE5busl8JQEmJJ23+m9kHCgAPer1lhPRwUpoYDqKcEeyYx19GDYBY48P602iLjsgkzCSeBUs37tzddQpT398D4+HwfbIFn24+nOLGWZQW0mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GaKhDeAW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aLdtya1F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GaKhDeAW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aLdtya1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767565582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MX6wynQZFsiu7Tz4PLzaszcf/RQEoHul08Z9Zkyf+Is=;
	b=GaKhDeAWx+ogPJFWrFWWkOhcjODQhbhIw9jcPIvgbsbuX4TOLb9zIfpscFW72RahTc647A
	L946Cklp971uchvXwojo7opQpEalMGZYeVNiAYjpSigw/nQ7IsOwl5v6sl2tZE0GllHpIK
	4SrG7SdPAjkI2w6HTfrKRTcLDslKDns=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-VJOyYeKuPLqMXQ6HA8SWLg-1; Sun, 04 Jan 2026 17:26:20 -0500
X-MC-Unique: VJOyYeKuPLqMXQ6HA8SWLg-1
X-Mimecast-MFC-AGG-ID: VJOyYeKuPLqMXQ6HA8SWLg_1767565580
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b8738fb141so425376785a.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 14:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767565580; x=1768170380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MX6wynQZFsiu7Tz4PLzaszcf/RQEoHul08Z9Zkyf+Is=;
        b=aLdtya1F1GDOdz1hTflB7L6wy3yPREOMaiqfJ5Ck8NYpDiRd8ZcLsqYNfzaQTMMJiL
         ribdYnwTe2ri594qkNwlKANnEOWOFOoj9y52PShxpd0Ey7Dz9U7F4s782NF90lQGx3mw
         KR8hqu0dEgW+etnTcevicCcqJVt9id8KN0ev38lFm4SlsZ1aKWVbTcKCWeLl7CgVm+tm
         4zk8woOBUidyyBd9xHBvy5KGYGw06LrrIE7Ts6CG/yT7+2jtkU9yaZeUaY4pSa+TBFjK
         09ajFFCoMgs2FAJ1+IlFjfHoJ4eyVAqjM0M26K4d5Ozc6noYunHULfApOySPqcLp6+iL
         BrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767565580; x=1768170380;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MX6wynQZFsiu7Tz4PLzaszcf/RQEoHul08Z9Zkyf+Is=;
        b=e0E9gPH5NVEkN4Vq1hiPHeWK9oWtaKa3rt9zTgW2Nug2MehvTeuZcNM9BWDwsVITqM
         OTbEnYLlE/zZnODo00Suncp3EpJ2Twtx+e8ulrHFlR1z01H+ZRQ5lkAFsODRh3GtguM/
         RAToTsdAJy31qZMGMWe7vpa0jTpSaGLVaaEQi7Kus7xY8mLgOPL7iUdnSY75tbHC/z7L
         djpTCtKqrbWatwnhkXZr/5W67dVicLs+MlfbOukNWf9PL5hiyCklSgSgMWr2iS3/nkRQ
         KcT2dAL/BcugJz2sov6UPvpwZr3nuPQtxHtwv9jvpgDmzAQuhaosp+pwAyI+nAOcVfFa
         /jDA==
X-Forwarded-Encrypted: i=1; AJvYcCWWtMh8DIcjzC0l/oDjPrOimPDQAvtOi1Uz0RDDJx6iS1VLvv8m46z4krU0aY9HcmMphNraACmr5qU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjvsIoJHUserOQQQz8B+1BgUCAw/arXBHyhvB36/NvE7FuLdZ6
	9u4VhbcF+HLhCI54AunJUlAKKBDNNyCywqhauqWvELJpz53F12VaFxtpUcJZLFT/mFj1ApuJcsC
	CMktDR1cpqbE1AkyOhh11F/joGqKRpFUdtyVPLWHJlFAvkQ7eS2HTX16AdibFQQ==
X-Gm-Gg: AY/fxX5dRIRhbl+qJebMNkFI2f5BHWeoPeM17hVqv4g5LKGtCdB+xGlYQ8XIUdQB2zW
	6yPS9CFVk1mLcc0WslXnOuT1bcTSYNND/HXT5djcukQmnLLI925oYQSFC2C/+x44iJtIevs+cKo
	EwSXcJw4YFOb/m2QwqE0v007g/Qj//ahcsbOQoHs2G6acNJsyKwmYbZ082YbRK6+xcJpVHiqpza
	1Yonw5dH+OM4IFyuYo/9oQx/0ZjomsAlfjZNS0GU7A51+5qWYCchWp4SIth6kSTMziof+XyEef4
	OB06klaQ94xY+5ugiJEGPaj1gya4dS2OCZAoRVo1KCIEfujrViMWW9AWxWthKdzQtO6yquVE7V2
	ZZ5WYHnQzC52IQX4sejfu4tjlCjXbDTr92UtW47GOSU0cxowz8vnY6IdE
X-Received: by 2002:a05:620a:2993:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c356f610f2mr826663885a.39.1767565580434;
        Sun, 04 Jan 2026 14:26:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1alN5adMavXwg0qoPb9OAbKBalJiqdid2PFcZ88dBnIGljKevyz4sWtBubRBFhtfzz1Bexw==
X-Received: by 2002:a05:620a:2993:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c356f610f2mr826661785a.39.1767565580057;
        Sun, 04 Jan 2026 14:26:20 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9aa363e3sm337038506d6.57.2026.01.04.14.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 14:26:19 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <5ed163d8-c229-4aed-bc8a-ae9cba9b78ec@redhat.com>
Date: Sun, 4 Jan 2026 17:26:18 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cgroup/for-6.20 PATCH v2 4/4] cgroup/cpuset: Don't invalidate
 sibling partitions on cpuset.cpus conflict
To: Chen Ridong <chenridong@huaweicloud.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Sun Shaojie <sunshaojie@kylinos.cn>
References: <20260101191558.434446-1-longman@redhat.com>
 <20260101191558.434446-5-longman@redhat.com>
 <f561b413-7fdc-45d9-9d89-8bd55e960d51@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <f561b413-7fdc-45d9-9d89-8bd55e960d51@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/4/26 2:53 AM, Chen Ridong wrote:
>
> On 2026/1/2 3:15, Waiman Long wrote:
>> Currently, when setting a cpuset's cpuset.cpus to a value that conflicts
>> with the cpuset.cpus/cpuset.cpus.exclusive of a sibling partition,
>> the sibling's partition state becomes invalid. This is overly harsh and
>> is probably not necessary.
>>
>> The cpuset.cpus.exclusive control file, if set, will override the
>> cpuset.cpus of the same cpuset when creating a cpuset partition.
>> So cpuset.cpus has less priority than cpuset.cpus.exclusive in setting up
>> a partition.  However, it cannot override a conflicting cpuset.cpus file
>> in a sibling cpuset and the partition creation process will fail. This
>> is inconsistent.  That will also make using cpuset.cpus.exclusive less
>> valuable as a tool to set up cpuset partitions as the users have to
>> check if such a cpuset.cpus conflict exists or not.
>>
>> Fix these problems by strictly adhering to the setting of the
>> following control files in descending order of priority when setting
>> up a partition.
>>
>>   1. cpuset.cpus.exclusive.effective of a valid partition
>>   2. cpuset.cpus.exclusive
>>   3. cpuset.cpus
>>
> Hi, Longman,
>
> This description is a bit confusing to me. cpuset.cpus.exclusive and cpuset.cpus are user-settable
> control files, while cpuset.cpus.exclusive.effective is a read-only file that reflects the result of
> applying cpuset.cpus.exclusive and cpuset.cpus after conflict resolution.
>
> A partition can be established as long as cpuset.cpus.exclusive.effective is not empty. I believe
> cpuset.cpus.exclusive.effective represents the final effective CPU mask used for the partition, so
> it shouldn't be compared in priority with cpuset.cpus.exclusive or cpuset.cpus. Rather, the latter
> two are inputs that determine the former.

Yes, that priority list can be somewhat confusing. I will take out this 
paragraph. The next 2 paragraphs in the commit log should be good enough.

Thanks,
Longman


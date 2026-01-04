Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC28D31A068
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 21:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767563294; cv=none; b=eX1TxGntgVS+Ws9VNIA6Fr2RE+WMSdD6j2GsMGPMcjXADx6AxYPPjWmzWmmJ4i3bk3gpH9jS05/hjw2ulzQq/mydCGXBLVq7F3ymCRFmAgBM88edHIElZWLuRLpxWsVpWffq6cqcuL+FelySgwaduaQzcehV5+Y0VL7awAP9Pq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767563294; c=relaxed/simple;
	bh=y0sc11w6iKkgJZhc5ra4q3irne+xMlYBsG9oiAF3S8E=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RlK06vly6mPYCvqrQLj6iV64fArcQo+oEA3ZsbIXY65OOx1sGjL7uhnjq8nN2vLD8VpMGM2HuziigKY79N5cY/rJLGX2XBgGOhNENVdPWoZC+D/pxUIIKMnynXNuKzF2/W8/RSnqQa9W/OyU3ExNVVzenP65CFyflrWHn3OYmVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dCH+uKxP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tliSzznS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dCH+uKxP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tliSzznS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767563291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y078SXfKEIKRd5VwmHPxExsqrlkRflvvVfuy30oz9Iw=;
	b=dCH+uKxPchWAzqRc4Oiff1/fXmiGzOKMpqlftZHnur4Zqttb0iegmmDyGpDByRD2pK8wGy
	fM+8Bpegdqupdd1wpp3m6/lhsQJMjVRblzWwQ4EPbrnqRF2U0+dgDud714o0FMcJ/dB64/
	BoJtqJk8lev+JET8OOH0JV4juyyBaro=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-M7ls_mDxMAKOWQGVz9navg-1; Sun, 04 Jan 2026 16:48:10 -0500
X-MC-Unique: M7ls_mDxMAKOWQGVz9navg-1
X-Mimecast-MFC-AGG-ID: M7ls_mDxMAKOWQGVz9navg_1767563290
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b51db8ebd9so4554240485a.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 13:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767563289; x=1768168089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y078SXfKEIKRd5VwmHPxExsqrlkRflvvVfuy30oz9Iw=;
        b=tliSzznSG3XM7WGPMZ6z7fcqN5CGzRFZQtKvBTiBSBLM3WJaAJYUYGkteqQzZRR1Wr
         izKdkqdBAtt28aA3WvNjT+lbeeXNVjJWEDLu4yR/iIKHlZpGbQ2fJNGFzPH4FcC5uPmg
         tTpHem1CzZ2hZxLRb+IkRmtedLkedDZ73etU7SAu2xwziJgcs2nM7edkGDYrwmVk8ayf
         nibJqjVC3minQecGRLKxzgovwDGRYFLvK9JuZnD8PGEXoVh7FQQHqvoQKDGUirnSF+VV
         bPoVqfjoQE5Zkt2HvKPJI2W01pPmn1e0ILFN1jMIoh4xjy4e86FYE+xJCXPaYnC0M8Fv
         NIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767563289; x=1768168089;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y078SXfKEIKRd5VwmHPxExsqrlkRflvvVfuy30oz9Iw=;
        b=ft0bJdYyUv9ksvlXCgtBeOJsOwTZ/Ovp5zqicjFLQO0XL+cp2Wy3oFQdB+8VadGQ5E
         Ltajo8/9tg4HnZkN6yRpfo4zL9V49kRYo8g2GXRSUflOo97HT88ry90NPka2Xl3qauah
         eDRMTyofqk/Pd9UJHdCqJDZ0+0reCMvJ8V6PDVV9hVydpKLooLs9c06Upgl2NRHj75R5
         pD3XWqU4l8v8sbCyb0Y6bQZoBk7J2CBjXs8gnLv9DJ9qe+l9P6pa3oiNk5gH5WEuRiuo
         KYx/aVs3CYcrZuufTSeIatgrnydxWBC2groiaLrrtsxryVsUCCVRVcQ4WGmnq153Q9NH
         gjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7BH+UyoE1ZCtkr0Ecrcrb7KBseaUL3To3HKJPCa6QucRYEEcPVSHUJ7/qWa5BEwFOITAcfzaJ84U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp7WLqlk+g48RaZHayIBO2U+QxQJ8JakLGsFu6RLGlz3dsQxwa
	FNeqtM0foVg/ZMWLn5jguOkf91FSzTNHgpXQRc/s86LQS+O0ELS/lRzoxX8k1vZETW3x124YPo6
	Sbb7ZHiQFddDgSgJG081u4SKtIzQ66Bk4jBuTsmFoAO0fWfh+IGsuu7FdKjQxzL6t2TWbmg==
X-Gm-Gg: AY/fxX78U/qn59bSOOrgU6PrJ38Rl6xunxQD1Y1p/vyXo8nCHhoO49ffBe2I2B4AJbV
	0qW+4FVyRyHslBTXUWgIFfalO1CWrIKgBdicp3IFJr+8xk9yn3x9EbibhxZRCHUJfBKNu1uDL7o
	Eftv84crBAP9INPRsglB8AvxREOMB7RW57KzEhchK326cr7bzpt0yv0cyoLSCW3GLpskR6TKM0J
	AouFagEOZu8I1V9gyKV9ottcPwNcQy7kLxqMt+1NPgmc1dTD56gG3EVDpY4UqRemdZhZLOHVtrL
	Q0Z6Tqei4k8FmOlVj9IPO+b6dQP2QzBcgDo6dU/IBcaktVO2vU7E/iqoQmgYXyshwKZkzn8FP3W
	IEznZn3nhNRvfezdyY7gEufyOl1tgphmkyIjC+ibtMAXSA9NTBSqz78ls
X-Received: by 2002:a05:620a:472c:b0:8b2:edf1:7c4a with SMTP id af79cd13be357-8c08f682c7amr7291368985a.39.1767563289037;
        Sun, 04 Jan 2026 13:48:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgx/Ro8LIsSGzA6GrLW/huLR0mhax5aa71Iw9IGeyKEOdpg2Rc4aEZNIq7X9MHlTlbpRgEJg==
X-Received: by 2002:a05:620a:472c:b0:8b2:edf1:7c4a with SMTP id af79cd13be357-8c08f682c7amr7291366685a.39.1767563288604;
        Sun, 04 Jan 2026 13:48:08 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973ee08dsm3652997385a.36.2026.01.04.13.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 13:48:07 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <6eedf67b-3538-4fd1-903b-b7d8db4ff43d@redhat.com>
Date: Sun, 4 Jan 2026 16:48:06 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cgroup/for-6.20 PATCH v2 3/4] cgroup/cpuset: Don't fail
 cpuset.cpus change in v2
To: Chen Ridong <chenridong@huaweicloud.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Sun Shaojie <sunshaojie@kylinos.cn>
References: <20260101191558.434446-1-longman@redhat.com>
 <20260101191558.434446-4-longman@redhat.com>
 <efdcd90c-95ed-4cfc-af9a-3dc0e8f0a488@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <efdcd90c-95ed-4cfc-af9a-3dc0e8f0a488@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/4/26 2:09 AM, Chen Ridong wrote:
>
> On 2026/1/2 3:15, Waiman Long wrote:
>> Commit fe8cd2736e75 ("cgroup/cpuset: Delay setting of CS_CPU_EXCLUSIVE
>> until valid partition") introduced a new check to disallow the setting
>> of a new cpuset.cpus.exclusive value that is a superset of a sibling's
>> cpuset.cpus value so that there will at least be one CPU left in the
>> sibling in case the cpuset becomes a valid partition root. This new
>> check does have the side effect of failing a cpuset.cpus change that
>> make it a subset of a sibling's cpuset.cpus.exclusive value.
>>
>> With v2, users are supposed to be allowed to set whatever value they
>> want in cpuset.cpus without failure. To maintain this rule, the check
>> is now restricted to only when cpuset.cpus.exclusive is being changed
>> not when cpuset.cpus is changed.
>>
> Hi, Longman,
>
> You've emphasized that modifying cpuset.cpus should never fail. While I haven't found this
> explicitly documented. Should we add it?
>
> More importantly, does this mean the "never fail" rule has higher priority than the exclusive CPU
> constraints? This seems to be the underlying assumption in this patch.

Before the introduction of cpuset partition, writing to cpuset.cpus will 
only fail if the cpu list is invalid like containing CPUs outside of the 
valid cpu range. What I mean by "never-fail" is that if the cpu list is 
valid, the write action should not fail. The rule is not explicitly 
stated in the documentation, but it is a pre-existing behavior which we 
should try to keep to avoid breaking existing applications.

The exclusive CPU constraint does not apply to cpuset.cpus. It only 
applies when setting cpuset.cpus.exclusive wrt to other 
cpuset.cpus.exclusive* in sibling cpusets. So I will not say one has 
higher priority than the other.

Cheers,
Longman


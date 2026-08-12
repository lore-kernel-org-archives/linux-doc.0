Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BC53749FE
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 02:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786503500; cv=pass; b=XEG+bpqbkzkhEt726BRZTkPdIN87EI9HmQMfHI6cmiUsQvGEJZnvkgp1tB0Q+88mY6lWBi+bFc39QJglAkNA8BeiUNF3dPxRpsJvSq5eQnOgkmC01nLL/rIbi0BgeHW5Zemw3jT2rzNOrxoVFP5uCUpFCqpGXK6scB4RBzFuoQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786503500; c=relaxed/simple;
	bh=1GXEgKb8AtQjGH3gyVhgQKefT0eOIVlPpWz4VPRvhEg=;
	h=From:References:Mime-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zf2Du3Jmx2AbFFvPZJEuoDLTLJdTdiUYFRDJ7JI2keffZSJT+EBUuaHh58XBmzBiahG/ZHuUW8lgXW+gKwr2BoSs6E+LxPH19ucdcnrdn/OOln8838AIuD+cGiYhXrgd5Jvy174am0zxghC8FUpSkCRfugbFBbFmBuTYJFkA/dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kUjSJ2Of; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kUjSJ2Of"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso332477e87.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 19:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786503495; cv=none;
        d=google.com; s=arc-20260327;
        b=M/UfNOyQSLhNB9MKmFWpBXBpOYTdXkPoEVBIU5yF3WmEun6xvRzXYfFQDmSXBwAhaj
         wCvyIp+SEyWMDzgIRxy1ALyfzwmDbEbq8rWb7tTHmdTED9PPqPkxOFuSqPWK74ra99N5
         0THGqASVWlCHeBKzXY/MmYGGj9qNnu5PQbx8a/yZVNgOnslnsFBzWEvGgqfH/q0tJlp3
         suUg/NfUgbTC2efbET/PkqrxoWphUG5KEJSv31RGyT4eeW/7/N2PD8cMElhoY/s3xiy9
         RgEwlyWs3RgxACq2QiX2X2OB6K8osluPMRASXRYPuMppmRC8CZEB1TIrsErp7+RUjXnr
         0vPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:in-reply-to:mime-version
         :references:from:dkim-signature;
        bh=i7nGgYKvE3Q27EURwBk0VQlh8/ubhEqw0Zh7p9xqrfQ=;
        fh=YFBVH7Ds7FTDol4sUeYoug+tx3Bs46qcXNLAKCsZYj4=;
        b=huoCdbqu8jBavJkg/1Re7r8wDhYXNX3oX7QyN2syf94gbqUyYaK/E/osw3hATvBWPq
         ygk4HuOElf3EBxE/n3tWpWv6+0uwNoiYVLWSUNT1AeWTnYiLJAyhjrRKOq7UcIj2nc+u
         z/H082tuZfqr/IgfxWo9FSeon8bOsr/rLFkpH6CuOMSnmx4dn+f1YUlbuT4paIALBOSw
         k9ukk0Z6juN08NeES59tAd6uDYtNI/RmxYZLf4Hy0PVVq7s3+NqmA+zv6zuHShiO4sza
         axl/lXiRxhZhyKTj+/g0yhulxhL1n34YJjrxkIPYEyA9HtYKBPvuiywqv6eBY/euXxEr
         v/3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786503495; x=1787108295; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:in-reply-to
         :mime-version:references:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i7nGgYKvE3Q27EURwBk0VQlh8/ubhEqw0Zh7p9xqrfQ=;
        b=kUjSJ2OfziBFDCsEZO+vtkwbZkLfm6Go9ptw3q0gbUrS2jO6eQuk7B8ON23qPcBcV0
         6U2IluZ661geys8adRY8YBZViERQj7V7bflmb1HlIjnpGeq5tXgYaihifvFi9ODR4evI
         IzL+UpbnO7izLzGKNWgS0S3NI46jsycIqZvy7ETtkQGapJt1fN6HJ9Nvmh54f4F6NxTp
         5dPKx0lgbk8oeVLhUcApCs1vizHBvEgSn1P8RqF3PhuzyqjkekLegYZWdsmPsOYXG9xn
         2ng5M6kmTzCKjvpxhPhidICWo2cl5blg+3juaq0Z+pESltOgs8/+ccsSYRAQfXb6cLHR
         yUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786503495; x=1787108295;
        h=content-type:cc:to:subject:message-id:date:user-agent:in-reply-to
         :mime-version:references:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i7nGgYKvE3Q27EURwBk0VQlh8/ubhEqw0Zh7p9xqrfQ=;
        b=iWVsQonfJVpUSz+uImCdkKgPcHEe3jV8fq/eKMB5sCv7cq/mtNdIQHSQVckwdZdHZc
         TUQbSiJaxr+Rmz0xj3QGeYerEI1xTq9vhfheNVjlNMFwNmqK6nAbEu1pNNV8iQExqXq7
         vF0UkR+ZGtgdZgmvhjbIeB4fCHE0jQkYwqXml5REq7ZhnAh0E2tIiTN/OYu5uVNWMPv/
         Cbb9MbC0swfdPU02KNlZjIcIFMDGpwf0EfbiOM7+7cPVRk47KHkUkJ5uSRXNkeR147jz
         /bzc/EE/cajY7QJfRgPbRuv2KVYg79kdhcU4miwRKfVr0vme7vyZ5TPVCZFuCsP4HlZR
         TXVA==
X-Forwarded-Encrypted: i=1; AHgh+RpRVBpLZGvPs9ax9L9QwSR1Wt8LjxDLKk3MHjYuFBduPFk+AomONS/1RtWnZto/O2mu7Whp9fIPi4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvh0w1nZ5pxcs4gLdLLvBekzZoT8bAhRcQ1q7HVi9q/aYB2mLF
	dY6zo/LepVIKADvjGotQzuQ+aQAeokzauYlN10PJ50WSRg9OO5TOIHJasKjnE1ipC4nW/S2H/j/
	7M7ItGrWcDluK0krUk6M5QZ/ak+7I7AnLUQa6/Ijwrg==
X-Gm-Gg: AR+sD13SiXpubzlMpjqq9xa6dmkmNGvAuMYKCwULm8RPoEd1YC+FIx0rMegZy22s1ut
	674LgOg0eHdshfv/VPApxejmf+BQQBV2+3/Q88KykakPjaXU/bdxQFTkHRtHg3zh4pfB5vB89IL
	ta/55rTavnk45OBVqUjvENSc8j2tQmRo2kenT7eW0FC1ZfhlrNWfYsEXLpvso/XPXXkttqyyI2/
	dZOdnqfJnU+qjKR3Vm/6NoflOch1kKq13GEWDwanOypRjoop8wLzhNzPOzuXm3TtzC245pENpv1
	pkHLYOZNJi0Z2O5to6Q6198rCIt6gfunkSEonfi1kxLG834wsDRzl5SK
X-Received: by 2002:a05:6512:6883:10b0:5ae:ba47:e7bb with SMTP id
 2adb3069b0e04-5b44e327b7emr127630e87.36.1786503495339; Tue, 11 Aug 2026
 19:58:15 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:58:14 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:58:14 -0700
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-4-zhangzhanpeng.jasper@bytedance.com> <anvYGuNF3MC//Q94@x1>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <anvYGuNF3MC//Q94@x1>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
Date: Tue, 11 Aug 2026 19:58:14 -0700
X-Gm-Features: AUfX_mxvwZ83pSWvPns7jRPE3EZ4ROM6a0cFBGgGRZzehYP0r9bHWpi6TB0BXXM
Message-ID: <CACnXVnfHZ0icevM8B3rVCiU_qxm41W+duRkPRS8HP45P05abYA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] resctrl: Add a devices file for external
 requester assignment
To: Drew Fustini <fustini@kernel.org>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com, 
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net, 
	shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com, cuiyunhui@bytedance.com, 
	yuanzhu@bytedance.com, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Drew,

On 8/12/26 10:19 AM, Drew Fustini wrote:
> On Tue, Jul 14, 2026 at 09:06:53PM +0800, Zhanpeng Zhang wrote:
>> Do not overload the resctrl tasks file with architecture-specific
>> non-PID tokens. The tasks ABI remains a list of task IDs, while the new
>> devices file carries external requesters assigned to a resctrl group.
>>
>> Add architecture hooks for assigning and showing those external
>> objects, and reject group removal, reparenting, or pseudo-lock setup
>> while devices are still assigned. The teardown path performs a
>> best-effort reset to the default group.
>>
>> The devices file is an assignment interface only. It does not describe
>> a new resource schema or domain; resource allocation and monitoring
>> policy remain described by the existing schemata and info files.
>>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   Documentation/filesystems/resctrl.rst |  26 ++++
>>   arch/Kconfig                          |   6 +
>>   fs/resctrl/rdtgroup.c                 | 206 +++++++++++++++++++++++++-
>>   include/linux/resctrl.h               |  45 ++++++
>>   4 files changed, 280 insertions(+), 3 deletions(-)
> [..]
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index af2cbab14497..2e424c911049 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
> [..]
>> @@ -2067,6 +2236,16 @@ static struct rftype res_common_files[] = {
>>   		.seq_show	= rdtgroup_tasks_show,
>>   		.fflags		= RFTYPE_BASE,
>>   	},
>> +#ifdef CONFIG_ARCH_HAS_RESCTRL_DEVICES
>> +	{
>> +		.name		= "devices",
>> +		.mode		= 0644,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.write		= rdtgroup_devices_write,
>> +		.seq_show	= rdtgroup_devices_show,
>> +		.fflags		= RFTYPE_BASE,
>
> Once CONFIG_ARCH_HAS_RESCTRL_DEVICES is built in, the file shows up in
> every resctrl group directory, even on hardware whose IOMMU does not
> implement QOSID. I think it would be better to make fflags zero so
> rdtgroup_add_files() skips it, and enable it at runtime from
> resctrl_init().
>
> Thanks,
> Drew

Good point. The build-time architecture capability is not sufficient to
expose the file. I will look for an appropriate runtime mechanism to
control whether the file is exposed.

Thank you for the careful review. I really appreciate it.

Thanks,
Zhanpeng

Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C6B37E2FE
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 02:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502327; cv=pass; b=LQygF8nSLkENt2bnGt+JbC1PTpvG/TrP744Lofp6+oI7dNL4+RrB+WFz/AKAvLFjvh6lx26BXxIYatSUCws7CBaavQ4YyJL089yd4tiHsQj/HkIlr/aD5t1edL94FXBMB/RSxHiZGIY73BNF6X2m0wjfqQHEl5BGZvV6NTmXpIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502327; c=relaxed/simple;
	bh=paVKL8uujOZXf9sEomzLIUC31zXEINH59NqUPFZaing=;
	h=In-Reply-To:From:Mime-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=isQZJm2SP1OOowb1PvjlIhTddxzcuhlp7GdP0vlCpFkOYQXdyqlG41VDe5rn70OX2c8p2wTwuspIqMYanJSWYMaFonbAgtQOCf7wyXqZFivXtZWrPySZbEBAg+9wDBvRHu94G4CJd4WbHzpDNKKrG7gl5cTwInyocohk8uIx8r8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HfGYohGV; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HfGYohGV"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39fa5e3a428so4144361fa.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 19:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786502323; cv=none;
        d=google.com; s=arc-20260327;
        b=sGDpaELTYvg81yiFV3BxRvAemQcyxwYEkinwpeTsLT3IpTJMYinF0kXPByeHB0tTay
         dkLYqmRdu75D7rlQJpcjSXBtRSGKICDopzixbnw/KIAhaL/VBVmmYL04JBG6HTb3AaZg
         Cm+d7/6d38E+NmQi0vhVaf57A78iz3hpfRrj5U7QQwDfXIOvk+woFacIeJz4HmCwxUmn
         nvRsseHBsj3F7iiKkEvBhwPNcjsTgf60E/PFtYDDxN2vg04zaZ5upNzPlQqSjLBW8qt0
         acpEeZj8JMRoc1sJm7wxtp2Olt0z8vSppaZhOSBHQlXM9H4vHm3qIwZZp6EoNzMmMIjw
         MJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:mime-version:from
         :in-reply-to:user-agent:dkim-signature;
        bh=xsPbH6RVpEmtv3mDSTBrJpAsPxSPG2QtDyPYl702kZM=;
        fh=DiRcgVzeNyTmLOPZr5ksNM0ISvh9bxUlNoEsgGgPMmU=;
        b=aPzf00iioKrxk5F7NKvlArZ0YxG2COlI2emp4vb3LTrfT21hzITbO97gGq9gYAG0cz
         6Cb6q9fqxXZDp81PITahzLtSeitNxjBZh7SioIOk8awmaUZXUTyDsh6rUD6ci8vKGyQI
         OHRYZGBIcSjTLxwHMJl1u6296Dap7WBfucm2RfYcMjHAs+OPI/+gzT9oZWBFQC1LA7pG
         Dy1qdSZ/98zlwzdVNmnq5Jdk8me2fKS5bu6YB37HechR5DGIKrOtEw3P/aDmNz4c8mmf
         ciqhs/z1HS3ya1EEigXmNYeR1y2bbZfg6folNk5+tcX8bebN8QAJP4aNlq7zTa5OMWk9
         B8xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786502323; x=1787107123; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:mime-version
         :from:in-reply-to:user-agent:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xsPbH6RVpEmtv3mDSTBrJpAsPxSPG2QtDyPYl702kZM=;
        b=HfGYohGViMWIwQtCooPbT8zz4/NDB0YxADTu+MzceqOX4uV+bc4eA44d8uPTxAy/f9
         4Qofe1tVBQgcbrjH6Su4fWJOflIjZcDezCr0hyFkHWJXAPepQyAQQ7AFfGj2aV1ykKX7
         F3qnRDXtETqvDuADJCq0RrwJfAyrV4fZKw6KCtyyyJK0FKKOsBBmz96AkEyjnPwENAcK
         bogbd7CmUfQNkniuwWngftAAbIpjoD9c2BwZ3YVUG/l6fK92lYiVftajQZZp1tJ9vbvO
         eGD8bMHO8KpdhHvvpUUufcCRtVwS4McYyMA6X7mZSCruTXf38yRYnTk48+6+dAy9EGLk
         b7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786502323; x=1787107123;
        h=content-type:cc:to:subject:message-id:date:references:mime-version
         :from:in-reply-to:user-agent:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xsPbH6RVpEmtv3mDSTBrJpAsPxSPG2QtDyPYl702kZM=;
        b=BdstV8IsDQXh7aJasPqVc1hNERSUAEV8ncbnA/3dN0NGXOtkxoyvfgXyVrPI0z/byD
         +a7lVSAQYK2JeOxtx70qNIJ8eG9Cy+IrnKF+ZBxuHHx5tvK81yLFx5Fj0nKF22x5HT2Q
         6OnkQLfJ3Ls9uzZm6Ur+xSysv5GhqnT2zIcp+2vV7mzur8HftAoE5npwnMcVYAdZKuQ6
         vrJqIgCigli9n2Vb16W7Tu3qBkF64Hbw8Gd9xSt8G7jVdM7B4RiXOf1rWLfAvQZEQ8rv
         GlE/l5GGG5b+MRQI2YWMed5aQ75GG1lTJa9LvmAY3E1kr+D5VhEj8CIC2dvgh3mETcg6
         dGgw==
X-Forwarded-Encrypted: i=1; AHgh+RqXrm3psVkJjZ0twbvl38naTsRakztHGSYfNLIKM1z6yEwa0mJWhy4jD5sHX5CldN8A4eqMfqpXOpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw27mxdc2HNWznnNRMKrSlQ/wXRPt0hNa62fWr023gv2ndBEiGP
	5u39fM9cNypYJdi4deEiVlY0lwUZR/oJr97oUDxW0yprDpEdK9/Iq5ps8ynqe93a/EBx6hSTuIk
	q9yfOOyjNRXRoed5DpTOS66o7/0fkGW9MSumOzU6i8w==
X-Gm-Gg: AR+sD11TGeKEsmDlUU8D5VRRS7vyrfEmXiWExAqsq177oORqs2AxJRhladNvokWsIWU
	j+NT44txMGIZDPysw8/ZZWJEpRfe/E3T8ZmQ8nlO1fVLg+be63Ao/ZGwMSnxMO/TJeZfIl1R9Y7
	ZvX4HbcHBw52m3kXDoGGa8jjoeHGTGnVx24JvVMSYSsuMoH3EKxqqJdI3rD59Nn/0XUVaa3VB9I
	09Qrk1x9he1l1CYey8VHRmsDpgG+fCiUjPTJRENLXSOtqvr/WQLEl289bX4MVgXANXn8I85HvNN
	i/vLd2E26bhtM9SrMT+m3FdKdfjEb+3QRoYp8ZarkgQ=
X-Received: by 2002:a05:651c:b21:b0:39c:753a:853f with SMTP id
 38308e7fff4ca-3a10d18f514mr1416711fa.3.1786502323254; Tue, 11 Aug 2026
 19:38:43 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:38:42 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:38:42 -0700
User-Agent: Mozilla Thunderbird
In-Reply-To: <andiub47zsUsL4qh@x1>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-6-zhangzhanpeng.jasper@bytedance.com> <andiub47zsUsL4qh@x1>
Date: Tue, 11 Aug 2026 19:38:42 -0700
X-Gm-Features: AUfX_mzVF_qtHGnSgVqubj7FrTSqgmuPuhnXiNhwESKsg66sjHqWMZRBEXVi9Ls
Message-ID: <CACnXVnd14LEAOfakzpasXnteaVfZo3nsH1a4fEjvHNOQ8bMeXg@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] iommu/riscv: Expose global QoS IDs in sysfs
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

On 8/9/26 1:09 AM, Drew Fustini wrote:
> On Tue, Jul 14, 2026 at 09:06:55PM +0800, Zhanpeng Zhang wrote:
>> The RISC-V IOMMU QoS extension provides iommu_qosid as a per-IOMMU
>> global default tag. It is used for IOMMU-originated DDT, CQ, FQ, PQ, and
>> MSI accesses, and for device-originated requests when DDTP is in BARE
>> mode.
>>
>> Initialize iommu_qosid to RCID 0 and MCID 0 when the hardware advertises
>> QOSID support. Preserve reserved and WPRI bits with read-modify-write,
>> and use register readback to reject values which the WARL fields do not
>> retain.
>>
>> Add a qosid attribute to the RISC-V IOMMU class device. Reading returns
>> the current RCID and MCID values. Writing the documented
>> 'rcid=<rcid> mcid=<mcid>' form updates both fields while preserving the
>> other register bits.
>>
>> Keep this interface separate from resctrl group QoS. The sysfs attribute
>> controls the IOMMU-wide default, while resctrl device assignment programs
>> per-device DC.ta in translated modes.
>>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   .../ABI/testing/sysfs-class-iommu-riscv-iommu |  27 +++
>>   MAINTAINERS                                   |  10 ++
>>   drivers/iommu/riscv/iommu.c                   | 159 +++++++++++++++++-
>>   drivers/iommu/riscv/iommu.h                   |   9 +-
>>   4 files changed, 202 insertions(+), 3 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
>> new file mode 100644
>> index 000000000000..b0cd68997f17
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
>> @@ -0,0 +1,27 @@
>> +What:		/sys/class/iommu/<iommu>/qosid
>> +Date:		June 2026
>> +KernelVersion:	6.18
>> +Contact:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> +Description:
>> +		The RISC-V IOMMU global default QoS IDs for this IOMMU.
>> +		The file is present only when the IOMMU reports the QOSID
>> +		capability.
>> +
>> +		Reading the file returns the RCID and MCID fields from the
>> +		iommu_qosid register:
>> +
>> +		  rcid=<rcid> mcid=<mcid>
>> +
>> +		Writing the file updates the RCID and MCID fields while
>> +		preserving reserved/WPRI bits:
>> +
>> +		  rcid=<rcid> mcid=<mcid>
>
> I think it might fit sysfs better if the rcid and mcid are separate
> files in that directory. Is there a reason you combine them into one
> file?
>
> Thanks,
> Drew

Agreed. There is actually no particular need to update the two fields
together; combining them was mostly a habit on my part... I will split
the interface into qosid/rcid and qosid/mcid in v2.

Thanks,
Zhanpeng

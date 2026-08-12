Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018C036B906
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 02:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502554; cv=pass; b=URfFDbgYbj54e3VWcDxc7lx5DW0knvW8ewn65RnMf9QL0Hcsm2Sy1OmwfUq2oBAoT0AhUbq66zP5M5vKtSM5Y8PhUba+3dIBgoHJ4tQf2LlSmzbTPvQRx42sNxlmB5WScdaBajPVxsz/hZqTSwybAU7Y2Ntd5gIfTXSdHLqglYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502554; c=relaxed/simple;
	bh=g/2afXd1QhsDNXpLtYrqK3LVQpstqIRtF29BH045doo=;
	h=References:Mime-Version:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/TwN8mAKHdOa/+1XUA/wwC4x/CTpw7jWiqz1crCOCgsR/5qiKTkbgMNTcvIR0EnsVABYS8tILD0k+Pl728S+8FV7UHNwHmw63tLTWnkE4AQlJ5elrJjWQYtmUr0vqAMxgwZdSdtQU15gVQNUsBpMJ9l+cNNhvuegEEW/3gFUS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=X0TBkN8k; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="X0TBkN8k"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b015532f7bso543899e87.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 19:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786502550; cv=none;
        d=google.com; s=arc-20260327;
        b=X/lA4EstRX9nbgcSsI68MZPKkhhXzYHAV3QXcHAq+8dvS4tU1luYZXswefryhuIxED
         yRqEVeJuJOLRzGLm1BVH2todUSgv1Az/8hlRP7JNJx+BHolt7cPh6MdyUjraAeI7At6h
         1MX8IndkEkU0TB835XFbrODdl83rRHx1lWQFVctN4hsMqoGDQVtaazqp+IabMRtEDk7m
         HkLE1k0t2PjLs5h1o/iNKn4H2ZNFbs+HGdQtTmjWR7RqMGBviMGa0zpB3NQRS0Vd8zj2
         VO1B0B7HX4CooHXAxABxoX7/osl39HPFbJhlDfLOm2ydsUKF00u4K0R88RwXeCnQnsCM
         MfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:user-agent
         :mime-version:references:dkim-signature;
        bh=MA8pf91t4FXFQxQ756OvBfWNusYinHNGZmr60DLI1ig=;
        fh=suNf4yMfTfktDgK3t51MqxJ/btr6mfLG+w/AcQWEpVE=;
        b=lid7jnmb2TKQ3wYHOxQkTB0wp7+p0l3LiKWkTJNpDnISMwp9DQZkTV95QlRwJM2q/Y
         VWAo2BKAs7l/p9RkJhDHKMwClf0kaQG7qNFi8AWiUC8/WvtMUjyRg/JR4VLWgEs3Kia0
         m71FgnhD1U49Cy2ZBpJYRi5BRwwU+Cwx94/VgspwMJVtDqKoBujhQamRnniVyvC9UPkO
         TLkxtrbg7s5MWAsfR2Kl7qDbHDHs4jSjMDDuuKirC6Qa6KjmetCMOZuewhQ3dLymSTjP
         h16bQKrFNONVnx1w/eWMBy2VsHapotiojmijMBEcfAN9iZAMPGFS08BxyPEnZPEJSRxc
         mDzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786502550; x=1787107350; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :user-agent:mime-version:references:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA8pf91t4FXFQxQ756OvBfWNusYinHNGZmr60DLI1ig=;
        b=X0TBkN8keWfVgh1WEOiDUc6+xgsmMyRil9F91zxV/HrvGhoIZ7fY/+450G5vknDlPc
         TnMO/YTpodH3uQDPr0gVBcDAZcwmWBa59xo2IPAAlf/U5y6LOTnoMupG6QPXyB5Xfd4T
         aVfiZG6TrHrd92h4Kv9QYOCB50+lk/RHHKdt6yLxcbUVOWzRld/w1HWburwUG1LEzCpe
         Fy1K/2PcBgEGWSctc9GEGez7dRSsVZiTwtMyqMDUbj+osN/MguOH5NRWNM6qY23v8gb3
         s8qrvvOw/cfVF2NUdcPuApIJwDfCygjK6MPOnMUbSE/NlcqpXY5NqKdUG0UtvS/UMkhr
         2XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786502550; x=1787107350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :user-agent:mime-version:references:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MA8pf91t4FXFQxQ756OvBfWNusYinHNGZmr60DLI1ig=;
        b=A7FBigcGFtLeB38Ev4vaD95yVs+kKA6zc5CAc5D1Pwi/A6691UlhTDR/iMn2Jw55Q4
         tZts0qbEJXR3p+yvxdHrulBhw/tpZbLKZ6b2dZ1Uy6reLO3SxCGuiCbuB3Q0JV5CoDRN
         GfNZ+bWT/XpbMlvYZLIXBXb4QQ/rS1BgNz93QNdmBfZVkenlj2ZjP7bT3RD4nBHBHWjT
         G22E3FUMV8fdj3WpwGv/phEklamIr9bdjWMRgrqb3nSo+0UDbL6A4Py8qCgEyzYmAa8R
         qzgrsR6+lEGxGRHOKJ6dtIC8dT4isOLTGdSHnnhaLUAFlfubig5SgrjhNtNskCnXvd3C
         vOPA==
X-Forwarded-Encrypted: i=1; AHgh+Ro96VEYPsixhywmQ6d8BPlk3LZBZ1kUHMSAy5DF7KHvSCMUr7Ksil0GSQANbkGsbXnQN8OKlFzamv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9pRPa6ubgQ301FatP/5E8GbM28c/F3yF8Io7Nm+K9Y2UQRy/0
	/3M8yJPuWJVUuW8OaxtDFbQsLIeXgE9mAe74HNZcq10xYhPPuPuXQpIohrI1fnO2YyY1yXSTIGy
	VF1P7x62Sm6uFUhukwIRAsB1QWYVTUefqSbXx90KZ5A==
X-Gm-Gg: AR+sD12XKvdB9QRE6hoYA6Zyo5DSM1f/nLwrpDgHrCnmF+lS6v3lNlSFYik5/TnZNVc
	ldYhVj6ceHB/mpPvm+l17oZHj3vWlItwYToyOhirSl2wdyLm6tocpzhGrC5Vtkxrc8+/v91ZWuJ
	ZS4XweDRQfZXOf1HtcSvRXg6kFm9jjU1239ufmVJDQSYkKHFH1uyOyRBaCF0hm87BRuQ0nMGhOe
	iuO6oOxH0lH4f3QTiuRzzGvQtJXn2OzqgG0hf+9NqRo+bzKLk5/HdVC2nVTDMpzWvE7mcXOSodo
	Quz0OeOKsGr5hQT91Ib1eiXDJBeJmc+74moXcX0Vm+z69g==
X-Received: by 2002:ac2:4c52:0:b0:5ae:b88f:311e with SMTP id
 2adb3069b0e04-5b44e2d9076mr214876e87.15.1786502549982; Tue, 11 Aug 2026
 19:42:29 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:42:29 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:42:29 -0700
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-6-zhangzhanpeng.jasper@bytedance.com> <anuSdFS4Enajdqff@x1>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
In-Reply-To: <anuSdFS4Enajdqff@x1>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Tue, 11 Aug 2026 19:42:29 -0700
X-Gm-Features: AUfX_mxVuesSQBbvklGRHcVkXo5XtC5KWv0jTTFlxpw_NNWMsenVNQ5v5yGezCg
Message-ID: <CACnXVncPrZms8PMJYbK58PEqR_mFzNxG=6CsziQCi8QCyr4eHg@mail.gmail.com>
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

On 8/12/26 5:21 AM, Drew Fustini wrote:
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
> [..]
>> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
>> index 2c57625637bf..13ea67b7e42d 100644
>> --- a/drivers/iommu/riscv/iommu.h
>> +++ b/drivers/iommu/riscv/iommu.h
>> @@ -12,8 +12,12 @@
>>   #define _RISCV_IOMMU_H_
>>
>>   #include <linux/iommu.h>
>> -#include <linux/types.h>
>>   #include <linux/iopoll.h>
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +#ifdef CONFIG_RISCV_IOMMU_32BIT
>> +#include <linux/spinlock.h>
>> +#endif
>
> RISCV_IOMMU_32BIT does not seem to exist upstream and these lines
> to just be deleted later in patch 6.
>
>
> Drew

Oops. These lines are leftovers from downstream code. I'll fix that.

Thanks,
Zhanpeng

Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E42322A1F
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 02:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786501985; cv=pass; b=XaTNDXE6RJ+rd0Sq1n7wVkShZVvyMVSeRTFNvdSs9WAbwrreDaLldDi/+GBcldXhY2sXa53/yPt860CqHC8pLqz6Qwa38tTcz92bMqL/dQkLSvbLfdwDHPVyUN7hrmQFiWeRNMM8DzmaWD8ILRj9ZorZ1Vrii38lVv1lp6DaIN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786501985; c=relaxed/simple;
	bh=Q6qQHVSg2A0pusNqlHUO6ccG/0BmwRkp9wplW5UwomM=;
	h=References:In-Reply-To:Mime-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlzOefj/d7WZ1kTofp+2XgLA9nhgFUoMNyxmDG26G2tBG0vwEQz5R+MF0XwjWUdYop1nM+QxT3eth9zpd5g1aGE9XMNVUMishREo1kr0+DN1oFtUsliY/svUvB2HIEdmrGygcJC5ZFVWVmL+yvX7Di04O9gra08k36al7hEn/QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MAm+Mp41; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MAm+Mp41"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b01cb18515so351371e87.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 19:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786501982; cv=none;
        d=google.com; s=arc-20260327;
        b=YT8NJvTxffRRYoHSwvhLGEnSj5tMAoJfxme3LcBbuP4DCa0X4kQMAy3RBnpvqZdClL
         P/i3xG4azRIVQL9Au0uBhLk8fLHVxDtn7S9zyyP8dgpVR7eJCaPOmFP0oXTD5fo71pSd
         cNmWoyOsU5xVWLf+mnSZebgDd9THloJdwIEEugvDJKTn4jrlXjPjWRaYEUnpj2rsTQOC
         rvq4sra6gD8eZpiM1ucQoneNIBKBRpfr229Ga9n60DVm+V0V7owtporgkoFeuyG8F1WR
         X+fitzxX0nwdfXpA/Lt2xHUEY6hYiQ2688Tf2YW3mkz9Ox42Fkrq0BdoCks2UguOF1SX
         sOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:user-agent
         :in-reply-to:references:dkim-signature;
        bh=jE3vNWzPKFqJXOD6wSjLs1YSOlszFJSXmdSNJJf+nTQ=;
        fh=gMYI2ZWw4D9L58mrKJ3X2AgxosV++abdVIN7/kmi2Qw=;
        b=c/g2sIZhA8s+3Fph5DOi6TyYrgQmEDJkjCej9u2n+DLhRl+QYzKiTewH1PDySZjiPu
         Tl6S4Pz7olY5hKHMFy9lmQKHN7mVi+hvZLLydpkpsNsxyaR5MnHywqTU1VHSe0KyTv65
         IWMSqrUepnPuYDaVBcvsdY7IcbKx+a3iYH62H3DuB6GraDPRcnM8+l0mGgEUMjpEV9VN
         H/Prq4T6NWV3oOxh69GX17D3NlkQO25My2ib8xGSBJohCJ9KgK1k6eRgXJbFxTl/mM1S
         0wCiFMpZ2HE2nVCA9+C72FyGqsQEeMUHliLSQK5EvLo5Saa5U4iidMFpsYzVoX9q9orE
         tenA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786501982; x=1787106782; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :user-agent:in-reply-to:references:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE3vNWzPKFqJXOD6wSjLs1YSOlszFJSXmdSNJJf+nTQ=;
        b=MAm+Mp41BjD7Uv2dP8i2CZqrMI4Q4yCRSWEO/R1k5Mf0M1kI2wnpY5elQwnWaT3BTk
         XlSA0zXz0ywtXngMQfaogkF7Ikc00f/t1EQ+XHhMY63RzIz0mh/ds/kdmjj/ee8Iauhe
         nRpVL8nA4rNLKRsMml9LtFg8V+R1fscZ7IUXSo4qsO1exlR3V468tr6cYC2BSabwGnjA
         dQIGvoX5VZ7jztbuP0ahfSuAZwfdR8j+6u8i+bQ6cc+/TN7OBQUQ8oVvSiHCA39CEvyE
         +x2fShx8CF/AgTktN+BAtZtdN721KDwd7+NcRduvzl6pQuRWKmn7ivRxK8krquCusLJ0
         D24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786501982; x=1787106782;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :user-agent:in-reply-to:references:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE3vNWzPKFqJXOD6wSjLs1YSOlszFJSXmdSNJJf+nTQ=;
        b=CLoUL9CKxanrNiAovaGEzCmxoTJYGKf7uHHjArUDIGASfo/SBMs5jfNlsdyTc6G4VZ
         PecFSRNxd69lNKtg/8Y90gUivYyfinDtnbkfHnTJnLdDW7jjvSplllPRWGjiu3StkjYK
         +9oBjP2CaFmIb+Ail8AYrczN9LjpP8aKaEM6apBcH6l8sYAD08JLNKQ9ljrYHI34xeCd
         JU124XLS+CmNBIVVtopiCXFcJx/iyMLqyo12+6KJhIWYYyfv8PmTVJcVBMXop2EaREA5
         YhtHgXrUfFfaNgOFpOVJd1PDrMP5iW/Yf7kaEmD2laFsVjtq4s0xI5mvCKMqZm/DMx7r
         r1pg==
X-Forwarded-Encrypted: i=1; AHgh+RrBlb4pu1wLjo2UaGvCAJqrsyHn26vQLepk6DSv3j6QhRY1ZFShRlmFVWUAqumoq6G339RITjkdQqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8aBQqTIBOqUkdrTtuSppnrH17O4K+FxAxIGmW1d7YzusixgN1
	5NXBqNTnlLebhmJqp/TydqgYSbVyjCj5VrK5uLcuQqfAHy8x56okxxdZUpRH5jFrw3WqksUideD
	q75uB3JQksaOcsc0J3cxjyBZiCUMQQtvAo1ov5ZYkVQ==
X-Gm-Gg: AR+sD13WKghLRu6RNqunDxFSAWE3+eaxpsTG8dUAYZ0Zb5aoRmq5yuB68iqe7QAu4Bn
	C0Qx6/48cugulYyJPndLm089me7k8/fCcC+B4b6oU/2YGcPkBRPrReVTdB/M1Uth9F73XA+rPtN
	DvTctZhYu7BVsWaqEFYc/RyQYQhgvv4MhCdPOrmLtvlFF1Pk8fdkD24yqrk8Mj/TqmKSVDGpC5y
	b0b85drt/yVxya+BEuOgfiadYRTgzkn5lrbldtx69zhyFibswpV8VJbO3RhA8WRnkCdDlUd+c4D
	yzdMqZWqQ4HERGH0KvRtWx26+L+WK0mQNayvEhlLeHI=
X-Received: by 2002:a05:6512:2211:b0:5b2:f211:130e with SMTP id
 2adb3069b0e04-5b44e31916amr194307e87.37.1786501981558; Tue, 11 Aug 2026
 19:33:01 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:33:00 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:33:00 -0700
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-5-zhangzhanpeng.jasper@bytedance.com> <andiWrKhz5rLPVuq@x1>
In-Reply-To: <andiWrKhz5rLPVuq@x1>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Tue, 11 Aug 2026 19:33:00 -0700
X-Gm-Features: AUfX_mzrwSJAC7ECp6FZeYOMnrio9pumdwlfO90AszxP14I4KKFHzAruOFpbNJA
Message-ID: <CACnXVndvxVx+a3U8jbyMKwFPEz_ex8u1ima5OEh+vhuV=esbuw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] iommu/riscv: Program QoS IDs for assigned groups
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

On 8/9/26 1:07 AM, Drew Fustini wrote:
> On Tue, Jul 14, 2026 at 09:06:54PM +0800, Zhanpeng Zhang wrote:
>> Program RCID and MCID for RISC-V IOMMU groups through the device context
>> TA fields. The resctrl group assignment is per device group, so reject
>> BARE mode where only the per-IOMMU iommu_qosid global default is
>> available.
>>
>> Validate every group member, firmware ID, device context, field value,
>> and QoS ID capability before changing hardware. Then update all members
>> through the checked IOMMU group helper so a validation failure leaves the
>> group unchanged.
>>
>> Serialize DC.ta changes with context setup under qosid_lock. Change only
>> the RCID and MCID fields with ordinary accesses so fixed DDT mappings are
>> not subject to atomic LR/SC operations, invalidate active device contexts
>> after an update, and clear the IDs when a device is released.
>>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   arch/riscv/include/asm/qos.h     |  16 +++
>>   drivers/iommu/riscv/iommu-bits.h |  15 +++
>>   drivers/iommu/riscv/iommu.c      | 200 ++++++++++++++++++++++++++++++-
>>   drivers/iommu/riscv/iommu.h      |   3 +
>>   4 files changed, 232 insertions(+), 2 deletions(-)
>>
> [..]
>> +static void riscv_iommu_dc_update_qosid(struct riscv_iommu_device *iommu,
>> +					struct riscv_iommu_dc *dc,
>> +					u32 rcid, u32 mcid)
>> +{
>> +	u64 qos_ta = riscv_iommu_qosid_ta(rcid, mcid);
>> +	u64 ta;
>> +
>> +	lockdep_assert_held(&iommu->qosid_lock);
>
> It seems that qosid_lock is not defined until the next patch. I think
> you should move the definition to this patch so that the series is
> bisectable.
>
> Thanks,
> Drew

You're right. qosid_lock is first used in this patch, so its definition
should be added here as well. I will fix the patch ordering in v2.

Thanks,
Zhanpeng

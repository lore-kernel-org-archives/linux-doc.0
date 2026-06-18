Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com [209.85.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7CC34FF55
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 23:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781825414; cv=none; b=e2Kzf1rHWH2kQcfvWQXU2pIdNLt3WwoQv8f+ksquSQ6u5LvpIPIR4+rO7rtKLbFrA/Haj3A+Ngi2rhdsrXz4g5nujgAX/62lzUVxvPJ9AgSU9FR8M/DAB+7kqSvH2KpcZJahjLtpwYbA52qjmLPsubqQljmp6Kb9qQbuFs9HevU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781825414; c=relaxed/simple;
	bh=oixVs33DJaRW/AnnIc47KyBAENZW8NUyFFX8YWS2PJU=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Yu0yfrvGgJw+e6uhnZoAog8A58+R0cYFoNj905/h5PdkV5sp2wuqGWPmYm4hc8IeEphBir4c5RCzNk7PBdK0iIiQnvQrny3grdsyBMgR3UtTS2HIQn49G2SdDkKdu7sFj9HPgiRW8euOnii8dH0HOGpA4yXP1pKLRUgaHRvtz3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sh1us9qN; arc=none smtp.client-ip=209.85.167.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sh1us9qN"
Received: by mail-oi1-f202.google.com with SMTP id 5614622812f47-48638b48315so3038377b6e.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 16:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781825411; x=1782430211; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4p6UmVH4InlQHDX0xOai2hxHDLRoZeq2zsnVbO1aygg=;
        b=Sh1us9qNMDIEiCGrGfO2MZcZsJaslth0yqMH296q0wqh6sjrNyH1ndSC8bG9GLlWwo
         E0udaFYoTaDJLksUNyRHm+YzJx/hf9zyHBUwpA5Q46p34uEajJufVbGkE2DXy9CU65PO
         A8g0jUvOIqG6egistm/oPf++2wOimBKsoBSa//rU12+2rduay1lsUgrl6zUc4Fk4nMdh
         HoXatowiEAJpNEDC1FA+77pa7IqiW1OOX5gTOu3XOkCic0dF76Reda116Tk9UWiNc27q
         iJskdgveAYI4mXT4K9W/eRyiePIvv4t/lRkcgZUv8t6R7uSn7Vod5/o6Cgh7gO2H7bOg
         s3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781825411; x=1782430211;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4p6UmVH4InlQHDX0xOai2hxHDLRoZeq2zsnVbO1aygg=;
        b=jzEo/mgdPg+je0KnPbwaJ1JOBNoubYSQhJMAiq+w0QmSd4cpwjWiAaq60xAgytIfSy
         2zrh7stpaWK1cK2zmOv2udLS5FMSQqvG1Zlsxag8hgzVavhzAUwz+zoCMAIg3AS4+hll
         BwPrmXwlXdVjAH/g88IpTHutUFVJ95GFZPnsd0e//lSq+7A3vhlRBZVrOPP0tUTW4akc
         eIf0FfxG6xkh4dL1JV85hrCcBffuU+uxMYzMl/3cYbWLk+662+hYdLE/m2GQ87qdSZnZ
         fWQobHjlq1cnM2inWUAa1oz5aT/62/wXgLnk0QuuPqsRRfWngOmMrWA9iOkfMgLAUJ6p
         LP6w==
X-Forwarded-Encrypted: i=1; AFNElJ9rB7LjCmuNEXXXAdKNhV1XzCUk8NPkgXgW9TOXEvmth7kJ8VlToQhxckUOzt6uyn2nUyFC/I/jb7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxidaZ8WpigqJTZowbWmsuAKd/X20m0Gh76bay/m2qomSTK0KiD
	7neDLg2nRdaTbkSGWxzUnjScnWVN777bXfb0GSV9o60lYYEhZlaX4X/bcgVDtQOYwhmJBV2QIb2
	e8PiZHP9May/t2GP+gJ7ilFIHtg==
X-Received: from jabjq11.prod.google.com ([2002:a05:6638:8d8b:b0:5e2:40af:256a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2444:b0:467:d71:7f1a with SMTP id 5614622812f47-4896c8a3f7cmr734469b6e.21.1781825411153;
 Thu, 18 Jun 2026 16:30:11 -0700 (PDT)
Date: Thu, 18 Jun 2026 23:30:10 +0000
In-Reply-To: <df30b9e0-6938-47f5-bb5d-5b1e67c8879c@huawei.com> (message from
 wuyifan on Tue, 16 Jun 2026 17:07:48 +0800)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntv7bfctq5.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 11/20] KVM: arm64: Enforce PMU event filter at vcpu_load()
From: Colton Lewis <coltonlewis@google.com>
To: wuyifan <wuyifan50@huawei.com>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, wangyushan12@huawei.com, 
	fanghao11@huawei.com, wangzhou1@hisilicon.com, prime.zeng@hisilicon.com, 
	xuwei5@huawei.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes


Hi Yifan, thanks for the review.

wuyifan <wuyifan50@huawei.com> writes:

> Hi Colton,

> On 5/5/2026 5:18 AM, Colton Lewis wrote:
>> +	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
>> +		if (i == ARMV8_PMU_CYCLE_IDX) {
>> +			val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
>> +			evsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
>> +		} else {
>> +			val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
>> +			evsel = val & kvm_pmu_event_mask(vcpu->kvm);
>> +		}
>> +
>> +		guest_include_el2 = (val & ARMV8_PMU_INCLUDE_EL2);
>> +		val &= ~evtyper_clr;
>> +
>> +		if (unlikely(is_hyp_ctxt(vcpu)) && guest_include_el2)
>> +			val &= ~ARMV8_PMU_EXCLUDE_EL1;
>> +
>> +		if (vcpu->kvm->arch.pmu_filter &&
>> +		    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
>> +			val |= evtyper_set;
>> +
>> +		if (i == ARMV8_PMU_CYCLE_IDX) {
>> +			write_sysreg(val, pmccntr_el0);
> This should be pmccfiltr_el0.
> Writing the filter bits to pmccntr_el0 would corrupt the cycle count  
> value.

Yes it should. I found that and thought I corrected it before I sent out
the series. Thanks for catching it.

>> +		} else {
>> +			write_sysreg(i, pmselr_el0);
>> +			write_sysreg(val, pmxevtyper_el0);
>> +		}
>> +	}
>> +}
> Thanks,
> Yifan

Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B2A299943
	for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 22:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765579006; cv=none; b=gSjOghyVWG4+ra8N8aJZo9m4P2/RKazobwHlJDiwTOGOS2s2cJ9hSKtb+gwIYVLmXSr2C1iBLQAkVJFqkOw0ST8kL5Kfupy1MeEghhYtk0YotFyJK46uim3wx92nVbbgtmXLh9BJr+1LEFDGIPUhKlBQZug9xCkEFh5TPLP48FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765579006; c=relaxed/simple;
	bh=9mFmYvzmJytgvfdsMLBBujUvcXmuhikrBpixw/LzYIw=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=BwlKKjJS5Be5TMBhq+tyOyoLokTQTvtrMn25jW8JRSJIhwPCrS7xk8Zep4HFKP+iQVNfTzELR3MErEr1sLdXWuL58eiOs09jGYoFAZDV9X/Gyjg7Y1KoBRbiGfsq/HwRvWtup5Jyd+Uku0ZpYqdhn463GefB9zL41wfM8LSTygE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rTirMttk; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rTirMttk"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-7c702347c6eso1813305a34.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 14:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765579002; x=1766183802; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3V7ABHshgDafwAwYHEV+MXsyHyX7z1eKDaoAGOxARUw=;
        b=rTirMttkQrnbaFs8ND7eaXf3Y2Qzag51ROsEATytlhkUOYEg/Jp8mKIz9cTYONj0hB
         i4m7qIfpigLAIinGJTdN4t+ZnwXgUxq1zzjn/O//u69WOXNlJHXBAIpTZ/fnb/gNsSo8
         9HT8A25JI+BaBZY2lgByhz7ypeTm9aT8uc7mMMblKOUSOv9HspK+KRLNal81or2lsrqR
         Aia4/dwe8hA0uWoVuCgOR3pQ533UI8yXaexHHQ+m0sPZN14XefyjDfs1Qpvd9vXgis+m
         ovz8xTFGLD+2DuNPINpgLKo8X2gK+IiKTIb6Q/WnVtbvp9QdVs75fxL8cnUE8OcNSP5D
         9I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765579002; x=1766183802;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3V7ABHshgDafwAwYHEV+MXsyHyX7z1eKDaoAGOxARUw=;
        b=tLy3WLmXyDPqvbc2rXyL/l+uitEXLOFJ3IdCNF7JA/rZfUJxR/Nz+qfqAZxgpDGmxF
         WJg/uO6xUfoCtRyEdV/FHBjAbKKNGkVjnfb+pVhTUMqUPvzUI7IFzRy3IOHm0dYSh68T
         DQEHKFRc7tRyvLoa2TdtJlG/jhUZdek44QHJ5AjnLwJym+r3TMKyuobgCQGoxe/q4VXR
         g0BbM/9R/2C1lFyJh++3vjYmFO8nNPA89mcNde8E/zippaLb/V3vsLCBbu6XTq8UoFcr
         FMUFFPOWyYqyOShklgzoPiotbm6HZyQgNhDHmmdQp6z2ax1bKa1jjbBDwdEaAcAc8Cqy
         TdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHdPDpWF7KsEa+8J6KUv/jpDQ575Dl1egoLatOb7SCdC46zgnx26cN9j1ngj6sLhcCBSmOv+O3zm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLLVWWtygSQG8yeEZ4CNlN2NVlZtShOOsZ1P1Dss1h2YxzNBeq
	UyIg4milPVTjhkpfsQLu917cgmKT7x7hvHVUcLeYylagEUsFxm+mIB7xnK9wwiGFIFZ8fOqtIIi
	ycmAhaJRxjiR5LfAGdZfFJQ1t7g==
X-Google-Smtp-Source: AGHT+IHkZVgWFjBleB6izi/mYS6b4xrdOCdIwFPbm2svitIfX3LWxEQK52duuNdAGmZBwWfL5PIEmP5Eu+rxvNmu9A==
X-Received: from ilbbl8.prod.google.com ([2002:a05:6e02:32c8:b0:434:972f:bf90])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2223:b0:659:858f:f1d3 with SMTP id 006d021491bc7-65b44ff60f4mr1625746eaf.0.1765579002046;
 Fri, 12 Dec 2025 14:36:42 -0800 (PST)
Date: Fri, 12 Dec 2025 22:36:41 +0000
In-Reply-To: <aTimpRFfr9wI9Hw5@kernel.org> (message from Oliver Upton on Tue,
 9 Dec 2025 14:45:57 -0800)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntbjk32upy.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 20/24] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Oliver Upton <oupton@kernel.org> writes:

> On Tue, Dec 09, 2025 at 08:51:17PM +0000, Colton Lewis wrote:
>> Because ARM hardware is not yet capable of direct interrupt injection

> PPI injection, it can do LPIs just fine.

Clarification noted. I will update the message.

>> @@ -961,6 +964,12 @@ static irqreturn_t armv8pmu_handle_irq(struct  
>> arm_pmu *cpu_pmu)
>>   		 */
>>   		perf_event_overflow(event, &data, regs);
>>   	}
>> +
>> +	govf = pmovsr & kvm_pmu_guest_counter_mask(cpu_pmu);
>> +
>> +	if (kvm_pmu_is_partitioned(cpu_pmu) && govf)
>> +		kvm_pmu_handle_guest_irq(govf);
>> +

> The state ownership of this whole interaction is very odd. I would much
> rather that KVM have full ownership of the range of counters while the
> guest is loaded. By that I mean the PMUv3 driver only clears overflows
> on PMCs that it owns and KVM will do the same on the back of the IRQ.

If I'm understanding correctly this is a code location concern, because
the host driver has to handle the interrupt in this function or a callee
of this function.

I will do it that way. It would be duplicating a small amount of logic
in kvm_pmu_handle_guest_irq() but I see your reasoning.

> Similarly, KVM should be leaving the "guest" range of counters in a
> non-overflow condition at vcpu_put().

Noted from your comments on kvm_pmu_put()


> Thanks,
> Oliver

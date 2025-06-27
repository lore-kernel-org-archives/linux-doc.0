Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212F20D509
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 20:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057155; cv=none; b=uUet0sTT8o7rAg3xCTOLDx9CtwsVQbNJ+jnAdvRHSb+magH931R0OgTYXalnwOsBoOGBML25Tftg9YDiYe4fSDVIYsc4DwoI1+wTiWIehN8mBJWeZnWQriKjWG2mQAXbvJ3dSQaoAXPtMaKZQW3lpb/vmeGTc1SYDeqVdq5dfEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057155; c=relaxed/simple;
	bh=31Dp+CMBRMQ8uN0vaou9SdCDYjiC6hdV62l5ML46Uno=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=tgcI3xgJbs1oXL0ioq1UxXgSZjnVy4x0YdNgaZAcMZAT3dvsJdJAQXrqe0IeyBmDDstWFAUWTVdbVKnlXsVeEWJiC+qbk3fdzyOppYqmefMUw+5dfiVwFuX3ixsLMOKpvGYcuVmvmWjYzV+l55ldGhEuhdVoFq1Cb521Crf5wRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GPPSekE1; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GPPSekE1"
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3df2d0b7c7eso3026425ab.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 13:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751057153; x=1751661953; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQtNA0hS1YdwM8TLVBpaF+KBYsznLZdF9AooNXo/LEo=;
        b=GPPSekE1vDPGi2XJnCTME4l2gNLn7mqvF+JNHh9jVDAvjMs/kO158C4pOpMOfwj3tp
         nXVZ9nYNEfMkCajpywJLld7Nmf4/YWaq7cmtW5NJBF3QQAgOiXZ7XGr1ZkqDKjuNNVr6
         bfIchAca0ucovoWjV1CiA2zMhCX1NbtQKZOWMfUitX3tM0hZCW18E6tRDjQgyUEm/y9q
         ZXvmGwmW0ptfgmcN/SQ53FgH9ooQgUcNeBjgAsE6e2WTQwXYe9f4WTxOakQnWTT7jkzG
         byx6hzUh1hzKomegznDcDeeWWrQdJ7g7i19rrxZR/DDwC9mRInlxXjyluqTdaqHdG0il
         LIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751057153; x=1751661953;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQtNA0hS1YdwM8TLVBpaF+KBYsznLZdF9AooNXo/LEo=;
        b=KRWEox87f8vk1FAQF8SO+y40iVjXSvb0VwxvQsleOwH+9gDu1b9tl3IexRMzhNgalQ
         iJl7i9hmEuNpn8gIVcTUbkZFB0r47wk832jwcC+cJoNOtzQsWhQ4eh0mWIlXb2X3lsQ/
         nO4ERIUmozjR6K6tNihOmXyUAjvHzCrVY0w/0D9cKtfGiHQI+X5iO4ADGHljQgCfn2Nv
         3eAEWOnfejDXIajMqKuT6CGdjglJLPHF6nm5ZqwmYsYnR5usIvrcoxC0H/S1wKQcGq3p
         yTMd95BhVWwF26VpdDIuJ0Ye1CzvAtJl2be8FH33ATMpK2G76Gwu7snqEhq7XVf4UHRJ
         jCvA==
X-Forwarded-Encrypted: i=1; AJvYcCWv//oV+XPmDkttfEsJ3nLwuVkT73HdTTr8uXqVukbI9cB3AUxPVzZHT3tPfcuDwjjItFu5fcHgdtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0c/wUciY9ZfLeldaej9yT9WJfZnI/Xx60oqGgVBCHzQYf+XjP
	VnHSG9ia5iIc5UOXVBAjTmDJNu2uCBkj/zpMiT8M3EGGs90Nd3rySC/RjhucOqfb+1XADZOGCgU
	Zas+Y4qwWsIAXqr+c1R7RHTKFYw==
X-Google-Smtp-Source: AGHT+IG8ubvH3kPztAj1ao94LgGUW1XY/gBYCn7CffcpcGKKkMXZJW+TsDn1nh7iOVmLnOgs9jfVsOn7IAe78nE95w==
X-Received: from ilbec16.prod.google.com ([2002:a05:6e02:4710:b0:3dd:77db:e2f7])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:12e8:b0:3df:154d:aa60 with SMTP id e9e14a558f8ab-3df4acf7b61mr59890785ab.22.1751057152711;
 Fri, 27 Jun 2025 13:45:52 -0700 (PDT)
Date: Fri, 27 Jun 2025 20:45:51 +0000
In-Reply-To: <86sejlb9ba.wl-maz@kernel.org> (message from Marc Zyngier on Fri,
 27 Jun 2025 14:31:05 +0100)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntcyao9am8.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v3 03/22] KVM: arm64: Define PMI{CNTR,FILTR}_EL0 as undef_access
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	oliver.upton@linux.dev, mizhang@google.com, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Hi Marc. Thanks for the review.

Marc Zyngier <maz@kernel.org> writes:

> On Thu, 26 Jun 2025 21:04:39 +0100,
> Colton Lewis <coltonlewis@google.com> wrote:

>> Because KVM isn't fully prepared to support these yet even though the
>> host PMUv3 driver does, define them as undef_access for now.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/kvm/sys_regs.c | 3 +++
>>   1 file changed, 3 insertions(+)

>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 76c2f0da821f..99fdbe174202 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -3092,6 +3092,9 @@ static const struct sys_reg_desc sys_reg_descs[] =  
>> {
>>   	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility =  
>> sme_visibility  },
>>   	{ SYS_DESC(SYS_FPMR), undef_access, reset_val, FPMR, 0, .visibility =  
>> fp8_visibility },

>> +	{ SYS_DESC(SYS_PMICNTR_EL0), undef_access },

> $ jq -r --arg FEAT "FEAT_PMUv3_ICNTR" -f ./dumpfeat.jq Features.json
> (FEAT_PMUv3_ICNTR --> v8Ap8)
> (FEAT_PMUv3_ICNTR --> FEAT_PMUv3p9)
> ((FEAT_PMUv3_ICNTR && FEAT_AA64EL2) --> FEAT_FGT2)

> If you have FEAT_PMUv3_ICNTR, then you have FEAT_FGT2. If you have
> FEAT_FGT2, then we already trap and UNDEF PMICNTR_EL0 without any
> further handling since 4bc0fe0898406 ("KVM: arm64: Add sanitisation
> for FEAT_FGT2 registers").

>> +	{ SYS_DESC(SYS_PMICFILTR_EL0), undef_access },

> Same thing.
>> +
>>   	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
>>   	  .reg = PMCR_EL0, .get_user = get_pmcr, .set_user = set_pmcr },
>>   	{ PMU_SYS_REG(PMCNTENSET_EL0),

> So none of this is actually required.

Thanks for the context. I'll take this patch out.

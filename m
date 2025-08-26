Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98832E7F21
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756234246; cv=none; b=vDcM9NoEoxcbYc2POS79hLbgq5Zq9V/SLSL3z24JX7LXQTTlWX7QryitGivbPmMU4d4Oc8FjkVwLkVeh3ECIa/mSQF97Yv+kaMxzVExGhMN7/eMayLxPsWjP0wsNcYj+GLLpKVEWysSflUvdw4rVTIZNqSjfssmh6Zh6PUuHfJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756234246; c=relaxed/simple;
	bh=8jhr+zgrktlFUJPHflNxaNZs/QqFUKfGNDK/vx/Mf9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXG2a1Z1KcR6w3mnNMNsFjeGkkmtyvF3HvgPWIvQFrtEL0IyR2hyPadUWrHJB6IT2+GnHhdut+9DKJT4QRdm+93UAaLgte0fjzOYO9kgIuTKBYg3EO3hf7fc/dGejYEb0op8O7YktOIFay1hsX1Tz4TD/W56nvS5VdOgAZaO5BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=eK737trT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="eK737trT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso52704935e9.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756234243; x=1756839043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8jhr+zgrktlFUJPHflNxaNZs/QqFUKfGNDK/vx/Mf9o=;
        b=eK737trTg7q4zm2fpQnGCjZCOcUp+lGVxDISNGg6fxyyTFDi6eIAWiqvS12wFsg/Ea
         GhV1TM+oKCgnIFT3xXejhbbtVe9O2DMPjHYIftDUhAgV2m/5LJHeP86cA/PpGl6IF0sx
         BK0sRF2D/t3zFzE+SJxnXhv8Kl9kqAeNG+I2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756234243; x=1756839043;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jhr+zgrktlFUJPHflNxaNZs/QqFUKfGNDK/vx/Mf9o=;
        b=FhIAZZRA4msTfr563rBkGQDy4wL7tR63AUQWEk5xTIUBwdxA5fyLCsfK76bpKKQKjg
         DYN5RxrjR+cTtr9BZG1VmRxH++nCe6Rn+bfUbL3IvmVCYT4444RKhzFkazem0rsJrTbR
         CXi/AH4FsG+XZlrriUI5VfUhcBNYbm5jOGpEJI376rC0AeSee2BwmeE88MBxUBe9hdY7
         51ibLVpgP0klMMR8c51AjWzoHkQHZdoGTlGyhtx+ABNYV11mmT4YMfhYeJ24dytrIBhG
         +ZH0M4jatlHA6GjFN2uz0RwaJNo62HIQ0KX2yTqa/PQYFZB7kJo0Nw7ssptWK8rSvrXT
         JSRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXhA2yrTG3G8kpWHe93LrXPLKwBKqYmjsAji24HzjC9V9TkOxN+la1mTR2hhQ51Gwdt6pg3TiCYzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxsZpeLVaqulTT6BKVkx3X3YZHmZir3TjEiJa+kZDH/FK00vb6
	prOMYQSm+4Zh2UIdKRGByIRy2jf65DC4C+EQQ+oyDw5FpzS/P6lxJ2E8mbpimFcIr5I=
X-Gm-Gg: ASbGncuoVJwuGFnfDcE53Khe/+lZhZGcMl5t15VLlUm3Sy4Yr9QA4adKd+C3OYah92O
	8K4JpeWnC37bHzNZYlg5Osg/44gaLpjOts+MFA4QRiQPexIgLkQSmYxFg2fGsghtj5h6N6kscVY
	U1v4g5akDQJOzDVBXFm4fQyAVn8A0kKPjOHGxgoBRrSHDQRw5UfrxlkVbH5WYd1+g5dR8ARgRVZ
	4SP/XcgepnVhdbBqmgHrOlQUEaTd1l3Ib7sht6nn6CcIm6DJMWbELzGdabp9oJLFzcLxdoUQtwv
	tx4VzbMiZxiTZR6iU1w2v9dA43n48soeahBPzh1ILaGxbII4uinLcG9Uk87ql3EDXFBUosjW+3F
	CuTKqWT4qh+JrWI2VrBm5Txf93vGS/YKKuS3s3toP58EpMcOaoVvYf+cUEuyqUTmxvEg7
X-Google-Smtp-Source: AGHT+IF8MzILpJEqNk90bdY6bp45yJeU21cH6r3SZLrCLRLDqDFhpaJ0n9kOGIMSvynRVb14WNZXpg==
X-Received: by 2002:a05:600c:a0b:b0:456:1442:86e with SMTP id 5b1f17b1804b1-45b64b750b4mr41337505e9.21.1756234242976;
        Tue, 26 Aug 2025 11:50:42 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net. [195.149.20.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6c5cfd14sm3164585e9.14.2025.08.26.11.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 11:50:42 -0700 (PDT)
Message-ID: <36e0a671-6463-4bab-b5f1-63499838358d@citrix.com>
Date: Tue, 26 Aug 2025 19:50:41 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/20] KVM: VMX: Set FRED MSR intercepts
To: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, corbet@lwn.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, chao.gao@intel.com, hch@infradead.org
References: <20250821223630.984383-1-xin@zytor.com>
 <20250821223630.984383-7-xin@zytor.com>
 <2dd8c323-7654-4a28-86f1-d743b70d10b1@zytor.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2dd8c323-7654-4a28-86f1-d743b70d10b1@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/08/2025 3:51 am, Xin Li wrote:
> On 8/21/2025 3:36 PM, Xin Li (Intel) wrote:
>> +    /*
>> +     * MSR_IA32_FRED_RSP0 and MSR_IA32_PL0_SSP (aka
>> MSR_IA32_FRED_SSP0) are
>> +     * designated for event delivery while executing in userspace. 
>> Since
>> +     * KVM operates exclusively in kernel mode (the CPL is always 0
>> after
>> +     * any VM exit), KVM can safely retain and operate with the
>> guest-defined
>> +     * values for MSR_IA32_FRED_RSP0 and MSR_IA32_PL0_SSP.
>> +     *
>> +     * Therefore, interception of MSR_IA32_FRED_RSP0 and
>> MSR_IA32_PL0_SSP
>> +     * is not required.
>> +     *
>> +     * Note, save and restore of MSR_IA32_PL0_SSP belong to CET
>> supervisor
>> +     * context management.  However the FRED SSP MSRs, including
>> +     * MSR_IA32_PL0_SSP, are supported by any processor that
>> enumerates FRED.
>> +     * If such a processor does not support CET, FRED transitions
>> will not
>> +     * use the MSRs, but the MSRs would still be accessible using
>> MSR-access
>> +     * instructions (e.g., RDMSR, WRMSR).
>> +     */
>> +    vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_RSP0, MSR_TYPE_RW,
>> intercept);
>> +    vmx_set_intercept_for_msr(vcpu, MSR_IA32_PL0_SSP, MSR_TYPE_RW,
>> intercept);
>
> Hi Sean,
>
> I'd like to bring up an issue concerning MSR_IA32_PL0_SSP.
>
> The FRED spec claims:
>
> The FRED SSP MSRs are supported by any processor that enumerates
> CPUID.(EAX=7,ECX=1):EAX.FRED[bit 17] as 1. If such a processor does not
> support CET, FRED transitions will not use the MSRs (because shadow
> stacks
> are not enabled), but the MSRs would still be accessible using MSR-access
> instructions (e.g., RDMSR, WRMSR).

This is silly.  AIUI, all CPUs that have FRED also have CET-SS, so in
practice they all have these MSRs.

But from an architectural point of view, if CET-SS isn't available,
these MSRs shouldn't be either.  A guest which can't use CET-SS has no
reason to touch these MSRs at all.

MSR_PL0_SSP (== MSR_FRED_SSP_SL0) is gated on CET-SS alone (it already
exists in CPUs), while MSR_FRED_SSP_SL{1..3} should be gated on CET-SS
&& FRED, and should be reserved[1] otherwise.

This distinction only matters for guests, and adding the CET-SS
precondition makes things simpler overall for both VMMs and guests.  So
can't this just be fixed up before being integrated into the SDM?

~Andrew

[1] I have a sneaking suspicion there's a SKU reason why the spec is
written that way, and "Reserved" is still the right behaviour to have
for !CET-SS || !FRED.

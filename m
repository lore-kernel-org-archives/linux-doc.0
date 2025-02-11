Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A1E1EB1A5
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269892; cv=none; b=k+GBzqTfo+4kiXrxrCHJGC3IVzU/xHpCzRBPeNWs9vubCBvTB1UMFnFUKFI+3d3x6TWdF+0tGq6qtN161/lfys47982+LlDqdnDWDR8KAY6OEjOFWqpdYMylkqqKWo6JlMV1HScQ3V+gwR3Njk6TByayEIYGdBJu1nFV28VLcr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269892; c=relaxed/simple;
	bh=3UHxA/qdoAY3MebmP1PqzZZYiy2zYfWAOCI1X57hn6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEMi6OwW35SBOTdocYcErdyPPoHguFH3XikUhKjCq7f7VegHkHm1FNGxVMjBl9NqdhADaCXlzzMuhNqv0qbrpV/zBOI6FGoFunnVNZQEZ0mKCgO6wVIM8OD10g26xdfoGM4Y+qGZX0oSuMjUE+QP2nFytMqWlPo6lkHY3NWBi3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pkaMqdaX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pkaMqdaX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso2051330f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 02:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739269889; x=1739874689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/a6P8MPGQ0avVAV5Cfpz5Ib9WVUVZW41mP8caOrUgAQ=;
        b=pkaMqdaXgaH8QmNXCo5B47pnLdVS4Skgx+AokX/Evv4YmPRQCOTYWmIVQxQpf8Ex5d
         OsVKM262Hg94W0XE3ZlIQUS7Ze5609rOSMjvyKh6d0BhEJzyQjzozs2XfBRqNQzayBRq
         CCJPjUn/In+zVVEQoRoZEAtTJf4G3oykcdD+e/aYSf9e/0oNnCHpJO2tOfJrQu/fvhxN
         9WnRwzQI4Mx7U5sKEWEugBgSVYMOHK0iw6TzBYNM5x7l0W4M6E6vCBOMxR/jBhlhqhHb
         A9xjyEnaFuiFYD9tGaIIexPq/7xzK13iCyNBVSRSey66RQmDXiJXzoydgqgJzu4/p+sG
         rhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269889; x=1739874689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/a6P8MPGQ0avVAV5Cfpz5Ib9WVUVZW41mP8caOrUgAQ=;
        b=veo1Rj2S/KflLeu60uyodyYmTQnsmDkUEnwRAMkQ5J+DRxlX4NT7zWQ8UlgU3JYP6N
         xXT13OtCRhBcWuvUYVELW54VTW0w072uh4hL9fbQPZSZfFMb0ESH85IilzTU2p7sx6rH
         xU7uc+ONMeVpfwIZMPVODuT+FtD2300uhMg+b1u+pmsICvSkSxjKZsDIP7MBg1hYj9i6
         SgFvH/oRO3kQcRiFI4tJ1sYuhEo+UrGhElv8xidCGCSqNGs+M5+4kcN0x9iVHyzt407G
         xO4/+yzHfxcCoE+oC39speVDbB75ZqAn1y0JNTwv2RLBz3llkM34X2XxlTVCueSLFvet
         CZbA==
X-Forwarded-Encrypted: i=1; AJvYcCU6jiDssq4ObjsURuWlZMOdqhwfoT71PBhwaZzw1xu5fa5tN0v66LALyPlQT2lrfkm9aAp2JkAFw04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjD2C4Lj//JOkF/1qrsxmMR8VjZGl3cJ2hw5fnHxQBdMmUpZnS
	BDTfO8ZECyLWL4PahNRFBLkpr1ISM1rpfBEeCYLCzOjwym9kHXz8h1iO69HRv5w=
X-Gm-Gg: ASbGncuvh5eB6FJqnFO4ZpTyFaQT5iptOslOmpniKUeDmX0SnKuQLQ2wAx1HX93yMyO
	E5pjWvA+YTPBD8f0lQ9SfLSBX6Rg39VBBnmB47rjq+m3egIttucD76jX1cQdMegm/4vjuKd6yZ1
	6u4apV1/x4fi9nNQQQNsh2JPh4l9CNVsaSSZNFaB3K7H7RVl2fKZEaCSO3JZ1BzRuBDMU9WPJ32
	AyXqMLB8355esbZjmQb8uJz4jNMGNo1MuQrIbHwyNNZqSwHP/MYC/Ryt3nloBUdjSWrWzXCyt+O
	S+/GoJBIfleAvW95lhuBdpGrSF+JphK/MH7/qBdbOpRtMBYWm6+z4FyFKlyS
X-Google-Smtp-Source: AGHT+IGrgjPSoOFkF4U85XDHHGJCIZJGQtRmyI8bFutmDHy81O7VBQ3XMYuog+hqAiQegwH4kGE9Dg==
X-Received: by 2002:a5d:588f:0:b0:38d:d613:9bb1 with SMTP id ffacd0b85a97d-38dd6139eacmr6656232f8f.12.1739269889329;
        Tue, 11 Feb 2025 02:31:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc3a10fffsm13606012f8f.12.2025.02.11.02.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:31:28 -0800 (PST)
Message-ID: <a8af5d3a-e739-4f65-9e2d-d92978be9a3d@rivosinc.com>
Date: Tue, 11 Feb 2025 11:31:28 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] RISC-V: KVM: add support for FWFT SBI extension
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-15-cleger@rivosinc.com>
 <Z6rjkk5JlMlqbl2j@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Z6rjkk5JlMlqbl2j@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/02/2025 06:43, Deepak Gupta wrote:
>> +static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long
>> feature,
>> +                unsigned long *value)
>> +{
>> +    int ret;
>> +    struct kvm_sbi_fwft_config *conf;
>> +
>> +    ret = kvm_fwft_get_feature(vcpu, feature, &conf);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return conf->feature->get(vcpu, conf, value);
>> +}
>> +
>> +static int kvm_sbi_ext_fwft_handler(struct kvm_vcpu *vcpu, struct
>> kvm_run *run,
>> +                    struct kvm_vcpu_sbi_return *retdata)
>> +{
>> +    int ret = 0;
>> +    struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
>> +    unsigned long funcid = cp->a6;
>> +
>> +    switch (funcid) {
>> +    case SBI_EXT_FWFT_SET:
>> +        ret = kvm_sbi_fwft_set(vcpu, cp->a0, cp->a1, cp->a2);
>> +        break;
>> +    case SBI_EXT_FWFT_GET:
>> +        ret = kvm_sbi_fwft_get(vcpu, cp->a0, &retdata->out_val);
>> +        break;
>> +    default:
>> +        ret = SBI_ERR_NOT_SUPPORTED;
>> +        break;
>> +    }
>> +
>> +    retdata->err_val = ret;
>> +
>> +    return 0;
>> +}
>> +
>> +static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
>> +{
>> +    struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
>> +    const struct kvm_sbi_fwft_feature *feature;
>> +    struct kvm_sbi_fwft_config *conf;
>> +    int i;
>> +
>> +    fwft->configs = kcalloc(ARRAY_SIZE(features), sizeof(struct
>> kvm_sbi_fwft_config),
>> +                GFP_KERNEL);
> nit:
> 
> I understand that in next patch you grow the static array`features`. But
> in this patch
> `ARRAY_SIZE(features)` evaluates to 0, thus kcalloc will be returning a
> pointer
> to some slab block (IIRC, kcalloc will not return NULL if size
> eventually evals to 0)
> 
> This probably won't result in some bad stuff. But still there is a
> pointer in
> fwft->configs which is pointing to some random stuff if `features` turns
> out to be
> empty.
> 
> Let me know if I got that right or missing something.

So I actually searched into the kmalloc code to see what hapopens with a
zero size allocation and it actually return ZERO_SIZE_PTR:

/*
 * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
 *
 * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
 *
 * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL
can.
 * Both make kfree a no-op.
 */

Which seems like it's not really random and will fault if accessed. I
think that's enough for that commit (which will be bisectable if needed
then).

Clément

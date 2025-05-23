Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B6D2951B5
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748014206; cv=none; b=OSHVcpNEkv9ckWQtEVvW3lE2UXQkKQtZb327rxe5/v+FEvbSooNSxBfDVWI24g/Dk80sdZ+zLa4P+K/JhkMkO2Gu1XUSxDlcvN0IRR7rGNv6duga0kcnlqfYvmeifjFWFlEvqC0M0rHsOLZ3UeTCaY2aVe1PPppuTbBJ6Ehpwb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748014206; c=relaxed/simple;
	bh=ap09PPMpRfnB0hj509ImQDib3x/WBo05UmUabOlkmMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjWbl8qL1ap3GJG2lrUArG4ArL7DlZe912ke0hPqeSYPMvRtfudZtOS1Q7ZNBsPw9GP7JX2R9WoqaOGO/Glx27z+EnK2lnS7YVqxIIzohCXFE3LStJ/5seP2YPPiNZMCyjnym31/1u8DZzgFLIqYs/LdXCx1uYsaANk56Jwqt5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=au2b19yy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="au2b19yy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-231fc83a33aso80025ad.0
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748014204; x=1748619004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZysAlyZtrotmIvgcjSaWUnFpu8BmC8DX1etzBHhsTSU=;
        b=au2b19yy/hEXIDR70yx3j2KpImtXIwV86QHhgBsABWTIW4fWk+b0jjYDAaYivlApNN
         3jZBrz3D5sO2NmM+ivU5iQcspLE/S+Bcw+PTQ7tOSwpspQFaAY7DxJrFvzNET4WfpJiN
         UzmBMG+vKTwpiErtkNIFaDBauBf5BoflY+NPKyw9nYhh+w3nqhm79+Da63JwtlM69GNZ
         7irLjmIDHXusZULnNboj6lzXnEh1q3htFJQxzrRhtFJaiWURlaG3gqwYD+iVJvHKyvCf
         Pxfp32tkCekGCQbwHoKgsWhRGksYzZGWI/N8cd+oKGUyS3uSZrnT2RXJeaEYreMMlPbK
         KhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748014204; x=1748619004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZysAlyZtrotmIvgcjSaWUnFpu8BmC8DX1etzBHhsTSU=;
        b=g2h//dO2i9ys+nlp7sR33llhP1oBFf/DC1lOec2/cdLdX5lJwX8H72MkT3xqxZJCLt
         a1SI9cB/ZSFpKvL6pTlSP6bn2KSOEI7w2xyHVGQCAEIDg4aoPWg1iYB7+psSGmaTg7mB
         HcOXbpBmqU9HdTuOOHUGofZaURn1/aQJHVW2SNLOzo52Guj8yjIo3Xa4oQ/WrWbd39jm
         Hf2VCftnNsThgWNfw7rYi2kabkXDY61JQXE7wx00EGKGNwTrio3gFvQApYboG3ooFquO
         Ejl1/YwzNkTRkZGVwN3j+YYKmD0PDKgNHDGAUGSiWDAyIVv9lgAfJa2eUXUcfE6nTWKS
         YMlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwAFRDhc+Gd33mKAOe7glrtpJYUVoFR+w6P+aq1J1HmEOylCKzMhINnmNbZnTXKQJncYzs49O0lsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxvnQygxG1TOIU7TVt+2pQlqVTI2+iznxzpP2HLL0g+G3geLQ2
	M+yzxdsp14kM+a3FD02c5mF6dEZghanImNDxDBzZp+qLAEntJqMFys3xs3JPbExBM0w=
X-Gm-Gg: ASbGncu/b6SMk7fNB4BdQLTcTmADpCVNhOclY3fH6nwi1EURYUvr1CjBBnfH0tdNbEF
	2I1g8YaakPq9FCPICIMxwbCiHDqtOGBGAGaa1yKD+tnYW8ayigyvCqOig9XScjnYVpDSv1gNhiM
	MPkzMxyZ81R1W548G3q/MNcOCmKbYwZs4LwA43o2jx56IeWzwecN61FYcrqLzLOFXIORw/bRXkd
	dIc36CTaTPVKrGfHDtcit6sLXFTpIPbaFxrC0uUOORAfL4kulMG3OD5R90fr4pjpPbzkB3PNZje
	5N25h49Q0L/oJU9JIAdFphSU99Hn24e3TYcdFaBNJGpBepygnQTa7h/RiSN8Y0lzah+qMXorP9w
	pt34xIOzZYnLYsMgvTUYr
X-Google-Smtp-Source: AGHT+IEdlANg8wwO3+blZsMeIKZDl/aWdfuOZvDvj8FeW02HTI0mk6reEwHEpni5Wcy/mFcYlo/kjQ==
X-Received: by 2002:a17:902:dac7:b0:224:e0f:4b5 with SMTP id d9443c01a7336-231de351d32mr381454745ad.7.1748014204025;
        Fri, 23 May 2025 08:30:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed195csm125049005ad.212.2025.05.23.08.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 08:30:03 -0700 (PDT)
Message-ID: <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
Date: Fri, 23 May 2025 17:29:49 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI extension
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
 <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 23/05/2025 15:05, Radim Krčmář wrote:
> 2025-05-23T12:19:30+02:00, Clément Léger <cleger@rivosinc.com>:
>> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
>> +static const enum sbi_fwft_feature_t kvm_fwft_defined_features[] = {
>> +	SBI_FWFT_MISALIGNED_EXC_DELEG,
>> +	SBI_FWFT_LANDING_PAD,
>> +	SBI_FWFT_SHADOW_STACK,
>> +	SBI_FWFT_DOUBLE_TRAP,
>> +	SBI_FWFT_PTE_AD_HW_UPDATING,
>> +	SBI_FWFT_POINTER_MASKING_PMLEN,
>> +};
> 
> How will userspace control which subset of these features is allowed in
> the guest?
> 
> (We can reuse the KVM SBI extension interface if we don't want to add a
>  FWFT specific ONE_REG.)

Hi Radim,

I didn't looked at that part. But most likely using the kvm one reg
interface seems ok like what is done for STA ? We could have per feature
override with one reg per feature.

Is this something blocking though ? We'd like to merge FWFT once SBI 3.0
is ratified so that would be nice not delaying it too much. I'll take a
look at it to see if it isn't too long to implement.

Thanks,

Clément

> 
> Thanks.


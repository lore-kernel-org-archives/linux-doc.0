Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6078200CB
	for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805668; cv=none; b=k1/2LyL57citOAWr2uk2UbQgQjYYc3qrQF0mn6tRwS8bRqkEIovspNhYUASIinihqwH8vn2S7Fmx4rTUSWOg2NoXbETC4Xj62aKoQDKbbKGh462lraYPXR6EpXUt3ro87zoS3QT/ZjohLQr/0VT00CeM7PjqV9cEXLOtKsPL4to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805668; c=relaxed/simple;
	bh=EQ9AC539GNhH9+gAeB++MkWZFfFNy+69yprAeYh9KIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7xKF9LC5SBocgN8zLvvudn4LkGsSJgmxULKE1gaSfQnFCQg1iNI31TcqwpynBDZ1pgWjPFmFNv1FhvPP6fNcrKyodCog0Q/cNu/YxeluRPskqIKmiqbfqq4ytyQgrl3U0q/gyT4KRFxqPbza9+vxhm3tOYIDbRCUSGyCRjsDLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bwXhBRvA; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bwXhBRvA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso6198281a91.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742805665; x=1743410465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3uw5Z9jtzCHbHI92vRIdMw4q+7D7K0HGUyXcM2dV4I=;
        b=bwXhBRvAoKa4MAAG4vnJUhGtJu1xELwfNspOFDUlfvx5arD2LoIuyDM9xVjqrn501v
         5ucnIRJagTy9JP4hFnFdAyUoc7WOXeHTYHc3Ghffoj7ukUqkyWY9RvBVsM1k3yL8W8f4
         5VHhFlg40Tv465RbSJoZ7unU0g/ixI69rr0ZKmsl0GLjf0MJnCikPfcj7kZBMQzxqs8I
         QJp7OFD6UKG+hMmajx/hNoHF7mN2ykV7Pry5lpd5mN00iio9P3k+vWF/Ve1FB3cEAjfx
         Rhdys8hcd0k0PhZYy53BsDBDnYBG7LdFNllpQZnh+3M/E5zr8ty5ws0SP7QQVQnP1cxq
         MTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742805665; x=1743410465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v3uw5Z9jtzCHbHI92vRIdMw4q+7D7K0HGUyXcM2dV4I=;
        b=QDKPeydm3763jGkwTMjWKhMl+El14hLZ3xOEXe7ZgC/aW3wFp6aVRDC8qrtXUYGpDi
         UKC0z/qSAMuDCgQTQs6aH0ODxtJpJHAufxDJnHLxh8De6M9jW2sUb5D0hP+kylPs3k7W
         oHieR98rHXyVTtqxqru1ETYK0bFI3H8vERt+em8xTyoKHrwPPcFHN+OQoXJGjZN57TuP
         m6XrAMGhRYrYpXtXnZb7Bk8r8a+gEg1DLWSm94Zpfhojxx0tx8v14s5pSJrOGxvifs6g
         tH2+3qk7aoW6yLbnZmOkn1AYHLBWtYgQ83jfuGZKLIWlN5iMrbvmvxeAztxNuMuD9lRI
         QhVg==
X-Forwarded-Encrypted: i=1; AJvYcCUhmmYfYP0qAZJbtxmt2mFIjUuMGyAiL7zUAbofKT13RcVqlq/khi9IMf8plvV98on7GZ1UXptjV6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlEJB3ewLR+CMw8rLhrub8NkTB5Rr8wbZRGvUIClkwIE4azXpX
	oijGD+PAFXRhCmTkLPSoBCc2AIwF1twGGqzmyxGJMyIL8OdMXBDlFKa2yjajpaM=
X-Gm-Gg: ASbGncuQCUUuSYV9JA2BGFRXgX9M43tTP9wDEJlxsRUVKxjR/cLIT55gWf+wv7p/Fp4
	tvKl8MdibTuExtG3cDY0yPSv6gimMuydTxjaU9UATBL4cy/M3JVHufFxuKtFm6mi9Yv+V9E4cgo
	kGhjZxigW+ZiCOd7lKKRFJvnlGDSeFJV423lr2Wfd0XiLGROv7rGoNFFE4QWtBBXeZz3yhRU5eF
	54p8Zdbhcn1spivTJLbj6fCxGJzs3VaqkYWArPSZyZt/wsa9nLmHSSS3VOjMWa22LKgHvaFWqmk
	kVgD+k+QSqVYKwaUsSEqjR5l2bVlh+/7ca4mAf5ACna1zxkMRaQXvPvwT3qjvktArC8SoaeBYRn
	9zWafB8OBnzObMA==
X-Google-Smtp-Source: AGHT+IH+xgozTyBMkBlyP74TERrNWkyYdKcQs55orpOAP7tn2ARvtV/+JWl6ctnTGkBpb3mEArC3yQ==
X-Received: by 2002:a17:90b:4d:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-3030ff00e7bmr17510813a91.30.1742805664916;
        Mon, 24 Mar 2025 01:41:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f7e9bbasm7435204a91.39.2025.03.24.01.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:41:04 -0700 (PDT)
Message-ID: <0597da6f-cc28-497f-a49e-3f1c99a4e6e1@rivosinc.com>
Date: Mon, 24 Mar 2025 09:40:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] riscv: sbi: add new SBI error mappings
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-3-cleger@rivosinc.com>
 <20250322-cce038c88db88dd119a49846@orel>
 <779c137d-5030-4212-b957-3d2620448ea9@rivosinc.com>
 <20250324-5d1d09fc9e50d2276ba56b6f@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250324-5d1d09fc9e50d2276ba56b6f@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/03/2025 09:38, Andrew Jones wrote:
> On Mon, Mar 24, 2025 at 09:29:33AM +0100, Clément Léger wrote:
>>
>>
>> On 22/03/2025 13:06, Andrew Jones wrote:
>>> On Mon, Mar 17, 2025 at 06:06:08PM +0100, Clément Léger wrote:
>>>> A few new errors have been added with SBI V3.0, maps them as close as
>>>> possible to errno values.
>>>>
>>>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>>>> ---
>>>>  arch/riscv/include/asm/sbi.h | 9 +++++++++
>>>>  1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>>>> index bb077d0c912f..d11d22717b49 100644
>>>> --- a/arch/riscv/include/asm/sbi.h
>>>> +++ b/arch/riscv/include/asm/sbi.h
>>>> @@ -536,11 +536,20 @@ static inline int sbi_err_map_linux_errno(int err)
>>>>  	case SBI_SUCCESS:
>>>>  		return 0;
>>>>  	case SBI_ERR_DENIED:
>>>> +	case SBI_ERR_DENIED_LOCKED:
>>>>  		return -EPERM;
>>>>  	case SBI_ERR_INVALID_PARAM:
>>>> +	case SBI_ERR_INVALID_STATE:
>>>> +	case SBI_ERR_BAD_RANGE:
>>>>  		return -EINVAL;
>>>>  	case SBI_ERR_INVALID_ADDRESS:
>>>>  		return -EFAULT;
>>>> +	case SBI_ERR_NO_SHMEM:
>>>> +		return -ENOMEM;
>>>> +	case SBI_ERR_TIMEOUT:
>>>> +		return -ETIME;
>>>> +	case SBI_ERR_IO:
>>>> +		return -EIO;
>>>>  	case SBI_ERR_NOT_SUPPORTED:
>>>>  	case SBI_ERR_FAILURE:
>>>>  	default:
>>>> -- 
>>>> 2.47.2
>>>>
>>>
>>> I'm not a huge fan sbi_err_map_linux_errno() since the mappings seem a bit
>>> arbitrary, but if we're going to do it, then these look pretty good to me.
>>> Only other thought I had was E2BIG for bad-range, but nah...
> 
> Actually, I just recalled that there is an ERANGE, which would probably be
> a better match for bad-range than EINVAL, but I'm not sure it matters much
> anyway since this function doesn't promise 1-to-1 mappings.

Yes, but ERANGE description is actually "results are too large", but at
least it's name is more descriptive. Let's go with it.

> 
> Thanks,
> drew
> 
>>
>> Yeah I also think some mappings are a bit odd even though I skimmed
>> through the whole errno list to find the best possible mappings. I'd be
>> happy to find something better though.
>>
>> Thanks,
>>
>> Clément
>>
>>>
>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>>
>>> Thanks,
>>> drew
>>


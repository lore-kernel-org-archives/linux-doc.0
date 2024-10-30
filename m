Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6942E199E89
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730281749; cv=none; b=sZlVwY/9RegyqDHJp4vHG7rYDjPPRfwedwxpoNyPN17uyQgM1yF4DueLn6dWXTKQR4wD2bKQ3stBe3s1uN8FHxnuyg2RvV+qH+w74FASHMISpjUb+QYOstB3X+aEzBhc/l2ypn35baf1XM6UMuHSTf3716b/CSH38I1LM059hB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730281749; c=relaxed/simple;
	bh=8EXfK793ZLefNzwp6pzA38h547RH694mwEtv1gJlZdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDtLTZbpK/c8fUtgTcqSd+2MaWSGkTszpmqXOmpewm3Rk7tYSvBBXVmnvExw4E55iHN577uUZi8uN4ppJutZkp6dVwK5c6nH+1XOMXiGDeRMxjEeQZqexNoyRCF72Ru3rsPH+8V+8do23G7rV6h+k5F2HcVgjeEVVsIGbMVDXwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=uYkfxmvE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="uYkfxmvE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-208cf673b8dso61016525ad.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730281747; x=1730886547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSwaSXBIpjqVkyV12CEixJTdRNCxUGANMEGYJ3Ap4Vg=;
        b=uYkfxmvEite+cTjrEJjeKemaYNBz42YwMnGUkR7Xe1BIhB/ulPj80z9umIgEiBgZfi
         H8fpRYPtUf/8xr2EQEYmq29zJONbchcmcnetG9f3tkaF/LcaoLrgdKZOPYmy2Q6YNrXf
         pNT+vRkT51lXaI6g+eDp2/XYPUa8qvGYJ7AloYZd/newcaj6lAZyJGxd9UM7F1UfTYkS
         WN9zjFX7X07cOSA3wknrKFdmLzj+AL1don01++a0hyi9J315A2RlZ8E/SOt783Q20OCm
         x9RBQQcPsPeeriqx1mxFl7RCbm4rIfaWEobMhTQeTZMrFrc034H6PrjowRImT5/vrtMl
         tUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730281747; x=1730886547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSwaSXBIpjqVkyV12CEixJTdRNCxUGANMEGYJ3Ap4Vg=;
        b=v/XvTsiipMvgrNgHpDF+06WXPZdhZtnzV/M0aptkmTpMrXqNjXBW6dlxbVJxYXF+72
         yJSQeYGn7H+chqvuEyO9G6u9LArcFKxAOenEcSKHvbp0gsajJluayiywcWR/26mPp6aC
         FHgrxePk7sDOT9bbhSdr958F9y1u+x6GgCfPuwp4fY6l93GmHmsY9R5Ncdi9KJRwWSqg
         CnNDm7gGuUmp14/qFQRyIBrRVMknrVzAMt6/AajCjpIuK38iJonIhgPUqwpjBJI4ZspZ
         eMKAg6xCy4NCTOy5ZDKv3tGktmZgKEKfURj6ypLYXZFpko1XrYe2SGWabOQalTqKbwUb
         2oag==
X-Gm-Message-State: AOJu0YyiX6I0B6bDcW9CMONEDAaVIphjZZjW2O2YjeWMRJzpOpu/6Gmz
	m1NCy/hCvkTNJbLDEx6j7UD8L50UNcSIKKZcBAroeSB7quDLqHZ3gdLtX82EUp8=
X-Google-Smtp-Source: AGHT+IF5owZ613IN08gSTF1W4NumSlPE9N+GNRcutDlRWZGvuBkpKbCkuSRP83keNi1c5BU43LWC/Q==
X-Received: by 2002:a17:903:124d:b0:20c:5cb1:ddf0 with SMTP id d9443c01a7336-210c68a9c2bmr199322865ad.10.1730281746621;
        Wed, 30 Oct 2024 02:49:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc0864d7sm78342745ad.303.2024.10.30.02.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 02:49:06 -0700 (PDT)
Message-ID: <ca1cb4b8-e206-4bc3-adf3-3801fd05f8e8@rivosinc.com>
Date: Wed, 30 Oct 2024 10:48:47 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: hwprobe: export bfloat16 ISA extension
To: Inochi Amaoto <inochiama@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Andy Chiu <andybnac@gmail.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241028071746.869740-1-inochiama@gmail.com>
 <20241028071746.869740-4-inochiama@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241028071746.869740-4-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28/10/2024 08:17, Inochi Amaoto wrote:
> Export Zfbmin, Zvfbfmin, Zvfbfwma ISA extension through hwprobe.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 12 ++++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h |  3 +++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 85b709257918..8c30dd06f3c0 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -239,6 +239,18 @@ The following keys are defined:
>         ratified in commit 98918c844281 ("Merge pull request #1217 from
>         riscv/zawrs") of riscv-isa-manual.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZFBFMIN`: The Zfbfmin extension is supported as
> +       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
> +       ("Added Chapter title to BF16").
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFMIN`: The Zvfbfmin extension is supported as
> +       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
> +       ("Added Chapter title to BF16").
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFWMA`: The Zvfbfwma extension is supported as
> +       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
> +       ("Added Chapter title to BF16").
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
>       :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
>       mistakenly classified as a bitmask rather than a value.
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 1e153cda57db..95d00a065b4e 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -72,6 +72,9 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
> +#define		RISCV_HWPROBE_EXT_ZFBFMIN	(1ULL << 49)
> +#define		RISCV_HWPROBE_EXT_ZVFBFMIN	(1ULL << 50)
> +#define		RISCV_HWPROBE_EXT_ZVFBFWMA	(1ULL << 51)

Hi Inochi,

These should be added as well in sys_hwprobe.c (see hwprobe_isa_ext0()).

Thanks,

Clément

>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)


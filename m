Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2383168E3
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003335; cv=none; b=KTooLX78SvRMmzxA9xwm8nqctegBL5qCOQ5qcdauHtAGcB0fexXaulh+fQaKFEDKXDu2j0n63wZ4P9zqzDnmN3Kkt6URlckyQtu3dsZ0byLLaJtoPMOIxIDDztElV67vW56jl8n9JeYwfAqgfkhrtayIHVpIgCJ/NEOtBDrbcOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003335; c=relaxed/simple;
	bh=U0M/EmSJN19l9+/ebzMn3Zl/F3Tgh6cVySTFgrA/WJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYLvrAlJlo1aNT3VCyVyAfK5a2BALb/0EG+p28E4c+Gd6wvema71gnsNCq6t+fwSB7U/JNpgeVFoQIv2ykm4KoRXaOchkZJlNcJo0kdRRt3hQV3HIJBthyEGMBuhhFVWvo86hk44NYJMDBWFpKb1vqk0Q5eVIeEuFkQVaQNRz6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mwx11OBq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mwx11OBq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297d4ac44fbso28711135ad.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 08:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764003332; x=1764608132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PkTSzPqE//CxFZT2DpLFmyaJNBSmVJlFczuQFCha10=;
        b=Mwx11OBqY2Xmt8Wv0J4LV99fsyV9BO/I2wj2ECACnD4ozFfoepDVHMbuT3Di59MqBr
         G0RXjot0nuSzioBIssiTZSQSJ6BAcgX9h4BVfpC72McoJn1ItJAc8TcWBzoUW2FZ+QMQ
         aiLeMHvLsP8V/Azrqyb2clUw19dl5zMLe4bpRqEDu8hnRdYNEsSOIk8q+qgFGaI7UV9Y
         uc/JledGYEko9DFitQZEQ2aHawQVXhEOg9ktjRQhkBaMEnL653K5CNXRoFnLMChCR3LM
         Bjlt+lMvd2a9b7zWHU3bagVKvskDUEcdpDL8Lc8nRytDvklJ9J2Ju+YjFPm1MO1GGyTx
         SZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003332; x=1764608132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PkTSzPqE//CxFZT2DpLFmyaJNBSmVJlFczuQFCha10=;
        b=GDp1kTNlB80mnSzIfk3XH3kT1zulcd1ZX9zON6ZskRa63UyyyDiVXkgHkWNK09yDXQ
         rXJR+c+MZ/w92F7J4UV5R9Nb17t6OjhyAAVkAuZ6tl1Hf0TSOAOpOEjHrJX10P6sGyLh
         Apq6n9ot02Gbsdirm3PQyk7iewgc5Lf4GzfN9bK37QFsMXMK7EFOmc8QOmjv+NkBVxT9
         S3ZIfnE+wb2O6oJcMc2s1B7tALF67jj0+m+zxWfd9XpuM13/i/oZ96PJUM+eY7DuCyiQ
         RMJaV15Spmc1iWEOiJt+SNXs9bfDF4rFniA9VSop/vGkH6q2f6A7AvRDSNqOhHSK8ntV
         ZqEA==
X-Forwarded-Encrypted: i=1; AJvYcCXTrlkt3qYhi07yxt1axrBeivYS+1xW6ctyRoIvq4ntKQ6aJkuPrkxTN02dfmoX4GaPig6kz/vlwXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJH7kZq2nAfgNAsopK1ZPAW7PxS+yoP6dbLs5EfKXh9C4rSYgv
	11OOhNhm/smHmHwEBk6MxDfs/InHQ0kIduo+7ubVMLTDANhoiOAciPuC
X-Gm-Gg: ASbGncscW8od2nnYfX57/nEjyCRhqHgvRQh2xdeB4C27AYwWs/9H/bkVFbdVLXwG3oU
	vemzWjNlck/U36Tvr49z/STXtC7I1i879ZPGkDgL/O7iENuoPzR+1wsYOcjTTExoMDzEoQzaa+6
	zuUJphrpyY21S3QEXP8oTucOB1YpTtwt0TfVSda5Iqd7UX5LQwPIxYeAY1d1MpxLIsnB21hmH+V
	BnoXcb755gFcfwrXI7Xqe5oUVZUYeITnHl/BPfjZeP8fsffRQ0R+tq1E+d3GYm4bj91QAQvK9GN
	WV49zwNGvXNlbf9Z7U4iSZ2FZkeWJ4VpuOU9U1f5LAHkqWYC6bk0ejYpUHkvQXIRDkneccG7mIy
	S6RX5Np8/6cGTI+yrv+L0C/UorSHBXTRUM8aaaBQMQDyr0YsTku/XYF7+I/cYxsFIVNlxF0ce6F
	plvwLaHZvZPh45yROW3ahB2uDpzjltgCuaESY=
X-Google-Smtp-Source: AGHT+IE9A0t3u+DlBF5w0TChVNS8IAJiNWyhPSKPb8XU7WkuxpEILcbBsNrK17+S0nkmNY7Re9mHKg==
X-Received: by 2002:a17:90b:3841:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-347331bf3a7mr11163515a91.6.1764003331638;
        Mon, 24 Nov 2025 08:55:31 -0800 (PST)
Received: from [10.0.2.15] ([152.57.124.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727c4b663sm14053551a91.9.2025.11.24.08.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 08:55:30 -0800 (PST)
Message-ID: <4aef483f-df7f-420a-abba-b2fc27db0105@gmail.com>
Date: Mon, 24 Nov 2025 22:25:23 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: dmaengine: add explanation for phys field in
 dma_async_tx_descriptor structure
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20251113064937.8735-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <20251113064937.8735-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/25 12:19, Bhanu Seshu Kumar Valluri wrote:
> Describe the need to initialize the phys field in the dma_async_tx_descriptor
> structure during its initialization.
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Documentation/driver-api/dmaengine/provider.rst | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
> index 1594598b3..f4ed98f70 100644
> --- a/Documentation/driver-api/dmaengine/provider.rst
> +++ b/Documentation/driver-api/dmaengine/provider.rst
> @@ -411,7 +411,7 @@ supported.
>    - This structure can be initialized using the function
>      ``dma_async_tx_descriptor_init``.
>  
> -  - You'll also need to set two fields in this structure:
> +  - You'll also need to set following fields in this structure:
>  
>      - flags:
>        TODO: Can it be modified by the driver itself, or
> @@ -421,6 +421,9 @@ supported.
>        that is supposed to push the current transaction descriptor to a
>        pending queue, waiting for issue_pending to be called.
>  
> +    - phys: Physical address of the descriptor which is used later by
> +      the dma engine to read the descriptor and initiate transfer.
> +
>    - In this structure the function pointer callback_result can be
>      initialized in order for the submitter to be notified that a
>      transaction has completed. In the earlier code the function pointer

Hi,

I just wanted to check if you had a chance to review it or if any changes are needed from my side.

Regards,
Bhanu Seshu Kumar Valluri

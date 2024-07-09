Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC4E12FB37
	for <linux-doc@vger.kernel.org>; Tue,  9 Jul 2024 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514976; cv=none; b=dIOMXWqiKf/Q98AqWFDyoG/VuBnKH7WpyBTgp1MRY32MI++zTY7Bs7HLmDQP0ZNRr53lxDCb8eGyJ4aWrROHTZpelLE8GXxGu/ohx7xzmvDDy4/rdzCl0PGqkwLcqAEYfZR/PFSctZEcz1WYJIyIqT88f7g/kL5kvhwauXBvBbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514976; c=relaxed/simple;
	bh=Xi9Hc2ZM06NZV5MTdSkdFEk4jOGTqy4WkDBxSBpOuuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHk+x8CcuwQ+ZaPEk1mWi1aBvzR6nGEHdK7klVa5QfoxNCE7OgCuy0piXPl5zMiPiSgC0Putb7Jo5PGZl7LO96jyCdfEESTHP3eHp0T1/YO+IzNEKy/loOvA+SjxGq451KlDASrJ5uRtjwxThZMpFMFc++/wR8sh/6e3Qfepdw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ePh4RaZr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ePh4RaZr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-424ad289949so35256675e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2024 01:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720514972; x=1721119772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rK+GPVFZfJfDL1XCtaGpu7biKbYG6i3bP6BpmGcN1wY=;
        b=ePh4RaZr6nnzeJBYN28HOm6mQlntRbkSuNUtIyS1g28tWi5skReXb5NswykY+RkC44
         80WdJ0xCR+JyvjQH3LqV/nM54wpjwthkkoxlDepW/ZRMjfW5BeLlnRS29P1R/0Jx75/q
         zx2SaIrihf/AN5EoTlL2yQxIzr/L/rcI8XvUVW8Ka2StnUZHF5I6CbTNdvy7fz8bPm0S
         9PnQtuVk9XwF+2xl6dHntOqscbWEMgBqmD6+y+OfOucF/fBuam8qSZDEUhB8tqK70DXy
         OdCAF1CEEyOX6CEuqoDF18PDq/RBBKTDpjok5+mGczdfqMpSDgfEICkvfrP80Pi/R5P3
         zKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720514972; x=1721119772;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rK+GPVFZfJfDL1XCtaGpu7biKbYG6i3bP6BpmGcN1wY=;
        b=wefdCMmGUJ0FUo/fXgeWA9XdG5n5LgPOie29iE/deOUqxhQ+S9w8Nd8Hyu4eokuhx4
         ZsnTx16snCLqKqbxFgr0jC+I2Hxl5VwyDqHHYtb5zcAZjHKsoLD0vREBXEIZ+WOJHiFF
         smN0/A+l4hgZQqwcMTZ0xCEKX7QC23VfEM7dYudfdqVuF/sfbktJCqfDPlkJBCht9vaR
         Jzcicr8ufAGdJk2j87LEDPmY8imH0kEj5dhoI4qkJtWTp9BUcVIvL2bUG4w7uTIVk4oL
         Vc4ELkiHlrBMzcZPhsSklqsFMdRseFk8SB8ODkTZXIhVuMJVmmMGqPQW8q15o7ADJrBr
         IlRA==
X-Forwarded-Encrypted: i=1; AJvYcCWGcuwrtWzMf3+9SG4Qj43VEpMyi8/SnxYGxf9LPuFFPJt4B31NaI/ATEIQpDmdR/Dif3p7I4XHkDD+TgUezKZAuHVUYNb3Z7EG
X-Gm-Message-State: AOJu0YyMEqtqGLcLfUEjv2S7P256p4xO2tyr4f0fdv0gxA4fEnla4EY5
	4l6EkLTMyxWq6wbhLG0o/2sTu7kuGBj0mGOrmrRcMnctB4bOpwlhdSy6OXytQ/M=
X-Google-Smtp-Source: AGHT+IHZ7JsFeV2nR3nbcaQXDp3ha/ov+IGFOmMQthxprRK4ZQMIr9h8W5f6KLzyTlsRYSSC3k9D/A==
X-Received: by 2002:a05:600c:49a8:b0:426:5dd0:a1fb with SMTP id 5b1f17b1804b1-426705ce9a3mr9784335e9.7.1720514972383;
        Tue, 09 Jul 2024 01:49:32 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:757f:b03:3953:ffd3:86ef? ([2a10:bac0:b000:757f:b03:3953:ffd3:86ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f736304sm30415385e9.34.2024.07.09.01.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 01:49:32 -0700 (PDT)
Message-ID: <4bf68f34-8a68-458f-9db2-c05b1b6bb711@suse.com>
Date: Tue, 9 Jul 2024 11:49:29 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] math.h: Add macros for rounding to closest value
To: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sebastian.fricke@collabora.com,
 andriy.shevchenko@linux.intel.com, jani.nikula@intel.com,
 jirislaby@kernel.org, corbet@lwn.net, broonie@kernel.org,
 rdunlap@infradead.org, linux-doc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andi.shyti@linux.intel.com, nicolas@ndufresne.ca, davidgow@google.com,
 dlatypov@google.com
References: <20240708155943.2314427-1-devarsht@ti.com>
 <20240708155943.2314427-2-devarsht@ti.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <20240708155943.2314427-2-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8.07.24 г. 18:59 ч., Devarsh Thakkar wrote:
> Add below rounding related macros:
> 
> round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round up in case two nearest values are
> possible.
> 
> round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round down in case two nearest values are
> possible.
> 
> roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
> generally be used only when y is not multiple of 2 as otherwise
> round_closest* macros should be used which are much faster.
> 
> Examples:
>   * round_closest_up(17, 4) = 16
>   * round_closest_up(15, 4) = 16
>   * round_closest_up(14, 4) = 16
>   * round_closest_down(17, 4) = 16
>   * round_closest_down(15, 4) = 16
>   * round_closest_down(14, 4) = 12
>   * roundclosest(21, 5) = 20
>   * roundclosest(19, 5) = 20
>   * roundclosest(17, 5) = 15
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> NOTE: This patch is inspired from the Mentor Graphics IPU driver [1]
> which uses similar macro locally and which is updated in further patch
> in the series to use this generic macro instead along with other drivers
> having similar requirements.
> 
> Link: https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480 [1]
> ---
>   include/linux/math.h | 63 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/include/linux/math.h b/include/linux/math.h
> index dd4152711de7..79e3dfda77fc 100644
> --- a/include/linux/math.h
> +++ b/include/linux/math.h
> @@ -34,6 +34,52 @@
>    */
>   #define round_down(x, y) ((x) & ~__round_mask(x, y))
>   
> +/**
> + * round_closest_up - round closest to be multiple of specified value (which is
> + *                    power of 2) with preference to rounding up
> + * @x: the value to round
> + * @y: multiple to round closest to (must be a power of 2)
> + *
> + * Rounds @x to closest multiple of @y (which must be a power of 2).
> + * The value can be either rounded up or rounded down depending upon rounded
> + * value's closeness to the specified value. If there are two closest possible
> + * values, i.e. the difference between the specified value and it's rounded up
> + * and rounded down values is same then preference is given to rounded up
> + * value.
> + *
> + * To perform arbitrary rounding to closest value (not multiple of 2), use
> + * roundclosest().
> + *
> + * Examples:
> + * * round_closest_up(17, 4) = 16
> + * * round_closest_up(15, 4) = 16
> + * * round_closest_up(14, 4) = 16
> + */
> +#define round_closest_up(x, y) round_down((x) + (y) / 2, (y))
> +
> +/**
> + * round_closest_down - round closest to be multiple of specified value (which
> + *			is power of 2) with preference to rounding down
> + * @x: the value to round
> + * @y: multiple to round closest to (must be a power of 2)
> + *
> + * Rounds @x to closest multiple of @y (which must be a power of 2).
> + * The value can be either rounded up or rounded down depending upon rounded
> + * value's closeness to the specified value. If there are two closest possible
> + * values, i.e. the difference between the specified value and it's rounded up
> + * and rounded down values is same then preference is given to rounded up
> + * value.
> + *
> + * To perform arbitrary rounding to closest value (not multiple of 2), use
> + * roundclosest().
> + *
> + * Examples:
> + * * round_closest_down(17, 4) = 16
> + * * round_closest_down(15, 4) = 16
> + * * round_closest_down(14, 4) = 12
> + */
> +#define round_closest_down(x, y) round_up((x) - (y) / 2, (y))

This is already identical to the existing round_down, no ?

<snip>

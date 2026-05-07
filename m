Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6723B3C2784
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152794; cv=none; b=jLPDc7+HG9zEMXiaK3UW22UFW8xC8cntSPm4+R7V5AY2WDCUGup31FSlsW/4Ju7WHXa4WROEiKmZoTBMbGR+8mIeG0nZ17WraV/p1TL5hi4Y2L9TYvUnUROt1ktMxrTSQgcr7R5THBT6/kPVTSm0BkylNuzj0VZbLcRMeUCHaUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152794; c=relaxed/simple;
	bh=f6dSOOBOrr4Nuqx5fzA2PmCUxgT5hzIFcxKN8w7AU5k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtF3sNVR11zIIyiQ8bHT1ihvJ0OBSDwJNDEVWHyaF49ZhTKxSGgv0Ns8lA8m1OA/1la72ive2djo0UN80iQtEg70RbAVMi+ZaurAazAGl767CNleDEFIt7U9BC3DhDXtymjf6MEjeSXpj0fSu0Rk2R9zAbbxy2OVxpKpDqMyef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eowm4Ano; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eowm4Ano"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so7019045e9.2
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 04:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778152788; x=1778757588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/HfYKdw9t8t7YQxRwq0mAE+fhOLgPCxr7w0hEuXz/ZI=;
        b=eowm4AnotIEdHPnkk7YexySQiFQR8LPI2oLTSBM6QcF42h027bNccl2wDxyJlTshER
         MdNSN3K4YN+B0tmd3JfBqk5+7+GbLhyzq7y2kc7F76MwiWNAmxqrts0MrfoxhY7af9S5
         2vPnU4lNCISYv3eXO9q2djooJD5YQjICE2/uXRzWp5d4EhHTOXZxt9T8D67EO9PX1Gjt
         Q70MIZY4HunQVXmamluS+Sr88X1y5r5fGpIySZga/CYhMKUk8zY3zG2z4n9X0qgjm0Jz
         QIQyaPBPSV/lYyZYJHIwsM47Bw77gVTQhImLTHiwEg6VeUA1q6e7tdUmEOR6xAImg0cT
         uR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778152788; x=1778757588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HfYKdw9t8t7YQxRwq0mAE+fhOLgPCxr7w0hEuXz/ZI=;
        b=GFHGjtCxYtccDAmNvFXQfyIIzul8KBJ09VUlmjGQWDFjfLRVSs6YOUmh9ZFOPqDN26
         JECpRqxCZUqKlvFBeuVN4NvvdMi6Ru9yZhElnYDSyaT2nIcCltiOoObBzakF4TwUx32t
         J5oLIxPcLaX+wB649Ep0tHZjB8O/Gg+l90JH9TuyVsxprbM2g9eE30xyyOHHShaJkpCu
         utJ6IT1+aMaihuEphTxQ5gE1zFm0BZz4NKvr48wKFgXsz+190Nepkjw7QRBI93p4/fHd
         3kA8Ch0o2whWmJrqUOUlINV5v6ffKy8AmbJgivBDJCNbBM3frtClgj6xsbmHTF8Gq+Vo
         Qg0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/agc4MPIngw8MA98GpqJPXk1iuRHfuuA62FdeNw8PO/DozK3HnmlGkCPRp3z+aWHHA9dToWTkkDxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKvYHlhXxNsHorubLAJs1olNTOjBn7ppCVhDXkbXH5i4tZIxwB
	PxHoW9tPTDCWkX+jEzoDYCqrO4tDSsaWYRi2mB0hVe+fRLxkeUqDWmWm
X-Gm-Gg: AeBDieuJCrZVr0xCpdIPgjfnHjzTLS4UEI3/lm67wEaZwgKPpnlYBiZlaz+NAGUWWU8
	De9EcTsjz02k2ugADPefZFL+1+d1kfttfMtV1IJ9RnOo8SogA8MMg6jeSG5qVGYesTennFi+fuE
	+fwrspSg4rCTivVW8bzUwYkHUFMHb4PABnG+YSu5itoUkifdIF4i60vt7Zw5/y1iPxLdxFXnSc0
	NIkHM1ahZ4BS+c7KD+v/0e3VNdy5PtWTxmU2Vz82AKOcTahjB3lbtiPmMwqRSu/4753HDYlyUU3
	dCe9txj7uSywJTzLbhLKGXIr4B2EjtEefUlc5/39rvRvQjfgm+NRf/IH5XhxlgY1hQ1rtVaU0h/
	kI80KHuyphpdKYk3xvhu1rvoiOyzvQNYnz6vV2xI2CVDbX5VeUNCJbWDaxM0/9s5OVKth1jQqkI
	YBOaYBE1WFfHoKkfFNjMmSN4wshFi+vglkKR3zQI6JRXqRTK1qOx5SBw0pdv6BFsWh/L60eQpFQ
	6HcEPPl1WT0i4oXk9zfkl79kBZf9DnofHb9g1WScKcKq/LQ2w930puob0VJ
X-Received: by 2002:a05:600c:83c5:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-48e51f2a759mr110026335e9.9.1778152787811;
        Thu, 07 May 2026 04:19:47 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm209504235e9.0.2026.05.07.04.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:19:46 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Thu, 7 May 2026 12:19:40 +0100
To: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v11 09/11] iio: frequency: adf41513: features on
 frequency change
Message-ID: <j6gysb6cp4cjzvf3erwgmpmltnwsjif5pcr5uxmysqbhbj72ml@svc7ncvercju>
References: <20260506-adf41513-iio-driver-v11-0-2b7e99cfe8f2@analog.com>
 <20260506-adf41513-iio-driver-v11-9-2b7e99cfe8f2@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-adf41513-iio-driver-v11-9-2b7e99cfe8f2@analog.com>

On 26/05/06 03:08PM, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Set Bleed current when PFD frequency changes (bleed enabled when in
> fractional mode). Set lock detector window size, handling bias and
> precision. Add phase resync support, setting clock dividers when
> PFD frequency changes.

Sashiko's feedback:
https://sashiko.dev/#/patchset/20260506-adf41513-iio-driver-v11-0-2b7e99cfe8f2%40analog.com?part=9

...

> +static void adf41513_set_phase_resync(struct adf41513_state *st)
> +{
> +	u32 total_div, clk1_div, clk2_div;
> +
> +	if (!st->data.phase_resync_period_ns)
> +		return;
> +
> +	/* assuming both clock dividers hold similar values */
> +	total_div = mul_u64_u64_div_u64(st->settings.pfd_frequency_uhz,
> +					st->data.phase_resync_period_ns,
> +					1ULL * MICROHZ_PER_HZ * NSEC_PER_SEC);
> +	clk1_div = clamp(int_sqrt(total_div), 1,
> +			 ADF41513_MAX_CLK_DIVIDER);
> +	clk2_div = clamp(DIV_ROUND_CLOSEST(total_div, clk1_div), 1,
> +			 ADF41513_MAX_CLK_DIVIDER);
> +
> +	FIELD_MODIFY(ADF41513_REG5_CLK1_DIV_MSK, &st->regs[ADF41513_REG5],
> +		     clk1_div);
> +	FIELD_MODIFY(ADF41513_REG7_CLK2_DIV_MSK, &st->regs[ADF41513_REG7],
> +		     clk2_div);
> +
> +	/* enable phase resync */
> +	st->regs[ADF41513_REG7] |= ADF41513_REG7_CLK_DIV_MODE_MSK;

	Does this accidentally write a reserved hardware state by forcing all bits
	in the mask to 1? 
	If ADF41513_REG7_CLK_DIV_MODE_MSK is a multi-bit field, using the bitwise
	OR operator will set all bits in the field to 1 (e.g., 0b11). Typically,
	phase resync is 0b10, fast lock is 0b01, and 0b11 is reserved.
	Should this use FIELD_MODIFY() with a specific phase resync mode value
	instead of directly OR-ing the mask?

Indeed, it should be using FIELD_MODIFY() here:

	FIELD_MODIFY(ADF41513_REG7_CLK_DIV_MODE_MSK, &st->regs[ADF41513_REG7], 2);

-- 
Kind regards,

Rodrigo Alencar

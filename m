Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6456B1FDE24
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736349460; cv=none; b=cvddnJJQxKTZ0PJcv4ljKfP+8ZhM6KcALoPc7quuHw9xuRSpASd67MJki9tVmircZwYs9b39CIgt4zLNczp5nF5aiG6Izqqxn5L6FjqCvj4JTwxPiq/cwTknQwMOXQ92rgHKM/6dLYXUMFVDMeADUZ1pwJFc0JpwXUQf+qs4EBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736349460; c=relaxed/simple;
	bh=Ebeg1TL2BeajKrP6fpDxuqrt/iS+ncCHefaCK9FF0No=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DzUqthAmXzz1NuB5aCmpn64+VdbzI4aeI1FObDQd3Ku2oXj98JWW2Bc66iErpBiavdVhNjRGOAW6x++CbcCvM+DddVv6e6qi/zcKetNzz2Cx5t+tG2/K7af3V/mAPZl7Wg2BfsfodZermNyiDivUvAI8FUyhxVVHl1yRSc9Gwd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=R8ZJzvlq; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R8ZJzvlq"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eb87127854so5301010b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 07:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736349456; x=1736954256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alG1j42X6iRKjZ4baHXWov29C3FPDTojvMLiPpX80+0=;
        b=R8ZJzvlqXsnKt3Ka9F5l9TeFqxa+10QsBWZ93oc5V5ApkSMO8KL7/HCdT4kx98iTE7
         OujbcRWIdadEleoxFDLPftBEVIw5wXK9uUKoysXyCnJ7ty6GEMFaqtwmvtXRAupk5+Of
         BKYCKsMFLsTzqdr4KfEkt+CXM2Kn+vrsemmLGkPSLM+SextJtdalYLzbKOCH2quTbK/M
         mejLNysoh7rnl/orlBP3llT4JYXHAjmxfUMN+NPl9xXDyFxCyv4HppiqHoRBM5Cl/JMf
         oUmrjJPtQdb66mHoy18cGWAm21P5BJefXXbMLIuli/baqgrVxYE9JKqlJURkGpFUCAd2
         05Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349456; x=1736954256;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alG1j42X6iRKjZ4baHXWov29C3FPDTojvMLiPpX80+0=;
        b=glYJ/9Ipw9egwLMtChtojaIxjttM6RknQELdq/zZQY5sD8Rz0/+/zQ6G2c2iWBHrF5
         IK8nF+bEE0btqDuOulIxPEGwJ7wh0+kK9oetfsUMxDBRvNeWrBiWp2CGjljZTyFHtsfi
         2XPtaisGJaTzhr5QBLoXNl+mPEjsHULvbwmkI4MzfOHfZO9WRMB3aMWHNaSuAIglK4Rk
         iMLlWNWzTj5aChM26z2XJ/YCZef9atSTiVkbOJZf9Xx/gyFMBgWFyO5WDW3G8ICQrQT9
         zTfBuv19zBU7Y3/C4HnUd8E6YU4rJUVOh6rCxa50+uKfBkwqUMmMsUMFDN+o5HKlKpJu
         CWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnZuCbq6jWGsnSRcTi6QE2K0LFfmPd5misQ6X/da1dEviZKxnuL2uxuxlQgiIWkryTgDIisdBcoDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRzWwBTnaEj7cYHUWmq1NhiByHOFFbDdHXgyxREnlgdC5D3uT0
	mjVVHEy8voemwTsTti91KQEli2Zf2mvhqlaElaxSj9iC028va93zkS/8yxRyv1dwKJcHhh8HiHI
	J
X-Gm-Gg: ASbGncu1htwKNaS1yQudT3ETFcWS+GQegQCy85pZWcICHxdZb1xusfTbOn06Wgfc1No
	s3IpBkw74pm3uskeCOUYOxehSnYkeRXF8QR+ExXTmJHNMTu5GONLPGPIEMdfxNnwDSCQsrPNvY6
	0x26wZ9UFrktB8fs/ldhp2+dFyvrDgUcu0o2vWfRCuJKTQMYA+yUstYmJqV2NegBeyOGJq1sIg8
	mPfjyFBM5oIPHAgu3qbdyfCdZG2fNuqaa8lmbx/QmqNzVk0DZ3v2IKBmTclm7w74eYqnG4iH0Y3
	67uwLjGf/Pq9mGk/Vw==
X-Google-Smtp-Source: AGHT+IGwVgCGjQbO/qqRqSgc1J+RRMGG/noUnXoE/RftuE6fGYBcA6ytF5/pzERHkiy1D6obDhsWMg==
X-Received: by 2002:a05:6808:1825:b0:3e6:1057:21af with SMTP id 5614622812f47-3ef2eeb424amr1616812b6e.41.1736349456457;
        Wed, 08 Jan 2025 07:17:36 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ece2549542sm11552313b6e.32.2025.01.08.07.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 07:17:34 -0800 (PST)
Message-ID: <f53c6f9d-f17c-45fb-b8dd-b4eb8ef7a15a@baylibre.com>
Date: Wed, 8 Jan 2025 09:17:32 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] iio: adc: ad7380: add alert support
To: Julien Stephan <jstephan@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250108-ad7380-add-alert-support-v4-0-1751802471ba@baylibre.com>
 <20250108-ad7380-add-alert-support-v4-4-1751802471ba@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250108-ad7380-add-alert-support-v4-4-1751802471ba@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/8/25 6:49 AM, Julien Stephan wrote:
> The alert functionality is an out of range indicator and can be used as
> an early indicator of an out of bounds conversion result.
> 

...

> +static int ad7380_get_alert_th(struct ad7380_state *st,
> +			       enum iio_event_direction dir,
> +			       int *val)
> +{
> +	int ret, tmp;
> +
> +	switch (dir) {
> +	case IIO_EV_DIR_RISING:
> +		ret = regmap_read(st->regmap,
> +				  AD7380_REG_ADDR_ALERT_HIGH_TH,
> +				  &tmp);
> +		if (ret)
> +			return ret;
> +
> +		*val = FIELD_GET(AD7380_ALERT_HIGH_TH, tmp);
> +		ret = IIO_VAL_INT;
> +		break;
> +	case IIO_EV_DIR_FALLING:
> +		ret = regmap_read(st->regmap,
> +				  AD7380_REG_ADDR_ALERT_LOW_TH,
> +				  &tmp);
> +		if (ret)
> +			return ret;
> +
> +		*val = FIELD_GET(AD7380_ALERT_LOW_TH, tmp);
> +		ret = IIO_VAL_INT;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;

We can just return directly in each case instead of using break (preferred
style in IIO).

> +}
> +

Reviewed-by: David Lechner <dlechner@baylibre.com>


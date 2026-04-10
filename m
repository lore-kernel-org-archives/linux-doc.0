Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624403A640B
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 20:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775854004; cv=none; b=HWLfO6KzN5lGtwswRnN/Eltx8RVa4gE16wvzXs9/VxHlW0XRWO/eteN6TYuAiUt3ZkKHQY8BRNB8kRFn9UgRx0hzzSnLQHfkgqTb2xazAniLUzjXF6LrtvcYOgRhq0FGx1DnmFyI6CgiLeBLp5zleAzNzBrSqdYUB4ywi9KyNyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775854004; c=relaxed/simple;
	bh=HgJlDciSQOJkjPYMFiEeV5PqKaSjuxwAnLaENFbkQ2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQsy6MjiFdIbboQbe5l72LviKI3VzHv0PyX1CGktEnJGRxG/FPBDKAQfDZA+aaj69cZPPkdsIQdNIaWiMTEjtWslgqq0r00qlcPyoZBL+Rq7e7OUZqtS+Oa9ReLa0GqeRuC9PGsEWEtxh9wArY5fsTVdH9+FW4ST2R++HsLB/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=SSXXPTeU; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="SSXXPTeU"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dbb6c072f1so2330829a34.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 13:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775854000; x=1776458800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBpd+T8YvVMEln4nst2HllR/pz5g067Ap3lkXU/baHU=;
        b=SSXXPTeUQiGcPrLOlslscjIjBqIb/CoeAjzlc8XFGUpaWLHeXIAqj7EjK0KzK+04eh
         NRF9vZxeO79fiozCFkpmFQ+dmv+EQimJ+YWUoHnCiHHhYKssCUFdLccV0F1wCbeWPqdr
         B0+/oYek4duFyafbrOY7PyJocwpKCr2nHXtntjZhoFYH61fhQnAp6RMfPUaL+dMYMwxu
         sDO+hYxUINlRDbGmovVFcKtLPzydclkrIAhw9hZWieKnkzy+fVbO+OsfM+RMVwQS4izp
         tWdITiArNxuW9QChVdfkLpVHiIPAv8InLrhyDYCijkcNf1+Bmkf1nEFl5BUqfYOaG8WU
         HcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775854000; x=1776458800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBpd+T8YvVMEln4nst2HllR/pz5g067Ap3lkXU/baHU=;
        b=BnC64nn+aOd/vJB426WWtQLxlLIsz7NrvAhv51YCCdbtDlwxA0UTiSLO4mq7crn8Nh
         4eeeIZqikZZktPRvh6M4zPajRYUDWwWNMP2RXSTgeK9IEQ9cDOeGWOfv+sCge8qVKtwX
         wX8C8zwpuTeKrg+xiphUpp8rY15t0UY7glgSsjmMgPz0hC3B06v0a8GDCIynTVy71gTI
         Q39OrjVDHNPlC8dbtF6TngPiITqMZXIwavUwwAPdQyy0C9+yEWkXjz5VdJ4p4hwbm0Xn
         D0q02K2EFIDprx7K6EFINX+MFai8BpQ6B6j2pN5hRSmdjnTX8KN24Xt1cFGEt9TVnNck
         CzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMuX3S617Z6v0/lKOijkVSxGI3UFxtHJUEy1aaQkezs8KidJ0iHZuHTtmvCa/1sagf8nsTbErNiBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2tDTUEvMv4qpHLPPu0cBQGCLEmsKU72x8plorMfv04OiZ7G9y
	OxR4MEB8fRhou60NUhStIWZ0BzHGDW4m/zDDFq2hMRnHS1k64hLiUhJIi6cnptWP+ivHV8fRC75
	pAzoy
X-Gm-Gg: AeBDieuw1F5neLQqcsUVrX8DK5RwY/dI0KKnCgaPpPLFuF8WRZXFfuD/DKeFFIhbYLC
	VRkFiDetvLo2ksuW9l7lFeFq9y+9ZPNdhTeV+JVpzgR90puNYKd8F80WM3mLCI5TZl4R4fzQfnJ
	M0OSOTVM6EtfVsgsA9N4+17k2PxAQmTX9gTKu8mJ5nSDWwxJqaW1ASDneWIix6nP6lTAzgD5VuH
	VCRxwJLE/juC0YwZnrAVOy2GSY7mIZCGuL0VovKHJ/oQ0zCc/qPXq7zVWw/8tRqYuCR5qEuMqGu
	x05tzKdThm/yAwYtI5AEZUC2lpABCqQf02AGY6xkgQ/EGEFQhmiijheFfBuv3BrVyfJf44fybPf
	qZQkXIEdPyRoDR9kgs84yJ8aoqtZpHrPIa8E82raJMBP4yw2wEzMmwZDSwAA1IdqT5jPacd2/Xc
	4qX7pFi8Hj0Lmvl4O2fxtUPlIfOlC4hFOzsDsrD8lfIfsqkq4Xkak8A37LvTX+IEO9S3x+FkJin
	9H6PwYgPG5V
X-Received: by 2002:a05:6830:6684:b0:7d7:faa4:6c2b with SMTP id 46e09a7af769-7dc27cc0028mr3047317a34.9.1775854000316;
        Fri, 10 Apr 2026 13:46:40 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b75d:2440:dc10:808b? ([2600:8803:e7e4:500:b75d:2440:dc10:808b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc269402b9sm2527358a34.20.2026.04.10.13.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 13:46:38 -0700 (PDT)
Message-ID: <0f05add7-96c0-4eee-b396-d6e1be904c09@baylibre.com>
Date: Fri, 10 Apr 2026 15:46:36 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] iio: adc: ad4691: add triggered buffer support
To: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260409-ad4692-multichannel-sar-adc-driver-v7-0-be375d4df2c5@analog.com>
 <20260409-ad4692-multichannel-sar-adc-driver-v7-3-be375d4df2c5@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260409-ad4692-multichannel-sar-adc-driver-v7-3-be375d4df2c5@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/26 10:28 AM, Radu Sabau via B4 Relay wrote:
> From: Radu Sabau <radu.sabau@analog.com>
> 
> Add buffered capture support using the IIO triggered buffer framework.
> 

...

> @@ -201,8 +245,45 @@ struct ad4691_state {
>  	 * atomicity of consecutive SPI operations.
>  	 */
>  	struct mutex lock;
> +	/*
> +	 * Per-buffer-enable lifetime resources:
> +	 * Manual Mode - a pre-built SPI message that clocks out N+1
> +	 *		 transfers in one go.
> +	 * CNV Burst Mode - a pre-built SPI message that clocks out 2*N
> +	 *		    transfers in one go.
> +	 */
> +	struct spi_message scan_msg;
> +	/* max 16 + 1 NOOP (manual) or 2*16 + 2 (CNV burst). */
> +	struct spi_transfer scan_xfers[34];
> +	/*
> +	 * CNV burst: 16 AVG_IN addresses + state-reset address + state-reset
> +	 * value = 18.  Manual: 16 channel cmds + 1 NOOP = 17.
> +	 */
> +	__be16 scan_tx[18];

Needs __aligned(IIO_DMA_MINALIGN) since it is used with SPI.

> +	/* Scan buffer: one BE16 slot per channel (rx'd directly), plus timestamp */
> +	struct {
> +		__be16 vals[16];
> +		aligned_s64 ts;
> +	} scan;

Unless it is required that all channels are always enabled:

	IIO_DECLARE_BUFFER_WITH_TS(__be16, scan_rx, 16);

In any case, needs to be DMA-safe for SPI.

>  };
>  



> +static int ad4691_cnv_burst_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st = iio_priv(indio_dev);
> +	unsigned int n_active;
> +	unsigned int k, i;
> +	int ret;
> +
> +	n_active = bitmap_weight(indio_dev->active_scan_mask, iio_get_masklength(indio_dev));
> +
> +	memset(st->scan_xfers, 0, (2 * n_active + 2) * sizeof(st->scan_xfers[0]));
> +	memset(st->scan_tx, 0, (n_active + 2) * sizeof(st->scan_tx[0]));

Maybe simpler to just clear the whole thing? (same with other preenable)

> +
> +	spi_message_init(&st->scan_msg);
> +

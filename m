Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39986321
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736270833; cv=none; b=WpbOYp0JlK0b+XXln8V08QiTAoJUpA1ZNDJZRw8oKf9gZ10t03jifZjke+MVCk9t9FS5P3m81R52axJ8r646otIWCS0tRC/WMOnhr8ksarlQTyt13f4KGlSz4lu8jQBdOz9GoOiWOwiIPRlupV95760o3gXZJGec6hQT2PGC9UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736270833; c=relaxed/simple;
	bh=+fvAik1I+MGN5D/Q2FTjSj05/u6LolkM5K1Mcradc6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZ2KhdmEwxaNJkACddABLxEcmGl8aLIoXAtmqwOuMEu9DqWFObLeuFCWDSc4pvndGyDGCaCMOb3fro+/ram4k49AmIPmlcdfT+1R5ou2Loi3ZFuUYiE2i9rO6x/c4UgeXYFww72Og3j1Psw6Zy+Uc9QqvjmJq4ebD7tnmr1pW0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VGFy9p7x; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VGFy9p7x"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f2ed0b70d6so5772785eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 09:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736270828; x=1736875628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGBqj83bcQxpAeuWQB2C5gBaxbCGtrvgcizwoPdqI9k=;
        b=VGFy9p7xMhxtEQ8Dq98h40jM0TDC0SRDX/XRW2PZWNHRfDvFhQ1ktRhUhshmJch4yB
         P+jcZDC52FtiTg20anwMnFrH/ygq0kDreXg/kYc+nGgMhleK02m3UJ4cfKH0PmWLQIgS
         D1YJ0UPzQBaUVcVLNcehIpf+y02lzDCSpLvf4NiHdBJ7ytoVakvLc2fWwg+FTDRlAosl
         N2YtNMeebBj3DOVuS1PeqFVF/gUhRXDQ1kWfe3n6RYn791+TJEY8uefqxgodVEeiYeET
         7OUIn4DBVuZ8hHPiyN6YTg7azHN8McDwsKplr/XjDKPgNwXFBgspi7KBNdwqmiWw9d9J
         iO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736270828; x=1736875628;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGBqj83bcQxpAeuWQB2C5gBaxbCGtrvgcizwoPdqI9k=;
        b=peq3lRVngKER4tIRs661TsES7A1sWLEMv7BX0XBFfeYmegyh9evr/ZgmmiWThfvdmg
         a4Efx6SPfEBlJxh9W2+fOQLnydGxtccOmxX81d4wpecBaLEev9GlpRJhTNpLyVVNep8l
         L8HhZvbGND/Aoh9QahYboC528mgOs1CahDTJ1BWS3BLmSMf9W6Vl7LEQpVLyQyJXWxLV
         DYXC3xPxSrH6erkYxdlHM+PCoFnxyxmR7GZ4ZEoMtW03s3+DkRPOZlyQBOqKJ6/li8cB
         nDjLChCk+A90lOHLiOagex6wF+Ku1/wlEzo0STi8cTCTWPQnHKpibURLtVILfiR+4ZD9
         UP0w==
X-Forwarded-Encrypted: i=1; AJvYcCU7FHLclt3i5JWdCv5s0sBntkNA+9DXmyvB0ZqYeYDxfnm1ARreEWahLn433Ens+sZoIhwAdDSelLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfcVoQxu6kL8TKlofeOTh7FwIZthrFjG+8NwhF7Y6xOwMzYxX+
	9hEcaA1cBWq7MZP8Gvbl1Hnv6HxVEXouIi9jDlDO8zrUvWE9DUFEofvNs69NMmY=
X-Gm-Gg: ASbGnctVIwRw8RLkoxTrwtGvRgxD+7mPtVOwXbp5S/0bBuZb+xH2A6/zP34d7vuIAk5
	PwLFMnwjQXlOlTEYcjdypDl+IdBzEo5yb+0i1DHcK4sZBkYF+VR8unyZAitA8DHFYa/K2fOexh0
	mfXlPLNQfOsvatGLVXtkgjcTx1T9z9t8/J4lQFpORmkal/+x0wOTxqIqZ1BsTw6GelgbbQe0tNn
	v3k0Mv3Vylixjlvq7/xkP2SAl2wd4GZvjDP1njWQp8l3rWjT/AoN/307Fs1HaVT5gHReydjGqrR
	DdMM7NDkkW3FDYijlA==
X-Google-Smtp-Source: AGHT+IEmtcGuqBAPEyGmbLflk/gFa+y8iMjBH4xII2Aiewvz34WrhRDM3PEFz7ebN0cORf5AAr/rlA==
X-Received: by 2002:a05:6871:2b0c:b0:296:e491:b244 with SMTP id 586e51a60fabf-2a7fb30bdfbmr29350814fac.32.1736270828677;
        Tue, 07 Jan 2025 09:27:08 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a7d77b4666sm12587167fac.43.2025.01.07.09.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:27:07 -0800 (PST)
Message-ID: <77b975ca-4485-4381-b95f-c8ac82e40aa5@baylibre.com>
Date: Tue, 7 Jan 2025 11:27:05 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] docs: iio: ad7380: add alert support
To: Julien Stephan <jstephan@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250107-ad7380-add-alert-support-v3-0-bce10afd656b@baylibre.com>
 <20250107-ad7380-add-alert-support-v3-5-bce10afd656b@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250107-ad7380-add-alert-support-v3-5-bce10afd656b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/7/25 2:48 AM, Julien Stephan wrote:
> Add a section for alert support, explaining how user can use iio events
> attributes to enable alert and set thresholds.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  Documentation/iio/ad7380.rst | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/iio/ad7380.rst b/Documentation/iio/ad7380.rst
> index c46127700e14ca9ec3cac0bd5776b6702f2659e2..9b4407eeaf1d4309c06c64071ed08b4ac80944d2 100644
> --- a/Documentation/iio/ad7380.rst
> +++ b/Documentation/iio/ad7380.rst
> @@ -92,6 +92,37 @@ must restart iiod using the following command:
>  
>  	root:~# systemctl restart iiod
>  
> +Alert
> +-----
> +
> +When configured in 1 SDO line mode (see `SPI wiring modes`_), the SDOB or the
> +SDOD line (respectively for the 2 or 4 channels variants) can act as an alert
> +pin.

I think 4-channel variant could also be used in 2-wire mode while also using
ALERT. Of course, that isn't supported in the driver yet though.

> +
> +At the end of a conversion the low-active alert pin gets asserted if the

nit: active-low

> +conversion result exceeds the alert high limit or falls below the alert low
> +limit. It is cleared, on a falling edge of CS. The alert pin is common to all
> +channels.
> +
> +User can enable alert using the regular iio events attribute:
> +
> +.. code-block:: bash
> +
> +	events/thresh_either_en
> +
> +The high and low thresholds are common to all channels and can also be set using
> +regular iio events attributes:
> +
> +.. code-block:: bash
> +
> +	events/in_thresh_falling_value
> +	events/in_thresh_rising_value
> +
> +If debugfs is enabled anc configured, user can read the ALERT register to

s/anc/and/

or

s/enabled and configured/available/


> +determine the faulty channel and direction.
> +
> +In most use cases, user will hardwire the alert pin to trigger a shutdown.
> +
>  Channel selection and sequencer (single-end chips only)
>  -------------------------------------------------------
>  
> @@ -144,7 +175,6 @@ Unimplemented features
>  - Rolling average oversampling
>  - Power down mode
>  - CRC indication
> -- Alert
>  
>  
>  Device buffers
> 

With the typo fixed:

Reviewed-by: David Lechner <dlechner@baylibre.com>


Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7333537A831
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328170; cv=none; b=Mvb3YekaNBUUgc/cT5GVlnnC5FxnYQZzzcg42Y0viINKVpJv41lwtWeZo9ft+6S5VP/TiL+vlZv21FfRPVmJThpsTcDpjTin0/yqYPqfKzIqDYevfiEeJv6YCY2ZYIRztOTpKkF24lzT6fv2bQ6biFG3Acfr6kDtmwS1HUh4ITg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328170; c=relaxed/simple;
	bh=mn6UejKbYkUvw4/VNNYmDeinXZGEQSxfE1rz+AV/JjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fmb7FFheJiDIbXRg3DGOPD/pUVHDKhkby0Yj85FA+0sZzmTEC5m/D8xMeVxyUVJ7ZP3BBR4W3l6aqolziLNnEdX1MopJVFfbAfwUd8yW1bHXuIjiN4OA4e8PRG1e5qJQTQ4af9+yJ5HjsJPIQf+GPG4LbpHF/ZcYupfSI1esrjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZYdrOuT8; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZYdrOuT8"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-836cde02992so14594487b3.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787328163; x=1787932963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0dZzEevn51g9AXgQqOI5uA/Xxatf9zurz5TF1P+mh5g=;
        b=ZYdrOuT8GevK0VXF6r/bBB5UiVTYLPPVVa8c35OlkJ6oD6EoGoHbZyUlCnBf2VGSxw
         b6ooGzJpHL1hAiYG3+O4yZ7c7A4FAWaH195OBdjdht495BHBGl4xZ3S2k0SHmjFSq8Ti
         8inzf8NEnuE+2DBB9v3+q15v4KCR8Yh/vWk98dFQPRHMh327wohj/wLzay6vam//KSXm
         l6YzgHa5EhbiyENJuar6k60N9rEWmPoHLetDBXFpTnGZgkU+dBq4VUx/unysFWpNxrWA
         U63CUuH0coJhQDg2ZfDWK8kQsio9Wk3gtt2uVm363jgD8CCwuNuEfPyKhmoLW05WNyuV
         u2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328163; x=1787932963;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dZzEevn51g9AXgQqOI5uA/Xxatf9zurz5TF1P+mh5g=;
        b=rgTbAsUyI4ctiY05GRnIjSCVWekcIRM3vLH1UNKrUa0H+qAOqgzSilU7cSGmHCT0Qp
         1obqNwZFi/rGjU606FZgbO6GAqlmRUNA2gAJkvn09lYgI7xqGhqmw9Hh+b8gkA6pGQuH
         TO+WqG+m0ggk2f+yI0Ho1lEmtLWo6VWfRCvrw81GVaa7uwLGOElOlPnOKo/cb48CR6fW
         fDIYDuiy96HDpjSbhlzKfZ01L8Fb2BsBWp2rsd6exz0XWkqwO4x8EvTCDYpmEv0bO8HY
         0PFlK0il9jJwn9Rh3zcz4xtzsZFegD/W9L/xfxzkHnkRpcWHji1HAC5UkTk5IT8Qfv7Q
         tYRg==
X-Forwarded-Encrypted: i=1; AHgh+RpHGo4tQlSCDRnB5ZR3PYppA/mglhd1dTTql5kefzB8I7qRg4wbtlB5x2+vW4WHhYfP/4MW6RexEWY=@vger.kernel.org
X-Gm-Message-State: AFuF++kgwzXthXrENeME3NexbhH4N2+jHlt95YrIkRPgSUScUnVChZOK
	Lj1IRKHTI79CDU2dWVBsoRInynTyz9wLdhjZPCkK+kGlYN+0EKklcjisNPcw6lF60IU=
X-Gm-Gg: AR+sD12mxwsbHRxVTsKfJnUde+CC930lre1dT/IyWEY0a4YAbxAbWCFhBG/lsJBKWdg
	iMEa0hvzinLcuIYnOAhF3YBL9plZ0SilcOsdCFZeUxmHcKyFl8lraHppUOGeR3Au9OQlXbmqNWM
	lORJl4KbMdI/ECzPAKp0a+o0x5gTSYeD/YWtCgtaryt87AhmMcBbYgpSgXudGStexlk2TS/LDel
	XY22LxDH1QDHCbXqqd8+hygmC4sTnsxLoPPLdfZAxuOQ1MI1pDTqxNFaeK4Go7QydUh0bO05aSy
	b1L2RGebSuRQjV6+7msAzUk1M3sUjkF/TRajauNonMno/Ot0Wgc0vlaUmHFIUSbClCrGdDAEMFE
	ATgRuHv3/rVOaa0b6iPnGVk3Rzmv5y4DWdIeh9QhtHJrBMPevRk/Rmk7mHlp/OryNPNOPvVzKai
	2+JOzOq7rQM05Pzj8TPXcNB43CK5nMX6/Jw6IHuSXwnfPs+rO/44Ne4yd0X3/B5V+XTwvsGPpGH
	Pp1VX4HTZ0Yz6HhgJpfFcs2VQ7FOUvVRW1Dw3bchg==
X-Received: by 2002:a05:690c:660a:b0:80f:ddab:1cca with SMTP id 00721157ae682-849f8e84e37mr26940247b3.35.1787328163060;
        Fri, 21 Aug 2026 09:02:43 -0700 (PDT)
Received: from [192.168.1.169] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84511abb2bbsm42930907b3.5.2026.08.21.09.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:02:42 -0700 (PDT)
Message-ID: <65b42c5e-1ce3-474d-a14c-961deb337311@baylibre.com>
Date: Fri, 21 Aug 2026 11:02:41 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/14] iio: backend: Add support for CRC
To: Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, jananisunil.dev@gmail.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20260821-ad7768-driver-v4-0-bb8fbd06d4eb@analog.com>
 <20260821-ad7768-driver-v4-3-bb8fbd06d4eb@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20260821-ad7768-driver-v4-3-bb8fbd06d4eb@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/21/26 9:06 AM, Janani Sunil wrote:
> Add a backend operation to enable or disable direction-specific CRC
> handling. On input data paths, the backend handles CRC data generated by
> the frontend. On output data paths, the backend generates CRC data for
> the frontend to verify.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  drivers/iio/industrialio-backend.c | 33 +++++++++++++++++++++++++++++++++
>  include/linux/iio/backend.h        |  6 ++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
> index f7a4be8ec320..fbf5c39d7655 100644
> --- a/drivers/iio/industrialio-backend.c
> +++ b/drivers/iio/industrialio-backend.c
> @@ -886,6 +886,39 @@ int iio_backend_num_lanes_set(struct iio_backend *back, unsigned int num_lanes)
>  }
>  EXPORT_SYMBOL_NS_GPL(iio_backend_num_lanes_set, "IIO_BACKEND");
>  
> +/**
> + * iio_backend_crc_enable - Enable CRC handling
> + * @back: Backend device
> + *
> + * On input data paths, enable backend handling of CRC data generated by the
> + * frontend. On output data paths, enable the backend to generate CRC data for
> + * the frontend to verify.
> + *
> + * RETURNS:
> + * 0 on success, negative error number on failure.
> + */
> +int iio_backend_crc_enable(struct iio_backend *back)
> +{
> +	return iio_backend_op_call(back, crc_enable);
> +}
> +EXPORT_SYMBOL_NS_GPL(iio_backend_crc_enable, "IIO_BACKEND");
> +
> +/**
> + * iio_backend_crc_disable - Disable CRC handling
> + * @back: Backend device
> + *
> + * On input data paths, disable backend handling of CRC data generated by the
> + * frontend. On output data paths, disable CRC generation by the backend.
> + *
> + * RETURNS:
> + * 0 on success, negative error number on failure.
> + */
> +int iio_backend_crc_disable(struct iio_backend *back)
> +{
> +	return iio_backend_op_call(back, crc_disable);
> +}
> +EXPORT_SYMBOL_NS_GPL(iio_backend_crc_disable, "IIO_BACKEND");
> +
The descriptions are a bit unclear on how the data is actually sent, so not
really sure all of the explanation is worth it vs. just saying enables/disables
CRC.

Good enough for me though:

Reviewed-by: David Lechner <dlechner@baylibre.com>


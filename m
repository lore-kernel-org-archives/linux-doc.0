Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752045;
	b=gYQic7A8rlIZfpZhEu+4JwvvPfv3AELj7f4A0x48ItKHb+yY1YkUg89qyidWZU0DDZAd
	 gw6fN+WrLwE9QbooOUQu8ZPkUDWaaYM598eJToXWlMsnxBadaDxvxXONIVt6S3F+kLrZz
	 PYjB/aZwV+IDSeaXN8pHhPyiZ3H76MQKWUkqupJKtEdUWzPTfoAPGp2p0WRt7c/zvNEbB
	 QSj5CaJxvcgRqr9UA0drTH3Z//V5GjPQlLWvd0mI3S5fT0McRpEvufrJ01UT2je/s8+Ra
	 iyB42YTR3y7Ueaw/KWPKfhOaKbmOE0faCK2qDJeqD3rdjXcObhXTQjeOju/zqv0EgUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PU3pthY8C33I9auXpGTnmiUI6trGGQ/gwWp/L1g0V2U=;
	b=rMytliJshu7A9BNkaa4UeN2tMO14WYX2AUAlhJaBjNffbsGYy7YKdKaKug26bQ9p2BJg
	 /i1nT2RiaEUtRgvUcjYLY7BE31oBCQfSBbbIYDDg65na7sZZZopG41/Rl4LOxRbGZXnLP
	 y/4fHGlbv7KIcEk93nzAwkNZYzxDBChao6YZhew0bkGdVNEgN+owugA9+pz0SXzDU+4zT
	 aM6NqFWT55HWTZdWavpLj0g1DA7zDz11XVC0whSOwRBEWj7z+uUEg3jJUUOGhXEFXDYwv
	 Rpn3Lh12iHqqsebrNxm+Nyt+5RXnhHBKTNTxuziBe19rmv+IyTcubSAIgrSBzRVO1wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qDHUhalw;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1D1606A33D
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA1D1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qDHUhalw
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eaeb7fdda2so761985e0c.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 03:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792752044; x=1793356844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PU3pthY8C33I9auXpGTnmiUI6trGGQ/gwWp/L1g0V2U=;
        b=qDHUhalwvENGkYicXhp/819z0Cb38eGLFlBd2GcJ+kd+woA2F1L8l9kYdTAygGzV41
         jjsjJKPrcmEv5ryCEEnITghJ9icCuEe79uAC2TIerrCYohBBHBLTZiMIiSOnL7RgoXOc
         q6Gpso+ZmXyHzx5yBUnX/tlI6/9r0A95XfDV3X7yX3MMwNrPcA9L+Z8BuguX0OIOAqlt
         JHwbigQt7F23Hncc/dEgAZqZdYcICFBMwluD4DA7c4nwdtfDwE9g22DxGn7k0FaCEkPY
         uTBI9O6EHgKlpntPbaAxkPlFVAJrawT3KfULj/F4BGcIPiZqEfUbhbaRfaayJgz0OljI
         ukyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752044; x=1793356844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PU3pthY8C33I9auXpGTnmiUI6trGGQ/gwWp/L1g0V2U=;
        b=PMX6yQ2NUIhDU8rM1b4XEaO9WTtQcO27QA78+ejKh9n2XEmcP01Uocf8ZKx2vwho0G
         TGMCE5x3H8I8dxjlJq/wWR3WVL1naZREpznPm6UDayCKQF7yWsDYXGJYyHn+/4VHKLIf
         TOAT4UTHkGc4DNysiByzHpZapb773iisIs0qjO1kdvI7TJL0QLRdC8CmE8V8+7pgWfmg
         W+GIk9iYoTrbdqGZBDlP6EKxffQlRP2YC8f+2fEsOFBJ4h+s622Xlr/k5lXvBuQLk9TW
         ZFJBbetZxiNjVWqBMevkZtr3mk0IWOSOju165cHoXnZ13eqmmUFLdZbsJKiAsG+00/Ay
         ePcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5x9uCEAMsj1VuPSRU2/4T7AgFevjB0rL7Vnj65IJwjdCNHPl5fEHAZ62sylPUYwO+OySMyOnwZdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/NuR4DSCMU+7ZLf10D92gq4+Lbf7kmADdkYtc9DC84eptIUav
	lpDDobkBNR1JPNbqGlOL9FzIEziZ+XqtgpJ2Yly9tK4wOkQZDqZwCwV9
X-Gm-Gg: AYBFou3jMt7Mp+BKt5uNHugYNvrsenDwpmlNWiYqDItghYrwwUjNOALy8HpycNungzx
	YSryiiUx0gxaMdR811vqjqLag3gCuJ0xs43ZMbyFMo0/bbFc62JIlXRv4AgaMSarOUkYbqToTWM
	Cz3zgdis13wuWu/RLtWjgZWro90DajyxO7Hy2le1WKaklWvl/DeStRjE+siT5umzJBpe5y/GOD8
	ChGBl7+Y1Okloq3OOzw/zwhO5T/LA7OTgxwXzzepLunVIZcURm3MEj7zI1+YOaI+xBsegW/Dsat
	jPLpmqVr5TGkPV3Yy47EBGTKl/zEZLVtS+S3f5p+B1bo8u29HiVRlj9OILk+W64m4bOL0vb5C3u
	jcEAj2pBT1hy7gCiPQA8Av3ZnX+SOFtNm/Duw9O2YrDiBdb9RhSbmnPVD+Cz/mxiBrvfUyXQe0o
	FFXBV6/rWmdI60ia1jb/D7mC0cYGftuTpedE2FHNzafY+4m5zNUf1r5FnNZttK/Ns5prFo3WDsp
	PKzgUe31ygIbExCTuIw3WWgNzeXLpFbaSCnJnuXiiRHBkIquu7BuRgfWb7BrwuJefo9nfpddj16
	uorFik/XhkRjXH4NUPXEr6Taa4nMQtmlhkcc6vJkyf+lPKZ6W7g=
X-Received: by 2002:a05:6102:41a1:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7ccc32eac6amr858728137.13.1792752043685;
        Fri, 23 Oct 2026 03:40:43 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13deaba5sm1974736e0c.1.2026.10.23.03.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:40:42 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Fri, 23 Oct 2026 07:40:32 -0300
To: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 07/10] iio: frequency: ad9910: support drctl control
Message-ID: <pg7pcjaaxuu6vmi4qowgaefyo3mynrvmiu6iazzormyvc5kiat@4hiqrtwbw2gg>
References: <20261022-ad9910-backend-support-v2-0-0ff7f0bff326@analog.com>
 <20261022-ad9910-backend-support-v2-7-0ff7f0bff326@analog.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-ad9910-backend-support-v2-7-0ff7f0bff326@analog.com>

On 22/10/26 12:19, Rodrigo Alencar wrote:
> The DRCTL pin controls the slope direction of the AD9910 digital ramp
> generator (DRG). When dwell is enabled at a ramp limit, the DRG holds
> that limit until the next DRCTL transition, so the sweep pattern is
> defined by the waveform applied to that pin, which can be generated by
> a PWM.
> 
> Get the optional "drctl" PWM and expose the integration_time attribute
> in the DRG ramp up and ramp down channels, which sets the time interval
> assigned to each ramp direction while the sweep parameter is accumulating.

...

> +	st->drctl_pwm = devm_pwm_get(dev, "drctl");
> +	if (IS_ERR(st->drctl_pwm)) {
> +		ret = PTR_ERR(st->drctl_pwm);
> +		if (ret != -ENOENT && ret != -ENODEV)

Sashiko points out the problem with passing a non-nul con_id to devm_pwm_get(),
which would get us EINVAL or ENODATA from of_property_match_string(), and that
would break the intent here for an optional pwm. Similar to what we tried to
achieve with an optional IIO backend. I wonder what is the best strategy here
(ascending order of complexity):

* Use con_id = NULL as DRCTL is the only pwm signal being considered at this point.
* Local workaround by checking for EINVAL and ENODATA too
* Convert error codes from of_property_match_string() in of_pwm_get()
  implementation and create a devm_pwm_get_optional(), which would only check
  for ENODEV and ENOENT.

The pwm is optional as the digital ramp generator is one of the possible modes
to be used.

> +			return dev_err_probe(dev, PTR_ERR(st->drctl_pwm),
> +					     "failed to get drctl pwm\n");
> +		st->drctl_pwm = NULL;
> +	} else {
> +		ret = devm_add_action_or_reset(dev, ad9910_drctl_disable_action,
> +					       st->drctl_pwm);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to add drctl disable action\n");
> +	}

-- 
Kind regards,

Rodrigo Alencar

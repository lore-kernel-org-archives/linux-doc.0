Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF952D7380
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 02:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784859338; cv=none; b=HL0J2sVZ1/mUAM0WOTxXyWBEUpY9NST1P6cUeLFXdVLvHFiqoOws7ivUScP/QewB16ZUA8izTAa2o7ulbvFezghEij2qX1xZQZ6AkDo5qmU+DJ+WRn2z65txTm0pcRurfcnGceV0fXj4Cn6wo5zpwFhln6c86Px01llWctv//jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784859338; c=relaxed/simple;
	bh=L+t4HV7Sv1Yr6ycKAZe9fxoigD3ECM35jt241Mi1QXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVrdjwTD/5HJnoKpC2+9L1P9z3z/INIoNI+fZVh+jmt3kilVwR4j4LTLEq1Ti8Nx6rNyCqxxfsSQCi/cWWLFHgewsbcI9EAj5iP4sUSmxfJ2ejsmZLrun4UGRMlbLWvz4TJ98JIKbVfPeYvZ0ZnJMEGaN8ZDSSEhFQzj3jamXNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBnQ4VEO; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBnQ4VEO"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84a2dcede83so1834798b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 19:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859337; x=1785464137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AErqtQxtjWESFK/cC8ZbXVOsghSEV1lk9NocrdQ1hHk=;
        b=RBnQ4VEOZuZC3AKktZrl5VfIys/dqIjCzoGvKOtK9dWZs+DAinYlIYBijIneqRRWn5
         uEGG5rQzf/9tcVKbtWqJiyRrib+Qz62asqCSrP7fDbTlqSr7WluEDCf5XC8XatKp5Eus
         rKvhtIRzQaRHN2ozHh2G41q2a+ie9Wc+ug6Pg+jTEFiwTWS3ewKF7cOwsA74eGBtgI8c
         D8LdtjibEVo+gNjxGep30INl6cFt/IbGphzw+iTE/qi0LclIPz4/dI7AdFMHT9MhOlNK
         vVLibFCkflion2JcRHM2u7FvaMhtxQHBzarR/uAxhR0LePUH/jHjEgn756ZDBljdEapk
         0Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859337; x=1785464137;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AErqtQxtjWESFK/cC8ZbXVOsghSEV1lk9NocrdQ1hHk=;
        b=oqDX5QyZmG8T11SPVenpeyfyVN0PJRso5ioimAUmN/EHvNy33MSw3rRy5ro7dKJ/74
         O8E7acbrWE58nNbCv36DiFbOpVOTAbpCszjidYdN8liYp1MBxV1LyHL/Jqr2xgeXZQfa
         NwXlFuW3Wn2WvN/FnORouwYSUSEq2zQFtxaT4rDjnOvcW7mkUou9mkqBfFIXRTekFDty
         Rl+HQ725pbguICfnSys4XbHrjXlSZ+/1Baf/86OGtrzTjknWA7fy4kyhE6bDEdRHBN/i
         9+gEZjf8QrXlUpdmflwAJhxlbRp+cy9WkSpaTjvlWVwPHIRVDJb2XlzLROmPlHUXgIKu
         aByg==
X-Forwarded-Encrypted: i=1; AHgh+RpsWvMmKVouz88aSKmrf3q1hO+AaJ9+XbLb7dsKnuZaYXoPwt32bDbrmM3FdF3OysI0ZKcaeBj+ma4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXTpp1wAiR83G/C4lEh9/hBgRF74WT8yVt2dEsWeSCx8B45Oae
	Qt2HfD7AjvhOt4RBYw0dsheMVNTuz1wHzZFuI/uXh2bWUhP+eqpAFSaR
X-Gm-Gg: AR+sD11D0cXNCiS67Ea2hgsm9FsS9qX7B384Z1NSZ+a+KuWNFoh1Nnh0olFxJ0rogey
	yRogBLXDywRNc8k4t2CI7CbCXujqoMdtboiR8GZEYLstXBFNbN/vWD4pv/jVtSpry3sz3VzP1vt
	9ut6yjIKsdm4xZuPFJg2+bMh5iMetm7umiYq+xMN7yRiZPYEBkseRYra6WxqHO7u8kKfUMBGV8v
	homyI3hNgo1UR3mtjXgYzUKCG+UQTks+U8mWONZ+VcUUuKZ4HiLTtBxYajgx9+Juq0U//U0RpWt
	HoLOgj5wG/ADCrfzvu0tSEGsyinD6mxaad0L0TFhqqwc0W65zMWhbdBWmh7MA7uZTOja6PiU/DN
	+KoUPXhBG/KKiRNtNzepKqnKtHVL4rKzzkMT61r/3yDvVvlACGkpvljvDN4IF6ZEWXFDmzUqtMb
	xSjHAjRcaWvH0qV8q80T9YtjXKvxzHWioXGoFnwS2YtCQ9C6wC820=
X-Received: by 2002:a05:6a00:4206:b0:847:902a:57b5 with SMTP id d2e1a72fcca58-84e2c181f5emr5752517b3a.35.1784859336878;
        Thu, 23 Jul 2026 19:15:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e172862f7sm3835625b3a.21.2026.07.23.19.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 19:15:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6abbdabe-91ec-4757-a646-8b2b2d4058d3@roeck-us.net>
Date: Thu, 23 Jul 2026 19:15:35 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] hwmon: pmbus: add MPQ8646 driver
To: vjardin@free.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
 <20260724-mpq8646_v0-v5-3-5915b5ae9aa2@free.fr>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260724-mpq8646_v0-v5-3-5915b5ae9aa2@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 16:55, Vincent Jardin via B4 Relay wrote:
...
> +
> +/* Adapted from lm90.c */
> +static void mpq8646_alarm_poll_work(struct work_struct *work)
> +{
> +	struct mpq8646_priv *priv = container_of(to_delayed_work(work),
> +						 struct mpq8646_priv,
> +						 alarm_poll_work);
> +	int rc;
> +	u16 cur, newly_set;
> +	size_t i;
> +
> +	if (priv->client->irq)
> +		return;	/* SMBALERT# wired; polling not needed */
> +
> +	if (!priv->alarm_poll_interval_ms)
> +		return;	/* polling disabled; don't re-arm */
> +
> +	if (!priv->hwmon_dev)
> +		goto rearm;	/* hwmon not ready yet; try again next tick */
> +
> +	/* Serialise with the pmbus core's own transactions on this client. */
> +	pmbus_lock(priv->client);
> +	rc = i2c_smbus_read_word_data(priv->client, PMBUS_STATUS_WORD);
> +	pmbus_unlock(priv->client);
> +	if (rc < 0)
> +		goto rearm;
> +
> +	cur = (u16)rc;
> +	newly_set = cur & ~priv->last_status_word;
> +	priv->last_status_word = cur;
> +
> +	if (!newly_set)
> +		goto rearm;
> +
> +	for (i = 0; i < ARRAY_SIZE(mpq8646_alarm_map); i++) {
> +		if (newly_set & mpq8646_alarm_map[i].mask)
> +			hwmon_notify_event(priv->hwmon_dev,
> +					   mpq8646_alarm_map[i].type,
> +					   mpq8646_alarm_map[i].attr,
> +					   mpq8646_alarm_map[i].channel);

This is wrong. This will require a new exported notification function
in pmbus code.

Guenter


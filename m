Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2CE1AF0A0
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730731150; cv=none; b=A5V/pT1dCctHORE3ZAdjBY1n3rjQ9dvIWI2wkFdiJz1oJpr4rD5G4EaVeOfLwO970Miafp7/F/SLGw44eHq90/TlUDiOSf1ATgrAUUfEQD+fuOCxDo5cN/GJCg2r6q2eJVzB1TS51IR02vAOIBBI0p4jFjHAhR40Ivw19oFjTP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730731150; c=relaxed/simple;
	bh=N9mNTgS7KydKjujfpo8o+RMYb3M2ubWeqVEZYIZNbvY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PqfnzBApcSwLOf9AxvFyG8gKW/eTAwXi7OuGKAu8FxVv+M+d9e339duFljOOnSM7ajf7M5Hmay/Eq2OYzAk++hhwQDvFQ3G8dOxhC93A2aV6FH9cap8UanrBoJLZlOG9TiBFzsU7GPaERM84pIdvHDhdVf7pCPbVAXYdrPBbai4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K+f7yHOq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K+f7yHOq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so37201905e9.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2024 06:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730731147; x=1731335947; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V1xpNFk8hvdBrc0E2hQPlR3zKBSGiQuhict/6bGeGu0=;
        b=K+f7yHOq5S1lh7AD2ez4PM4me8oYXnj5UNBnNruXUhJAPHo4e73cIN0RGxX1f03Xqb
         ElACQYVew7z5byW2nH1Gd4c206wTqPvjvXXy5HHQ4BbmddfBYiWltjkvRfMzIwQNcJ3F
         2189AQfn84FG2NvnBmWXPILW1rGvtL67Er/Ub/oawIXnBH7Ng/gys7iAtplvqHeDQWOF
         2GwOClTK+pr97pzJcze3dXTYg8mxi/xj8A/rJ/5FQLF70y5CmzLx+6H+Ic/pNlndrDLG
         c+Ys2MqHOW+ADAK0rexJK7BydnB3OdVCEQoO7vmEK4h9bAZO1X5rM9wXAFIYOWOLkKAc
         zjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730731147; x=1731335947;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1xpNFk8hvdBrc0E2hQPlR3zKBSGiQuhict/6bGeGu0=;
        b=LZ0XRIPga7PxvTXWXU8uhWEOc5b+Jjfi2qdTpiskYaQJll5EO7jsG7igN9Qib3ckdY
         5ahQkTSm9ld5dMULyVulLV3Hpe/NQu+Ohx0oS4kynb0TFSJ0msLFmy+TN5E37mT+HeEJ
         reGnLUfRAyBaUFPUxBhrv8vonymRp7nzlKsS8pEuTdXJwqx0W3wCLxrs6alOHDkw4G9j
         fGubOrF4AbhzgBhSlga6K9Ee2RmuAUanjKsTp4m9IbyDqTZP6CgQaibIDPMD8Iae+u8K
         o8TqiqM3GO7OiAGSxqF3jDzhpH6jhMNGssU88O5yHUqG6bZ5iX1bBZ18jTqaHGOO7pko
         H9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/xg0Hln76UdJ2cu9+dI3QsW9KG0yWpqPk52lmLyKIRa29tT9PRMzMZHNHo+sIUOgeFOfmzm8KYz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwICTrO0bL8Y71ov8naABoisvam7RgDITgmqymX7fd38FgBFkKP
	n3Qkdp8gK/n8DcO8WPYdxsdfNzqxIfzYB+6YvgytE/f8f7hFUVn85rXDZH8ompA=
X-Google-Smtp-Source: AGHT+IEkd7fCxmipKdK/jhPqqpXWWRduRKJdf1Fys48euGtYO2BQbNuoCcaPoeGNZkFLXLCk4YE8xA==
X-Received: by 2002:a5d:5847:0:b0:37d:4d3f:51e9 with SMTP id ffacd0b85a97d-381c7aa451dmr10370065f8f.40.1730731147068;
        Mon, 04 Nov 2024 06:39:07 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:4393:a9f:472d:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abf3sm13387483f8f.101.2024.11.04.06.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 06:39:06 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,  Jonathan Corbet <corbet@lwn.net>,
  Patrick Rudolph <patrick.rudolph@9elements.com>,  Naresh Solanki
 <naresh.solanki@9elements.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
  linux-hwmon@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] hwmon: (pmbus/core) add wp module param
In-Reply-To: <fa79de78-aed9-4cd3-bff9-310f2b4a32c9@roeck-us.net> (Guenter
	Roeck's message of "Mon, 4 Nov 2024 06:18:27 -0800")
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
	<20241024-tps25990-v3-3-b6a6e9d4b506@baylibre.com>
	<47164712-876e-4bb8-a4fa-4b3d91f2554b@roeck-us.net>
	<1jjzdj5qyy.fsf@starbuckisacylon.baylibre.com>
	<fa79de78-aed9-4cd3-bff9-310f2b4a32c9@roeck-us.net>
Date: Mon, 04 Nov 2024 15:39:05 +0100
Message-ID: <1jfro783na.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 04 Nov 2024 at 06:18, Guenter Roeck <linux@roeck-us.net> wrote:

> On 11/4/24 00:43, Jerome Brunet wrote:
>
>>>> +/*
>>>> + * PMBus write protect forced mode:
>>>> + * PMBus may come up with a variety of write protection configuration.
>>>> + * 'pmbus_wp' may be used if a particular write protection is necessary.
>>>> + * The ability to actually alter the protection may also depend on the chip
>>>> + * so the actual runtime write protection configuration may differ from
>>>> + * the requested one. pmbus_core currently support the following value:
>>>> + * - 0: write protection removed
>>>> + * - 1: write protection fully enabled, including OPERATION and VOUT_COMMAND
>>>> + *      registers. Chips essentially become read-only with this.
>>>
>>> Would it be desirable to also suppport the ability to set the output voltage
>>> but not limits (PB_WP_VOUT) ?
>> I was starting simple, it is doable sure.
>> It is not something I will be able to test on actual since does not
>> support that.
>> Do you want me to add "2: write protection enable execpt for
>> VOUT_COMMAND." ?
>> 
>
> Please add it. I have a number of PMBus test boards and will be able to test it.
>
> Thee are three options, though. Per specification:

Any preference for the value mapped to each mode ? Using the one from
the spec does not seem practical (32768, 16384, 8192).

The bit number, maybe (7, 6, 5) ?

or just by order strongest locking ?

>
> 1000 0000 Disable all writes except to the WRITE_PROTECT command

3

> 0100 0000 Disable all writes except to the WRITE_PROTECT, OPERATION and
>           PAGE commands

2

> 0010 0000 Disable all writes except to the WRITE_PROTECT, OPERATION,
>           PAGE, ON_OFF_CONFIG and VOUT_COMMAND commands

1 ?

>
> The driver uses OPERATION and VOUT_COMMAND, so we should have options
> to disable them separately. It may be desirable, for example, to be able
> to turn on a regulator but not to change the voltages. Also, since
> full write protection also disables writes to the page register,
> the impact of full write protection on multi-page chips needs to be
> documented.

Noted. I'll update the documentation.

>
> Thanks,
> Guenter

-- 
Jerome

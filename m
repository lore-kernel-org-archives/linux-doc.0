Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4546378814
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027027; cv=none; b=U64keTlVsvItJwLECJwO72J2//7e6+xwCZsBZU5ypioOGIq5pubIdtFM87s4yUwnkRW3Vy1iRZtz7xwxevze4Vq9I27AbC/msx4E+U/udw6/Lp0Vx5vGGw99pSG8/nGnE8U1pcoz53rEqBqLZgJVuNfwprMBxH0uTRoP1hqTr6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027027; c=relaxed/simple;
	bh=nRXqOwRrDIdwQBvgebmXi2daQrVI9gYsamm/tsW5/rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnSKMdg+gHWFbV+8Q0h4KxZi14IQoQu2ZOthXpeLYjpWVe57faIP8kqwtJtwhrJNOl74yADV8B3XxNLcuIKVUviCxdNN6VVxZKBb0Nq5l40B9R4zaX3GWbdB3HMedROwOGZjhjYT5W2GX48UxNi5+5U4XIipekSIWgklk4luAWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECIQn36r; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECIQn36r"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so26711725e9.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 04:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784027024; x=1784631824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUlBoKh9V23To8DEkY2V3YxhmQz/dU01CR+2A2ONytA=;
        b=ECIQn36rKfAxtMeY16RzqQa2S/TzZW5eGdbyS27dWoSjIQqWZvrHvlgNu1HtOUMh/h
         sUkTfGfgcuBnMeAuSXa18C2jeqLqwU3fW5sYs5hNMpzkDr+McUZlF5N39Coo9QXc0Uvk
         81W92cneSKpBnQypdzDxVpqi9ePWuTMnotRTaiYwRJFNOYu1D9nnMQmsy4siyJ2G3jQ2
         NSbID6NPz5Of38OFEy0AFJf5UusSn0IQ6yhe+5e6NVAUaFTarK+M8xevnQAXLbTiXYjY
         RWGUoGgDrgbsj15kz7oyJOZIXniqa2W3GLcAVzAAlOe8LIBHr0NqwDOdQ7JMuUv51BnW
         Mijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027024; x=1784631824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUlBoKh9V23To8DEkY2V3YxhmQz/dU01CR+2A2ONytA=;
        b=eROdtvZe4g0iBSoiUF32/N2q2gH8rCwqqo9evHFdMeTrUevn2yTRFSa7tIAZ8ONuYm
         7HyENcjpXpt3/VjUBJs294LPyLkbUQ6UM2DvvVohHiS7NrSBYaOarBU5Jo3h9kWO81GE
         I47OkisdBWoASmZBgxdrTL9EExval+tS1LfV2JR+/9uHR9R6bZNLiUxSDEspLQW3AG2G
         ji1x+3IrnG93c96lRg09KIz+DyzXS+oSuLMzXD5jGBfe1ZZ5fE1H7QsFQ4d+Dye7SYqQ
         1A9ciV4U2oKtjTgkoKjyDnwCFKNfJVXvlgmk7d+L5jCPU4JqHFPqOJ1Z0pdldboMaRXt
         SoPA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2jkFA0OQG1xUZHluECiymrAFCwKMMVN9u82oBnWi68CS30OByDvyn9aZzg5UQfYyXB5T/HV+Nvo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YytZU77FIUoJGtzgc3h/8HS6OurT+XCHsMAFetP295vTTXpwRzq
	sasw0WWGf7Pyg1os5yxJsu6LpL+8WxlBUTdsp9lRtmD3e9L/pgoF5Nqe
X-Gm-Gg: AfdE7ck88n3FRRv7G9eoYuJYV/t6uhF6CsDCzdJoja3zKT7jUZDYfKbb9JkklcfhC2w
	h8Tdq1eTI9UgVqDpyjEfri4yB1QF1VFtHmnMZZEYKWlEEkLXIupDfaybWpp9NU9lVByn6fB33DA
	UQxuoRQ9HA2CjyxAXuM5euab1+MSTzPAZpnTg5OapaFndaNteP/yv39ISj+b+fYF+RQATtdUpZr
	epOtUFj+WQLACTDhuGMFSarGfIn94v9R/3hx34koFIsnKVUzmwHZ+2O/aHbs1AjpVsaZVcAD0eG
	QW43cCv/Ezh/hjifvPzqi8MjzBbZoRb51lvmRYEXF0/JYP6XwUFWg5HZnk/mAgtU/SYDfcCoPeG
	fdg2dvcE8yGDVKrDyGYZBG78G/76AE5pdXuiAPFm76nFFcfLz2DLt3a0KLLkl47tI1BMHICmLXs
	si/2vX+aNEFUYKYx978e065xjzdNNpLjCgUfNzwXaC/m9ZPDtavOIROSpN+bLQB9hT
X-Received: by 2002:a05:600c:528e:b0:493:edc2:98ab with SMTP id 5b1f17b1804b1-495389cc4bemr20361535e9.28.1784027023678;
        Tue, 14 Jul 2026 04:03:43 -0700 (PDT)
Received: from ?IPV6:2a02:3033:600:7200:8c5:6bb4:871f:52ad? ([2a02:3033:600:7200:8c5:6bb4:871f:52ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49510c8e220sm57914405e9.15.2026.07.14.04.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:03:42 -0700 (PDT)
Message-ID: <1e353a66-3543-4a6f-91b6-d5e8524d9754@gmail.com>
Date: Tue, 14 Jul 2026 13:03:40 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] gpio: ad7768: Add AD7768 GPIO auxiliary driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-5-44e1194fd96a@analog.com>
 <ak-AcfH-Igsa_ksV@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <ak-AcfH-Igsa_ksV@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/9/26 13:05, Andy Shevchenko wrote:
> On Thu, Jul 09, 2026 at 10:50:16AM +0200, Janani Sunil wrote:
>> The AD7768/AD7768-4 ADC exposes 5 general-purpose I/O pins that can be
>> independently configured as inputs or outputs. Add an auxiliary bus driver
>> to expose these pins as a GPIO chip, registered by the parent IIO driver.
>>
>> The driver uses the parent's regmap for register access and delegates
>> runtime power management to the parent device.
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_update_bits(st->regmap, AD7768_REG_GPIO_CONTROL,
>> +				  BIT(offset), AD7768_GPIO_INPUT);
>> +}
> ...
>
> So, I briefly looked at the implementation and I don't understand why
> gpio-regmap can't be used. Do you need PM runtime there? It can be
> done for all (if absent).
>
> ...

gpio-regmap does not naturally model the AD7768's direction dependent readback behavior.
On this device, GPIO Write data (0x0F) holds the latched output values and the GPIO Read Data (0x10) reads the logic input level only when the pins are configured as inputs. Using the generic gpio-regmap would always read 0x10 including output GPIOs.
The custom implementation preserves the device specific behavior.

Best Regards,
Janani Sunil


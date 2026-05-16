Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A289C2EC0A4
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 19:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959516; cv=none; b=GBOzlGeYfHgcHev7wuMKlJkIBSksaeRM0PG/nB+t98dkO4VtxFL8nhJPAWMcta5HMhaDsBoNHlImRNqPU3K5nvQMQ3EKioSEaKvjr+TU9hooY6HgMl4r7ARdIkaXn0UvdSgu7YJk7Nd8zyq6Hb/CjiUMfn45TD4B5LXgYYuDamM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959516; c=relaxed/simple;
	bh=Rch9BlJKm86u2jFjWPy/exsEl++VNJ8K47Z8YCQbhlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obiMgPWH/VPVpZn9W7zFPd4N+08e+WkDK1BNgg8IKx7fpRXhg8tRNQCdpzM0sFNHq0SIknpWHoyJWOJhCsBv+fAPo6W/s5/PZ2a5Rb2wwJ6evfOpUcU8ZrKGRqPcEeeAbVSZPxX1zozdXxN7ZmbIyr+CCBdAXSX6pJpI4vX8Dxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=sjV3WU6g; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="sjV3WU6g"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e4de538f83so601138a34.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778959511; x=1779564311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fPwesdjsiyiHQsIQO0tND7lOMwn0nsVsfr8NNzx7zw=;
        b=sjV3WU6gDdb0fiziRhotQ9qQeXC8VEmtLrnNWudUrByaxsuCsYa6AxQqE7/fkBNGPa
         V0AcgN6U7M7K9+/wxUOvV5ss0LytD1wpmk7nYvA3JkRiFwUshu6bCauzBjpM5hgT6r1n
         FA1MqINegzVeAVmmqnQ5guYze+89oNRBAh/+iTCIeXIe9H/c7g5Hp/U2AFHakAodC87T
         apYqtK50GdRB7ljIC1f1ZtiaJh69wCnTCFcmOl256m6B56ldux7Sv+Wz5zP73e4yYsKF
         cE29cBTu2UeceI2qgFk/9DPET6JS8IG+hKpuzY43oIM9ctwxWA5I4/uOJ2LNyu31wYng
         umxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778959511; x=1779564311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fPwesdjsiyiHQsIQO0tND7lOMwn0nsVsfr8NNzx7zw=;
        b=qg4k5l02ZcOMhSFkpwY5uiuz89yjBR0kzNGshAx0RVYw+GjTnwLDejoE+DmlR9++Js
         yAN8nTr5mt29vfSQdcKnsnpyvpw5MBNp//V+uxyMJBT72LdLvgztw6WXE9ynqAxjTWEG
         7DS+4UeOm05mHHI44wMjEs5hN3i5Fdq9NSVOSu9BSZWvCwFzB3KoK5r6ltzxErQAfov4
         Ylw2Sm0osDUhUj8rYvBuynHr/F+5JBn4P1uepF2+vDxt2k9MJllqLwuI/W7A8U6MLpP9
         DxJ34/XXxaaOEA2lb7QD+oQvwNLmznQcJeg0sThTnJPAaHV11I4lZ8wcnfc9zna51Glb
         Jryw==
X-Forwarded-Encrypted: i=1; AFNElJ8cGyaa/JpDv8vsDIcasJrrYctNt+VVYk6+OMyAyjVcRl70dvfF2fC1R9JAaFS3kQeuxKrgKsYMz94=@vger.kernel.org
X-Gm-Message-State: AOJu0YyALFW9E6OXGgTri3UGwB1yrw+2Lg3RBQx85NR7P7GzDKYCs1f+
	yqKwf2mlU2w78TI/zMwNwICqpN8QpGbI9qmtgdl6UyA0rY3YwkGFSQZ6vgZR3Dhwgr0=
X-Gm-Gg: Acq92OEPMx8tDSakfEY86biKyBbXeuhFc4Y+904VPGo3X5t4tmAQUXVMp6ISQgWoj1D
	Y08ppLw9W9aQ4d4AMyFdylSYotccQwLWJLeu1DhAiZqkKTVRCSvH1UFZPbmFVx7CIDS+7M/f/rC
	q7WfCNObMUFuzhHMuGTW7/xbBPOQvbbM0zXtMdWnZ+HMa4kGH/jLdrxKyf9QWzX9QDCpwR0ofFF
	yApI63O1/gFcgFY1Qx7zmO+dZdmn1O6XAa5RgQ1O9rBb8Gy/FPySiEJsnQj92+KBcR5Xxrl8ojc
	CX54ius1ibv2LVuyNxPH9xI4UcSnUjhYwHYRpDY/RggklIDsBs/4tFUWX1L8/U8nYkBUH3ORv6O
	g+3CN1O84iyLsNcdnd6NoGkf97mvWa5NdXVx7cFpkGUpxzKMWV+ybFfJg3MRo7gyu8Z1cIWbAvj
	M36H0GmoXmLf2myFrAbgQYaXpsoCQ18PBS46FKVAjkGgryn6S2mr+IuzlPPBluDSAE3PdY1Lc5Q
	Q==
X-Received: by 2002:a05:6830:4704:b0:7d7:4ee9:c39a with SMTP id 46e09a7af769-7e4ea031993mr6198970a34.4.1778959511638;
        Sat, 16 May 2026 12:25:11 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b36d:bd18:7c02:29e2? ([2600:8803:e7e4:500:b36d:bd18:7c02:29e2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b507cbesm4126569a34.0.2026.05.16.12.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 12:25:10 -0700 (PDT)
Message-ID: <53d547ee-1ac3-42b9-92a6-e7f48b72fee3@baylibre.com>
Date: Sat, 16 May 2026 14:25:09 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Janani Sunil <jan.sun97@gmail.com>, rodrigo.alencar@analog.com
References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
 <20260508-ad5529r-driver-v2-1-e315441685d7@analog.com>
 <20260508134843.7646c4f5@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260508134843.7646c4f5@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/26 7:48 AM, Jonathan Cameron wrote:
> On Fri, 8 May 2026 13:55:47 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
> 
>> Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
>> buffered voltage output digital-to-analog converter (DAC) with an
>> integrated precision reference.
>>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>> ---

...

>> +  * Multiplexer for output voltage, load current sense and die temperature
>> +
>> +  Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ad5529r.pdf
>> +
>> +properties:
>> +  compatible:
>> +    const: adi,ad5529r
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  spi-max-frequency:
>> +    maximum: 50000000
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description:
>> +      GPIO connected to the RESET pin. Active low. When asserted low,
>> +      performs a power-on reset and initializes the device to its default state.
>> +
>> +  vdd-supply:
>> +    description: Digital power supply (typically 3.3V)
>> +
>> +  avdd-supply:
>> +    description: Analog power supply (typically 5V)
>> +
>> +  hvdd-supply:
>> +    description: High voltage positive supply (up to 40V for output range)
>> +
>> +  hvss-supply:
>> +    description: High voltage negative supply (ground or negative voltage)
> 
> I don't mind doing it this way but in some similar cases where 0 is something that
> can be considered the 'default' we've made the supply optional.  What was
> your reasoning for requiring it in this case?
> 
> dt-bindings should be as complete as we can make them - with that in mind...
> 
> There are some more interesting corners on this device the binding doesn't
> currently cover such as mux_out pin.  We'd normally do that by making the
> driver potentially a client of an ADC
> 
> Easier though is !alarm which smells like an interrupt.
> !clear probably a gpio. TG0-3 also GPIOs.

also optional vref-supply for external vs internal reference

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - vdd-supply
>> +  - avdd-supply
>> +  - hvdd-supply
>> +  - hvss-supply
> 


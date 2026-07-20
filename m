Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9028E25228C
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556033; cv=none; b=h3r0IL8e+NC5HATcef895GM705Oh4DPrrOP/UThhWs1WiYDoO6WEdtYUMR7NgsUWYJaap2kbBh5dwNY9A45a7TLK4Cn2M9CKwpcvlxb0xRzT5g1hI/zToNW5ULpEVbDFLzCuCX1vC2xjvHUsCRl0Ii8nDq2FqZxJ1fW31i1WZ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556033; c=relaxed/simple;
	bh=ibO8HrzFGnu/FbI+Jv85vcjMmuwSEhYP9jqINubWEak=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=l1pWsRotKFZZYzLzMtK07uNBYjpRaXOkucU99jUtYXbjxWo9JnXYktvJCZecEp33jXRCcHx33qVKbnTbqg32p/9WWkmz924fmO6vKaDpjgKEOSqip3iKi044QGbL5sg9p1/f4hv7Gt8WP54Z1C+qvGa9FirqQXGXZenI69NBTGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NN4xQ3Ez; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NN4xQ3Ez"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c166f1bbeaeso976823966b.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 07:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784556030; x=1785160830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XWyfB00Rok/PjZ5UHAUkTiQrGyYkPnkRtIuDzoxupg=;
        b=NN4xQ3EzJUcEDIBjZYig4zs/xtggJJFuRxCFip4KzMpyhYCtOwL+BbH7hYqM5mKTHE
         s7yLQzp6MzAWSL5bKPu2137t+KeLT6kwBKqMLlo+TWRpk/L7zCrrkILwJAGeZrSza1gV
         wBelRJ9HhOaNnE6kxWgMpumc/gvwynV1VIWj7qjoJPzrohfP7/56hL/uJsiTIbkJedHo
         ELJ4l11ffh4SVZgTfXm1Ni+0g4pKSfWMENy3drnty1eJeYgGi1aAfzHo4+i1/bg+oH8r
         lqoxXb7Z2tFmH8BgUGjEY3lQ1k+1lZLBTX9vqzxroyjwsrVi0XOtmTP4hQ2HvKuVTW8i
         ulhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556030; x=1785160830;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XWyfB00Rok/PjZ5UHAUkTiQrGyYkPnkRtIuDzoxupg=;
        b=nqs2rF5qz+3jVeEUduZfqoXoQINrLZoSiY3S6tVgVjkAorMlsPHaJ+2GNZu5ofA6d3
         gEqks5QIBXpIqyDe0+EonIUWSscCELzjOqXXGznr+iWfvKr9WiznFpHw+or5Y5i3V513
         uqq1KI+kgkasZrE95Y8BngekpUo/4mR7vp0HaRcPAsHk084PCVGp2cvw/mECjdXrpMKE
         9Y/sl9GAVgGey6VHrIgxuOZskxUCjrt+LYQVExNGBZ1IcPwxaVwvoscpfYV+yZO0Zyx3
         TbryS7RXAqQznNz1TJ0J5sgnS/xlqKXWJbr8e/7EmDbVNsQ/j1HsA0SU67783Va1vaNg
         kpwg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+L+qOPmT7sPK+dDpeDI1s8G/6FvAsLVGrNOsmY6SRMDL8qOZwgFXNM0Ywv2Muot/Hx3RRrshegNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziRwRW1lnfcsllCLdplJ7Bb55qr1hLWBL9vEqkdXXirIPzgY8V
	5aH1cMdYJV1VlGiq0ISjr6vT3FdkAgUxA8+s5uoIv20mInqxsZSwul3MZQBeSm3g
X-Gm-Gg: AfdE7cknrIX0MaB8KcCyuPIfzPXNLE+6Wa8innNxCvdWa/stDLBkHDXz4vYa2mqGCFm
	1yjmAw6NTagZmP1RUz0mzeQ6kKVOyAb9/5B3IaGOV3ID8EksUBD8hCjrkI7QB4JAT48lbectnVV
	HOuF25De7jND3/JQ+3j0PJf7nuO3EDGha0sIW4Zpef+YMNsZc2UNJ0mOXFIQqxSKYHYkcwrv0O4
	Aq86rSLJ9ejFcnV08iXT/zcicHeKVB6jNuVavJIJz7pXw01PJggCpBANEbU8xvUfUmR6oQ6TkOP
	/M6k30VADI8Gte956R5pJoMhYbCEy+MCoHNhSaHougbOS99vZc5XZNPxwb8zkdclqUKOjb/ZhRu
	oIWGE8T/3n/DpB9RjhyCJVK05dTS0yCVwCZvPxWBXWa7DTwTH8Z9u3hJtoNKAciFEGCOfG+S4cL
	h634HM/LDofxM00bN32NTRZOgRz7ua0HJyijZs46xUoO9/PXdmh3Fx3K2rP1nbsdJdZ+N0Fug=
X-Received: by 2002:a17:907:3e98:b0:c12:4cb8:a826 with SMTP id a640c23a62f3a-c16b457b1abmr614064366b.6.1784556029502;
        Mon, 20 Jul 2026 07:00:29 -0700 (PDT)
Received: from [172.24.138.145] (dynamic-176-002-111-253.176.2.pool.telefonica.de. [176.2.111.253])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae00asm464388366b.7.2026.07.20.07.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:00:28 -0700 (PDT)
Message-ID: <9dd16bb5-7a30-4024-88a7-4a4bf47c35e8@gmail.com>
Date: Mon, 20 Jul 2026 16:00:26 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Janani Sunil <jananisunil.dev@gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: iio: adc: Add AD7768
To: David Lechner <dlechner@baylibre.com>,
 Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-1-44e1194fd96a@analog.com>
 <36df7c4f-82ea-4ed5-a4f9-3a29c75dc99a@baylibre.com>
Content-Language: en-US
In-Reply-To: <36df7c4f-82ea-4ed5-a4f9-3a29c75dc99a@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/9/26 17:43, David Lechner wrote:
> On 7/9/26 3:50 AM, Janani Sunil wrote:
>> Devicetree Bindings for AD7768-4 (4 channel) and AD7768 (8 channel)
>> simultaneous sampling ADC
>>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>> ---
>>   
>>
>> +
>> +  adi,power-mode:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    enum:
>> +      - low
>> +      - median
>> +      - fast
>> +    description:
>> +      Power mode selection.
> Unless there are pins that control this, it seems like it should be
> left up to the driver to decide how to set this.
>
> In this case, it looks like the power mode also influences sample rate
> which is normally something controlled at runtime.

Hi David,

The reason we'd like to retain power mode control is that certain ODRs 
are supported across all three power modes (low/median/fast), and the 
RMS noise and power consumption differ significantly between them at the 
same ODR.

The higher the power mode, the better the noise performance, but power 
consumption nearly doubles for every ~3 dB improvement in dynamic range. 
Silently selecting one power mode in the driver would remove a 
meaningful hardware tradeoff from the user.

We'd like to propose the following instead:
- Remove adi,power-mode from the DT as suggested.
- Expose power mode as a per-device sysfs attribute.
- in_voltage<N>_sampling_frequency_available dynamically reflects only 
the ODRs valid for the currently selected power mode.

This keeps the DT clean while still giving the user explicit control 
over the noise versus power trade off. Would this approach be acceptable?

Thanks,
Jan



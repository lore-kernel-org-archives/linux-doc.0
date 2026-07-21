Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D63E2D7393
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 01:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597976; cv=none; b=i7PkSnxxNtqke0ekPxXIj54ccOlDj1OYlRs0kR94HlbzyntimC8Agi50RMS85pD9QIw3/5VpY3irfaxxLa9D0kLp7vJKKIUJ1Gli5jXh6FIIzwT1KI/7JV9fkX+xz8nfBcOXAU7PUNxpsCLBvHFmYGrODOWfk7txpUTDF0z3UrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597976; c=relaxed/simple;
	bh=hPnnSWEXjlKB3FA+RvOH82WyYdS/53hCpV5pLhgGvPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlVFtjAb7QE8fj/RD0k+KkQNIYyBZpLvHBDlwl7zhhcNbbviWgKuNL/IGZvRJlkvAKBm6dPV1rtTWYcD5s6vepJguaEyKvD8bTkSN1xcyE5g93OG9+FrAUqwpuZKkRGK/OuPaOuYRDZ+x7Gro6gqPkqjGjrMooFgNUqn43EUZtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IADpnpBr; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IADpnpBr"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4563ac048f4so3049076fac.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 18:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784597972; x=1785202772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81HdYIHWL+Qkrx66ggqaBZ1N7F6EaLfANnJd23r1MXw=;
        b=IADpnpBrfqUMGBwCuPGl3tLJ980Aib1DOcraPa/bIzlHFaN24DGigO5ryccxwBOQQC
         CeaPChM2qsxCyYB36vCMBjNvfM9/VnawV/DII9UGnzkLnueVjTYKKc2MzHr4SkRCIv6u
         ZR0LswrfbRP4mCnaAjjG8YW8b0on7h0chC4qqRAJ5zbhyAQ/Ah6JlUcraSauJ6evWuT6
         5YKh+4vJwMxiNnFkf/9zZnwRCTwhyMFa2DbPoHzvw9jcmfq1kVjRxI4SXwYmb3xvMFBH
         BRbzbN7T5KjYmfhXDlxfUQ/LsvY01zpmZaQBR/7yXBh1pqzgtPXG85unP1cKZto61s+c
         os/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784597972; x=1785202772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81HdYIHWL+Qkrx66ggqaBZ1N7F6EaLfANnJd23r1MXw=;
        b=tUYa0L+cf6GP80i5GUUq6/BfNn2n4fxI/PEmENuN7866Pem7BRDteK+qBhzBIMQ706
         Xg8PL7kPjvwI2ItxMuSjErVYbDuX/BohzGPNsR3ADqyTBMTuO8wpofuZ+ED+tdaF/QLL
         ceqinmpHkKu90COICNPuj6I4O2GgyXw0+XTI2Tc1mjPegUVTimt8JlTaeUeR1HDyIcEQ
         cgOtDsAiFuc2/iFKn1qtsiqNFTrac3tvSti1CBIoptYATAUH7Go1wH22QDunfXWj8vfc
         1Pu9ZB/MjbPPekWaclokd2PVBL8lCzdHtOtYweR75BgJhtw92fR6HUHOLQKr1W5NhACG
         H1Dw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+glgaoWhY5wJ1wsts+3vTxX1t2IlEbAMSur8DqpSdOHfTDUbrSVLNacuWojnDnrLd578EQBs1I78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBTfA0drtfCDD9svXXiJNkZhhKcwNvpgtwWi5u1d0wKrfx3R8d
	/NwId+RvdwwGyshW2O41fIOjqDZuqkbv5NaUQFgQtw+J/3/tXyuo1Coh6jC0c9iU9fE=
X-Gm-Gg: AfdE7cnPQgEkErz/9KnmlX8LLlpXRhh0RO7iLrqpMk/miuWqA/BLrGgEI+W1kdoqt6m
	wlZAxUe+nPSrIc3EEePoNsVFl2OEk5+35trIZwdWOU+k4i9jqtAB0HIgh+L57xatTYtZBZH1E0J
	HG6T1Go677m5v/GG/wwJLx2yZYjCe4C3Fe19Pkw7dLAjGCMBGNRg+F3XX4tEZaWg9staJCVApR4
	fw3/khDVcBt5qC1Q+n+EV9iI7nu5PHooZUifsI3Ym5d75imB69azZVPVSTQQbHpiMGn8N4kxk4O
	TT1VfkmCFAvHKO3jr2d3wRN+noEZM4DoWcy1OPGOrbfUCsP84G61AxfQv2kb9Xmcd6wKxEZv3wd
	8t2FQ621s29ADCRqMIE3XPvkNgbK+7ar+x3+lF6Vf5JcpnUP77al4FKNEra7wHv/hu/NeaVTjZI
	Lrlq5u3TMtLDTyOLJpJnQK5OIgm5byONOShYL+4B9QFoSRS51jwCcN
X-Received: by 2002:a05:6808:3209:b0:4a4:a05:dc1 with SMTP id 5614622812f47-4a4d051d9d7mr10860219b6e.22.1784597972241;
        Mon, 20 Jul 2026 18:39:32 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:8ce6:b98e:1126:f7f0? ([2600:8803:e7e4:500:8ce6:b98e:1126:f7f0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3a57b04sm8639931b6e.3.2026.07.20.18.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 18:39:30 -0700 (PDT)
Message-ID: <e791f4f9-63dd-40f5-aec4-5b540bcee5ff@baylibre.com>
Date: Mon, 20 Jul 2026 20:39:28 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: iio: adc: Add AD7768
To: Janani Sunil <jananisunil.dev@gmail.com>,
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
 <9dd16bb5-7a30-4024-88a7-4a4bf47c35e8@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <9dd16bb5-7a30-4024-88a7-4a4bf47c35e8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/20/26 9:00 AM, Janani Sunil wrote:
> 
> On 7/9/26 17:43, David Lechner wrote:
>> On 7/9/26 3:50 AM, Janani Sunil wrote:
>>> Devicetree Bindings for AD7768-4 (4 channel) and AD7768 (8 channel)
>>> simultaneous sampling ADC
>>>
>>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>>> ---
>>>  
>>> +
>>> +  adi,power-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum:
>>> +      - low
>>> +      - median
>>> +      - fast
>>> +    description:
>>> +      Power mode selection.
>> Unless there are pins that control this, it seems like it should be
>> left up to the driver to decide how to set this.
>>
>> In this case, it looks like the power mode also influences sample rate
>> which is normally something controlled at runtime.

Looking at this again, there is also an MCLK divider that influences
sample rate, so sampling_frequency to power mode is not straight-forward
anyway.

> 
> Hi David,
> 
> The reason we'd like to retain power mode control is that certain ODRs are supported across all three power modes (low/median/fast), and the RMS noise and power consumption differ significantly between them at the same ODR.
> 
> The higher the power mode, the better the noise performance, but power consumption nearly doubles for every ~3 dB improvement in dynamic range. Silently selecting one power mode in the driver would remove a meaningful hardware tradeoff from the user.
> 
> We'd like to propose the following instead:
> - Remove adi,power-mode from the DT as suggested.
> - Expose power mode as a per-device sysfs attribute.
> - in_voltage<N>_sampling_frequency_available dynamically reflects only the ODRs valid for the currently selected power mode.
> 
> This keeps the DT clean while still giving the user explicit control over the noise versus power trade off. Would this approach be acceptable?
> 
> Thanks,
> Jan
> 
> 

Jonathan usually pushes back against userspace power controls. We do have
this for accelerometers, but not ADCs currently.

If we can't think of anything better, maybe we could use this. It only
has low_noise and low_power options though, so the driver would still
need to chose the best power mode of the 3 based on the other requested
parameters. E.g. always make all sampling_frequency available  and just
pick the highest power or lowest power mode that can provide that rate
based on the power_mode attribute.

I wanted to suggest maybe adding some kind of noise attribute instead,
but I'm not sure how we could do that in a way using SI units since the
value would depend on so many things (at least V_REF voltage, filter type,
temperature and even the physical input).

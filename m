Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770C82EB5A6
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513020; cv=none; b=JFkIT0UOtWmXtNJE17ZbXNCRX4udsPOl2wqMzssi84Ya7swpEkG5GN9I44aMwgWHkgMtDViVlTzCqepP4441TUD6qWGgbz7dSQOdoUIOCWUtj9XOQZeI0fd6KybNzhCO8fqU1HzoxKpozbCVVWJwyEBxhNQvo6eUmTWaVgn//qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513020; c=relaxed/simple;
	bh=Pkufvs/dVtNcEylnyG+zMMbsZpzFf1lMi69cqrzAAnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ur7RUGwAAyYMKnlNWROADMpzpoMkqyEyAtZ8u7ybB5oNQPASAJ+Er4jANrlI1hT+5Gv3WmEUpUBED0Ke6UZCryNJlDqlLKgqWZ8lkiq3wuxVR9YWUQ5aELDzCzcF3mZu3P9+w0973DQEY6T4qWZVtHVVhQnwa70SuhQWvZxSWug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=j4xWwH0l; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="j4xWwH0l"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4042fe53946so1682244fac.3
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 08:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778513017; x=1779117817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tE2qWdGKWkMukIUo028+cIjsIhIq5QNqnckPQG0zARQ=;
        b=j4xWwH0lLuw4hLTDHFs2BRPaX0SdIvFK8GT4k4b6lZbnPU9f6IrFVw04eXCiltn3ms
         LasfZnhQevnUjqegJjYbDjb8WN5HcnbO0s0mNGrC+KWbgYCLO5Bk2cFyocNjiuB0/e3d
         9QUwyKh+aFPkpCgBED2p5GSVR5wMCq2hqPOtogmKPGGaivCegkv8F+u8mvUk6ZvcLARm
         0YXtt256lYDJ64sx0kHcrxYf7iIOBpYf0L1my1iXUmpVvAshNA/gRgC6+hqHU6vog8/A
         BSTsfpPoA5PPjW0HFIiZu8sqfcNHq1ka+TjV19s83KRexwUeMMsHnwWX0Q31cgWqetsV
         idrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778513017; x=1779117817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tE2qWdGKWkMukIUo028+cIjsIhIq5QNqnckPQG0zARQ=;
        b=g9SCxjzt4hYO4CKLxvlszaEXqwwd7mB/XXbNRiyuWCrrH9fVtQ/jVtW7af5PjpRSUV
         2tK+IkqKrkUjF8W43B8AMwnjTTPiKRb4Dk1rQ9+4Vh9vBsUW6QQfE9O+5pjAfl1Tsvuf
         pl0SEGXxJW0paLFwkbMCv8kr0bTQN+X+VDotyjtuhO1jQ8xZHMzOJZgkL908sH0JxBwe
         eFShUVcnVx2Kpi33uL2zAZba9GuBPn6rkzo8Ic0y71J1JZLvlYoEcmmwtfUHGuzyK6Wf
         hT6u9efnL2JKLRpfPkioi7/d3fOOw7YGL3PZhn6hcab4nqJLzx67skZ2OhBKfNFoseat
         L8qA==
X-Forwarded-Encrypted: i=1; AFNElJ+KQLKN3+4mQJ+0jvajKZYKXwL1j8WQQ5PBiy1MG+XaE5ac0ZIMgee9f/JcTxCLkJvOkFuAFgJqE9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZKPWlN2uzYF4megVb6Wgg4hvgqAby02q8PNxNn4qyEyPc296
	CIIaW3s1wEMXZdIb8/ioXCkTG2n+dOvV58kP1UGBsrmv9qX7xqszMDOD3MK+1ZAInHY=
X-Gm-Gg: Acq92OE18Im0q+BaDO0edv26rr8cNtO4jd5f3CtYwkmDhXtdzJCkJOKm1Qu/f2vwjug
	NZ2d2PFwz4hdP+lXsUov64a014OmKa0j3RWiRbj47a9rtOh6NaLfTp9nopjkiq4eGn2bcxtJve2
	JwPK++RN9u/0YMsahSEIyvTeodBb54sVZsDB2kZJq7kcyZC2BhJhLJjUQe4Lmli5HRx87FzHUSf
	csTer0i3AgrKdV49lR6NXuoVD438zQa+6g8Ep5+K41LFILLaxbDeSUXqnl2XPFbMGECCRHqN4Th
	HcmEWQpcZJ9L/YjJZbpbHUujRHNGBF17Pqcn8+q1sd7Ao4RxDPbO2tkeawMYrbVd0yaABJXecBe
	eN0HQcoX0ri5qqzdL/RSdr/8gxnXVlYwwTg9W9M70XvLM/HBItYKLMReGvbFDxFJdpLvTHTYSiU
	v5SJ3/lksOxK9EPiSEPTlyC9Orx00540hhin0y8JglDPCb4UxTW6bVhU/i5EK+7P30wKrzvpX4j
	bRb2LiCvQ==
X-Received: by 2002:a05:6870:9113:b0:42c:259c:6c8c with SMTP id 586e51a60fabf-434f5674cd9mr17270731fac.3.1778513017221;
        Mon, 11 May 2026 08:23:37 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:591:4577:3439:3a1e? ([2600:8803:e7e4:500:591:4577:3439:3a1e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4355736f517sm10164009fac.12.2026.05.11.08.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 08:23:36 -0700 (PDT)
Message-ID: <5bce7868-feca-4c54-a14d-ad4bf4072c29@baylibre.com>
Date: Mon, 11 May 2026 10:23:35 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 10/10] docs: iio: add documentation for ad9910
 driver
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>,
 rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20260508-ad9910-iio-driver-v4-0-d26bfd20ee3d@analog.com>
 <20260508-ad9910-iio-driver-v4-10-d26bfd20ee3d@analog.com>
 <b8f9a174-f3d0-4cb8-a571-605be79165d6@baylibre.com>
 <zvulxrrvg4sf7m5pjfpfucg7yssgallfu6zi6mcyblu2qy24hn@wdzs7h77vkoz>
 <18c2eab9-c0c7-4e93-b4e8-73b18531e784@baylibre.com>
 <uphcx5zr4lmukuom75g66hp4agurty7yq6mo6ri6otrsscqfek@tn3u5jjszaoy>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <uphcx5zr4lmukuom75g66hp4agurty7yq6mo6ri6otrsscqfek@tn3u5jjszaoy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/11/26 10:02 AM, Rodrigo Alencar wrote:
> On 26/05/11 09:46AM, David Lechner wrote:
>> On 5/10/26 4:30 AM, Rodrigo Alencar wrote:
>>> On 26/05/09 06:42PM, David Lechner wrote:
>>>> On 5/8/26 12:00 PM, Rodrigo Alencar via B4 Relay wrote:
>>>>> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
>>>>>
>>>>> Add documentation for the AD9910 DDS IIO driver, which describes channels,
>>>>> DDS modes, attributes and ABI usage examples.
>>>
>>> ...
>>>
>>>>> +       must be a power of 2.
>>>>> +
>>>>> +   * - ``frequency_offset``
>>>>> +     - Hz
>>>>> +     - Base FTW to which scaled parallel data is added. Range :math:`[0, f_{SYSCLK}/2)`.
>>>>> +
>>>>> +   * - ``phase_offset``
>>>>> +     - rad
>>>>> +     - Base phase for polar modulation. Lower 8 bits of POW register.
>>>>> +       Range :math:`[0, 2\pi/256)`.
>>>>> +
>>>>> +   * - ``scale_offset``
>>>>> +     - fractional
>>>>> +     - Base amplitude for polar modulation. Lower 6 bits of ASF register.
>>>>> +       Range :math:`[0, 1/256)`.
>>>>> +
>>>>
>>>> I guess there was some discussion on these attributes. I see some of these in the
>>>> ad9832 driver in staging, but I'm guessing they are new ABI. It isn't clear to
>>>> me from the documentation here what they actually do though. I guess they are
>>>> just basic transformations on the input signal?
>>>
>>> Not sure how the ABI is not clear:
>>>
>>> 	For a channel that allows amplitude control through buffers, this
>>> 	represents the value for a base amplitude scale. The actual output
>>> 	amplitude scale is a result with the sum of this value.
>>>
>>> So yes, it is a basic transformation.
>>
>> I didn't have time to read the ABI docs yet. For scale_offset though,
>> how is that different from the existing offset attribute?
> 
> I suppose that existing offset ABI is applied to (raw * scale), mostly for
> voltage channels, here the scale_offset is an offset to the scale itself.


Ah, so a very general case would be (raw * (scale + scale_offset)) + offset

when the scale can change as a function of time and comes from an external
source.

>  
>>>
>>>>
>>>> And a practical note, they should be "frequencyscale". I don't like that it is
>>>> harder to read, but it is easier for a machine to parse.
>>>
>>> Parsers like the ones in libiio is not having problems with that.
>>>
>>>>> +Usage examples
>>>>> +^^^^^^^^^^^^^^
>>>>> +
>>>>> +Set parallel port frequency modulation with a scale of 16 and a 50 MHz
>>>>> +offset:
>>>>> +
>>>>> +.. code-block:: bash
>>>>> +
>>>>> +  echo 16 > /sys/bus/iio/devices/iio:device0/out_altvoltage113_frequency_scale
>>>>> +  echo 50000000 > /sys/bus/iio/devices/iio:device0/out_altvoltage113_frequency_offset
>>>>> +
>>>>> +Digital ramp generator (DRG)
>>>>> +----------------------------
>>>>> +
>>>>> +The DRG produces linear frequency, phase or amplitude sweeps using dedicated
>>>>> +hardware. It is controlled through three channels: a parent control channel
>>>>> +(``digital_ramp_generator``) and two child ramp channels
>>>>> +(``digital_ramp_up``, ``digital_ramp_down``). DRG destination is set when
>>>>> +ramp attributes are written, i.e. writing to ``frequency`` or ``frequency_roc``
>>>>> +sets the destination to frequency.
>>>>
>>>> Would it be better to say that the destination is set when the the
>>>> value is non-zero? Otherwise, how would one change the destination
>>>> once set?
>>>
>>> Destination is only one, so you just need to write phase or phase_roc, if you want
>>> to target phase then. Does that not sound intuitive?
>>
>> I was thinking about if you needed to change the configuration.
>> If you set it to phase, then want to change it to frequency, how
>> could you do that if 0 is a valid value for phase?
>>
>> Also how could you know which is selected by reading back the
>> values if 0 is a valid value?
> 
> This is where Jonathan raised some concerns, so it is a good oportunity for you
> to provide your inputs! Right now, I am returning -EBUSY on read of an attribute
> where its destination is not selected. As pointed out, the destination selection
> is happening when writting to the attribute. In the previous patch, Jonathan
> suggested frequency_active, phase_active and scale_active to track mode priority,
> and It could be leveraged here for DRG destination selection. I havent gone for
> that because I was not willing to add that to all the channels given that it is
> mostly used for debugging, so I added frequency_source, phase_source and
> amplitude_source to debugfs instead.

The "last write wins" with the others changing to EBUSY makes more sense to
me now. If the docs said that, I missed it. Otherwise, that would be a helpful
thing to add to the docs here.

> 
> Destination selection for RAM mode is firmware based at this point.

Seems reasonable.

> Destination selection for Parallel mode is still not clear... could use
> those *_active attributes or separate channels.

Since there are _offset attributes proposed for parallel input already,
could we just make it the same where you have to write one of those
attributes?

> 
>>>
>>> Zero is a valid value to be written.
>>>
>>>>
> 


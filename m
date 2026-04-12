Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35AB533D6
	for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 18:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776019544; cv=none; b=ZcsQY01Lt9hO+t9CpBtn6VN0lGAo3EEKxBiB7gMs/WHMD1wMR13UADX+rt1lKPaaGNT7/zerJ8iqGPhxZGWVFLbVMs+yFBL6ZQY2OZbZcabYqpnNx4gtMaCms3fQyWjB1QQx0+e1pAZ0ytbQVQaLtuyQITRYHYpamnrZplxtlTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776019544; c=relaxed/simple;
	bh=oQzRgQ7NQPcP1cTNgd4z06Z6ADUV1qjY2dP5A5oq9kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTKldihTXB0XKVD1jX3CDJz8o5qv/FSnIysWQQzNDpzR10szSWFRW0JVPNPrY6tL9Im11yutnXCdPAkjoQOX61BzYcXwmSqGrGmVkGr51RkoUm+u1M0L4iMk3oWATL1UyIqFii3DUEXkoHoMcZMn5z91c+HezRBcq4M4Hx4H2ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=OGW9U3WJ; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="OGW9U3WJ"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-47018d34159so2701184b6e.2
        for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 11:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776019542; x=1776624342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M+ZO6rZv9NGV1Yj2nIfY3XI669Ebfty85k3Q8tYt5QY=;
        b=OGW9U3WJZDl6ektiEuFCczMHCtc+ME8EUqGijmbXrA0QcFfW72Wpq1CLFm6iX7Is81
         tSj5PvDkSca2dGxoAYLyzNlePB/wldPvADeBtfSYw6PA2Xt/lqvF3kg52RZmALMLxCWs
         D9znPT2DUorWB2GT7c5s5YBOoNaivA6zAJmG57f7295gYFMlSW2Mb4j1MgOGYpm6qu2p
         8O0zkfXdhX40Do9NSgf4bBItWgswnh5B129ftmAHDssNNc1yZGNNsiFhvTLIRK3utzIG
         IZRTWt0gRFF850mfyHPVMyCqpCBY8lk9xT9H/RRfTLkzS6z/cFvWD8W5QRiaGVVPGIsF
         iFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776019542; x=1776624342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+ZO6rZv9NGV1Yj2nIfY3XI669Ebfty85k3Q8tYt5QY=;
        b=Fhfm84wcOYPpQOu7tKSDVF8QKeCfPDpVrEqOPHooW7JXeNlJfhlMGVHp1s7ddCGwZ8
         +ba/YhGz3MEN2135IXvU/+qCUiywQjQ4vzDAKAuM8jkUsjU1+K+E6ebVfNlLiypu2b/S
         Biu26uR7AmpsQLCRjIjxJ02sOEXJGNooN88hh8JMp36OZCUURMcNS2kSpqiqz7guVoAz
         ZdLizYTzKkU0vZd2UNootaCKOpDjfBx/JrJgM/r8E+4H56ogsduiK6FeFK3yPjcVxfWd
         W4MwuBcCuJIBGrc9FCkGQp2Spt/oAkyO+Aq7mfWSZAB/YDWRMOwRiwprcnTRb7LRlwYp
         EWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1w6IqSuMUWoeNuA1E/2r8xkOZp7sg2lXasxV/F5GchfOrcv9rVT1axH4zVKpm5GuEEKYVKKeG59Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0hmmtfu6NbSUgIwLQA2FQqfid8udgEbMuRT/sjDk82n5Lynrx
	DN3kaO7fzRBX+ulMPchuhSEBXKtPAdqbc8KPQIkI7+pDdMoQxh2/X50fukpjjED5Xpo=
X-Gm-Gg: AeBDieuEn4k/9m9LnTpjDeibWnHGN8cJ5liAgrb233JEEjaNiu2fegHsLOPJbOimtsM
	Ggqtjmop2BqptArT494/mWJFysPaFMHUs4iEYJ5yP/MOnPXtyxvxHpPYipJH/tF1NiR2zJbf/s+
	591cvk6XtrUZaoSL+S/9DqfAqbwilMiwI03yk/dg9Q730sWvzFxTVyYFk3/DvrYblq15AKNTs2O
	nJEiM6K5K6Et6VKV3oeqKfXG/QozNnaI0CODD37Zo9tso55SJgwg7I9ummPL/J4mR8j/PJYl/f1
	mrLRQFhPr1lUQhljwNNGzdmQhDbTBFMYlY90tyz/Oj10BZHKGM1/SwFa5RWbyceZUQFU1elCvJi
	30pAO4F5LEyxQqyZgbjMn08hvcbnnBKmevxRuf2gmp9hgCHj0glCEv1kfaDEb7g74E2dUnYY4jK
	ZbraRdFbsYpizRd/GZaKAoEDEXzWmpAFb2hI1HgdyAzXOgq0YNOvSyTPH0RtwAHBtN7+HSBJV42
	g==
X-Received: by 2002:a05:6808:4f49:b0:45e:b623:f9b3 with SMTP id 5614622812f47-4789f7074ddmr5377663b6e.42.1776019541977;
        Sun, 12 Apr 2026 11:45:41 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:5c13:5a8e:1b91:8035? ([2600:8803:e7e4:500:5c13:5a8e:1b91:8035])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-478a3666dbfsm4831509b6e.15.2026.04.12.11.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 11:45:40 -0700 (PDT)
Message-ID: <801badd3-d10d-4bae-b3e1-73aa1edff47c@baylibre.com>
Date: Sun, 12 Apr 2026 13:45:40 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 8/9] Documentation: ABI: testing: add docs for
 ad9910 sysfs entries
To: Jonathan Cameron <jic23@kernel.org>,
 Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260318-ad9910-iio-driver-v2-0-e79f93becf11@analog.com>
 <20260318-ad9910-iio-driver-v2-8-e79f93becf11@analog.com>
 <20260322172257.1681de69@jic23-huawei>
 <mtqjtmsysz6ywvybeut6qzhee2o4qedwgvr5isbn4um7bwhjbe@sg2b7hwlszwd>
 <20260412155115.2f7a83bf@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260412155115.2f7a83bf@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/12/26 9:51 AM, Jonathan Cameron wrote:
> On Mon, 23 Mar 2026 11:36:08 +0000
> Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> 
>> On 26/03/22 05:22PM, Jonathan Cameron wrote:
>>> On Wed, 18 Mar 2026 17:56:08 +0000
>>> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
>>>   
>>>> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
>>>>
>>>> Add ABI documentation file for the DDS AD9910 with sysfs entries to
>>>> control Parallel Port, Digital Ramp Generator, RAM and OSK parameters.
>>>>
>>>> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
>>>> ---  
>>
...

>>>   
>>>> +		  - "ramp_down": No-dwell low; the ramp resets to upper
>>>> +		    limit upon reaching the lower limit.
>>>> +		  - "ramp_up": No-dwell high; the ramp resets to lower
>>>> +		    limit upon reaching the upper limit.
>>>> +		  - "bidirectional_continuous": Both no-dwell high and low;
>>>> +		    the ramp continuously sweeps without dwelling.  
>>>
>>> Triangle wave?  bidirectional continuous is a rather confusing term so maybe
>>> we should rethink this one.  
>>
>> Mostly yes, but not only that. Sawtooth can be achieved as well by changing
>> the step sizes, also other weird patterns can be achieved by toggling DRCTL pin.
> 
> Sawtooth is kind of a special triangle wave with one very steep side.
> Wikipedia even has: "It can also be considered the extreme case of an asymmetric triangle wave"
> https://en.wikipedia.org/wiki/Sawtooth_wave
> 
>> This mode is the most useful when one does not have an FPGA and want to save
>> resources on controlling the DRCTL pin. That mode name comes from the datasheet,
>> so I suppose it was fine.
> 
> Let us see if we can get more opinions on this.  Whilst I can see the logic of
> the datasheet naming, it's a bit obscure.
> 
It is the same as ramp_up and ramp_down other than what happens when it hits
the limit? If so, I would call it ramp_up_down.


Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AED5199223
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741617110; cv=none; b=r210a92nnXFg5vqSE8PQEXTOVziYsf4dKXxGLPHvXTacBIpBhPOkOuq6SqqU6rnT8y0FxtZBySLPwG8cexdAjxLuX/ANV54wOSJOQ5DaIMD+A3mzwCVnh4ahbqJe6cwv7MBdAgECvd81gZ/X7CGSJLYABC75R7N3YV1R/i+mMQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741617110; c=relaxed/simple;
	bh=Ps//DGpFqXWp3GsLNV4yd8lxmyS5d53siUwV+54hi8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVuwoNbMJKr9LtH1A6exuzVU7R3xMxOMqXQrVKKAoCyXF/UgI9YRFGchSRvNmlRnEXMWJ3E38/jddF/VF9PClPH0pw+y/wXa0Xpr9M+3bC16OyVr+Qz2+iH2Xeuj1ONxFBF0jS8z0vvmLDbCS/J/nOhHUsGiBtdR6HB9che2dqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zjZDxRjw; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zjZDxRjw"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72726a65cbaso2164488a34.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 07:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741617107; x=1742221907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QnKDL7IGSLQdY1Ps1imHuBBiZbH4iwSQV6FmwECIlQg=;
        b=zjZDxRjwQKuwZjY/0xjdZUUGpRd3s6FJgyUWIGiXdAV+d9gW/VmDFDdghG5sEG4a8t
         0WePsyHb+4ZDP0MruABVypM8kWu2hB4E+1mWIaOeDuv+2fTBIqd7UhXZvr1NpU8hGP0Q
         nCmbC9AU+LButRlxHyVJX9ucMPz61jUM+GEp0UDOiQYAjda/HLL+FYE1uP0fmByXBI/V
         MT3cD4ZqQiBEhtyqf7Q3PFyZhYPR0AREZ3E60GsqMRcIt59hxBRwBj/92oeVm+FgwmHc
         9B2Eu6bIGZkQu6Vbq2VdIfL4+6WrWlVlQok0fiermsFzXcmFDpqt+Wot0cXgWSC1Ebbh
         oDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741617107; x=1742221907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnKDL7IGSLQdY1Ps1imHuBBiZbH4iwSQV6FmwECIlQg=;
        b=EOBjJ38w1Y0p1P/XBIbRqgvPYThp7U5ekJyCfIvdWPElF0XdL2Ose3+h2orC2T33dV
         XMH3n8CoyscX7YIIEnYAjRir7WVYlUWSn+rBT76DBPsNs7kXeUFMPQyWPUOZvzubK2yt
         7XTWntjBt28HpEuvgiSMApJtDc3jwit7KGyQs3VOa1RIuYSLulMDT4jP3nRYecuol+YR
         v9I2AQL72UTNSnCintYN+K1+zILKl7+9lo6jwFfQlSyqABXvb7t4ZUoTVbf1Sj36CjhM
         wXdgSX0TuNuxfUZizAZMnMj+mx6wKRtLwUqeHCPmcO/qtM1eivmoCNfp43WWLYhASYvD
         z9+g==
X-Forwarded-Encrypted: i=1; AJvYcCX6sYs8S/4MUQM6Xmh69aYzX4yCbTKDOAU6lUp+QB0MfEEhkA8mxHYtQqd88OXGlchbWqd0qArZXAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnusmGqnHkaNk8nkrWd9pWaYqVWNBWUTpWE+MQfx52U6SoaLte
	hTykXQ3dHaa3MZeFnyoGaKhu7iWPsEXfYvqc+s1JC3Yc5ecG3eAgjOfckaChABE=
X-Gm-Gg: ASbGncvwYWlSO4XnHjyE2Od5INPHTa1NpbnEhBsDk6dcTkJ82eb4UFpOEZpL1w0z3mg
	2VpyVZlR/tYBOphGfPpliggAzS5/cG/QHV4MFs0p/q4rl+zwIgiaNs1hhFeFoQTwLnK7JDfO7LB
	hSeaKHpzVHev+bxCA4OAR5ZzrXar/GHX5pyB0prWscXlXBHpDR9k/cN8IT3cduy9QyACo+9hcde
	gzhghIEQtCdPe/gLy7nJyQ7jjyu+tnT4bcxf2RyONU5IFKAZ0Y/iOmoNy6r8JrtEm3/VACZDTCV
	hSxFRxGew1wQYSNJu44c8qWC8Jo0iwDB9xQt4pqE0v1Twha7rlc3abYGWnf4UcC7tTVLvQIbwPi
	zOi27BA==
X-Google-Smtp-Source: AGHT+IFc5FQqx7D/Eko7oVMCmMY7qbffM3dUKH8YN9GD9Mq5nGldBPuykkjjjWS+hnzU6NmCsbTHdw==
X-Received: by 2002:a05:6830:6e05:b0:72b:81a8:dea5 with SMTP id 46e09a7af769-72b81a8e17bmr2820014a34.17.1741617107592;
        Mon, 10 Mar 2025 07:31:47 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72b7a3a2385sm1014002a34.57.2025.03.10.07.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 07:31:47 -0700 (PDT)
Message-ID: <6ca1eafd-276d-421b-8d35-bd3e363803d1@baylibre.com>
Date: Mon, 10 Mar 2025 09:31:45 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] docs: iio: new docs for ad4052 driver
To: Jorge Marques <gastmaier@gmail.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250306-iio-driver-ad4052-v1-0-2badad30116c@analog.com>
 <20250306-iio-driver-ad4052-v1-3-2badad30116c@analog.com>
 <CAMknhBFiZZUtCkTjQ=AVSgwqe=wCkMnqAmaTqvW_X6fm1OKuYA@mail.gmail.com>
 <e3p2r2fet2spkrxv7x76gunlivrp3vng22wktz4fkww5nkckt7@jpgne4uerr3c>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <e3p2r2fet2spkrxv7x76gunlivrp3vng22wktz4fkww5nkckt7@jpgne4uerr3c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/9/25 3:49 PM, Jorge Marques wrote:
>>> +.. list-table:: Driver attributes
>>> +   :header-rows: 1
>>> +
>>> +   * - Attribute
>>> +     - Description
>>> +   * - ``in_voltage0_raw``
>>> +     - Raw ADC voltage value
>>> +   * - ``in_voltage0_oversampling_ratio``
>>> +     - Enable the device's burst averaging mode to over sample using
>>> +       the internal sample rate.
>>> +   * - ``in_voltage0_oversampling_ratio_available``
>>> +     - List of available oversampling values. Value 0 disable the burst
>>> +       averaging mode.
>>> +   * - ``sample_rate``
>>> +     - Device internal sample rate used in the burst averaging mode.
>>> +   * - ``sample_rate_available``
>>> +     - List of available sample rates.
>>
>> Why not using the standard sampling_frequency[_available] attributes?
> Because sampling_frequency is the sampling frequency for the pwm trigger
> during buffer readings.
> sample_rate is the internal device clock used during monitor and burst
> averaging modes.

I haven't done a chips with a monitor mode yet where we aren't reading
the samples, so hopefully Jonathan will chime in here on the usual way
to handle that.

For the burst averaging mode, I understand the need for a separate attribute
now. I would suggest to call this the conversion_frequency rather than
sampling_rate since IIO already defines "sampling" to be the data read
from the chip to Linux even if it is an averaged value, it still counts
as one sample.

> 
>>> +
>>> +Threshold events
>>> +================
>>> +
>>> +The ADC supports a monitoring mode to raise threshold events.
>>> +The driver supports a single interrupt for both rising and falling
>>> +readings.
>>> +
>>> +During monitor mode, the device is busy since other transactions
>>> +require to put the device in configuration mode first.
>>
>> This isn't so clear to me. Is this saying that events do not work
>> while doing a buffered read? Do you need to do need to read the
>> in_voltage0_raw input to trigger an event?
>>
> No, the device monitor mode and trigger mode autonomously samples using the
> internal clock set with the sample rate property.
> I rephrased that to:
> 
>  The feature is enabled/disabled by setting ``thresh_either_en``.
>  During monitor mode, the device continuously operate in autonomous mode until
>  put back in configuration mode, due to this, the device returns busy until the
>  feature is disabled.

This is better, thanks.

> 
> The reasoning is that during configuration mode no ADC
> conversion is done, including if the previous mode was autonomous.
> If instead of return busy the driver hided this and resumed monitor mode
> after the access, a hidden (to the user) monitoring down-time would and
> thresholds crossings could be lost, undermining the feature.
> 
>>> +SPI offload support
>>> +===================
>>> +
>>> +To be able to achieve the maximum sample rate, the driver can be used with the
>>> +`AXI SPI Engine`_ to provide SPI offload support.
>>> +
>>> +.. _AXI SPI Engine: http://analogdevicesinc.github.io/hdl/projects/ad4052_ardz/index.html
>>
>> This diagram show a PWM connected to the CNV pin on the ADC, but I
>> didn't see a pwms property in the DT bindings to describe this.
>>
> It is not clear to me where the pwm property should be in the DT
> bindings, since the PWM node now belongs to the offload-capable SPI controller.

If the PWM output is connected to the CNV pin of the ADC, then the PWM
consumer property belongs in the ADC devicetree node.

If the PWM output is connected directly to the SPI offload trigger input
then then it should use the trigger-sources bindings in the SPI controller.

From the diagram in the link you gave, it seems clear to me that the
PWM is connected to the CNV pin on the ADC and GP1 is connected to the
SPI offload trigger input on the SPI controller.

So the ADC node gets pwms and #trigger-source-cells properties and the
SPI controller gets a trigger-sources property that is a phandle to the
ADC node.

> 
>> I didn't have time to read the full datasheet or look at the driver
>> code yet, but can do that next week.
> Ok, thank you for the review
> 
> Jorge


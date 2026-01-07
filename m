Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7100A331A44
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799266; cv=none; b=iQg86SvQqQw4H1CVkQNN/Kt+M8FCMGTHwdCuSew5Ou87/ep5/lcMCCBxoMNugY5Ho1TzkX1v2B8HP/Y3hT2uWKe3/TntBQlHpPSlrfgaMOylaXmjb0XCG+egdO2bh2hx/qhIpqL1ZMivznokBb4ONZoDTqTwt+a3B/HNaW6hD7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799266; c=relaxed/simple;
	bh=eXuXM2LfKvUBPj7bC+kcYrRbVy9Q6GzWBRQJOVYcmlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvU0DdH2ShFkxPWZUHRRyx+RpgfVXVCMm5H+Qwpx+vglgWYhY4TOGd6hQt6VazpqxqTGi9lZC2/gyVjTt22x630Z8Ee0Ziq9j3++hcBuM28WYz3ihHMlqTJK0RhP5gEkdbx4NMUtriThfikS88Lc6v3FzGJp/Gvgf3UyqVChW3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNhStM+5; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNhStM+5"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-477632b0621so13616355e9.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767799261; x=1768404061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hpUPZ5RhmCpDT+jo0BaREdmS2zyMNKBTJDPDa+mSTNU=;
        b=GNhStM+5OyFTPska6OfoPImQpoDNFLQu6JWlomHePHnnA3/G+uOvktvTYp7yaFuLe1
         D1XvU6GXkwD9DOtpXWS0Qms2D9X03gLEUKcZz650EWGG8mm9ys18lL/pbJOoRGKroSQ5
         mOI+Ln1LYELTbvXFaFtilqHI8gFVrUhDvp0zHNliG6RtwwYvIGzyxzoN0oJ24QtkJAjC
         T8pRTFf00/W3enoAq7JYSzQtIjDEshT/UXd6wAn9dEY73BNzRl7ApumHPQ2RhSfXvLwk
         6bLBdPM2IxmX+eGujhW8CXxbMH73+B3E1g773tcWxtH01g82gds1abakw0PhTwdiBFM8
         nabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799261; x=1768404061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpUPZ5RhmCpDT+jo0BaREdmS2zyMNKBTJDPDa+mSTNU=;
        b=OuWG72PiyCWCw4gTkf1jNzIw07mHeeEtIXySIRcPEjOCScfYWkJR2stwyYT5Z6QkKV
         ChlPPCgx0OP4nTdDNdjnjYJBtSE7fX6Dd2vq5nzof9ksgQFWeuHJjUOx393UIGxC0/SD
         3lh/dn2hAbqAHPTD5G8lDFcRhnMEB+Ft9tq94MXtnRyaipY3WPSLJARABG85z18UEX1a
         W+kDIMmL5qBdbECok+ug2uxMvEHB3ZrX7QWlZdyWWODp2c1tW56/g3DFpMQi2ypJF9hl
         BbUZbOQwOeEWijRcKJtymft8b+rdd0ggiW4kMiE05HfQde2pnEWLjExYkRMEAF/LJe5v
         UwYg==
X-Forwarded-Encrypted: i=1; AJvYcCUBYrsnlrEL1GzwET/rH6ntYN5hGoDFET+UldO+Vz3jHUabVZ3E0ch5+hGk0l/twa8kEM2kIz/T9Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGr0ORMsiPA8yUh2wTLUeOGnMkYrgfjJvioIilmIvNq8CiZR4M
	MLcb3s4gZenVAY5s+cyxRltyqQcd4YsEI172vJqoa4MkF8+thFJWI0dU
X-Gm-Gg: AY/fxX7Q1E5qGEY9mPZQ15XWDmmi0boJXww+VsWV9aFLR6NOpJ8qoCMY/9XZqGXG/XB
	iqLdSLzyFqCowpty43zLciy0kBQNYOcJ28DcI+kY6HjQe5w6gvZQVWjVRgTA46lYpSYafv2t46b
	eqUWU8hgCD/YD552D2gGBVjLP+sTsw1X4wxZv3qkCk6inwLZG3n7R7+nZmqsph37WdwrquDxivz
	q3EJknIMgO3ShSH/nLJwHMmYb42BpkwdjkydQJOcvZEYdDgse8e3rLeYMevPM1kHhuDyMVG8DXR
	grKIUAvbcnvIi5OXa+ytGHDAUh8PY3P3LHP+yfYpCtx2389SfTfSmXMr/DSoHJcIe8sxNrGdJNC
	c62n6wsySN8z0d5mcK6SUEdAp9JvHyuBzf0Gci7KYyuRUsUFWxm/LRx/quD+EfJXQ5vdvdb5DnX
	tD9IFwOvY4UQFxGT8=
X-Google-Smtp-Source: AGHT+IFN3tHCepgfCw11GoExlGSkTzE8/w3l0cvAFbX3GwK84QP3RK+c6Ndkf0qCwv1hl4a7XEeZvA==
X-Received: by 2002:a05:600c:46c4:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-47d84b18ef7mr37281035e9.10.1767799260961;
        Wed, 07 Jan 2026 07:21:00 -0800 (PST)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636e588sm17062955e9.0.2026.01.07.07.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:21:00 -0800 (PST)
Message-ID: <05379c1e-9114-494e-b7c7-c95243049197@gmail.com>
Date: Wed, 7 Jan 2026 16:20:56 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] docs: iio: Add documentation for MAX22007 driver
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 jan.sun97@gmail.com, gastmaier@gmail.com
References: <20251219-max22007-dev-v1-0-242da2c2b868@analog.com>
 <20251219-max22007-dev-v1-2-242da2c2b868@analog.com>
 <20251219164751.000071a1@huawei.com>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <20251219164751.000071a1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Johnathan,

Thank you for getting back to me.

On 12/19/25 17:47, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 16:31:16 +0100
> Janani Sunil <janani.sunil@analog.com> wrote:
>
>> Add documentation for MAX22007 driver which describes how the user
>> can access the driver using dtoverlays
>>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> Hi Janani,
>
> We've recently had a few comments on whether driver specific docs add value
> (for particular drivers, sometimes they definitely do!).  From what I'm
> seeing here, I'm not thinking this one needs a document.  Not most drivers
> don't have such a file because they make use of standard ABI that is well
> documented.  DT stuff always belongs in the dt-binding rather than these
> files.  With both those elements gone there isn't much value to this file.
> So I'd drop it.  We can easily add a file if something complex shows up
> in later patches, that justifies this.
>
> Thanks,
>
> Jonathan


I agree that this driver does not need a specific document. Will drop it.

>
>> ---
>>   Documentation/iio/index.rst    |   1 +
>>   Documentation/iio/max22007.rst | 145 +++++++++++++++++++++++++++++++++++++++++
>>   MAINTAINERS                    |   1 +
>>   3 files changed, 147 insertions(+)
>>
>> diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
>> index 315ae37d6fd4..7601bc2882e7 100644
>> --- a/Documentation/iio/index.rst
>> +++ b/Documentation/iio/index.rst
>> @@ -37,4 +37,5 @@ Industrial I/O Kernel Drivers
>>      adxl345
>>      bno055
>>      ep93xx_adc
>> +   max22007
>>      opt4060
>> diff --git a/Documentation/iio/max22007.rst b/Documentation/iio/max22007.rst
>> new file mode 100644
>> index 000000000000..e04c563f1fd0
>> --- /dev/null
>> +++ b/Documentation/iio/max22007.rst
>> @@ -0,0 +1,145 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +===============
>> +MAX22007 driver
>> +===============
>> +
>> +Device driver for Analog Devices Inc. MAX22007 quad-channel industrial DAC.
>> +The module name is ``max22007``.
>> +
>> +Supported devices
>> +=================
>> +
>> +* `MAX22007 <https://www.analog.com/en/products/max22007.html>`_
>> +
>> +Wiring connections
>> +==================
>> +
>> +The MAX22007 uses a standard SPI interface.
> I'd not bother with this section.  Most SPI devices after all use
> the standard interface, so we can document this by not documenting anything
> else :)
>
>> +
>> +Device Tree Configuration
>> +=========================
> Anything here should be in the dt-binding. As such this section isn't useful.
>
>> +
>> +The device supports both global and per-channel configuration through device tree.
>> +
>> +Global Properties:
>> +
>> +* ``reset-gpios``: GPIO pin for hardware reset (optional, falls back to
>> +  software reset if not specified)
>> +* ``vdd-supply``: Low-Voltage Power Supply from +2.7V to +5.5V (optional)
>> +* ``hvdd-supply``: Positive High-Voltage Power Supply from +8V to (HVSS +24V)
>> +  for the Output Channels (optional)
>> +* ``hvss-supply``: Negative High-Voltage Power Supply from -2V to 0V for the
>> +  Output Channels (optional)
>> +
>> +Per-channel properties:
>> +
>> +* ``adi,type``: Specify the channel output type - must be either "voltage" or "current" (mandatory)
>> +
>> +Note: The driver operates in transparent mode (immediate register-to-output updates).
>> +Channel mode is determined by the ``adi,type`` property:
>> +
>> +* ``adi,type = "current"``: the channel operates in current mode
>> +* ``adi,type = "voltage"``: the channel operates in voltage mode
>> +
>> +Device attributes
>> +=================
>> +
>> +The MAX22007 driver provides IIO DAC interfaces that vary based on the
>> +configured channel mode. Each channel appears as a separate IIO device
>> +attribute:
>> +
>> +* ``out_voltage_raw`` (voltage mode channels)
>> +* ``out_current_raw`` (current mode channels)
>> +* ``out_voltage_scale`` / ``out_current_scale`` (channel scaling factors)
>> +* ``out_voltage_powerdown`` / ``out_current_powerdown`` (channel power control)
>> +
>> +The driver automatically configures the IIO channel type based on the configured
>> +channel mode from device tree.
> This bit feels very standard and so not in need of extra documentation.
>
>> +
>> +Power Mode Control
>> +==================
>> +
>> +Each channel provides standard IIO ``powerdown`` attributes for runtime power
>> +control:
>> +
>> +* Write ``1`` to power down (disable) the channel output
>> +* Write ``0`` to power up (enable) the channel output
>> +* Read the attribute to get the current power state (1=powered down, 0=powered up)
>> +
>> +This allows individual channels to be powered on/off independently for power
>> +management and safety purposes.
> Likewise, this is very standard.
>
>> +
>> +Usage Examples
>> +==============
>> +
>> +Setting DAC output values:
>> +
>> +.. code-block:: bash
>> +
>> +   # Set channel 0 (voltage mode) to raw value 655 (≈2V)
>> +   # Output is updated immediately in transparent mode
>> +   echo 655 > /sys/bus/iio/devices/iio:deviceX/out_voltage0_raw
>> +
>> +   # Set channel 1 (current mode)
>> +   # Output is updated immediately in transparent mode
>> +   echo 1024 > /sys/bus/iio/devices/iio:deviceX/out_current1_raw
>> +
>> +Controlling channel power modes:
>> +
>> +.. code-block:: bash
>> +
>> +   # Enable channel 0 (power up)
>> +   echo 0 > /sys/bus/iio/devices/iio:deviceX/out_voltage0_powerdown
>> +
>> +   # Disable channel 1 (power down)
>> +   echo 1 > /sys/bus/iio/devices/iio:deviceX/out_current1_powerdown
>> +
>> +   # Check current power state (0=powered up, 1=powered down)
>> +   cat /sys/bus/iio/devices/iio:deviceX/out_voltage0_powerdown
>> +
>> +Reading channel values and scale factors:
>> +
>> +.. code-block:: bash
>> +
>> +   # Read raw DAC value
>> +   cat /sys/bus/iio/devices/iio:deviceX/out_voltage0_raw
>> +
>> +   # Read scale factor (volts per LSB)
>> +   cat /sys/bus/iio/devices/iio:deviceX/out_voltage0_scale
>> +
>> +Check available channels:
>> +
>> +.. code-block:: bash
>> +
>> +   ls /sys/bus/iio/devices/iio:deviceX/out_*_raw
>> +
>> +Scale Calculations
>> +==================
>> +
>> +The driver provides accurate scale factors based on the hardware configuration:
> This information doesn't need to be provided explicitly.  Anyone who
> wonders in detail about it can check the driver. For most users the fact
> it obeys the standard ABI rules is eough.
>
>> +
>> +**Voltage Mode:**
>> +
>> +- Scale = (5 × 2.5V) / 4096 = 0.003051757 V per LSB
>> +- Range: 0V to 12.5V over 12-bit (0-4095)
>> +- Formula: Output = Raw_Value × Scale
>> +
>> +**Current Mode:**
>> +
>> +- Scale = (2.5V / (2 × 50Ω)) / 4096 = 0.000006103515625 A per LSB
>> +- Range: 0A to 0.025A over 12-bit (0-4095)
>> +- Formula: Output = Raw_Value × Scale
>> +
>> +Driver Architecture
>> +===================
>> +
>> +The driver implements:
>> +
>> +* **CRC8 Error Checking**: Always-enabled CRC8 for SPI data integrity
>> +* **Channel Configuration**: Supports per-channel mode and power configuration
>> +
>> +Channel configuration (voltage/current mode) is set via the ``adi,type``
>> +device tree property and cannot be changed dynamically The driver requires
>> +proper device tree configuration with mandatory ``adi,type`` property for each
>> +channel.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e1addbd21562..6561455732c9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1599,6 +1599,7 @@ L:	linux-iio@vger.kernel.org
>>   S:	Supported
>>   W:	https://ez.analog.com/linux-software-drivers
>>   F:	Documentation/devicetree/bindings/iio/dac/adi,max22007.yaml
>> +F:	Documentation/iio/max22007.rst
>>   
>>   ANALOG DEVICES INC ADA4250 DRIVER
>>   M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
>>

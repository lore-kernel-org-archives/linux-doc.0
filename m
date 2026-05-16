Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C997392C56
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 23:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778972977; cv=none; b=oSf8GNHGFWZWZZjOhz9jIoogZn90NWMUUBdj95K9+ZOBFQ5Z+tostxxsk3gwb/RrflSgYfcCKvG+FT8xoMfeBkln8Y/E7saDK45j4TXA4x0Rco205zoChQSsbw4eS7534gBOJ/23+D1I4NCHHAKQpWYfwcftok/qiFRCQ9PUKvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778972977; c=relaxed/simple;
	bh=jM9P4tLfIF8MeGuI1VXJ2SJvpBLazhgAXkZYS1qSi8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzdDLNct3+NqvMLJ3QkcVZlceCm4iPOf1BIHIjwrTa74LjUqB+/qR2gRHO6XTk1kcwX42U+KbA1TGh7H+ZkdzxYn+joPAi1l/rVmyPDAB0TtlQy7JceVdm52/kEskAGG0SMkQWOJpgmTe3Wsj7tLhVUFVbymO8Mt2u7I2iWgVz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ib4Sy1l3; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ib4Sy1l3"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-837b39eb078so738159b3a.2
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 16:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778972974; x=1779577774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cBfXIYldpHcgRD4I6rHdSNL+xKkkUEyUH1UQFq6ffjw=;
        b=ib4Sy1l3y56lF59UbtcoepMWSFCgwGd5FprrZ0DwixOW2ZqT5Ie4QUAerChYZ/+OSI
         AB1ATs7kweM/v0JrUExCRvIdEFMO0FaEiwo8N2l70l+3lqAy16vjhj/RpKcTmh3f65jy
         DZs7YPniMnC6L9wS7MOPIzHc8mdZyYUvtTIBWGd0odtpjxRoxziNPwydctHfYhPyDA8k
         siDJMZD43eE8DK3P7CysN5/ogIAf6iH0ZQEXURAAXbFWfpz6lMLR/vwk9qC97HeUJrIT
         V9IIBpqKoGdiBCzv23ppwsjkDLDsoN/p1mfSrPBS1OhwU7QKnX3XF7NrM3RSKUEiYRk1
         msJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778972974; x=1779577774;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBfXIYldpHcgRD4I6rHdSNL+xKkkUEyUH1UQFq6ffjw=;
        b=oIRwFgJA2isosLWdVU7j2l0qGgdWWWvoZNYkazDzr4Gh9rEDWBU3piEdLF3d3WU3Zq
         Yo9+6JfybFZSu1WHNja5O2NnW5IvATHCYj/2yUdOL4FfHAxb0OBHqW7Wt0f/xs4f9RYG
         tpzntIQaRrIGXzSIJjvaPl9mueUve0HT1gDer2i9iFN2VjFtX7Rr8Pa+r1YACJ4LNCBv
         pfZ3IDR4ivrgHxwWjhLefcd4UkVxhpcVsJhOz1CWnzcSRszqRLePw0Zb7i0EwqoEkG9m
         86YXYy/hLYNPQzxpD1EcEdODAhRJJ21Tz2GoWkqYViht9rxqHkeM7Io3ZY0JEcAW/Kgf
         DHYw==
X-Forwarded-Encrypted: i=1; AFNElJ8IsvYNRdgsjoDfegLCxlzghsc3e3HuWnw3Xi893cmvNolobqJjsulBMBDUDPn1KfwC/VGyFkrkBWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu/F2CFn3hRJqVVsc0A2x1A3B154nm7mpJVOH857dnYS6a08H9
	jWtp8o94m0LlKV+Wa0oyigK5ZmzPzCEUl3vqdYgRjuITkKqk9xcd0Uiw
X-Gm-Gg: Acq92OHEmVvOdP1WyThuB0Jz6Db5OBI9+XETXcZv6BaYsjAHXMcFwNuL0cs5e6RmYjC
	E2H0vJTJhXnzIQvZ6P0KGDzuV7cGGtWVxieB2qDZCOHwn360mo77gF01INfwDGer1etOfQNq2XG
	srNkbim1VfLJyzhMefE9YXCfcLw0RGkHLNhHh5ZZiivoy/qMo4CottTch7uzJdzn+TSc1AAyHXw
	/cIcC+0fy37vnpg84SpQU8ZIBsS3RcafmPYWgkFjdojUD2wuIJ45/HQmbkXmXAp5UlJtAeXRJpM
	adGKiW/2fuhob7m2Ki3YdtJjEv6Kt1QmxCF0q1Bxvk+L4Zfa9v9ETev7X8AOqqxDjJfTyjdynPg
	o3hv1+GCeUzd+vs4Xf0nVxOMsTGYnnV3tupK4pjDblbkp0AZdj/Q/L9Seg0/mz4/Hl7XMNSguHc
	vk7L1VXwtnuLeYr+mxAkOS+C9Zhlx5MVZemyC8uPV9ppxo8ijdMJ1syRO3dqxKOXljajDM7TVJ
X-Received: by 2002:a05:6a00:390f:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-83f33aec2a5mr10161094b3a.6.1778972974432;
        Sat, 16 May 2026 16:09:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2875f0fbsm8978388b3a.57.2026.05.16.16.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 16:09:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <76f0d9d4-b7c1-4aa4-87ab-6de26f200e4c@roeck-us.net>
Date: Sat, 16 May 2026 16:09:31 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] soc: bcm2835: raspberrypi-firmware: Add voltage
 domain IDs
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-2-chakrabortyshubham66@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260516191555.17978-2-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/26 12:15, Shubham Chakraborty wrote:
> Add firmware voltage domain identifiers for the Raspberry Pi
> mailbox property interface.
> 
> These IDs are used by firmware clients to query voltage rails
> through the RPI_FIRMWARE_GET_VOLTAGE property.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>   include/soc/bcm2835/raspberrypi-firmware.h | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index e1f87fbfe554..fd2e051ce05b 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -156,6 +156,14 @@ enum rpi_firmware_clk_id {
>   	RPI_FIRMWARE_NUM_CLK_ID,
>   };
>   
> +enum rpi_firmware_volt_id {
> +	RPI_FIRMWARE_VOLT_ID_RESERVED = 0,

Is that needed ?

> +	RPI_FIRMWARE_VOLT_ID_CORE = 1,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_C = 2,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_I = 3,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_P = 4,

Regarding Sashiko's feedback: I don't know where it got the
information from, but a web search suggests that it has a point;
RPI_FIRMWARE_VOLT_ID_SDRAM_I and RPI_FIRMWARE_VOLT_ID_SDRAM_P appear
to be swapped. If that is not the case, please provide evidence.

Thanks,
Guenter


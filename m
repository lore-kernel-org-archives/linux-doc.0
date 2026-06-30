Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67EF2D6E72
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 03:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782791406; cv=none; b=jY6aQSfTdnkOKwzTGMN7kag8A8fTiBTotD1iuILRUEf0ExOUT+VIjdjTkcL+TNWCwwgpxa8lAVphJrCh2q6fNun/gCXIoGoDGLNSRQb1FqbioTXITN077w9xwESwzmV3zQWJtna3dh6Cqa0hiQ/tkL8msNgu2AN2Mobut5/qgys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782791406; c=relaxed/simple;
	bh=JvndTcbdQfQeO0UnijpOjRGRT/07a4Eg6ZYoroFiGBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P56IH80WQd8P8tkBxLNHCX5IoqlwKdKD6TUTxcwOFe9M85JQoVcJnKil/qN7WcU7XULIE+fqL5mMMdh2H84VmFm7zvRvGJmKdTPiv4vD0fb1CeQqQcaFozZTe32Q2k/viLaIELRnU2WtVDSixLPwUYX1SJ6h1oNZx0v6WarK0Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laZqm1hP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laZqm1hP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c74383c93cso37839725ad.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 20:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782791404; x=1783396204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9jNn6l3C++B0B2TNE2QWEt8huvRiKl6q6nWK2b2vEJo=;
        b=laZqm1hPkItOWfi9zs+hKCr+qvAuSZrXwpEx826JGy17VjyoAe1hW5/WSrWn18Xa45
         nQDfbrWP4Jtw5Ol5GYLuJSD10Ag132ycKqV13TfvgZWD7TmXvM75E42rTzr33nTtJTTn
         twE+L/94qwLif5jK2NWTGTz3UcppBdXR8YAM6rnwW2COTqaQoq8+Ej/Qq1uowDIIZkHx
         sPhryP3I9JwjLrkDogbVSJNAr8U5ftrvFA8dOCSpgXX/lQhxO5Ar/Bnx+DZzGQ3OOV09
         AVD4zuSpyHz1jKJS9GQByyPKOSYSflrqwehjI7ZHF5xeGIvZjlRwUYtYySGEqUSgyffU
         Fg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782791404; x=1783396204;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jNn6l3C++B0B2TNE2QWEt8huvRiKl6q6nWK2b2vEJo=;
        b=SwOMpUaTTTXKWbRvLY3J3vUYMPNybNjcsvV0TJ192hrlzxjXFQFoJr0PIWuC9gHCLI
         62mQ9Z8mbHRWsjgxjb8OntHKvUlTLh3oeGErJpLwXWGu/4p2fPyJL9jT522ZyQw6mIiS
         OncMnakJE7X/LC733CMyKmBOCVC4FhYd1UeRxq96cHngsQB84jH+PnyMzuVnUeoAFBkq
         6ttXdgZqN7w4LxYx8CZbhicCrDbUjzlrT/d4Hb0cp5PA5rD9zFmiLngirKbBZYcVWVGw
         V96eM7e1ixT54Y1eH1g5CTp46myh8AjfTWDwHAlRIy9T/oY7Xt/pS7sEzc5zhtIHAMMt
         sgOg==
X-Forwarded-Encrypted: i=1; AHgh+RoA1xm00jQFn8tDs7wSACTd9YNPm0CL5HYm6POfHr9uGXGAL5SEoFLsTLQCVuB3C51MCmOQicKQ15Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaMA3uGS8W8264JbVC4iezqoqmuduEYhWdVPHN/T6NAnJOzjSk
	N1NH02HeShMhpqDwZHm/Ten9s5DkS9OFHANqo6HFUvyH2MRWlMDEFyZ5
X-Gm-Gg: AfdE7cmBIEHwC4GhfDotyML1hZ2GikV+6aIBCr9C5zbIKR5xScpDCmnF2/uZn1Wy1EH
	KhdhZ9cuh2nZRQaHq2x+16VBwi0H+2VtPBYhWfWVPoaSCI3uZNVBBR3Pw3qccUntJ/l3sdsi+qA
	ZrWaPyrXt/oo2XrWraUYxlEaKgKHuFuio2fXu7d5nki7Zlx++2mOlPRbbkL9+9aPudwtk2Q7JyC
	jFHDQkIngqh8GfF4YPLzTIPRMHs6YdxTKgWQdsvo3KJaREkMFR/qphcP21gj3wk8rWVB7M+GnSP
	TJDcmhFN5tEcqxBQlbIOziedOdf+U7pSQtBTBl7CZihgDxiTvujL5nk3O+Ual8dCT4uBJsn0GiO
	61hebUyxpiMeFMiFpa868OojRp+ysIewZwlJMsfoy+oG+qqu6qEuSouUZQHPgX5HpuhGL2noqb3
	a1gXszenJVw8bWt0OToUuN+TQjfDAOEOZkagtEktGl2uBFrYqp9RD53yeE0Bv0mA==
X-Received: by 2002:a17:902:f607:b0:2c9:97a7:3275 with SMTP id d9443c01a7336-2ca2ea334b3mr15260325ad.38.1782791403973;
        Mon, 29 Jun 2026 20:50:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c738easm4553965ad.20.2026.06.29.20.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 20:50:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <836b833e-e503-4cbb-92f7-3574f3fb430f@roeck-us.net>
Date: Mon, 29 Jun 2026 20:50:02 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] hwmon: (pmbus/max20830): add support for enable GPIO
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-2-a02786bde470@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260630-dev-max20830c-v1-2-a02786bde470@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/26 19:46, Alexis Czezar Torreno wrote:
> Add support for the GPIO controlled EN pin. The EN pin is asserted high
> for device to operate.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>   drivers/hwmon/pmbus/max20830.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
> index cb2c23672166d641852199ca07eb716924f4f286..cb3a39d747edee3aefb0fb4051ef957436b3c15b 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/errno.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
> @@ -29,8 +30,14 @@ static struct pmbus_driver_info max20830_info = {
>   static int max20830_probe(struct i2c_client *client)
>   {
>   	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = {};
> +	struct gpio_desc *enable_gpio;
>   	int ret;
>   
> +	enable_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(enable_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(enable_gpio),
> +				     "Failed to get enable GPIO\n");
> +

The above code gets the gpio reference, and then it doesn't do anything
with it. What exactly is the point of this exercise ? Where is the
chip actually enabled ?

Do you have an actual customer with such a set-up or is this
"just in case" ? Have you tested this code to ensure that the chip
is actually enabled in this setup ?

If there is indeed a use case where a customer indeed connects the
enable pin to a gpio output, wouldn't that same customer also want
to connect the "pgood" output to a gpio pin ? And what about
the LDOIN pin ? Shouldn't that be connected to a power supply ?

Guenter


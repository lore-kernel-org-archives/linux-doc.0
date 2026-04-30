Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A522E39D6E1
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 20:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777580335; cv=none; b=P6ldRMbsqVrKfZqMrtsEOa3dtbAqQLOMXxPXSqjh3exLU+nvzC60jD8mfz/j7MoThRM+Q/fyY0jUzroRfXFh+Kd3+yCN9zvMt+X2gvdVDYN/qSglK/9+v5nvzGDfdv+iAVbdkOBd94k3F4wtxrgxsuH35ZJAREqGIFsLZUMsetc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777580335; c=relaxed/simple;
	bh=ipayLzQyOTnT6KB96s96FlDwUtWz3R0lg+FfOs2iarQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WD4nRCSbC/Y/s2Bd4ygqnOEPWhVDWnn0hmqEsD9/rWFNxYeOoODPICBIfCOtV0G7f8xSC990u4LqbzLC558OcnCYMNdRSnUoiBkWYPWI7Z6ddmAqqz1TNbPPpttkt+DLqvPVRbB5MbS1nzVi9UkJ7L7cr5vU2Lcaaqu9uuKQ4ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mb4ZmnT2; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mb4ZmnT2"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso508904a12.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777580331; x=1778185131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=23tE+HbjZXJoxqvHFayaQoGSWZhsiqS+lWP51Nu+eNU=;
        b=Mb4ZmnT2hQ30rteE1LVXig8JP83OKTw3pIs0f5T9kMjKTfTEYLsI91MjyPOoQPKOGl
         deCZpu3egGBMh+aAc0hvydVhxdnE2E2tpHh82KZOcnhjwFBc1w7UDZ56rdsZ+66H8UoC
         bR/3rTifltUVbzQW6kZtOECsa+uSER/gfVwo0cdhlBwQNKu7zNEIiltHh84dwIFP8dRb
         boadM0c0Q9NQWAwd4SICA0PpEvc5oUmPUPh3ZYgGAzkNF3IuEQwNHJN5H0F2uui4Egzj
         1a/IYonOB8Ad1mL6OmesN/jGbwA0srHwmQ8JsOwV1h11Fg4sP64WM7ScZpX8Qdr35nY0
         kBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777580331; x=1778185131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23tE+HbjZXJoxqvHFayaQoGSWZhsiqS+lWP51Nu+eNU=;
        b=TjuKIubRHMSNytNh6+6IrqVCT2jGzUsxy4ZoSlelkdANX5IZ28ZVfzwckBetIo3eLE
         CEy4kRyKKM1mhsuyicDd19GmJnOe60gJ/OG78GW71jMIL5jTHT09sdulQcgexSIbEQRv
         cqFkR8LhegK5H2VCQQ3h/6mamtH5+Na1cd1Yclgs9qD46+ZgFG5KhmD4AaA88+AcDO0p
         0lQGyU1tVDARIlcu7EHxn2/Rh1I+h7jTCTxs4TQlIAn7MKUO2JabXGCi44qOVJHN6/YX
         HV9OVxsCZv0YLw4aLkhkVnrZjhOFSNe4JLk87vPohXQoSjGbm3rd8Lz6HwuhDUnKs5tF
         ptJA==
X-Forwarded-Encrypted: i=1; AFNElJ86Crm/tLZbF0DUlJKLVg32y1Eo4rfeu6yLGU5teAPtbFczVghXP+0MCl/KSc3s6/6+bjIIdwPkF9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx446X3QNIANV8pgxhJuiQNtIuymyPp5rb2zIn6ePosB9YgOaf7
	p3me+6NMwCtaXsTBMGgbmfBo0JsgNMo5XnEX5bxpPm0v5lfidJK/PLkU
X-Gm-Gg: AeBDieuyHnBR6w3iLjt711PPStl/9KiXf5gIdnb/wOseew+5uUxdmGExqEu4cBk5UDj
	JEC0pHBL4CzhQzcgtHg6htOqJx15VhocU8fUrpX64MuuNdnInC4n7/9Az1ya/QRu472oDvfQ9C3
	IW6upa6ur6QNDkALsEJmJvx4RmGP1Cyx54tJ465PB7NuDMFuDpytJ+TwgKynvIkJ7gtMhQfV8op
	UiX2ChpdgGADDCou9SdQ+NuS8KELQi5nfCOUhNw6eRRSD8t7fCRFJCfQDaWoW78xMrS8q8/pYtV
	4NcPs9ISGxBjjbQj09hXaerg4YtxH522r2b3uLD6+yZMxnZc4H9SZZKuxQgWlgoqz8EMsG5YXfw
	FnWhQaWOOlVoJJYruQ41JKFrar0r/1I5i+FRKbCLeaGM5FtPQd1oiBubeZErYEFv6jfbpEE1A1C
	QX76oT5Yw+2jIN1lWNn0roAWufyhrExicm+K40oNL4WIY0Rd5krKi134WbVnbbI3VZbh8m39D2J
	UFO10rxQpM=
X-Received: by 2002:a05:6a00:22ca:b0:81f:4a0c:c584 with SMTP id d2e1a72fcca58-8351a2e5b0bmr81237b3a.1.1777580331224;
        Thu, 30 Apr 2026 13:18:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158aa1ffsm509604b3a.22.2026.04.30.13.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 13:18:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f2cc69a9-9211-42d6-a349-17e67d1ae4b1@roeck-us.net>
Date: Thu, 30 Apr 2026 13:18:49 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] Documentation/hwmon: add Delta E50SN12051
 documentation
To: u8813345@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Colin Huang <colin.huang2@amd.com>
References: <20260430-add-e50sn12051-v3-0-f6d4e043ec7c@gmail.com>
 <20260430-add-e50sn12051-v3-2-f6d4e043ec7c@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260430-add-e50sn12051-v3-2-f6d4e043ec7c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/26 23:16, Colin Huang via B4 Relay wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Document the hardware monitoring support for the Delta E50SN12051
> device.
> 
> The documentation describes the supported sensors exposed via the
> hwmon subsystem, including voltage, current, and temperature measurements.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/hwmon/e50sn12051.rst | 81 ++++++++++++++++++++++++++++++++++++++
>   Documentation/hwmon/index.rst      |  1 +
>   2 files changed, 82 insertions(+)
> 
> diff --git a/Documentation/hwmon/e50sn12051.rst b/Documentation/hwmon/e50sn12051.rst
> new file mode 100644
> index 000000000000..cbbfa7895d82
> --- /dev/null
> +++ b/Documentation/hwmon/e50sn12051.rst
> @@ -0,0 +1,81 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver e50sn12051
> +========================
> +
> +Supported chips:
> +
> +  * Delta E50SN12051
> +
> +    Prefix: 'e50sn12051'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Delta upon request and NDA
> +
> +Description
> +-----------
> +
> +E50SN12051 is a 600W non-isolated 1/8th brick DC-DC power module.
> +
> +This driver supports the E50SN12051 PMBus compliant monitor device.
> +
> +The device provides measurements for:
> +
> +* Input voltage
> +* Output current
> +* Output voltage
> +* Temperature
> +
> +The driver is based on the PMBus core and exposes standard hwmon
> +sysfs attributes.
> +
> +Sysfs attributes
> +----------------
> +
> +======================= =======================================================
> +curr1_label             "iout1"
> +curr1_crit              Critical maximum current.
> +                        From IOUT_OC_FAULT_LIMIT register.
> +curr1_crit_alarm        Current critical high alarm.
> +                        From IOUT_OC_FAULT status.
> +curr1_input             Measured current.
> +                        From READ_IOUT register.
> +curr1_max               Maximum current.
> +                        From IOUT_OC_WARN_LIMIT register.
> +curr1_max_alarm         Current high alarm.
> +                        From IOUT_OC_WARN_LIMIT status.
> +
> +in1_label               "vin"
> +in1_alarm               Input voltage alarm.
> +in1_input               Measured voltage.
> +                        From READ_VIN register.
> +
> +in2_label               "vout1"
> +in2_crit                Critical maximum voltage.
> +                        From VOUT_OV_FAULT_LIMIT register.
> +in2_crit_alarm          Voltage critical high alarm.
> +                        From VOLTAGE_OV_FAULT status.
> +in2_input               Measured voltage.
> +                        From READ_VOUT register.
> +in2_max                 Maximum voltage.
> +                        From VOUT_OV_WARN_LIMIT register.
> +in2_max_alarm           Voltage high alarm.
> +                        From VOLTAGE_OV_WARNING status.
> +
> +temp1_crit              Critical high temperature.
> +                        From OT_FAULT_LIMIT register.
> +temp1_crit_alarm        Module temperature critical high alarm.
> +                        Set by comparing READ_TEMPERATURE_1 with OT_FAULT_LIMIT
> +                        if TEMP_OT_FAULT status is set.
> +temp1_input             Measured module's hot spot temperature.
> +                        From READ_TEMPERATURE_1 register.
> +temp1_max               Maximum temperature.
> +                        From OT_WARN_LIMIT register.
> +temp1_max_alarm         Module temperature high alarm.
> +                        Set by comparing READ_TEMPERATURE_1 with OT_WARN_LIMIT if
> +                        TEMP_OT_WARNING status is set.
> +======================= =======================================================
> +
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 8b655e5d6b68..ba08655fc496 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -68,6 +68,7 @@ Hardware Monitoring Kernel Drivers
>      drivetemp
>      ds1621
>      ds620
> +   e50sn12051
>      emc1403
>      emc2103
>      emc2305
> 


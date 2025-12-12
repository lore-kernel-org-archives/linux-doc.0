Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DA829D26B
	for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 17:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765559270; cv=none; b=PrSw6Tpq7+2Bu+q7z/mVUHz4odTsYEjI/Gt5jec7Jo7nuBitbOHYeLuQjDq5LaFFFG2CcYAcz/ZS0r3saF828yQRraaYrXDhuxmQT1beZKOgtnLg5UxAbq6hBHFArRyBrvfIdRjafQda+nts5UVPCsRmJG0v45lx+PKph7GLzKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765559270; c=relaxed/simple;
	bh=qbeKJQwC68Cx43jiz7HsOLEEM5KkL9T7Xsm1E1YqiHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bz23TtS+m4EDWhI598b/2Tpgyh+tKLZuwaFurpXsk38lV+nJgMMLojekncFlljDoa24A9ysX3n1+RMlot45mvlmSVCo2ekrMN1tOviD59CiCL6qan9dvN+hT58ZeyXC9kl9UTvxjdsFpXW/3sbb0ilaqDOv9seHFvSx60Ke2lMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0/PWGdf; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0/PWGdf"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso1983094b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 09:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765559268; x=1766164068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wrunU8pw6H9zOs0jZGs5wUV7F3gUjI9YKd4K9NSVbtk=;
        b=L0/PWGdf54uxgIHD34QRWC/eM+KACna8hnb8eV0d+kFHEaOeqq60KT0QxR9TsvfHnM
         +fg4FMgeKSclb1qMyjf59kJ2jLs58BorhevZ9N7+OYrH2fmFRrWMvTcOCenabzvNmkDr
         Al0e3ORuuNjcx/vW5b/GAmSVdoWLRhLNlYGq4a0Vdez0btxE+0LZ3n8bJcDZiMVMYQgI
         5Av4pMtUAYjr2njywZdL1x/hWLGRZtf2no1J9Xi4Rl2iEa+v+JsoORKmGd2GaqMRCCD7
         E1ZZAeoKYo2EBgCTfyw4dn3THYny4dOepOaXvQOEtmZ0bc6O8J+RP03zP0ohhr6B8FPL
         ftRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765559268; x=1766164068;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrunU8pw6H9zOs0jZGs5wUV7F3gUjI9YKd4K9NSVbtk=;
        b=bdsLFs0Ix1sQB+757YCRv3RmKbfc9Hv3wlpMBGKz0vSe+SEPYsHivVDEglA+P19Y0A
         ge/hlYaKHaQiGFjYQ8bNMAXBGNUCv8GtN8+WZ/H5o4KTgGLB18cQDtyK5TuyC+LIoaqV
         UeY6QS6iolZ3WJyPmjEcSyw8WAwscMt3CbH410wbviGge86nyHHWifgs/M/JVy1tpSH9
         ikiqbHya4Bwk/2B0DcQamDhX92YAZAnqow6Z1PZbNqECzoLS0g6GNvi/md/SNAHeGfVc
         U1PZjsuQneFk7JwgTBzYTQy9vixhMkbZGsvO3twBJzPAYc3zVsOkrQUBT0yrXtmH89q6
         6Q9A==
X-Forwarded-Encrypted: i=1; AJvYcCXLE6mUM+C/y9Dwn35hFYC/Pb364HwmskVS2E46F1SfTrYLzj570dqiErIg7G24xTX9mYVNW9yeaLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXSFSQkRy9I++lpz/pG1U8iTyDEGO3Sx2+VdhRpjsQmt34sYcw
	g9X1eUSVZpWnbJHcXfb9Crm4Pjq9nHKiQy2RDtd6r+7acasRFOKCtRBL
X-Gm-Gg: AY/fxX4FKAHqgAQrubJtH2R1QAionsvFHuOeKzk6zaV6t45aTjgV1yHQA4qGFi9MAtB
	pZRerk3AJFVpZmQNYjQh8bybiDTy1qLKJzViDb8di0243/+rsiCp9H8Hlfg5rryn1yOYQjkbl4s
	vGP9aEEOnZwxYmXGemhCzQXrb1/C1h2I2dwUIGnVulPSWvv5+oS6vyyjRFGKJw9L3GIfV5czH0/
	KYq2R/uWOQQgh3hn2aLP+lKC/+vZzPNp0MnTrZAS64FiZt5C8fvqZbOg93Og5qCrAZdHHZNzSyp
	wwB2SXOXXDBjrOYm8nZijZYOKq3eR8BT1BqnBcDj7lW198eyh0vxSEoU/lOPDhL3hBfg8w3lrar
	ZWjQf6sLClpiiBcT5I/xMPtrgM8Xa0buYV9nkMz3gNibAGgpkpb3WYDt7f1XpLbTxHIKH5vymqO
	9D6CO7fnrAZFiS3zS5qTqzfzruLANUycZMb0mGt4HnzvrT3dg+o1FtN9VGhTE=
X-Google-Smtp-Source: AGHT+IG3yAn0mlm+AqUMxbZ1ihflcThVhvuM/S7KwNGkkU+vavgLG8kTAsCB5WkOMeHEHxUmzG4aKA==
X-Received: by 2002:a05:6a00:ab87:b0:7e8:450c:6190 with SMTP id d2e1a72fcca58-7f6691b3ba9mr2878479b3a.39.1765559267567;
        Fri, 12 Dec 2025 09:07:47 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093d5csm5692338b3a.49.2025.12.12.09.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 09:07:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca659699-e5f8-436f-bfdb-d0d250d34fca@roeck-us.net>
Date: Fri, 12 Dec 2025 09:07:45 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com,
 linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
 <c9cb3a2b-da6b-42a6-87b0-7a2b780f5ad8@roeck-us.net>
 <56a6c6a1b800090522a61eea5141aa8c986faea1.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <56a6c6a1b800090522a61eea5141aa8c986faea1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/25 08:50, Nuno Sá wrote:
> On Thu, 2025-12-11 at 09:56 -0800, Guenter Roeck wrote:
>> On 12/4/25 08:15, Nuno Sá via B4 Relay wrote:
>>> From: Nuno Sá <nuno.sa@analog.com>
>>>
>>> Support the LTC4283 How Swap Controller. The device features programmable
>>> current limit with foldback and independently adjustable inrush current to
>>> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
>>> temperature rise for reliable protection against overstresses.
>>>
>>> An I2C interface and onboard ADC allow monitoring of board current,
>>> voltage, power, energy, and fault status.
>>>
>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>> ---
>> ...
>>> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
>>> new file mode 100644
>>> index 000000000000..d79432678b84
>>> --- /dev/null
>>> +++ b/drivers/hwmon/ltc4283.c
>> ...
>>> +
>>> +static int ltc4283_read_voltage_word(const struct ltc4283_hwmon *st,
>>> +				     u32 reg, u32 fs, long *val)
>>> +{
>>> +	__be16 in;
>>> +	int ret;
>>> +
>>> +	ret = regmap_bulk_read(st->map, reg, &in, sizeof(in));
>>
>> I had a look into the regmap code. In its current implementation,
>> that will work as long as
>> 1) regmap is configured to not cache anything
>> 2) the I2C controller supports I2C_FUNC_SMBUS_I2C_BLOCK
>>
> 
> Possibly dumb question... what would be the issue about doing multiple
> regmap reads if we can't do the bulk? That would be my naive approach in
> the driver if I'm not going to use the bulk API.
> 

You mean on the same address ? I don't have the chip to check, but I am quite
sure that it would return the 1st byte again.

FWIW, in the lm92 driver I used a regmap_bus to solve pretty much the same
problem.

Guenter


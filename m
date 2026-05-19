Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D04B3B3C17
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 07:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174428; cv=none; b=IwzkTvg9sC97PUD7hUn3wFyBMS+JVCsfqKFzKZ7ModkH1NAqUxnourniyj/5HY8GgfugZ6WlY1RHaGuXeUYdWyk5JB85hRAre3h2AH1vnPRnpvCuMs7YqQhEvaLAXCnQmhGYE1ymNIKISRqopnLXqs1bymqL8pxSc/Fadnkzo/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174428; c=relaxed/simple;
	bh=BMcuZpgrheTtw8YzlMY85egTpgVnX4SxV15uvlEKhA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrqrw1s4eShInVu/OQBJLcNWEWiz6sS+1mx/YAOqHq7REiP5GXsM4z13iYPc/Y6YhX7qm/wf/yJrrk1i7RJncQ0vVCRx1GlISv/MU6bv8jDCRxAUisr0lhh3uaVXW7dXxACtQY12oDH1MM7taDymJb97U8rPnxKlTok1XHx1zyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHqpetAH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHqpetAH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48909558b3aso33262345e9.0
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 00:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779174425; x=1779779225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jyEEvS9/Ik69rxCZnXUKAzpf2s9PN8D1R1Hqx/eCkrg=;
        b=YHqpetAHI1jQxLGxEd1pIGnfIcAU33q5IrPJ1/kHLAhrWFoFRuDeZfd5lu71uwi9FF
         v9NQqdgh/b8r1rASk3LeM3/wuOvzqd9ALgJOJUlBliHVsh8pzZtHtjguRqfUmXaouJV7
         NB5VjA+nzvnb0eeDzBztDqM+7MP8ruC/lebiSWqn0rCMua+YCchXZNQxyBY3PKXBLkSZ
         Iwc4aWhoTuWEClNs3FfPcE4rjGnfbklPBDnh9cMqQN3LK6x32vPHFX1AFaKWmEG4Qkpx
         4AJCx0A/10FWncuG2Ip9sexds/FMr3pdeZwpxQpq8bkuETcPBX8FGm5WKqL2YjgqO1pB
         qDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174425; x=1779779225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyEEvS9/Ik69rxCZnXUKAzpf2s9PN8D1R1Hqx/eCkrg=;
        b=Zheg5/W1s2uvwn/kqL4HFM5DWfgyAiYdxmHP5G8VOZnis5GfkrMYsHre5y3EKYtKIw
         dhozSSslEYJ7IBFaZOIJT0azS9qVP0PG6JpFjTiq4/v7UOKWln5QRz5Mebmbh9MgYUPD
         XhOENsmGsmDl50IQJAGtHnqPbQDV79urem3YGudBZAX3ChSImd2yJbIw7SWbuDWittIJ
         wiNyc1vRqFeYTb9VUvBpKqj11jPm2OJOkQvbnckpYhmMxeU6yBylzSu9kk6Y8TqjSJBg
         nr3BsH4MErgrelfEU1N3bcqayb4TEhIznCTI3xUoAgdosyiVVSEA9qgZ+lAovfFA+ftP
         2YNA==
X-Forwarded-Encrypted: i=1; AFNElJ+U1j2JMjAfaV+nMK2QpJ+ML3O0ftMH/6sLOsNIJEh5PDQhF1DET0teJDIPy0mX1QrDQzRAjzWHCeg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywanb8uLPj/YGmjxvNjtcvuW03GqvjcMiW/v47P/huGbZUxWUBc
	KEFkTt21qLWXbJS3mcF+FXbN17JI6dSjxZNXQZyc5M0hNIPO18Q25Akz
X-Gm-Gg: Acq92OEddQZ9F3xFGaQaJfSgMyoBFU2lbci1PrknTqPDtbEdLEcV1tFeNWk2OSCldhx
	y0g2Q5sHZF3p//lI7Bw2os8JgZwkE2NPLnjL7q1loA5HScIITtvfhz7/hZdhJOdali1zv7t/pQv
	ycMzAnwjRBzW0z9CKaMxWa3Fci5lc2C5RKPRDg6MqbYia/6oGOyH4NLmknnzjcQToVas2ru8Ipc
	CTl82XCD6/LPdN4fpSpzTSlt9wZ31eaAtAkm/+A0JlyCFYCNVPr8ZbjeiuzMA/s1pb3embWFFOe
	fIH9HLDPZAgBNw1qIlcClVFF6KxOL3qFCtH5EtSNEfk4RCgIc4BH6SnFZmayt5wTR9vAStIMPST
	IhPK7jxFLEtopZ7O9wHlusOidX+tBeFUdCBIgpX9AV1YJe6XLFibkGU8Xk1XcupV9sfMQRi/kEq
	d+1NY3o2RP7/PelwSSLtM4rA2UJXQNtZPiNAxV1a6tENz7UMQDmLnkpCA8U1QAyQyF8dLV
X-Received: by 2002:a5d:5f45:0:b0:45b:d891:56bb with SMTP id ffacd0b85a97d-45e5c5db696mr28861409f8f.38.1779174424577;
        Tue, 19 May 2026 00:07:04 -0700 (PDT)
Received: from ?IPV6:2a02:3033:6d8:15d8:ec15:f5ad:b85f:a3b8? ([2a02:3033:6d8:15d8:ec15:f5ad:b85f:a3b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm46305257f8f.10.2026.05.19.00.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:07:04 -0700 (PDT)
Message-ID: <233a93d1-1901-440b-902b-f0e482d9a1a4@gmail.com>
Date: Tue, 19 May 2026 09:07:01 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iio: dac: Add AD5529R DAC driver support
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
 <20260508-ad5529r-driver-v2-2-e315441685d7@analog.com>
 <20260508143017.28f86551@jic23-huawei>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <20260508143017.28f86551@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/8/26 15:30, Jonathan Cameron wrote:
> On Fri, 8 May 2026 13:55:48 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
>
>> Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
>>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>> +/* Register Map */
>> +#define AD5529R_REG_INTERFACE_CONFIG_A		0x00
>> +#define AD5529R_REG_INTERFACE_CONFIG_B		0x01
>> +#define AD5529R_REG_DEVICE_CONFIG		0x02
>> +#define AD5529R_REG_CHIP_TYPE			0x03
>> +#define AD5529R_REG_PRODUCT_ID_L		0x04
>> +#define AD5529R_REG_PRODUCT_ID_H		0x05
>> +#define AD5529R_REG_CHIP_GRADE			0x06
>> +#define AD5529R_REG_SCRATCH_PAD			0x0A
>> +#define AD5529R_REG_SPI_REVISION		0x0B
>> +#define AD5529R_REG_VENDOR_L			0x0C
>> +#define AD5529R_REG_VENDOR_H			0x0D
>> +#define AD5529R_REG_STREAM_MODE			0x0E
>> +#define AD5529R_REG_TRANSFER_CONFIG		0x0F
>> +#define AD5529R_REG_INTERFACE_CONFIG_C		0x10
>> +#define AD5529R_REG_INTERFACE_STATUS_A		0x11
>> +
>> +/* Configuration registers */
>> +#define AD5529R_REG_MULTI_DAC_CH_SEL		(0x14 + 1)
> Feels like this would all be simpler if you used autoincrement rather than
> default value of autdecrement.  What breaks if you do that?
> Superficially feels like all the +1 would go away - though with need
> for a byte swap?  Might be worth that pain for the simpler code.
> Should just be a regmap_config parameter.

Switching to auto increment is feasible. I'll switch to auto increment and
eliminate all the +1 offsets.

>> +
>> +static const struct regmap_range ad5529r_8bit_readable_ranges[] = {
>> +	regmap_reg_range(AD5529R_REG_INTERFACE_CONFIG_A, AD5529R_REG_CHIP_GRADE),
>> +	regmap_reg_range(AD5529R_REG_SCRATCH_PAD, AD5529R_REG_VENDOR_H),
>> +	regmap_reg_range(AD5529R_REG_STREAM_MODE, AD5529R_REG_INTERFACE_STATUS_A),
>> +};
>> +
>> +static const struct regmap_range ad5529r_16bit_readable_ranges[] = {
> Tricky bit here is you are saying it's a 16 bit regmap but then providing
> address ranges including the ones we shouldn't use. We need to hide those
> intermediate addresses.  Various things might work depending on the addresses.
> Can we hide the bottom bit of each address then write it to appropriate value
> under the hood. That is divide addresses by 2?

I'll address this by using reg_stride = 2 in the 16-bit regmap configuration,
which automatically handles the address spacing and eliminates the need for manual
address range exclusion.

>> +	int ret;
>> +
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_RAW:
>> +		reg_addr = AD5529R_REG_DAC_INPUT_A(chan->channel);
>> +		ret = regmap_read(st->regmap_16bit, reg_addr, &reg_val_h);
>> +		if (ret)
>> +			return ret;
>> +
>> +		*val = reg_val_h;
>> +
>> +		return IIO_VAL_INT;
>> +	case IIO_CHAN_INFO_SCALE:
>> +		/*
>> +		 * Using default 0-5V range: VOUTn = A × D/2^N + B
>> +		 * where A = 5V, B = 0V, D = digital code, N = resolution
>> +		 * Scale = 5000mV / 2^resolution
> See the comment on the dt-binding. I think we need support for
> dt described output ranges from the start. This is a rare multi range
> device where we could set a safe default but to me it makes little sense
> and the driver will be doing something unexpected if a newer DT is
> provided with a different range.

I will add devicetree properties for per channel output range configuration.

>> +
>> +static int ad5529r_probe(struct spi_device *spi)
>> +{
>> +	struct device *dev = &spi->dev;
>> +	struct iio_dev *indio_dev;
>> +	struct ad5529r_state *st;
>> +	int ret;
>> +
>> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
>> +	if (!indio_dev)
>> +		return -ENOMEM;
>> +
>> +	st = iio_priv(indio_dev);
>> +
>> +	st->spi = spi;
>> +
>> +	ret = devm_regulator_bulk_get_enable(dev, AD5529R_NUM_SUPPLIES,
>> +					     ad5529r_supply_names);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get and enable regulators\n");
>> +
>> +	st->regmap_8bit = devm_regmap_init_spi(spi, &ad5529r_regmap_8bit_config);
>> +	if (IS_ERR(st->regmap_8bit))
>> +		return dev_err_probe(dev, PTR_ERR(st->regmap_8bit),
>> +				     "Failed to initialize 8-bit regmap\n");
>> +
>> +	st->regmap_16bit = devm_regmap_init_spi(spi, &ad5529r_regmap_16bit_config);
>> +	if (IS_ERR(st->regmap_16bit))
>> +		return dev_err_probe(dev, PTR_ERR(st->regmap_16bit),
>> +				     "Failed to initialize 16-bit regmap\n");
>> +
>> +	ret = ad5529r_reset(st);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to reset device\n");
>> +
>> +	ret = ad5529r_detect_device(st);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to detect device variant\n");
> No to this. It breaks the use of fallback device tree compatibles.  As such we
> never fail on an ID missmatch. Instead we just believe firmware when it says
> whatever is there is compatible with this device. See below on why I think
> we need to break this into separate compatibles.

I'll create separate compatibles and remove the device ID detection logic.

Best Regards,
Janani Sunil


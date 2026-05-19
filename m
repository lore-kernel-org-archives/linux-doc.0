Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8566F3BC685
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 07:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174717; cv=none; b=aueL2SmUrYE+Pcb2VBe8nznGFBJbjHti8swLJhoxCCa2NTMjxiTjiDc+38cYujQJ2WoN1NrKI0D8tmln4YV9FKF26qTnA9LJZ4R/DHeyOjavledY2vlpp6VPKAW8e0y8vaMPN5aE2uFO8pMgYldAUWppjp+UB2TLQ00J45QcF2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174717; c=relaxed/simple;
	bh=wztDeudGoUAJK/W//ID8zMxaTkHI3uWCRMPOPLm6LPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dDE1aPvV/Uoxws4I8dU5qLJ7/kXgOUl/xAMZxES4lRXDmJ9L+J7GLciP1VE+de9PIDtpwnlpr3KRGp3utn4eNs8IM4if/xvHqKZ3CwpOjFIkY3BmqGAeXy8X4UoJSkeYEFIYMX/orC9kL0O2OQaOBtcoBgN0y3GLIzoHTTaksjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjUlCDP8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjUlCDP8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso32558335e9.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 00:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779174712; x=1779779512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xjjvfitJbUO5+jLc8/tMROrf3YtISQkTQKy+IqYQDo8=;
        b=mjUlCDP8YywlfT2Esou3YpzxuaFoN5/JbU+g+6VrJp+vUJV4lNc4SSvZBElyAQQPVA
         +sAp+/Ad5PTx9ciAtr/H0L5pne24TINvTB6ZoQAkQtHm5yD9bsrJroWRxg4Y1fgIMOKC
         nRZQqc8VifCzIWfFs2ztXStM4SriFAFWXf7TrXJiA5GMq0v9mDiUY+aZHckT0NuK6xbo
         TVZObx2uCcg1c6MajmAsVmmmONfHtWtGOskWf/5o6hsMPFO7SARiCBhqKM6GxpSZ0l+B
         vddLXOPMLVCDVqkzar2xXwehUOzvUXHBGGmKUTFsyJmF8a8iSsbFumCf4qtBwMNHq5rM
         g+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174712; x=1779779512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjjvfitJbUO5+jLc8/tMROrf3YtISQkTQKy+IqYQDo8=;
        b=MMzXBD51HYuxYvoVns2OoZUNwCoVABeaxOI1AyskXGgyqSnhJ4n/uWaFvf7kR0+x0Q
         C+oQfKOnrdMYW5wz4HVL3UTyytTFKFgflwge/GNVnGlcQY8Woj14fqYwV1ZeR+FrlA4L
         o2eaAKlLpP4Dr6tY3airpxExwqU1UcI54nGYTB9pyU/JQTnTnSLRt4o8W+rHkuS9htnc
         AMsWLg7uwzr2rzgbmmiivc01VceiC4lhfmNe9WzfS9g9h4J2Er9UrvwZikDA6dFNVxrH
         GElrgksVUXWhmdm4FAmv0oGpFOhiiqRoOIp9fXrc3E8X0otQtbb9c3f72taFxhqu7giF
         Etdg==
X-Forwarded-Encrypted: i=1; AFNElJ9Vauko5eRydVESyNRwHW8JlTUojA/uFgdGqRyO1wNJPygd+oK/Ysjrjb9ucJykFKEslXb26a59eKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzckYY3p0laLg5ZIQHI7CvdG+VfnKZ5pKIymnN8WWraMNwCKJoW
	cLyI5Mv5bWknrh3Sa5M0KVqzhcxklQMWVushPULzA55NyQ8jch6YN2jvXfzQ/sHijiY=
X-Gm-Gg: Acq92OGG3lOPsEaRqxvZLTyAvPRHdb/D2IJggygul66m8rmr26gb6Q8wTxP50YlPFOT
	zRM/4RJ4LLus2CjkOVQTR55uSKTecBO9PlmKGwdgSneDgBotirXavb0HqAD1UG9es4GYuWE5EBd
	LZVyB9XL6RKgJf8mRDf4d124vyQwCjoEV5PVFm/dz/5xAvOrvK1yvgm5W2POcYv6TUH06QKiTzu
	1nt4COPHK6kBcu1jAnqSkopr7yJztu+1Xc3famA8o/ixQbY+M0+QHh0IiITPtfXGW1YqasDeqRd
	RXN+jHYE6baFLT+UWyfMCUJrVOHNbzTHAZ8UpiikCS8JXEkrXFyqHc170f21k/i3OOAfQmzvQFe
	AeWAJQI9h3CdC/ZuskykKQLeshedsVTT32QqoR5XRP+hpQzfZBtJ14iD7fIPuE6YiTPMPOEmoFL
	MffUQ4zyqhxOnz9Tmy2JqVl0r651c7NFNWhcXi0ijon2rojp6MoNGb6+22jj95c2Gkc7nT
X-Received: by 2002:a05:600c:a09:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48fe539198fmr259597035e9.13.1779174712366;
        Tue, 19 May 2026 00:11:52 -0700 (PDT)
Received: from ?IPV6:2a02:3033:6d8:15d8:ec15:f5ad:b85f:a3b8? ([2a02:3033:6d8:15d8:ec15:f5ad:b85f:a3b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm309396375e9.1.2026.05.19.00.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:11:52 -0700 (PDT)
Message-ID: <739f50f4-b2f5-4e5f-8d1b-d5a6429ece28@gmail.com>
Date: Tue, 19 May 2026 09:11:49 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iio: dac: Add AD5529R DAC driver support
To: David Lechner <dlechner@baylibre.com>,
 Janani Sunil <janani.sunil@analog.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
 <20260508-ad5529r-driver-v2-2-e315441685d7@analog.com>
 <2f74e76e-b066-40ac-9cb4-c75137c9825d@baylibre.com>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <2f74e76e-b066-40ac-9cb4-c75137c9825d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/16/26 21:35, David Lechner wrote:
> On 5/8/26 6:55 AM, Janani Sunil wrote:
>> Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
>>
> ...
>
>
>> +		.realbits = (bits),				\
>> +		.storagebits = 16,				\
>> +	},							\
>> +}
>> +static struct regmap *ad5529r_get_regmap(struct ad5529r_state *st, unsigned int reg)
>> +{
>> +	if (reg <= AD5529R_8BIT_REG_MAX)
>> +		return st->regmap_8bit;
>> +
>> +	return st->regmap_16bit;
>> +}
> Another way we have done this is make custom read/write functions for the
> regmap itself so that we don't have to have two regmaps.

Dual regmap approach was chosen here because:

1) It leverages regmap's val_bits validation and endianness for 16 bit registers, rather than
implementing them manually.

2) The two distinct register banks- 8 bit and 16 bit map naturally to the separate regmap configs

3) Each regmap has a focused rd_table/wr_table ranges matching the hardware, rather than a complex unified table

The routing overhead is just an address comparison, similar to what custom functions would need, but with automatic validation
and endianness handling

Best Regards,
Janani Sunil


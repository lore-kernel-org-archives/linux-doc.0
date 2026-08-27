Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350F443E06F
	for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829443; cv=none; b=hmsKgk/Hzddv/qH7ZsnSCKhaSu1DuNbG9p0WivzPY3uYZd47eWcqZdyANXD3wzxpcpw3HuXKHOdaYAlkEZCbp6+RZkV1MzDgreJiOcURRinnXVcQOZswSA8HTx2V6w8wlD7EfZQCUo5MyMGsTocJfAckazUy9w+4AQS/IklEO8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829443; c=relaxed/simple;
	bh=TNfL0ltNtyA++Rr8CgECMMr+pcLqnV/WtZHCJGLhTqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWSPxn/zSUozHrboHYfmKJInokJ/vJ8GV0ykuSnql741PMH34mFnKs8SV5QCbP1bwnW5V6homqEZQIk2eEfaBZ6qPk3exD1rE51Y2C7Vu8T84a7k8SMBeRHGmkmt0bDP/vKI0n6CYQ6HD1Kib5lvbj7wpmInNUd7JaJ99af3wuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZenkQEh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZenkQEh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4957eefd361so13540125e9.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 04:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787829436; x=1788434236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7OBFqNTBANSPaxVAd2poemMPOcLMraetZWIq+y0CHI=;
        b=oZenkQEh24GGihXOqcSj2iJHkyAZvMzaZao4YFIUBifwoDMCDuiOwSe/ZdvS47O7Ll
         4PjWFeBJCY+U4RfkorpF861HJeJo03FFRpZU6WeC2ePnrgPL6gqkjq3oJLu2Z0k++yGW
         Ivy0n4vVn/ZrZJli0/ocHTnAsEY4bxFqAKp90CaGyBLeKTfYsHbsiiERuRVg6oyjZVou
         cWOVKoXF66uk8Ii0f8qzOtJvIU+QV2O9Q6ApA5Ktbte/jOeAk/3FuZvb4/z2GZKXdBX+
         S6ZLDnhnAXe7q/leVE13PiOXaDZ+p3ciPb/hA/3a96YmfAxwcdcfXQANoBrOwiH4SX+w
         hOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787829436; x=1788434236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7OBFqNTBANSPaxVAd2poemMPOcLMraetZWIq+y0CHI=;
        b=gZc5le4lF6Pv3/s801AP4Wlm0/1LcakSq2ABPFr9Ts/rmxIB1NEpqsyzmK/dSmIBtr
         iBdb8Be3dY0vb09BJdYigGzkEgAuxCP5SOFg7jOG72KfOrrVTGxcQASQHaYdmikICr0d
         +KCC1aI+X0a7EQXK0My5VZY+jGUyjgkSf9wdbH7nNe78XGEEdNtBLlzEAvNddqPpq2Tk
         AjR/yO/j/MdmakArCUtQXoHjUh2Cdd0Gr1dGtww7reylzfVC027qfdDuRLXClooG9IAZ
         27UIkZyWrgcqRi/5hJM5bQ6O14//uCsf54FLaDNMjtZbV9cdU+L5MyWK8OrVB3QhP1zP
         Ahdg==
X-Forwarded-Encrypted: i=1; AHgh+RqEbM1rucDuQIk42mWEc0FN/XG3Ju9FQuZdLeFng9A9MBKUB5PjByrAu/KWJ4+KNh3Xm/ipXWsUbek=@vger.kernel.org
X-Gm-Message-State: AFuF++ldW/TWiz7z86cupJAnM9vSO7CBy1dK5frKNTu8UD4jDu9XnXgP
	/8CHD5C9dbCP2skd3Lg+qUYa4fpwXTA8mzkmKmkPGZ7Ib2rZw2RBPx9+
X-Gm-Gg: AR+sD13STR+9GIEaDg7zFmtU0+ucw6K20TveXeQheBoAY08YzZo4MO1/ePa0yzjEtP/
	au6yUBZW8F2tyO313lUNrxTqogLQyxPVYVh8SjD+BpOzDwNAJqh6Ymk3fCnSfcGoQjTK0lTHZ5T
	8ktAwrUgLfySJeq4OT/5evE5Ksk7GO+CNwf6+t3xyd/+L/egjto8I6R2l0ju2jN91RqiBIQ5R9I
	eO9ETSUeVrmO8IsPl2XkYuTOmJH2pQMLjM3M/ujZJ+CJLbGfw/6N8L6w3dICa0DyHShgPIjFApL
	b8lRZOW8tgB1PRRSRFgiPeIXtyRSzXXkgvwiEp/JOW+ZSPrIQ2amMdv9xzcx4aSDkiwrzQAvY3V
	5ZkRQEnbE8Gt/WNhS+fp+iJmtTVcPHWFnLeUsLselps3NT55NQbuN6PMyRgZaJmC7uk+YkglBUw
	B/2UKTVvSCy0RTLezFghMCdJrwl4mQNav47PJlj9ggcD8CgOB4PC5LBKcSvObtgodLcqywG++YV
	DaluUarK+JTbKNVYPDH5ZSJN/L+i8n/wXDeJnwHnsOsmUP/zZzQ2Fi0YdZDLFWMw8pYCesPgxr+
	cxns7i9njgV3RA==
X-Received: by 2002:a05:600c:c87:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-499dc93411fmr130733645e9.15.1787829435320;
        Thu, 27 Aug 2026 04:17:15 -0700 (PDT)
Received: from [172.24.138.145] (ipservice-092-208-247-184.092.208.pools.vodafone-ip.de. [92.208.247.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49236515sm68507065e9.1.2026.08.27.04.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 04:17:14 -0700 (PDT)
Message-ID: <aed972ef-3776-4055-81aa-63255d072b8d@gmail.com>
Date: Thu, 27 Aug 2026 13:17:13 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marius Cristea <marius.cristea@microchip.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>,
 linux-riscv@lists.infradead.org
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
 <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
 <ao_z9QTJC_q8gH0v@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <ao_z9QTJC_q8gH0v@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/27/26 10:23, Andy Shevchenko wrote:
> More or less in a good shape, a few nit-picks and minor issues here and there
> and I believe the next version will be fine to go. Note, some of the mentioned
> issues can be addressed later, but if no doubts, address now.
>
> On Thu, Aug 27, 2026 at 09:34:48AM +0200, Janani Sunil wrote:
>> Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
>> from Analog Devices.
>>
>> The device communicates over SPI and supports per-channel output range
>> configuration. An optional external 4.096V reference can be used in
>> place of the internal reference.
>> +	for (unsigned int i = 0; i < ARRAY_SIZE(ad5529r_vss_supply_names); i++) {
>> +		ret = devm_regulator_get_enable_optional(dev,
>> +							 ad5529r_vss_supply_names[i]);
>> +		if (ret && ret != -ENODEV)
>> +			return dev_err_probe(dev, ret,
>> +					     "Failed to get and enable %s regulator\n",
>> +					     ad5529r_vss_supply_names[i]);
>> +	}
> Hmm... Can we use bulk regulator approach here?

I don´t think the bulk helper fits here. Each VSS supply is independently optional, and there is currently no optional bulk get-enable regulator helper.

Regards,
Jan


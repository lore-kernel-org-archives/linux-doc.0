Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16822AD00
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 18:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787422061; cv=none; b=lPIBFqQ7KoLlXXpDwKykaZQI7hJz4UpvPtq7Y57HLhAsSCnYb9mxvGcqqQuV5yW9CKzErzxt6AHklV/IFJ2y3cirMXcPE6yF8Uy12Z5/7ZL67zOWRt5beCfuaplxRQ/kHC0y3qPmJuC0N/tEsRiMBTMeUNkNZvDC+5vWK1wWF6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787422061; c=relaxed/simple;
	bh=UyliAU/TWKdu2+QHcGCwgVVfJ/feY4c1ArC80AzL8kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nq5uItJ68bRHFc2WixE3PsAc1O4+TbcC1nABdfcS5LSC5ZArci1IqT0V2o8mLDuS7KQZtpU01rYZwqCN47BB9FS2jp6lrrjMGoGSkuM1aZDwSqB90ULETQ1eV00fz/R+x+Tr7wnz1xp6/ETrH4UV9QPTLAmFv6su0KudY9MzEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JV1Nh/1h; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JV1Nh/1h"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f3fd905828so2038306a34.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 11:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787422058; x=1788026858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ai60m3gekOryvyzc2pj7qkarxcUivXM0zaXj5jwrC4=;
        b=JV1Nh/1hBJF3aZnYw0lbxVXRnxGnMY9MT2xMJp+qef7qIHPRZI6cEK16+RRatpuRGd
         TP5telnEmh5Uz5I+yf6jxzrQkAbttMd4kQVyj8RsFaxnq56+epvEeS4C/IqmfoXcY8j7
         40Ff7pTtMiVcS26W/MnB8oD0/HoA0fZuMkwFI7AFPriWUFAqew+OtSajd0YHQEJyvpcd
         OGtY9n8MgqBnIsnQzay1APklPXirzjfqQ5w0LXfopTiONsHsDwGHxX0IBDjIQPAty/5g
         VEt4tljYj5R/4ehDtjFKkdR46W2jiNoyvUn3Wzs02R2zcL2cKSBMCKrCxz1oWOEwfC/f
         1B9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787422058; x=1788026858;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ai60m3gekOryvyzc2pj7qkarxcUivXM0zaXj5jwrC4=;
        b=AfCruIy3pjTADuPULZBX+whh4uXtTVouCXkeotutszwQoAOZO+raXo+jPgtAtitzhy
         //TtHWmoT6dAQQZRfKItG1U6yTRc7pMGXbdJFzqWsUD+LyK0t6MKO+DAjkTG8JGVVBWI
         VQMgUrW/MXGCAS6bJ2HqooDbUIiXlwm5lgUn3580PaQPIhGdOBDnz92wIxzqGk5e8phA
         APPOjOqSE5O+CeC17snkPf1hchCufPzeEwBQ+R3I+wsM4rVv1nkNwbUvZW4bcUt4/esq
         fFk5sC/JnN9yo0hiNSAQZzz9YUA693GYhayROP/5OPZEa5RkYeohnI3DTD8pH6boNRAV
         GeUg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+EDxYlkrnOvQUGYy47fU03c/+ijGW2Ol//swqDj8oEDOWnXF5pYaJJ7zYSmu2+AjuV+Yze9Enp6o=@vger.kernel.org
X-Gm-Message-State: AFuF++klP/qCDxf8RLgBp240fO2+vzcnpnuQxgxRN6wXg3S6DCSKD1GE
	XayBT6d8lzNOPVOAzwXltEvUCSgXHuZ9jir6jyQkiky8tCqBvp5/SRbCYj74KSvVyQU=
X-Gm-Gg: AR+sD11kk3deVMz2f8Paont4znSGXM37+nxPlO3Tl+Qse5qN5V8wr9flsm/9WTwIuPd
	mkKTV8ZfJ8n6EBbKcn3zx4B8t6H6o8xu1FpLNr2xlUGUU3aApBGsfcjm/ukSgGzE5Fqe8xz3ive
	L6rgIr4iAK+y4+IWtMiNdjs8kfBJAXisYSIdlxvyYP871lpCEL391yOwfc8Sv66EevTnFJlHyfF
	lSWyfzzJqWXB3KPsMKI7B3RyQa5NI8zmLfL2W4LgOtdjOL/vEc/XmrQROhuHpoSCkaQBSRq6rWe
	RmVMS8Vn+Nj8TPIJ0fPkOV0e+kY/34YU2wDXRMGkL8jyi5xnXPEEl71d6u3jewJzaVFWFpIvCnf
	+2MK1OILEQ2AeXVQtaMveVHiE6vLfiJQ11EL0l3rLiJe6NISRa9sJRfQJ37LH8rUbuXsThQei0G
	XiLzy1T0IMx6eebpgQQZ6iMYU0b3vddWaAq2EdeZGMlwl7KT1qHR/KGJu+1d9TjtgzIqyIa3mU/
	UqaHd6klwyChJ1H43qKvVBLZk+FGjmlXgrsJDk=
X-Received: by 2002:a05:6820:28c7:b0:6b1:5637:e10b with SMTP id 006d021491bc7-6b16b2f5fddmr5652737eaf.7.1787422057715;
        Sat, 22 Aug 2026 11:07:37 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e0ca:316a:4629:d835? ([2600:8803:e7e4:500:e0ca:316a:4629:d835])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b13cb557c1sm12256661eaf.2.2026.08.22.11.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 11:07:37 -0700 (PDT)
Message-ID: <32545533-b792-41a9-91e0-5353112cbb62@baylibre.com>
Date: Sat, 22 Aug 2026 13:07:36 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: iio: Correct ADXL380 filter descriptions
To: Randy Dunlap <rdunlap@infradead.org>,
 Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260822073653.54545-1-kmehltretter@gmail.com>
 <a1eb791e-64b5-4602-8b5f-afe1ac15b7db@infradead.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <a1eb791e-64b5-4602-8b5f-afe1ac15b7db@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/26 12:00 PM, Randy Dunlap wrote:
> Hi,
> 
> On 8/22/26 12:36 AM, Karl Mehltretter wrote:
>> The high-pass attributes were described as low-pass filters and vice
>> versa. Correct all four descriptions.
>>
>> Fixes: b6a097a9af00 ("docs: iio: add documentation for adxl380 driver")
>> Assisted-by: Codex:gpt-5.6-sol
>> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>> ---
>>  Documentation/iio/adxl380.rst | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/iio/adxl380.rst b/Documentation/iio/adxl380.rst
>> index 654d4c0e84a19..a1c249dc2e51c 100644
>> --- a/Documentation/iio/adxl380.rst
>> +++ b/Documentation/iio/adxl380.rst
>> @@ -39,13 +39,13 @@ specific device folder path ``/sys/bus/iio/devices/iio:deviceX``.
>>  +---------------------------------------------------+----------------------------------------------------------+
>>  | in_accel_scale                                    | Scale for the accelerometer channels.                    |
>>  +---------------------------------------------------+----------------------------------------------------------+
>> -| in_accel_filter_high_pass_3db_frequency           | Low pass filter bandwidth.                               |
>> +| in_accel_filter_high_pass_3db_frequency           | High pass filter bandwidth.                              |
>>  +---------------------------------------------------+----------------------------------------------------------+
>> -| in_accel_filter_high_pass_3db_frequency_available | Available low pass filter bandwidth configurations.      |
>> +| in_accel_filter_high_pass_3db_frequency_available | Available high pass filter bandwidth configurations.     |
>>  +---------------------------------------------------+----------------------------------------------------------+
>> -| in_accel_filter_low_pass_3db_frequency            | High pass filter bandwidth.                              |
>> +| in_accel_filter_low_pass_3db_frequency            | Low pass filter bandwidth.                               |
>>  +---------------------------------------------------+----------------------------------------------------------+
>> -| in_accel_filter_low_pass_3db_frequency_available  | Available high pass filter bandwidth configurations.     |
>> +| in_accel_filter_low_pass_3db_frequency_available  | Available low pass filter bandwidth configurations.      |
>>  +---------------------------------------------------+----------------------------------------------------------+
>>  | in_accel_x_calibbias                              | Calibration offset for the X-axis accelerometer channel. |
>>  +---------------------------------------------------+----------------------------------------------------------+
> 
> These changes LGTM. Thanks.
> 
> Although I am a bit confused. When I look at the adxl380 driver,
> I don't see any of these device attributes.
> The attributes with these names are in other drivers/iio/accel/
> drivers: bma180.c, mma8452.c, and sca3000.c
> Can someone try to explain this, please?
> thanks.
> 

The attributes come from:

	.info_mask_shared_by_type =					\
		BIT(IIO_CHAN_INFO_SCALE) |				\
		BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY) |	\
		BIT(IIO_CHAN_INFO_HIGH_PASS_FILTER_3DB_FREQUENCY),	\
	.info_mask_shared_by_type_available =				\
		BIT(IIO_CHAN_INFO_SCALE) |				\
		BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY) |	\
		BIT(IIO_CHAN_INFO_HIGH_PASS_FILTER_3DB_FREQUENCY),	\

in adxl380.c

Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757843382E1
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 14:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114984; cv=none; b=gB2JqhUOvNcCor+OKwcigyw+X6zy79tEnXN+XqYt6LQXLjlmrujXtttQ6AnHDoBOqIilOmySBHoidHdMx3D6XrAC50T+y/o7btIVO5PlH41/PS3kT6RjEosDMzTRR1/3pggtgfgVfxA9juH/GdH69CYus49dTVKZnabJQhZCeMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114984; c=relaxed/simple;
	bh=1bKPGOExErouOjpPrT3S8xZj1iI3DTU5rL/7YJ3AEFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=slRPeVtOCiSNPJFkAMHyeiTw109uV05Xn/aUT+ro7mEAdz34bG26gHCr5KZ4lWXP6FvRHuMlKSQwr/tybKiGA5DcjothFRI5jw1vwyiQdpSHfGQAiPqfjKnFsMdHM6e3iJX2sxARnPRSOwlVs4r+IhT+yKe2l3GlSnkEL33fkYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Oq0fjro5; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Oq0fjro5"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7dcd689829eso2066647a34.3
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779114980; x=1779719780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vLwaPu255e3pjQ0cFx1rgIs4MewOKBP6Q9vMpdbPUGw=;
        b=Oq0fjro5KIfsejJ87DhSc3vsTad5eMsITAACmCBFJ5azZrac71mcOW0eXK7/nBExu+
         kA+yactrjqSm+2spRHD2JgafYkZEhkNKe8MB8DfiUqBkWa+0Egtku+iNnvc6v7/8xD0E
         vFDF2ogqdZpYHNpE3hW8lruYI/swht1jY3s3Yj6GHoQuTQQ+1+2+29UHGP8OnW3uxTno
         8I+h9hbB73L0bK2ZOthR+i6XwXmTIWGralE2YUg8elzpPl4NsYPYrYnWj6ksZTAdSbBM
         v0YywaihQd2ouaVlh331Hebu1tNoHohJ23jqRQwv+x4TZLgyW6o0EL6LrC6jtNZGrHib
         +JGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114980; x=1779719780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLwaPu255e3pjQ0cFx1rgIs4MewOKBP6Q9vMpdbPUGw=;
        b=ajCbE/X8XqLQ+nS2yWB8CoE0YysltrYhI/v0i04LjJTjEgDehYeZCkvcZqFNuiC7Pb
         B/ofieRzbcEx8C7RjdYJlSJqwgC53R998A6iVabUcOTvEvr4VaKezAJzmZEEFQK1knQL
         uosrBLVq013RcwJVbhpINEILDAQrb+4wZYKkujzHdhpRCCeSyOSR5IMGg4I0n4gp33Yz
         jiNZ3wergsHDX7RQ8pvT8FdIG2LwoETw7sC3c7rdYNCu3qPDz8MDpLkw8wcCJll06DMV
         UNPWU7zVyPZCNusLwwnBV+5WqPO5ownt0MdZ1nJcbTvtZiCl+QnrY1Ra0tYSCkeyg9hX
         t3vQ==
X-Forwarded-Encrypted: i=1; AFNElJ9x9EfAl37thMTjGzEmcPUVV5G4AYwnMQXZ/qxHVMOk2OiZFnSlPc8XHI9IWmit9j/aFEAvdgcRtzw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+K666S8vUEmKQapPoYZn/vfUO8FHOI7Eo+SJF5+0xs9LJ+JpA
	l9WfwDy7MSoqit/d0H1rHe0FLfxozKjufJjVFY5EmXR995fRZdSkk/ywg99DqOqttoI=
X-Gm-Gg: Acq92OEse8LoRY3ovbohkyJ7jTfY2cP3sDZZBgj+qF0N6fj8LEQ7Mcfx3vpsaN22/zr
	ocQES731ha90zr4tbODE59oe4M+n9ZSk2d2gDaNXancZeAC0lTNQWKOWcT6CgnBCjj0xncN57T0
	ucNBr5AOSnlLQnICWrw5sE8kSGAHU1tJC1oxzkeNs1vse1/fj328gTrooE6qyIFW7l4X02U5TEE
	ID8mROGQWYAFQz65B1AkYcdRkM0+AJW8lf6fUE/9/FZWts9K9HzOcAC6LpveUDFCZwQxO1YI/H3
	B+mlK0ldJf9nHLJdggbcafV+0VNxQhS/Ok621t1Rqb9VctN/S7Twh7OGdJrzgMxHCVyJsGHUKkz
	WpnOLCjxyR2a5nP9kQBg3O5dMOps39Uoh1lzWu1WWIAUGBoyXAl2CspChz0TrW2HXiUPO3N8zNS
	WD+TyMRWSR2xJiamh+sv1N8POCjoSGcPWmqX/GgTNiHf7jh5MLQfDm7Y9gFE5Hb4mdXbtAW/MWU
	Wr8kRYsdu4I
X-Received: by 2002:a05:6830:3902:b0:7e3:ef86:19f6 with SMTP id 46e09a7af769-7e4ea19d771mr10631883a34.8.1779114980228;
        Mon, 18 May 2026 07:36:20 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3be6:1187:fed4:378b? ([2600:8803:e7e4:500:3be6:1187:fed4:378b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b7c6b29sm7794934a34.1.2026.05.18.07.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:36:19 -0700 (PDT)
Message-ID: <c9610990-6b40-40a8-948c-fa1209242dbe@baylibre.com>
Date: Mon, 18 May 2026 09:36:18 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/6] iio: adc: ad4691: add triggered buffer support
To: Jonathan Cameron <jic23@kernel.org>
Cc: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260515-ad4692-multichannel-sar-adc-driver-v11-0-eab27d852ac2@analog.com>
 <20260515-ad4692-multichannel-sar-adc-driver-v11-3-eab27d852ac2@analog.com>
 <9b7986e1-6550-415d-b301-33089ba10177@baylibre.com>
 <20260517132526.27c71b70@jic23-huawei>
 <58a66855-9fb3-48ca-8cae-ff9277f745df@baylibre.com>
 <20260518152103.4d428c1e@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260518152103.4d428c1e@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/18/26 9:21 AM, Jonathan Cameron wrote:
> On Sun, 17 May 2026 14:21:30 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 5/17/26 7:25 AM, Jonathan Cameron wrote:
>>> On Sat, 16 May 2026 12:32:51 -0500
>>> David Lechner <dlechner@baylibre.com> wrote:
>>>   
>>>> On 5/15/26 8:31 AM, Radu Sabau via B4 Relay wrote:  
>>>>> From: Radu Sabau <radu.sabau@analog.com>
>>>>>
>>>>> Add buffered capture support using the IIO triggered buffer framework.
>>>>>
>>>>> CNV Burst Mode: the GP pin identified by interrupt-names in the device
>>>>> tree is configured as DATA_READY output. The IRQ handler stops
>>>>> conversions and fires the IIO trigger; the trigger handler executes a
>>>>> pre-built SPI message that reads all active channels from the AVG_IN
>>>>> accumulator registers and then resets accumulator state and restarts
>>>>> conversions for the next cycle.
>>>>>
>>>>> Manual Mode: CNV is tied to SPI CS so each transfer simultaneously
>>>>> reads the previous result and starts the next conversion (pipelined
>>>>> N+1 scheme). At preenable time a pre-built, optimised SPI message of
>>>>> N+1 transfers is constructed (N channel reads plus one NOOP to drain
>>>>> the pipeline). The trigger handler executes the message in a single
>>>>> spi_sync() call and collects the results. An external trigger (e.g.
>>>>> iio-trig-hrtimer) is required to drive the trigger at the desired
>>>>> sample rate.
>>>>>
>>>>> Both modes share the same trigger handler and push a complete scan —
>>>>> one big-endian 16-bit (__be16) slot per active channel, densely packed
>>>>> in scan_index order, followed by a timestamp.
>>>>>
>>>>> The CNV Burst Mode sampling frequency (PWM period) is exposed as a
>>>>> buffer-level attribute via IIO_DEVICE_ATTR.
>>>>>
>>>>> Signed-off-by: Radu Sabau <radu.sabau@analog.com>  
>>>   
>>>>> +
>>>>> +static int ad4691_manual_buffer_preenable(struct iio_dev *indio_dev)
>>>>> +{
>>>>> +	struct ad4691_state *st = iio_priv(indio_dev);
>>>>> +	unsigned int k, i;
>>>>> +	int ret;
>>>>> +
>>>>> +	memset(st->scan_xfers, 0, sizeof(st->scan_xfers));
>>>>> +	memset(st->scan_tx, 0, sizeof(st->scan_tx));
>>>>> +
>>>>> +	spi_message_init(&st->scan_msg);
>>>>> +
>>>>> +	k = 0;
>>>>> +	iio_for_each_active_channel(indio_dev, i) {
>>>>> +		if (i >= indio_dev->num_channels - 1)
>>>>> +			break; /* skip soft timestamp */    
>>>>
>>>> I don't think timestamp gets set in the scan mask. It is handled separately.  
>>>
>>> FWIW that is a sashiko false postive (I believe anyway!)
>>> If we do hit this please shout as we have a core bug.
>>>
>>> If anyone has time to look at how hard it would be to tweak
>>> iio_for_each_active_channel to skip a last element timestamp that
>>> would be great.
>>>
>>> I think that iterates one too far which is what sashiko is tripping over.
>>>
>>> I'm only keen to fix that if we can make it low cost and hid it entirely
>>> from drivers.
>>>
>>> Jonathan
>>>   
>> This is what I came up with (totally untested).
>>
>> Since timestamp can never be set in scan_mask/active_scan_mask, it should
>> be safe to exclude it from masklength without breaking existing code.
> Probably... 
>>
>> I didn't check all callers of masklength/iio_get_masklength() though.
> 
> That was the bit that made me nervous. Particularly if there is an off
> by one that is working by luck today - or someone who understood this
> oddity and did it deliberately.
> 
> At one point we also had a few other timestamps - the ones come from hardware.
> I can't remember how we handled those wrt to the scan mask.  I took a quick
> look and thing they are all fine. 
> FWIW a nice precursor would be to make sure all timestamp channels are assigned
> using the macro. There are a few that are hand crafted.  I tested a few, but obviously
> needs turning in to a proper set and cleaning up.
> 
> diff --git a/drivers/iio/adc/ad4170-4.c b/drivers/iio/adc/ad4170-4.c
> index 627cbf5a37b0..890e25294baa 100644
> --- a/drivers/iio/adc/ad4170-4.c
> +++ b/drivers/iio/adc/ad4170-4.c
> @@ -2385,9 +2385,7 @@ static int ad4170_parse_channels(struct iio_dev *indio_dev)
>  	}
>  
>  	/* Add timestamp channel */
> -	struct iio_chan_spec ts_chan = IIO_CHAN_SOFT_TIMESTAMP(chan_num);
> -
> -	st->chans[chan_num] = ts_chan;
> +	st->chans[chan_num] = IIO_CHAN_SOFT_TIMESTAMP(chan_num);
>  	num_channels = num_channels + 1;
>  
>  	indio_dev->num_channels = num_channels;
> diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> index 6e1930f7c65d..56baca1f5026 100644
> --- a/drivers/iio/adc/at91_adc.c
> +++ b/drivers/iio/adc/at91_adc.c
> @@ -521,13 +521,7 @@ static int at91_adc_channel_init(struct iio_dev *idev)
>  	}
>  	timestamp = chan_array + idx;
>  
> -	timestamp->type = IIO_TIMESTAMP;
> -	timestamp->channel = -1;
> -	timestamp->scan_index = idx;
> -	timestamp->scan_type.sign = 's';
> -	timestamp->scan_type.realbits = 64;
> -	timestamp->scan_type.storagebits = 64;
> -
> +	*timestamp = IIO_CHAN_SOFT_TIMESTAMP(idx);
>  	idev->channels = chan_array;
>  	return idev->num_channels;
>  }
> diff --git a/drivers/iio/adc/cc10001_adc.c b/drivers/iio/adc/cc10001_adc.c
> index 2c51b90b7101..d42b747325aa 100644
> --- a/drivers/iio/adc/cc10001_adc.c
> +++ b/drivers/iio/adc/cc10001_adc.c
> @@ -262,7 +262,7 @@ static const struct iio_info cc10001_adc_info = {
>  static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
>  				    unsigned long channel_map)
>  {
> -	struct iio_chan_spec *chan_array, *timestamp;
> +	struct iio_chan_spec *chan_array;
>  	unsigned int bit, idx = 0;
>  
>  	indio_dev->num_channels = bitmap_weight(&channel_map,
> @@ -289,13 +289,7 @@ static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
>  		idx++;
>  	}
>  
> -	timestamp = &chan_array[idx];
> -	timestamp->type = IIO_TIMESTAMP;
> -	timestamp->channel = -1;
> -	timestamp->scan_index = idx;
> -	timestamp->scan_type.sign = 's';
> -	timestamp->scan_type.realbits = 64;
> -	timestamp->scan_type.storagebits = 64;
> +	chan_array[idx] = IIO_CHAN_SOFT_TIMESTAMP(idx);
>  
>  	indio_dev->channels = chan_array;
>  
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 96b05c86c325..702b2fc66326 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -353,7 +353,7 @@ static inline bool iio_channel_has_available(const struct iio_chan_spec *chan,
>  		(chan->info_mask_shared_by_all_available & BIT(type));
>  }
>  
> -#define IIO_CHAN_SOFT_TIMESTAMP(_si) {					\
> +#define IIO_CHAN_SOFT_TIMESTAMP(_si) (struct iio_chan_spec) {		\
>  	.type = IIO_TIMESTAMP,						\
>  	.channel = -1,							\
>  	.scan_index = _si,						\
> 
> Doing that will mean we can spot any unusual use of IIO_TIMESTAMP much more
> easily.
> 
> Anyhow, basic approach looks good to me.

I guess you didn't see the other series cleaning up IIO_TIMESTAMP I already
sent yet.

> 
> Jonathan
> 
> 
> 
>>
>> ---
>> diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
>> index 9d66510a1d49..17f539fc23e2 100644
>> --- a/drivers/iio/industrialio-buffer.c
>> +++ b/drivers/iio/industrialio-buffer.c
>> @@ -2300,8 +2300,10 @@ int iio_buffers_alloc_sysfs_and_mask(struct iio_dev *indio_dev)
>>  	if (channels) {
>>  		int ml = 0;
>>  
>> -		for (i = 0; i < indio_dev->num_channels; i++)
>> -			ml = max(ml, channels[i].scan_index + 1);
>> +		for (i = 0; i < indio_dev->num_channels; i++) {
>> +			if (channels[i].type != IIO_TIMESTAMP)
>> +				ml = max(ml, channels[i].scan_index + 1);
>> +		}
>>  		ACCESS_PRIVATE(indio_dev, masklength) = ml;
>>  	}
>>  
>>
>>
>>
> 


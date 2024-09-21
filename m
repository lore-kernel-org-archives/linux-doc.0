Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D627A15573F
	for <linux-doc@vger.kernel.org>; Sat, 21 Sep 2024 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726918339; cv=none; b=nouNqtsYvWAEPvUR0/4nPHVuqFGjWGXdkbad7H+qo6HeJ29XTxfu0ewx56Yx0wXvWMv0oaSjve6amBRl7FqFX/DY1fNocVD+Kz2GA3/3PbW5/N/BXO0KGrSYYZwK1gaiv7x1cWd7XsiIRwEVlD3Hs9rIy2mt+wCmqRrHvTXPTM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726918339; c=relaxed/simple;
	bh=tgclWoRDKRZCOSSiD5kpfzSntukRaN6GHyK25OTnmI8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s5MrVDm3UkNnFUvWKUP89ZFphmbd2rQP5iPId4w0UN7oK+8gts8Kmv4ok0909+nX1acuXwtfCIgPaPWg1NSeYe1wJXv2zr3QsEAaywnSGDWYflANzgmEr+6tL/yXQy2kCyTAKJmEKuY/RsyqgBk2VZwSLKqiXb9eEf3ErXv9Ikg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=G9FvwEAl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="G9FvwEAl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so24888665e9.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Sep 2024 04:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726918334; x=1727523134; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZQ3L7OUeikJuMGaBbthBREsBmXKajhlbyArgG1p4gk=;
        b=G9FvwEAloC0ls+8KO80tYjVIBB4lIaxeLo5cDuj5iuYYEiyq3JMtQu08KtnwoqItnb
         2XZM4QDDhbIfg4SUcIB/2opMY814ARQ247pBIiMJiuIYBIQyppfLvDQc124IPmiGoNbS
         9M6hjCZfqlkKW5C3Ux6q9kLNhqvQQLIMnV4kMkQmKQOIeGKOx4/Jhq6iFZBlF+yIg+BH
         s52/Y0kwNKO0jUWtCW34E4AGBR81VR5dN1cywXHcpUBejZ6tKWj6ypdKMA7GpXoEM1fd
         0pv5wh7x36bot/8d4DF5fv3J2yP3tTNIXKUlisYAl8idNRn6m2RxMxRFdAOoPiZ1z4SR
         oi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726918334; x=1727523134;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZQ3L7OUeikJuMGaBbthBREsBmXKajhlbyArgG1p4gk=;
        b=jCdnxNolz6qFLTgGfLQM2qQx8VTbhWtv1g77/priXvAfaYhc+aFnOG7l4xf+Q1z6tw
         c3VyNQA4kIFdk9P5lq00FMNZv1DRHtvOUhfdlkTPqHBnvUKZdN2Q1hFMl7HZT53gIdaS
         WKGncq0ZHQbHBjZVO7dvLmf+rIiec2DygWus7o/9LlLZk0w9U2tvf2WnFhpALHlfGDR7
         bkFZim6+j7BQ4VZQFRyNYnGhxkD6xFK6GelqqEOk4HHi0raKGf1dX+EUdTOIMk5RQ4be
         MfCC1g/JDRpZdhvf1zbuU4ioT0QuSP/6JxqWPPQxbkbwXsLGcA9V0ZFz8TI9dvI36ISk
         o0jQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8pMFYKWSDj7zfYNIk/6aVeY+D9GgS7XME4bBb2bBuHkP9b1VaBKgDubvsF7vExYND3LrrJ5qho7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtmglXkyEeyE7kKcwV+VG/53VAQ21pnImVKjS6rWe3Zaxv/0ez
	chuKxYowZU2T5A9ONfDR/ddWzk0Qz3a1XZVvMc9RWdA9HjmsIKWJgGTyut4wCZjqcgFBmVTP8ap
	c
X-Google-Smtp-Source: AGHT+IFidnTn2QQ5dzsI4+vZ+5O0GpiKtTnG3H8DKDvVo1s38sWxKVPZm7I5CGtivKliSwy2cDOnpw==
X-Received: by 2002:a05:600c:310a:b0:42c:a89e:b0e6 with SMTP id 5b1f17b1804b1-42e7abe8e3emr42328335e9.11.1726918333444;
        Sat, 21 Sep 2024 04:32:13 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e023:26f7:6d8c:43fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afd7490sm47959925e9.28.2024.09.21.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 04:32:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jean Delvare <jdelvare@suse.com>,  Jonathan Corbet <corbet@lwn.net>,
  linux-kernel@vger.kernel.org,  linux-hwmon@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (pmbus/core) improve handling of write
 protected regulators
In-Reply-To: <4052294e-7b7f-4238-9b47-92727de4d516@roeck-us.net> (Guenter
	Roeck's message of "Fri, 20 Sep 2024 14:13:58 -0700")
References: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
	<20240920-pmbus-wp-v1-4-d679ef31c483@baylibre.com>
	<4052294e-7b7f-4238-9b47-92727de4d516@roeck-us.net>
Date: Sat, 21 Sep 2024 13:32:10 +0200
Message-ID: <1jsettz1hh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 20 Sep 2024 at 14:13, Guenter Roeck <linux@roeck-us.net> wrote:

> On 9/20/24 09:47, Jerome Brunet wrote:
>> Writing PMBus protected registers does succeed from the smbus perspective,
>> even if the write is ignored by the device and a communication fault is
>> raised. This fault will silently be caught and cleared by pmbus irq if one
>> has been registered.
>> This means that the regulator call may return succeed although the
>> operation was ignored.
>> With this change, the operation which are not supported will be properly
>> flagged as such and the regulator framework won't even try to execute them.
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/hwmon/pmbus/pmbus.h      |  4 ++++
>>   drivers/hwmon/pmbus/pmbus_core.c | 35 ++++++++++++++++++++++++++++++++++-
>>   include/linux/pmbus.h            | 14 ++++++++++++++
>>   3 files changed, 52 insertions(+), 1 deletion(-)
>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>> index 5d5dc774187b..76cff65f38d5 100644
>> --- a/drivers/hwmon/pmbus/pmbus.h
>> +++ b/drivers/hwmon/pmbus/pmbus.h
>> @@ -481,6 +481,8 @@ struct pmbus_driver_info {
>>   /* Regulator ops */
>>     extern const struct regulator_ops pmbus_regulator_ops;
>> +int pmbus_regulator_init_cb(struct regulator_dev *rdev,
>> +			    struct regulator_config *config);
>>     /* Macros for filling in array of struct regulator_desc */
>>   #define PMBUS_REGULATOR_STEP(_name, _id, _voltages, _step, _min_uV)  \
>> @@ -495,6 +497,7 @@ extern const struct regulator_ops pmbus_regulator_ops;
>>   		.n_voltages = _voltages,			\
>>   		.uV_step = _step,				\
>>   		.min_uV = _min_uV,				\
>> +		.init_cb = pmbus_regulator_init_cb,		\
>>   	}
>>     #define PMBUS_REGULATOR(_name, _id)   PMBUS_REGULATOR_STEP(_name,
>> _id, 0, 0, 0)
>> @@ -510,6 +513,7 @@ extern const struct regulator_ops pmbus_regulator_ops;
>>   		.n_voltages = _voltages,			\
>>   		.uV_step = _step,				\
>>   		.min_uV = _min_uV,				\
>> +		.init_cb = pmbus_regulator_init_cb,		\
>>   	}
>>     #define PMBUS_REGULATOR_ONE(_name)   PMBUS_REGULATOR_STEP_ONE(_name,
>> 0, 0, 0)
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 82522fc9090a..363def768888 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -2714,8 +2714,21 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>>   	if (!(data->flags & PMBUS_NO_WRITE_PROTECT)) {
>>   		ret = _pmbus_read_byte_data(client, 0xff, PMBUS_WRITE_PROTECT);
>>   -		if (ret > 0 && (ret & PB_WP_ANY))
>> +		switch (ret) {
>> +		case PB_WP_ALL:
>> +			data->flags |= PMBUS_OP_PROTECTED;
>> +			fallthrough;
>> +		case PB_WP_OP:
>> +			data->flags |= PMBUS_VOUT_PROTECTED;
>> +			fallthrough;
>> +		case PB_WP_VOUT:
>>   			data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
>> +			break;
>> +
>> +		default:
>> +			/* Ignore manufacturer specific and invalid as well as errors */
>> +			break;
>> +		}
>>   	}
>>     	if (data->info->pages)
>> @@ -3172,8 +3185,12 @@ static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
>>   {
>>   	struct device *dev = rdev_get_dev(rdev);
>>   	struct i2c_client *client = to_i2c_client(dev->parent);
>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>>   	int val, low, high;
>>   +	if (data->flags & PMBUS_VOUT_PROTECTED)
>> +		return 0;
>> +
>>   	if (selector >= rdev->desc->n_voltages ||
>>   	    selector < rdev->desc->linear_min_sel)
>>   		return -EINVAL;
>> @@ -3208,6 +3225,22 @@ const struct regulator_ops pmbus_regulator_ops = {
>>   };
>>   EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
>>   +int pmbus_regulator_init_cb(struct regulator_dev *rdev,
>> +			    struct regulator_config *config)
>> +{
>> +	struct pmbus_data *data = config->driver_data;
>> +	struct regulation_constraints *constraints = rdev->constraints;
>> +
>> +	if (data->flags & PMBUS_OP_PROTECTED)
>> +		constraints->valid_ops_mask &= ~REGULATOR_CHANGE_STATUS;
>> +
>> +	if (data->flags & PMBUS_VOUT_PROTECTED)
>> +		constraints->valid_ops_mask &= ~REGULATOR_CHANGE_VOLTAGE;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(pmbus_regulator_init_cb, PMBUS);
>> +
>
> I am a bit at loss trying to understand why the constraints can't be passed
> with the regulator init_data when registering the regulator. Care to explain ?

Sure it something I found while working the problem out.

Simply put:
 * you should be able to, in theory.
 * currently it would not work
 * when fixed I think it would still be more complex to do so.

ATM, if you pass init_data, it will be ignored on DT platforms in
favor of the internal DT parsing of the regulator framework. The DT
parsing sets REGULATOR_CHANGE_STATUS as long as the always-on prop is
not set ... including for write protected regulator obviously.

This is something that might get fix with this change [1]. Even with that
fixed, passing init_data systematically would be convenient only if you
plan on skipping DT provided constraints (there are lot of those), or
redo the parsing in PMBus.

Also a callback can be attached to regulator using the pmbus_ops, and
only those. PMBus core just collect regulators provided by the drivers
in pmbus_regulator_register(), there could other type of regulators in
the provided table (something the tps25990 could use). It is difficult
to set/modify the init_data (or the ops) in pmbus_regulator_register()
because of that.

Using a callback allows to changes almost nothing to what is currently
done, so it is safe and address the problem regardless of the
platform type. I think the solution is fairly simple for both regulator
and pmbus. It could be viewed as just as extending an existing
callback. I chose to replace it make things more clear.

Changes [1] and this patchset are independent because of how I implement
the solution and [1] would still be relevant if this patchset was
rejected. It is the reason why I sent it separately.

[1]: https://lore.kernel.org/r/20240920-regulator-ignored-data-v1-1-7ea4abfe1b0a@baylibre.com

>
> Thanks,
> Guenter

-- 
Jerome

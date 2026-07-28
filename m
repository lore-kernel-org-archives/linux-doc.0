Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA7140A95F
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 21:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785272762; cv=none; b=QZB254FZX88S8EiMa7G7JyJafEfvqEX4QH+4eEeQPEHezhM6onhqPIJLE9GPznxG4W7R8F65WRzJy2XbRmtrY8JvtLm8b3MkOzIw0ejVwidUvE3Eqz+I6GqHscQTPIAONlc9oqjNDS0qi6K/ej0M3j9+RbF6rY0BrJkRCsf4Xbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785272762; c=relaxed/simple;
	bh=N2+nXpNyACF1rpMlAzH8tbNJY/2BHjoHH0QSgWsXBKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aRd4IuFWmRaCBsFnGnjRYncyPDF/KjdZ4daqG0qr3j8ZgM6SBO1CFimeYCrUo0CZaWgrV/xFRLxtk3PuRQtfd9jycI/U3d1geqiWCRk3jw4Zt33sbS5YKG8B9H2RKNMMt27+eFUHX9B+gmBx5kC0hhn8k239e8WCMOs5/jEiAZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZX7BkMNb; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZX7BkMNb"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84830c774a0so329010b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 14:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785272761; x=1785877561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmILGb1kKg5XBWfg6G5XWtNba2Ww2zGk81kke76Xo28=;
        b=ZX7BkMNbxGRHhI6QmDhMqv/s3ezxuuFsyL9e77Amq3jDizl9w4ckBjYu9vs92ubFn4
         UaB3ViNrdL3zm2bSOyYPdAOFI/2YZfR9yTBlneX2UgLgVPsc8W05XEiHrnsgOKFRP3bl
         gKD9JrJMHFe2js/wsExEat3wdn1EPVESau3hP12rrK1wYeDXjBQSAZ4NoVxEe/6Et1U5
         QshJXf9faGZTTATNc6yasDy2VZpKbMUEWFBpDs0tPqv7Q8pmXRzEH77xEnY9t04Z0QOG
         zgNjyN8Ztk/sPd9k1o6PeD092t661KbnTDPdQCyp3MTWuSt9MyeuMphatcWG79sMBfXH
         IfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272761; x=1785877561;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FmILGb1kKg5XBWfg6G5XWtNba2Ww2zGk81kke76Xo28=;
        b=W7H4F9wGSce1o9TtHTq0+DypAsCS3sZOJ5YqFgyRSzzE+AnG5Cdu6vrt7Yi8wWqO/C
         KxjSxLaQb3TRSMv3gGGRnQXEmSj0Tpy0yZiKvPopphyf7kWJ0E6jXgjFKEj/ggixkjQm
         R5wxPB3Gn6dOIdbxaZ4dZSTO+d7UxtUus8Uc0NhWMO3aIRE4vu9ziwKh81IDdpCDfEVM
         MQQ5L4aaHY5tKZIFHO5uGrV/Gljvewv7gZWBHXLnXOwrA3SkXngTGJ71ZUUN53eTwjrp
         2XWHrw4PVlzpMUmkf+IhIzUyFrCRFiMcse3nSI7qtiluoqM+PgRnuI4+Rv9sPvwqwq+4
         R42Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp6H6I2IIs+Eoo9mUtpxvHVkDBQkOBqwaWcb5k+6Cx3AYEhumLnDUk5uXTiaobvd1aasxhg+btKfcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+c1cRWLLczODSHh6adYYODhfSwVUhMf7+pk6R1rEiaQqUB4wb
	mDqMDwwrgpn+Js7aOZIreIZpi68jY4LGHsUzR66unJW/yo8UZ+E95UcJ
X-Gm-Gg: AR+sD10vG3hh6NMeq116Pm/bk+qMs3isQANV3Jaj2zI7/270glbmuJjTf3x7MmjtI7d
	Og3QCCKnPlhmNvN/h9VV3fUoFd84nEo0lW+VvSBsmbqKU/T4WjsFyzyuOHx+7pxYLnlhPMdgLge
	w9d3DsEskZNJZExAgE4NJmZHL44lRKFIN/Y3L5q0w69CJfDtNimvQSZBBvYh1ZegoqnJdSv1TsI
	mkMgZ5c5KHrmMi5yAWmH3y+Vg3RzPyTKxaoycveDM8TRZsi5CmyTubRYyFfKoMkfj1SWnP3c6P2
	t02MeL0kq65P6WS53ny28+siY2q/5waIKqyyp9xAmOIKyRCHrIooeMwSuaYhHWkdMvCNC/qmqzN
	wzkIEZnCnL91tl1Xoh4ItWAB9BjzL+KmEOSxGt4ew0cQJaksYzTHHT3ZNu3XtSk2MSMVD9u2xma
	cZkaBC/Rvog+9bsyfUdpoZLxrR+PQ+dpI7IX2P0/KkH/fdN14GBCj7hO++ELjRIQ==
X-Received: by 2002:a05:6a00:288b:b0:848:6a95:a9d3 with SMTP id d2e1a72fcca58-84e933e8da0mr4559081b3a.40.1785272756034;
        Tue, 28 Jul 2026 14:05:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0373cc7sm418323b3a.41.2026.07.28.14.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 14:05:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c3e143ed-af08-4a0f-a630-96a255df838d@roeck-us.net>
Date: Tue, 28 Jul 2026 14:05:53 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Alan Tull <atull@opensource.altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> This is in preparation for adding support to a device which needs to
> use it's own read_block implementation.
> 

The chip-specific implementation calls i2c_smbus_read_i2c_block_data().
I'll need to know if this is a chip limit or a controller limit.
If it is a controller limit, a chip specific override would be
inappropriate.

Guenter

> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>   drivers/hwmon/pmbus/pmbus.h      |  3 +++
>   drivers/hwmon/pmbus/pmbus_core.c | 24 ++++++++++++++++++++++--
>   2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 3d5586c67f84..d697939ec892 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -459,6 +459,9 @@ struct pmbus_driver_info {
>   	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
>   	int (*read_word_data)(struct i2c_client *client, int page, int phase,
>   			      int reg);
> +	/* size of data_buf is I2C_SMBUS_BLOCK_MAX + 2 */
> +	int (*read_block_data)(struct i2c_client *client, int page, u8 reg,
> +			       char *data_buf);
>   	int (*write_byte_data)(struct i2c_client *client, int page, int reg,
>   			      u8 byte);
>   	int (*write_word_data)(struct i2c_client *client, int page, int reg,
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 7b58f7198574..ff4572c473b7 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -533,6 +533,26 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
>   	return rv;
>   }
>   
> +/*
> + * _pmbus_read_block_data() is similar to pmbus_read_block_data(), but checks if
> + * a device specific mapping function exists and calls it if necessary.
> + */
> +static int _pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
> +				  char *data_buf)
> +{
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	const struct pmbus_driver_info *info = data->info;
> +	int status;
> +
> +	if (info->read_block_data) {
> +		status = info->read_block_data(client, page, reg, data_buf);
> +		if (status != -ENODATA)
> +			return status;
> +	}
> +
> +	return pmbus_read_block_data(client, page, reg, data_buf);
> +}
> +
>   static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
>   					      int reg)
>   {
> @@ -678,7 +698,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
>   	struct pmbus_data *data = i2c_get_clientdata(client);
>   	char data_buf[I2C_SMBUS_BLOCK_MAX + 2];
>   
> -	rv = pmbus_read_block_data(client, page, reg, data_buf);
> +	rv = _pmbus_read_block_data(client, page, reg, data_buf);
>   	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
>   		rv = pmbus_check_status_cml(client);
>   	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
> @@ -3564,7 +3584,7 @@ static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
>   	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
>   
>   	scoped_guard(pmbus_lock, client) {
> -		rc = pmbus_read_block_data(client, entry->page, entry->reg, data);
> +		rc = _pmbus_read_block_data(client, entry->page, entry->reg, data);
>   		if (rc < 0)
>   			return rc;
>   	}
> 


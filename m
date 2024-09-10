Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC124175D4F
	for <linux-doc@vger.kernel.org>; Tue, 10 Sep 2024 06:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725950603; cv=none; b=PNMMi2KdVq2+U3cHNVxxrS1luutaGOPpMVG5tul2XJitCZYG4d1SOQt/HPAt3BwLo86qFn9+BkO4ZZdGZu4bWnPQtAYuDOMyrdi6aVEdtl4L6LqGWZZAdAmWtK31iC17JjYYURDsRhFurxVciBq+AxAtbpoRSmNuKOpl8bs7wRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725950603; c=relaxed/simple;
	bh=na/rRKAm0dtxvPFcGIyuBVMyz7/vq21KrFg6CQhI+Jg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BBt4CMHEehRF5q5VFHgjJsOPlmJzGMb8eXpetY1Rac33YRtk7QwAqK7IrATufbVc01FY031HxGDVKC96edc+Q1BIYqP2PS6dLa6UCChFoiQJmGTUtzyRPLg3jxk1o0gimpxTc7YX63cuJyNsTFypO11cy7+u+NLfLlLT7S6UHBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bzYO1fCz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bzYO1fCz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so25668115e9.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Sep 2024 23:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725950598; x=1726555398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHIjfVpopAQsFYDysnM68orgUpUrGZh7owWOhiV6j1E=;
        b=bzYO1fCzYrmv5YPWOEB9bycB8uZjylGJeE3W/gthNYYr9OcE5qvRx24/QUaAmZdovt
         YH216OrZFnaMNIo1QWI207ywRnn7gjdwJbSiXmiDdyQyHyCYEwYYYhrhq9Oc7VYOrxxY
         /CXygSFXaAwbybAyl4j9MS8y2ROQwrJwLgwWeY3XXXbhmZvtZ6KdRFpRsUp3olXjDzTD
         MlCdfXyhp8+4FPM46z4/NXJEV5dn0rD8skOVTd2asQ+tyYtXp1powov1cJSFpU08WvDQ
         9qjbguqFVdcRoAQWoif8PNahiyPRbSR0OCGgOfPmGj3/iG0hC6Z3pEU3DaYgJg8WX9TH
         LuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725950598; x=1726555398;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHIjfVpopAQsFYDysnM68orgUpUrGZh7owWOhiV6j1E=;
        b=NQYepJjkk5SZUpy/dvFGjm+6hh+ps/mbX+0ua5lbhEGvAAZosKMusPkHzDYZhJ3RsB
         eAuXEs64neSCjUgp4csIgiHZeO8NyfgD8bRDTdZXAm30B48SjsqVZ9kSBtvi6TZfdwVd
         HH3s9SNRY/n3Ib76uRdPLBTbvpChWooQR2AfoN8EfDh7rwwIxzyCiNae4+42Vipl6fhC
         HNFSjSiYOmLck9DYauR7k9aKeGO5m3f7lEsJKApOxFkoTcREhiWBMi3t0/isjwvJ48No
         Vq9JwTUfNsXarUnMbSpNv/59fvwNCZC1XaY+aKgzPYV0MGkwlvSx8/J727zsVskYbVlG
         8ntg==
X-Forwarded-Encrypted: i=1; AJvYcCWUL8whaNPE5ApdbjncRWSTX936tIVbbb0LTAjUWQHXuSXzIzqP/Z49RoyQv8Xj+kRrDMdtghbmkeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyduP6fes5LTmrF0hX+3TgYbo/xmjbi4NxZhPXFd0tZbjAEZ88N
	M/HcHiQbLOWZ7TylnACRi9gEa8dQNt75TE+eNWTgCkUKW5VX1NwnDph5elD0ixk=
X-Google-Smtp-Source: AGHT+IEGTUNHbTSsmZjzta3HrF24ou/pG5zqXuiZFFF8PEDIjWSL6u1zq98mgz76KtjH/M2c0b8JiQ==
X-Received: by 2002:a05:600c:1d9f:b0:42c:b220:4769 with SMTP id 5b1f17b1804b1-42cb2204a93mr73976985e9.32.1725950597453;
        Mon, 09 Sep 2024 23:43:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm7872010f8f.66.2024.09.09.23.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 23:43:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Delphine CC
 Chiu <Delphine_CC_Chiu@Wiwynn.com>,  linux-hwmon@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (pmbus/core) add POWER_GOOD signal limits
 support
In-Reply-To: <d76290e0-f5e7-4192-92b8-94f260270fe3@roeck-us.net> (Guenter
	Roeck's message of "Mon, 9 Sep 2024 11:16:41 -0700")
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
	<20240909-tps25990-v1-2-39b37e43e795@baylibre.com>
	<d76290e0-f5e7-4192-92b8-94f260270fe3@roeck-us.net>
Date: Tue, 10 Sep 2024 08:43:16 +0200
Message-ID: <1j8qw0t3ej.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon 09 Sep 2024 at 11:16, Guenter Roeck <linux@roeck-us.net> wrote:

> On 9/9/24 08:39, Jerome Brunet wrote:
>> Add support for POWER_GOOD_ON and POWER_GOOD_OFF standard PMBus commands.
>> For PMBus devices that offer a POWER_GOOD signal, these commands are used
>> for setting the output voltage at which a power good signal should be
>> asserted and negated.
>> Power Good signals are device and manufacturer specific. Many factors
>> other
>> than output voltage may be used to determine whether or not the POWER_GO=
OD
>> signal is to be asserted. PMBus device users are instructed to consult t=
he
>> device manufacturer=E2=80=99s product literature for the specifics of th=
e device
>> they are using.
>> Note that depending on the choice of the device manufacturer that a
>> device
>> may drive a POWER_GOOD signal high or low to indicate that the signal is
>> asserted.
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/hwmon/pmbus/pmbus.h      | 3 +++
>>   drivers/hwmon/pmbus/pmbus_core.c | 6 ++++++
>>   2 files changed, 9 insertions(+)
>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>> index 5d5dc774187b..e322d2dd9fb7 100644
>> --- a/drivers/hwmon/pmbus/pmbus.h
>> +++ b/drivers/hwmon/pmbus/pmbus.h
>> @@ -78,6 +78,9 @@ enum pmbus_regs {
>>   	PMBUS_IIN_OC_FAULT_LIMIT	=3D 0x5B,
>>   	PMBUS_IIN_OC_WARN_LIMIT		=3D 0x5D,
>>   +	PMBUS_POWER_GOOD_ON		=3D 0x5E,
>> +	PMBUS_POWER_GOOD_OFF		=3D 0x5F,
>> +
>>   	PMBUS_POUT_OP_FAULT_LIMIT	=3D 0x68,
>>   	PMBUS_POUT_OP_WARN_LIMIT	=3D 0x6A,
>>   	PMBUS_PIN_OP_WARN_LIMIT		=3D 0x6B,
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbu=
s_core.c
>> index 0ea6fe7eb17c..94ddf0166770 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -1768,6 +1768,12 @@ static const struct pmbus_limit_attr vout_limit_a=
ttrs[] =3D {
>>   		.attr =3D "crit",
>>   		.alarm =3D "crit_alarm",
>>   		.sbit =3D PB_VOLTAGE_OV_FAULT,
>> +	}, {
>> +		.reg =3D PMBUS_POWER_GOOD_ON,
>> +		.attr =3D "good_on",
>> +	}, {
>> +		.reg =3D PMBUS_POWER_GOOD_OFF,
>> +		.attr =3D "good_off",
>>   	}, {
>>   		.reg =3D PMBUS_VIRT_READ_VOUT_AVG,
>>   		.update =3D true,
>>=20
>
> Those attributes are not hardware monitoring attributes and therefore not
> acceptable. In general I am not sure if they should be configurable in the
> first place, but definitely not from the hardware monitoring subsystem.
> Maybe the regulator subsystem callbacks set_over_voltage_protection and
> set_under_voltage_protection would be appropriate (with severity
> REGULATOR_SEVERITY_PROT), but that should be discussed with regulator
> subsystem maintainers.

According to PMBUS spec, there is no protection associated with that
command. It just tells when the output voltage is considered good, when
it is not. What it does after that really depends the device, it may
drive a pin for example (or an LED indicator in my case).

It is very similar to 'crit' or other limits in that sense,
I think. I don't really get why such property is not OK in hwmon then
and why it should not be configurable, if the other limits are ?

I don't mind dropping that completly, that change is not critical to me.
The intent was to contribute something to overall pmbus support.

>
> Thanks,
> Guenter

--=20
Jerome

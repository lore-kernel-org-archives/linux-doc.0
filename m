Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB592C0313
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750439125; cv=none; b=STkzwgzIG9S/ZWWiNZISNeHwo3hByh4iaI5ZKBJiSs4+4lp8zTeAwuA3fxlAuUG3HDioL9KTQDMYBcrTxH/Q2uqS/6MHlgKSqwCnupBjXJfA4myHY+dbsbGrccPz2amBMw24X4cLruATajhdyRk9OLpmy7qUV9Eq7xrLyES+3gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750439125; c=relaxed/simple;
	bh=qz32WDm8kGqJZkxyvJ3a2TRLVvgFrditQhnsHw8Tesc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kgxzjQs+iyn/2rzMqGlJHtVa9//sPUBxYHt6XzXoa5HAk/Dl3ALAQAwMxqbqLrt/Ew9cdKc3FUakZAVtxVkcAKQ89GyEcdEFAHUI1PHNEaV4Q0TBxQquMEKy5ySuGwfP9uBmaLtAY7zInYrilptGH0PM1dxrmCPPFuRCpTW9eS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AKRaMwlW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AKRaMwlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750439122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0uKaElPF1p9RN7ExopibAGaJCOW8iQTnWa+hoEBRAw=;
	b=AKRaMwlW+h+tc+aMIrkdHf2SgkBuUhcjwZT68nkWIbZ0bNtiwEADDKFae7pvumGMpUxFGG
	kXvDmklS+Z7yb7MunSGXF3dJHqp19GpZdaLgzMncZKEFhM249e8C4cSgt9bgaUaaIT6Ink
	jUxEUpMk9bFHx0Zfi/7Cu4hC1bKiBYc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-xQyIip7EMJuj0p5Y9kMOXA-1; Fri, 20 Jun 2025 13:05:21 -0400
X-MC-Unique: xQyIip7EMJuj0p5Y9kMOXA-1
X-Mimecast-MFC-AGG-ID: xQyIip7EMJuj0p5Y9kMOXA_1750439120
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450db029f2aso8510145e9.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 10:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750439120; x=1751043920;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0uKaElPF1p9RN7ExopibAGaJCOW8iQTnWa+hoEBRAw=;
        b=MHezWMcSparf3JKOdgLDJ5xLCUVQjm7cRqAmQVfPcbjPSfqlxu1hnJin1uZXRhsHW3
         uRyb9sOr1N81MDv4FR6zdPb52XYsZbvjRduwz6fu4VqGVHw7ay9Fkp/AXzsob6yzsJLK
         DNsdIWwR7QmwFu6hGb9qrtbjBh7nfy22aiRE/fYAFTaP19OxjMnVtfu8oYRDgfupPXjF
         Qa60HV9tQMLqKwFiYa4vu1N2zTZ0iTXLNdsNgdI848OcOfg9qKBe/kU8e6rNMjkJTJ2q
         1MSkaT0fG5dVRLRFo5i2W7OQLS988BBZdoQhpgTt1q6sSqwJm3S+AeHAFPZVK4MM9D41
         YOwg==
X-Forwarded-Encrypted: i=1; AJvYcCVPVM0FhC994rjjLs65hMm0pjN/UwnfW983CmkBZ/y85+QEzp7IXkoOcCpOKT+ZF8+RESL1Lk2BKSE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz0JzUatnj7K0ENdTvQNFf+rVL24TJ+jLo+Tb/D6KtwlGRtaQm
	P5IagP0O4bANRXYHZo6c6tmfNJoUdJiuWVqjmZCEWpEg6+sPKMsZlcqjULp79Mva9WeqXV4xTm6
	TCj0P35cLa8RGbLSUcINW++3PfCnfDvBrHNQHOjkrEQmu5C0peTB0UAaqu+3pYA==
X-Gm-Gg: ASbGncvemsmuMxlr8m91dLlNEGGnJJEJGEEqpmo1HAFakdIsypcwEsn5rkn/pfNP32T
	570ImbWRFK2RmKhkMByC30ZDDLaRb7OXlVLIuQ0qri2uwwOwMjC6ziNkjsJpq+lIHZSqI/NNPHg
	AkSkwW6ZdOYoGy5WYtswt4brPqc0Wc4ih0SqloH8wxq2Ilsgsn+ZqmgO00Cp1FVd7rYoyjE1VA6
	8nBUaySGZYL8JmGjGLxzJPfbKoGCWMsDIxo1a0gkx/Fgq2Px+/cbgi5PIaxr6uZ9SiYexK/yHih
	m0RJS2BBwPdejJ7d1Sw=
X-Received: by 2002:a05:600c:c4ac:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-453659ba4d5mr32818345e9.23.1750439118375;
        Fri, 20 Jun 2025 10:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErRRYJ7yHniQTxZlTtcjXynaBaSE5vB7XTQS6ITom5OtykTCmLWDLCyce9A+anV5QdRiHhQg==
X-Received: by 2002:a05:600c:c4ac:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-453659ba4d5mr32817665e9.23.1750439117743;
        Fri, 20 Jun 2025 10:05:17 -0700 (PDT)
Received: from [127.0.0.1] ([185.23.110.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ef6edbesm62743115e9.20.2025.06.20.10.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 10:05:17 -0700 (PDT)
Date: Fri, 20 Jun 2025 19:05:14 +0200
From: Ivan Vecera <ivecera@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
 Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>,
 Petr Oros <poros@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_v11_03/14=5D_dpll=3A?=
 =?US-ASCII?Q?_Add_basic_Microchip_ZL3073x_support?=
User-Agent: Thunderbird for Android
In-Reply-To: <15618298-4598-472e-9441-8b1116a34de2@redhat.com>
References: <20250616201404.1412341-1-ivecera@redhat.com> <20250616201404.1412341-4-ivecera@redhat.com> <20250618095646.00004595@huawei.com> <15618298-4598-472e-9441-8b1116a34de2@redhat.com>
Message-ID: <DD848DCC-23FE-448D-AA1E-22EE281E34F9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On June 19, 2025 1:43:38 PM GMT+02:00, Paolo Abeni <pabeni@redhat=2Ecom> w=
rote:
>On 6/18/25 10:56 AM, Jonathan Cameron wrote:
>> On Mon, 16 Jun 2025 22:13:53 +0200
>>> +static int zl3073x_spi_probe(struct spi_device *spi)
>>> +{
>>> +	struct device *dev =3D &spi->dev;
>>> +	struct zl3073x_dev *zldev;
>>> +
>>> +	zldev =3D zl3073x_devm_alloc(dev);
>>> +	if (IS_ERR(zldev))
>>> +		return PTR_ERR(zldev);
>>> +
>>> +	zldev->regmap =3D devm_regmap_init_spi(spi, &zl3073x_regmap_config);
>>> +	if (IS_ERR(zldev->regmap)) {
>>> +		dev_err_probe(dev, PTR_ERR(zldev->regmap),
>>> +			      "Failed to initialize regmap\n");
>>> +		return PTR_ERR(zldev->regmap);
>>=20
>> return dev_err_probe();
>> One of it's biggest advantages is that dev_err_probe() returns the
>> ret value passed in avoiding duplication like this and saving
>> a few lines of code each time=2E
>
>@Ivan: since patch 13 requires IMHO a fix, please also take care of the
>above in the next revision, thanks!
>
>Paolo
>
Hi Paolo=20
I will send the next series after vacation=2E=2E=2E
I'm now in mountains in Albania=2E
Will be back on 6/30

I=2E


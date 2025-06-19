Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DBE221FB5
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333425; cv=none; b=sBjcYFQhZQxj3XAgEC0/DMDifuQ3gs7iXTJu0mK2/Iqghqk8Kd8BUG9dvcta+i3Gp8a1VaPlG6yEfFtv5D1YvfYKhV1tXjQn2k2YgIRrr27IqdyZwoQqVAMWQL7VjU20orB/oZcZGoLOstsFGm6rPWaP5oWcEHoO/a3aAQruhDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333425; c=relaxed/simple;
	bh=ka2YSkd/50tKtAy/Sw1F5sNt6obV6O6uUBbncHAvZq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7d7gK1w89ePAi1/H+vI2fllUEErZRaI+OIhTtxyd1crv9jaRKjafyeYT2JzOj1Yq77uf5jS6oms9VwGY7HAF9Opw/shvIb7/Txgcl152qQhhPwauFem464DwFo+tc1qi/5h7EyMCK3HaczZGomJ351IIJwrdUc9DGJCvxeE/YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CkqPDTsX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CkqPDTsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750333423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ir5AYNLTrc0GzMJeSFP3PI0RqKk+EXKa8y1NWCrMv88=;
	b=CkqPDTsXxTiU7c9SLf1QmaZfa4IK/XgsJ18iG9RyqHGwWpea/P0/7T52XGuMnjRMlmDe1n
	mpRi+ky6fTLLHPvbo6Osrn+LXmys7/arwnrgnGNe+1lOOQo4UXsuXJ1SzNC57iTz9KgTFp
	PkfNUYFUx7xpt/DqQdh1y3VRXPJRZ2A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-EWfbWtZNNIetCziuvFFclQ-1; Thu, 19 Jun 2025 07:43:42 -0400
X-MC-Unique: EWfbWtZNNIetCziuvFFclQ-1
X-Mimecast-MFC-AGG-ID: EWfbWtZNNIetCziuvFFclQ_1750333421
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so365623f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 04:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750333421; x=1750938221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ir5AYNLTrc0GzMJeSFP3PI0RqKk+EXKa8y1NWCrMv88=;
        b=GBDwxjF63YvUlDVtEv7ZSKbKQu0uH3cdINz/rQ4v7d6I1fq78Ss6+j+1oj6EJZXXw5
         7SQXTWdg6CqbkPsY7mvI7IAY4a2Q8ZLBUupIjM/4cWATX9ArKUaqFFwsy7+mz9ozPhGl
         RxiuutplsNYvrWzSIUbXpVgxsjiqF2WrkgobF0aEfIp6vZmvpOlFa20Cgyt2w+zp5Y7S
         KY9R4Pu77vUsyM8JFhQUI/ygyUwwSlidAV30N/fm4hsXXVYt2ooEmnNbqhwf3u6uevQj
         CI7dG4HtNbs8u22jGkzrqh/jeAFgJjpmPngrOZpSAQYgkbXnUCJED2TwFtJt/yPGeWdT
         hB7A==
X-Forwarded-Encrypted: i=1; AJvYcCWWgBj15ydXb6jJc3tzren3Sl8TkfwiZYg2MMqdAAsyEqRgVTaB45vuw7oV6KsNpkhu4Zn39zjB2lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQY3MjBEbPb0N70TZUG9+iHfVyy5qx9l3PHD2BFGxJMaKrW+DE
	vbYDlMVWbnk326Ane9AqSk8F3EIA9X1eao/0xAc0/7n92soMDR4YqBFJkqSMwhMQI/acpCcBLV+
	F3lK/LzBfbpG+YBKL/crpTZSpQ2CdY40QlJwoZ3z0OlUp59U+0IQf07/+2PSHfw==
X-Gm-Gg: ASbGncvGd0D8ewZZ26es7QRl6Vx94yuWnXC5jy1lAHmRGffB5B8/sGFlkYOhGHLQtfP
	St/epJXrRX9JYWZAdmhHCO8Qmz9i0P4UG1+IYmc4lA8Gc3iyLrk/qfgPeiYU/oHNptyG4DK5BYs
	mVo2P6QAN9Rs4DZ04BKABmXN1ejR/UlOSTMAWHX9D2yITWvjtkZeagkOdQtVtDP6J4m10ZpCQ52
	30Ebyuaa3wBgoaAoU3nIBygbeAM10UElu+F7A+895C/CMEARieAEPsyriYZSg1qc3vd6up8/qn4
	JeaeRMMSbL0k7RxI3mr6S5smmAmMHdYRUAwY6GiFSGqO/AcC0DzqimZcpGJfsmyuVn1d8w==
X-Received: by 2002:a05:6000:310e:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a572370c21mr17233778f8f.13.1750333421186;
        Thu, 19 Jun 2025 04:43:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0K+Q0JwDwTLL6eL8TmMJg3/Y1q/iQX/C0mLF/RXcygjsYcsKNMqXFMDf/NmEIVFEjZ5Prcg==
X-Received: by 2002:a05:6000:310e:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a572370c21mr17233741f8f.13.1750333420729;
        Thu, 19 Jun 2025 04:43:40 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:271a:7310:d5d8:c311:8743:3e10? ([2a0d:3344:271a:7310:d5d8:c311:8743:3e10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a5405asm19680062f8f.13.2025.06.19.04.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 04:43:40 -0700 (PDT)
Message-ID: <15618298-4598-472e-9441-8b1116a34de2@redhat.com>
Date: Thu, 19 Jun 2025 13:43:38 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 03/14] dpll: Add basic Microchip ZL3073x
 support
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Prathosh Satish <Prathosh.Satish@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
 Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>,
 Petr Oros <poros@redhat.com>
References: <20250616201404.1412341-1-ivecera@redhat.com>
 <20250616201404.1412341-4-ivecera@redhat.com>
 <20250618095646.00004595@huawei.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250618095646.00004595@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/18/25 10:56 AM, Jonathan Cameron wrote:
> On Mon, 16 Jun 2025 22:13:53 +0200
>> +static int zl3073x_spi_probe(struct spi_device *spi)
>> +{
>> +	struct device *dev = &spi->dev;
>> +	struct zl3073x_dev *zldev;
>> +
>> +	zldev = zl3073x_devm_alloc(dev);
>> +	if (IS_ERR(zldev))
>> +		return PTR_ERR(zldev);
>> +
>> +	zldev->regmap = devm_regmap_init_spi(spi, &zl3073x_regmap_config);
>> +	if (IS_ERR(zldev->regmap)) {
>> +		dev_err_probe(dev, PTR_ERR(zldev->regmap),
>> +			      "Failed to initialize regmap\n");
>> +		return PTR_ERR(zldev->regmap);
> 
> return dev_err_probe();
> One of it's biggest advantages is that dev_err_probe() returns the
> ret value passed in avoiding duplication like this and saving
> a few lines of code each time.

@Ivan: since patch 13 requires IMHO a fix, please also take care of the
above in the next revision, thanks!

Paolo


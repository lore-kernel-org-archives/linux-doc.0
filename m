Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8D2224254
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331735; cv=none; b=dAH4duV0nBGOAoz+4TSHLV1xaLMbEnm/zihzEvxmRkJ0Q/lj/Dx/Pmhe5KMuKcWiNaSTG7suRSN4KZgf/A4Fa12ct20UvflgUqm+c+UuvXNp6dIbrvCNeeziQp85p3PhFEjyhIEqzcyKkbshYyZDmjlPLqIiW8x4VI0j+ocHvpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331735; c=relaxed/simple;
	bh=LUeQAjtBZos6OdUZbbQVfexhZynCiSgqlsEwbuBatHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pY87Geu4Fa/6cFG9nQKwlA+ROOsLrJN+8I20rct7qXSJalh2TagLmqE8HPsv/RE7iHIluqKSjJ94D0s8FGpG3qXcsK7pxaykdsjz4hNMNLgOgoop1sARYxGXFGHGW1IoFQSZ7b4viosfOT3jp3Z+70BVGwb7lue7CB/bKpioRWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ATMXdKMW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ATMXdKMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750331732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xZv/IaN3pVBxm6Ay/mMD7muLAWVYifKr0RAn2IkTKE=;
	b=ATMXdKMWUA2SlTMrIPWIUwD3yoOJfx3uuiHEVbAs/FGBXbkVHMxXa1MgCnVS6xcVlHaFuH
	tKfK8G4abNcKaazp0RDTMykuh0QlRG8NuBeRfQi5dKKWIwwwVaqxyEJdFCCxQBeg6M51MQ
	UAJqLq54mlQNkmw7Hpxg1+TtY5B4bZ8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-89BoOYDMOneTYYSqORDg7w-1; Thu, 19 Jun 2025 07:15:29 -0400
X-MC-Unique: 89BoOYDMOneTYYSqORDg7w-1
X-Mimecast-MFC-AGG-ID: 89BoOYDMOneTYYSqORDg7w_1750331728
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450787c8626so5540045e9.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 04:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331728; x=1750936528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xZv/IaN3pVBxm6Ay/mMD7muLAWVYifKr0RAn2IkTKE=;
        b=Lmnxlh1b/wn6hPDjtX8YBx/iijEMK9aNpBcwOacd//E5DkzjZK/WwrnhmRidlqLGis
         bQSoq4Ss4JLvoo5FjN8BkQvp9lFnKK8eCBS7Vn34TBw72m0jedQOhmKGSxwMQ5ZYAN4c
         v0cQRlOhikiST6G1/7yj/q5zmhSnaijRtm78TLu4c0MSQKFrNuOfT9d+Db/GdOV43grG
         5xtwfgryftKQNWrgtnHleb6SLbXctPR1x1EDrqT0Jcukfs76lvbDkPw8dLwaTNFU/V10
         d4ucE1MFhlPX3g2u9guq2eoR3wxBfRj+WRQUZSgbVvszKfE1S23qJpVEzx3Cd4d02SOH
         eibQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdgnlQH4Y950IMbdu+ZmNq4Sbt+j2C9KllUpBaLZ08n4dfleXVXVm5Q5TvM6quwGYU8KbcsYSFxJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ/9p1BDxKLyWFcxA91pTyto+Z3QmfD2FNOo3/nE5mcRjm2ULK
	FvemeVThwGbI+MIx/oyXbHfcRQSBmqQg6iqT7iIH6K5eldEP9FljFFITcI1idBhzT1jjqnpSzWW
	RWcTjntauAD/FHs7zuSNaamJdX4pEha9OVX+jhiwr3O0tiwnB/8OKnH3NhdkG8Q==
X-Gm-Gg: ASbGncsC47W5DaMfVc2OVmqGac1A8YoCDskdA4g8MN4AAQKSjwsci1QtPKdtzDlPv31
	eFGIHblCW2L9dGrSrKlU1oXeitpX43xpzG5457UiChXSFwRfRMkA+SP22htwj2OXxnED/FhU4sG
	s4DWGy44vDtAzTDtK3+u1a6Pv3p+I/NcU6CMO8bgZUqcWjMSjKS/jsKG8RX41BkwQt5bByAw4ic
	IPKcIk82zTPsqMNmPBLNPweW+QXZkARhHG/8dtmIe9deM0xCL+X7KOM8uWAj/KXLnbQRvofH71e
	Hmp3hqUEPyfX0TYVnVwZjdxKgmYnQeTD1O+bVs/a4aRtp0AHWlj5Jj8FPxQNawp9qiIpTA==
X-Received: by 2002:a05:600c:190b:b0:445:1984:247d with SMTP id 5b1f17b1804b1-4533cadefe8mr187697355e9.7.1750331728259;
        Thu, 19 Jun 2025 04:15:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG43dOM5T7qmoDFSYxKLqTuwEzuqqfaVGRVW809R5AKI8GEve+HAJw7T1QeY9uWvmBGJ78U+g==
X-Received: by 2002:a05:600c:190b:b0:445:1984:247d with SMTP id 5b1f17b1804b1-4533cadefe8mr187696945e9.7.1750331727767;
        Thu, 19 Jun 2025 04:15:27 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:271a:7310:d5d8:c311:8743:3e10? ([2a0d:3344:271a:7310:d5d8:c311:8743:3e10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e99503asm25371355e9.29.2025.06.19.04.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 04:15:25 -0700 (PDT)
Message-ID: <72bab3b2-bdd6-43f6-9243-55009f9c1071@redhat.com>
Date: Thu, 19 Jun 2025 13:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 13/14] dpll: zl3073x: Add support to get/set
 frequency on input pins
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Prathosh Satish <Prathosh.Satish@microchip.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, Shannon Nelson <shannon.nelson@amd.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Michal Schmidt <mschmidt@redhat.com>, Petr Oros <poros@redhat.com>
References: <20250616201404.1412341-1-ivecera@redhat.com>
 <20250616201404.1412341-14-ivecera@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250616201404.1412341-14-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/25 10:14 PM, Ivan Vecera wrote:
> +/**
> + * zl3073x_dpll_input_ref_frequency_get - get input reference frequency
> + * @zldpll: pointer to zl3073x_dpll
> + * @ref_id: reference id
> + * @frequency: pointer to variable to store frequency
> + *
> + * Reads frequency of given input reference.
> + *
> + * Return: 0 on success, <0 on error
> + */
> +static int
> +zl3073x_dpll_input_ref_frequency_get(struct zl3073x_dpll *zldpll, u8 ref_id,
> +				     u32 *frequency)
> +{
> +	struct zl3073x_dev *zldev = zldpll->dev;
> +	u16 base, mult, num, denom;
> +	int rc;
> +
> +	guard(mutex)(&zldev->multiop_lock);
> +
> +	/* Read reference configuration */
> +	rc = zl3073x_mb_op(zldev, ZL_REG_REF_MB_SEM, ZL_REF_MB_SEM_RD,
> +			   ZL_REG_REF_MB_MASK, BIT(ref_id));
> +	if (rc)
> +		return rc;
> +
> +	/* Read registers to compute resulting frequency */
> +	rc = zl3073x_read_u16(zldev, ZL_REG_REF_FREQ_BASE, &base);
> +	if (rc)
> +		return rc;
> +	rc = zl3073x_read_u16(zldev, ZL_REG_REF_FREQ_MULT, &mult);
> +	if (rc)
> +		return rc;
> +	rc = zl3073x_read_u16(zldev, ZL_REG_REF_RATIO_M, &num);
> +	if (rc)
> +		return rc;
> +	rc = zl3073x_read_u16(zldev, ZL_REG_REF_RATIO_N, &denom);
> +	if (rc)
> +		return rc;
> +
> +	/* Sanity check that HW has not returned zero denominator */
> +	if (!denom) {
> +		dev_err(zldev->dev,
> +			"Zero divisor for ref %u frequency got from device\n",
> +			ref_id);
> +		return -EINVAL;
> +	}
> +
> +	/* Compute the frequency */
> +	*frequency = base * mult * num / denom;

As base, mult, num and denom are u16, the above looks like integer
overflow prone.

I think you should explicitly cast to u64, and possibly use a u64 frequency.

/P


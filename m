Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517502F6193
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761775414; cv=none; b=nWQV07ZGjL0jJhnScm5cDMENCen1LievfF20dcKX68CMptYAQtSkybK1n08i7tHRW4MNUSd29Gs+q+lAQnxKDg28U/eSStMHm7Vvu32Wx0XvOyF6NFAoMA51iT+bvPmvIGqfFRLMJklDs6iU6Qzn/PAfgERS6TGUK3InSxPZoZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761775414; c=relaxed/simple;
	bh=Rpx+i+g4UDOw+uheC336cz/8fzW0yUsW3KtUgY9A9/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5qIHmcbINTDQN9xsrzO23ue5ljojUm95iK0+JwHcEixef5M/E26o0e2oh/7rE55HEuuibA/A/8d5tLBRm4UqW3Jdh1kDJh8eDpOUX77jSV++IVxPoWxuwE0OcBoUmJQ5S+E1b5T+X63ebfpPldXoBZj9P+F0oSM6qVi8P7O0ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWxji16n; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWxji16n"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-292fd52d527so3272355ad.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761775411; x=1762380211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Nblfgm5XoVGA2pwggUTGBEWVQZIZxWS8tzQ3rNya1k=;
        b=BWxji16nJLKjInABvrLXLKUmUE3XuS1E0BNaJ5bmjeGIyBnxSjLDc6MQoRz+9Z+YDX
         g7pZhhRL+s/VBub26bsKS4eUUb595+susT3Rj8u6paScAqqC6BTvFewfsnh6lMfnivU4
         +I3b0ql29WFTh/uwApl9Oh/nG9FLsdvHf0mlbyeGfmb9rla+c6zUXV/556oAyKQ4rqte
         FBfE1Tu1Km3MzpBXnzy4vvaaOivAChYY+/BJxHd8iAWxW0Vkt2PnLqf4pIEG0WHDIq5X
         zyuFON8aen8D+jrRm/Rxd2SZuSRDH89HRIRSY3Gxq8NvU1prHYzR0Fr7EM9Aewa/LDe+
         QieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761775411; x=1762380211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Nblfgm5XoVGA2pwggUTGBEWVQZIZxWS8tzQ3rNya1k=;
        b=FvaHCByM35VLbz3Zh31Wli806yk1EOL38n6iFMMSLPImoT6nKMpwj9/NbbyI/HQTFy
         XPGZSSan2rND5LR0MKz4brrat5bQuXmbt5kD9J62Rd/7yHNLFjZ5SiMKC0N256a+n93m
         ACGKObNhjICOfLoh6bidu+bJggQs9BOeicMqlRBxFRvARLp9KWZXVAZoTk0BPdzbm5/3
         LoouW8WhLDPFGTB/RimxKfqSwdavgELDK7kz3JuWZwHCBzQDzudLHGdzDLpMvEcsV0Qa
         GguS45In1/lRVWUPrQIlyhbIdFzMm45hU09HmkcKFAc/p2LDjeZS8+VJQCx0Vxv/eTar
         GEpw==
X-Forwarded-Encrypted: i=1; AJvYcCUMxLFKnjAog0dztABuVj1xqZ+soe/kLtScdbLnpbXFW5GCmiWw4aM+jUPNxMx4ML/peyAcgdCbSnU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiu0uR2WqpjbptnrWTQ8xSfrsFZgakimz+TCgpO2o0PEriOAQi
	ni6Wej1S74UNqEtXHSxhEIFKLSh6pv6gej9vMPVZj6aes+Y7I9BekojCMSCVcA==
X-Gm-Gg: ASbGnctTqu9kiHo96OdPxb5FevUdqYHnrzdV/ijfE9/2+pkb9GTZ75j7MQE+9HbguWV
	55BCj1ppyNFTrjfKLO2MaMcR6VFzE0IYzznr0vCOA3mHtfT1vs9U+gPrFMgavL8d0QVtIkGXO9i
	hwBwDrUwbXefSmxAfEFv2yDrQiZZh3bWfvEeMMXwbgmgf6hEwffh2S/4qiFAInQoQkkZTEoc1u/
	nXS1UG3Fec7MXFt3xzVeRQ/AH7gVzspcm88HsfYiqEi67Ml2iGy2a44v5Gl1d5hvev1zGU8TYlt
	bELUKQUVhU9b/Lr5i7byu9QBE8/r+JXTAmrIIj+evV6ttQEgRC+FcZ0v/nUyXEyHzaVBQq0ZuLk
	uXJH4vRgTKYYKY4SbiNdUibFaWiusV9Bfsnx8m6Zxlqp2a8jN7tgbo0weJAy9XY2OElqdjXiOog
	WwzuKhNsSVeRmX
X-Google-Smtp-Source: AGHT+IEwsj2J/ftTrnWWbeM7o5Z+AJ9IhB7ABxIMbByBawCiASkXvvXWBg+ahShIu+FUAW/13d84Zg==
X-Received: by 2002:a17:903:ad0:b0:269:96db:939 with SMTP id d9443c01a7336-294def33bffmr54489445ad.58.1761775411490;
        Wed, 29 Oct 2025 15:03:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d230basm162597355ad.46.2025.10.29.15.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 15:03:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Oct 2025 15:03:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: temperature: add support for EMC1812
Message-ID: <86b94f01-ff93-457e-95cc-4e87009964af@roeck-us.net>
References: <20251029-hw_mon-emc1812-v1-0-be4fd8af016a@microchip.com>
 <20251029-hw_mon-emc1812-v1-2-be4fd8af016a@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-hw_mon-emc1812-v1-2-be4fd8af016a@microchip.com>

On Wed, Oct 29, 2025 at 05:50:59PM +0200, Marius Cristea wrote:
> This is the hwmon driver for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

One more ...

> +static int emc1812_parse_fw_config(struct emc1812_data *data, struct device *dev)
> +{
> +	unsigned int reg_nr = 0;
> +	int ret;
> +

I added
	if (!dev_fwnode(dev)) {
                data->num_channels = data->chip->phys_channels;
                data->active_ch_mask = BIT(data->num_channels) - 1;
                return 0;
        }

to be able to load the driver and run basic unit tests.
I expect something similar in the final driver.

Also, here is the unit test result from writing negative values
into the limit registers:

temp1_crit: Suspected underflow: [min=0, read 4294903296, written -2147483648]
temp1_min: Suspected underflow: [min=0, read 4294903296, written -2147483648]
temp1_max: Suspected underflow: [min=0, read 4294903296, written -2147483648]
temp2_crit: Suspected underflow: [min=0, read 4294903296, written -2147483648]
temp2_min: Suspected underflow: [min=0, read 4294903296, written -2147483648]
temp2_max: Suspected underflow: [min=0, read 4294903296, written -2147483648]

Thanks,
Guenter

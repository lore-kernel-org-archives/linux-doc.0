Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858FA264A6E
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 12:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457782; cv=none; b=DbvpFbzZabWCDTytSLEX3NtKkGvPChpz6sHdDB/mqzswpz12PMy3vR41wyxYwBUfyMMGWKA1QRMPf41R0aWVRuMbb4178H8rUC7OvDEhFScVYsBoX4tz5azuFIQ+bm05K9whC8VaAeDIrMZjukEDc0yHE/A3/KLV74FgHn9JYwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457782; c=relaxed/simple;
	bh=9OBjOWdofz0ubYLc035JjloaZp9RG4Jzt2NgjvAujAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DK0H+2h+mf72IOVcaWk2VgqxtkjDAZD34/QdrbWgEEV8DNoKbijZUIeCkxSPpfrQMVqi5+EvKnVWj5S3ryC+Y5yr1ToFqtWlDrOvIIlj4THc9brOq1Vq82uoRitqIC9RXMqKvr9PwVg6L2ic8yEA0vgtbmJyvx+bi2bfAFpwWqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=yl5MV7Y7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="yl5MV7Y7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so2894445f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 05:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751457779; x=1752062579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=37vsbM8Nn6JfDGmwzaOKscFK8qNZkRywZ4E54Ix7WTA=;
        b=yl5MV7Y75g8RwQo3uwNIiSSc58yfgNr/yG5t1p+CyRDULwUTPBRynq1Dh7xwuSoCqe
         fo6YXCIAKASvDZcmPiRgGKPrsyA00Rg1zsOcebpsTh+lBfUSx8e/U6G4xCv7gv+s9grH
         8NkM/NqiUurppZlCDe/kxGXKu+xmWLW1z8KJ6hN48qPfLYWXZ+4oDti4VpQl4KqRk8AE
         dSuRuKWTrCGedTAFvYvQjOPFQ3ZgpBFXS1jBwrgPM5O5xMLfjcwWYQJ6lnxXv0QZ+cNr
         xI3AdU9P1svaHlKKIAVTw5l671i7jcaBOU0FhXQ6f/0kycmjqA0pG2eGf/Z9GS53Q0ME
         tSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751457779; x=1752062579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37vsbM8Nn6JfDGmwzaOKscFK8qNZkRywZ4E54Ix7WTA=;
        b=lWshamqGA7QB2yCcEibFPgiyff/AjuUoAMF0Y+UF/5OzZD1No6/HAmfYcNb4QF8QgB
         iQmoBxqEqPt5PUshWZtgu4TehI7/eTqjIRMNTrdidJFP1zEaBYI9K0+iA53/AKqwYiM3
         jhN/z98ozU+ELL9zBl21h4qS9Nqh1vb3T3CDg5s/eDLVkZV5IviTMSYdP8J3SQ97uOEO
         cH6HtrhLXEZML5NbI/IrZeXAPXm4uibd7b31O1PrwPgb2xebBnvRakfzBmBo3GFqH7Hp
         ogz+ZPy2AyuuBD4+r9MBwsyEHY41VSGl69570DOan+f+3vTI+9qeOMMdFZqenOD7OKJu
         4plw==
X-Forwarded-Encrypted: i=1; AJvYcCXsJr827+Jd2ZduAbennpTakjduBmqPMgmeR6tz9Psk0EWtqB5xRsja1SjUS2U8SMoOe8E+DxQR2gE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/TLGayD/hzT2mEhJtbbznl++thIhqIY8RRYZsR0EPcj5GtOZ1
	S1a/QPVvEYfXHVeMm4DmEnrInhgQPYf+8MbVu1U2wrw74gZ2zE2Lv1yxEYD4yOp4V0A=
X-Gm-Gg: ASbGnctzYYzYKMXZ4D+LyhZu455wv/SO3Hr4UtcoTTKjbBzFwX3XJd3T2T7MJyRSomu
	iUA0gYTNIwq29D40ucO/hzXtl5OVimHYo/1JW6flkqUETBl7g4i/nwOxyfsnWNwFJ4gzzNodLiA
	vb34EYnAUXfR9LyK0AHPECjLV1i5WmWatWeWVjgNyL/uAxm+79FemPPKl9/BWECvvBSd6+XqaCN
	JnR11lKXae+oRDX8Kiu2P20aU+vlCOBgPhRVOZXtqsi/7WL5Xjkce7hH8GilQjQJtFeQUzvq6bZ
	hlL4w7t6MK60pUDcihrp2IT16BaFmDFWLlErDHtqeOEqVlCnihEhgzbpZqLBWP0dJrcodW3mod6
	SJ4ZR
X-Google-Smtp-Source: AGHT+IHbVVQaW4FRowFBfmEzpyakEnrdf6FVBPSZnjLiOnlSiWUKwogash8HMSktSg7QFFh0mlJEXA==
X-Received: by 2002:a05:6000:1aca:b0:3a5:2cb5:642f with SMTP id ffacd0b85a97d-3b2019b7e75mr1918089f8f.34.1751457778695;
        Wed, 02 Jul 2025 05:02:58 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fb20esm16164594f8f.36.2025.07.02.05.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:02:58 -0700 (PDT)
Date: Wed, 2 Jul 2025 14:02:49 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v12 09/14] dpll: zl3073x: Register DPLL devices
 and pins
Message-ID: <k2osi2mzfmudh7q3av5raxj33smbdjgnrmaqjx2evjaaloddb3@vublvfldqlnm>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-10-ivecera@redhat.com>
 <ne36b7ky5cg2g3juejcah7bnvsajihncmpzag3vpjnb3gabz2m@xtxhpfhvfmwl>
 <1848e2f6-a0bb-48e6-9bfc-5ea6cbea2e5c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1848e2f6-a0bb-48e6-9bfc-5ea6cbea2e5c@redhat.com>

Wed, Jul 02, 2025 at 01:49:22PM +0200, ivecera@redhat.com wrote:
>
>
>On 02. 07. 25 12:57 odp., Jiri Pirko wrote:
>> Sun, Jun 29, 2025 at 09:10:44PM +0200, ivecera@redhat.com wrote:
>> 
>> [...]
>> 
>> > +/**
>> > + * zl3073x_dpll_device_register - register DPLL device
>> > + * @zldpll: pointer to zl3073x_dpll structure
>> > + *
>> > + * Registers given DPLL device into DPLL sub-system.
>> > + *
>> > + * Return: 0 on success, <0 on error
>> > + */
>> > +static int
>> > +zl3073x_dpll_device_register(struct zl3073x_dpll *zldpll)
>> > +{
>> > +	struct zl3073x_dev *zldev = zldpll->dev;
>> > +	u8 dpll_mode_refsel;
>> > +	int rc;
>> > +
>> > +	/* Read DPLL mode and forcibly selected reference */
>> > +	rc = zl3073x_read_u8(zldev, ZL_REG_DPLL_MODE_REFSEL(zldpll->id),
>> > +			     &dpll_mode_refsel);
>> > +	if (rc)
>> > +		return rc;
>> > +
>> > +	/* Extract mode and selected input reference */
>> > +	zldpll->refsel_mode = FIELD_GET(ZL_DPLL_MODE_REFSEL_MODE,
>> > +					dpll_mode_refsel);
>> 
>> Who sets this?
>
>WDYM? refsel_mode register? If so this register is populated from
>configuration stored in flash inside the chip. And the configuration
>is prepared by vendor/OEM.

Okay. Any plan to implement on-fly change of this?


>
>> > +	zldpll->forced_ref = FIELD_GET(ZL_DPLL_MODE_REFSEL_REF,
>> > +				       dpll_mode_refsel);
>> > +
>> > +	zldpll->dpll_dev = dpll_device_get(zldev->clock_id, zldpll->id,
>> > +					   THIS_MODULE);
>> > +	if (IS_ERR(zldpll->dpll_dev)) {
>> > +		rc = PTR_ERR(zldpll->dpll_dev);
>> > +		zldpll->dpll_dev = NULL;
>> > +
>> > +		return rc;
>> > +	}
>> > +
>> > +	rc = dpll_device_register(zldpll->dpll_dev,
>> > +				  zl3073x_prop_dpll_type_get(zldev, zldpll->id),
>> > +				  &zl3073x_dpll_device_ops, zldpll);
>> > +	if (rc) {
>> > +		dpll_device_put(zldpll->dpll_dev);
>> > +		zldpll->dpll_dev = NULL;
>> > +	}
>> > +
>> > +	return rc;
>> > +}
>> 
>> [...]
>> 
>

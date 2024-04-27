Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB9633C8
	for <linux-doc@vger.kernel.org>; Sat, 27 Apr 2024 21:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714251991; cv=none; b=pjj/2jc5wC7hjnkX0GCJGBYRykNvL9kRRdQiWTp9O5QrJgzTsxv/vkoMeWn0Txc0l8I1oWGoYtEFdgxAGP0LOm3E/hIRLb/3KP9H1qUYFCL4PQ7KWJgUbBeZ5LZoad57OSCZRvoUVVDPhQCgmWuglfOPUZ+z4tjXfUhZ3S5+3gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714251991; c=relaxed/simple;
	bh=BPGQT9RvHD6dyBXeMZZlYnTR0tD/OFpjhgFM5V7pV48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3C4Wsz+qOnxFoLE+UFwF5H/8nthvnkFW0/AOT/aIWxdYe9KNZBb9PvefKiXrqapb/9Tr95sRRZETevKFvL/EJgPzkesd46qmxRlBtsTdNWOx8cAVsKy0dKHnSlWfAUfCHYuGWax73kS+GmbxXwI1nfTBSswwAPFn1ARXql6J1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se; spf=pass smtp.mailfrom=ferroamp.se; dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b=cBUf8wO/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b="cBUf8wO/"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2dae975d0dcso45634471fa.1
        for <linux-doc@vger.kernel.org>; Sat, 27 Apr 2024 14:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1714251988; x=1714856788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EqwxwLHYHSztUcUOAzJULG1B07hY8oWavjqK1Q3m250=;
        b=cBUf8wO/LuQ+O8DMbFdKOHVch0tZyruv56W47/Vp2sr8J2JwCUpuVygEMNpGGqO+ak
         XgOYXogt2nUDTKqhjYX/+qq46H0j7MBhIsGZk69/La2fiOfQQu+lYm84JQupeD2xSRJ8
         cw3/qrmq3dIMqJGSKo4sB09V+Oj2nvqkqhzu8luQCopbvhviAlreQHUv9rwXb2fqV7SK
         v6FBAFfXU+En/xySlvCKEVnCeGjVBOwjLlI78kmHVxNxTn4Bl8mfIEikvo8bDZlrwlL3
         nbjEOwvQw1W2cY2P6wVhMahwdT063/E+koXoVufJ1o4UQF4O2V+hi+juLEdrYJr/hpce
         WpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714251988; x=1714856788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqwxwLHYHSztUcUOAzJULG1B07hY8oWavjqK1Q3m250=;
        b=ZqOU1Upa1XSgnz6Q8ei/vgBxM9rH3e0BXJ/RLUR5K9yS4YZmmJmzETE4H/7hIjp4xt
         +aZH6ZnTc6hw2mO/iYyy1gehOlQXlUgWb5helPyny9HAM+mVBvUCFcGQlv/MfM64gfUW
         RaXWYOmz6YIGI09kxOs3OGT8qDnkxsBBqy2fBHx/u9zqF3oM4c/ENXCgzZTWcwSutpEc
         PsNio2Cr7tHRejcoQwJGWoJkThaH0wo1IoO/TxpBxG32vCAC16tkFF/imkHLkJ7gwgE5
         r+hMGHq3JH1RrXtqEjlqZRZqBlSRsgslJgEARGMw98NimUr1oWxho1ZwJ7pbeUgF6uoh
         js/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpd65ot8a4OD7JPCCybNAQvxsr7v0p6JcO/Udiw/GIlpP1EBbj2H5/BNYmoD0oTDXch1UmdeZQstG4X4eXY+aYiVOG3GuWqmQy
X-Gm-Message-State: AOJu0YxxrVRWVBenNvmDkp5taVmp35lY/Su6lUMxZybrjrRh8AvriXM2
	xUIiw+qTgmWe5TmDFF1YyBnH2U84RRl23O5MM7KPCBQRdGXIdfXetZYJxEcY9QU=
X-Google-Smtp-Source: AGHT+IHgXfI8p97ruv5ETVys/NblWrTLmITHlfHrRMMEOsIzKJV93YK/2ydXEzUpnj4m5gNxN4GtSQ==
X-Received: by 2002:a19:a411:0:b0:51d:5d33:892 with SMTP id q17-20020a19a411000000b0051d5d330892mr227521lfc.28.1714251987823;
        Sat, 27 Apr 2024 14:06:27 -0700 (PDT)
Received: from builder (c188-149-135-220.bredband.tele2.se. [188.149.135.220])
        by smtp.gmail.com with ESMTPSA id t8-20020a192d48000000b0051971559a52sm623151lft.196.2024.04.27.14.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 14:06:27 -0700 (PDT)
Date: Sat, 27 Apr 2024 23:06:25 +0200
From: =?iso-8859-1?Q?Ram=F3n?= Nordin Rodriguez <ramon.nordin.rodriguez@ferroamp.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, saeedm@nvidia.com,
	anthony.l.nguyen@intel.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, horatiu.vultur@microchip.com,
	ruanjinjie@huawei.com, steen.hegelund@microchip.com,
	vladimir.oltean@nxp.com, UNGLinuxDriver@microchip.com,
	Thorsten.Kummermehr@microchip.com, Pier.Beruto@onsemi.com,
	Selvamani.Rajagopal@onsemi.com, Nicolas.Ferre@microchip.com,
	benjamin.bigler@bernformulastudent.ch
Subject: Re: [PATCH net-next v4 11/12] microchip: lan865x: add driver support
 for Microchip's LAN865X MAC-PHY
Message-ID: <Zi1o0SilOZ5gWMlT@builder>
References: <20240418125648.372526-1-Parthiban.Veerasooran@microchip.com>
 <20240418125648.372526-12-Parthiban.Veerasooran@microchip.com>
 <Zi1PxgANUWh1S0sO@builder>
 <e89272b1-7780-4a91-888d-27ae7242f881@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e89272b1-7780-4a91-888d-27ae7242f881@lunn.ch>

Ok this tripped me up.

> The device tree binding says:
> 
> +  compatible:
> +    oneOf:
> +      - const: microchip,lan8650
> +      - items:
> +          - const: microchip,lan8651
> +          - const: microchip,lan8650
> 
> So your DT node should either be:
> 
> compatible = "microchip,lan8651", "microchip,lan8650";
> 
> or
> 
> compatible = "microchip,lan8650"
> 
> There is no mention of lan865x in the binding, so this patch is
> clearly wrong.
> 
> What do you have in your DT node?

Initially I set compatible = "microchip,lan8650", and did not get the
driver to probe, so I got carried away with adding things that were not
necessary.

I dropped my patch and tested again.
What does work is setting:

compatible = "microchip,lan8651"

 - or - 

compatible = "microchip,lan8651", "microchip,lan8650"

but just compatible = "lan8650" does not work.

Also I'm getting the output
[    0.125056] SPI driver lan8650 has no spi_device_id for microchip,lan8651

As Conor pointed out setting the define DRV_NAME to "lan8651" fixes
that.
Setting the define to "lan8650" yet gets the spi module to log the 'no spi_device id..'.

I don't really have an opinion here, but I think there is a risk that
more than one dev might stumble on the same thing as me and expect that
either or should work.

BR
R

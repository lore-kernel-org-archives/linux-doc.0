Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628BA2E1743
	for <linux-doc@vger.kernel.org>; Thu,  3 Jul 2025 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537408; cv=none; b=QV18XMuPVIjyYd8S+6O7P7Pl6V/lxqqQ80F3O3SlE1LpdeVCdBH8QXD76/INIll1Y64/N3ZvKLDIHZTplb2SphK0umJruyYvb8oD9U7J5vzO2DGH+GNzPPhiIQhuJNpK5XGF+W3xaTm/SkryWgVhhMwASHqUk/6L5rSASFbS/fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537408; c=relaxed/simple;
	bh=2URzPKeWwOWlfZr3VMU/R70qtUMAmLZrCaO6QOVU9A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qy5BWxsxRtwAXHbiQPpfJsjadRI73kIsHYUcQzKctYhUS1Y9YX744BakBwSIn+QK91Lao5EZkzUcWKh3gYpsP8W9ht3N9zlp/YKs7PzxgPkGoywKJGtimJWpWlHYUvlSe2TSYV+R892M87tdKH/RcrE7pehagsWP77udK88kPTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=cSpZCwJ8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="cSpZCwJ8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4288972f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Jul 2025 03:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751537405; x=1752142205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hFA4oh4QUQdOxuaA9SVG8ATJhstNeNbsNX9+qVlE1g=;
        b=cSpZCwJ8EPQEGj92CQZ/ZWw+yF7rLqbrdcjuFEdf4Y652bVBXhqNYK+ICQdPhG6UdM
         owHTylNd4rfnKmPr8lKRATHqlljA2qmGlRlSgDEECbxMa6kyrnvRqyIozmxt1pKOSRXa
         BUvMAmUtUxdYdtsouIjrQfIjlFRccIOT6pRIxr7HZom5sKNWDw+4np1Okbp1Q5YiNAsD
         +w3lZnRhVkKiAHKcwh3CbGAZk1GRfEF0RZjtoIfnWnitXe+FU7FzoV1U9fwQF+zXL2R2
         RsFd/EiMOvIsTgZQP+V/+RVPD5/NEGIzmz47jGh6tMRn+ma9iJOgVukk9b3rV8fopbUb
         Vy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537405; x=1752142205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hFA4oh4QUQdOxuaA9SVG8ATJhstNeNbsNX9+qVlE1g=;
        b=bPeitQERdL49vWOWay3fg6+va8rQT6gXmdap9gy8DyFibCax56V3Gi61JwvvBtWBKC
         07eM+TDn0E+qaS9x3AXIQN/KABVhnesP8FLZ4g1NZFn78XD9vw62D6H2d2hWELqthmL3
         iEbk8AdRSzMT3UGWYd1rmXmGrDKtU+5g9Z0jRJ3usaUf9tJVbkGEHik4WkUv4Bp4IBGZ
         NCGheDmEJkFauohMQ2PgNninQ9kw43RGFnsNmChqasfoLRwS94apd0S9uPxdp53VCYHb
         9o/dX96ALmU2CsyE9r2NOsY0oUa2igsRFkQkOBV0/jT5qdQnVe/wV9jRHxSzLmlu0BWE
         DYvg==
X-Forwarded-Encrypted: i=1; AJvYcCXUgfqDKL/Dp9JWJm/jT6MMmMFVEjjQMBuXfIeT0jMnOcz+x9/h8gHrmAXR3UBUt8h0n/BtfocKGbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4QOxrivRpzR+2nCNn8RKgg6GirfMBDWv98skfFFt5eDMDcU6e
	+CoPsh+B1xsqfD5mLpJiDC1qReaPm55ZuNeFiTRX97kYUskVEJJMuK0nne8iuXAl7f0=
X-Gm-Gg: ASbGncvjCPL1lFQIjtnmyh9lamcMJeGwn3Bkdd9g9qcXr+R/AwkGRa21l3PmhIqpPOa
	PyL6KHmX+vaiIB3Y6iZfgXw4Fj/1zKXS1pJ9Wt2LZZDPdNRzfapYBMvEb3t84q7eZgFi5F4476X
	ccBMzJEeJRDtI+P7abhXd7TzB45jgiSjKelrblswgxJ1uGBYtUyT++VgezEckQ4rI5lY66nEI5d
	kBebTEwgIEyzRPnwiwYktcfnqeNW3twe8if1f4EkpfM2LajCD1QslkYMgNkRKcQomAsgqTv2cZv
	nRnuk78ZCuCIgdepY6VZAKsGGrSv/QbD+CrJRZxrnNTMTohv+72d9HzQKDEHuFWhTMMsTw==
X-Google-Smtp-Source: AGHT+IHfNjDl88KLIzBBak/j4QsOeoXaT11cx/c0F4gN8GQS6D2qXXuoCo04NSmd3GiJG1PcpnF/0A==
X-Received: by 2002:a05:6000:4011:b0:3b2:e07f:757 with SMTP id ffacd0b85a97d-3b32b145539mr2068694f8f.1.1751537404431;
        Thu, 03 Jul 2025 03:10:04 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99878acsm22244925e9.17.2025.07.03.03.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:10:04 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:09:53 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v12 07/14] dpll: zl3073x: Add clock_id field
Message-ID: <pfkr62fp4jr2bts3ektfwn4or36lqdsdqfsntryubr5oawx7kv@adqwk2qoflhu>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-8-ivecera@redhat.com>
 <amsh2xeltgadepx22kvcq4cfyhb3psnxafqhr33ra6nznswsaq@hfq6yrb4zvo7>
 <e5e3409e-b6a8-4a63-97ac-33e6b1215979@redhat.com>
 <cpgoccukn5tuespqse5fep4gzzaeggth2dkzqh6l5jjchumfyc@5kjorwx57med>
 <4f2e040b-3761-441c-b8b1-3d6aa90c77fc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f2e040b-3761-441c-b8b1-3d6aa90c77fc@redhat.com>

Wed, Jul 02, 2025 at 04:51:47PM +0200, ivecera@redhat.com wrote:
>On 02. 07. 25 2:01 odp., Jiri Pirko wrote:
>> Wed, Jul 02, 2025 at 01:43:38PM +0200, ivecera@redhat.com wrote:
>> > 
>> > On 02. 07. 25 12:31 odp., Jiri Pirko wrote:
>> > > Sun, Jun 29, 2025 at 09:10:42PM +0200, ivecera@redhat.com wrote:
>> > > > Add .clock_id to zl3073x_dev structure that will be used by later
>> > > > commits introducing DPLL feature. The clock ID is required for DPLL
>> > > > device registration.
>> > > > 
>> > > > To generate this ID, use chip ID read during device initialization.
>> > > > In case where multiple zl3073x based chips are present, the chip ID
>> > > > is shifted and lower bits are filled by an unique value - using
>> > > > the I2C device address for I2C connections and the chip-select value
>> > > > for SPI connections.
>> > > 
>> > > You say that multiple chips may have the same chip ID? How is that
>> > > possible? Isn't it supposed to be unique?
>> > > I understand clock ID to be invariant regardless where you plug your
>> > > device. When you construct it from i2c address, sounds wrong.
>> > 
>> > The chip id is not like serial number but it is like device id under
>> > PCI. So if you will have multiple chips with this chip id you have to
>> > distinguish somehow between them, this is the reason why I2C address
>> > is added into the final value.
>> > 
>> > Anyway this device does not have any attribute that corresponds to
>> > clock id (as per our previous discussion) and it will be better to NOT
>> > require clock id from DPLL core side.
>> 
>> Yes, better not to require it comparing to having it wrong.
>
>It looks that using clock_id==0 is safe from DPLL API point of view.
>The problem is if you will have multiple zl3073x based chips because
>the driver would call dpll_device_get(0 /* clock_id */, channel, module)
>
>For 1st chip (e.g. 2 channel) the driver will call:
>dpll_device_get(0, 0, module);
>dpll_device_get(0, 1, module);
>
>and for the second the same that is wrong. The clock_id would help to
>distinguish between them.
>
>Wouldn't it be better to use a random number for clock_id from the
>driver?

I take my suggestion to not require it back, does not make sense.

Clock id actually has a reason to exist from UAPI perspective. Checkout
dpll_device_find_from_nlattr(). The user passes CLOCK_ID attr (among
others) to obtain device by DPLL_CMD_DEVICE_ID_GET command. He expects
to get a result back from kernel regardless where the device is plugged
and across the reboots/rebinds.

Clock id should be properly filled with static and device specific
value. If your chip can't be queried for it, I'm sure the embedded world
has a solution for such cases. It's similar to MAC of a NIC device.

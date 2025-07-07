Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE97286D49
	for <linux-doc@vger.kernel.org>; Mon,  7 Jul 2025 08:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876893; cv=none; b=s2DJR10g8rEAJ2pAysBG4gaMIbuxXOg2Y7dgRMJysu0dmO6HpPp77yqC+qENmwzvpnNXVBx6ruhZKu6/pFGuzOfdjTB3ybybSghZwbjNemGXwrq3vuSrPPaQVG/yP/IuP7uPClsCWNcoDwNlahhddMx+7HL/L7GCIoksEqGWmPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876893; c=relaxed/simple;
	bh=7q4L0/HVt7fqu+vGAxu0KRh4POklcFmSqn8hzOULv3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l697u5IoZMyp5p2MAuO7s9dNdTzPryDjZJVuV2+sR6nWG2fyDnMT2Qzeb/9NOunUsg/7VtS1ud5LoM3yKvCyk999m+uZioHI1+FAA1JFVmTXCK+mpw/9Apkd1JG6KgOUWva9AxkQXCSSeyLbo58a/6/kxXiW1NyJtQDF4iFquXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=X+hjSDWi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="X+hjSDWi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453066fad06so18943945e9.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Jul 2025 01:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751876890; x=1752481690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7q4L0/HVt7fqu+vGAxu0KRh4POklcFmSqn8hzOULv3c=;
        b=X+hjSDWiZ+GRfcVDEgfAmeViHpPZ14WWogfUPTLsEfDaANxl4b0pnkiRneJ51PIcr5
         pav/0Juj8mmn8Y6QzBm44w3dGAO8ZSlNFUUdA936kaokxAAjW5iBWehLYm+E1d2iG6rH
         eTjCmFQmFxvhkUZlb7H5Ub5cZVWpyh5JUtyVCDW0+QRDXNMLHYBi+7v5OrWai5HGAFPD
         42mKyRpbSzQJbMoazfBXbH4iTxYw4mgBvAlx2OuqmL9K1FtKLEVyQ7RceUTLULdmzLX6
         wuk/uAOpdf3LbeJmVTsztKtUeLDfRPH/8HaKq0UxukS0qmk9QRkXc1Zs6cZprKI6UfWd
         d3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876890; x=1752481690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q4L0/HVt7fqu+vGAxu0KRh4POklcFmSqn8hzOULv3c=;
        b=hfwoOhbPg7WbDZcN9RjBdK0gC24DwI2oFOYfxPEiFZX9MYR6I1CIt1rmB3Cf0NYZpd
         ZsstosTsugG1cjjZf5rQjXx57pt9aPNB4nu5oRo9OvNCpSDlVLzTerP+DZpK4y2WaxS7
         K9A4YGGzQu7pGaSVTQwIrWo3BNeEMmUy8pssdMTrkYMgb1iMy3tzBB/bxDbAarvTzMCT
         Ut19cqMawR3S8jfVd+SpT/D7R9FfSQ6gqOiRW/DUx8oV4TCCE1gDDm+PP8DsZk2OIYR9
         Gkz0h8x3D6RKT/VZMLkebZF5v0W7hbQsYSrrUUGYP0RaUm1lyHWHw2MGE3n4vgCLLyM6
         8RWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpSpVHMQHMJS1xN9t1pbHtOzYrk6WUMkGknzslG2Ajj0Gd/C+FkGZbBn+y01pWeZiwcoEIq+pEyMc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu9E+ZwWhgkHE5p957wzSoBH/Nyd52UlIWPJg3F6paS0mvp5IX
	1TE8SfBepbpcxFSX8dMcf3Wi3SnPZFmIaVafaS6y3CdYVv0oPWIj276uDoH7T/dp/ho=
X-Gm-Gg: ASbGncu2AtHcawUABZmU3h95ghOM7K0bjPek1bc0EgagtWuul5LDDxwCMR2LeJHkVxy
	Ym601LDmSwle4Se0SOMo2M5eErhkM6z3ymMfrn2Gl8fr0FJTxuPxhkcj8Kg+MVu8QpjYmmYuH/i
	OsHhTxYlKdfMuZgFm5tH+l1HI27/niXx9uN+YJZdjyu32Qc6ppTwV6Dli1YKAQa8J62Wh+vJxmw
	ouVIC+apDI6Fe5HMocBFllhOQWtzRYMjmtPr0T1YMAfj5B1on33U8ZVx5ssrfJGoQ8lghT+OycL
	m9HU3ZKVWqW2YmDDpkXNnTNmc/qa+UoQQpQZkJxnTDnqmAnMxv/T1rz96gLrr1M=
X-Google-Smtp-Source: AGHT+IFRfk+w0/Ow65OxKmSEQVTq3eVHdoVGjVC18oPqGtD6akAxTK4V4xmuLbMUl30D3BToFnGUlA==
X-Received: by 2002:a05:600c:b86:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-454bb7e7ac7mr65694205e9.7.1751876889784;
        Mon, 07 Jul 2025 01:28:09 -0700 (PDT)
Received: from jiri-mlt ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b96726sm9620536f8f.58.2025.07.07.01.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:28:09 -0700 (PDT)
Date: Mon, 7 Jul 2025 10:28:07 +0200
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
Subject: Re: [PATCH net-next v13 00/12] Add Microchip ZL3073x support (part 1)
Message-ID: <cdvecjk7sz66hnoue32nlhwlbghyqkc7rk4ri2me2oioty6aiv@nf7v2bjj63h5>
References: <20250704182202.1641943-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704182202.1641943-1-ivecera@redhat.com>

Fri, Jul 04, 2025 at 08:21:50PM +0200, ivecera@redhat.com wrote:
>Add support for Microchip Azurite DPLL/PTP/SyncE chip family that
>provides DPLL and PTP functionality. This series bring first part
>that adds the core functionality and basic DPLL support.
>
>The next part of the series will bring additional DPLL functionality
>like eSync support, phase offset and frequency offset reporting and
>phase adjustments.
>
>Testing was done by myself and by Prathosh Satish on Microchip EDS2
>development board with ZL30732 DPLL chip connected over I2C bus.
>
>---
>Changelog:
>v13:
>* added support for u64 devlink parameters
>* added support for generic devlink parameter 'clock_id'

When do you plan to add the code which gets the clock_id from the
devicetree? I'm asking as I believe that should be the default.
getrandom/param_set is fallback.

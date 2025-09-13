Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621052DC78E
	for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757761350; cv=none; b=u5wMkwTTFcM9tIG7Vak76xtwfSZyLMEhoMRkNM8P4hBkaaK867mHE6+wR7D4H1ZNFDuVRLqipMT1ljRBv5T3swSra9xg90mAfUJmEcyXo5gTJu/j+Bk1x9wE36V3y3pzn5XKH4btF83owAWZ96u7sueH7u0AMrlFgAvV/VLXPas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757761350; c=relaxed/simple;
	bh=BXHeodyc6oI0LqMSWJ3CeHdCp3CLonWo1Am23e37j80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPvspFmwYH0/64Yh7V4+y38uG+4ujZIi8otqhW2mpOWlnM1B1xZp+G9gbQp9IOEAirRHnsY3ovrMPY8mTldp7H+y4nebzKOEo7+BRrwN8Qw3mhnyCmJh7nTkEb92I2cG5Ae6KfrhkgNt4rIbtNoSzJRFZO3AtcLdNaiufUk3aC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THdh2vyh; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THdh2vyh"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77250e45d36so2278497b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757761349; x=1758366149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSHxxUm5MkO+s5BZz5eceu1yg1KflUbRrShjzBDT/G0=;
        b=THdh2vyh3Jtpg3laeiJ84oORXNH7/VgDJ77kVd6Ugetpn3RAsllx+5kgQ+X+1TMvSy
         AkZ4j5jr4PDOKVrKlgCWqdabAtbxFcyDjd46vSn4ojicK2lcOxpczQMB95lhfLR5hDV6
         CySMeL7MPjHZULkL6SD7dk0FxG+zpqbEOmHraI/rtcZH+xPNZYFSd/WpVS31glpuYyrm
         E60FEN8aLs598rPvXM4j1gcZ1gUS8vHDjV9j3SmPSv0KS66B04p6YMvHkmw02PLCPig2
         kqvTyDGk51WDe1LQI28sFig1Pm3qcgqodq2EkG/cnrg3sodYFE63vdBBCi+f/r1tVbcG
         Adgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757761349; x=1758366149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSHxxUm5MkO+s5BZz5eceu1yg1KflUbRrShjzBDT/G0=;
        b=wD2w07PXabGiltVThx9sAnIH+6gmx8xXcfyG6+QS/KIZIzYus7j/1e3MOccG/yIcaV
         b7vB4SaOsebssHmSaaCnbQPfbFlbq67Dgh9LAUD8njqRZD9lyub8LDgMPj/a+fpdwHb0
         NrOk0lZiMo4zCf/gG9GBiDtBcaHlftqzG7V0rxNvqC6AdQgMuCvV2+pHfJQgrw/Nxv2B
         9OqmpeZ3dpUyZO1HZddC8Lk2d/AnVAX6drrhL0n5Fge6xX/8BjscjMG1D392uy9nWh3U
         LPSN2WJKw4yeMhBzqszcWgKS5jP+96GknMGh5LuH4JODMozANQsUCEwi7USrB9/Ukm9J
         Wqew==
X-Forwarded-Encrypted: i=1; AJvYcCXGHph43Match9vnj1Ov3TJ0Bg6HAzOA7iR3Chk0Gcw1kf9/1rO7eKRrteEozxu/1LxaYXq0XhNbGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ5IjR/SJLVBtaU8wnUsS1AT6EKUY9/VpSbG22MfPPPcjw5Ldb
	Yb612IQHgB2RtyA3ZT7lmB3BF92h8yP3bj+GqdlLkWWDdVZ8j8X8gAPE
X-Gm-Gg: ASbGnct10myEYUejFE0/IoyK+iYuz5cPO0WezL/QYIiULz/MpVyL2aRHyAFuhZEAKUG
	8B3PfVs2u3HK8mlA/mvLkqar2Oey7+Ax1oPPVCJ5XfUzdUaQQ4grWLiKDP6HtM3BE6ibagx811g
	mN+ZgmTcriFZg8MOzjdPysn2RmWmYgXNmI2aRXFPbLDreBjhIcT7n5ASIJn6sMttZxt5OhMA1jb
	88gMPMqfBcC2cF+h8kRTP+sbojfBzvmt51+uRzbuW1mmeGDgZJqH9WI4wkMW07hC2MihZM9Ri+o
	sRSIWkKtKP1ypu0sNzoXx8k+DRKx+iOeeAvJG5/UryqR2TmpoZej0++cSB+1pvMGYkcNac0pOO5
	JpR1ceGIESmNJA2d7VSz60NeGiAwQ5BlTgb9N0HAgNuvWzw==
X-Google-Smtp-Source: AGHT+IE4JTVtkLqMLoiz8/TSrmFSmKr5Hr/jEFds8tWyqz0lknQdtFDueUAIhY8b3MH0shhwJn12bw==
X-Received: by 2002:a17:902:e807:b0:252:8cc1:84a3 with SMTP id d9443c01a7336-25d26e484f0mr71857785ad.43.1757761348521;
        Sat, 13 Sep 2025 04:02:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b305054sm74144345ad.133.2025.09.13.04.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:02:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 13 Sep 2025 04:02:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <0ce54816-2f00-4682-8fde-182950c500b9@roeck-us.net>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
 <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
 <742fe9b5-bc53-45f2-a5f1-d086a0c9dd1c@roeck-us.net>
 <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>

On Fri, Sep 12, 2025 at 03:00:22PM +0100, Nuno Sá wrote:
...
> 
> i2cdump -y -r 0x41-0x79 1 0x15 w
>      0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
> 40:      b004 0000 b00c a03e a03e a03e 2501
> 48: 0000 1a03 e07f e07f f07f e07f e07f e07f
> 50: e07f e07f e07f e07f e07f e07f 0000 0000
> 58: 0000 7002 7002 7002 b07e b07e b07e a030
> 60: 9030 a030 0000 0000 802f 1000 1000 f0ff
> 68: a004 a004 0014 a004 a004 c004 0000 0000
> 70: 0000 0000 0000 0000 0000 0000 0000 0000
> 78: 0000 0000
> 
Thanks - this should do. Note that I am traveling and will be away from my
systems until September 25, so I'll only be able to look into this further
after I am back.

Guenter

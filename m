Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5801345EA2
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222914; cv=none; b=VBoXmhWhfaZ6WLEd1NJH3vOvKWvm+wyhP7DblwXJMLRRon8Cys9D5XxLJrCvFepN8F+ADS43TdrEAFa0CazLK3PmQSOtyy1QwMFBQgLpaGvTuyhj2+C6RLltUgXPbWTScUIe4AHYL53+2oIu6fx7qztSwIucmvIezqZc3hN32H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222914; c=relaxed/simple;
	bh=KgZKD+EluK0sfJ94RDAUxxixgPsC7zCuBwgjrLJz1FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAfyS4WoRWtDNSpbEPDBZf5EHZMj9XNSV6V1s1q8A7UuNIQFUNHQJKq8eC4GgNK+M/zNPIm8nB/GFWHZommoBh3aClFnwlRoBruNalYUzXanJ200gOQKgjuhJQxxdMBO89Ts4tDnK4j+4Sr/G/tUKudwyvSno7ZnKW/PJ1Wncds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyVxz7G8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyVxz7G8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d942c7cc2fso17992485ad.3
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222911; x=1789827711; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZekEX9u4dkM+nKRZ96Vifo/IB+ikfrYJWegpPxurD8=;
        b=XyVxz7G8frBAkuLTDZhqKlA8o7034o+uk6nUvm9Z+i9h4XyNTaQ+kRyeLhrlQZdJiM
         G8JlIAdETtZnTeAydqpTJB5ljemwSviMgeoqEeDa9Cj6ddVmh9GvnaDOP67UY4qfbiSm
         2dZSnnyAVK4MJDJltFA1m5OoEvdQtCVHBkl4GdHgYhkRvlhxLV0xuB8o9/96jICdf4d6
         jr1V3/Kx/xf8d7BlrPo3+j4ax8k3FmoAzPHtboFvxFegpjcp3QJ2nSGwQ1lSp71kQJS3
         ECblMT1VKNWM0bFpyn1YIAVnlC010XFT8kU7YRcCuOc1IN9kVvhHc0qUKFi0EHcIyp04
         IgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222911; x=1789827711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZekEX9u4dkM+nKRZ96Vifo/IB+ikfrYJWegpPxurD8=;
        b=AFAtO11SsaluESXF/JohJVbjSb5V6DRkfx8CMgUUP8Yq4x6CuwW40Izj1gCj4OWNeR
         J7QLadjtlNuUII9qY0MjEjAkQq8pm3LgUei1QiWLnWK2NJGyGS80HECbQSXv5bOHHEc7
         33F1l4e1+dHDV/4j9l4phXGGZIKeiqpxoxdBqFsJ8xVdF2F9RKqDTyXD6vfCUMcfns75
         qOCc1/IVBYb8kwEmvAHgrjQxFnWyTbb9jZzwD28j9dbeip19tIX1KqbsVObWxqndLJnL
         RhghanDI2jxZ+WWHwYS/p5reequCMp7VyMLbsDB2J+P/Vb+rmrX+dfcSBVG/IclaQ39i
         Ml6A==
X-Forwarded-Encrypted: i=1; AKwUvBw5EkjRC981vJJn9vyr+cN6YkCp49Bn/M8meEYhGLra+6ZTK1ULMO+PAdHmqJ3uGMvQkSKrSC+hsi8=@vger.kernel.org
X-Gm-Message-State: AFuF++kpbO+mIJfQIFNqnteYTiCv9iYjZ5279cJbAv61Is1SY1wQ7cuE
	US3f+IKHga4BYBTuqzk5N/RN8yJE11iktU6PH7XcANk1mwB83ma6cR0g
X-Gm-Gg: AYBFou3Gjmvdqvb2kLlb1X7shozhNCknLt7v/rzmAL9rcTZYAYz2oG4QZMEUbVUefRY
	T6AQbtyGkver03zsoeWUh3VS7egVmqkXxyA1Id+nGuHur69KnNJe7GYyH8ApWv1EH2AIh8owBj5
	kUtpvme1xfB90tKlW3gAzr9adHCwx5K+M8UHv4KIjcwfKapUScuoZCFnwhfP0tlKL2CFT9kVlMM
	Ax6X6EPvaehEPVn+0N18bnkc06RyMp+xbmY4Oqwo8OKbvBD3qzvhLbyv08THYtlcREJq9GWN664
	0TThV3mmW6DpHvLPi3Cbpl4K1FZO7XiC80HqYBlq9rAu0d8X+Eup5gj/20z0Q3/ZJBgWHI6bpbj
	zdovy1ZLneNaHMSdyhu8ZxAJc9ZObMSck/uS/lgEHYGtmzBqux/aaHLyU1+4tVOZApgyEPEOtSf
	ek4mlylrGTGuehTcE80oiVqS7Z5Jp7tQv3aBgoVS1Wd4myHrdvs7FplKauBDsAyeu0cRi/bENtY
	vfvZWNPHJFKZQ==
X-Received: by 2002:a17:903:1b4f:b0:2dd:40cb:a054 with SMTP id d9443c01a7336-2dd40cba32bmr89839555ad.19.1789222911290;
        Sat, 12 Sep 2026 07:21:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3f0faed5sm17625205ad.10.2026.09.12.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:21:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 12 Sep 2026 07:21:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: hwmon/pmbus: Document MAX20826 and
 similar devices
Message-ID: <c8ba0294-79bc-4b81-98b2-94577c1869b2@roeck-us.net>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-3-5e30cbd97d84@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-hwmon-max20826-support-v2-3-5e30cbd97d84@analog.com>

On Fri, Sep 11, 2026 at 02:53:39PM +0100, Nuno Sá wrote:
> The MAX20826 IC and similar provide a high-density, flexible and scalable
> dual-loop solution for high current cores for AI applications. These are
> dual loop solutions multiphase voltage regulators. Between Rails A and B,
> MAX20855B and MAX20908 supports up to 8 phases total configurable from
> 8+0 to 4+4 phases, MAX20912 supports up to 12 phases from 12+0 to 6+6,
> and MAX20826 and MAX20916 supports up to 16 phases from 16+0 to 8+8.
> 
> The output voltage of each rail is controlled either through PMBus or
> through the high-speed processor voltage-control interface (Intel SVID,
> AMD SVI3, Nvidia PWMVID or AVSBus, depending on the device). Which one is
> in use is part of the configuration the device powers up with and is read
> back from it, hence adi,rail-a-high-speed and adi,rail-b-high-speed only
> tell whether the high-speed interface or PMBus controls the output voltage
> of the respective rail.
> 
> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

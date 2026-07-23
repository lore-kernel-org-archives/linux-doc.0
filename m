Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6E33DDDB1
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 21:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842589; cv=none; b=UBYMVXCcdkShTAQR6If0lRCeqWiwc24PCe+IE6XQCJVHL4fbEGSEL7nRh82GjFEcklkGKJ0Voh7RAjZEuxfg1Kr8z2YL6KP3HLQ3ohDX1FHIpOOYWN74uIh+BCIxhw/NcucNVwHcqbZal2xwT9FUMaXzAEN0S2Utj4UXE3ix184=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842589; c=relaxed/simple;
	bh=nZywLPbLzF4rq+/qFXJiQOWrYkbZMu0rWux6FAaMmds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3YKxX+A8mi/OFDLAs0vPVeeJUgl62KB024Lb0kl+zlLztD8fbV+zNI9L0BEbYqyyqF38RQZoLvorPsa78RHAWjJs85Pc75AARFyelzGnxjV1QPh0lVb2NpAmC4LWIxZUgFHjIQblHfMgCCauErgTuCS/YLE47QDhGEFF/8up08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEb4laox; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEb4laox"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8486672f03cso1184532b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784842587; x=1785447387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7oY6XrKwOvx5mixYV39vBKj7VlF4d0i2PtDOKuSJh8Y=;
        b=jEb4laox2Pc/10uCnm7wOygwKDal66OFo37bCyHwZmgd4bThnrvSYbftjIisMepY6c
         P5x2KQ2FzdrsFQrmZdovyA++fgr045xp7hpL0FA2sWwIByW09QIVuhhAk1gEJdAFiLBf
         Ot1OvaipUUvoPiKb4RaYoc6/1d/qjIpgJLSdKIgv5yoYpLTgFj3P0vNADGwT7I/MIu2x
         DIfgzyN1ZYhlLRsInLnt23uwMTPxR4d3ocSUR5+GKBd8jzhvIO7i/MOuP34q1xLDt/Zp
         ym/x78YdVb4JGi2aZFooUznvX67lmKWlXhnqWqTsVGv8yiZNOTbGjtpxbKAF8fzo4Ibu
         bJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784842587; x=1785447387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oY6XrKwOvx5mixYV39vBKj7VlF4d0i2PtDOKuSJh8Y=;
        b=d/TukgyQ2pRrllSKDvEy33Hp8O9phbFJxeI1IypOjgoeW0R2pYaVvnaDvAKLTXGjrK
         bMe92mjSH7BYa00E8/jytZTdJjTP7aTqwa0rRm/0gAVLU9ZY3TX81F1x3VEchSWAo+Bg
         8//04llDraw98+2xgp0juVyxpkAZA8vhdMM1RsGrDsHH1SE4dH9YiDC3XYeNW1RXjPFV
         EToS6fvmzWORv9aCs6N0F2kPf48n08v9mx4h8zvJ/JtK98bOO2nzFTiv7j2N/THBdBA9
         9xZ3r1KgG1Jzzj7v8m46GyPwMOQWHU48kgwZIEQH2r9QNqYejCCkL5srm/B8iUt7FliG
         SWcA==
X-Forwarded-Encrypted: i=1; AHgh+RpopdAB0+pdT15vLnVZjHyRxhDUDaUgaOzqtFUhA4Tjp12n59JndauwnPpK/T5b+fsq2uhb+tlAm8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA+TSAiLtmYFxoxBCjqlBgpyMi8IuTchFFCaNLpJWXqxPptM6y
	7/QYWYJKqnN4Bm6SrmuY3u2zitbutXsANVDyyV8VDKaMbyHr20saaa3I
X-Gm-Gg: AR+sD119N4H/vLuElAV7KCeSY6AXBeXnkD0Ot6tULp3H1qytPeDyW/gbxhGG+pMlXiL
	VtteCtNY37fhtjW84wa8euEcQ56J153dqCRBfdbmBEeBrIpGwM1t19LUVqog5rGz7D2TTuuzRgX
	+ZV8Ji6ZmO1JfihUu1Nz7YPwqogbZgp7X6DI96VWWMfY5QA/JkE+FRhUkVwdI/7ULeoL0SkP2QU
	EGF0klp9HNsJ1IlYyX+1Lw56Ablb9HP3PeHX779ukvi7TLPmBubsAsREq3XXhKPx/eYhdBhEyf3
	uGGOnpT9OFgHMiCl7y/qX0PRHkBP1kES5zJ3rRF1b7hBmAM8B5XCoHFaJI827kgfHdmGvkFP5X6
	tT8c86KGkBGybIz+9u2nvNhh1IR8hB86OObGEIRvH/V9vYIYHoaoRVibtClSLUqhGha8DrfEaBk
	mNdmtWuheOGZmdJF4=
X-Received: by 2002:a05:6a00:4f83:b0:848:2f7a:2e52 with SMTP id d2e1a72fcca58-84e2bb71d71mr5691690b3a.65.1784842587587;
        Thu, 23 Jul 2026 14:36:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a9967sm3282917a12.25.2026.07.23.14.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:36:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 23 Jul 2026 14:36:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Kun Yi <kunyi@google.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Carlos Jones Jr <carlosjr.jones@analog.com>
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/max34440): Add support for MAX34452
Message-ID: <1dcfdbad-93dc-4a71-8308-a0936450661f@roeck-us.net>
References: <20260722-max34451_fixes-v2-0-bbddb18ec1d6@analog.com>
 <20260722-max34451_fixes-v2-3-bbddb18ec1d6@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-max34451_fixes-v2-3-bbddb18ec1d6@analog.com>

On Wed, Jul 22, 2026 at 09:29:31AM +0800, Alexis Czezar Torreno wrote:
> From: Carlos Jones Jr <carlosjr.jones@analog.com>
> 
> Add support for Maxim MAX34452 PMBus 16-Channel V/I Monitor and
> 12-Channel Sequencer/Marginer. The device is similar to MAX34451
> and shares the same configuration function.
> 
> The MAX34452 supports:
> - 16 configurable voltage/current monitoring channels
> - 5 temperature sensors (pages 16-20)
> - Dynamic channel configuration via MFR_CHANNEL_CONFIG
> - IOUT average monitoring
> 
> Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>
> Co-Developed by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter

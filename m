Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41A34B5CAC
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003817; cv=none; b=s3eaERAdurzEcVzrIRH8uOoWagNv5Jryq2+B0h+PsnlyybiF4vfY07y9VfIKO1LbiLUw+97cPmiXbRU7oN09aCD4DLb2FzuZklEWvYvhqx/FJuJgNNohLg1vmTEvXowo6535HI3ETAgkaOIBPqh6q5mJ0p0GriHqjwp5kikYgLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003817; c=relaxed/simple;
	bh=btmsrMp6ZT1BNi7RwicFG5ia2RT35kS11G26E2R65RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQKslj4/hmriUhSMQGF/x9mLyE0/L/E3xvIh6MsClhP5ZzV2eUmDNX7YENbZS9K4u+0NOYJDdpPYy7l75nSBwCJZJjQY6ijw30Tz5ViEDzPwTlxW7VwMNF3gvczlkyGc4LfhizE2kMWuBmC9M+lzDKbtFCiO6B4RBaoMNE3WAss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gsv5SvNc; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsv5SvNc"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a0so3450123b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003815; x=1790608615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=;
        b=Gsv5SvNc3udEak8jwB8FeYVWdWaqy/aay5ShKJkiMtg7dgfnXhWKyS/x9mmisNKdNJ
         zC62/crv6yTsmQQR6AxoUxJ8Oi0pg2GXPur83bfU4kUZtXwqwTIQkNm1ph1W3SbHIodE
         p574YS5oyMiWYGYYjx3I4PM95ly8nfYqyQt5FilDDyGZR/t/OQB0KfFfV+bedIm0juxk
         kkUTofiJ6n1EKP9D8mufAjKZl+0X98BhZ4vg+ebTFvBO+vlEyodH8C2gDlirrt0AueJP
         nmofaNVDrotJ2D73E9JkCMMpO1CeC28c8k/YhI/LG/sWUA+cX0WXXrAox34iH5AS/3PL
         PsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003815; x=1790608615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=;
        b=FiSqDRPhB60dS2y0bkDeGaQxschnDq2Lknh87DZmW/nUYNlMuy21YOSffOYINGsQmt
         kKipl7g1n1zin3yzh32Xf4Iyiye31jJUIHc4cbrIoIhRPxWCLQbNRxVZbrS7AtzMObnt
         PeFxMEm12smYhnBXPZZERef8GtTVkQxrJ4hjw7srS4AWFfkaJnkrMsVjeXNeqGXTX6Bz
         5NabIBCVmL7HFXMo27TgEZMpBQxWh5HHaceLVDprDVkt3NSFdwwep6Nfo0ocgs0dP0Kb
         s/TNynupMdytxu9A47RI3UuS12SeJGjaZ2ht2YPsJQ5UT1vdJTPihPTGytHzv8/hRud5
         UUYg==
X-Forwarded-Encrypted: i=1; AKwUvBzgfm5McAUYqYHNAtLDd364OlM/g/pTmelAPW1qtkq2VgoU9PjRiKYIpaUfN5iTSgj+kTfiYaITSWc=@vger.kernel.org
X-Gm-Message-State: AFuF++nZo6tOR/l8xCYPYCIXcORaCQPALsLVpItCmUor2omPgfcFEMfU
	EnTFknAherDnxcjkVsLx/VDpVRgO3mei6ZSY2GW36zhqlbJjUWH7ZH3S
X-Gm-Gg: AYBFou0cUEnmVsfrgmEBsTo6u64MoGO+W/KLYd6lZ2oH0Jb3oYLFJvBpJc6j6b81EuQ
	Sz5yQeHdGhChjUikpZMl/z8/+556epCvFveTDxrCx5WEixErVRS31SnKvgjtsHZCm6isb7Rrj88
	v58lltu4F2NxnyWCS4g5gPvUHH/5FW4o1ebsAfcOXubsAhib8VSidLZjDg/SWhH/qgcydirlz3C
	oECkESijJ/jUyRuKBbMu9ctJAvc3V8t6c41sjI7INVJZatTtpa7EhjGHn4oa26p/DwjID62ptmF
	dmPtYAy0Rg+O26HhSO8IkzJ7t88KnWD+y4TnHSGZOfD0/w8KFxVARJhYw41LccrBEvXgMTVIYPs
	nDTa28k1pn5TWhE49IBuU4GEOWP25wj4v+sLYBrSuu9O0UqorfHqm6lrD+mLLVs2R2kymADB5Pw
	jxhdrD9WNeD3/UBnVYiihXz+/Hrxv2SIrwX2EsAzW0uRwCbJ9qb2Q98srmPY0q6PJueBtpX4d3e
	ErV/B9PEEJC
X-Received: by 2002:a05:6a00:ad08:b0:874:706d:857b with SMTP id d2e1a72fcca58-874de9fd734mr15109225b3a.35.1790003815225;
        Mon, 21 Sep 2026 08:16:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95eceb2sm3431796b3a.24.2026.09.21.08.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:16:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Sep 2026 08:16:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
Message-ID: <d9dfa12a-0999-4425-ba83-aacd48eea1ea@roeck-us.net>
References: <20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec9@axiado.com>
 <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>

On Mon, Sep 21, 2026 at 12:23:56AM -0700, Petar Stepanovic wrote:
> Add support for the PWM fan controller found on the Axiado AX3000 and
> AX3005 SoCs.
> 
> The controller uses a hardware tachometer block and interrupt to measure
> fan speed. Fan speed is controlled through a PWM signal supplied by an
> external PWM controller.
> 
> Register the controller with the hwmon subsystem and expose the standard
> fan1_input and pwm1 attributes. The physical fan is represented by a fan
> child node containing the PWM specifier and the optional
> pulses-per-revolution property. If pulses-per-revolution is not specified,
> the driver uses two pulses per revolution.
> 
> The driver was tested on AX3000 and AX3005 boards.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter

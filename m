Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031535E929
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980714; cv=none; b=akBZkmeyxrZQlIqp8wI75AHEqbUFuzycAwueaN5txuJHZuYPmbemPbRNKMYl136E6jNVLyIQ51kBhpbUqZ6shXhVbePCsk8krHEXPEUni/iKoYELC3uvAgxDOQAcxTgV3spxwhDhC5b+uMP/5n5uoVExmFpXC5zhgpH6QyGWg1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980714; c=relaxed/simple;
	bh=5QmGK/sRe6CLN82FEAV+S1ZkmL/I+KPUOLTHRhQAkbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbCBhsX1eC5VcJ3b8W83UE2WSZGUaM2EF4EMvyXZ1yrHiJbRUdIJexoY6nURIH+ai3EZxDNwIUZcdE0N8lUQnwH1Lmj8xxr5z+Eu/t5TuUFxdljUIzIaQ7XtmNBQk6PBOBq8DPOzFdbm2af2tpMqcLMjnRRryKWgG6ZuzlQ5UpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=SvqKre5n; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="SvqKre5n"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b150559bso35253255e9.1
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1777980710; x=1778585510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5QmGK/sRe6CLN82FEAV+S1ZkmL/I+KPUOLTHRhQAkbU=;
        b=SvqKre5nkPPIQAo74IbS+p5NJ8s4lfqqeQbU7UWCz2A9Pdg3va78F+BNhWjh1a3WeI
         paPdsiR23i8PtQam9vtpI2u7fWOZjyyOLyEUVso7ZEB7GSdWme1X+QZpbscCylCipY4C
         lM9nZWD03w5kC9GeKuE0ikmDOv+l7M5n+HxABxL7S4WHs3sgAmtZRF6Ej6eU2IymjI32
         GLMMhzZGbyy7HX/6flNx0hwX+9ew+HvQ6IS+rCUNUFarFI74CQDoQG2It2p9qzMIer6E
         yKA+yoZksL6OElZLnS4xNWgYltulFu7M1ngML9X9dJruWamNk8o8Tc46PA5ffVIfTY27
         na3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777980710; x=1778585510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QmGK/sRe6CLN82FEAV+S1ZkmL/I+KPUOLTHRhQAkbU=;
        b=NPSi1V2byVmxPI9IYEQQ3c4bfL3P0XKsx+jodrCFeFhyEAJLl7TkRRIU/s6GISbGLv
         rvEF3XdgFf/fpTTQzM9iiisqSPF8NC4pBirGxMWPZP9cBU9F1ySUCk0aRWybCiOnaPnz
         E0Rqeygeye8BAJlYqadc+B2rRtaarC6FcGBIhWKp2mw6TZtzacnxCpkxf5XJk2dWRSUH
         WDdIIMSrAtuRBnJUakNoRgyFnF61RmkUv++FSCabqS4Bjdn0t3eEDj71uenUjPulByJo
         kBbiFpcJ1RtvqOl8ZDhnqlipAXMtTCeYySjl/r9uj7wYHQlNvkcLEPW4rXbS8i8OFxvD
         CxSw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZmeuT8j4GpbUZgQKuJiOh/P8a9uwF+wGH6/JGnKvdn6lfIzD2u7lsiFzfaqJ0GyUcJVA9ZGHbJdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFC9TWL7l9GHpqYZGJp+6RGrh3BtnEfV+FpYxQYNpdAuiV6kGx
	nBbFU52dafGW1gMCy6PFYxwsWglOeEAkhsv7CcJyYK4EMUiF5+7Hy+6t8OdokFsc70E=
X-Gm-Gg: AeBDiev6c5M3jMQiCqGKabqGjH0A630qg9phPJmPjX/2CZqKeaN5ixy+BzfbmfiYH31
	rk3ShsxqnHBpjnG/bLASfB3fGoOsPSiFtJt2PrvGonp4gKGNBQwYUZ8mYf34A25XnBsTVRq7yal
	Lg0iqk6aT3nIkZVfI+VWDSICnLowzM1gYIsWVrdzMu1H/dQ9TXPHD3RYUTPKMbbCpVkAvNOgYd0
	syhMqGT4HHZ/GBV7FpuFE+CWHPeHGxrOv4N0Dc9IfVxgg0MhKIl2y75gR6MoPojOSAUEJR5lMxh
	2gkGvLKz+N2237uAcPfaIKVeNQpMimvYlYenm1oVTZd4Ab7Ihpbr9+2FylXU3E0ssziLAHuazgb
	ZCtF0gIJwEuWQ/5Srs7JZCTyXMP02RP0Ar/qrdzgJFrCYNZM6iNrYHZ4WdNEz1hgoPcZGpLPIOa
	zShEyO7gJ+kGhSyM1QpSq7yM5qNlJJsQB5FS7hYeEBzDcZ6Q==
X-Received: by 2002:a05:600c:4445:b0:48a:52ee:5776 with SMTP id 5b1f17b1804b1-48a986380ecmr220325785e9.11.1777980709810;
        Tue, 05 May 2026 04:31:49 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d184ed090sm14936015e9.33.2026.05.05.04.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:31:48 -0700 (PDT)
Date: Tue, 5 May 2026 13:31:41 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	Michal Schmidt <mschmidt@redhat.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pasi Vaananen <pvaanane@redhat.com>, Petr Oros <poros@redhat.com>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/2] dpll: add fractional frequency offset to
 pin-parent-device
Message-ID: <afnVGPD5sjpSXz--@FV6GYCPJ69>
References: <20260504155340.411063-1-ivecera@redhat.com>
 <20260504155340.411063-2-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504155340.411063-2-ivecera@redhat.com>

Mon, May 04, 2026 at 05:53:39PM +0200, ivecera@redhat.com wrote:
>Add both fractional-frequency-offset (PPM) and
>fractional-frequency-offset-ppt (PPT) attributes to the
>pin-parent-device nested attribute set, alongside the existing
>top-level pin attributes. Both carry the same measurement at
>different precisions.
>
>Distinguish the two contexts in the ffo_get callback by passing
>dpll=NULL for the top-level call and a valid dpll pointer for the
>nested per-parent call. This allows drivers to report a different
>value per parent DPLL if needed. Update mlx5 and zl3073x drivers
>to return -ENODATA for the context they do not yet support.
>
>Add documentation for both FFO attributes to dpll.rst.
>
>Signed-off-by: Ivan Vecera <ivecera@redhat.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

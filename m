Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930F64A2E1F
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399627; cv=none; b=tt1xoRELFfM/XOPITLxCQgATLEs0WZm/55djXACSQK7b8QPrhL1slwY7Eo49BgxsRZXlelZZQkGNQsf+KGdjrO0WrlmsVyyHs+j2jkZbhJzGquaJr8/MwwH90gWIIn+BAbrdR9ZrTfxysFxK/BAk29+xg7D5vPwuFRoozcITmnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399627; c=relaxed/simple;
	bh=VzeJEVXSydd4pMUvk9yqOjcNxVq4nwrj6o3Y3f+o2kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpAeTPIKq0hFZwTEhqUvk4DFgc17PpFiuUHvpcQ6Ok6OT7E7xHz4lMy6vwoFgFsGJ7zUBZTj1KI4csB6M1vc5Tp6UuUwcQTGzrjZJRQct98BqXw9Hw0ytdfddZWAxHZt8x8n8O44BauWgeYFUK8flnDo5XfRAqKsHYI5g5Q+e18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKmjJgsY; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKmjJgsY"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so14169185ad.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399626; x=1790004426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rv9xIW83dIFufmAMVUXAe8Zj75CE5o/0qI0POtGfBo=;
        b=oKmjJgsYAj5S+Yp+SBg9vNCgkVaENatjOEuHEvv0VwlTi9wgFXrLcv4pTT1N4KEYPD
         0IUmh3kI7uvYkLF58abHh/EYlrro9L21HPJeOcjKN4oz8G/Xz29d6lQ/L1Y8IW96HKeX
         fl/8Vw1PRwfT4q57qc8T8NU2n5Y04tasuT3tYJsWvcpoxk3nb1aA5pyi48EjkI+395SA
         sfOi2JXSF5O8yfqnqN8ghtfJB5HWMs5J6sWgfbbQgzDJAOIUtDKb7sBaC1wMNfU0PcTX
         IfN1ZHLDFCJZzB1LG2D/O3ILYk6pQFgmW3qalP/sqRsQU8GfSKA+OeLKs+Rut0Xv44fP
         wg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399626; x=1790004426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rv9xIW83dIFufmAMVUXAe8Zj75CE5o/0qI0POtGfBo=;
        b=Vdfh2lh3ibtuuukIzmV3Npp1dniUfZbppU+9YH/b3xZdG1yIy6aR2ki7Nfx3nVM5C0
         5QTJI5GfKmzNV+fEwZbUBLhfXfced5y5Bz2/keML/Z4D/PjHGcoJOnpePKp+NdnxSAB4
         zCOVdB9w8B7tQ2hzWwf4Nkqf3R24fmZPUFMP7Nw2jTee+xvB2ii8TL0CaRuoyq2KW70d
         EyFuBRTFKM0mRH+ERo1y4lrN3htk2u2Zze4Z8X8h5Z8Mhvc9HjM3W+8RJM1oZxeBu+6d
         Y0iWFDYeYz8nX1jqxa2xpGUvoPgeZAjhku3dp9qObxxgIi4Ytiu89tV58Vyk9pj5jtJ1
         O5aA==
X-Forwarded-Encrypted: i=1; AKwUvBzFMxzsf+QseTqDJBl4A92hgZQ3lPEdLmuDgRrL1cN12/oUGlTyH8P8AswdJSJ5pRD7ITtAeQ400R4=@vger.kernel.org
X-Gm-Message-State: AFuF++nsMcxqy9JeUcDZM+EaHW3KZ0+ddyspWvMRLgHaDcs/IFkxQvE0
	hWx/kYtMpT91vBkLFnm4fRxzr4Urk3r057aijGf5xZiWWsaJ0aEGA6pk
X-Gm-Gg: AYBFou33ObAu7o8JcnuzJWvSy9S2Untvjib1Gq6XTBL0KSqBFOcFIIjtu5PkQwZoYtG
	TA/JkJH8YO/lNOJ3AbLCRmsY8d+5t06owgn8j8tZ27q9zxDWpuqWizKGJ1X42ooT7rATdwgmkHn
	ad+efqemoRdwBoICpqkklya6+yDZtow+6PmzGtxNfmZD8htlw2QiJukmD+TpR+vs8cdufnIHHd5
	XR+o/sEqhCpvsXnJfF/D1qjfhjQTi+692KPbm+sYQARRHfnVf9LHaixwhBgChnN+rRjLir+IiCc
	RBJAJaTKsH95neAKTVbpvK2kAQ/xxD9MlZlFo8Duh7zCK2h6pIMZax1NVGi7+z7N4wGt3h7kRRh
	Njof2trii4c7bYOiujOoS/hpztSWOIGelsko5LrSjvUX9KU8OVQdPBKjSYqg1Hd1hQ2SowVZKsr
	PC1edyx9V/BP9gJY7gb9b5Bkkz6dLKiTae7YRnKwkHPTd+j6OI2RKpI0mFbtq3WKSoW5eOizNzh
	ht6Vm1LLKjr
X-Received: by 2002:a17:902:fc4b:b0:2db:257c:9fd5 with SMTP id d9443c01a7336-2dd6c70df7dmr77776255ad.16.1789399625921;
        Mon, 14 Sep 2026 08:27:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc56b1sm51774945ad.54.2026.09.14.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:27:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:27:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
Message-ID: <f9a4679b-52f3-45ea-b451-26c27dbebf1e@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>

On Mon, Sep 14, 2026 at 04:03:54PM +0800, Troy Mitchell wrote:
> Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
> of trivial-devices.yaml and into a dedicated binding. Describe their
> integrated fan control and preserve the optional interrupt used by the
> ALERT output. Permit use as thermal cooling devices via #cooling-cells.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter

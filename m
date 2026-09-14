Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12A14825B5
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399601; cv=none; b=iEy1LvNad0cMeutnTFUQs0O6e3fqLXPYpVfeO2tF5Q6g4GwDsrGGLLY1GKxORQ5jpfnd1JareWq5X2FP+fRfUJUIC7qi+h1NUbw/8TlhQM026FUcgZwJLfgG7N+7crWwzC0ojzQy0jq8ILquIBZJjt1+QJcVvS2jXaWxfzete9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399601; c=relaxed/simple;
	bh=A+WJXH8LEWEmVEvHuluPt5ZSvK79HhNgL+/k4aL7GRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGseHAx0U4OhQgoyISzhkDcI5fSVraSRlY4UXk/MAAOPd0geqZE6FqdVod+CFurFVhdQ6xifRJZeIfsk1J2JwrAwpavd6QJPzGymCXfLpvh0wELuWrcCOxyg5VAngwPiXJ+Z8/QwlYdSL7ozU98hNze9vu5ZETtlvYA6dWbcBhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5rh4SYV; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5rh4SYV"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so30379545ad.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399599; x=1790004399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=D5rh4SYVfQYCkRVFKzGdB1L9V1OLhlOhCKclHkp+fpx02F4njrQeeIvyX4IjvkCoeN
         49UqSrnQcp10IlD0Xs4cpRY32d+DNCyFuq3RxJtRPQP5MY6wEZBAvX3hovhbeve12R7v
         yHHPP4vATJstE3HPnmqdMD/Df0viOU2smgRrg2FX5vjTT4B3RZIoyS4Y4m/2wtPgnNqv
         N+bJCFePE20bR6N2mPA5+hVEUi1AIFuTvS4g9sPD+tr7nsIKE1VUlz6MzXEILC7vrKgE
         iLhfMRVKMeoiAgUXinhCIck8ovROQigpouBcTItAOSRivEo99eVxvhBsC0v0wYbNk44g
         UOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399599; x=1790004399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=io9BSDrfF4iDUo3/O6NOs5duAb/cn2hNePt/O+pbKcXIB37knXeoPeo1MlRR4/pA9U
         2D/ItqinVQPVqXd4UhO5BHF3gBj9B2lq586CEdt1reizU521eezRFEupQ2VJsVphJA+q
         hwmEFSh7sD58u35M35Vz/+BpnZXq9RiYPLIf6lgzfBexM0SVpy1GXiXTU2jbZhPNRKop
         2v+VNLgfe1J4iTVx24Zx3UjMFRUcdk9lFfGQYam/wbbxRrjrZe8VOOHHCG7WDbFEOg+V
         Hl7ZJ3MOzdzMpLzGRpeQrb+F/iyu+BV+Zb5nwgPVeq5sd7bB9gqE0OFWks4o3VIn5Gqe
         WN8w==
X-Forwarded-Encrypted: i=1; AKwUvBwL1Jea7Pd2Dfzn8Z1Tc/02LNcPO0PUPeyBCRWnZcRwrIsKH/GoC3mnz1jrcwSDGdT+4mF43XgrR6s=@vger.kernel.org
X-Gm-Message-State: AFuF++l86GuLWOdwHb0fXt89gvtf5eRlwa5kvAhCIdHPfPJuS4738J3W
	iExScTAlkjJ9Gj99uH3lb4/ddUcTbjxijb19FpIF9fladCg/ZdYs5JBn
X-Gm-Gg: AYBFou2CP7hP7w+QA7RMaCPrnKsHQGK/GeAbZxTsR0NMs7V2vPx2HDgR7YhnIlZ0aZz
	TG6lbCng496DnM4u/EOl7Ga1kxBtvo9AWNXu67iMhGVF1cNjTHc8DJHfxNONeEBDR7zr20y6Luz
	R8WAaRufvOB8xMf9vqXb3TEi8k4xsACM/nitvniP7ax2e6s2NsJaGAd+FCGfL+P8bYgxAqAHmTb
	kW567MjLmKHC/PZwUBl48pYLDRvb5l08Rch/6cqsItuMUnjoOSa4mjJ+TQrahvE9M/iujmUTYfW
	xZ/5tzo/ZXcFhsU6dw78CF/QagCpPS+0aDxKmIVVoFJpZK2/A2n0HCmoHogKLzFNqzycBWJJgYW
	b7boUc4fZH0pxEwyXxYRHXZJSZ1O9/rcab9NUHrwQyCxLVzwcOUDaLyyhaRtHEC2IsjzLFn+DWd
	pTSfVwOGs5Ty9wYHYofRTds09JmsleztQo71vZviwjWqStY5gb2uqlEx2A5I8M/vjcmJkzTIaqT
	da3ZhIv0HGb
X-Received: by 2002:a17:903:35c6:b0:2db:73fc:b57f with SMTP id d9443c01a7336-2dd6c6c0cc0mr59735695ad.10.1789399599255;
        Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfdc15esm51211505ad.66.2026.09.14.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:26:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:26:36 -0700
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
Subject: Re: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <35ea8534-5446-40fc-b1a7-72a115bc40b6@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>

On Mon, Sep 14, 2026 at 04:03:53PM +0800, Troy Mitchell wrote:
> Add the vendor prefix for Sensylink Microelectronics.
> 
> Link: https://en.sensylink.com/
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter

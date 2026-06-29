Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41304395D8E
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766227; cv=none; b=lLimI0VXGy7iBkzbH7ShYRl5dyBcmAZyWDht3P5k7MZmzTMRG7q/G3LB5ih5nfG03XWplDm1NDfLD18BzWwsz/MSx4xlflBdbGNUoScWVYHYhOpN8fAOWkpV/EUBU57Q+D3TlFZbGwEccI3T2C2Fj0L4sZTyCLTvb7qe7Jd7mkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766227; c=relaxed/simple;
	bh=8fYnHWOjIGDoEVW4QUcUqte5TlJTJSzKFqD+rg6fWjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAv4Et0/ptDVy0JH6TRhCXAsBn9gz/1U2BkNhZsaKX2PZhssMHeLlxtXygAISfPtX6qFloXSXLcPK+xW2S6eDWokBqa6KKillV94uzIEiiq7izHGGbVPEiODYlgacfnveCzFQxS+Lj6M85vH2vfsANCUeUoIM/lNXDEng/hnJRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkkAA582; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkkAA582"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30c965eab27so7266361eec.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 13:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766225; x=1783371025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1XNSxJ4D6J3s4BjsJOYsu9zhwn3BzANnpB/97fW3CM=;
        b=QkkAA582JQh/rWEAe4hHNa+XGYD+5hRbUqcjYKmwhRLSdunt/znGiIrqCPX93YStR3
         s2lE4ZiQJK6KQRVt2WCpwGLxA2FKXjv2jxqMlVis7bGoLLIas0LvhqSN7UmECP6DGPwz
         dfjla/VDCZegdvnVxHDEvVP+iuaQLcUGQJaruIpHzHa9EIXsRKMBno1DkgCUZ2VONl1f
         RjFgQ357fHgCgVqcNAIOs6vExT9UZqknYBIznq2/7Bau4TyQVSyY9n9aXfU6JxMsiqdM
         h2KDA2Q4FMciRT27zMXVE1IuYGfH2IXs618SEuQyy+sbCjyKacJALRU7NUQqIjLutTB5
         W+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766225; x=1783371025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m1XNSxJ4D6J3s4BjsJOYsu9zhwn3BzANnpB/97fW3CM=;
        b=NaWiaJANvj/IW2GdpdER1pdohy0rochzQUdUNuGvKqaWK/Ql5RE5dEkoTd2Qc8WKYr
         ZujLO1xEe9rHh+shYGQDZxMBreu4rVbaLm11aVC+Ce1fDOWH2e4crSdkFVSkpvys0Q1n
         6HZneCrYR3cHrg+c/RVRptLMBblUluaUCOwxTf0+Lqguaohqnhx8mc8YVYO8ZtxZlZv0
         5zV4dfj9oaA5r5OuD+TG+IdYrMVEC29DDLi3+GOF0Rq9X/0VPO7mox5cYgQwQXOy4ULy
         JLvEelnrVG+z/5ClfL1V3x8T+iCCGiu/6Nwm8nNoV0pluBkJtBT2Mx5A0AD39juPpLD0
         jbEQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7ZizGJU2iy/w/01ZInjDbcNvCYJbo3JdyORihSfqYjnW5HuAauPWvoMA/lyUQofA0BqZ7t+GyR+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz75R17+5GiCo8RWQ/u0NnBNxcwQam11zRBKIG9ejpx3R7/5lCC
	ZhMY/fU1oRM7jJE5Da0PPyD9drOIg6zN4ZIdLmf1QJ7p6WmTnO5q7aN8
X-Gm-Gg: AfdE7cmlHTQCkNFRzNR09wEQxZlZxyI/zoz+ziZJ3dG3CCBms6Di5xjKfjbuzlQjOaX
	m6UyINPxC3if7x9Pr7kl1jhBf53FnMO/lUDxJvY3KDn8CZZd0nxIYzazaWgujiSuKNufWsFJwRq
	v8xBfXRcKtdM8/4/jIkmvfnDvfEh9UrqlAkj2++StkhCo2g+iqStbjTWsggnW1Pd3N/sasnBStC
	d2VfGbhKfspn1hCIGNPNLptPsW8uJZzvYQR21l5fuH0oFunQ0YHofBAsLF+d3ft4GrDsyBRp7ZD
	PGNosnd+bCWKHkyQq9nE+XnQy+Bxzr83/cStyA28qmtq+sTrZ2GggOfK+WebeXHH0w4IHHTQ6UA
	1rTfk6sbBN3M6kU/6y4ncMaLmIh7QnclS53Yg0PsOa71m9ME4b8d33gTNxSmJpPdWpt5K9ge2MH
	QDilpRsJWqS11eORH02uEUd+XbzA==
X-Received: by 2002:a05:7300:2150:b0:30c:57ff:454e with SMTP id 5a478bee46e88-30ee126ec69mr669952eec.18.1782766225159;
        Mon, 29 Jun 2026 13:50:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm768589eec.27.2026.06.29.13.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:50:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:50:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 5/9] doc: Add ROHM BD12780 and BD12780A
Message-ID: <dcacd00f-a976-4699-b8a3-28c775baed8d@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <5ff4a4a7a939cd642522fde407b5c9fa123a7089.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ff4a4a7a939cd642522fde407b5c9fa123a7089.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:24:38AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Add the ROHM BD12780 and the BD12780A to the list of the ICs supported by
> the adm1275 driver.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Applied.

Thanks,
Guenter

Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3918C38F928
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 20:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765873; cv=none; b=dYSSKUbACOJj0whSlXsWqvVIGTo0zGNrIFr8FlBPAlmrcW44Kk4mZ4MBD/UJ299qF5iTdwellobpsNflRk8pVJJ8+2m7cMLXxlyBMoAbYrS2IS/V8e1DQlMvvWZzuxNJqHWuoNWaL2bnpqaqYHOLemCQi1ThZ7tLdNhn1sietJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765873; c=relaxed/simple;
	bh=qLswO6PbGdjO+PSXY5dBfemfJFcC+c3Wq5lpcW7TGZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeZSMGm9NHcIah2AODpVoOX2JY2ojb9fx695gosrxtwCRP7LfoApWsKFXf6udKlNplnUoUrLHRnYGV9+wkwM+7MB4u6iwx/BEbpBmCxELAyXDrHGefHyqrCraMvxvC9wxo003cPaAjbwVQZR6LAuAmBNIBDVWOMjjxjkZ4lTbXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTAA9/eA; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTAA9/eA"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13981833e13so4621893c88.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 13:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782765871; x=1783370671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6f4NvAzvRx5tjxcWHn6nP6qFeKXFgm3axRSQP1raDs=;
        b=jTAA9/eAO9DN5etagyY0FRqDsfKUTLM2LJOKWiyv/JVn/OrFHuDOV1R9E9rJO+bGvQ
         Nq2kRc7x9l/zJXYaHfgKPNiEWI1jT7qwqfYUvsis7X0d1AjUUgSPVETctjaSDEU9AImd
         7KdqZX045YNV+Td52OWi2n1P+SsygatmqyIsdF52YxoV3u7DF2kK1NG07I5tV6x4D1gC
         RZp6UcDPFhhERK8VmQQlaoh9aI5/cdeJN/wNzRxmUafBbJ+BVvXH51dBsLE/m4psUTD8
         MpVPiWciuVW2c4C0pq+v7l+uF17C0FoaUYrjkEKLfVyGPilV70wKRN7Sig+lkLiTDSqs
         dzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782765871; x=1783370671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j6f4NvAzvRx5tjxcWHn6nP6qFeKXFgm3axRSQP1raDs=;
        b=g6xUnegehV12lOIbjGfFsrXNTVmTfgQCB6rO8GGr0wxGZ20iDzgEbbmfIrl/q3sJXC
         xM4iRuN0u/0vbZQ9iuUGlNVABRm2K3DMIKUW3ExYeOsvxPf0PL2N+8c6VebGAnjXwjdJ
         VvNZRluIJM4aRfO6Iqcn9WByewaw4Tofc22o1+oyGeCdjxCFs+HUzNBqpnnZmVFGK3BE
         9PxKcOdEU9zJ+Y5rCv8Gumd1R6Fw8TyiN9tzfm400qxCgG1G6ViWwkMkdHusLUuA//te
         5HmVPCL47zqZQ4ZBbTaHTpdKIZHdWRn6t/Xwmxf1+rqcexnbM5wHLF4zjrjtkObRjt8E
         PfQw==
X-Forwarded-Encrypted: i=1; AFNElJ9MSglNQsg4c5kAiTQw4fqiCRKICNabrdgJzCem/NplsRrkBGHlAWju12LkW3xvkkE3ZPge4MGDPp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyBSrfCDPyM/GGi9glu4q4K1GAn/jgwcAHOKr31/oDFC+1xaZg
	l/rh+6+x53ZbV8QAw4o8mDEnQVkYQgMykBbr7H+Pe7fva0N+vXROdmao
X-Gm-Gg: AfdE7clkaod8oqeMd1n2lXo6qn9ejnIUKZHh5jTR9x0GzxjTbORXSSAIab+Byo3x2tr
	Er9XteGST0iPOcrDgLBqAzGeRDt1vpJE4OdlRFFaCYFsINqewzUMSvQmcsVsFtGr32Gb96N0ti8
	Dy8UcooHlmAJ0GljzxdxYRPX+QEeR9skQl1wpaJ5RSIpunjOO08vB+asgac/2yEWSI+B/aYOe0i
	fCfhaSntfWmzdWG2/4NTv8LuGaFOfz65VTBHFPahN6UARfXQ+MKtzec8qy+giY/EH8oqINpimd7
	O7IaUwwU8/z5aHhk2Vmda8WaB14S1HRsMeZ2TlxBnBOwBj85ET2+naMj1NXtSsHuEVo+jA4r2Bv
	7YC2H1Vs12moBw/Z17tTUWK0PbKjB/e06kgZA02Pgo/cFCKIhdINfUxoXaS5c49cvYAK8Ble/06
	2axuhxXd4lK9+8Y54G53xln06kBce1qFbVZiPU
X-Received: by 2002:a05:7022:4595:b0:137:546:9e9d with SMTP id a92af1059eb24-13b2a1c0848mr507073c88.23.1782765871336;
        Mon, 29 Jun 2026 13:44:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab30047sm844786c88.8.2026.06.29.13.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:44:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:44:30 -0700
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
Subject: Re: [PATCH v2 1/9] dt-bindings: adm1275: ROHM BD12780 hot-swap
 controller
Message-ID: <5ff613e7-5176-4e1b-9400-1db4fd93add0@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <2b7d5bb8cba773d0bba1d6779f0e6daa6a40eed4.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b7d5bb8cba773d0bba1d6779f0e6daa6a40eed4.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:21:42AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Support ROHM BD12780 and BD12780A hot-swap controllers, which are largely
> compatible with the Analog Devices adm1278. Main difference between
> the BD12780 and the BD12780A is, that the BD12780 has one I2C address
> configuration pin more (ADDR3) than the BD12780A.
> 
> Introduce own compatibles for both variants but require the BD12780A to
> always have the BD12780 as a fall-back.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

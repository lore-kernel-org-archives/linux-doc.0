Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF962C11C6
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 21:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782768016; cv=none; b=FCPzfIPPPrdFEFXaeL2HlwgKUPdlqVDntjDAB39YSAe6IImYmV5n+gbda3OawCpi5wMBMPHoF5JpeZhuLY1SLGTY6d+1kmN6s9+Ofpntfr7u0tDJP1bCujjoQzgWOyrEjwD0cVUh4bp26pKhTjT12kZQ/e/k+hVCppjL+rB3d0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782768016; c=relaxed/simple;
	bh=a0NbH/lMavkQTt9B4gU2I29i7gNbfnGqYmp4Ii51Ld0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKkaqFOiq/oOqWMzP9Kl2Z6ZN6DMskvI+1h6wjUHHj1wymatgy3HDHPLUpWt9Mxr4XYUUeseiIiQBkZbsuKuo7bkoedn/jxf4IQfGgjnmDsiHmQpJMNTHgotmeq0ckEu5whEInEBOUa/YdS3uck6X6tpOZUxrmyCl0f0UHTwShI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8x+GOGx; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8x+GOGx"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-139f71a5201so1181049c88.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 14:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782768014; x=1783372814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKCpvBw+RV7e30hMtzWTVtYjU2K+4YOPvBtrFzvbfCA=;
        b=J8x+GOGxRyAgZrqelJINipEnuF5jajswEelqkDAyKzSOwcTDhy+XAlQXGlanZDERN+
         mn2QCgiHT1CybiJfu/eYwA3EXyiOXWhOAVmI8BmsCJ/r09JKcfk1wpEk0t1fUdxDgE8c
         h0u65PabuEo7rO2EOmLzU3HFDCmTxGlzuoc9fo/3LdmyUMOIpMIcZZRI+wBPmeg7G8BD
         aXIasqq5/emzndQUTdke0LUPymb1igAesckUk9XNJ1AwON6SbazvyS9/OR8eXnZV2A/+
         T/n5u0LysdLsDSgAB/rxsywl4t8xAaF6VZefjyWQydTL/Jg72ZBrdxyfNHLdO3FX9si0
         /+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782768014; x=1783372814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WKCpvBw+RV7e30hMtzWTVtYjU2K+4YOPvBtrFzvbfCA=;
        b=dCYjkMseTygP7aS4ZLgGCCafkmVDHR6eUTVTu+v5qtEM49bMsTERZ4pkJybdRkKV1z
         4wLF1Oj2M+HMgRDSCLbbT0T9i2dMwP2AMEcIK6TzdYeU9Av3G0nYD39VaHJ45J3Aw8md
         8pLFfUIexoDyFIHtf2mXABpmuRMQIZezGZ2YBRu7J3ouV/A9X1CVHZ0M11YjooSIlXfK
         q3+p1DNIN4oQcLgK3baZwxuDGU8lDKGfktZstDjkJo9Klz8/8SoNQFAB4VgfMxyWuxXZ
         JTvTYIT901dxD071XmZV+Cqtwa7egLhXM3Y/XWyI2YsOEr2W9k0poeuD60pXCVT/uZon
         Duiw==
X-Forwarded-Encrypted: i=1; AFNElJ94BOLDTeA+rMW2CW9Bo9ZdeG3anc68xZbHMQDwnMePR0xRhP39II1EiaTzo87R9cSKuVx8d3Z0bnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp0k6+o/pNG7r8PNg/yoe0ugJx4y/il/GZYk/NOlccVcmcO/sO
	0FgkEu8n7UDfidZsFX3cLKpMlgblSUSJSuHukruU1cr8W4DAg6G1JPfv
X-Gm-Gg: AfdE7cm8yCXdnd/jaTXEpjeVOn4GgVQzCbZBo7QhAENlJcc6VY8I71RVUnn44H1DzIv
	WIkvNm13DXzf+EsEurViqA8KU+hPn4nJHfNwPU+/+frXj0ixtziMPfK6bd0CvZhWLrclJ30bCp3
	4drc80nRKesSRuFibNvnLDPoX07uYRPZpg/fgKCG6C0aE1B8iTEOsqjLVNkJhXli6VozwHY0M/s
	Sj1s2un509oEqZPYxYZNJ6XeWxUUj98VoFj823l3mlBjIHba63qD5e3kzaKSCiQo4uNaOu+855W
	/ZiAjlqeWMbq22ZaMn/yHdm1T3TfQpHG2KX9sGM7Kzt88yXgpIRyJlLcV6k/QaDmyf9iSo1x1N+
	lf3La3VkUeWhOyxs3c+qaBU3+OQn48pjBAEg9jxCyteMA17owwDT44X3p4meLezk6dCR09qEw+m
	h25jrh8EXT8V01UNV8N2lmanfd3w==
X-Received: by 2002:a05:7022:698d:b0:139:85c2:d7aa with SMTP id a92af1059eb24-13b2a52c9cfmr547955c88.18.1782768013877;
        Mon, 29 Jun 2026 14:20:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2aba8008sm855319c88.11.2026.06.29.14.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 14:20:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 14:20:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Conor Dooley <conor@kernel.org>
Cc: linux-hwmon@vger.kernel.org, Lars Randers <lranders@mail.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v4] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Message-ID: <5f9ff7eb-44d1-4f74-8368-b08298f67fc4@roeck-us.net>
References: <20260629-wriggle-headscarf-c85a4070dddb@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-wriggle-headscarf-c85a4070dddb@spud>

On Mon, Jun 29, 2026 at 10:30:59AM +0100, Conor Dooley wrote:
> From: Lars Randers <lranders@mail.dk>
> 
> Add a driver for the temperature and voltage sensors on PolarFire SoC.
> The temperature reports how hot the die is, and the voltages are the
> SoC's 1.05, 1.8 and 2.5 volt rails respectively.
> 
> The hardware supports alarms in theory, but there is an erratum that
> prevents clearing them once triggered, so no support is added for them.
> 
> The hardware measures voltage with 16 bits, of which 1 is a sign bit and
> the remainder holds the voltage as a fixed point integer value. It's
> improbable that the hardware will work if the voltages are negative, so
> the driver ignores the sign bits.
> 
> There's no dt support etc here because this is the child of a simple-mfd
> syscon.
> 
> Signed-off-by: Lars Randers <lranders@mail.dk>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

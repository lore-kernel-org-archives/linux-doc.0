Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8E432BCF
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911956; cv=none; b=m1fwlgBDzDiSlnWb5+k8qRhZtrzEiUwz3JgcvPxVuOauomMwkvoeHu430tcF1lHx45sGXn5oDQ3dxm/EjaJXHSx6Acq26ABNfxBIrsK/N6me9SD+bZvc1IDPqzuPp1ONBX4EYYqnE+Ul6MJlaZpGiGzl0pOg7tu/oSY4By2qqas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911956; c=relaxed/simple;
	bh=35IoV7vE+4nDzg2Nx0XPGWsaiXWtKAGksvCqm71nvxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6qoG0RYBEEjRdaaFhC/ZS0l1wAPdYpJe3BUJy2QFPElhBfvqcL+9RkJ1Y2QWQrLx+zD0ke2kxrkwTGpWKKE9hx5A4kYsNVy591se9+9Pwxy9sRtsYvwOyGsqJ1Bh4RvieAoTYK3AaUsRzvQQlI+z2NDcSenrAgknyf1kvD1P38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/gdoPS3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/gdoPS3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cedda2ce6fso6079465ad.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784911954; x=1785516754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5MlGsOLs4wGnW8TY+feH+zpq8ktGG8kIj4IWl7CUYw=;
        b=U/gdoPS3uztUWKsaZx23qILBRq2O/LI+FlvRWmILTwaNDP3fQrlqYDM3MJ+I97xU/5
         ijbpyIQ6fDZjjoDbB0EdgroMLJKnFIRMIEArl7awKjxhzNwNxHB2hsOFm80JibZvnNjU
         Pg6mjuVhpD85iu8yLpV0yZjefhbujiFhtAV+R2y0QcFDh9wSK4Nc0uDJWXdTnO0tSWGN
         8aje6YJUWRErKXHMCW7UAwLct1b3o8gCpalhXjUpql8WVbm64tclROucY0iife/haRjM
         em66kTwvADPiUYATOoyw1Wg26VEgrZ7gBDxfLvsw24vH5VL8cE3Nkez+JeWVu1jmTv2u
         Ea2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911954; x=1785516754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5MlGsOLs4wGnW8TY+feH+zpq8ktGG8kIj4IWl7CUYw=;
        b=C6buseqFtGxQ/t83rua+wMV1o82iN8f+j9benPhyUv7FxkdYNzlpNqmNLfBK669Y1F
         3XAl4VdbnDtceLt3sgrMKnEgamdfd4LYgWU56JvjHsXxdCNZKSc4lnTZt2OSVzAR6mch
         vgxH3XhmmpRxQ7BYAUgf+jB5vFr+ihifzfErK7JYOO84egeCyoBDxAeq0pVp7RiBom4W
         mf56kd4fdcjIwQVaayZsZ9G69fYFwOHZcbK2roYLk38v7dUL0x6gOzaTaWfx3bnwHY3R
         GQYho2/9d0byYxJ5HvfBNa8IcgvNaMs9fIdwXP+fONO0E1yFjbih13cyqh6vGujVd+hP
         U9hQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4+GXQMLPZtqTYp/9DKoVTyo2ztXFzpoXout/G+oailXCYVRoaSAQs+o6F5nK8xDGoNW9RWTwMHE8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybwp9FMl+/VGXaIWxKL38FZxHQZHWRbQalU2bu/ZAxBDmZ5MHX
	QBfQ5+b+xFG/7682wQnzmOFjeauzAiKxVQvE2OSY6U49cKASPzbSWdxc
X-Gm-Gg: AR+sD134c2Bm1iHoi44swwpYNCVGu0cp++NWhxGdUT0mwkr64xj5cvc6elviSdidfUR
	WGlgDZe/C8aJWcQDbn2YE9djwH8b+9wjciLsbdcMxX7f2sBHZIWA7WAkzofTMUxU/eZtDuhW558
	GLcRcidcNMmc135CRkW2VGBFKcLQk5tWmuYwmaIiuOliVN+hE327R5cWCLoIn5x0fJD2ei2YfW1
	fhYL1QdcjE7M0TO13McRHeUlePt5B3+piMS3atIrH7nBCNex8jw3ynU2W1hrCoPEJP5t9tzYmOY
	w+/qGEb7M/s7ToolgfxftL0rj0uFWua/e4k5SdKql5exg+MYcY1jrclYvtD1GqCwAGrWJ94zXuQ
	IVHo7WYnMoWk0t46awjLfyZLgj89YTigLmbeBUTqd2zLXSBJwFpVq9pDCpu5EiIs+D8goKMhfJk
	R0PupSrhQXcY+qfgCfO3YeODvjLA==
X-Received: by 2002:a17:903:2385:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2cfa6b6fda8mr95199715ad.16.1784911954005;
        Fri, 24 Jul 2026 09:52:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf9c8b7a7esm44701815ad.3.2026.07.24.09.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:52:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 Jul 2026 09:52:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
Message-ID: <987fa310-d032-49e7-bdee-5b85b0d66dcd@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:39PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
> target with mandatory PEC. Add a hwmon driver reporting the firmware
> aggregated maximum die temperature as temp1_input, with the firmware
> version and boot status under debugfs.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

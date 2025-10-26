Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004521DF75C
	for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 16:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761496674; cv=none; b=pfGg/SLA8At7un28mkit2tEEUzRd3pSX4CGEgSWbM5vMEk4popPe1MXo3mJ/eM9mG+wB+cxSXJejLA9E6/737uQoD+BHjxX8asKoitU1vU+LYitZLkS2QwZcNwlIGWUauGFAMlCR3NFE+j1kI0A1aKpuM2uuviRf0uPj65/xsTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761496674; c=relaxed/simple;
	bh=Jn7ngMBWIUhPYmq3HsmvV2FyXT31L+46gLuKAYt+qfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgSBUggMMLvdtNL+CkvEwr43GDzXUXhv3pgmzQ4fi6l1vUjcZkPRmWRAcG7ZAVm4ViESHZKHOIE6opuTAcjNpQgxb1TufjCDF2RBWoQT0V7rmgx10kguzH5wF41uL8Spq2scoODJSLfNwd0RCTlVFTDoaSdkoavh9IXpJmSx8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyz/GNnF; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyz/GNnF"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b4aed12cea3so391018666b.1
        for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 09:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761496671; x=1762101471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7XxEe6D+FFfQqIEEbE4sKMO9/YUuuqd9OGSQoRJvBWE=;
        b=hyz/GNnF0aCD6+j5VZLNSwr5I/e++NY0+Qh5HeeM5t4U+kBRfipDmegwE3UmvV79J+
         uWdgZyQFWUyItGQ8QqCKzD4v0q1EzanyXytVCg6VXiWyCbMtHklksjRaw/HdFOJw/G9f
         vVvx8V3aqjmD/D9YCaEXisbwmGR4lduR9yc4bmLmLczjkzId1SvSm8FzdrfixZCZB74T
         9ICmqOpivpdMPx/idChI57Yvdh9IF0d0fyyrtaGDUidJklATrmWwnmIpqm5F2SwQHg9v
         5zTtMlJqo9EshP3asxflvPpjI0lkoYpJKg3Ktn7W8PlwB/ylXFagSHUo0SbOo2htYwnB
         TzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761496671; x=1762101471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XxEe6D+FFfQqIEEbE4sKMO9/YUuuqd9OGSQoRJvBWE=;
        b=swDwRTsqjVigbhKnHkd+EzzCNXd9ljE6jx7tgbIH14kbozfs+CwtYQxwuJPnS3gmTy
         oni3e9p/xbTtmBFzzJvILZRJujRMD8VgY2Eq0ZmQ2yUE7M7VGMEsXLnQ+U2dxVsv33ZC
         wlwmzedWMZYc6TvKX7QKCiujfc/Nd3rHQG8ymjxbxW1c35oJJGQwApE8FrZwyaDyQ0JW
         4Nd9DPnhd6IFPceDk896OvBTfMAuyRiz0SazIANiH81aL1qnFNvvIvdOLQH67IsnxUxJ
         bwo9VfzjN9gvUutGLFq+wLwdre9TTyIG4Z6Tb+iL+oBl4sP10KV9skhGpVenvCbJFdda
         51Qw==
X-Forwarded-Encrypted: i=1; AJvYcCW+5khGJsNg5NaIC5IZ+lrs9VNAuoVXKFdd/klPNRiFGK6e+nEWiDONpuvxGmzBmR8+f4OrPlhhd/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGTE1vRtlWKWRPEMTT4FzEpO2+HLxrxq15wfqdqIsC+E2HXgbb
	7ya7cDM6Vqqv86Km7arOZ6c6UawECUzA8VgIk9NKpCu7VKhVBoihIOks
X-Gm-Gg: ASbGncs+rolS4TlOvkoB4WwvT9RpMjEb9o90IkZcGR9ZtdXMkgsE6qpb0bexYa4LU0A
	y1rog0QPIEjSPjuDzXo5G49h21F2wQ+MxhLlmUWE3/q/neGwOQS4RXJexqHcFI4D0yiYtMpEM3S
	VF+UDXD3eFJU5AAmp+rD6Lryp/dyDux+43cB9viKKBSklY/VEW+PTA3QrlgHUz6MFiO8fp2MsPC
	PHaN2sZaX8s1g1iN8ZyCFjGkPHwAXSge6SqmQsFIOp6fTNmA6g9+uw1vGSkO2tyXGAwZOEBQLsW
	o3Xl5pH3SEmv4LJ/11NCaIWLBdWLSfMZIrnEOTqEt4NzHQS7l1HlJiPinTb6FNESZIWMGUHGuGx
	gXVMExUrJnXLQy1sZLkpuDF6/RPK6yLKalOMqHbbtp8k3ejIUIUyeyYrH/fr6eIsFPuv/JQXRS/
	K2ZtqUpQ==
X-Google-Smtp-Source: AGHT+IEoV/OCny3StslIHhY+HhBv9Tk1poW78TbiqX3CKYhoXcDxOU8er8pKIVdW2dVWKc/kXQmqZA==
X-Received: by 2002:a17:907:968d:b0:b6d:6c8f:6af6 with SMTP id a640c23a62f3a-b6d6c8f6f3fmr960640266b.16.1761496671063;
        Sun, 26 Oct 2025 09:37:51 -0700 (PDT)
Received: from home0.fritz.box ([2001:a61:123e:4501:d88:2861:1686:c41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85445e81sm498050366b.64.2025.10.26.09.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 09:37:49 -0700 (PDT)
Date: Sun, 26 Oct 2025 17:37:47 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: iio: adc: Add adi,ad4062
Message-ID: <wla7ldkhm3mca6eadlx2cith43pcvdg4tertmrhjufqa7wqnc7@fcfacbnzcjvo>
References: <20251013-staging-ad4062-v1-0-0f8ce7fef50c@analog.com>
 <20251013-staging-ad4062-v1-1-0f8ce7fef50c@analog.com>
 <20251018161143.0a89495b@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018161143.0a89495b@jic23-huawei>

On Sat, Oct 18, 2025 at 04:11:43PM +0100, Jonathan Cameron wrote:
> On Mon, 13 Oct 2025 09:27:59 +0200
> Jorge Marques <jorge.marques@analog.com> wrote:
> 
> > Add dt-bindings for AD4062 family, devices AD4060/AD4062, low-power with
> > monitor capabilities SAR ADCs. Each variant of the family differs in
> > granuality.
> 
> Resolution?  I'm not sure what granularity means for an ADC.
'Resolution' is the correct term here, thanks.
> 
> > The device contains two outputs (gp0, gp1). The outputs can
> > be configured for range of options, such as threshold and data ready.
> > The device uses a 2-wire I3C interface.
> > 
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> Otherwise nice simple binding. Nothing to add to Conor's review.

Best Regards,
Jorge

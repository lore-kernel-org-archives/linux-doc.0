Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6246D33D511
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767962566; cv=none; b=QnFtXBGLokORDwr7GUz/42gEPyPwJzd7QgahrxI43nxVi3fX20VqWf0ftq6i3KaBzH7WGEwi8pzr/QV1G4r1IFP1Nm4UaQEtUXR7Nx1XVlPzxJvIiw1/1CNkVz9moPj3GaH9SrL3HUW/P+1Odv5y5xJNes12Dnh9goKq0hRJBa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767962566; c=relaxed/simple;
	bh=hZSgLFwm7iWTSCEMlGpJ5EydF3r4Fok2bDOlepHZ5R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUnwskXkvbcMBtL1CtbDKwMX0xzxuDw/aQefyV32ZovnLOMUQlobh97RtfKIfFdT5F2ul/y1k8NCzwit4JOTCleukhbogsJBd8FVP0VMXb1O5mIs2oxnU/gVkwZD++iK8C+puObsT9GjG7zojxiVUg9ZNZZ10lp13qJRolHfqsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a76hO02m; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a76hO02m"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5635f6cb32fso489441e0c.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 04:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767962564; x=1768567364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3BFu0vu0/p35NSB3GE3KTVvm2WkoyhJD5SPOf/SaeU=;
        b=a76hO02m2zyU0nn+/0WvJf0A//MgSy24ecK2vgzKwg/rNsXQzflpXEZMsk+Le0Xts+
         4ei0oXO/MFJG2OzzezPNGz/6+omGmJQ2YYhtRhDOPHpL2csC31xZWDHWf9ClJv117tSE
         XZ/n9btjige4iDkfmSLcQWYNOR2pBEarYILOOyzRAZhFNRpteCOF52Ti4mpPP4c4z3RF
         uCTqru6EWkTuyr5qLp6vxVk7ucxz/qhwujUp2g+xIm5AnIBSDsTArBZmn3XcW5kuSEZE
         /kzYpREkr+bCZ5OKKIkmaMfWTmhv2xI7lzeHl7+1FWmyR3NokEaw8NlnNzM0Ritt4hu0
         SviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767962564; x=1768567364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3BFu0vu0/p35NSB3GE3KTVvm2WkoyhJD5SPOf/SaeU=;
        b=FxElfUsl1szzGq0RwFTbdvb3nW24ldmFWUuB8/1BPBxy3hrSp1oQrZj09WFwZeWx5e
         wep1/L9VB9waa4Oqqxbg8wyk3rBG2nGBcKHZtK8uXl3tStuo+mFjiDecGvUBBcGqJtiv
         LyGPsTbs5f9zwK3NLBSMkc/amf8ajHLf4agBe5YIaHUWx24WPwQF2FH6PkKjF5PGCZla
         ZEY8ZsgCq8zcuWZUXQOxoaGHjz7AsAKsterUbu5UXOvcG2vTtox41HSb1u4xp88V/rdC
         ZnT252b5B/zhT5DiYWgIbVb1lgRzLa8Urc7OnHzn8394suwzTXdV1YucYk0Z/6939UNs
         aqRw==
X-Forwarded-Encrypted: i=1; AJvYcCW1nYWErTuq0WTFJDY6WHaH73UBfbQEOpEct4CEu049wXPpRKbUWEAJqcDSI1nN6iCRtZpUjWc/3YE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuP7CXMr1HbTnWFYrdoJVy2e6CwTM5Pd0l+Ds0EBaDi6NR767U
	RfIMRzTTRgnSyaxc6hytKtk4W2EVKGPwp1LcY1QytmUletzmKj80SEKW
X-Gm-Gg: AY/fxX53kZ+pzIszQIVP6Olnmh9gXh38HbYmV9bha92A5+UfuKTnfmWvYAT0xUm/ig7
	axhQQlFNqljqPHaSCy56cDNDIqRJ9MQxVVJRERRokHVc8QjhnR2/T8Y7iizYh590Z4MPAqwuOx8
	kgp5f0anrjrw6cbDXLXdnQsWYb7nzIWESOw77vSl7MstycKLQzibnrwjWLkXESQqM7KzhBKtn/X
	jl21XtfQpW0OgsOV6dNF6F/+9tuzrlpiQ1s2zo9pSUSW9YuyHlg0NtoRQ8+0h9O3Tz4wVAMXllX
	d5d63fWtFCQ1oHVIGj3tVb8kXSP3mvLLtA3ZfQDFaHz6MlqEqJvZnc62MeMmmutKyk6fxRnmvD9
	qVtJXKnED9uy5+x+IZ2dx3LHwzmn+7fD6cbbEAXSUHR2RbEo3+BshUCfWEiJn+NIIenuVN+uMRc
	if5WpluREPJAcuUfsOW/o=
X-Google-Smtp-Source: AGHT+IEFwkm7ZUOXNxPhCYhh26Dl1VpJaAPxMviOBBIXzleuSNVqOAzV6ATr3WWYBcee7gd8DzSzGw==
X-Received: by 2002:a05:6102:50ac:b0:5ee:a184:35c8 with SMTP id ada2fe7eead31-5eea1843ad8mr1950120137.30.1767962562741;
        Fri, 09 Jan 2026 04:42:42 -0800 (PST)
Received: from localhost ([2804:30c:2766:a500:b70:8c42:f792:bef6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124c452asm8625479241.13.2026.01.09.04.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:42:41 -0800 (PST)
Date: Fri, 9 Jan 2026 09:44:28 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Alexandru Ardelean <alexandru.ardelean@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, jan.sun97@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: dac: Add max22007
Message-ID: <aWD4LA7Y1fl3yvh-@debian-BULLSEYE-live-builder-AMD64>
References: <20260108-max22007-dev-v2-0-2506c738784f@analog.com>
 <20260108-max22007-dev-v2-1-2506c738784f@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-max22007-dev-v2-1-2506c738784f@analog.com>

Hi Janani,

One extra comment in addition to Krzysztof's.

On 01/08, Janani Sunil wrote:
> Devicetree bindings for MAX22007 4-channel 12-bit DAC that drives a
> voltage or current output on each channel
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
...
> +
> +patternProperties:
> +  "^channel@[0-3]$":
> +    $ref: /schemas/iio/dac/dac.yaml#
> +    type: object
> +    description:
> +      Represents the external channels which are connected to the DAC.
> +
> +    properties:
> +      reg:
> +        description: Channel number
> +        items:
> +          minimum: 0
> +          maximum: 3
> +
> +      adi,ch-func:
> +        description:
> +          Channel output type. Use CH_FUNC_VOLTAGE_OUTPUT for voltage
> +          output or CH_FUNC_CURRENT_OUTPUT for current output.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [1, 2]
adi,ad74413r.yaml has many possibilities for the channel output type.
max22007 is only either voltage or current.
Can't we do this with output-range-microamp and output-range-microvolt from dac.yaml?
Figure out the channel type from the output-range- property?

> +
> +    required:
> +      - reg
> +      - adi,ch-func
> +
> +    unevaluatedProperties: false

With best regards,
Marcelo

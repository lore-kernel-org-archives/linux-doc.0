Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D983DDDDE
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448103; cv=none; b=SuvK1rRisDUVC9TIEIwXKR7os/JAjgG5+ozXYIkrWxz7phHXXNX1iyMvyY5tJYqbmO/7xE7ISiH9BBAY0vROsxeqHmZd+n73nXUkdN3Qi655+oAZ5jrFVbRlK8fnAUF0VHxAPHrJAG4nUjJp8HLfV2pVSVmNlxZ/D9RhZXO14MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448103; c=relaxed/simple;
	bh=ndRGJhASfV/L3jTg7ReiuFcxx6gZ79D9Btx0MKrmdc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcFTKgDyfQmOphUKII7W73xCFuge+3xk8MR/uz58IKkh0RJtlYm0Vw6gNfEjSxdCODC0INjZuksAvie9ndp9TAZnZywBH0rnDXXpsdYbsmZBPRLqt5aBVVHbTri+pSrBN9/8LqKVeaE0erXva4yPRH1y1o2m3SS7UaJdGC6/Wvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl56ZxuE; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl56ZxuE"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c1092cc08cso304790eec.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774448100; x=1775052900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p/oHQQntdvJrq3bem71WhkRlm6GlLE1KCuSOKiT0mY=;
        b=Nl56ZxuE/vBA7ncQKV5IpGpVBuLR54k8YT3LyWdnZzhpCnK0GZhTyafsPGXpwuXSt7
         LDpHwwx2c2LV0BKJfwSMIe/mrrVJSCd2Ff67J57vIcBTtwNKEKbyHbN9Yf2PnuZZYnsO
         M+B+tqN8C/96P22VVCXNp2xOHJyXjpkbKWVJGUpnnBNaPAd9tgPoSKPuYDa4AdI9uYM2
         kwlgNdwO7sdVlxGWRKl18kT05x9emL5T1lRR8jZFoHoH8cHlNpHPiQU6QL+bfwKHX2sr
         vV0oX8t+TqFgyl/YPeK1t7505+knVhOIOKOYzuzypn/iow8msIKwJg+tK+6/ECPpW6h/
         jZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448100; x=1775052900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/p/oHQQntdvJrq3bem71WhkRlm6GlLE1KCuSOKiT0mY=;
        b=aT0czzD9JpzAYMI3k762rxcu8vZj0lfd9Z9KP/V7KzYBM555CfXDEVJGe8lbw8SizS
         8VtksnNDJ0nWMnZ28n6LHLynddhF3LdSDDAbTLvDMpx2VnQZv6cc5sdIISlwOyMiltV0
         F7oCMX3i7ozoO/zACoi4AgFh5qXI9wf2vCo5S9McrC7EREcLc4NZ98JUv2DreYuvmmGX
         GWPlKV9IkW1u2I4i+mNbRnZI5uJXElz9I29PRPUXPCTFR725zR1OVO25PIABWOnmOIB8
         UDbAshQqRDluXTb5SgPQFXpQpcUciG5gaWyEt59DBid7DNPmUgE8o0e0Qt5g6LMau4Vt
         MBHA==
X-Forwarded-Encrypted: i=1; AJvYcCXmqQ30YIVbpBrGUkiyRaUgXj8v0sp5cI7F6Jg/fSOTmgmcoryjvjaIjF+osDZsR8/rlYw6cAsPbQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXXtQGlUcOLbV0QYOMwxGKiuvpLSdyESKrseY0MnDAvop3ngC+
	iH56bKMn/K/8iQ/8YKUOALCd72b+RXQNAjK08plg8aCKtJkFZF2pEiMw
X-Gm-Gg: ATEYQzwOjcG5Q2ljKXe+bq2iLH3pDV/0u2Uj3SyugDybfT4hh/DqB0qcIjklosPge61
	CY+yRc+rW8aiCe3rQBYOpsHFd4D+FgZ2bqfgluaqU8kEBbPr8sdj2OuB+3df0X7ZVnu9BVLVwTn
	hmfwVGH6rhSTfYIBzMWDk4g8P+RajkSWjCRWFKigitOB0N6P+7NBmtnaT/JCOpLMnMZ1Z20kYxy
	0EHT42sI66zlNGcC5rE27/A/+R0rKqJ/Qye1atq9BvAemWAMl8gkogODwSV3YzHBSfru1Ktkl9A
	0DCTuvzlpsgSfHUhWc6vI7FlYOJfehorUG3Wo213PkBgBScdbGeQnmBQ5pKOItCZ8hQIL6RiXVA
	Chau+HEcWYNhEKfyVfT9jjdfex4YHDw4yhXt+XK72/NvE9G2iB42QUxtT/tLxY0v2mhoPKVktpl
	i6Y/vLX6wIGwCi96JuFdxXON4LwEV9JMFDH65yxgHF4BmSQgw=
X-Received: by 2002:a05:7300:ac90:b0:2c1:778:d897 with SMTP id 5a478bee46e88-2c15d43ba66mr1797423eec.21.1774448099826;
        Wed, 25 Mar 2026 07:14:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c757sm18183035eec.18.2026.03.25.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:14:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Mar 2026 07:14:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	Linda Xin <linda.xin.jg@renesas.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
Message-ID: <7d2c44e8-b831-4f83-9158-c157ae7bde9e@roeck-us.net>
References: <20260325090208.857-1-dawei.liu.jy@renesas.com>
 <20260325090208.857-2-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325090208.857-2-dawei.liu.jy@renesas.com>

On Wed, Mar 25, 2026 at 05:02:07PM +0800, Dawei Liu wrote:
> RAA228942 and RAA228943 are Renesas digital dual-output
> 16-phase (X+Y <= 16) PWM controllers with 2-rail non-TC
> driver configuration. At the PMBus hwmon interface level,
> they are compatible with existing 2-rail non-TC controllers
> and use renesas,raa228244 as fallback compatible
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

> ---
>  .../bindings/hwmon/pmbus/isil,isl68137.yaml   | 93 ++++++++++---------
>  1 file changed, 50 insertions(+), 43 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> index ae23a0537..8216cdf75 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> @@ -16,49 +16,56 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - isil,isl68137
> -      - renesas,isl68220
> -      - renesas,isl68221
> -      - renesas,isl68222
> -      - renesas,isl68223
> -      - renesas,isl68224
> -      - renesas,isl68225
> -      - renesas,isl68226
> -      - renesas,isl68227
> -      - renesas,isl68229
> -      - renesas,isl68233
> -      - renesas,isl68239
> -      - renesas,isl69222
> -      - renesas,isl69223
> -      - renesas,isl69224
> -      - renesas,isl69225
> -      - renesas,isl69227
> -      - renesas,isl69228
> -      - renesas,isl69234
> -      - renesas,isl69236
> -      - renesas,isl69239
> -      - renesas,isl69242
> -      - renesas,isl69243
> -      - renesas,isl69247
> -      - renesas,isl69248
> -      - renesas,isl69254
> -      - renesas,isl69255
> -      - renesas,isl69256
> -      - renesas,isl69259
> -      - isil,isl69260
> -      - renesas,isl69268
> -      - isil,isl69269
> -      - renesas,isl69298
> -      - renesas,raa228000
> -      - renesas,raa228004
> -      - renesas,raa228006
> -      - renesas,raa228228
> -      - renesas,raa228244
> -      - renesas,raa228246
> -      - renesas,raa229001
> -      - renesas,raa229004
> -      - renesas,raa229621
> +    oneOf:
> +      - enum:
> +          - isil,isl68137
> +          - renesas,isl68220
> +          - renesas,isl68221
> +          - renesas,isl68222
> +          - renesas,isl68223
> +          - renesas,isl68224
> +          - renesas,isl68225
> +          - renesas,isl68226
> +          - renesas,isl68227
> +          - renesas,isl68229
> +          - renesas,isl68233
> +          - renesas,isl68239
> +          - renesas,isl69222
> +          - renesas,isl69223
> +          - renesas,isl69224
> +          - renesas,isl69225
> +          - renesas,isl69227
> +          - renesas,isl69228
> +          - renesas,isl69234
> +          - renesas,isl69236
> +          - renesas,isl69239
> +          - renesas,isl69242
> +          - renesas,isl69243
> +          - renesas,isl69247
> +          - renesas,isl69248
> +          - renesas,isl69254
> +          - renesas,isl69255
> +          - renesas,isl69256
> +          - renesas,isl69259
> +          - isil,isl69260
> +          - renesas,isl69268
> +          - isil,isl69269
> +          - renesas,isl69298
> +          - renesas,raa228000
> +          - renesas,raa228004
> +          - renesas,raa228006
> +          - renesas,raa228228
> +          - renesas,raa228244
> +          - renesas,raa228246
> +          - renesas,raa229001
> +          - renesas,raa229004
> +          - renesas,raa229621
> +
> +      - items:
> +          - enum:
> +              - renesas,raa228942
> +              - renesas,raa228943
> +          - const: renesas,raa228244
>  
>    reg:
>      maxItems: 1

Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623C4366DA6
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773820951; cv=none; b=AdMrsQKTNQ06qydJZhN/2RzzRlSzmXLYXxfrsQrXb0uTpEBfgFla/WeV+dk6pCPeWzU27/K6aTLlHk85ByDM7nicnMg+IwZJindJTtmZ2jMxyxS1qEKeXsmLc3XFGxIY56zyvfHGGDmBX7ihQMag9qU+cxOKizvI+hnKmOQ+204=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773820951; c=relaxed/simple;
	bh=k5+ioRK98mlQzq477qk0bPbZYNlkLektvdoNCHlx7qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHdGd+Zb3fo4v3csf8dwtFzqh0S80jx4qwgqmHONIK5LeknY8uVR/gk5LQ1rYblAF2ytIHSRVUHJB3gT2N96KvT6qzHyi5/zXn8JLh1sCj0RJKxqfmZOmY/tgymSFpHYFzPoK2OnT6gE7pFxLD6ULZkat4xfKWmV6PpIe9bt/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVSHrYnd; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVSHrYnd"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c73d251b93bso351255a12.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 01:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773820949; x=1774425749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nYpecVbBpabNdzvAamyH5iv0Fckev7pwJobjRD7/cs8=;
        b=iVSHrYnddtjWC4bfJA+FNDb4Tlxl5jY5tVxNaArO391uCDPwq9WN6owWOnLPNq6OGY
         JayOPRJdXzTsPINO8wdQNrg/KX/J7kpWJzafKO2W1DSLIptKJmZodHAMtTBOE29PV0XN
         CbeoIB7cD/wR0+fQ53cKZSNbXFh8uAVSYznyuSLc1N7xKW2R1ltjHQ/LtEZR57hOJWwL
         LQ+W7WV6sCvYzUq05SupkOMH9O6zZes/BxqUs9CY3p2jMvtjgLFjmTcXHySuT7gBIgme
         cNKfYQuAh8sZ69Nwm/e2FqYUE6AzsRb24ahUIXahZmKlXNJ5l/AhEiSTyuk+fBN/TQQN
         yTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773820949; x=1774425749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYpecVbBpabNdzvAamyH5iv0Fckev7pwJobjRD7/cs8=;
        b=U0tmfyJaCGcI8vdrd2ODEGIt2jKjyiAQBHdTit+TMqjnqjQ9VDswIexVgJYRvjeUgX
         xLwlZ5fd9WnjsMExRmZUEyIc022JQvrn0pUXqedRauTiyGFPOxhsGAnhuySD4RA35yJj
         dmsuKzvDRk0qkb4v0EzcU51xFWDHGPUqZHOPl+yt0D5JETRRXZaO9nJW45Q9gEGLz1JT
         i7QlVpM47z5zwwEPxGcZPzt9TDlBOB+KLwUEMa6YZAYMjPD8kXngbn9T+4jkx2ES3jGC
         wBBgZebkpkedYsX/5G0/l4/CFeao29jt1YyYdUzeL4W2lQ/yVD18Slg6oycydXzutdiZ
         /e6g==
X-Forwarded-Encrypted: i=1; AJvYcCU1JINBBNk/jNSAvhzaGRQOh05sJuG2ICHSDTUoekOxaeaDoKfdcwKDhsWuUQG1yRzUBErPWIeuj+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPshS+XtYA7iFs4u4GH7dHggC0A2dSMX4kRnpPcM2J4EyZRyzD
	zmqSz8sDnnS4JDGJua2R7K/U0Lws/LbXGiwgKckAdgsJlSz0TFfB7Eaj
X-Gm-Gg: ATEYQzz89H6vxg1U5HepoNdXxvcOggMmoXRThzdn1sNIkjSsfJwGHxdyvhGAUx30YsQ
	huTi9IfYJj4zeiWVIxzDbxlLK4/orvLoDbpkIVHVnSCXL4X067K7rfacNIVg5omgPKZ98Fm8yPA
	cvOc6ORMq3JCK0+TGmkG5fAat7q4O8qPUUlsnIPD4B40gVDtKRyWOOMbh3ReBBK5QXim0gYTGKg
	4JAQy8SFWkWFu1o6ptkEvZtKY6IdgCharjPkabl24248Ot5vedh6zZRBDRc26+rOsK7Fcqkg8Wv
	R5T+DSQr+9iT+BSmPK5yK7fIotGplsP5LV0He0MWSs+TSXyBWLb50UhExHzcfRmNY1veUby9pA1
	gtmw4N37kt5AG8iHycT5Ovnyb2Ds2isIy6hn9yO/GHQAPmrowpzi9xFTSn/AvgwAb+1vjLq3Q4z
	yDtXJVlT6cBfn8KL1UzHmLyB4WEIugg5CMWpii5TpPrgzGxHudekE8XjrdY3HbVL5G+y3vAzWd
X-Received: by 2002:a05:6a21:1391:b0:395:acfc:b66b with SMTP id adf61e73a8af0-39b977dc39bmr2479592637.8.1773820948667;
        Wed, 18 Mar 2026 01:02:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e5694acsm1717392a12.24.2026.03.18.01.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:02:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <69ee987f-37d6-424f-bcf0-9a13c176b08b@roeck-us.net>
Date: Wed, 18 Mar 2026 01:02:27 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add mps mpm369x driver bindings
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>, corbet@lwn.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: wyx137120466@gmail.com, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260318070115.1609-1-Yuxi.Wang@monolithicpower.com>
 <0111019cffc080de-4f80c201-5cfb-4bcc-ab98-8c8747aa4639-000000@us-west-1.amazonses.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <0111019cffc080de-4f80c201-5cfb-4bcc-ab98-8c8747aa4639-000000@us-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/26 00:02, Yuxi Wang wrote:
> Add a device tree bindings for mpm369x device family,
> which includes mpm3695-20 and mpm3690S-15.
> 
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> ---
>   Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index a482aeadcd44..7b9d9bc89d07 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -342,6 +342,10 @@ properties:
>               # Monolithic Power Systems Inc. digital step-down converter mp9945
>             - mps,mp9945
>               # Temperature sensor with integrated fan control
> +          - mps,mpm3695-20
> +            # Monolithic Power Systems Inc. multi-phase controller mpm3695-20
> +          - mps,mpm3690S-15
> +            # Monolithic Power Systems Inc. multi-phase controller mpm3690S-15

Each of the series supports several power levels,
indicated by the -xx extension.

For the most part, the chip variants are register compatible, with few exceptions.
Specifying the extension in the devicetree compatible string therefore does
no make sense unless really needed.

Guenter

>             - national,lm63
>               # Temperature sensor with integrated fan control
>             - national,lm64


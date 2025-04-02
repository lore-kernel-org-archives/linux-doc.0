Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950C92376F9
	for <linux-doc@vger.kernel.org>; Wed,  2 Apr 2025 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604789; cv=none; b=cixtTZPf8v17dUTVd3FlyTksrc+D1IJrD6s6VYRFLCAcellS2Pok65Yn0m5wcSrgrwLhwenP6xDPTeClEHPL9U7aOz/OncCNcQaQ3eibetzLWlqD4fgHkO8sBgTR7Ja/GjNmVA96Yt2EvyjPPYshsbLoU8Z6I7aroc4Khg778SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604789; c=relaxed/simple;
	bh=an2KdMGCipmCOgRCCaG66zbXLj51zno2bj0u66QMdPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAb+ngMSCtvilLRlnIceo8gzpvKSgXIkEx0fRaQc9N0RPNHl8sFg2rA9GnLexapQBW3DdORrLAbbw5v+81LKpj/H2sj8IAaHrP7GQ1WYz1xbFjPMZIQ+2sJkoULHIJBrCUXZF0hPxRBbyl5YvIGDMJyQoC7B3dASUTF6T4sMX2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fCoMjRgY; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fCoMjRgY"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-60219a77334so3223957eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Apr 2025 07:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743604786; x=1744209586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EoS+69ci33BaJ93JVqHmaX+qxJHmm+lVs7qiZGT250=;
        b=fCoMjRgYk2uNA9KHFLyPTi6OSp4vYKm4dvcMSE7TXSLtuGlLQ2KMRo7FJqeWUd0n7S
         9uMjb1YtaHDnZTOX3c8r0jkpedkuqMuWSF/68XaHLXZpKiUyQqFIEx7elBVGbs10O/Dj
         Lkbs2BDXte9EXQOsxrCh9K75Sl55/Y9KQpLKYJi4lq6Xl/OElebsVtKgICzz/17TICQl
         sKAiQtHcnY8P7nEQG1FbwJxGuIv5J0B0t+2fIeH0KWiG7AsuEqbW+QxTmT/gYRnHDFsy
         xrTEcOwI0SlsGHLMy1gl5m9A1Tx6NSr179JIdZSnSVaPKPO1DApryVnvdiJwsmReKgtx
         X5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604786; x=1744209586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EoS+69ci33BaJ93JVqHmaX+qxJHmm+lVs7qiZGT250=;
        b=MI0yDmfZJHs0kgKZokUl+pODNlCP2Y+5uIpOs8GYzB0fwWXR9dpJIO/kITDwE5owqI
         KLQ3t9eCPKHCCKJJ6sSjb5bHLUqgZNFFIAXtMSUcrX4e4JXgyL7teZ30UEto3CshQzB9
         g96d8yemXY+wwH3aHhkl92KezoYGJnuuTdgBwOvBnEbZlQkF0DmlfNDEYV9x04xf0mUv
         oINfVAPfr4q2U0GJHw/GZ4/FpnYTlpNPKHvM74wBCcJQ4V+A02lwemz4GWEsij6S7UOY
         w6lCE0Baxu+qPgY0tIgNxAs+lmuA77A+7n7Ft1abSyXXjGItlvCegtQZLZdjZgkQBukI
         LyLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP0FR+v7Zf+vfx0K1+3DiY2z/y/pxZ8BkkFPWt/jNlZkJmwQwjCzd3hZWrXha2D7kTEvHA9jpXhTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9oXMVl9+6bcXh/HnFE2glI35BDHzEZiVW3Mkm74eg8QhiSIr+
	xWeIbCZVNeFrYfb1BRFutdDbXjjgpqf5w0v0k3hy8X1CubPOEWAE3qk6D5+Abzk=
X-Gm-Gg: ASbGncubp43UA48gFvB4BGo1agy25/Wl4eoKIGehtbB7p8kMrkmbavTOxgvoU6cJU+F
	UkD07rsa7IqRw2sH/HQ7NtFebhVr1kxIRKLMwkizb6YIkEDWPzCRHefoOUCLtzJ9DAp3MQteP2G
	vilyDx3e92PP2uO4QiaQj9wlvG6Q4LtaNWubxkoAj81q9Nnp/e3vLbQkoKM4zZzfBR8HESmUkrU
	/PlZ3XXYiFpex8jbw7fKUNXizU7b3AU0p+s6QbXCbDbXv5xcQWUkXE+w9JBBgIsZt+qZdip8O+L
	sKuIKQONj2jeEBbMu/pXAO8kRsY9/NakMUvuZiwVsgfMmL2PbEkRLaCrFXLJXGC5zTn1znnf4Hi
	hmAYJgQ==
X-Google-Smtp-Source: AGHT+IE+TQS+xNEhqvoy35C1XBepZThD9x3tvi2hTYmUV7BCj5f7Twy+Lui8PnuV3OkYvF71xpDaDg==
X-Received: by 2002:a05:6871:8786:b0:29e:2d18:2718 with SMTP id 586e51a60fabf-2cbcf738fa0mr10881898fac.28.1743604786400;
        Wed, 02 Apr 2025 07:39:46 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a91391esm2771044fac.46.2025.04.02.07.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 07:39:44 -0700 (PDT)
Message-ID: <847307bf-c612-475e-84bd-31efcbd7239f@baylibre.com>
Date: Wed, 2 Apr 2025 09:39:43 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: iio: adc: ad7380: add AD7389-4
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
 <20250401-iio-ad7380-add-ad7389-4-v1-1-23d2568aa24f@baylibre.com>
 <20250402-winged-ambitious-sparrow-c988c6@krzk-bin>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250402-winged-ambitious-sparrow-c988c6@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/2/25 3:25 AM, Krzysztof Kozlowski wrote:
> On Tue, Apr 01, 2025 at 05:50:08PM -0500, David Lechner wrote:
>> Add compatible and quirks for AD7389-4. This is essentially the same as
>> AD7380-4 but instead of having no internal reference, it has no external
>> reference voltage supply.
> 
> So neither refio nor refin, but your schema says:
> 
>> +    then:
>> +      properties:
>> +        refio-supply: false
> 
> So what about refin, which is also external reference?

This is already handled by the existing if statement:

  - if:
      properties:
        compatible:
          enum:
            - adi,ad7380-4
            - adi,adaq4370-4
            - adi,adaq4380-4
            - adi,adaq4381-4
    then:
      properties:
        refio-supply: false
      required:
        - refin-supply
    else:
      properties:
        refin-supply: false


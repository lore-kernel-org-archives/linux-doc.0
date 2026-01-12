Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2828469E
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 10:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212251; cv=none; b=iYuAQEq7q+AQUTHDwRzKoahZ5eiZSm670Xz/sdaAF/Nx8NpvDuo1hakvCRuzOqknKipDAiLLd4fpFPtXua3gekL5g0/iTn6/De4T2AXbqqahrwsOKKDhbPDFlBCW6cDjmTzbPvTlmllYs45oE67EfQMhj2k43xiJUyNulbZmnQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212251; c=relaxed/simple;
	bh=oqOGXbeDIQlNePE/yiwJ+NT0kXzbdHkFX5Jkw1SZilw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDxswzCQhmcoQWD7rZBGU82cww21n/ml21aS//tYpriNoWSIxnkn8Nyo9GZ+jrpkqoXZxrWbGbqeapnnzq1xjneIGYoybr2Y+4qfrnByQVjKDaUmjXG7ejXnR2PSUhxKlBwqxGEgoszcMaxIuT2pH8itLquLcHKbXtfCwoOZ1lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1MAv9wr; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1MAv9wr"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4eda6c385c0so48416211cf.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 02:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768212248; x=1768817048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U5hiBX/EJmbP0rFvOH8HeLIh3uhucig2oXB0fSc8NSg=;
        b=N1MAv9wr2GKPAbiYalM/ultWNNHRnItPp5uXKvCM9nkvAzQFdm99JkOJgc33VhPz1V
         ibfz65ZZuDO5Q64juKemL+byXnTxxmBaqh6NpWTEYeutm99LwhE4t0L1IjKPo5I6DNZK
         yDsg1alLvf+bcgzaDP/IQuQr7ZCKORbG5WY4yyRoeleYUijEUSRze7dROPJ5+GCepI+/
         WR7ZTH+369iyj2ABChPQoETsUQKDQ19Pl26Vn9SG+8ekLchPlJgNlZg/96+zI1T36I6z
         xwlh2MOOSc1e5gQ3sdFPCNY2S+Jse9CZh246KE0DfIHACdcwtxABH6KKStG+hBW8Ssdq
         uLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212248; x=1768817048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5hiBX/EJmbP0rFvOH8HeLIh3uhucig2oXB0fSc8NSg=;
        b=jxjxyRGscm4D7QcCCl2ymppLlek1E8ROf5wMw8Ev5tcEyK1AJDXFJSVZfNrUmYsu//
         F/Pedy+sXf4+VfMHe7EdWgSxoq7O+H2DSM0igZIVLX1JmOdJ5OY/73GxS//14G5ZzNap
         9QVBxBjyxXH9HmUCfFLYv0Y+91JSE6JO1aXR0y1ve8U5eAFf+pipbcnX8ndrG7z8Kg4V
         lphNpH17yogUL9XOMmURCED28U6Ncv0KvQyDOdTzWZeSDHDqV3KAamDiparKpQLJaRAv
         0IbSgcLVjOl1GXcXAD7hg9WR32ScqF9gYrxBMnHZuCRH7aqn6bXZ1KNHgavsUSfiS/CK
         hpQw==
X-Forwarded-Encrypted: i=1; AJvYcCX96PSkVBocGUQENwh/igAJYZcNc1I9UK+CJRhFm5Fh2f+tv41ViBFiLLcIXF080vgugRY+71VGQww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWObM6SLewYM1W5/oNvu63oaV0OEgqy7o8iE0ruoukiQqPWax/
	D7GdkwYicd/Ruer8X1tFEraMIsAH8lejlY9hzjBf/uk8QuBeRnWNIyju
X-Gm-Gg: AY/fxX6PNA/DB1YuJ0m6G46Kpx5d395XpapnizEcOnzd3fBCXKXxkXzvgoCBe0r6IgF
	MHQYMDRJfQpsodrQg+NfMX6HQeGleHooHsR+oBr67ynbi1LwVgj/h45Gk1aXUGBsV5jbN6KTiww
	0jfXvhHi+wiRmrTTSmBoUF6Upr2PZ9X0sXUEBogtgTNeTUYrclzG5Zj1r07c+AlJrHyIVLG+OHv
	lXhXvYnDkos7D0oXgcl4gDpV+7dbgeDBYN2QhhWoj2H0G1Z9hCwBPAjU6Ss2ELlvxDMVw1yRRLL
	25XEaFIpjWJPutlOuiXyKLTGQqzM00LFTplgDRRNNxYpqTsr3HqMIkq7kvVzdH/U3eFL0tXHjwS
	TgTSlsvdnvCvNz05pCbHNfRgXxxm56x2vV6/NTl7jCmGp27R/QRC8z3ze37PdTa2snv+DsCSFxK
	Se2hCQwebMIsAYQ1jVJhCCLXJn4a/PeALPXkFhxpbF9NerxU2A1TPjQKfa+eeoETiQivNEdQQws
	jfp
X-Google-Smtp-Source: AGHT+IGB5QJeG8ku54AAK1oYhHpchOQzwcbI7Eq/Mwh+iHar9n885imDNGmU7We54FoKXl1Rmirvqg==
X-Received: by 2002:a05:622a:114f:b0:4f1:cab1:9d3c with SMTP id d75a77b69052e-4ffb4a264c8mr245124531cf.57.1768212248319;
        Mon, 12 Jan 2026 02:04:08 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e627absm119541151cf.30.2026.01.12.02.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:04:07 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 12 Jan 2026 10:04:02 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 1/6] dt-bindings: iio: frequency: add adf41513
Message-ID: <7ck6vexpeak47kob7niupkdg3nbyvp4nab7rqmz6niq4frf64y@tjnph6hno32z>
References: <20260108-adf41513-iio-driver-v3-0-23d1371aef48@analog.com>
 <20260108-adf41513-iio-driver-v3-1-23d1371aef48@analog.com>
 <20260109-translucent-violet-smilodon-ed1917@quoll>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-translucent-violet-smilodon-ed1917@quoll>

On 26/01/09 09:13AM, Krzysztof Kozlowski wrote:
> On Thu, Jan 08, 2026 at 12:14:50PM +0000, Rodrigo Alencar wrote:
> > +examples:
> > +  - |
> > +    spi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        pll@0 {
> > +            compatible = "adi,adf41513";
> > +            reg = <0>;
> > +            spi-max-frequency = <10000000>;
> > +            clocks = <&ref_clk>;
> > +            avdd1-supply = <&vdd_3v3>;
> > +            avdd2-supply = <&vdd_3v3>;
> > +            avdd3-supply = <&vdd_3v3>;
> > +            avdd4-supply = <&vdd_3v3>;
> > +            avdd5-supply = <&vdd_3v3>;
> > +            vp-supply = <&vdd_3v3>;
> > +
> > +            adi,power-up-frequency-mhz = <12000>;
> > +            adi,charge-pump-current-microamp = <2400>;
> > +            adi,phase-detector-polarity-positive-enable;
> > +        };
> > +    };
> 
> One example - more complete, so the next one - is enough. They do not
> differ.
>

Not sure I undestood this message:
- are those examples 'enough' as the second one is 'more complete'?
- do I need to change the second example to be 'more complete',
  because 'they do not differ'?
- do I need to create 'one example' 'more complete', apart from the existing ones?
 
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    spi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        pll@0 {
> > +            compatible = "adi,adf41513";
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

kind regards,

Rodrigo Alencar

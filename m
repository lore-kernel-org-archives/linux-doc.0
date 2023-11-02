Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09CF17740
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b="jNDzF46E"
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383EAD7
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 06:40:16 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507a98517f3so1121200e87.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Nov 2023 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1698932414; x=1699537214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OOtIHpfkZWFD4FolYlTiy9O+zTRxXyJ2ArxW0gbuYoU=;
        b=jNDzF46EHaPtjM7F+yC3uf0jsYEwkVGjhFOdq1CI61LoQiwz6YaAB9n3ZBOFF4AqM/
         iXYclFMIixO/vq296kmOz4LEF3dH4Jc77fNb933X/83tvPy8ATSZrV8+jn4ztdJSM51r
         qnxwVgX5NA1IMiiKR6ILwHWY9OjiLkc7mIINDD6UMz6oV7eKerYHCixOLeRFbzZGMV0x
         wRrsVYi2VSQBAoF6feBbXxGqu6PYCqO8JxF/f1pRNjzTJQNPA0FXToRMwWBC0p0O9efS
         EdjzDM1Q7Vs6FBxXzDOFkvMLBinMTfWADvN5PZEcPY4BOepFmF6i2j2KJVab9jBdLrzi
         Vxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698932414; x=1699537214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOtIHpfkZWFD4FolYlTiy9O+zTRxXyJ2ArxW0gbuYoU=;
        b=llPJO7fQGwsblbSr8ZB2uY41kzqBjZ8sM7GTVQAbw2aXPLk2s1bY0gIuC6UMw71n46
         xFXZBj7Z2lQSx2QlXAGrRBwO5jauQY+2TTTag7/Y5cJFJ/Ig2Gbdp9OOcEV4F/9WuG6A
         xqCkP3Q2RsPCOdc1qDmjvoSuUVJe87Ut4hl7uJmgwVU6A6JacMKxEjvKGTT7SvF/QSbo
         +9m4vzEU5rOzSJVQGbVd1ZZKAIeEs3LqmLxZ7AJTH0me8rcGu6fakfdUn6YfYEe41dxi
         byOke2+3K4MhKDJfm4AmXt5DwxMq0GdcPrF+DxJF8Cqfiiwam1o0dRh+T9kIVBa9nlFi
         Zkzg==
X-Gm-Message-State: AOJu0YxGRXSqPRF4kXBoPYPiYnOWucIickfr6X52heLfqjvGfQdgDgxh
	hHtaL//03aJadwblfaCmnwMYGDkLYap3WIZ3Q+5dHg==
X-Google-Smtp-Source: AGHT+IH9Avz4EYkMCVl7IjoVxQZahZVqhEUFxHwUDK/D9DIgwUFD/AoZz+TDzj2dpvUUpDkrMWy0jQ==
X-Received: by 2002:a05:6512:118d:b0:503:3816:c42c with SMTP id g13-20020a056512118d00b005033816c42cmr16625497lfr.41.1698932414453;
        Thu, 02 Nov 2023 06:40:14 -0700 (PDT)
Received: from debian ([185.117.107.42])
        by smtp.gmail.com with ESMTPSA id s18-20020a056512203200b00502a7a7579bsm495204lfs.216.2023.11.02.06.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 06:40:13 -0700 (PDT)
Date: Thu, 2 Nov 2023 14:40:11 +0100
From: =?iso-8859-1?Q?Ram=F3n?= Nordin Rodriguez <ramon.nordin.rodriguez@ferroamp.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	corbet@lwn.net, steen.hegelund@microchip.com, rdunlap@infradead.org,
	horms@kernel.org, casper.casan@gmail.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, horatiu.vultur@microchip.com,
	Woojung.Huh@microchip.com, Nicolas.Ferre@microchip.com,
	UNGLinuxDriver@microchip.com, Thorsten.Kummermehr@microchip.com
Subject: Re: [PATCH net-next v2 8/9] microchip: lan865x: add driver support
 for Microchip's LAN865X MACPHY
Message-ID: <ZUOmu5M4_pyPnV8b@debian>
References: <20231023154649.45931-1-Parthiban.Veerasooran@microchip.com>
 <20231023154649.45931-9-Parthiban.Veerasooran@microchip.com>
 <ZUOUGf-PMGo8z1s-@debian>
 <f95b42ef-b7e0-44dc-b7c8-9353e9edc2df@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f95b42ef-b7e0-44dc-b7c8-9353e9edc2df@lunn.ch>

Hi Andrew

> > 		spi-max-frequency = <50000000>;
> 
> That is a pretty high frequency. It is actually running at that speed?

I have not verified that we're actually hitting 50M.

> 
> Have you tried lower speed?

Sorry for being too brief about the things I've tested. But yes, I've
tested running at 15MHz with the same or similar enough results that
I've not been able to discern any difference.
Meaningful to mention here as well would be that I've tested with and
without DMA as well.

> > With this setup I'm getting a maximum throughput of about 90kB/s.
> > If I increase the chunk size / oa-cps to 64 I get a might higher
> > throughput ~900kB/s, but after 0-2s I get dump below (or similar).
> 
> Is this tcp traffic? Lost packets will have a big impact. You might
> want to look at the link peer with tcpdump and look for retries. Also,
> look if there are frames with bad checksums.
> 

As you assume, this was with TCP. I'll do a run with tcpdump and see if
I can compile any intelligent statistics from that.

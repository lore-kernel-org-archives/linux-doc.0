Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754121;
	b=VgofA8QKzvYrlxzB3WAgoLjbtxFFet9T/qCOGV7uCysx2IKbTlBzxKiR66eyWbkwPg+B
	 ujZZx5yF1shWNoHGI7IAOlA9AMYT+JaxWnlc9SNV1SXtR+ByJ0tx646uYXqf3le+mRBfu
	 VbhunBDBu0D7UQ3to/pymX4fOyLsLHpMk2cPw2DiFpLLGQIM+7m3PK+zPtwVwmY6iWtm7
	 lL+W8LOAHebQNbwYLV2XxvwvXusf5VD4uoK4EEs4yrV3JaUjK/Yq4KSlDbuQsxsWfwZ0M
	 byKoZuPhxNnrCyXAfLS8UneoqzPwt35XurwLjf3XKpidt1ySrONU46vBB+RmeloNF8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jIxHZGuZV2ahnY6L2CqzTw2j0WYDDpMIbxX1aENaO+s=;
	b=HynpFtLy0JLWmHHJT+HMwxugAQCaDBrqwlNk93Ote8jwRIDct9oCfMUUXmFQOM3bDuEf
	 zcZ9671wDTegxnniycG2Z1/C0813v7VZD9qAuWifQOiFACd+2VVAQP03pvrtyxs3GXyJd
	 DhcvUEoI2JxSILZrK2BftrWXcqUltX02jOvXp8v36NlFCcP0m7jai000qEuVVnt20N13P
	 QwtNg9ZIGGlfOhWIEKncomJ4sqnJjNDsSqxC6bCuOibUqzytOvHkCjcr4MdawwrIdMAHG
	 vkGaL/A8xMUm1SiLqbSN71HFpJIOxB66EjPirT+oNE8zD0eCtgy20rHlzxhudq7deEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gB7ZU72T;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD88606A321
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 11:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD88606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gB7ZU72T
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so685946a91.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 04:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792754120; x=1793358920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIxHZGuZV2ahnY6L2CqzTw2j0WYDDpMIbxX1aENaO+s=;
        b=gB7ZU72TlDrjtJg2VoknUpiMrc5WLYdiqf4lkuMe3uifTtYoe7UpNL2lsmXJmD9kvH
         SsLAi0bz0acbuZguvc/MJxABOwXflROvoJ8fXKuCex/V5dfSWnupFH2RRwK3EOJ/0Bge
         6F4Y3MDGJP6oj474/IOPZ1XnA9Bd43ACAeZzQ9CAx/aKusmx4s3DpnEIg1st86GSMR6o
         S2TXN+ak0DiSPieJLTyV8uyQ3co2B/kCLvqlJA3wcwQFQFtCjjXuv6dX1SqYeofFleQD
         vgTpIYXMp/KtAvZtXa3YCiB2P4VG66t2hbESu+Ea3WYI63IPpSbD6lJiuDhV+6rcB48z
         AkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792754120; x=1793358920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIxHZGuZV2ahnY6L2CqzTw2j0WYDDpMIbxX1aENaO+s=;
        b=rM/5rFBqJZK8IdGI/MiRAimaODARuohYi3jAuObKJPn69pka12CgFUvasyw3UNI8iU
         XBr/vXb1bexL5+dT1NAQ1FglYftRAp7mWfVTlLBA1p9FoQeHxjuWgJHNtzkTPVS3I+lH
         jombRYZlLSCCEl+QZ6TXAbN2rxKfd3Z3/tCw/FLPkQsZxcv+BWloBC8b2ZS/wwuH2/X0
         lewu99u/czMBYGmwjCDxS99TF5wLBfnfCCXfUcpzViaztveixBFxBSYRcIUJRFvnE5rl
         tA2IvQJSkDLCb7eTspb+xKzZinO9wJ+8pa+JnurA1XBgJ3t/Wls8dOZe0qBEm8B2/aTj
         xg2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy9sF/0YENLeNYvkHwRNV2XT2nYLgIiKCDL09UfyU/zUAe6pTfuJm38ME9M0pYdQ3PROfWge+EMzKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP19Cp8jLmQPFYjVAaQ34NoZy7rue8HByVdNCTTyP8tojzGyJj
	re8ePa9SPWuCc6uIRY21T4byIU4IdH21uREh+y1gGMQp9/sM0G0PUpW0
X-Gm-Gg: AYBFou0M25ZHf+vxWrjzbVFnqB3vXB/xxQz1Lwgj3oZL00vhZNPD59BTO+cUIAGjoBr
	lwe67Ppcsfdg2YghDd55NrjweRp7go0vtss3LWw1FO+iX77nB6nhCnAQcZTfcEk18sU4ReZwZLe
	Zd4Ox9PAsxNIFy6PqWpWWvD/j7r7ng2uZ+8rf002WIa7tFC9NnJleteSTkwnKsQTNao9T6cmva0
	w4zocrbdVrEyMTQbNRfuMSrNC33S5HWmO9DwnADmN+O2AREZwU+HL2HukrZXOKPzibxTWeu+cBW
	ThLvB7NA0Y2LSaAWr+WyaCKTJwTpKZF4Q2sxPato60zlNg7QmFDNkjvlXqnRmaQ2hOyzyzPI44r
	dnDnXpM+eyf+oqC3IMZ9YuzSHcxkW4SS7wzR7xaeKU+oRQu+U9LZjI5iyosLLdd2thpgkreuzDI
	Xti7fdXk1e9YDPahAch0AWUJCwppLPjxzlaLBZggvUuqqIKeXB8lQAhp1nSpidWraASGHCe3IS7
	8+itYY06EDo5OdA2bhj1t5c78BBcW9iMrdgbiQR/QI0BAnOvo0ay88+XVepkhEn4Ff98B0yPZjL
	r95U1sqFJ29kICgVq2Jz3QqKn6xNI4ejcyG5YNSlMQgBWy3zVjc=
X-Received: by 2002:a17:90b:3f8d:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3adce7a5a5amr1475790a91.19.1792754120415;
        Fri, 23 Oct 2026 04:15:20 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2ae880fsm1037959a91.3.2026.10.23.04.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:15:19 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Fri, 23 Oct 2026 08:15:07 -0300
To: Conor Dooley <conor@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 03/10] dt-bindings: iio: frequency: add
 adi,ad9910-axi-backend
Message-ID: <hx6lt2u5j5yh3iez5zimolukip4a6ak36rdqridrvaz7bb25hw@6blwtzy2iuat>
References: <20261022-ad9910-backend-support-v2-0-0ff7f0bff326@analog.com>
 <20261022-ad9910-backend-support-v2-3-0ff7f0bff326@analog.com>
 <20261022-banish-scenic-030717ca503e@spud>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-banish-scenic-030717ca503e@spud>

On 22/10/26 19:38, Conor Dooley wrote:
> On Thu, Oct 22, 2026 at 12:19:01PM -0300, Rodrigo Alencar via B4 Relay wrote:
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add bindings for the AD9910 AXI backend IP core. The FPGA IP core
> > interfaces with the data and control pins of the AD9910 DDS, streaming
> > data from memory via DMA into the 18-bit parallel data port (F[1:0] and
> > D[15:0] pins), which is clocked by the PDCLK output of the device. It
> > also drives the PROFILE[2:0] pins and the DRCTL pin, which controls the
> > slope direction of the digital ramp generator (DRG). The DRCTL pin is
> > driven by a PWM generator, so the IP core is described both as an IIO
> > backend and as a PWM provider.

...

> > +  '#io-backend-cells':
> > +    const: 0
> > +
> > +  '#pwm-cells':
> > +    const: 3
> > +    description:
> > +      The first cell must be 0, as only the DRCTL PWM output is available.
> 
> I was about to ack this, but the wording here caught my eye. Are there
> other PWMs that are unavailable?

Not for this version of this core. Other signals to control the DDS could be
modeled as PWM, e.g. DRHOLD, PROFILE0, OSK... but that is not being considered
at this stage.

> 
> > +      The second cell is the PWM period in nanoseconds and the third cell
> > +      holds the PWM flags.

-- 
Kind regards,

Rodrigo Alencar

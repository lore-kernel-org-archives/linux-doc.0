Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FA32E888C
	for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2026 12:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777207689; cv=none; b=DXPkvOnG+sONk4q3RB2x2ooIcUmQmHbjW464Po8//0HwAOTs+pOCCpRrdxSUHT4Qko6jGzWb11ZA/ISWddn+kLCHTbn2shlW2E2BX6Dxq304zxFhOUrVDCoe98adqui3hz+imNHIo8FJUjj1btP7OM2RUjwnOAdBygJc/+k5L4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777207689; c=relaxed/simple;
	bh=/C1jSY0hNOX4U3GO4+9/Qy/3BO+jkxZrZ1AeBT7K+Lo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMmxSGldRi7PTft7Es0ihAhl71Lm5nNe6y3MyCrL/srPyFvO9B7/iHRdTRQhIc84HoXcpmg23a/VDy2iXNqxc+madSBojzj8G6gTRh9vtfeOFvrFnbOU5jh9drDZVWNLtJlKzlso9lE7GJ35vYRseDkVAqrhdXVDg5Qv5rU1yYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APmDflE1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APmDflE1"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so5702778f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2026 05:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777207686; x=1777812486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VdSlfN5TOas9ObtsBftpjoK8qDSsbhsD2j4mnZKffjw=;
        b=APmDflE1rTbEnnkoAupdrwLRCNVThkRqEmKQd1oLLRoNZUz0N9kQl40vM/bAd7yoto
         b20y7Ir//2zXgnA1K0tuLhNuypM/QnPfDvnxyos9R5g6V2s3DNurJrsXr+5GKYZPP2A3
         PDS7ZlOlx0/rADiT7KaG94ZW045eBHxYSMGKlvWz3sC44dwuo8KWdlGA9iYEvTzOaam1
         KmyaVhSBBtkIGwibu73lNuKGfBzBBPqEEoTdYNapQhUMNcohUq6waT2diMY0nWopfqqN
         MqGZFf0JW9T1hmJAwL7iGqvSW9mXpGCD30HhLReN3Btam9EKsBDQnvYjoKRdY7NYQOr3
         7Mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777207686; x=1777812486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdSlfN5TOas9ObtsBftpjoK8qDSsbhsD2j4mnZKffjw=;
        b=sAbSrDEgBAWP0YWtSm2zxdoUXOLZ8YmoJcmglAtxthGssR/r6FJpJxdKmPl5dGoAIq
         WTDQNgT8U6NG17jfbCsrNRlPOmrE1PriKFTJP+oWhI27Fqy4ZXsx3pyErYYPQZId7MLH
         hLSZMHqgCNEJLvfxXIfSCHAWJn88bhvH807GzENm9xW2EJKzKS0FeAbadpiCTobl3aK9
         qmGV3ej4vdAgqjfEs45RcNLGrQecUB3JiQf/DtHxtR9gJ10YMovfMklaJ/hLUu6TVAQa
         93xeG1KhuK8PZ23uIZZV9dRpPc41FgN4LyfqcWARl7wA9gubM36vKwjh8EtTU+DkttsR
         Q+kA==
X-Forwarded-Encrypted: i=1; AFNElJ87XP/lMWqb4cQDxO3QNycUNw0mK4EVNfu9csCq1gbrLbUD4BwMDNEiauIxJDt8k3WCPW+Ojl+/iqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCTK3kOamwMFt5OxZbcqt+HCwUhcbTXiMgCyObrPmmWstDytrj
	Qj8OHwicpVUrTJN8HdLCEd3niQ8F1DrUK/mHpw1gx+of8SPHctAH6QKL
X-Gm-Gg: AeBDiesH+Sni6xp73UvFQrwCbbqfn1bwY/zE92w70s4j+FTYbygipChXfrBg5kUxmv1
	u01k4vdX64Dec8LarpeW2v5mP69ytWGxkwEMXWeIxqwB4IIOkd5elh8B5yUNsNFZuXvdmT2Om6Y
	nUQEaiN9lPSRN0xLBiuOLeUHz+JxhR7yH827jeh+xLUJJB3AE1xKmMZmxU2JL+0ive2TFQO3hbE
	N0+kezgJRJgbm/3Dx/jurA1w84xjQKBSMep/egVfxDTVU7RNRflQp0qXefVBVUsUfdsHU3QmBdU
	nAnUgkEzpB7PqlG2uN2P+JuoLi1WVTbZ7e7lT7YINmn/7UmmZBhjcEuyZ3JmtaqsMnDZC4tclzk
	WTRO0TqECJVt54iL7F/TdUnGyQj5ehjMcBtxzquhfXPrBV2agbsRCwi7lPYJzUOBC3vPaaD3BMS
	U3/iLkHDJacfxfSoBponr6Ig+hAsUzLJhvKN95o8JLffNTQ9+fbQXNYAxkusx73KEG7bQU9sM/M
	jYQoOCw+fltMhbjiMpRx5bPN3CAQACaQg/1DFtPIHQU2/GK4SaNufwHTk4W
X-Received: by 2002:a05:600c:3546:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-48a554663d4mr338552955e9.15.1777207686168;
        Sun, 26 Apr 2026 05:48:06 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5a579bd3sm376534015e9.6.2026.04.26.05.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 05:48:04 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 26 Apr 2026 13:48:02 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v3 1/9] dt-bindings: iio: frequency: add ad9910
Message-ID: <662bly5emi76xwhlcetznipwsa3a5ncyne6zvpffqyxp5pvczq@23udi3emw6sp>
References: <20260417-ad9910-iio-driver-v3-0-29b93712a228@analog.com>
 <20260417-ad9910-iio-driver-v3-1-29b93712a228@analog.com>
 <20260426120139.3fb8f3da@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426120139.3fb8f3da@jic23-huawei>

On 26/04/26 12:01PM, Jonathan Cameron wrote:
> On Fri, 17 Apr 2026 09:17:30 +0100
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > DT-bindings for AD9910, a 1 GSPS DDS with 14-bit DAC. It includes
> > configurations for clocks, DAC current, reset and basic GPIO control.
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > ---
> >  .../bindings/iio/frequency/adi,ad9910.yaml         | 189 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 196 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml b/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml
> > new file mode 100644
> > index 000000000000..61e879bca5c2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml
> 
> ...
> 
> > +
> > +  reset-gpios:
> > +    description:
> > +      GPIOs controlling the Main Device reset.
> > +
> > +  io-reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO controlling the I/O_RESET pin.
> > +
> > +  powerdown-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO controlling the EXT_PWR_DWN pin.
> > +
> > +  update-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO controlling the I/O_UPDATE pin.
> > +
> > +  profile-gpios:
> > +    minItems: 3
> > +    maxItems: 3
> > +    description:
> > +      GPIOs controlling the PROFILE[2:0] pins for profile selection.
> > +
> > +  sync-err-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO used to read SYNC_SMP_ERR pin status.
> Looking at the datasheet there are a few other things that might want to be here.
> 
> pll-lock for example might be wired to a gpio to allow a check that lock has
> occurred.  Maybe sync-samp-err as well though possibly that one wants to be an
> interrupt?

I can add the lock-detect gpio. sync-samp-err must be a gpio, because it must be
used by a calibration routine that modifies sync delays and reads the gpio value
to check the sync state. The goal is to find the best delay configs. More details:
https://ez.analog.com/cfs-file/__key/communityserver-discussions-components-files/318/3426.Synchronizing-Multiple-AD9910s.pdf

-- 
Kind regards,

Rodrigo Alencar

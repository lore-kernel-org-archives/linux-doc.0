Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0B8355F22
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012745; cv=none; b=NplKYDbMHH+k/C/bDwbaaYtGGDiZq/8oGr7iwJlOkjoeLMIDCDzH1Pf/q7W0DOsLnElKm/NvK6q43WvDXYuN7XXeK8JBQHnZQNoNr6piFUZKszQWhAI+sTDtzLzHSy7J0Oy/xZM/qp8PaoC8P6efuCUTxfqglBIfHYdz52wpMt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012745; c=relaxed/simple;
	bh=KD/IuTgzVq18/vpJBrybXULGBqIH1vlZksMS0vB9c2E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=baeedAZQewgVOkxSCPQtbpqlqk6WunRnhKqH9eaLQnS55ZGQZXuwg3ORZ1cq49OoPHj7gGv1y0hd+YZqvCM6zkeplbIptF2aDFEdpp9dPW32AWcYTh9MzAUvxirA+8Rc6xTKfuKjjY1oyEH7Fb6TkGUEGukk8kZc9rfkY8V/zPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g70Ccik1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g70Ccik1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so8981505e9.0
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 03:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779012743; x=1779617543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NzQ+XkjFbbvnSSJgYiukqepa3NWBT/tqzId42RKwLNw=;
        b=g70Ccik1II7afpDiDAjDi8pQvdlf45OLTbHgt6NPjxDHqXylsPDPi/VYbqo+Yr3sCU
         7LiN6I6w8WYou1Z0z4Zftt67Z5CAohO7Oj9e+vTx8SzAjVfFiNo9MjaodLiGvf22U6jV
         2T/39KbijVls5KHDwHib14+Yp5K+hCqQjI5CX6MgMCoClcYw2RCibCAmOmke+ja1xZUC
         v2rjFgI16PlfXf2y+nEvbAwPcoCV1PeYbJOuQ0dzCdkeLwUNZzP0Na1pQARf7eLm8dJq
         YfMLan7rR9dz1ZL1MwO2Oj0o+QOEKnIgwsQqFZ/Om+uUI6u8AXVZWvIXMrmZJIeGr2qb
         H4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779012743; x=1779617543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzQ+XkjFbbvnSSJgYiukqepa3NWBT/tqzId42RKwLNw=;
        b=QllWDkZVvCM2YJ5RGOy471aS2FZ/Vv5FBz7QpTqPew4tNeZ7OYE+/0pB/XPtPRQS3f
         NEqbWPGXgR/PKcfjVfDR9IHVz1jAQ071xdfiPOTPTGr7QYdxSp6vAJNiyrNwQSONZqTq
         p5JdgHf2fnd0QVkUNIwdc+KncBELHovMq9KpHqQL9ES2hhgJOVIEqtdFqLme91QPakcP
         sKS5yHCRlTACRu5BOo91uJcAYipFYu8pJVLXD7jLIv3kzLpY/StwcFRKLMdw/7E1F9MH
         2fD82fIyWmNHX8z2lTcpxfSlrxlWcTqsDZQvKL8PoLUTfV3bd/lpaUAodn5Flw17Qv0i
         QtKg==
X-Forwarded-Encrypted: i=1; AFNElJ+csQiq0PF56NjNqj0b3MZYSWp3hVRqPre19I0LytpnjtmchQiThwGopnBtRBvXs9DGRaOHqQ+4UHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT9g4hMA78ffO+Il+RaREfI2yYe2UUWOQsuCyD5+mqRMBBdp5C
	ubKI8k25yo+uC5nmRc55LZn8njzfB2JDzeiva/QywEBMmlC2+TzwYX+0
X-Gm-Gg: Acq92OEnLDyx80s9ioZwbNcMVRx9vCgjXXcAM3HhiDEhfTzO/FAj22yXGkmUUFzjOnw
	l+fY2M7qizxz2SlfEKE6XBb63zl7tCr70GIm6DBMvX0eRpzcm9VcGUnY+Zpv6NyxroNDslfBdh9
	RG2mqEbU520ok1zZw9EYBumwxQMdZNQ6ZlqALJUCaz39qy0j+1a4n3akC19tEE4Vo9hLNPonPHp
	mp9Qp0z8kAZSaMTrW56/LHTvxCeBjbb37aSs1wvFMyKXCrQ3Jm6Z05w7uNeuPBvbIE02U/AUz5X
	VY624eCuct6xwWjWGGYtXNmY5geJRgggBWpgRuFZvjxqK1CXflhd4lXHPl3GXfFJttDDiLlCo0i
	aVJlbzTQM7AqNaBG83qQ+dO+0OtQIZWTW9Bmt2drfxAK03HXfdn+abtmDt0MZ81DxsEJsjXXvfg
	1mBMFccTNihGOIYkWCLCtyBuhi6CZBv64j+ZKPoQWidR35qQVaBfkqP6HFteNym/JCoql6asz7Y
	liWbtvkp7zFAdss4bceQZkEWBRb5yD1f8dBqnWSlQQ6Y/Etxw==
X-Received: by 2002:a05:600c:8184:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-48fe60ed790mr148404075e9.12.1779012742660;
        Sun, 17 May 2026 03:12:22 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm181409985e9.14.2026.05.17.03.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 03:12:19 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 17 May 2026 11:12:14 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v4 01/10] dt-bindings: iio: frequency: add ad9910
Message-ID: <ikhp5dsb4ook2cx665p4xbqg5ykmnoytiaybv2cx5khyn3wngn@j752jkewd36b>
References: <20260508-ad9910-iio-driver-v4-0-d26bfd20ee3d@analog.com>
 <20260508-ad9910-iio-driver-v4-1-d26bfd20ee3d@analog.com>
 <20260512193129.777d62a8@jic23-huawei>
 <vklczsi4vk3sqf53zifslhp5pysdmj3gfyhvdgrwo4bg3wdkxj@lnbftaf5jcbf>
 <20260516114022.58949a06@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516114022.58949a06@jic23-huawei>

On 26/05/16 11:40AM, Jonathan Cameron wrote:
> On Wed, 13 May 2026 16:09:24 +0100
> Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> 
> > On 26/05/12 07:31PM, Jonathan Cameron wrote:
> > > On Fri, 08 May 2026 18:00:17 +0100
> > > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> > >   
> > > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > > 
> > > > DT-bindings for AD9910, a 1 GSPS DDS with 14-bit DAC. It includes
> > > > configurations for clocks, DAC current, reset and basic GPIO control.  
> > > 
> > > I think this is getting close enough now that for next version you should
> > > drop the RFC (which is probably gating DT binding folk giving it
> > > a detailed review!)
> > >   
> > > > 
> > > > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>  
> > >   
> > > > +
> > > > +  adi,dac-output-current-microamp:
> > > > +    minimum: 8640
> > > > +    maximum: 31590
> > > > +    default: 20070
> > > > +    description:
> > > > +      DAC full-scale output current in microamps.
> > > > +  
> > > Can we use generic dac.yaml defined output-range-microamp? The base will be 0 always but
> > > that shouldn't matter.
> > >  
> > 
> > would that be fine even if we do not have those child channel nodes in the device-tree node? 
> > 
> I think I'd rather we generalized to cover the 'one shared value' case rather
> then went with a vendor specific binding.

I can't reference dac.yaml in node level as it forces the nodename to match a pattern:

	dds@0 (adi,ad9910): $nodename:0: 'dds@0' does not match '^channel(@[0-9a-f]+)?$'

Also, I can't reference the property only, because it ends with *-microamp:

	  output-range-microamp:
	    $ref: /schemas/iio/dac/dac.yaml#/properties/output-range-microamp
	    items:
	      - const: 0
	      - minimum: 8640
	        maximum: 31590
	        default: 20070

which gets me:

	properties:output-range-microamp: '$ref' should not be valid under {'const': '$ref'}

so I will adjust it to:

	  output-range-microamp:
	    description: DAC full-scale output current in microamps.
	    items:
	      - const: 0
	      - minimum: 8640
	        maximum: 31590
	        default: 20070

and not reference dac.yaml at all.

-- 
Kind regards,

Rodrigo Alencar

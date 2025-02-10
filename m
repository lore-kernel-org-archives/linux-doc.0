Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CDC25EFAC
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 23:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739229275; cv=none; b=aRD0tLET5PsCEahOaeRL//1KtP6L8mGmF3J1Oi5EBNbcwVDoKIWmDabkt7t6i+7o+4BU58hcJh0Rm+7311uEvoK7aIEwFu8U/Bwot7aRIKYLYPmbBmtvUXmK1nwwAnMqUrdtnbVSrh2DvzN96zIQ2TE4prqpdSoOgyz7/pOiP+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739229275; c=relaxed/simple;
	bh=8i9JszH04TiBwcb05AP+zS29cixB68Cf6w5CTdI0D+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMtvMHsVp8NqaThx7gM0xNJFr7MWHLB1he/CwA0BSXVio8lEngmhfelcbgM5KjTsZYI7tIHOSZDOAJj6szA5mLtRafbdmr2CeFym79SJuX5wDBIdXP8x8McVuQ7ibKm0DH2RjLTIOZOyyuiBqGTHuHZLsjytjveFFMrkE5fay08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RujU9PpP; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RujU9PpP"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-307bc125e2eso46602571fa.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 15:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739229271; x=1739834071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/9kko6nvgrCtMDMk3GCD451xeU3goOMEnvnQebWZMb0=;
        b=RujU9PpPOHxQBi3Y3um7wqiPaj7HY9Gjg6zE8fVTsjcELNz7f6dQN78koh5mbTiEk+
         wCAwUa+Olw7qiCLUIB1HdojxyDgeBqS5w5rJiDfm9WrU0b5Omt5JX6ukEO+Me1ZJVqm2
         r2i9winT5hyq/YmNaGPGA7QUnaGcNvI1tQLd/1lYPkezniew6j0PwlMivH0IGsP+pZGw
         59YZvS6SasF5pnK/R+QfhZgDd37XsBMofgt6VDeL84AftM6tQpIRs8TrrQTPKRPq1GiQ
         lvvYQC79pABXfUhp+vnboOOqEmTCFctA2Jzl+abh3xQ8StU9L4HJEJqCG3OGA9dFO68d
         6oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739229271; x=1739834071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9kko6nvgrCtMDMk3GCD451xeU3goOMEnvnQebWZMb0=;
        b=s2nkFf6g5TfNv3n6dHY6Dwb/YMoWbrWoZN8MmAmbyhazOpOii7ugtU4TozszI3mlWm
         wbxDY/Ds3LQVlwc7fVuV51Fs2E6L9+KCvBuJ/hGFZA84kG5KgxRtvuEVo/awtA6ou/HE
         CoZmiYYgua+sDSBMSazlsvESJ9J4ef+QRONRb9gEcMao5pyteXh0Q+DYiaUHopjptIg3
         Qnc5u1A1CZmOeeb60+XPVL/bAl5hRywFle1bW3HpSt2wScwMNMG/E7+ov2aOGVbmzjrs
         FMgYn9do/91txrZb8jLiObnt6yanFlANIk8qFovKdaCuKSmrmmhFgRIjeTO5ZQIfm4sP
         mbKg==
X-Forwarded-Encrypted: i=1; AJvYcCUkR6PhKfQAsKuHax5tDT9eZNBxUU76ntrwn28G3M/1TBSd+8skz/4FBN05xjU0PJIRxu4hEssGubc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI65UdD8/Tkr5qTMYKMWm5iA2EY4jFduE/+hpKjmMry6CbnDKw
	tmiaZ+41JEk9QLRi/+7Ke/1Fv9cMyjMf2qkmUWSpUkfqSoIPdSxrcpwk7lK7oj0=
X-Gm-Gg: ASbGncuKshiGQBec40TMTIOyzJLmoHtfe954nwJu/ZvE10OZ/6H57BvTqjtl6WzTVhD
	+fmEUnDC7rLUTmmzisMqPr9kTuJxXouXWHTtaF27WlQghsx/66SLse4WbYpX1fQgdxYXdvb1xLT
	/eBByUVI0NjCbaB/kBR2DsmTr6xsg4/ZQPdiLUmJb4nT5+vIiWvdztMJ+GW+Bq8hn1XybNVuPEx
	flyIODSGZF17dscxsgNGnvFYMltoxFQ+pe0Ij/yi13N0iDgf1ZjGGRshMxILevMA+veAYFCEmHy
	IsHJGw3gtMkjUAiQKkT5HC4Ch2uYsB7kMne3n/w/ScZDcvXuYSZecrEo692sHgBSZs3xpSU=
X-Google-Smtp-Source: AGHT+IEiYA4ZdHNW0MIRhlYTkHA5cjZMO3XRsBNobQiwPDauCXQyDb35RHo4o7SlxDmsaMRxsdJWGw==
X-Received: by 2002:a2e:b8c2:0:b0:2ff:d2e4:8dd9 with SMTP id 38308e7fff4ca-307e5a779a5mr54736081fa.32.1739229271515;
        Mon, 10 Feb 2025 15:14:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2baaf7sm13653451fa.81.2025.02.10.15.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:14:30 -0800 (PST)
Date: Tue, 11 Feb 2025 01:14:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210181244.0e3e9189@booty>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210181244.0e3e9189@booty>

On Mon, Feb 10, 2025 at 06:12:44PM +0100, Luca Ceresoli wrote:
> Hi Maxime, Dmitry
> 
> On Fri, 7 Feb 2025 21:54:06 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > > > +/* Internal function (for refcounted bridges) */
> > > > +void __drm_bridge_free(struct kref *kref)
> > > > +{
> > > > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > > > +	void *container = ((void *)bridge) - bridge->container_offset;
> > > > +
> > > > +	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);  
> > > 
> > > Pointers are not really useful to track here, since they are obfuscated
> > > most of the time. Using the bridge device name would probably be better
> > > (or removing the SHOUTING DEBUG entirely :))  
> > 
> > bridge device name or bridge funcs (I opted for the latter for the
> > debugfs file)
> 
> These DRM_DEBUG()s proved extremely useful exactly because of the
> pointer. This is because when using hotplug one normally has the same
> device added and removed multiple times, and so the device name or
> bridge funcs is always the same, preventing from understanding which
> instance is leaking, or being freed, get, put, etc.
> 
> Do you think this is a sufficient motivation to keep it?

Then it should be something like %px. I found that %p is mangled.
What about having both device name _and_ a pointer?

> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry

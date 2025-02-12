Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF733595E
	for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 00:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739321719; cv=none; b=hDqOC8eQL+gmjionjoE3ASx33V6fLZiTjHAZsjG+QFMgd8svWt9l4FcmUfqCMOuLUefkgI7aAWQo3hLrNyQKp5xjb/PDKHuK1n2SkMw2YUSI03U9FwhKQxqlsPDWiwHYmtG+SdWFuWlCbkQoWH8+tatS5YYTmWmt5pT7OGN5W5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739321719; c=relaxed/simple;
	bh=jCIurlHM76zZcC+ag0j1ChJ979i5vOv3fvHyabZoXuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiNW62T4b9u+O+AiIV3DFFvU/SP347N6JDGMepV2LV4HHlS3ec7blcVX0UzJ9TviDN0XP3IY2e9+4S4/+IhJaU6MqCyxLJyMZd08x5UugSsjmoj2R4gO5dXgIkysH3tvS0M1FoWRi0wyK5j4xsSp7pA04fpAR23Ej2R5hdkLosI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+hasUA2; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+hasUA2"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-308edbc368cso28575931fa.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 16:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739321715; x=1739926515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mUxNo4sdmWLVTWOH02xXE+iuTiw7pWWtDZzrPFzNKj4=;
        b=A+hasUA2gaRDwPuRIfLYEVasUS4mPC9f7V3Netd8+6K0fvTjs7Xe4VxxVMoO3GFqUc
         6GHkPO6sKyTYTD+5gPoXpq7uAU+Hk7sz0Irx5LNI6pKmfE4ONdBGwT4dry4usq0BSNH0
         p8HS5rZCj3qtW+IvVqBWwJnX5JQfYBx9PGI66Z/e8jlt3783q8Vll/+KleQyU2afUztU
         tDvXnLS88TGLBPeF1YbGfKiaTsMcODGkv8VzWLNG97g7M4tMW86gWOn96dB5f0rDUQlo
         lIReBqmzqys3x9rTV0WdGjU14KyxMNkU1clOM+lsu2aL7xLf6H36f55ZT4FZZERjLL2o
         /Xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321715; x=1739926515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUxNo4sdmWLVTWOH02xXE+iuTiw7pWWtDZzrPFzNKj4=;
        b=ESKBOFt34sAk6giT3zoaADuLCcdpG5nKRR6pCVZ54Df3hA314zwbr3E/CbgM4VvXyH
         Do3G9YxWQDvNeSu1pth4x6AXUBqWpj6/bHyhU1j/pa58Q0jRmr4sG148CxZHbjOLd/Xg
         UVlDXtC5+1trylES7TODwvr70y/Jz2OQBI9QIKbHbHkJhqnzYzR0IG4Gy/2kykU5FoZf
         DpzboWNzEuXWlqpPOafV8re+vSQFesURsOEnVd9e230Wdi2a78YBMBGB113fXIMhFAuP
         LQuK3ZlKzHBXdd68FKUShy7aSYtku4/PaWOBmrq/03bbM0yFnNDnVAIcolE4NwYy0y9R
         bPoA==
X-Forwarded-Encrypted: i=1; AJvYcCWj6C8nKvhVICT0nJuke4SisyBbG5t+B1GgX63iuPSuzYUcxBLOfOME9/MpY5NsF0TGbkgq4vBvjEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuZsM+DFZ+XKxWcR5jm095q6jxscma+5fGcj/Ex81OvPphWi8n
	xuBHKT6+cWAHDHgU+Iu/prVCCAK4Huy7zg9w6cE0RkFQZZQlK4K7F+/Mcu/xfBI=
X-Gm-Gg: ASbGncuYWqefKh7IbAjKFttJHnh/8M2Dpyh1Tm9Wbsmvbz7LuiUoQMB5QjYzBB06HIy
	9BwcuwdLtlgLmNB5k1724qRggCvORoTqNQLB1Pi0tcGsHMlTE8u8hfQNmv6E5/MpxksDHNGy1p/
	o8hdq3emSZSzzeCEK/uGAw3BuY7drYq/ADz1Vmx2TJxoXZoYCboh0bxDnsCGuL79lZLyoxPSxBK
	36D/eHtJyYSEpDjn/4KG7rcoM0f+nABxCPWG9DjuLp7/Zft1fxtf22jl0h9xlrQCeZl+ED10wM/
	iSq3ug0buNsdfYUyC3eAThVtAoVtgra01E1z8+tXD32mVtAUyK0DN9At2rUVC47/+oniYs4=
X-Google-Smtp-Source: AGHT+IGs0cV1u4iegcMKrjuoero2v6sW5UX43WNEwXp7nEN1CqXaDi6DN+1s0QUOAJhNgTLw4fuguQ==
X-Received: by 2002:a2e:a985:0:b0:308:e54d:61a6 with SMTP id 38308e7fff4ca-309050be548mr1754521fa.34.1739321714727;
        Tue, 11 Feb 2025 16:55:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308e95f67f1sm9534311fa.48.2025.02.11.16.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:55:13 -0800 (PST)
Date: Wed, 12 Feb 2025 02:55:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
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
Message-ID: <i5q5zuymhn6sy4nou22zxbolztqbq6soef2cwrdq3ey63vfugj@z3rv7zh7xhle>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210181244.0e3e9189@booty>
 <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>
 <20250211-venomous-dragon-of-competition-d76bf9@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-venomous-dragon-of-competition-d76bf9@houat>

On Tue, Feb 11, 2025 at 09:48:31AM +0100, Maxime Ripard wrote:
> On Tue, Feb 11, 2025 at 01:14:28AM +0200, Dmitry Baryshkov wrote:
> > On Mon, Feb 10, 2025 at 06:12:44PM +0100, Luca Ceresoli wrote:
> > > Hi Maxime, Dmitry
> > > 
> > > On Fri, 7 Feb 2025 21:54:06 +0200
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > 
> > > > > > +/* Internal function (for refcounted bridges) */
> > > > > > +void __drm_bridge_free(struct kref *kref)
> > > > > > +{
> > > > > > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > > > > > +	void *container = ((void *)bridge) - bridge->container_offset;
> > > > > > +
> > > > > > +	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);  
> > > > > 
> > > > > Pointers are not really useful to track here, since they are obfuscated
> > > > > most of the time. Using the bridge device name would probably be better
> > > > > (or removing the SHOUTING DEBUG entirely :))  
> > > > 
> > > > bridge device name or bridge funcs (I opted for the latter for the
> > > > debugfs file)
> > > 
> > > These DRM_DEBUG()s proved extremely useful exactly because of the
> > > pointer. This is because when using hotplug one normally has the same
> > > device added and removed multiple times, and so the device name or
> > > bridge funcs is always the same, preventing from understanding which
> > > instance is leaking, or being freed, get, put, etc.
> > > 
> > > Do you think this is a sufficient motivation to keep it?
> > 
> > Then it should be something like %px. I found that %p is mangled.
> > What about having both device name _and_ a pointer?
> 
> No, %px must not be used there. %p is mangled but should be consistent
> across calls. But yeah, it's kind of the reason I suggested to use the
> bridge device name instead.

Then we need to extend struct drm_bridge with struct device *dev (which
I would appreciate, it will solve whole hdmi_audio_dev / CEC device /
etc story).

-- 
With best wishes
Dmitry

Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5591E5718
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246124; cv=none; b=gmpRl8nMQ6Iq91JiIBFIQpqiGgYgjk9PZYhsVxfhOJTD/BFpeZBv8S1QmkUKjSMJ9vAZYSSJowtgVcfItuYzqteR9E7pzm32Ws6WmWRkxrxzsF0ovG73QMXZ5KHENhQCJH6gaWPG4INJAEyKSJIgZ4ryfCnVFwDCa/4+cY65VPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246124; c=relaxed/simple;
	bh=wLC03UziaB0N/HwCP9RWCWfN1P3oGdniH1tjL001N9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9NJihvtQLxPBhmkc4E1nmcxgWEW2yy9WuB4zJ5Og9yEq7iSGKsp/QQ95ydpA1iVJiERwREwODMfZ/qZTHrxGn8vjMVWb57dVQPxBrPavS12DVpR4qmY3KRaydqWAMQZU7K7jEXPkxl7NIdzbbaqdmV2/+LSv16nQL+qGJNGvz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMQNYm2q; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMQNYm2q"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54263b52b5aso4944407e87.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 02:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736246120; x=1736850920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JINas9gXEeJz7rcdz67KY3tt8Mqk5Hz6CTYnyoJPpTs=;
        b=pMQNYm2qGb7sYHvAXOi6rcbrVs8XLWsiZI89ptnGKbXv6zu1w2hwX69vcTs0rrMaHa
         v3O9k0AAj0qsYtqUupOfOJZ1gUKM93bpCiuhIkOZ1pLrcwOT8KnUynzxHoPUJW68qlR+
         P3lcu2tQNoZIPaIJpfUqAsctPl95YQjzQfIZObjMA+XGawBXclGUZVEmAV9pdn5+fji7
         Z3b29845iaHg2O6gBL5KcI1p97T1TV9PGSdwCnzZ882lc+FK7XzVYyOPd87g8UuhUwSG
         ePe88y3+TdkeOF/ngyZurHlrwNDmOqPHgi6NSIFZf7LQnwGXplpGes2HULR5upXj0ZQC
         vu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736246120; x=1736850920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JINas9gXEeJz7rcdz67KY3tt8Mqk5Hz6CTYnyoJPpTs=;
        b=X06F4Cm7mgZl99PwIioLMDa/l8jO8eINQ9Dq5XJ9naZlZmPh5D+3RRBB7DRxv9S+Q/
         t3YiyGbEPe8WSyneqeIhsX0gbgmAICEzghx2xBX8PCA3Bkv9/el3FXzQNyZPXib637gq
         6VpBKQej62OhBo4FUhBiGuQwu3aCJjWMiQkRwtEKEBDwZ3ZLWfI40di5SD2YjSDlbrjB
         TyS9qU0Fq6r/p9bic4ot82ORiSHNOmpCbjGO9UYMqbmcQUcDZZhpzZaIbGMD52e8A4oa
         CiN30DCJhh/apmfpUIM25YQSVhHNG16nBYn0oiQSA5VxpBn6pd01jCN5QolCsForUxu2
         JRJg==
X-Forwarded-Encrypted: i=1; AJvYcCVEfVPZA+ChkcSbGYOShiaekcgkgKpno/VH7LO9+QKhpRIQlwFQKAB6bOfSRu1pKiB7S7X6moopULU=@vger.kernel.org
X-Gm-Message-State: AOJu0YytOVdfr05O/bIoDLINduW/KMBR3Z/aGcL7cPpmN1aT1E+rledq
	oe44CYZwYIdahQwGy8w+mia9O8FGitNtdR0VgwwZW03jcb800MkQ5jFYHNIQPzo=
X-Gm-Gg: ASbGnctLYYf+14iVfCRLD7ckDmTiHETZhblId6HXeVRO/ssiY6IebR+rLl4EKmBerQR
	CBP/ZFX1XSxSEsGtfYgYbHixXYZ88YNXQDdm+9xSNCpzpvGl2nOAahYLYdjmUZH8Pcw0jAYEq/+
	SLBjfAQw5NL2WKoQki549Y/4K8XWoOKZFruVqxjuhijWUDcHVJz0lsNv75LyfE5zjzlnI7cagCF
	W0tRsh9j86l76IVCMQWfVj/9A/rIVeQR1w75/4IUixaBIrbzjYAIYuzbHifV6UY51kWJPxL0z0k
	maJyH8UAkkfODSIEeqt2Ggi9zktI4MXEc99S
X-Google-Smtp-Source: AGHT+IE0zfPqdYbHJt8ILQi+9nj0qarNfhAx8Xa50MPg5cctWnzkdXY68gv9r+BrM9ugjLbK6znTyw==
X-Received: by 2002:a05:6512:304f:b0:540:5253:6af2 with SMTP id 2adb3069b0e04-54229525548mr16213576e87.12.1736246119653;
        Tue, 07 Jan 2025 02:35:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542236001c0sm5227326e87.81.2025.01.07.02.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:35:18 -0800 (PST)
Date: Tue, 7 Jan 2025 12:35:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Kocialkowski <contact@paulk.fr>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Message-ID: <2ay7s3nokg2yyks2t7df6niee7z3a2jhgqw7elumk3lirdvjbk@qqrnkbwcfqly>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
 <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
 <20250106-quick-exuberant-jellyfish-cddde2@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-quick-exuberant-jellyfish-cddde2@houat>

On Mon, Jan 06, 2025 at 03:49:48PM +0100, Maxime Ripard wrote:
> On Mon, Jan 06, 2025 at 02:24:00PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 6 Jan 2025 at 12:39, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > Most of these comments affect your earlier patches, but let's work on
> > > the API-level view.
> > >
> > > On Tue, Dec 31, 2024 at 11:39:58AM +0100, Luca Ceresoli wrote:

> > >         if (IS_ERR(priv))
> > >            return ERR_PTR(priv);
> > >         bridge = &priv->bridge;
> > >
> > >         ...
> > >
> > >         drm_bridge_add(bridge);
> > > }
> > >
> > > Would work just as well.
> > >
> > > I also don't think we need explicit (at least for the common case)
> > > drm_bridge_get and drm_bridge_put calls for bridge users.
> > > drm_bridge_attach and drm_bridge_detach can get/put the reference
> > > directly.
> > 
> > As I wrote previously, I think drm_bridge_attach() might be too late for that.
> > It sounds like drm_of_get_panel_or_bridge() and of_drm_find_bridge
> > should increment the refcount, possibly adding a devres action to put
> > the reference.
> 
> We probably need both. drm_bridge_attach adds the bridge pointer to the
> encoder bridge_chain list, so if we had something like
> 
> bridge = drm_of_find_bridge();
> drm_bridge_attach(encoder, bridge);
> drm_bridge_put(bridge);
> 
> We could have a dangling pointer.

Yes... So, both drm_bridge_attach and drm_of_find_bridge() should take
the refcount.

Just as an idea, it might be nice to add refcounting to bridges_show(),
so that we can easily verify that refcounting works correctly.

-- 
With best wishes
Dmitry

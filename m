Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEC81DE88A
	for <linux-doc@vger.kernel.org>; Mon,  6 Jan 2025 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173965; cv=none; b=QD1Enpqgb3NMI0imYkuTluX9mFPmO1/4tBXibZWYaZ2/+Coy3/TWO8ML73lPeZCMmA4P5OxuKeFRry6MRuDOUmJygODD9eqH8KBYQFIjBXoYXg3yJo9Gj8Lbr9E5abUcVUr6ipoS2tvqvIQjtOLMD3rWDhWQHA5lbj6G3WF0aso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173965; c=relaxed/simple;
	bh=fE4M/8QZWNYHzI74/+8ap/DWC+3u8La8yQWSRxrDpDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvQJU41GXViV1AEIL10D1hAxfos2hgpOIYxYXTdIxhW7VPWjcQiPruWSRaxtuzRLBvuR9x3kGBSSP0rg9xfAw29cdhlPGZvlR3BTFXmukclx/oYM/KnHa7AvBMeZSf8vcbNTXu0kPqxpiuU7sc+7Nq2rOe7fCcaDwLeLALYDLQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hHKdE7vf; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hHKdE7vf"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e53a5ff2233so19023363276.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 06:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173961; x=1736778761; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=parYT9glsnlPG/f3M8WwTH6w3s55tBA7mvmEK8sknGk=;
        b=hHKdE7vfjqK5tZ2Skvq2H4FZQ2MYySn/Fh7LwH+kiYOpj52Pk36bIMJrVvCAnp6QxN
         DoDQiwD0Gr+ye+Sbkm3Av4Ps79+ho9OLo6rvKi9MfqNqb6odyTsl1tTo1j1KsU72uVdX
         ElAWEB0XhnrJedPl5/zvJd6Keq7jju48Z/JGcbNsE5eWkK+lMXDFgeMTAGx/W4oPnEgG
         q4L09yvm2KI9XCDP4AEjE5jqd3PZyhPSqbIz0k3gfUCfr9ZWhH/46ZRIfAZB2EcfMj0j
         jPUwpAfiNG5sSzPYVaN8jFlVtSklSy0xOInChDbLzZQoYyOvHDHMYKYMUA/CZ1/qNa3m
         wmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173961; x=1736778761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=parYT9glsnlPG/f3M8WwTH6w3s55tBA7mvmEK8sknGk=;
        b=YbZGb1aktcsez17rsm9/JTADJToq3q/8i9TAMxKstsWZ1njIw0KYSQbkITotVXdDua
         4ObC4XNkJOw8Itt080Gq9ep/8JqqkwYIuxBQB1EtN4jjuTekiF5Nla0YzzkZTfvL8XxV
         9joPMfBhbY28ypHJzlyLA+bHd1zDWywb5iOXknk2dThR/9dgOJpHnoR3dliia4m+nI2T
         zv0TLi86vbmYMgRcCoZRzfKy96MkNJ6cmUiCEPS41pGBYm2ibCAp2kWr+9UAqAFSnFT3
         ixFGzG5fyv7FK60Y2EGctKW16kKCCg+cvZTbt0BSPVik6uzy+63N6LI6zblMZd1oX0OJ
         rhyA==
X-Forwarded-Encrypted: i=1; AJvYcCU9lLJh+OEQDonuHAk9HRCfEe49Q08XqlzCGdTr9JxOWX90cRnah8/2wCpGJqhJxm9TDG++sBkP91Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyftmpW2G2Bkm7J8XWyt/AKOY1+Bse+YbUfmrFdHgnbah1+sYMe
	qBDzJcNAVVZiRogylxVP/1nPylPqUl1TINbMWlqb7nQVNVBctDDu2x0CBwJZVaq3HRvUC3vX0y2
	r3qvR6PpA3HPzR6mSfqSnQ57bSqrH0zgpeUKkEQ==
X-Gm-Gg: ASbGncum2AOO39mLm6ExhC6uXIEQtUp3maMX290KKMj9znHvVSY9aQgD4pzF5qq8ATa
	zMhWQtjXimys6U51mGi8Bw21W4PgJN2TVnV3xtlxooeMR5uVUwo0Sbo9z8MosT70EKUOW/w==
X-Google-Smtp-Source: AGHT+IFCYJMMVkJai/tt6UL5o1Vxw9p+5FHL/IKoKcM5cfmGtRMK7HxGPa/26NkrbF5OXzwxL3mZCjRDFbu+belYShA=
X-Received: by 2002:a05:690c:f84:b0:6ef:6d61:c258 with SMTP id
 00721157ae682-6f3f821384bmr340409657b3.27.1736173961192; Mon, 06 Jan 2025
 06:32:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com> <20250106-vigorous-talented-viper-fa49d9@houat>
In-Reply-To: <20250106-vigorous-talented-viper-fa49d9@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 6 Jan 2025 14:24:00 +0200
Message-ID: <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted bridges
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Kocialkowski <contact@paulk.fr>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jan 2025 at 12:39, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> Most of these comments affect your earlier patches, but let's work on
> the API-level view.
>
> On Tue, Dec 31, 2024 at 11:39:58AM +0100, Luca Ceresoli wrote:
> > + * When using refcounted mode, the driver should allocate ``struct
> > + * my_bridge`` using regular allocation (as opposed to ``devm_`` or
> > + * ``drmm_`` allocation), call drm_bridge_init() immediately afterwards to
> > + * transfer lifecycle management to the DRM bridge core, and implement a
> > + * ``.destroy`` function to deallocate the ``struct my_bridge``, as in this
> > + * example::
> > + *
> > + *     static void my_bridge_destroy(struct drm_bridge *bridge)
> > + *     {
> > + *         kfree(container_of(bridge, struct my_bridge, bridge));
> > + *     }
> > + *
> > + *     static const struct drm_bridge_funcs my_bridge_funcs = {
> > + *         .destroy = my_bridge_destroy,
> > + *         ...
> > + *     };
> > + *
> > + *     static int my_bridge_probe(...)
> > + *     {
> > + *         struct my_bridge *mybr;
> > + *         int err;
> > + *
> > + *         mybr = kzalloc(sizeof(*mybr), GFP_KERNEL);
> > + *         if (!mybr)
> > + *             return -ENOMEM;
> > + *
> > + *         err = drm_bridge_init(dev, &mybr->bridge, &my_bridge_funcs);
> > + *         if (err)
> > + *             return err;
> > + *
> > + *         ...
> > + *         drm_bridge_add();
> > + *         ...
> > + *     }
> > + *
> > + *     static void my_bridge_remove()
> > + *     {
> > + *         struct my_bridge *mybr = ...;
> > + *         drm_bridge_remove(&mybr->bridge);
> > + *         // ... NO kfree here!
> > + *     }
>
> I'm a bit worried there, since that API is pretty difficult to get
> right, and we don't have anything to catch bad patterns.
>
> Let's take a step back. What we're trying to solve here is:
>
>   1) We want to avoid any dangling pointers to a bridge if the bridge
>      device is removed.
>
>   2) To do so, we need to switch to reference counted allocations and
>      pointers.
>
>   3) Most bridges structures are allocated through devm_kzalloc, and they
>      one that aren't are freed at remove time anyway, so the allocated
>      structure will be gone when the device is removed.
>
>   4) To properly track users, each user that will use a drm_bridge needs
>      to take a reference.

5) Handle the disappearing next_bridge problem: probe() function gets
a pointer to the next bridge, but then for some reasons (e.g. because
of the other device being removed or because of some probe deferral)
the next_bridge driver gets unbdound and the next_bridge becomes
unusable before a call to drm_bridge_attach().

>
> AFAIU, the destroy introduction and the on-purpose omission of kfree in
> remove is to solve 3.
>
> Introducing a function that allocates the drm_bridge container struct
> (like drmm_encoder_alloc for example), take a reference, register a devm
> kfree action, and return the pointer to the driver structure would solve
> that too pretty nicely.
>
> So, something like:
>
>
> struct driver_priv {
>        struct drm_bridge bridge;
>
>        ...
> }
>
> static int driver_probe(...)
> {
>         struct driver_priv *priv;
>         struct drm_bridge *bridge;
>
>         ....
>
>         priv = devm_drm_bridge_alloc(dev, struct driver_priv, bridge);

Ah... And devm-cleanup will just drop a reference to that data,
freeing it when all refs are cleaned? Nice idea.

>         if (IS_ERR(priv))
>            return ERR_PTR(priv);
>         bridge = &priv->bridge;
>
>         ...
>
>         drm_bridge_add(bridge);
> }
>
> Would work just as well.
>
> I also don't think we need explicit (at least for the common case)
> drm_bridge_get and drm_bridge_put calls for bridge users.
> drm_bridge_attach and drm_bridge_detach can get/put the reference
> directly.

As I wrote previously, I think drm_bridge_attach() might be too late for that.
It sounds like drm_of_get_panel_or_bridge() and of_drm_find_bridge
should increment the refcount, possibly adding a devres action to put
the reference.

> And we'll also need some flag in drm_bridge to indicate that the device
> is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
> because now your bridge driver sticks around for much longer than your
> device so the expectation that your device managed resources (clocks,
> registers, etc.) are always going to be around.

-- 
With best wishes
Dmitry

Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F616EB74
	for <linux-doc@vger.kernel.org>; Fri, 12 Jan 2024 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Sc+oUxFE"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbd029beef4so6006176276.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Jan 2024 07:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1705075163; x=1705679963; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OOjkY6qLcUDJ6pAB2XOnTphDRYpUaH4ZDZBnldaqt/Y=;
        b=Sc+oUxFEciCOQuRfnIBX3GJ5LrAnNGXl43YU7QlCK0pTzz5b1KfFVmsxrLO9pWeZ0v
         /kRgBumkheClcn4+OFHy5BZYCMXtZUzPTVpKObIG1AKG94/l0lTGncHqDl2ZnItwyfZb
         lAOZraLzsEiQ6Xsx++z/488vxPftWrt0m+6nvs4+HdjfpQbxLM+mSEUEkGYJ2tB/4Zci
         2KMvkD5xhSlvmbrtWf0LkVAW8WZ1BljFuet7o9ICCnBgfSZeREWnuLO7kZED718wvcAn
         A+Tv+p3ULm5usZS6iKoai7gOzgxI2ZHrGCVRWjBTLiwap86KjAlk/Hob75LMi2y9IujJ
         qFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705075163; x=1705679963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOjkY6qLcUDJ6pAB2XOnTphDRYpUaH4ZDZBnldaqt/Y=;
        b=doLXJUdPcaILA66fEH6+sbvccwsiW7cGAxCOle4CyHq7qmC2vg8Yeri5XvUlzyO+wN
         bgg34H2p2ZtVvDM6v6yqhgax3vRPR6aZIsA7M0yaxQoESgTvuXLtd4ZnXELOlVWsaBu5
         CUdaNZ/SLtIxdFx9OeGlwo1Vslecc9HFmUHkN0ZmFSeq9QK3gXC81N90zK406uSPGJpx
         NHLPZi5LBQjaLLAi46wkEMHxl/4NDXTrW7smnv22e7liZCNL2Eniu4/EAqEuxlrQ2wun
         xOH4rNs/YXC4T03FjrqbuyyatczEgHn0ew/c8rMkP0ek2iqpFcb7edNks0IZ4sC5D+lw
         O8kw==
X-Gm-Message-State: AOJu0Yx60wniHJE076VIB7lhciBFfThnpeIj+MYl/ILVptYovS8USJiI
	l+TYODkVwm47uHdMUr7EZ0RI5DTDG3sAUJYVs7giakYo1Z3+iQ==
X-Google-Smtp-Source: AGHT+IHr3UudPwurXaz4S+dT72h2sVx6HX8ltwQ55glZrlvIRFVV+m1zueg0vrLt+5IAqr6Wt0L8KbJCDVH/13I+Tbw=
X-Received: by 2002:a25:8106:0:b0:dbf:3d61:8d03 with SMTP id
 o6-20020a258106000000b00dbf3d618d03mr551130ybk.28.1705075163182; Fri, 12 Jan
 2024 07:59:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <CAPY8ntCs9EAYsxwjkscms3kqoC0N8+CcTHoyrG+gFMc0Mh=cwg@mail.gmail.com> <337mubsn42zlpuoqqvqmsjtdww4kg3x6lo6brdos5o6xgwjdwo@cxfad2pk2so2>
In-Reply-To: <337mubsn42zlpuoqqvqmsjtdww4kg3x6lo6brdos5o6xgwjdwo@cxfad2pk2so2>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 12 Jan 2024 15:59:06 +0000
Message-ID: <CAPY8ntDbM=j6YP3A5TNHoK73eTj0uUvnbAS0cZtxHgVoeuOFrg@mail.gmail.com>
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime

On Fri, 12 Jan 2024 at 13:59, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi Dave,
>
> On Thu, Dec 14, 2023 at 02:43:37PM +0000, Dave Stevenson wrote:
> > On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > The i915 driver has a property to force the RGB range of an HDMI output.
> > > The vc4 driver then implemented the same property with the same
> > > semantics. KWin has support for it, and a PR for mutter is also there to
> > > support it.
> > >
> > > Both drivers implementing the same property with the same semantics,
> > > plus the userspace having support for it, is proof enough that it's
> > > pretty much a de-facto standard now and we can provide helpers for it.
> > >
> > > Let's plumb it into the newly created HDMI connector.
> >
> > To have such a significant proportion of the patch being kunit tests
> > when there was no reference to such in the commit text was slightly
> > unexpected.
>
> Thanks for your review. Does that mean that you would prefer the tests
> to be in a separate patch?

If there was a need for a respin, then I think ideally yes, or at
least a mention in the commit text ("Let's plumb it into the newly
created HDMI connector*, and add appropriate unit tests*").
Overall I'm not that fussed though.

  Dave

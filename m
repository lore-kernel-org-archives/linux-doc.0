Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D2F3FFAA8
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774543249; cv=pass; b=cr5v6j4nFKqxlGANmKpoHmVlhrTxHrzgddKSzZBI8O39a4ht+VfTTQXElwv7TPN3e+I3CXw7MwVVBxLpTQjSiuLipUm5ST8hB762bWZKXutK9GHjKXq8Um4wC9xz5CSRQMJYlpczxhzbt+3l9xlt5FsjlD8thRqSq0V7Z59cTBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774543249; c=relaxed/simple;
	bh=tE43au3MN9i7zVkoHbSeIrHMfvxep/BhBPt5IbVLNu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkZ4Wx/uP4unUMLWO8bRbIdi8qNpVFQwr84Iq+noqKWZP1VeHAC3NOOK2PXGrMZu8MgCZPac4FaQSUXNJHOBmTuAh6tpuEfCX1owsIko3+fC2hw1ybB/23EaoDG4WCw/vIZjNOD5B3WZYmySIadpFr1f0cTNlQDXnlURFpargC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=m2LHRoOz; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="m2LHRoOz"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89a14be4733so13694086d6.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 09:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774543246; cv=none;
        d=google.com; s=arc-20240605;
        b=KjMLlPj3TS4OEGEXsFrli/ddlLjia2hnuXzFW+njYQWAYiaeriRHiSrtnXP7jp3P97
         2q5pu5Z7pCVd/DztZqDawd9sNGDHMz+4H09KXIWb9JaXzEltnaMUOmMFWmqQeD9npgz5
         jhRYpA4m6LUuD1OryujgLkd2XzHwAbrCQrlo/GwuDUWw/tpDxyLhX1a+GSg8NNWpSCYp
         dlcI9yN2kmblBguGXVAMahn11cHO5mxy92FIeZ4lOgJb0G/PKCJmzV1h9oBfiRGIiAXJ
         428CkIJwjNdRpVlYiJ+/1N9UgvXBllk1tMuxH2G1+aDxpLsWQTHn2mxTAMcLkFXxxM0a
         MZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lMVh41/flJhHXUmskY74HI0cHDnV8XVUzcIyI3Tc5Ws=;
        fh=ZMHBtayKvnQAg0ad2vfvNW9WZ9A7UglJciW2F8ZeuxU=;
        b=DoIVSmDf6HanTZT53iqulWkbiv3RIIvQO96Fr2PJ7lVscI4Qz9RfSDMRTcYEZ7xSsI
         sg1tqry+0ztsKMRJIkwjM+/emMBfK758GS4jkq3/EzSstS1x2unFLBW+cPSJy+UhqLqq
         l+9Gd4VQDLP0wdL2xTOvTnvb+lmNzoI2eiFRqKcEVEsYNBOA9+Mnh/W8XQMiK/vvmUkM
         r44oxqljxMceBuhdM9c1wXKtfqPu1WZkAVshIRQlxHfrdqyYbFPfnQ9bbVXxW4zBt5OH
         0YrUmC9xWbLSgaG2D5sxdMR5vv9frCH+RhfxWuCw9ciEXxMzl5A4YtxTlaw5eQWbkYIS
         gswQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1774543246; x=1775148046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMVh41/flJhHXUmskY74HI0cHDnV8XVUzcIyI3Tc5Ws=;
        b=m2LHRoOzgYAgxtD/N4zhAIFwLORmEqEQCLMKW/1cpOORMgQKi3PubQFj/UiA+56/bo
         wWr/MgyjdsCGqXbOCkwEkFhXOPas0iNYBEnOQ+9C19mFAI7py8to4qqKXOY4DrZGDcut
         2RGz/EPHIPnmmOp1VL36AIGpvVUu9k/2eVab3n6mob6pbFvCDdjDaRjP6ihCVKEt/iIY
         G7UMinyYa51BJ85vi4fvcowhjcuzL4XJsjPA78JysCCwZ8jIJWkjmj6LEB2JhflNHVH6
         WAhFiCbRKzcyQPnmXih8uxRbCYuRGZKAMNSz1BpZcxXNfYhnwBcobOu1jJ41mgTZBfMO
         OmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774543246; x=1775148046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lMVh41/flJhHXUmskY74HI0cHDnV8XVUzcIyI3Tc5Ws=;
        b=dzZ8XNQ8LlAAhh5q3FPoR+a/Z7p4BvXK1VnH2Zw6EkMtClAR+ZEO65Vc+gznvLFUkP
         nT/tO2XO+sEeo70I8DqiiPt2NsMwwp81kjkHskh8xG/0L0uUMHd+AjxexUFa8j7q5VKR
         Rtvr64rd9AkPVHQxfNYaPar90aGZ7aW+lUtMRGw38DnicPLoP798hXG1cdluN42gGcXq
         o0BGtrziALNCF9cgXrvfcJK2tCeaPObaAnBoDOYdp71QGIy08AE7ovPo7+SVYYNvjS7L
         heuuej0iUHeyl24jFROl5YwqXjCj6+Q8oH1dZKheD1QstJ2ljD70UP2J67mDDgKUgU13
         jq+Q==
X-Forwarded-Encrypted: i=1; AJvYcCULpxujv9tovJpJTrQFEph/LvMFO28FIhbveM5imEng2biWlhVrUzYT980oHpUQvHjTYrfEKNhkxhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YylsnVkHk92nN5BDpUXFp6e+r9Rk8duERYAmHfrUl474/2bmOdw
	DwC8jZ3p8qMY8Nm+WiI2GD92aEPuD/Aa+s9xsaoVChnyho/fZelU0lq4/crZ8+7uY0JTCLa0gDd
	vH2fpZqfpKk8Q6ls0Jir7HBaoZoWWfjF/3jXZsnLn8g==
X-Gm-Gg: ATEYQzzlvqXuukQamJUURQz/bXlxdkcFwaP0mNqxCPHJISdrkoPDxwkXTGYSvkgJIWd
	tCu1AfO9/F8E2TabWFH41E64DrvIMsbaQVBtLcUJ/w2fc1Oh+eWcbw0o+g2H4Y1cTPE2WA/o+xi
	CapNwIrJ9iocg6iTxKEjfgMFqPpugOwsbVv6sj1k0zNFvgiyziRO9gBMGR7njkyLhnQuFPC+2Vb
	WoPmhkajdqEY1/qsN8ykRimc47PbVxljkMTbYJ4U13E+sCrS2olfD0IXJHk2D9TXknPG0Rxerl2
	WZ+gHIk=
X-Received: by 2002:a05:6214:d6f:b0:89c:866d:15c9 with SMTP id
 6a1803df08f44-89cc4b07bc2mr122325186d6.56.1774543244239; Thu, 26 Mar 2026
 09:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260325-neat-elegant-raven-ebc9ab@houat> <acPA60Ci3n_t__xF@intel.com> <3979783.tdWV9SEqCh@workhorse>
In-Reply-To: <3979783.tdWV9SEqCh@workhorse>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 26 Mar 2026 16:40:32 +0000
X-Gm-Features: AQROBzB2J1rLcK9oOY95uN7pO5Y8iJWro7kBrTyJSKQV06IZlwAC79afqJRLPi8
Message-ID: <CAPj87rMpu-ZL45_uNPcZe3gu8Eqn2ALp3r0zRgghvT08-6RGVg@mail.gmail.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Werner Sembach <wse@tuxedocomputers.com>, Andri Yngvason <andri@yngvason.is>, 
	Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there,

On Thu, 26 Mar 2026 at 12:44, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> On Wednesday, 25 March 2026 12:03:07 Central European Standard Time Ville=
 Syrj=C3=A4l=C3=A4 wrote:
> > But I'm not really concerned about documenting struct members.
> > What I'm talking about is the *uapi* docs. Surely userspace
> > will want to know what the new property actually does so the
> > uapi needs to be documented properly. And down the line some
> > new driver might also implement the wrong behaviour if there
> > is no clear specification.
> >
> > So I'm thinking (or perhaps hoping) the rule might be something like:
> > - YCbCr limited range
> > - RGB full range if "Broadcast RGB" property is not present
> > - RGB full or limited range based on the "Broadcast RGB" property
> >   if it's present
> >
> > I think the "Broadcast RGB" property itself might also be lacking
> > proper uapi docs, so that may need to be remedied as well.
>
> Alright, so in v12 I'll do the following:
>
> - Add a line to all YCBCR connector formats that specifies they're
>   limited range as long as Broadcast RGB is limited. Whether it's limited
>   range when Broadcast RGB is full is purposefully left undefined.
>   In the future, we can expand this to state they're limited range by
>   default unless some other property is set. If we're not re-using
>   Broadcast RGB for that, this will work out fine, because users who
>   don't know about the eventual new property won't have this behaviour
>   changed. If we do re-use "Broadcast RGB" for that, then only users
>   relying on things we explicitly left undefined will get surprise
>   full range YCBCR.
> - Add a line to the RGB connector format that specifies its range
>   depends on the "Broadcast RGB" property
>
> This is a bit of a mess, because it's entirely reasonable that a
> future YCBCR range property would want to default to full range
> so that users get the most color out of their monitors. But with
> this description of the connector color formats, we can't do that.
>
> If there are alternate suggestions, I'm open for them. We can't
> really rename "Broadcast RGB" but if I had a time machine, that'd
> be my first choice.

'Broadcast RGB' isn't what you want even if it could handle YUV, since
it also sets up colour transforms to modify the data ... so we need a
separate, orthogonal, property which only affects the HDMI infoframe,
rather than applying any transforms.

Cheers,
Daniel

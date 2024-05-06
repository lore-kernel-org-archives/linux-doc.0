Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4344EB23
	for <linux-doc@vger.kernel.org>; Mon,  6 May 2024 06:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714978373; cv=none; b=gRHlx2hc5qTtzfGZVRQa2mGXJamEidRvG7qb8nqNe/PZgvClHmxGkiZLKpNUGf0pJ4nv2FkbNHlhgvHrSCMiZ1hm3elteogL9XfTR2A+BVw/R90bb+ki7kAYrXomzZQJTmci2603f3l/ixsT1qJDRZlk8Z6gyXRvoNwIlDq4wRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714978373; c=relaxed/simple;
	bh=uCAN6k7Li4+zUU2gGS3yzCjKtKUBq+HEjI+i3Zdzlfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeK+We5F8GDRT+fSyVx6Kn77F9GHAKP99RREfLuyzZ7x7Riv2YD6Kj/OrVKCPn9l1+NFiJCmweZL/5oRJjQBUOhP1Nb4jeDQek/exS9kJBOQ6Wq3wXjBNUG4UNlrcNFuh3nTxEjGx1q1TIpgH+0nG3kmXOR5fuEBiRJ8Ecjb60s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlBq2DvQ; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlBq2DvQ"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de462979e00so1770758276.3
        for <linux-doc@vger.kernel.org>; Sun, 05 May 2024 23:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714978370; x=1715583170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYbwDjo4JnZ5uHAXkvG9I+rCsMuqLE4wlNoSCofJHgs=;
        b=NlBq2DvQhAXmR18VSM10vyQfRXBUIcPP4L+0Hi0hocVy76AJFpuXHpEFhLfBk80Aku
         M8OWfHQe2FpaZQUv0Sb1/8Ed7Qt8ZNX5JphPoZSG8UxqePTywXdyC3/t8tc+rRuQYHH7
         A4f94cjPe9PmXvMi6mpzZqrjxne/sgs6utnNgbkF7yB0wQSidc692E83MobCYumVPXRE
         Szc8BBIJo8VinnMu+LRdD1XY9HJYRxJZxW5qQhYK+QyL5F6QSC9Iq5Zsufnojq81EI9X
         3obljXeEHi0UjmraSi9ZefUn3nMJyW3Op+I22M/NeqKY2S7VRkA+LU3umwralWODTHcc
         +u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714978370; x=1715583170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYbwDjo4JnZ5uHAXkvG9I+rCsMuqLE4wlNoSCofJHgs=;
        b=nUQlqqd6jfugeD0VZpYnPf94wPhR6aqgOMjfDO3nm2Ub2+IPZmJy2T5EJOWxa+gyPn
         PF1iGYhE4zAIB1czkDWJBIoJkiAHK/2hXYVf4+QLCJbeofn6mnozno/okN6C+LRt7Xsj
         HYWU90sPREFJl4RJlliGH8Kz+DsQcerrDhho8CP6mDPshGOFDbpuCel2hS2FOawJur6W
         Ke5CXkNdvGKSqknt73rLA2OxEPCXjduraz92QVpHe8jqUZpq4Qvq9MW9+URqwbTUH4Lb
         hG34U69SufXYh3bVEqLCIOEVKzoYPICmKTQSnQQxLzLx9KkGfv/EvLPYzAnqThcIY1Ao
         NkhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8gLYCalPnkugl3C+LhNhwOBPvSaQWl3HnhIhAitdYPKGR3ij7ha/IDSNPX01QnbCgqHzy/pY1PajoL+ErYy01vUAFa0b0XHGS
X-Gm-Message-State: AOJu0Yx+R15+Sjg2+R6F1bT+xAZAC3nzMCaOD8Yu1Keq6R/ho2KRVFb9
	NLbaXM9p733wnksu3lrxFCPZwSCg3f7WFWpiL3pBZk2VcStF1RoDM8VXVJ49MsNS9/QdrHkdtYk
	yseE/pUd20oAUw1KQY+TQZMCqzrijy5Hv4HB8eg==
X-Google-Smtp-Source: AGHT+IFOLblylb9TrnaoChByyT1UT9ZH6L3PmerBlWrS+9qDdstQZNljgAayMC5QIs6xOb8GpcS5/Xt855lSyd9iOHA=
X-Received: by 2002:a25:ef11:0:b0:de8:c277:1e72 with SMTP id
 g17-20020a25ef11000000b00de8c2771e72mr9131342ybd.1.1714978370131; Sun, 05 May
 2024 23:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503213441.177109-1-dianders@chromium.org>
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:52:39 +0200
Message-ID: <CACRpkdYbtfE9RLsDewV2UwnJknCp_sFEgc+cq=OF+Qd3tkTcwA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 00/48] drm/panel: Remove most store/double-check of
 prepared/enabled state
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Yuran Pereira <yuran.pereira@hotmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
	Purism Kernel Team <kernel@puri.sm>, Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 11:36=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
>
> This series attempts to do just that. While the original grep, AKA:
>   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> ...still produces a few hits after my series, they are _mostly_ all
> gone. The ones that are left are less trivial to fix.
>
> One of the main reasons that many panels probably needed to store and
> double-check their prepared/enabled appears to have been to handle
> shutdown and/or remove. Panels drivers often wanted to force the power
> off for panels in these cases and this was a good reason for the
> double-check.
>
> In response to my V1 series [1] we had much discussion of what to
> do. The conclusion was that as long as DRM modeset drivers properly
> called drm_atomic_helper_shutdown() that we should be able to remove
> the explicit shutdown/remove handling in the panel drivers. Most of
> the patches to improve DRM modeset drivers [2] [3] [4] have now
> landed.
>
> In contrast to my V1 series, I broke the V2 series up a lot
> more. Since a few of the panel drivers in V1 already landed, we had
> fewer total drivers and so we could devote a patch to each panel.
> Also, since we were now relying on DRM modeset drivers I felt like we
> should split the patches for each panel into two: one that's
> definitely safe and one that could be reverted if we found a
> problematic DRM modeset driver that we couldn't fix.
>
> Sorry for the large number of patches. I've set things to mostly just
> CC people on the cover letter and the patches that are relevant to
> them. I've tried to CC people on the whole series that have shown
> interest in this TODO item.
>
> As patches in this series are reviewed and/or tested they could be
> landed. There's really no ordering requirement for the series unless
> patches touch the same driver.
>
> NOTE: this touches _a lot_ of drivers, is repetitive, and is not
> really possible to generate automatically. That means it's entirely
> possible that my eyes glazed over and I did something wrong. Please
> double-check me and don't assume that I got everything perfect, though
> I did my best. I have at least confirmed that "allmodconfig" for arm64
> doesn't fall on its face with this series. I haven't done a ton of
> other testing.
>
> [1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6=
b234f89613b5cec0f14@changeid
> [2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.o=
rg
> [3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.o=
rg
> [4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.=
org

This is the right thing to do, thanks for looking into this!

As for the behaviour of .remove() I doubt whether in many cases
the original driver authors have even tested this themselves.
I would say we should just apply the series as soon as it's non-RFC
after the next merge window and see what happens. I doubt it
will cause much trouble.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

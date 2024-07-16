Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA65819E83D
	for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721161165; cv=none; b=sWatH1PUNOlRtRWz0NidLoiJ4OgTbfsxnxKGJZOkE8kjdaKbFxuOf/blwbs95ERv4V0uBhhWJgm1VfvGWDlozmWyBGJNj9jksLgX0oocuHvC327M+TO4oE1qPqaZV1s0lbRR8urzI5x9n7zIBbZgGxszt1pZoYaNb7PGK31N90A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721161165; c=relaxed/simple;
	bh=pXTBCm4RjQ9xxcqAkHioM89Yx2wooryHu3jCMtMWSpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDrM+ara5Yu05lTG+cxDN45jTMovF4jwo770qJPe/tgnnf4Mi/rKvfyyEoraC9tTjj3cHpMv6OqJVCk6G8eA7HWKWEuWpEGF0Hg8/uLK2EX546PLuTdQBkb4eAu0bQwFYBQa+I1hu8zX5TVCfTlVDw6HyU6h+2lE8lA2wS6JWjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nENLOjbo; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nENLOjbo"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52e976208f8so6498190e87.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721161162; x=1721765962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7rnxoOORbgKG3u1CwvViVAf3E43JRXh1BLDYP5Qb1M=;
        b=nENLOjbo68AI5OLRbHeHZT8VfY5PUZo31yLlgP4fzPAruK/pN4h2PVc7MDY/v2+DPt
         CUXe0SOTS0fBKEeCBU1wDpH3WtwtWxV6W0B0VIUZGcXDaxTVfu7ECOZMFMdyfbt6Oi1A
         VE5q+yyO6lV4bkl/25rDN2/7FAIji2v4bbVWDn911Y4MN/EpSGJDWDYrsbe1/WGaQZGb
         qOMY2c82SXPY70onzdmDHXYGNCUoLXiUW/XbXAFJSndgixx9tGVy0wNL2y9uw04wXb4c
         6yKLcyZnk1ha9W5PU14zbsDSwatNJgbpxzCmBqhXwZo2PegKmPtFmVo9KJQFWJzHvhaa
         +wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721161162; x=1721765962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7rnxoOORbgKG3u1CwvViVAf3E43JRXh1BLDYP5Qb1M=;
        b=Md6FI3uJAYZh4x7YWsPyJIWqBrFrHINQ7GShUIGKzpicJcWKUO5gLhXJMfJ/6NJybM
         ZF/qpbmgBFUCEafmlDQsNYe1T8+cQVHhzW0IoSX5la6TNenPUfJruzoG9Kd3YAOOtns1
         kVtv2ClhKkC6EiFpavE5K2QedKraOesVQSuSs42tGucikz6p9r307a8zSfP44KyB9Vjw
         JGY62OiXHSrlPrPu5TTOQ8nppzwCKP5JUo+Xu/xlE1HmeJs4Yq4NNRwgH79a2Qy2QFkF
         Awzz82naVCYxTJ9A99y9o/gpc4eLbjjOErfOV88rjvZibK6Ho+97j3kL4TDmTID26vNL
         pW8A==
X-Forwarded-Encrypted: i=1; AJvYcCUEJLXVxqs2DePxjUk+8nhhLNL1Ob9yCFqcMx4oGvPMmMZJXHspG1nZBnKawQHLQzEdEirlbImhVv3ktJwprqY7TOXTCoXs6ddj
X-Gm-Message-State: AOJu0YyYh19XYDyvEjmflnEDmdbv8FF8bkfBQWHJGRhwOqJc2hjRglTr
	rM9ximXip6BasGdHqzv/D8WCv9WbDO6MKnn4XpAJF+ob/ff1CH2AwmU61bVG5yLcQBNE7u5Ta6W
	Fex7EiGGd1J5n7jKlE+Jer4C66SJ1Xi3ochqR/Q==
X-Google-Smtp-Source: AGHT+IFR9vPzZCaRAsh1FMZTGXiS1AhwmINfoSqA8fEWvYjLsWq33v+6qCjuwBm59JwgPW2bYOjKGJ1lsdYdjsXqqhE=
X-Received: by 2002:a05:6512:3185:b0:52e:7f18:176b with SMTP id
 2adb3069b0e04-52edef0fddbmr2312562e87.11.1721161162024; Tue, 16 Jul 2024
 13:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
In-Reply-To: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Jul 2024 22:19:10 +0200
Message-ID: <CACRpkdaT=zjrKtqS7h4Fq1sLOJ1MoxW9K-wMfWqOmD68owj+Kg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Yuran Pereira <yuran.pereira@hotmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie <airlied@gmail.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 10:45=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:

> At shutdown if you've got a _properly_ coded DRM modeset driver then
> you'll get these two warnings at shutdown time:
>
>   Skipping disable of already disabled panel
>   Skipping unprepare of already unprepared panel
>
> These warnings are ugly and sound concerning, but they're actually a
> sign of a properly working system. That's not great.
>
> We're not ready to get rid of the calls to drm_panel_disable() and
> drm_panel_unprepare() because we're not 100% convinced that all DRM
> modeset drivers are properly calling drm_atomic_helper_shutdown() or
> drm_helper_force_disable_all() at the right times. However, having the
> warning show up for correctly working systems is bad.
>
> As a bit of a workaround, add some "if" tests to try to avoid the
> warning on correctly working systems. Also add some comments and
> update the TODO items in the hopes that future developers won't be too
> confused by what's going on here.
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This is the right thing to do.

Yours,
Linus Walleij

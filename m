Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A771A27A103
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201257; cv=none; b=UcmnVpk1eX0qSaWgOOZcRmfw7OycSJIHt8jKNR/0pjuDZL9p3El5p3wG8GR1yKVENP1M4rRbCUYBesOGqUuOAVwJ+p2pHUSpGmNJC0k2w2AUztWRcnlDW7Iajlxh17BECvt3T+F966IrhixgYXDkyxtfhsihHIWQ6nKxXD9IrN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201257; c=relaxed/simple;
	bh=9NhsPub8Dwc9EnXZIJv3NRiBAhBjEG9mmwT11504ntE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hI8pEMY3KJtCztyXJ5nYjOb0fl0hIPgwQrOYD4V2/oKoPav9P/11zex2ideD1eJ5gy80kDXrnIPTDt9+mfea2NPO0UyuWP2S18lxvUyf3nRmyXmsIB1PiSeLmQn82BT8yBPcjhfwGindlXFewmjA6cJQ5zGmQvHoqd3isfymJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XSOsjRh3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XSOsjRh3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23aeac7d77aso48393085ad.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753201253; x=1753806053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwHRFu4FSql/d/NwVvAy0lekcQX4lLK0gqetRRULkuc=;
        b=XSOsjRh3+SQUa7NE2KLrw2fV7LnvJFVNKp83cUcUPHc9UIkJOJVnpJSLTbsIbTO4HC
         NiK38T4zV4/HOMFPi2lNz6YjPd6Xv1eacfZZzGLjfIN5Dd7qFxOr2soA+4zBEz4Yeyp+
         wQiAuqbeGXAi+V2KTgpTbWzIJ/Vgl7/8RoK1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201253; x=1753806053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwHRFu4FSql/d/NwVvAy0lekcQX4lLK0gqetRRULkuc=;
        b=fpAdVumno3EbPxSwOtKkDHCKP08eldsz7AeKGjRx5DE89f4eF2n4nqOhXzN8t4CY5S
         uOlKENAcMLex4w46N+WUXZixIodeHbz/4TiR9YcIzi6HfK5BFl2gMUF4Pbr/SsmhIR4v
         SK5ouJq3y9/7cYlHcrBFkKm6BNy9jvzC/xE8WBPB03uT8CCKvItgEGBf08k0mcTdmBds
         23Zlkc53AVHQPUsPuU3mVkkktU1D3rlQEBEjCNv8BCT97fxs1fCYJdxDTbVUKcp6G7tr
         PHKOhMnknFkNM+83Rl9AWehNllhWhh8eDaAV1Fsg8N7eU1Lj6duh4Zpbp5rubd7cBy9m
         /YMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK3vVXeomHFl0jhjwQGyVnCorpxIk6r4DaKx9ClPydPwvM5SXEbU2cuQJTT48n+OWZmNisq5WjIwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGzR3EubeM2AyVMbpHeRSQedb4PodDW7wwn3HwSa9EFSCNsHZx
	yrF7uPZ7QVntuPxxrtYWAQ6uE79FToJDU7g9QhtlYaeaHuJN+WTIgg2rtPKCNyXHEZxEyaqHcL7
	mCOI=
X-Gm-Gg: ASbGncvELr2lWG5JoA5tz9rIxIvHgWS+i2y8EgzkpbScHgEX39hztZ/s9nvpKMs0QJ8
	kzWjtP51TguUzQeOq02cJjf74Li1jTP95ApxsBjqBsF48WHYdBLrnJ3bQFIjOoT5pWCO8cNuS4p
	5dBrc7+pJHXO2Fu9zuTfATJAp2CdK4hzu1zEFy0GFizRqB7p8a5Fg7p9jkTI/TipXoTbfxTZKw1
	IJKPPgpo/M4W3kilQp7RlS3rSJEVqO+2nz+EgY0Jg8y75mwW3+DXt7cTEMxMCYMzZCLOkCjIPzr
	I5SB/gS963dsGFmr+gm5gWK7nnu+bQk+hqpDTVhRsBuPZeo1lsqN1wFFz2ngCOxtOL2bvLOBh11
	iK/KT/mWA/FZ5skbBJZOhzvvNwetXLGu+XsIQc6CLP18A0s/SC5y00WtEJT6RxZ4zjQ==
X-Google-Smtp-Source: AGHT+IEPQwOgvSjFeiNle7zES35zCKtSrWGOGj5ns25oQCuj3UdoTMjg/RX5kZx99dLC/5Q38jwXDA==
X-Received: by 2002:a17:903:604:b0:23d:dd04:28e5 with SMTP id d9443c01a7336-23e24fbeef2mr240508335ad.34.1753201253408;
        Tue, 22 Jul 2025 09:20:53 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d8825sm79045855ad.169.2025.07.22.09.20.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 09:20:52 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b271f3ae786so4253929a12.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 09:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbaQm1upFfTHfFqd87Tob2Mj3PlMhEP0eg6wq3+oRIwiNpoJI9PnwE7PIXCucCr1t1qVYeVmNkARQ=@vger.kernel.org
X-Received: by 2002:a17:90b:3f8d:b0:316:d69d:49fb with SMTP id
 98e67ed59e1d1-31c9e70915amr41164532a91.14.1753201251543; Tue, 22 Jul 2025
 09:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722015313.561966-1-me@brighamcampbell.com> <20250722015313.561966-2-me@brighamcampbell.com>
In-Reply-To: <20250722015313.561966-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jul 2025 09:20:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGO5y0F40oaOANW-r-q5qZPFYRwO7aQHi3R6Ag-aeMag@mail.gmail.com>
X-Gm-Features: Ac12FXwtfJseOxsGp7nVtSJKfbTvysXVQqEuN_xMYIUstfIqb9Hrqert7fbtJBI
Message-ID: <CAD=FV=XGO5y0F40oaOANW-r-q5qZPFYRwO7aQHi3R6Ag-aeMag@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] drm: Create mipi_dsi_dual* macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jianhua Lu <lujianhua000@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 21, 2025 at 6:53=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Create mipi_dsi_dual, mipi_dsi_dual_dcs_write_seq_multi, and
> mipi_dsi_dual_generic_write_seq_multi macros for panels which are driven
> by two parallel serial interfaces. This allows for the reduction of code
> duplication in drivers for these panels.
>
> Remove mipi_dsi_dual_dcs_write_seq_multi definition from
> panel-novatek-nt36523.c to avoid the duplicate definition. Make novatek
> driver pass mipi_dsi_context struct as a pointer.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c                |  48 ++
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 804 +++++++++---------
>  include/drm/drm_mipi_dsi.h                    |  95 +++
>  3 files changed, 541 insertions(+), 406 deletions(-)

Just because I was curious and wanted to confirm my claim that this
would result in a nice space savings for novatek, I ran bloat-o-meter
on the novatek module comparing before and after your patch:

add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-8754 (-8754)
Function                                     old     new   delta
elish_csot_init_sequence.d                   758     379    -379
elish_boe_init_sequence.d                    846     423    -423
elish_csot_init_sequence                    9136    5380   -3756
elish_boe_init_sequence                    10192    5996   -4196
Total: Before=3D33880, After=3D25126, chg -25.84%

So the new way of defining mipi_dsi_dual_dcs_write_seq_multi() did
indeed give a pretty sweet space savings! :-)

This patch looks good to me now. Thanks for putting up with all my
requests. I know this is a lot bigger than you thought it would be
when you posted your first patch, but I appreciate you sticking with
it!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

My plan would be to give this series another week on the list. If
there is no additional feedback then I'll plan to land it.


-Doug

Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EDE2E62D4
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 16:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752856677; cv=none; b=TvyIOe14Iqu42b0B6kqQD0ghf2lX+cHKtiCy47gvK4VXk27NyNgY/xcjV6mzLsRcLsDsIAf7KDE1rKiDHtnZWDLI5/T+ukEEUtEOLMADi9nlaKCV8l28uC8d5N9itITivUv7I1pm56ezgWzof9fV2cF/J/L4pMssyN8hFQod9QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752856677; c=relaxed/simple;
	bh=kGsCAEDUAs7PcvVTlXcxhCu1WLo8mCBe+P9DDCN74Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tw8HLVCdxRO2W79z1CCjCSHBW4U6tw3+ZfHYRJkSnsLvESXNSkEHKoXOW435u/ZU2TLPRvxsNw06OxrFwobai3fFl/P3Ue12ATS5Oql/IbzuB9cqTQmS6KqrtEoB4XKp4mY1YtjUJP6kCjd8tkxsQjCAmKASooYmi2JpEQ5oWJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IvfBo/rB; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IvfBo/rB"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-73e810dc22dso713406a34.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 09:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752856675; x=1753461475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjMu1e4Z2kPIqjvwczTBgX85r3dXx3nHkHeoGheSPn8=;
        b=IvfBo/rBGWBN7WzUQtRYc7ZwZyM58oZZKBiOcdE1LcCWxDU6/Yy/AlG7p/t4t+OyNO
         iY1RBqv8X7QJqRgbHONZKsCWnP5u6IywD2M3p1xT05oJVcpQrvhlwHX8yo2NT/vzlPJY
         uiiZa11LSCj2YpBsMzzZ4g/xtJ2xYbU+Lf9eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856675; x=1753461475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjMu1e4Z2kPIqjvwczTBgX85r3dXx3nHkHeoGheSPn8=;
        b=hBjPljXofAmZAi//kxZasvqgT/PLFCzXqFbqsgDq8UTXLJFZX+BmnLV69tCsM2cs4s
         3468X6hOt+QIuR3mbynBNmnH5L2viisI4wAxMKDdXNSt3tY3MqDieAwQhmXa1Lbn+xhD
         IekDJj8Y67sdXOGRODXgmeXFfdlT1RCfFMvRCuGf2nNdeS6Lo98SG5chC8pyqPPk8r3u
         TRbo80e+LlvSgHXIt2gNPxSMMQ1oQmUBFkbY25JXxjGnSIOl5hDHYB+1qwxM0Pczvn8e
         YBfBTBUPaUUBNSNX4a3a8OCugsP8Yjvqb7kU/P9/wH9hDcZ6HhrR5himscjR6MeZ42Eb
         s0KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiPPZ376b3fVU8Mg572XA4wUtxBYjSZUT2lPTf0Uddjj9EzclUJZsyRJOh+N2uDOYpC0m9EHCD3bk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Vr1zYG5MxoJYKXAbt27R8F02elYScqdZ6Q6idfRymdF3TnCT
	l2l+L37AR55MrCQnf3lIPm6ImmzjaUNopKAtSHrlSjVKzl1RrBpNOtBhhx6uogSC8Wr+y6k784E
	l8G0=
X-Gm-Gg: ASbGnct/1n25H5GaZSdY07xI/x9uMpk1PZO1XEnGJXVvIZ5JlQrlxPGw92W+ij5Rmuv
	X9+tOde6xqgviuMuEXekRsxhvE31oZwByBjUbeae92q5Bq+FAi75bK5ep1oygSweRPN+p04mtRh
	N8XslXsImDJ37UZ/n2APcxO5nn1DqK9ImKsBXTI0fEEmw+7mtxACJcNon5s1yg1k9q//qKCAgFO
	+/588AKUXNYmylJX+AUYJtamTsuxYGgnqPve7F3Rkmr7utg48jaurVU4T+yXOqEBfJD74xD+qpS
	mQ56/uEJoIrqKseyLJ9QVZYDRZQPeVBKgzevKULI/EboV5q3E4GOnPReil4EPKrJJpvQzAKgCYC
	ywZcVbJtgSL3K/HmhZoxSAgkPbXnXRFcbdegXlpPowdem6C06nS1scmMiRsA32h8bAw==
X-Google-Smtp-Source: AGHT+IGcw20/Vhq/Q9txf5j50xAACbPNpalEdEx7aikCfQ2A96eMvimRSfRxh0HGuJUlkcKu5JN/9g==
X-Received: by 2002:a05:6a00:2302:b0:74c:f1d8:c42a with SMTP id d2e1a72fcca58-75725081370mr14797133b3a.13.1752855035646;
        Fri, 18 Jul 2025 09:10:35 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d582bsm1497991b3a.58.2025.07.18.09.10.33
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:10:34 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso2291137a12.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 09:10:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgTPubKZgMZcTjjuKW7X2j3CK/4XonlfGyFbKZ1P1Ri8ugwF0E3f0EXzLQYz0H/0JghVV2pi2TyMQ=@vger.kernel.org
X-Received: by 2002:a17:90b:2b4c:b0:311:eb85:96ea with SMTP id
 98e67ed59e1d1-31c9f3c5719mr16511405a91.9.1752855033213; Fri, 18 Jul 2025
 09:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com> <20250717164053.284969-2-me@brighamcampbell.com>
In-Reply-To: <20250717164053.284969-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Jul 2025 09:10:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
X-Gm-Features: Ac12FXz_prqGT_YDn81ubqDHwEClWFafCp94o67Bin1GS3o7VQCq9ZD3Qej-Cnw
Message-ID: <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] drm: Create mipi_dsi_dual macro
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 17, 2025 at 9:41=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Create mipi_dsi_dual macro for panels which are driven by two parallel
> serial interfaces. This allows for the reduction of code duplication in
> drivers for these panels.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  include/drm/drm_mipi_dsi.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 369b0d8830c3..03199c966ea5 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -431,6 +431,30 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi=
_multi_context *ctx);
>                 mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
>         } while (0)
>
> +/**
> + * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
> + *
> + * This macro will send the specified MIPI DSI command twice, once per e=
ach of
> + * the two interfaces supplied. This is useful for reducing duplication =
of code
> + * in panel drivers which use two parallel serial interfaces.
> + *
> + * @_func: MIPI DSI function or macro to pass context and arguments into
> + * @_dsi1: First DSI interface to act as recipient of the MIPI DSI comma=
nd
> + * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI comm=
and
> + * @_ctx: Context for multiple DSI transactions
> + * @...: Arguments to pass to MIPI DSI function or macro
> + */
> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
> +       _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
> +
> +#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
> +       do {                                           \
> +               (_ctx)->dsi =3D (_dsi1);                 \
> +               _func((_ctx), ##__VA_ARGS__);          \

nit: shouldn't func be in parenthesis for safety? It's unlikely to
really matter, but just in case it's somehow a calculated value that
would make it safe from an order-of-operations point of view.


> +               (_ctx)->dsi =3D (_dsi2);                 \
> +               _func((_ctx), ##__VA_ARGS__);          \
> +       } while (0)

Can you explain why you need the extra level of indirection here (in
other words, why do you need to define _mipi_dsi_dual() and then use
it in mipi_dsi_dual())? I don't see it buying anything, but maybe it's
performing some magic trick I'm not aware of?

Reading this with a fresh set of eyes, I also realize that this macro
is probably vulnerable to issues where arguments have side effects
since we have to repeat them. I don't think there's a way around this
and I think the macro is still worthwhile, but something to go into
with open eyes. Possibly worth noting in the macro description? We
could probably at least eliminate the need to reference "_ctx" more
than once by assigning it to a local variable. I think referencing
"_func" and "__VA_ARGS__" more than once is unavoidable...

Maybe this is what you were trying to solve with the extra level of
indirection, but (at least with my knowledge of the C preprocessor), I
don't think it does.


-Doug

Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831702E03E5
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753115452; cv=none; b=uXGMvADcZ9gbT/cQ+SEFGZBb4Aq8tp4cMkNSm1stzEju7aImyV/WEHbvW54Hj6QVNUBvhR9b4h0N3VWdNU3j0WR5BmZA7XtTRBIbp7K+E8UAWI4YY3CsKLKCeKVk0VihJjCUsotd6bRgQieN7dCigklL7jiLnvNAhjN1xZ+Pbqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753115452; c=relaxed/simple;
	bh=LcK4LIDhkpmNmzFtUfX5BsXG1e79f98fn51x8mcpMnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0vGfTbvdvg/AiXG8Xx5b1tBXUKCzcaiXfMhLcOezPUtFWP8pDalsxHQWtkTnzEDjHJZtc2zuQixlG+qcZpF57lII3ydjB5vqJCr3ZuEnkZCbYe3S1lNwBV4kTFV896cr4zk643SxoIrzfWDtRoE7daEBiy3mjRNpycIrdyH7fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b7Z0e0aO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b7Z0e0aO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-236377f00a1so37515345ad.3
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753115446; x=1753720246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1OthpiQLo0yn+Ex+1T1Nl8yMpcQVCC1Su5Bulvu4QQ=;
        b=b7Z0e0aOONvXPaHGb8wxS+7LuUABesDFBUtJZSQEvqOxAVcaki8X0ceb/Man28jyMH
         1QPt/G2zNcRSDTYHBbiMsQ37qTK7sTgYuuCUvUvOXF6+bnLAc2JSeMz0XBhMEgAMz2C7
         01QBrGjWMyPwOMFaexouqkXN+/K8q8Fu1Jfmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753115446; x=1753720246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1OthpiQLo0yn+Ex+1T1Nl8yMpcQVCC1Su5Bulvu4QQ=;
        b=ryE8UIXbfn2WhU3IVbSgT00r1FbZRTkkuVEkAOyHf/wYna2xVndM1zlNLp0OS8crbt
         4ZUngotlNkryp9OJqWIMOE+/Od2yJazzmBgPu6240CNrBCdCkJNgpeMP/MIoO+sRlNy5
         Fc+kZuJOGeDdFvV2PJxNRbDiw6jfGM/TJiCGkdj0DCkqv2GucHUCu9XDfg5W2wssS6Zi
         X76j8ax+pQCDLfWA1q/vnnywutgM7UTYknF/mOobc6hYf87YQwEYNwu1CVUUTpN09CIr
         a06qBWjBXQNETrADBzOiWnHYEII18qLbtVZk33+x2VfHxR7U7bXrGCfqeDZUzevnGDRY
         q2XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGtFwoRgOODVId1JELezCu0FuB1QWWbQ67c1Z9ZNKJld/BeQTAB6q71QVjqNlR2fkESTXmoYbcbGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzszZZAkOpfnhjVZrteT4584zlej9UCOlMtTzGIxbD7j4V7YNM+
	wq5oBmGj+eZcCi//tRP3bmg+Zo1O5Gcyg4Bi17PgIxWH49R33egj+GFefAe8Y/yi1JI7lJsy3gJ
	mUQQ=
X-Gm-Gg: ASbGncuTNTQ4hm75tzthsdHeI7ufKCthPAd2ggmDHop7HhFrCzDTJKj0ngaLiKo+qAM
	irGS6IFykl7juyDss6r0tichgZsRxZnbm7vdY7Cgq+pDJ5ZeT4bfq4zHqChhakObrB/BEAswUoi
	z2aRYKlchmbMR8h2ktvHNsxZgMDxHsouOuVoBGCmOX3fwtsXN+TvGnwqX7rMkBIkwHJKLUtNN/O
	IPdkEgiG6lozWzrgIjORy0rlmUHjWckIChsYac53v0b36UGkUQ91mB9IRptQnjfSR5PwkgO+CY9
	QEfm35etnyhXlNNPjARdOKiB/uH/xD5xr5+2pKygeV5vL9KLsjghmrZhURCK+aiuN34vY182u6H
	wHApJop8rnLC/4o1DznvsW4HC22wv2SzSoYKsRoJ2jf3RO5JE/UUjSKJp/nB4W33tsdRGeAFeF7
	mL
X-Google-Smtp-Source: AGHT+IEyUNfCRtPq8jq9g0k9PD9CXI1udRsV08aFRDZKoZ8fQspwPm1cI/BCSiczrw2KMKFbvwpBMg==
X-Received: by 2002:a17:903:1a84:b0:234:8a4a:ada5 with SMTP id d9443c01a7336-23e24f59832mr285084265ad.37.1753115446146;
        Mon, 21 Jul 2025 09:30:46 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d23b5sm60727005ad.146.2025.07.21.09.30.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 09:30:44 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235a3dd4f0dso27689425ad.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 09:30:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXi3ja8K/WNQYAsmPpXPI9nr0yepG1SsAZwhjFLDO9OLzpnrStk3pnz7oEkJSZFjcXlBA8ncNGUG0Q=@vger.kernel.org
X-Received: by 2002:a17:903:3bcc:b0:235:f298:cbbe with SMTP id
 d9443c01a7336-23e24edc278mr357296245ad.12.1753115443448; Mon, 21 Jul 2025
 09:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250719082639.307545-1-me@brighamcampbell.com> <20250719082639.307545-2-me@brighamcampbell.com>
In-Reply-To: <20250719082639.307545-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Jul 2025 09:30:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xzno3ReSyp9w+DC+nLoy1AXmcwd+j1=_XRxFi_k+bmng@mail.gmail.com>
X-Gm-Features: Ac12FXy9MlSRxUz0cgfvqURcfFQN33HCDR1ifsxTc8_3lTfiq4MM633TTSdKa88
Message-ID: <CAD=FV=Xzno3ReSyp9w+DC+nLoy1AXmcwd+j1=_XRxFi_k+bmng@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
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

On Sat, Jul 19, 2025 at 1:27=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> @@ -827,6 +827,30 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_mu=
lti_context *ctx,
>  }
>  EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
>
> +/**
> + * mipi_dsi_dual_generic_write_multi() - mipi_dsi_generic_write_multi() =
for
> + * two dsi channels, one after the other
> + * @dsi1: First dsi channel to write buffer to
> + * @dsi2: Second dsi channel to write buffer to
> + * @ctx: Context for multiple DSI transactions
> + * @payload: Buffer containing the payload
> + * @size: Size of payload buffer
> + *
> + * A wrapper around mipi_dsi_generic_write_multi() that allows the user =
to
> + * conveniently write to two dsi channels, one after the other.
> + */
> +void mpi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,

BUG: above should be "mipi", not "mpi"


> +                                     struct mipi_dsi_device *dsi2,
> +                                     struct mipi_dsi_multi_context *ctx,
> +                                     const void *payload, size_t size)
> +{
> +       ctx->dsi =3D dsi1;
> +       mipi_dsi_generic_write_multi(ctx, data, len);

BUG: "data" and "len" are not valid local variables...


> @@ -431,6 +439,87 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi=
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
> + * WARNING: This macro reuses the _func argument and the optional traili=
ng
> + * arguments twice each, which may cause unintended side effects. For ex=
ample,
> + * adding the postfix increment ++ operator to one of the arguments to b=
e
> + * passed to _func will cause the variable to be incremented twice inste=
ad of
> + * once and the variable will be its original value + 1 when sent to _ds=
i2.

It could be worth also pointing people to
mipi_dsi_dual_generic_write_seq_multi() and
mipi_dsi_dual_dcs_write_seq_multi() below?


> + *
> + * @_func: MIPI DSI function or macro to pass context and arguments into

nit: remove "or macro".


> + * @_dsi1: First DSI interface to act as recipient of the MIPI DSI comma=
nd
> + * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI comm=
and
> + * @_ctx: Context for multiple DSI transactions
> + * @...: Arguments to pass to MIPI DSI function or macro
> + */
> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
> +       do {                                                     \
> +               struct mipi_dsi_multi_context *_ctxcpy =3D (_ctx); \
> +               (_ctxcpy)->dsi =3D (_dsi1);                        \

nit: now that "_ctxcpy" is a local variable you no longer need the
extra parenthesis around it.


> +               (_func)((_ctxcpy), ##__VA_ARGS__);               \
> +               (_ctxcpy)->dsi =3D (_dsi2);                        \
> +               (_func)((_ctxcpy), ##__VA_ARGS__);               \
> +       } while (0)
> +
> +/**
> + * mipi_dsi_dual_generic_write_seq_multi - transmit data using a generic=
 write
> + * packet to two dsi interfaces, one after the other
> + *
> + * This macro will send the specified generic packet twice, once per eac=
h of
> + * the two interfaces supplied. This is useful for reducing duplication =
of code
> + * in panel drivers which use two parallel serial interfaces.
> + *
> + * Note that if an error occurs while transmitting the packet to the fir=
st DSI
> + * interface, the packet will not be sent to the second DSI interface.
> + *
> + * This macro will print errors for you and error handling is optimized =
for
> + * callers that call this multiple times in a row.
> + *
> + * @_dsi1: First DSI interface to act as recipient of packet
> + * @_dsi2: Second DSI interface to act as recipient of packet
> + * @_ctx: Context for multiple DSI transactions
> + * @_seq: buffer containing the payload
> + */
> +#define mipi_dsi_dual_generic_write_seq_multi(_dsi1, _dsi2, _ctx, _seq..=
.)     \
> +       do {                                                             =
       \
> +               static const u8 d[] =3D { _seq };                        =
         \
> +               mipi_dsi_dual_generic_write_multi(_dsi1, _dsi2, _ctx, d, =
       \
> +                                                        ARRAY_SIZE(d)); =
       \

nit: the indentation of ARRAY_SIZE() is slightly off.


> +       } while (0)
> +
> +/**
> + * mipi_dsi_dual_dcs_write_seq_multi - transmit a DCS command with paylo=
ad to
> + * two dsi interfaces, one after the other
> + *
> + * This macro will send the specified DCS command with payload twice, on=
ce per
> + * each of the two interfaces supplied. This is useful for reducing dupl=
ication
> + * of code in panel drivers which use two parallel serial interfaces.
> + *
> + * Note that if an error occurs while transmitting the payload to the fi=
rst DSI
> + * interface, the payload will not be sent to the second DSI interface.
> + *
> + * This macro will print errors for you and error handling is optimized =
for
> + * callers that call this multiple times in a row.
> + *
> + * @_dsi1: First DSI interface to act as recipient of packet
> + * @_dsi2: Second DSI interface to act as recipient of packet
> + * @_ctx: Context for multiple DSI transactions
> + * @_cmd: Command
> + * @_seq: buffer containing the payload
> + */
> +#define mipi_dsi_dual_dcs_write_seq_multi(_dsi1, _dsi2, _ctx, _cmd, _seq=
)   \

BUG: doesn't "_seq" need to be "_seq..." ?

BUG: You need to remove the definition of this macro from
`panel-novatek-nt36523.c` or else it won't compile anymore since the
name of your macro is the exact same as theirs and they include this
header file. It would be OK w/ me if you squashed that into the same
patch since otherwise rejiggering things would just be churn...

I guess we also chose different argument orders than they did (that's
probably my fault, sorry!). They had the "ctx" still first and this
patch consistently has "dsi1" and "dsi2" first. I don't think it
really matters, but we should be consistent which means either
adjusting your patch or theirs. It's probably worth confirming that
the novatek driver at least compiles before you submit v6.


-Doug

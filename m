Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756B17464
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 21:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529605; cv=none; b=tIMdqpJAxcz0P9VTeHc+I3/ccAmQVgDWQUraQv00xhh6MLFnsT0NrecJmH1IU2iKzWM3mw8QghzYQz96eqiLchpx53w0EvxXZPqNpI4DOLzrT7uphWfmE5m2mglW9vRg/6Fh/MrIx+v8mbYVdmkDJj4SlR9/Jh/e86kJ3q6ig2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529605; c=relaxed/simple;
	bh=SsTayAz/zyih+6HafJMOO48aeh1nB7R+B7s9JLkxcNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHPwyTJijTwf7W2XqMuO/WlM0Tbjx4U8LQJwMay3qtliBLOY8RB7SCRRaCKhmXjJOmzT0t3juIpTB/xaieD0WYfuht+2/siFyqUUZb44HccAo17xhW0ULmV0qS0d/k+rGcNlMAFyRRz5rEp5lEV3QGoRwj7sm8D6q3hZaaWMsj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dOc19xVR; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dOc19xVR"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c7a52e97so3886753b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 14:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752529602; x=1753134402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf6x+HhC3zd0NIuTq8d9fQYj/uBrB2VbMZ8az8HSz24=;
        b=dOc19xVRqnsQE/AC3S9Z9taHm5prOtClGpmtZrgJhxj072Lc2Yp4Bcd2AsawoqdU3e
         TVoNj4HrmtaERxx2WkPR1eINoZwpG/LM47d6vn5P8oCyeFe8IburcVwEDJOAhMfPSe+s
         T4XfqmrdZlGew4D5UDzC13fQBSo3TxcxASv+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752529602; x=1753134402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nf6x+HhC3zd0NIuTq8d9fQYj/uBrB2VbMZ8az8HSz24=;
        b=XMaLGlonfohkd7uh4PnJvLQmas/z5S2s4V7ibG8S4lwGykJ/6Mt/FpERchYW2no3f8
         Rb2Z2LNIkf4lb5KLyHQNGELYHwss2NRmVgNVi4LI/FR/1NaCxf8Un6PL0LjJmBNYiuQU
         FE8/gVff+V9jQJ9lbBke/4mD+zRrwyvmnXV6vG30jFMnFjhylOR9ll0907h2TZ4fgpiy
         0yJOn+62g66PUuWIyakaVmJJMXXH2acbLWvQYsbhS8u6Ye3dwsRO+NUZc4IDZOoG2oIu
         rtD8krV/6DqTAYudXwZv3fCtZDokIFi+j3X0rCDXvQjZO/SD0ISPGR33mU0TLrgisBMY
         OEdg==
X-Forwarded-Encrypted: i=1; AJvYcCW5qS9aiEvWjypEbPpWIQ6abX+/5rkk4WDMUYgg43q67zvSdnUdl7YQPz/Uw7dejwVZu56DR7nCkeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKkqSBSvCDR//6Ip74F8frLJUBaF3HhI032ge9X1xyL0TbOvCN
	PF1z2SSdXLCPYv8tcTBL4xJGB3tW4sE6jqDztbWfm58CA8H1wMaS+J9GqG5nFNyDCAQE4jHCUW1
	QLM8=
X-Gm-Gg: ASbGnctYA/oekUmFUFE8zMip8SpH3ZYfjEPVGLLVYZ4gI1yhSJVIRhVeUn/rCOJuom0
	qUPsysp+9aawjhEfWeJZ0afVm9SWKKH7OCPMuApN8SV2VWXxuj5dCtQI4Q3XwZlLKJKoBEn26T6
	f3a2BAZcMMT/Xy/XTADTyKg5hgDPG4blPpD8FzVbQSn3U37pbwK+UTe7Z71b0lZRZAN7hclENLt
	YiX3yv2yxLMAwi8nrLcCAOQylyGNJljRRBTH12P7a4qtSIw+E9OpB26D0dXalpZmJ1iP4gxgkaC
	Ixsl/kKYYpYBzTk97ndQFFfk2ef/SuZA78O9PJ5ATqrLV5Dd9y1h6o3J0EYYrqUKTYac9eLuVCL
	9HaIMkxgmllggdKIGKXfXfT1pNS3UHqn/L7yMlN+YQYjILLMoDQrNBMj0kTKyeg==
X-Google-Smtp-Source: AGHT+IHsxE4StZ6NoNko4NmnzISDib0UeeYhEhJvO2bu5+2t+zp/nTBzDmjucutKoa107r+W+Pnyyg==
X-Received: by 2002:a05:6a21:33a4:b0:234:28d7:b8fa with SMTP id adf61e73a8af0-23428d7baeamr12067926637.40.1752529601940;
        Mon, 14 Jul 2025 14:46:41 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f7fc0dsm11493508b3a.146.2025.07.14.14.46.41
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 14:46:41 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so4153430a91.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 14:46:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqUxS1LUyBl2knMvusT/Hd8+Dg0pHLI46uB2K6zcswB6ZBYeYSlnfwnIBZkjV/B11taoPiukA7OFc=@vger.kernel.org
X-Received: by 2002:a17:90b:5844:b0:311:a314:c2dc with SMTP id
 98e67ed59e1d1-31c4ccceb76mr25097897a91.14.1752529600346; Mon, 14 Jul 2025
 14:46:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708073901.90027-1-me@brighamcampbell.com> <20250708073901.90027-2-me@brighamcampbell.com>
In-Reply-To: <20250708073901.90027-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 14:46:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UaNsMRqv_ncr-Xr9pVQGAxUtwwQPmv7h=xqv6RtDUvmg@mail.gmail.com>
X-Gm-Features: Ac12FXwEXFjZNLsblVCVjjFbPn_m7MCfT9M3S1y3Xdmbs1FX9LqidIJ3hvlhjnw
Message-ID: <CAD=FV=UaNsMRqv_ncr-Xr9pVQGAxUtwwQPmv7h=xqv6RtDUvmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel: jdi-lpm102a188a: Update deprecated MIPI
 function calls
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Update jdi-lpm102a188a panel driver to use the "multi" variant of MIPI
> functions in order to facilitate improved error handling and remove the
> panel's dependency on deprecated MIPI functions.
>
> This patch's usage of the mipi_dsi_multi_context struct is not
> idiomatic. Rightfully, the struct wasn't designed to cater to the needs
> of panels with multiple MIPI DSI interfaces. This panel is an oddity
> which requires swapping the dsi pointer between MIPI function calls in
> order to preserve the exact behavior implemented using the non-multi
> variant of the macro.

Right. We dealt with this before with "novatek-nt36523"...


> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 160 +++++++-----------
>  1 file changed, 59 insertions(+), 101 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/=
drm/panel/panel-jdi-lpm102a188a.c
> index 5b5082efb282..5001bea1798f 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> @@ -81,25 +81,20 @@ static int jdi_panel_disable(struct drm_panel *panel)
>  static int jdi_panel_unprepare(struct drm_panel *panel)
>  {
>         struct jdi_panel *jdi =3D to_panel_jdi(panel);
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx;
>
> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link1);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to set display off: %d\n", re=
t);
> -
> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link2);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to set display off: %d\n", re=
t);
> +       dsi_ctx.dsi =3D jdi->link1;
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       dsi_ctx.dsi =3D jdi->link2;
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>
>         /* Specified by JDI @ 50ms, subject to change */
>         msleep(50);

Needs to be mipi_dsi_msleep() to avoid the sleep in case the above
commands caused an error.


> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n", r=
et);
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n", r=
et);
> +       dsi_ctx.dsi =3D jdi->link1;
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       dsi_ctx.dsi =3D jdi->link2;
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);

I think you need this here:

if (dsi_ctx.accum_err)
  return dsi_ctx.accum_err;

...otherwise the code will do the sleeps, GPIO calls, and regulator
calls even in the case of an error. You don't want that. Then at the
end of the function you'd just have "return 0;"


>  static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
>                                        struct mipi_dsi_device *right,
>                                        const struct drm_display_mode *mod=
e)
>  {
> -       int err;
> +       struct mipi_dsi_multi_context dsi_ctx;

I think you should actually pass in the "dsi_ctx" to this function
since the caller already has one. Then you can change it to a "void"
function...


>  static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
>  {

I think you want to pass the context into this function too and make
it "void". Then the caller doesn't need to check for the error before
calling it...

Then the "msleep(150)" after calling this function can change to a
`mipi_dsi_msleep()` and you don't need to check the error until right
before the LPM flag is cleared...


> +       struct mipi_dsi_multi_context dsi_ctx;
> +
>         /* Clear the manufacturer command access protection */
> -       mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
> +       dsi_ctx.dsi =3D jdi->link1;
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>                                    MCS_CMD_ACS_PROT_OFF);
> -       mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
> +       dsi_ctx.dsi =3D jdi->link2;
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>                                    MCS_CMD_ACS_PROT_OFF);

All the duplication is annoying. In "novatek-nt36523" I guess we only
needed to send _some_ of the commands to both panels and so we ended
up with a macro in just that C file just for
mipi_dsi_dual_dcs_write_seq_multi(). ...but here you seem to be
needing it for lots of functions.

Maybe the solution is to add something like this to "drm_mipi_dsi.h":

#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, _args...) \
  do { \
    (_ctx)->dsi =3D (_dsi1); \
    (_func)((_ctx), _args); \
    (_ctx)->dsi =3D (_dsi2); \
    (_func)((_ctx), _args); \
  } while (0)

Then you could have statements like:

mipi_dsi_dual(mipi_dsi_generic_write_seq_multi, jdi->link1,
jdi->link2, &dsi_ctx, ...);

I _think_ that will work? I at least prototyped it up with some simple
test code and it seemed to work... What do others think of that?

-Doug

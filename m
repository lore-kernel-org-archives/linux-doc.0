Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5947F1DFFB
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 12:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761787; cv=none; b=q+S3TAjdEsHLzxu0GfnEoHJTZ2At5+n7F2fNjKYyupYqEALoE4nPyyEwRX+tv4B6sAtrC9TesLHppCyQHNjR4Ez9VxoCfQhFk9DOoqMROvVLKQejTtZet5iQhcp+MP1bphVlodT8IEOO9sKV+hJqiMGeWhPbAyXAiYNEVBIW61w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761787; c=relaxed/simple;
	bh=Ir8txI41duHjjdUa1tYJv/Mb4slAcXRYTZiQjfKa4u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CyxPc7FImSic2Vdiv4Ao2Ny/f3/bx5EZIPd0SZ41olD85ViLrQ4nKk+1hx+bKPghIpyFo5mlBpz8aGxcHO9DPhsnbQZAzEjCSYkNgt+MCfqn2KH0v67xUX2ASy8ePySicPxNxYuBEPHywP6chVb/U+JWQOiOBHW2dUArqYO3Q88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-73720e58dafso1622908137.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 05:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761785; x=1786366585;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGVqxVKLC2Gks94xayPEyUqyvnJiYIaVHNXa8plDaec=;
        b=L+u52RTVzCAWnZS0eun8JSvgou8zo7s9mp7T+55sQL0c0kTbtTPBE9ASJYXL0UJXVf
         5NhVnA/+NEKF9aXu3Xro14zLQF7kBkpPxMt1SgCCrxotaIeo594/8hPMQ2zoShtiPxdW
         8/50RI+KUYVMWrNpb6ySIVhmsHTnjQ7WZb+HDJDAhPrrcBrmh2yk/sjeF0en9nhxOcpp
         oo5bYfPufsZlZoVBjbnMD8SswX4Lvg3/klIa7VfA2iTjYze9z3q64ilXIbK8TbjMCkTD
         yEBe8+NE/dQO8gOx6Gu6yJUQFdlW2U7zkgM3kmgjiklGfvnxD55tCNn+ROsPMoKfzFOl
         yEGg==
X-Forwarded-Encrypted: i=1; AHgh+RrtnwiCAZAyoQDvtacK1dC+s8vaFinTLisXPYtT5afQRuNnG2QqMSLdTTd1QlK+QD1htewbWVqLLV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPtTdFaWYvYKHxvVSGMSfPNkRKWwojJmZ/WezmZFjvIud4esgY
	YTgZPjLiZ14mrqjMGTdjYYyFzMHIiyCGVWMvRLH39H52fkx7R4iS2HG6oZHpw5d/
X-Gm-Gg: AR+sD10WlvddauNF9ptBbRf9pqKijgQ8tAHaOz/HtB51Na4JI2S6ML8CM0YJqb7mYf2
	++1oB3xu+S+WgTBldLe9iyDvz9umVrq1ETVhMmF1zRs6Rhfe30pT44EMQQt91zhiOpGkx4b7VcX
	lixuzLUb4tKrC+Il8T0Xa4m0hWoUyagQyu+e3DZwUWtsx+D8zkmYN4Q1bMLCZjxjAIdIu1Dz20W
	E/czvd5DQlRA7rXqK7rfyjt0Guu2Kg6TSQvQS7VsGALTy/MBLpd3FU2jjd6e7wvUyZAdd2YCNAo
	KnuT5NBR6DGWqM2KVUm4mzpZ18iS7Dpq+2LcrndxeMs+EagGQh98RsFUcTnW/2KbwHXF5V23rOT
	aNU62wVh2FvHdqvX5FBPQhGL5QPgDXx7BRqRZ7LBZMJ8HMnYyk+3iI+sUx74obR++lykCdRSivz
	ZhZ0rqZgeS2Y1xisnJdeEfzBuj1KLzmE3gGioQ7+ir20zQPltuF11AerBfo1uInhOTRZSxY/DGZ
	v9R8kcfRzlW/13jGWQ0wzhjFw==
X-Received: by 2002:a05:6102:41a9:b0:740:2bcd:24d2 with SMTP id ada2fe7eead31-75b2245a880mr7913323137.5.1785761785175;
        Mon, 03 Aug 2026 05:56:25 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977e6a40a5csm6346432241.10.2026.08.03.05.56.25
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:56:25 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-74d55dac06eso1885066137.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 05:56:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr1yC7YMcWa3dw1g0CMVZPGXi6hN1QIz5dWJEziyzbv+QPe2Mfr66omsVbFRZCGK9ACUSZaWdRYSFM=@vger.kernel.org
X-Received: by 2002:a05:6102:6a83:b0:729:affa:70fd with SMTP id
 ada2fe7eead31-75b2295c6d6mr7103654137.8.1785761305110; Mon, 03 Aug 2026
 05:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 14:48:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
X-Gm-Features: AUfX_mz7dUNKx_CkXmX2bBiqeRWfQJXaKympC5b4Q722_mZANMq2M_rTZsMnNYo
Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Michal Simek <michal.simek@amd.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Diogo,

On Mon, 20 Jul 2026 at 17:41, Diogo Silva <diogompaissilva@gmail.com> wrote:
> The simple KMS helpers are deprecated because they only add an
> intermediate layer between drivers and atomic modesetting.
>
> Open-code drm_simple_encoder_init() by calling drm_encoder_init()
> directly and providing driver-local drm_encoder_funcs.
>
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c

> @@ -29,7 +30,6 @@
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
>
>  #include <video/videomode.h>
> @@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
>         .mode_fixup = shmob_drm_encoder_mode_fixup,
>  };
>
> +static const struct drm_encoder_funcs shmob_encoder_funcs = {

Nit: shmob_drm_encoder_funcs?

> +       .destroy = drm_encoder_cleanup,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Encoder
>   */

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

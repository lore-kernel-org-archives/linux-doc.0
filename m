Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224CFC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 10:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D59FC64F41
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 10:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhCRKjZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 06:39:25 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:40612 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhCRKjT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Mar 2021 06:39:19 -0400
Received: by mail-vs1-f50.google.com with SMTP id l4so1260496vsc.7
        for <linux-doc@vger.kernel.org>; Thu, 18 Mar 2021 03:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tAvzu8nz5iln6WgpiSW86z6S3Eft+tfyr3DeEjUUSh8=;
        b=k3wEmRBiSHmqdvT1QxLdAhoUDT/77wkvMAcZzDurHsx1lJHYY8pHxBO8twyMELRH+/
         C0/FKOD2N3OJWhhx71NHO8ayvYrbrNaDWFXpFOGQ9DpKbbq6HrKeP+Kd4gd4hBaIVHVs
         HwEVDQHG1aSWswRgqlBXVozTJT0AIx4iONWP65y2ieY3iHqY0mn1luzpAUun+3dWAYhT
         E6u1EEKn2+c50QO2MuByhT0SsWAb8luCPRGjhJ6+N0YDFBvFiJ8wXP56wnWBBwQMt8qk
         IgLfduzft2hwvWEV7yc2j22yao66mqmz2+gYYd3FKR9NPt0FFxZoXd/zHCzs7V7GQV9H
         EsVw==
X-Gm-Message-State: AOAM531nvc2SiB47cVXTtythKuDPDu4NQ4QnzVhiQY7yqgPuSWVVf1E2
        kBED95xkZy/PegESv/AGREmbLF6DwbhgWv/fagU=
X-Google-Smtp-Source: ABdhPJyLRkuI65bcr5OT1r++d1vw1tuL9YMffz3SQ5rZYOlZEhaTfC7OjKL8YtBiPs1j+K6eLMB172cH0IogWEpFT0k=
X-Received: by 2002:a67:ef0e:: with SMTP id j14mr5704768vsr.40.1616063958823;
 Thu, 18 Mar 2021 03:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210318102921.21536-1-tzimmermann@suse.de> <20210318102921.21536-9-tzimmermann@suse.de>
In-Reply-To: <20210318102921.21536-9-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Mar 2021 11:39:07 +0100
Message-ID: <CAMuHMdVa6hw89zr5nRFaKG0sZYLXdTOktGN7pU2LiAPPbsHEdw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device node
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        bluescreen_avenger@verizon.net,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Thomas,

On Thu, Mar 18, 2021 at 11:29 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Make sure required hardware clocks are enabled while the firmware
> framebuffer is in use.
>
> The basic code has been taken from the simplefb driver and adapted
> to DRM. Clocks are released automatically via devres helpers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: nerdopolis <bluescreen_avenger@verizon.net>

Thanks for your patch!

> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c

> +static int simpledrm_device_init_clocks(struct simpledrm_device *sdev)
> +{
> +       struct drm_device *dev = &sdev->dev;
> +       struct platform_device *pdev = sdev->pdev;
> +       struct device_node *of_node = pdev->dev.of_node;
> +       struct clk *clock;
> +       unsigned int i;
> +       int ret;
> +
> +       if (dev_get_platdata(&pdev->dev) || !of_node)
> +               return 0;
> +
> +       sdev->clk_count = of_clk_get_parent_count(of_node);
> +       if (!sdev->clk_count)
> +               return 0;
> +
> +       sdev->clks = drmm_kzalloc(dev, sdev->clk_count * sizeof(sdev->clks[0]),
> +                                 GFP_KERNEL);
> +       if (!sdev->clks)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < sdev->clk_count; ++i) {
> +               clock = of_clk_get(of_node, i);
> +               if (IS_ERR(clock)) {
> +                       ret = PTR_ERR(clock);
> +                       if (ret == -EPROBE_DEFER)
> +                               goto err;
> +                       drm_err(dev, "clock %u not found: %d\n", i, ret);
> +                       continue;
> +               }
> +               ret = clk_prepare_enable(clock);
> +               if (ret) {
> +                       drm_err(dev, "failed to enable clock %u: %d\n",
> +                               i, ret);
> +                       clk_put(clock);
> +               }
> +               sdev->clks[i] = clock;
> +       }

of_clk_bulk_get_all() + clk_bulk_prepare_enable()?

There's also devm_clk_bulk_get_all(), but not for the OF variant.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

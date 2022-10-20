Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1584C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 19:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiJTTBY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 15:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJTTBW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 15:01:22 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAA518C418
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 12:01:20 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id bb5so207221qtb.11
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 12:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XGP70LIojmiBdpWyY18Ji96dZrMFDXretdATsr1AZcY=;
        b=NWO+rqeS7dhX43MQjgRg4fiqteF99/HlBWBg3L01vDu7MG2Wud+a9nJfABHAExLr5M
         Hi9OMw0I7yWgUjemerWxh3IJnv4YzM5rga/BpU34Z4j1pbGB5q/fm7tKbXMCC/5GRNvS
         /hfQXQHqUWejoJafdDdM1iiDuclnsLSzyVnlecv89XpB6G32GQElASu7fAS0xN2GZ9vd
         fWqm3l8uHCbHc+qpGMMQgSRF+Gfk6JU921o8QtJqcSmSOhFP8w6P6+BmTNsA3GNNYvNH
         3/uzYShpyckbXN+cu68ddhWMcPsglpQNkNeazR7qiSuKQ/HigTMyayLFyyXb5tSeF0/4
         hFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGP70LIojmiBdpWyY18Ji96dZrMFDXretdATsr1AZcY=;
        b=1qdiPx8cl1VelitULjf+XM15TvR37WFXp4U1wFoRQ3YCaBpGkfIKjU9Tw/BCZhVnk/
         us3dtrLIjD8Kgs8OY2vObYx0cu1CeHBvK8tARw/0ATP90QD2hI7SnIwLkHXGFgwkxc7A
         rEgnGv7WuqZ/zQNyRqmMUln7F//So0AP2SmWZuqh/1xpWA9KnJAzuVUjV5dEV5CEjmnK
         SHLNlxkEC4itHlcCYs/OcadoDL2DNOZS9607GPffRDoYvfiePALLyEcCjZ9gyF+oMF6K
         Lc0QySZVtA/qqwfXeWGATuSYY5isqeJxXkE2m46TJe0+dGRifHTL8FcpXtwwmvZvDQ5X
         M4tA==
X-Gm-Message-State: ACrzQf17v2sQUsneYBZ4pXVXrQUekWsinxQTF8ReJvW0nQIAr80KG0tL
        2nx7YIWNbdDGnEZXDLwIMmjD+I07y9pWLPzyu2Q=
X-Google-Smtp-Source: AMsMyM7pRtQAcuQfcpM2PgAMubFXqpQhRb1r00K3+Mci5PPhA6uivzscz5DWGeA61iiWIXSmgIpmYLLGLp27ixXFZWQ=
X-Received: by 2002:ac8:7c46:0:b0:39c:fa92:a27a with SMTP id
 o6-20020ac87c46000000b0039cfa92a27amr10208723qtv.61.1666292479731; Thu, 20
 Oct 2022 12:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com> <20221020175334.1820519-5-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-5-maciej.kwapulinski@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Oct 2022 22:00:43 +0300
Message-ID: <CAHp75VeFDYjmoJzbC5z8Kf=xYxsVASxjwGBB3OPvBMMPsQDjtw@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] gna: initialize MMU
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:
>
> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
>
> Setup MMU in the driver with a new memory component.

...

> +#define GNA_FEATURES                                           \
> +       .max_hw_mem = 256 * 1024 * 1024,                        \

SZ_256M ?

> +               .num_pagetables = 64,                           \
> +               .num_page_entries = PAGE_SIZE / sizeof(u32),    \
> +               /* desc_info all in bytes */                    \
> +               .desc_info = {                                  \
> +               .rsvd_size = 256,                               \
> +               .cfg_size = 256,                                \
> +               .desc_size = 784,                               \
> +               .mmu_info = {                                   \
> +                       .vamax_size = 4,                        \
> +                       .rsvd_size = 12,                        \
> +                       .pd_size = 4 * 64,                      \
> +               },                                              \

> +       }

Broken indentation?

...

> +#define GNA_DEV_HWID_CNL       0x5A11
> +#define GNA_DEV_HWID_EHL       0x4511
> +#define GNA_DEV_HWID_GLK       0x3190
> +#define GNA_DEV_HWID_ICL       0x8A11
> +#define GNA_DEV_HWID_JSL       0x4E11
> +#define GNA_DEV_HWID_TGL       0x9A11
> +#define GNA_DEV_HWID_RKL       0x4C11
> +#define GNA_DEV_HWID_ADL       0x464F
> +#define GNA_DEV_HWID_RPL       0xA74F
> +#define GNA_DEV_HWID_MTL       0x7E4C

Keep them sorted?

...

> +       for (i = 0; i < mmu->num_pagetables; i++) {
> +               pagetable_dma = mmu->pagetables_dma[i];
> +               pgdirn[i] = pagetable_dma >> PAGE_SHIFT;

PFN_DOWN()

> +       }

...

> +       desc_size = round_up(gna_priv->info.desc_info.desc_size, PAGE_SIZE);

PFN_UP() ?

...

> +       mmu->pagetables = drmm_kmalloc_array(&gna_priv->drm, mmu->num_pagetables, sizeof(*mmu->pagetables), GFP_KERNEL);

> +

Redundant blank line.

> +       if (!mmu->pagetables)
> +               return -ENOMEM;

...

> +static const struct gna_dev_info cnl_dev_info = {
> +       .hwid = GNA_DEV_HWID_CNL,
> +       GNA_GEN1_FEATURES

Leave a comma at the end. Same for all similar declarations.

> +};

...

> +#define INTEL_GNA_DEVICE(hwid, info)                           \
> +       { PCI_VDEVICE(INTEL, hwid), (kernel_ulong_t)(info) }

Drop this and use PCI_DEVICE_DATA() instead.

-- 
With Best Regards,
Andy Shevchenko

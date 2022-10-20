Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C383CC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 18:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiJTSxd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 14:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiJTSxc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 14:53:32 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51D820C9A6
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 11:53:27 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id g11so229833qts.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 11:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1JJWeDPGrjc6twvc1sU1a1ThiN/IA10seg8oNdbjvjI=;
        b=DeJppYcSpwlWLv2NVFavB0TAVXQhVMhj8SjxiMnDKBIqKRHMTrXwwMsyzG+8ai7lp9
         rxyYVcmUFiMltVnqpMXKzxkvVy60EBBKT2a9wI8qe1dNMHNc1gbAPkCLDpLXIMHVlgd2
         GyzI1621AkXTvdkWr0ojLpM6pckbj8XqXedTx4SEJjedEwZkCUwGqgtLsCow4K+tQFBR
         W0wIV0L/YviN5IWI5FVXxWU55BonGX91p2wXP6TDECsjjE3XnIHeRIL7Zp9VXzmweTfk
         YfittqKi1ujRnMH5RVbokHQRK6vX3YaK6XsvHyM+QfSQa3N3MPlHbDP/kXfuyUH/JRXS
         /S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JJWeDPGrjc6twvc1sU1a1ThiN/IA10seg8oNdbjvjI=;
        b=Unk7jgEdFQbW6sTZB3P+sOxX8UgO8hAjwaI6GfLKEyiWde3geXJuVg+qz1bXwjkrPl
         vCcDB5wS/r3nz3q3v2GMlOALcTWlfD5ydBwedK16dJ9efYXuRDsiUBBFGIHob8cf8C+e
         wy0URKpBComIBHIJQcean2HBAJWNQGS5c/xquKqrS+jx616O7HDSXSFgQDUBcfMZhVvh
         OjACm8DkUlvwuotCcGtnQcbmAJ0xWOLTutuVIS1NE8CjZVkP7wkQswJszadL3GS77TIf
         TvVQVnW0KERFp1iVQGtMF+RHaDtidEAT0QubJXcpZ1j38Q/usPHJocPx5VBl4AES8D9w
         OSgw==
X-Gm-Message-State: ACrzQf37iCqAEvfIWvJFz+JCJyWOC6ogUYNBbjsaE5FBbkqEsmk7i0rj
        HEUpsLNvMYtDq/lO2+kVsbPa8spr4ByKM9fNhlQ=
X-Google-Smtp-Source: AMsMyM7qetifndVf5M+f66BoiYZd2meYfYXmvSjmkw7GZFK+cZvcVsEdMDLmr3D9nN5HnEN3krGs/1hlJ2qDJ5mgHWg=
X-Received: by 2002:ac8:5751:0:b0:39c:b848:198f with SMTP id
 17-20020ac85751000000b0039cb848198fmr12650276qtx.429.1666292006071; Thu, 20
 Oct 2022 11:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com> <20221020175334.1820519-3-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-3-maciej.kwapulinski@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Oct 2022 21:52:50 +0300
Message-ID: <CAHp75Vdb-bCR+E2zzrSULCoxhWqfJTzF38FCxCfKFx3D3vddVg@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] gna: add GNA DRM device
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
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:

Missed commit message.

> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>

...

> +       if (!(sizeof(dma_addr_t) > 4) ||

Do you really need this?

> +               dma_set_mask(parent, DMA_BIT_MASK(64))) {

> +               err = dma_set_mask(parent, DMA_BIT_MASK(32));
> +               if (err)
> +                       return err;

IIRC if the 64-bit dma_set_mask() fails, there is no need to check
32-bit, i.e. it will fail.

> +       }

...

> +#define DRIVER_DATE            "20211201"

Really?

...

> +#include <linux/mm_types.h>

Are you sure?

> +struct gna_dev_info {
> +       u32 hwid;
> +       u32 num_pagetables;
> +       u32 num_page_entries;
> +       u32 max_layer_count;
> +       u64 max_hw_mem;
> +};

-- 
With Best Regards,
Andy Shevchenko

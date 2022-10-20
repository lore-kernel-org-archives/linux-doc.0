Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB62C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 18:50:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiJTSuR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 14:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiJTSuP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 14:50:15 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291EFC1DA4
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 11:50:11 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id o22so531351qkl.8
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KR3+5kKvHDC9BOMnROlxG5MOfJS2Lys60n7JFJ+BFo8=;
        b=mhBsn6E6rtdaqvrsjBCKkElm6NPFr/Nvs9Ej/o3pCKoTTluJNxHO0gwQcnhLQJa5dy
         cYND0YLoo4DXoAiDK6EtFvlf0uaGxw1ki2i4KGkeacWtx67VX0xrRNVVOG6r+mU66lcu
         bfTfd5JahyoitdHLGh5fUDzbSCrtEnFDjGosp/3hmQUl1kRUsAQiJhZj9Io8idCfaAeQ
         SOns5amLoac6fOcfncpHy4p5wFyyGdbNb+46tGNwto6WD0v2skFyq5ahVz8au9S2QOju
         DE2OjLqhPBS1f92bSdS/q1u6WAlKJX+HHkVDCES280ySAHAb6sGkCIn4lYYwaMrEGspu
         Cb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KR3+5kKvHDC9BOMnROlxG5MOfJS2Lys60n7JFJ+BFo8=;
        b=2o9JjOEHeSc6Nn7pVS4gdy5bG43e9AW4aCvgwUh/kyAKc9Mi2wzyGkWFTsMwOIEgVo
         x0Ll2pKs/5S3Ab+ebtHA8FM5Pu4V4KokcNu8LXckS57fk/F5k7/AagG4zo6y9moKJICL
         4SlynntnEfP+Uqs7SCYqCMuE64Ss7OW3PlytdXW9xzbSGctFqLadM+u3d1zz0WD5iiMu
         aVLcSkzGmPasnua7GCTNubvZDnXl/tU9I74LiTqdvuVmvbg2wizjzzw1v01F8If/cSOY
         Y5RpNPeT74u4e8mNvikbFOxz1DDOhLBMXknu7rPsM7MEgxwxR+CWXRXLz4fWbxdxkLq3
         OnhQ==
X-Gm-Message-State: ACrzQf02dVLE35XJYBHpmfKnndLLlBOuMBW/yXph98rr/Y0ffItah6XJ
        NmjB8HKyX/wOBd+Id3qvTy8aWb3XTzblwmFJCBA=
X-Google-Smtp-Source: AMsMyM5HzpiqT5Zi4u1f+qSsbgkOcKt56VuNKFX0yb70xpsBLz+QgXKuu0JrIpEffdsFSqFg9t+I9b+P1Xyy9ePidoE=
X-Received: by 2002:a05:620a:d58:b0:6df:ba25:4f5e with SMTP id
 o24-20020a05620a0d5800b006dfba254f5emr10589902qkl.320.1666291810707; Thu, 20
 Oct 2022 11:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com> <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Oct 2022 21:49:34 +0300
Message-ID: <CAHp75VeLbZ6AWf5yyxc+QyzOOqmBd0jdyJ1m=eiQpep5wuEmoA@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] gna: add PCI driver module
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
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:
>
> Add a new PCI driver for Intel(R) Gaussian & Neural Accelerator
> with basic support like module loading and unloading. The full
> function of the driver will be added by further changes.

...

> +GNA_GEM_NEW acquires new 4KB page aligned memory region ready for DMA op=
erations.

a new

...

> +GNA Library can allocate any number of memory regions for GNA usage. Its=
 number and total
> +capacity are limited by the OSs=E2=80=99 resources. Due to GNA MMU restr=
ictions, even when using

OSes' ?

> +multiple memory regions, the sum of all the memory regions used within a=
 single inference
> +request must be no larger than 256MB.

...

> +++ b/drivers/gpu/drm/Kconfig
> @@ -403,6 +403,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
>
>  source "drivers/gpu/drm/sprd/Kconfig"
>
> +source "drivers/gpu/drm/gna/Kconfig"

It looks to me that you broke the order here.

...

> @@ -147,3 +147,4 @@ obj-y                       +=3D gud/
>  obj-$(CONFIG_DRM_HYPERV) +=3D hyperv/
>  obj-y                  +=3D solomon/
>  obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> +obj-$(CONFIG_DRM_GNA) +=3D gna/

Ditto.

...

> +config DRM_GNA
> +       tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
> +       depends on X86 && PCI

No compile test for the rest of possible options?

--=20
With Best Regards,
Andy Shevchenko

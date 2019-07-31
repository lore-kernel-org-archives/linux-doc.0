Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EDEC67D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Jul 2019 20:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfGaUVe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Jul 2019 16:21:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:46390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfGaUVe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 31 Jul 2019 16:21:34 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1EC27217D4;
        Wed, 31 Jul 2019 20:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564604493;
        bh=uPV3P01fdDXwMC2cp3sSm5uScorHAgvNqHFvPCSEGX4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AEnAskS6xAAvTRE0lKbqhHqm56UPT/l0aF8ey/7glcr1N4YxT9JBi+CufNHLY6dDK
         gzD2JGkqICh5d4yd9yN7h5CuWmeyu/4es5cE9nipVVG28YHfKtkHayDfsuYW4Jc48e
         LXKJbg+r1reEDYBM7XGPCH1lAOlDkOcUNDLRhtYY=
Received: by mail-qk1-f171.google.com with SMTP id r21so50258566qke.2;
        Wed, 31 Jul 2019 13:21:33 -0700 (PDT)
X-Gm-Message-State: APjAAAWOcu7ow+reNWUoYDR78DE/iqQLaHLhCnCZpnf/Pbb/02egFq6c
        X927pluiSS1kh++vtHwJ8wD4wpEeNE7xC0/LBA==
X-Google-Smtp-Source: APXvYqx/FUJ2et44J7TQ9mbGJUlcFyES8MnWGe+AQ/ZmcKGbi55yNvCflF0msvkyq6b1XqZwq80IkL9tQOi07uZbE2M=
X-Received: by 2002:a37:a44a:: with SMTP id n71mr17417772qke.393.1564604492244;
 Wed, 31 Jul 2019 13:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564603513.git.mchehab+samsung@kernel.org> <5b4fae5978d309641fa8ba233a9efe2b48201cd6.1564603513.git.mchehab+samsung@kernel.org>
In-Reply-To: <5b4fae5978d309641fa8ba233a9efe2b48201cd6.1564603513.git.mchehab+samsung@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 31 Jul 2019 14:21:19 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+n9g5d7GkJRJJohfQywzuQNbOam=FbsDCaQu86Z+4zfg@mail.gmail.com>
Message-ID: <CAL_Jsq+n9g5d7GkJRJJohfQywzuQNbOam=FbsDCaQu86Z+4zfg@mail.gmail.com>
Subject: Re: [PATCH 1/6] docs: fix a couple of new broken references
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Dave Kleikamp <shaggy@kernel.org>,
        Evgeniy Dushistov <dushistov@mail.ru>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        jfs-discussion@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 31, 2019 at 2:08 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Those are due to recent changes. Most of the issues
> can be automatically fixed with:
>
>         $ ./scripts/documentation-file-ref-check --fix
>
> The only exception was the sound binding with required
> manual work.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt | 2 +-

Acked-by: Rob Herring <robh@kernel.org>

>  MAINTAINERS                                                 | 4 ++--
>  drivers/hwtracing/coresight/Kconfig                         | 2 +-
>  fs/jfs/Kconfig                                              | 2 +-
>  fs/ufs/Kconfig                                              | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)

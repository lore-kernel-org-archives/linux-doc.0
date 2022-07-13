Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D3FC43334
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jul 2022 13:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235261AbiGMNBJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jul 2022 09:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234609AbiGMNBJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jul 2022 09:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2A8E5C9
        for <linux-doc@vger.kernel.org>; Wed, 13 Jul 2022 06:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657717267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c5tTaTQWdtIl7l1GJF3+E3vkHxBuOg16Ki+fSt3hNw8=;
        b=bcmcmnPF0rK2cH2cokmatFLEn7go4LfHZfmhlUe+c/cYrTCsqBlAt4k4cYSv8crlaEYEu1
        scnDmunvWGlD2+fVQWKUVA578bpzx6DNgAltd674irs683GYVgSGqxapTbMRBRmz+hvYFd
        AgmLZEeCAiNDaLLsg0WZgrUSQSdTT20=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-N5v7m3KBNGeRgF19lvPPwQ-1; Wed, 13 Jul 2022 09:01:05 -0400
X-MC-Unique: N5v7m3KBNGeRgF19lvPPwQ-1
Received: by mail-ej1-f70.google.com with SMTP id ji2-20020a170907980200b0072b5b6d60c2so3058773ejc.22
        for <linux-doc@vger.kernel.org>; Wed, 13 Jul 2022 06:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c5tTaTQWdtIl7l1GJF3+E3vkHxBuOg16Ki+fSt3hNw8=;
        b=LU+EqE3xk9+LThRV+hL33BPY5fC3m2MzXgQY7EFnDlln+tpXx2WM/TWN/DSPWw3R3Y
         VA2G0zzlhYx5J1YUvl4cjtujiYood4Vn0/B2mf0dpA8AosgqUoIs5b8l6uZWsXwnhqd6
         Pj71O7+AE0lTgBm3yv1iRVPBwOixNh0PVbUNJq3k7upas5bx78YSoxplFTpyx6yxERt7
         Pl65PFn4A/fJ+84AnfIceS/i5UwAPhIL7Na5UHRm7JOaoizaOzlASwRxyX//BU1dIGnU
         lTeb2jo67fbT2Q6JebXa+RdCvol5wAFMPL+I+sck0qVqO7dT6c959F3ESymOp601LN1/
         A/Dw==
X-Gm-Message-State: AJIora8dgh4kdgFtYXsLomSnRJIM8H355gARSXyYsTPlYEkf4HVvXVGC
        0amcwgvq/rwJ6/J1sC4x4ZIQW1GqQ/YQw9HwN/h/tAp3lML3rfyEk78E8ZI4xUpvY8yRk9cTHUp
        J7cFgZIaDvIbKcCI3LZlNIpChlhJSNb2b87R0
X-Received: by 2002:a17:907:168f:b0:72b:5571:2228 with SMTP id hc15-20020a170907168f00b0072b55712228mr3497011ejc.397.1657717264516;
        Wed, 13 Jul 2022 06:01:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sM/Q/qXIJtvyge1RBA27I1zfyOERWxp2hTuT6He8VnUbVBaCHWeBofNJRY+F3CAMZEc4y1/wzNTDwJ7jxzCyM=
X-Received: by 2002:a17:907:168f:b0:72b:5571:2228 with SMTP id
 hc15-20020a170907168f00b0072b55712228mr3496979ejc.397.1657717264233; Wed, 13
 Jul 2022 06:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220713085627.175604-1-bagasdotme@gmail.com> <20220713085627.175604-2-bagasdotme@gmail.com>
In-Reply-To: <20220713085627.175604-2-bagasdotme@gmail.com>
From:   Vlad Dronov <vdronov@redhat.com>
Date:   Wed, 13 Jul 2022 15:00:53 +0200
Message-ID: <CAMusb+S+JPJOzHYfuK+YvZydNxoQ9nvE_jGoudTPJiD2HfsTNw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] Documentation: qat: Use code block for qat
 sysfs example
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-next@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
        Wojciech Ziemba <wojciech.ziemba@intel.com>,
        Adam Guerin <adam.guerin@intel.com>,
        Fiona Trahe <fiona.trahe@intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Tomasz Kowallik <tomaszx.kowalik@intel.com>,
        linux-crypto@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, Jul 13, 2022 at 10:57 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> kernel test robot and Stephen Rothwell reported htmldocs warning:
>
> Documentation/ABI/testing/sysfs-driver-qat:24: WARNING: Unexpected indentation.
>
> The warning isn't caused by Date: field pointed by the warning, but rather
> by sysfs example that isn't in literal code block.
>
> Add the code block marker.
>
> Link: https://lore.kernel.org/linux-next/20220711204932.333379b4@canb.auug.org.au/
> Link: https://lore.kernel.org/linux-doc/202207090803.TEGI95qw-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: d4cfb144f60551 ("crypto: qat - expose device config through sysfs for 4xxx")
> Acked-by: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
> Cc: Wojciech Ziemba <wojciech.ziemba@intel.com>
> Cc: Adam Guerin <adam.guerin@intel.com>
> Cc: Fiona Trahe <fiona.trahe@intel.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Vladis Dronov <vdronov@redhat.com>
> Cc: Tomasz Kowallik <tomaszx.kowalik@intel.com>
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/ABI/testing/sysfs-driver-qat | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-qat b/Documentation/ABI/testing/sysfs-driver-qat
> index a600531e95628f..43e081ec22cc4a 100644
> --- a/Documentation/ABI/testing/sysfs-driver-qat
> +++ b/Documentation/ABI/testing/sysfs-driver-qat
> @@ -46,7 +46,8 @@ Description:  Reports the current configuration of the QAT device and allows
>
>                 The following example shows how to change the configuration of
>                 a device configured for running crypto services in order to
> -               run data compression:
> +               run data compression::
> +
>                         # cat /sys/bus/pci/devices/<BDF>/qat/state
>                         up
>                         # cat /sys/bus/pci/devices/<BDF>/qat/cfg_services
> --

Acked-by: Vladis Dronov <vdronov@redhat.com>

Best regards,
Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engineer


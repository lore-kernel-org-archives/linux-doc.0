Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1341C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 19:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiJTTIk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 15:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiJTTIj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 15:08:39 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA1D1D1031
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 12:08:38 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id s3so219382qtn.12
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 12:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MtUDTErrWnMJNcxFkOcVTiq3wwaZ7wUEahic3MCoPRA=;
        b=iPLIUcSlm2SYaVOvBnk4lByH4wiVLGuGA7VRBSLFmyNcvSBZnfv25t2OkFPcAHIL4w
         +ONV7odWh8FPUPGS0jZzGCsIqxBD2F5q6nuIzhPlkRKCGn90rh7LE8YPGUJPoKXgh6eV
         n3JdBvj4I1QkievkaAuVQ47EwgW86b3x4d9so11WB8CkqNao1dy+9AuRPOUEQAqgG85K
         VJye77e4OaoaDfv23FVKrcJGu4JY8WMzqi0+qj4K3mLy4dNr695MO2VtoWmGjyZdnwxI
         I2iiJHtLCX83/J0CZs9YhatTwdI6NW+ka//1b2O2yYUM5BTGB1L0MfXsfUh7/onZUsvT
         Pdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtUDTErrWnMJNcxFkOcVTiq3wwaZ7wUEahic3MCoPRA=;
        b=YaNvgHICcNYPuSgs5Hu/gHGXkID5S/EmU7ngHei8G7DFSXEF89j7JhVeeEGm6RS4W0
         1x/ZnSfDQwZPhAysnJzBZLjIVABIGGjlMdue6OAN2UGh2WILbEQ2AXbp/4/zEi1TdgNu
         WJYLXxR599kYkaz12Du2rdHUotkVuPsx7L7TTg6T6mvLEmE3VMUDI/qWyWd0+gdysFwa
         0ycocLGbk6uB2lhk6aRYHuqj/ECKRLcxbyol6leWFRxUL+PWoU/3031/Mavk5mLReev+
         Nl0wF8Kngm0jHcXJI/0kX/n6Y862jaqov2p+ShScSGzKk8/NU8qY7wnRCNoo0PNq25J9
         /XQg==
X-Gm-Message-State: ACrzQf17kJXUc5qafy5HEskR5nU0zNLrcSsw8f+fHRZbG8s/dklTakaY
        e+5d2WV8GoGkIIssURYFJVpSoCCwnghP4g3a47A=
X-Google-Smtp-Source: AMsMyM5hOJrmcCOp09h4PvvYxc6yqG6pw/ScnnkTkQgBKTlH6j6sZpgOEcOOJ1me4PzlRL9Xo6DhNaBxdEyRHYnYU+M=
X-Received: by 2002:ac8:7c46:0:b0:39c:fa92:a27a with SMTP id
 o6-20020ac87c46000000b0039cfa92a27amr10252651qtv.61.1666292917399; Thu, 20
 Oct 2022 12:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Oct 2022 22:08:01 +0300
Message-ID: <CAHp75VfqKF9ZR7L5tZhv8BZ1hzvAOpSt6QNJv1=mkd6K94UFag@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
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
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:
>
> Dear kernel maintainers,
>
> This submission is a kernel driver to support Intel(R) Gaussian & Neural
> Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-processor
> available on multiple Intel platforms. AI developers and users can offload
> continuous inference workloads to an Intel(R) GNA device in order to free
> processor resources and save power. Noise reduction and speech recognition
> are the examples of the workloads Intel(R) GNA deals with while its usage
> is not limited to the two.
>
> For a list of processors equipped with Intel(R) GNA device, please refer to
> this link:
> https://docs.openvinotoolkit.org/latest/openvino_docs_IE_DG_supported_plugins_GNA.html
>
> We think contributing this driver to the upstream kernel project is the
> best way for developers and users to get the latest Intel(R) GNA support in
> a Linux kernel, through the mainline to any Linux distributions installed
> on their systems. Upstreaming also enables contribution from developers
> around the world to the driver once it is merged.

Can you replace all those dev_dbg():s by trace events/points?

-- 
With Best Regards,
Andy Shevchenko

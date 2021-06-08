Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440ECC47082
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:25:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22C6161354
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbhFHP1Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 11:27:16 -0400
Received: from mail-pg1-f174.google.com ([209.85.215.174]:43994 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbhFHP0m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 11:26:42 -0400
Received: by mail-pg1-f174.google.com with SMTP id e22so16754856pgv.10
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 08:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F1u/sq4+NodWoa8+/tIGnW/u+8jUU5i2k1PbVs04i1k=;
        b=zp73gvRufUtOPQl6Tgh5tNMqErkVi4m6Xn3gsrAnWMX4ypdt3u1orMYpyKN/OJDTb3
         kg8/9cexawx9Rp6gD5ePPhNIV43vjgUdR7dZ9R9C0zBFxQG/J00YwLQ8DIMT0B57XWex
         4p+4TCQoLZ+IMPgqCvwnCb81YEZTK7T6MVz9jmew2F2SM32AQhI/LGRxoMHbAz3fPZsn
         7HxynysUrbOlpfRemiMDc5y9fwdRjpo+RWI4WXo14H8D3tGhpetrbpAi0U2jIbia2J2i
         r7mCR8eF0shCgHELJArdIn1tc0VzkD3meFAdrgVEJc2FNdj8J/TJZJq6bgFYrVDGWoBT
         P1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F1u/sq4+NodWoa8+/tIGnW/u+8jUU5i2k1PbVs04i1k=;
        b=H6cBKPI6WMCJZtKL98dMdHR178WQeI7lrg24okhiiUiI2kEycv9EnSQF5HQZbLdIyG
         y2iICA2WLszA/4BPT54xtTbT8kpDuJ9eW1a+AJWbaADzvqIodfdGEJdQv9COl2uqKxbP
         Xnzo2UZb2ro7PW0UaxzDQKYeYvO+sIp6QIlBk3Jv11H33YcFRputeoAqJpiK9po9lIsJ
         kCPjNq77Slmh1Hw51rwXIQuwISRBQCGde97GRILuN24TGeX7Dejj0ngH8QKpXknmCN7R
         DUKuCytxoQDIA1QHTcMksAFMYDMywt40V49Ix4DX1wm1o600jX9vMzccpqKsLVGu1Sm8
         heaQ==
X-Gm-Message-State: AOAM53162fxLryv2M2CaJCVEJGV7mj8zlAKrcYZY1i2BElw5KooBWB7/
        ynvL4+8x1JA18MnS8uvUO6vQAQ==
X-Google-Smtp-Source: ABdhPJxrU3XrTV8YmAtHJ0kr101O+F8cpASifFf34ctCO0UnCfCrJoZW1UaqXnkyMLhHPZfu+Wop6Q==
X-Received: by 2002:aa7:8bd9:0:b029:2f2:f491:8836 with SMTP id s25-20020aa78bd90000b02902f2f4918836mr403820pfd.47.1623165812456;
        Tue, 08 Jun 2021 08:23:32 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id p36sm11793879pgm.74.2021.06.08.08.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 08:23:31 -0700 (PDT)
Date:   Tue, 8 Jun 2021 09:23:29 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 30/34] docs: trace: coresight: coresight.rst: avoid using
 ReSt :doc:`foo` markup
Message-ID: <20210608152329.GB325089@p14s>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
 <a7a4fe3295b543d361541fd5f1c6fadc9e255dec.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7a4fe3295b543d361541fd5f1c6fadc9e255dec.1622898327.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 05, 2021 at 03:18:29PM +0200, Mauro Carvalho Chehab wrote:
> The :doc:`foo` tag is auto-generated via automarkup.py.
> So, use the filename at the sources, instead of :doc:`foo`.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/trace/coresight/coresight.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index 169749efd8d1..1ec8dc35b1d8 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -315,7 +315,8 @@ intermediate links as required.
>  
>  Note: ``cti_sys0`` appears in two of the connections lists above.
>  CTIs can connect to multiple devices and are arranged in a star topology
> -via the CTM. See (:doc:`coresight-ect`) [#fourth]_ for further details.
> +via the CTM. See (Documentation/trace/coresight/coresight-ect.rst)
> +[#fourth]_ for further details.
>  Looking at this device we see 4 connections::
>  
>    linaro-developer:~# ls -l /sys/bus/coresight/devices/cti_sys0/connections
> @@ -606,7 +607,8 @@ interface provided for that purpose by the generic STM API::
>      crw-------    1 root     root       10,  61 Jan  3 18:11 /dev/stm0
>      root@genericarmv8:~#
>  
> -Details on how to use the generic STM API can be found here:- :doc:`../stm` [#second]_.
> +Details on how to use the generic STM API can be found here:
> +- Documentation/trace/stm.rst [#second]_.
>  
>  The CTI & CTM Modules
>  ---------------------
> @@ -616,7 +618,7 @@ individual CTIs and components, and can propagate these between all CTIs via
>  channels on the CTM (Cross Trigger Matrix).
>  
>  A separate documentation file is provided to explain the use of these devices.
> -(:doc:`coresight-ect`) [#fourth]_.
> +(Documentation/trace/coresight/coresight-ect.rst) [#fourth]_.
>  
>  
>  .. [#first] Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
> -- 
> 2.31.1
> 

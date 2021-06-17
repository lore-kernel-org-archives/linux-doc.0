Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4AFC2B9F4
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 15:04:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82C57610A0
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 15:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbhFQPGG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbhFQPGG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 11:06:06 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F789C061574
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 08:03:57 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id t17so5201407pga.5
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fOx0icLUTNdArz34JQDqZFB60VqgWtDN4FnNDxjMro8=;
        b=wxLykFKHT7L9TjiCyKPB+DgsKT0nIJCX+gNA2XX/yFNnoq5Le3KlCsIG0f2Iify3o4
         n70SG0Z2tUCbX9JwiVUXul5uABLe+lkxb4ICjBlykPGgG/pYxDidEElUaAS/S2V9rv8m
         7lVFi+la4TpJV/Pq/EqZCqViQL3UyyucSrB9XzCXICfD3LOVmW/3JCpRbFpQj0pDfwp7
         LcKypwdeloJEnENst6Un9G+iE19UhfUHoFD/S+qwvyVetcUW8U3JE1Vwq6b6A7BN3F95
         wQK2afNQ0d9N/rmJ0R8moK4axPt2m5pIbmOsE/r5/fkr/70AbN9MN/wZjC17VQ8EL3xR
         2mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fOx0icLUTNdArz34JQDqZFB60VqgWtDN4FnNDxjMro8=;
        b=tviTh/57AgOqMBbjpkGRAsSfNS9RxBgWZsjMHpdwbseSsuWc8rFc9LSGHG7Dg4YDkq
         fVD71E2Y5Joo/u0HUzxdAED4UY15NZfShd6CDlUiFprOdBsmM2u05uoa41HIju7eRMU5
         2KUdjPT6vNsEYf5wVJyd7fo6n7lvkPqrSSw40uW9FvY9wDZHwJCPN/KmXc/meyvJSXP+
         ETx81KzUsKVvZ8UKU67Dtiug+znIe/m6fhvFgiTZ0QJRB2Lo6OE4khzhpERInph25ch1
         xXB25iCHkIpifgxFUOaKB/OeQjP1eQSb80hLTaysPHMy0HpXWAvGiPWhRkhJbFKKeARm
         lMvQ==
X-Gm-Message-State: AOAM531Ta0aBnQ4o/iDFh5HKJEsGiu2qBFzs5iSf1pcnB3ls034qC+4z
        S6gkSYFR/ln1oVZmmaORMSJi/A==
X-Google-Smtp-Source: ABdhPJzzm13hq1jb6dhdNn+F+dmXAF+P5dK9qKR8m0eJ5b18BoOXYAtoHWjZyBvvwOMCYvOkURdvAw==
X-Received: by 2002:a63:1f50:: with SMTP id q16mr5359448pgm.170.1623942235518;
        Thu, 17 Jun 2021 08:03:55 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id y6sm5261924pjr.48.2021.06.17.08.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 08:03:54 -0700 (PDT)
Date:   Thu, 17 Jun 2021 09:03:51 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 25/29] docs: trace: coresight: coresight.rst: avoid
 using ReST :doc:`foo` markup
Message-ID: <20210617150351.GA782884@p14s>
References: <cover.1623824363.git.mchehab+huawei@kernel.org>
 <c79be625f7c90468e13d5380f0e4e1c1ccfa2fc8.1623824363.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c79be625f7c90468e13d5380f0e4e1c1ccfa2fc8.1623824363.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 16, 2021 at 08:27:40AM +0200, Mauro Carvalho Chehab wrote:
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

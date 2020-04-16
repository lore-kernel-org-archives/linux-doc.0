Return-Path: <SRS0=GBzO=6A=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BC3C2BA2B
	for <linux-doc@archiver.kernel.org>; Thu, 16 Apr 2020 06:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFAF82078A
	for <linux-doc@archiver.kernel.org>; Thu, 16 Apr 2020 06:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZKdezR3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408031AbgDPG1q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Apr 2020 02:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2408021AbgDPG1m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Apr 2020 02:27:42 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB28C061A0C
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2020 23:27:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k1so3436037wrx.4
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2020 23:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NphQLflFsc739n86OFq/OswVHPenGwS7GRnWjxbOy0k=;
        b=eZKdezR3g6Xn2sdj18nb6poilwEQvi0XhzT3b84gdka8hFqI84MwkeiMqYFtXmwQ2N
         IjiOjaeozalApJF1io3zj9hOAHdZ4Rvhfq9TYzogQzPOca1M8KYnL3h5TsfBjs5qSzzF
         Y8kO/oNwyK3ANIMUQ8KyetYw4guYdLLceHgUfaUsddQ5iFk1UkNmJkO8SV+TpdJMCKSJ
         FDr0Ckin+v6eFoPcEWdhkXBE3AbeMZ4HiGdpF+H75U7M8mPyaTQOvMs9jS6W17Xoy+Bw
         cDbD7pkdj26e9VODe+TlMR3xTHdtq5Mz/7nY/KEDvg7JZuX/BWY4lcoxBTTVSgQ1I+hT
         5EoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NphQLflFsc739n86OFq/OswVHPenGwS7GRnWjxbOy0k=;
        b=tMz0jX6c7ThZQ2NHIlYSDnDwpLFPj/NPtBiLjFCUcx/X+yOEZUyO6b/UYaQRk5x7V2
         R2feYMYcTTMe3T8kBYQX30XURoTQHY0wOtJ+w07QsOAtD2b+kD58kJ7oY3HixmehBLo6
         XnWdayXxX5i7pMmqNURymqoRZgGzX2oHsVu7Q/+fc8q3EdBFZX+iIWNXEcWcFEhY4FoJ
         PUbszKxThEMEKE90pqJ/XwTx41rRu8RKylG5kc3cPB9m/cvPEsVlv+r8jDtmJ02qhRr3
         hvD8QA0/e9qXVCvqE2WXMR4/SVwaU/JmsrI2yFOApIxKRGVqXVzqooBQfe9Vqwe+RDok
         mkAQ==
X-Gm-Message-State: AGi0PuYyMYJEPtWuKumD/BX5Bke/dXgIQ47JAwXzOM6ohkoARdf7HHry
        jDfylnkW+FNrzTqBUASoOY7U6Q==
X-Google-Smtp-Source: APiQypJJWXw4mlnhjhyGW7fsUmpmvMSUe+Gva7ARSsUwl+dmWYkhEaXeloTJX9ki2MQdvOcyRHxLUQ==
X-Received: by 2002:adf:dd4c:: with SMTP id u12mr5139486wrm.395.1587018459796;
        Wed, 15 Apr 2020 23:27:39 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id h13sm14976188wrs.22.2020.04.15.23.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 23:27:39 -0700 (PDT)
Date:   Thu, 16 Apr 2020 07:28:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 02/12] docs: dt: convert usage-model.txt to ReST
Message-ID: <20200416062831.GL2167633@dell>
References: <cover.1586961793.git.mchehab+huawei@kernel.org>
 <cfec677ffc34540f5f5b63c393f2d0fae4383787.1586961793.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfec677ffc34540f5f5b63c393f2d0fae4383787.1586961793.git.mchehab+huawei@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 15 Apr 2020, Mauro Carvalho Chehab wrote:

> - Add a SPDX header;
> - Adjust document title;
> - Use footnoote markups;
> - Some whitespace fixes and new line breaks;
> - Mark literal blocks as such;
> - Add it to devicetree/index.rst.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/index.rst            |  1 +
>  Documentation/devicetree/of_unittest.txt      |  2 +-
>  .../{usage-model.txt => usage-model.rst}      | 35 +++++++++++--------

>  include/linux/mfd/core.h                      |  2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  4 files changed, 23 insertions(+), 17 deletions(-)
>  rename Documentation/devicetree/{usage-model.txt => usage-model.rst} (97%)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

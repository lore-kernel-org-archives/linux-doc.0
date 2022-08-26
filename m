Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B344ECAAA3
	for <linux-doc@archiver.kernel.org>; Fri, 26 Aug 2022 19:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbiHZTz6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Aug 2022 15:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbiHZTz5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Aug 2022 15:55:57 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758C7DF0B3
        for <linux-doc@vger.kernel.org>; Fri, 26 Aug 2022 12:55:56 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x19so635944pfr.1
        for <linux-doc@vger.kernel.org>; Fri, 26 Aug 2022 12:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=gnz1q4pz/xVc6tlRyQeVFOV7IZAqBjfIyZ5BI3hft0U=;
        b=RrQhxaFx2nxyuhtWZesmSEiSBTXd5+FlSRNNc9KxxyKhJ0Bl69zgANMO0CqfLLj8Wp
         iXKbEy5JuscdAXPSe3gGBQ63tvwMHyDm2gbVkrPza31gsAZYPBPZg9W3zxSSrVKd9Yk/
         J+/Be93CyeaZPN1+vLYQK9NeE/6QAt0OcrlZs7WSL77ro535BbBF+8p7tRe3Z48slTfH
         iIe5XE/mQbWLDiWLPvaKtgmQE5QuLz8YkrScaxgHb8tKeFkCD20srFuQ2qBpk5W36v9K
         kRNALHXmbTvIxGBvpYWid7mpuiPBOXq/uf/Bi6sQ0xgEahLieNidSK48p393xVejDd95
         6kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=gnz1q4pz/xVc6tlRyQeVFOV7IZAqBjfIyZ5BI3hft0U=;
        b=M3AYZ4Tn/LoGGWA18BvrwE/LJb3dk3LmauwvBwc51Pu+dQ91JGRn2xuZuDkV7qAiMu
         kAwlM/7VaGWZN8c1FNVKMlEPMH3PeBOuPJDH2fLIr6vwJ9r49Oug/F11Zcubw1vHbnzN
         2Qb6CyZ9w06xDPsyZxojSwn8Vb1k0wPN3UZqD5B8D4FkmsuPsG/bIrmArHkw8qHB3pw3
         8rjJiaXcFSnJeCDZGaPWaIj2b5HrVVxsPceNzBKGGLOf/Synn/m8D974k5bAV6POsRzu
         pBt1tJl9vhBUcBkDOriNgl19gr6Yywo83vfizx2mv8qebZh6TiL+YfwV9eMYYzpWIa14
         ggpQ==
X-Gm-Message-State: ACgBeo3hgL0zrZ8CIC651pcdMdXji+b3zfarlftc5iwks1N8nvXtvlY3
        tCR36SeVJx2dduPy5SN5oR5pyg==
X-Google-Smtp-Source: AA6agR7267EZysjs+BLPWLMdfKPDxv10ovdb1SjTwiW0Aq1A7/N3A/OV6mJ8qbkfeKKwzUr1R4DBNQ==
X-Received: by 2002:a05:6a00:1588:b0:52f:a5bb:b992 with SMTP id u8-20020a056a00158800b0052fa5bbb992mr5337159pfk.38.1661543755955;
        Fri, 26 Aug 2022 12:55:55 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t6-20020aa79466000000b0053692028ec1sm2148303pfq.34.2022.08.26.12.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 12:55:54 -0700 (PDT)
Date:   Fri, 26 Aug 2022 13:55:52 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     James Clark <james.clark@arm.com>
Cc:     suzuki.poulose@arm.com, coresight@lists.linaro.org,
        mike.leach@linaro.org, leo.yan@linaro.org,
        linux-kernel@vger.kernel.org, german.gomez@arm.com,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] coresight: etm4x: Expose default timestamp source
 in sysfs
Message-ID: <20220826195552.GA1991601@p14s>
References: <20220823160650.455823-1-james.clark@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823160650.455823-1-james.clark@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 23, 2022 at 05:06:48PM +0100, James Clark wrote:
> I've taken over this one from German because he's moved to a different
> team. I gave it a quick check and bumped the version number in the docs
> for the next release, but the month is an estimate.
> 
> Thanks
> 
> Changes since v2:
> 
>   * Rebased onto coresight/next (b99ee26a1a)
>   * Bumped release version to 6.1

I have applied this set.  Usually I'd let Suzuki handle it since he is already
familiar with the work but 1) he is currently away and 2) the patchset is fairly
simple.

Thanks,
Mathieu

> 
> Changes since v1:
> 
>   * Inline etmv4_to_ts_source() function.
>   * Collect review tag from Leo.
> 
> German Gomez (2):
>   coresight: etm4x: Expose default timestamp source in sysfs
>   coresight: etm4x: docs: Add documentation for 'ts_source' sysfs
>     interface
> 
>  .../testing/sysfs-bus-coresight-devices-etm4x |  8 +++++
>  .../coresight/coresight-etm4x-reference.rst   | 14 +++++++++
>  arch/arm64/include/asm/sysreg.h               |  1 +
>  .../coresight/coresight-etm4x-sysfs.c         | 29 +++++++++++++++++++
>  4 files changed, 52 insertions(+)
> 
> -- 
> 2.28.0
> 

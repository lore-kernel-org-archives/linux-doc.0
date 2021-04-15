Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C638C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 21:28:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C461760FDB
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 21:27:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235093AbhDOV2V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 17:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbhDOV2V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Apr 2021 17:28:21 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A824C061756
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 14:27:57 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id e2so8515902plh.8
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 14:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=drWG6gLa1ZmG69Bf/dCzVYRHQhXRC+T+Z0hEFI6MLLg=;
        b=Xyyk4OOugjuSzuE53yCAJdQpci5TujpnnDgW2gWttrTDCCEge4wnyXXJDObYPi5QMk
         7dC67O1Gij9bZhhvrseh/zQb5fAq9KaIVzoNYAA4zAkeh8lGXILOPECPpN0eHEkJco0K
         dK4DS3t0NyphXwf4zvqQN5zlmUhBpfYfSUvv5HEl7K9xNe99521KfNj4VxblmFWMcEhl
         FyYYGSaDS14117+P5+HHXM2owtyYjajbC8OSx+/n0GOm79P6LeqjvO2bpT+qLEAkwnOs
         6jVA6DD7vWTzyYUEPE2m0YVrMUE43uugwY2es0Xl8fPBQr4QjDntJOuDx5OKLL0SrIq7
         SqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=drWG6gLa1ZmG69Bf/dCzVYRHQhXRC+T+Z0hEFI6MLLg=;
        b=ZLh0l6OmVroazoZSg69j2LRydIEdfk8pw7A1wHhrjAitBttgQdvOXpLmBH94qZwsK4
         PamwwYSMsP23vdTFcS5Qo3DUiAETW7sHKKY04rzw063fm3L4NSLiYpRDJRzwptUpfZal
         l9H1+g5c48TiUD4PB3E5+kv/dQkBmXnLO5CprOPH0VPi5vTWIfRt3vhg5uOMUINoQAPU
         VocJv8m3TX30c5OFCrr6i+x1MCsqy9RzDVWTjIJ72iVnHY8j+l+IlcpBmU9ozU9TS8sw
         8CUtkfnKlv6I7mNMaz3+DwZ+Go/q33G3oUlBJ7z5in2DPelOVY/Dp+ci9p+6sO287WMZ
         v/aw==
X-Gm-Message-State: AOAM532cSsM/hmV09WpaKdr/QDg+mbofR7ImC+qKp6xhT6jnQ0IUZt++
        8ck+FBz66lcb5sMqIX9slUDa0lmEuo9xMg==
X-Google-Smtp-Source: ABdhPJyAEcufAnyndGeTLg0yNjYeNOmRJY8VMmP8IoNCy6iQ6tyNjoJ99RHGQvDTl5FPZ3rAyJ/dNg==
X-Received: by 2002:a17:902:d488:b029:e9:9ecb:19f0 with SMTP id c8-20020a170902d488b02900e99ecb19f0mr5904843plg.26.1618522076888;
        Thu, 15 Apr 2021 14:27:56 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t3sm2927761pfg.176.2021.04.15.14.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 14:27:56 -0700 (PDT)
Date:   Thu, 15 Apr 2021 15:27:54 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com,
        yabinc@google.com, corbet@lwn.net, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, tingwei@codeaurora.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/10] CoreSight configuration management; ETM strobing
Message-ID: <20210415212754.GF937505@xps15>
References: <20210414191903.18349-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414191903.18349-1-mike.leach@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[...]

> 
> Mike Leach (10):
>   coresight: syscfg: Initial coresight system configuration
>   coresight: syscfg: Add registration and feature loading for cs devices
>   coresight: config: Add configuration and feature generic functions
>   coresight: etm-perf: update to handle configuration selection
>   coresight: syscfg: Add API to activate and enable configurations
>   coresight: etm-perf: Update to activate selected configuration
>   coresight: etm4x: Add complex configuration handlers to etmv4
>   coresight: config: Add preloaded configurations
>   coresight: syscfg: Add initial configfs support
>   Documentation: coresight: Add documentation for CoreSight config
> 
>  .../trace/coresight/coresight-config.rst      | 244 ++++++
>  Documentation/trace/coresight/coresight.rst   |  16 +
>  drivers/hwtracing/coresight/Makefile          |   7 +-
>  .../hwtracing/coresight/coresight-cfg-afdo.c  | 153 ++++
>  .../coresight/coresight-cfg-preload.c         |  31 +
>  .../coresight/coresight-cfg-preload.h         |  13 +
>  .../hwtracing/coresight/coresight-config.c    | 275 ++++++
>  .../hwtracing/coresight/coresight-config.h    | 253 ++++++
>  drivers/hwtracing/coresight/coresight-core.c  |  12 +-
>  .../hwtracing/coresight/coresight-etm-perf.c  | 150 +++-
>  .../hwtracing/coresight/coresight-etm-perf.h  |  12 +-
>  .../hwtracing/coresight/coresight-etm4x-cfg.c | 182 ++++
>  .../hwtracing/coresight/coresight-etm4x-cfg.h |  30 +
>  .../coresight/coresight-etm4x-core.c          |  38 +-
>  .../coresight/coresight-etm4x-sysfs.c         |   3 +
>  .../coresight/coresight-syscfg-configfs.c     | 396 +++++++++
>  .../coresight/coresight-syscfg-configfs.h     |  45 +
>  .../hwtracing/coresight/coresight-syscfg.c    | 804 ++++++++++++++++++
>  .../hwtracing/coresight/coresight-syscfg.h    |  81 ++
>  include/linux/coresight.h                     |   7 +
>  20 files changed, 2716 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/trace/coresight/coresight-config.rst
>  create mode 100644 drivers/hwtracing/coresight/coresight-cfg-afdo.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-cfg-preload.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-cfg-preload.h
>  create mode 100644 drivers/hwtracing/coresight/coresight-config.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-config.h
>  create mode 100644 drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-etm4x-cfg.h
>  create mode 100644 drivers/hwtracing/coresight/coresight-syscfg-configfs.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-syscfg-configfs.h
>  create mode 100644 drivers/hwtracing/coresight/coresight-syscfg.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-syscfg.h
> 

I have added this set to next-ETE-TRBE where it will be rebased to v5.13-rc1
when it comes out.

Thanks,
Mathieu

> -- 
> 2.17.1
> 

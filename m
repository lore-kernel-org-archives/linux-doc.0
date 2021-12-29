Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1916BC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 29 Dec 2021 10:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235514AbhL2KQt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Dec 2021 05:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235326AbhL2KQs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Dec 2021 05:16:48 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11416C061574
        for <linux-doc@vger.kernel.org>; Wed, 29 Dec 2021 02:16:48 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id a9so43399328wrr.8
        for <linux-doc@vger.kernel.org>; Wed, 29 Dec 2021 02:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=b+zE01u0JpXpyPFug8aJeTgsvJdxFWBY5Ed+UEXJSbA=;
        b=nFApkzhsRA48nGUu+5m10zgx/O8dTMBvvVv1kZzQwiqMHrMxHsItuQb0vBSLa7PUz0
         H5wJ9THDs0vtzxZRwJMcrBdgc05TslxDqhMj0PLv5Rl5bvj0mjFHBxn4Rv768Oj9gyAX
         OO63YnO6HU7LFncpBZ9CNKqug1Ps4gJRdVgHkSqt1rcMUtwoqpWiVS2I8zw0DKquhvmq
         DUBOUyj7NmEMqPSqH8kKTbjsCVw3cJy06PWUmLM5SrVJFDr5XinFywfp1IfAIOX3EnD6
         hYwt1IgD0ZTXATvchXACobxPOQh9Ib2lra6iAMhic7D2RvBRaF2UU0NU8HVzXJeTSvQq
         o6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=b+zE01u0JpXpyPFug8aJeTgsvJdxFWBY5Ed+UEXJSbA=;
        b=VPLiTci4EPyL9jXm+p34ygz/9Uvdb3uVDh2AuTKocP7T6WRkGfiTSi0KWzAGHhhA+3
         Az2nErYdqnwIQZ4Z1Nec1OT2ufVUd1DhRuO2qx7+f2J3soyHpjnXnsKsbFuvEiY9N4O1
         A+PjFf1djCu9n51fbvohoLafHFF3hiB0QuSbzBSE6rm/do/LbLX2ZG30N4QHeujVMs7z
         JNgjYiP0H5UTNyYqJrs+qiCA9rz9cjffKwW+lY+iD3ElRzD7w+8o1v96Fri/tAd6liWa
         cMNXGIcg2ugLVgRueU7V+Wl81bHGwlnbiX1f5K4WftzhGwtp2t79N+Xz/OwZepayNBZh
         b6yg==
X-Gm-Message-State: AOAM532mATDLOzi6o+2sNE0oyZgsVjQKIWQCSCeW2OxkrN0U3nhkRlDx
        dYzsn8urngC5iHKnEewYRraHxw==
X-Google-Smtp-Source: ABdhPJx0iWeXqxZaRi6Rm3ozmbJecqRY7o7RGp5qWfmkkNU1k7L7xFc8xl0Wrcp57XJhzm0SxQHnJw==
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr20111241wrw.313.1640773006492;
        Wed, 29 Dec 2021 02:16:46 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id o5sm3040713wmc.39.2021.12.29.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 02:16:46 -0800 (PST)
Date:   Wed, 29 Dec 2021 10:16:44 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v6 6/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Message-ID: <Ycw1jNNGlkaj3QnI@google.com>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-7-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211224041352.29405-7-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 24 Dec 2021, Quan Nguyen wrote:

> This commit adds Ampere's SMpro error monitor driver for monitoring
> and reporting RAS-related errors as reported by SMpro co-processor
> found on Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Change in v6:
>   + First introduced in v6 [Quan]
> 
>  drivers/mfd/smpro-mfd.c     |   1 +

Separate patch please.

>  drivers/misc/Kconfig        |   7 +
>  drivers/misc/Makefile       |   1 +
>  drivers/misc/smpro-errmon.c | 571 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 580 insertions(+)
>  create mode 100644 drivers/misc/smpro-errmon.c

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3136C43460
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 10:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDD6D6128E
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 10:04:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbhDNKE4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 06:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348753AbhDNKEg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 06:04:36 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DE6C06138C
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 03:04:02 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id g5so23808383ejx.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 03:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2OpST8LZI3on8yL2X/9Onf1MCgH2abOvm7orSC5DgBk=;
        b=lt8+i8lovz9jfZGaOrASIPMN/fDFTBck9Fq0nTM7pv1znMsXju14rrSC+rEONzv9ar
         u8P/Ee2s4Az7i0+dfG7w0hGm4uxOQxlg9BBeUdtQ66hdIlFpTie0XO4AFDHqK41jtekf
         PxP3cAUwvl9veQ5sUPSixbmg830+ZVLq2TlR+1K/ceAAc9pFHvIYXLFyyk1xXmwEm6Zm
         itFdzMrXqMv0FpCEDFEwPrcaS3ZlYZqrTliSbNIjY2ewsuRbOQRNjohDB3Wgm47jwWDf
         CKXzTRgoug31mdPXDoaSeNa0hJL56biyPxQz/vvKy43gXYgE5SpOc+1jKG/iszmaaDNr
         CFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2OpST8LZI3on8yL2X/9Onf1MCgH2abOvm7orSC5DgBk=;
        b=BvLzCcKNZn1uuEdxSSmwVejjb6vPhQceQGkxZrYHe54I0CTeGn3Iwd1SjGkiIhoDvK
         kMZhoaBhMSRXicskuLNl5VncEhDU7ZX1L2FHdhjeDOFiecGWH/NlxOIwFYV/cohK/QVB
         3fuzkcDCfCuqDb9zJpbOwkZ4kcngGtxi+PmNJEkamoY++fj5VqW/6c9lBBZOGHyrq13E
         NGmjKN4I/jonr3z8/yn4/W1Q3pi1Vih/SSMzBtxyQffRDx7pPMUgEg66J1tX+kXnc8HG
         x9CBOW70V3TL11CFbZAUIulRKtJmMt2M4jfZrv09OPGhBC3rpYo1tBUHXo/ROU1X9bAA
         dqmw==
X-Gm-Message-State: AOAM533SeQDxtaka2oxZZpoVTolDgwmXRZ2x8Ff9nr32fDvKqa7a5aAq
        a7BQ5p03zpz6obJkbts946pSoA==
X-Google-Smtp-Source: ABdhPJz91W52QEgwyT/N/q7ZpiRgN8LqDMeAi7/HCXCRFRkriz17el2EnLVeJBWrE/CdPAzD1GN89A==
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr37360252ejc.292.1618394640619;
        Wed, 14 Apr 2021 03:04:00 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id d18sm1809230edv.1.2021.04.14.03.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 03:04:00 -0700 (PDT)
Date:   Wed, 14 Apr 2021 11:03:58 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v2 2/4] mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro
 support
Message-ID: <20210414100358.GL4869@dell>
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
 <20210329015238.19474-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210329015238.19474-3-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 29 Mar 2021, Quan Nguyen wrote:

> Adds an MFD driver for SMpro found on the Mt.Jade hardware reference
> platform with Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  drivers/mfd/Kconfig          | 10 ++++++++++
>  drivers/mfd/simple-mfd-i2c.c |  6 ++++++
>  2 files changed, 16 insertions(+)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

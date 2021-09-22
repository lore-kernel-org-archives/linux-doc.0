Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0C5C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 22 Sep 2021 13:04:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB717611CA
	for <linux-doc@archiver.kernel.org>; Wed, 22 Sep 2021 13:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhIVNGO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Sep 2021 09:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbhIVNGN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Sep 2021 09:06:13 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A785BC06175F
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 06:04:43 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id t18so6780030wrb.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=R31ccu0TqMlPUtNKv5VmcQXqknWHvbIakXTHd3Nf1E8=;
        b=tA4DSQblSR3RKPn+ISUdkVPmzNZzjCbkoIjpxxxIyLTpzAFYgN8HabuOWo/KW+q8km
         3BA/dG5HxKUerkwzoo3VTYqDPy2eM52AxioKrQAQoNuFGj/cqeR8uVwLgxR0dwygdocK
         0jjXFbCHxeeWhsZbgvAsFNdq/ikb8CBv4h1vSrVe4FnBVVFpFZppQkdelru3RUCc763/
         DLEktcOKr21OeD+Oj3nT2y3dx16lx8jz2YtLD3c39SaKHrjB955/lcFwgx1nxt9Y0r+v
         fkNTOy1So7xX3pstdfp6zv+tOCNrkr64EKAZXq5LTmfgAE1Pgbl4n5lTcQ16QsGADTO4
         /UPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=R31ccu0TqMlPUtNKv5VmcQXqknWHvbIakXTHd3Nf1E8=;
        b=UL/Pq7e0mkS85PRDoWfiX78ZI9SczoB+J2BZBsrO213QzR8PNXn87MM9j8c6CMxs/z
         lBUvxshXuQZqx1YFE4nbut/KtF2rZVQHxwJdGt5Hkt3KvsDG62cDgnbAIB0a1UOjS56K
         uDB6Cl4riG9JbebRF14vrtDkqR5Ozt8mDdTHUO7hjhGE0RdE9wJhAZSE7VWs2gBymHj0
         yqP5lxudVgR9TPyC3zD3ZaNkPaUruLXmify8iRivV1bqWDiPEpLCXsOsz3FmFDZ7vpbJ
         wuyiFyMDK8UchuID0sNxtC+QGa3vYeRCboWr2YmZQCS3silmKcc10wf5kw91OukcJDlg
         HSzw==
X-Gm-Message-State: AOAM531HrGKDc5CJ7A3iou/dXO+ypofvaV/3LePO3sNxyiIw+fGWZot1
        rBrOa6Ak601hwt/se9SIsOHkjg==
X-Google-Smtp-Source: ABdhPJx7nfxx48lTrlx0zSN6H1eWSFs448sEbZ0sH9EwWy9Cd3ht3NXMzXIEC1MB940/lPxUw1wAgQ==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr10495911wmc.42.1632315882125;
        Wed, 22 Sep 2021 06:04:42 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id q3sm860236wmc.25.2021.09.22.06.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 06:04:41 -0700 (PDT)
Date:   Wed, 22 Sep 2021 14:04:39 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>, linux-doc@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        geert+renesas@glider.be, Max.Merchel@tq-group.com,
        linux@rempel-privat.de, daniel@0x0f.com, shawnguo@kernel.org,
        sam@ravnborg.org, arnd@arndb.de, krzysztof.kozlowski@canonical.com,
        pavo.banicevic@sartura.hr, corbet@lwn.net, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        robert.marko@sartura.hr
Subject: Re: [PATCH v9 2/7] drivers: mfd: Add a driver for IEI WT61P803
 PUZZLE MCU
Message-ID: <YUsp58sJATzVHrzn@google.com>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
 <20210824124438.14519-3-luka.kovacic@sartura.hr>
 <YUsLfZrnX2hq4FGV@google.com>
 <YUsWjUWBwW8OYBAr@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUsWjUWBwW8OYBAr@kroah.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 22 Sep 2021, Greg KH wrote:

> On Wed, Sep 22, 2021 at 11:54:53AM +0100, Lee Jones wrote:
> > Greg,
> > 
> > Would you be kind enough to take a look at the SYS imp. please?
> 
> /me hands Lee some extra characters...

Fingers faster than brain!

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

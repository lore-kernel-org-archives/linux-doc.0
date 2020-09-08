Return-Path: <SRS0=EfZX=CR=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50AAC43461
	for <linux-doc@archiver.kernel.org>; Tue,  8 Sep 2020 16:52:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D67C2075A
	for <linux-doc@archiver.kernel.org>; Tue,  8 Sep 2020 16:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfWrdNq5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731943AbgIHQwm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Sep 2020 12:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732092AbgIHQwM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Sep 2020 12:52:12 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4356EC0619E6
        for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2020 06:54:56 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id s13so17367789wmh.4
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2020 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=21ErxJddccU49ubJp25MBlzdQEC+AMusP2qDOYG8bQA=;
        b=KfWrdNq5b6Xs0qtZNuisCZjRDKHqR/D8hsPPwcZScyENV9E1QeXxz3IfqSPvkxEcrC
         J5vXWENb+6Vd3MxMp2OnuK9QmW7CLOMd8FFrM3/NXcX+Z2R86vjbFNqFJtj7/14igA4l
         Id9tsHlpHOWMNL1SAq/LuSbz+O7laDtS4Reh/Qhb8x8iXTpnbx9x7jzj+8meVIgInH41
         qT19/Q2puqGNskc8XllHTseldPfG79DZWxDkIm2snuHA17/03ktRKKCUDXhT0q91vBBj
         laxaaQTjsxmTy5LcYzAPp+WVgiujgjtjgWx5AJYlw+TT4xPUCkJdMxamFEuDm/8wez3t
         DoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=21ErxJddccU49ubJp25MBlzdQEC+AMusP2qDOYG8bQA=;
        b=a3vwVKGTc/JHxeW5bYFpz5eDc3XJO4jLKLPGVZNVqt86+Jn1NI7KNG0nccc1Gbln5H
         bbqiYh/JAy/LlPSI0LFdYIlV28HMj67+lpjQ3iSp5H8OhMxhNw1oAnseMhSFmKQzncvD
         SGYGgLUJoSPR860wUu+i58pweV5QSHD8PDyHPEFAViwxQn8NKq8nkrhFnay9MXrB+ntV
         PuitbrrIvNrOMwd//wMM0tKs3DTm71pK+hvXgxcgyYC81WIbdwTKOtyvS9rXvzZvUMG2
         O3GXD/C5riWSIWUYa5On7eiQGwHQMzuETiF/OY6c3MXZVeyz18CBXRWFYKQnhyxckx19
         gM/Q==
X-Gm-Message-State: AOAM530AdpDrvE21MDaYNOdvUGlJGwSfXr7aXR0cfbPvImc6VjT3Tzk8
        u0gVrUOZzVJBujHCvYC375a0gQ==
X-Google-Smtp-Source: ABdhPJxs3Vbv0U9j5vtSqJvOYGxLy67/ixPr4yE71yizUUDaOf4qmB+brVJLpGhbDw7L8PyHirT6Bg==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr4602544wmc.100.1599573294696;
        Tue, 08 Sep 2020 06:54:54 -0700 (PDT)
Received: from dell ([91.110.221.179])
        by smtp.gmail.com with ESMTPSA id 92sm37125579wra.19.2020.09.08.06.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 06:54:54 -0700 (PDT)
Date:   Tue, 8 Sep 2020 14:54:52 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: ab8500: Remove weird Unicode characters
Message-ID: <20200908135452.GV4400@dell>
References: <20200905185803.1293715-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200905185803.1293715-1-j.neuschaefer@gmx.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 05 Sep 2020, Jonathan Neuschäfer wrote:

> There are stray Unicode quotation marks (U+201C	DOUBLE TURNED COMMA
> QUOTATION MARK) in the file. Remove them, as they don't serve a purpose.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/devicetree/bindings/mfd/ab8500.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

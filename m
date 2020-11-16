Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D44C4742C
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 10:25:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88B6021527
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 10:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nqdN4uRj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgKPJrk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Nov 2020 04:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgKPJrk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Nov 2020 04:47:40 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C825C0613CF
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2020 01:47:40 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id b6so17948230wrt.4
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2020 01:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+si8LH3jhi9EyKVGhLQbwPSv91L15i1+9Oq4Ed8hni4=;
        b=nqdN4uRj5voyOinQdTs1MOSCoiyOPfj8u3NnVEqnwsh89YfCT6AgozfIcjPTqpXfGM
         lBTAsB/8ReuT9cWudKtSXV6Xx6Cu1e9GXcTbBqR1IybviVR9utneYkZK07dnnd2r5fmU
         VjSpPGF3TP6yCGp1bFPcfJeEDazghUqDzEIAeHTMCz4+wDsWLtkUfvGl5yxM2LA4vTkT
         oTCM+tvMjLtGCGwZyEuxP91A5mCccTGGiYO8m6VdU2c7bhQeHi4RE0iuqY0NjzK1QlC9
         wpFZrvXQ9YK0dwFMJzJMKD4kZ42TTfZJ+4hxMdW5ja9gPk9S//eN2Zpx0npfMgnQLBI1
         FCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+si8LH3jhi9EyKVGhLQbwPSv91L15i1+9Oq4Ed8hni4=;
        b=RCEHwpAliox/iO4cyxdoH+ERCjFSnB0WDwVUS8TkndAwJh0yf392qqX90rIGHFFmZR
         RsOfZ6tHkcWMCkb51Fl+3dCcjANU3WHjPdRvnM9s616vu5Bb96mpXfs0F2PbI6+JKaG7
         9NhNLeEpGekpRaXLl9jKve4753WqyOkWBwHDeZq+MHOs8wiAk4XWNt9lWX6KiGF2PRj5
         CpS/jCpsW/LOvmc1GjiRwhVMYcRj4YX4pdjUC5PAvYhtp0m2V01mleFnkXlOjT/QrmJo
         K5XZsAzlT/JmqXrmvSDLzo5V8s234oVMOu512s8UlpkbQaqRnSw6xHnloGtw3jAS5S+m
         Q4Xw==
X-Gm-Message-State: AOAM533+VWwHBvr/olgbHBV4XSckSZwnwc5sxtAVlnzERQi7bvXGzWwL
        2RciNsFgZ9BajKMF5lHNoWK5lQ==
X-Google-Smtp-Source: ABdhPJxTb/57HfJkOZ7cB/V/z4dTk0Fhk5LOW+nej7IimYiur/RP+toGkLtmhrPKf82iiC+Ou9db0w==
X-Received: by 2002:a05:6000:1088:: with SMTP id y8mr19995697wrw.207.1605520058932;
        Mon, 16 Nov 2020 01:47:38 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id m21sm29402766wmi.3.2020.11.16.01.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 01:47:38 -0800 (PST)
Date:   Mon, 16 Nov 2020 09:47:36 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Jason Wessel <jason.wessel@windriver.com>,
        Douglas Anderson <dianders@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        kgdb-bugreport@lists.sourceforge.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH] Documentation: kgdb: Fix a typo
Message-ID: <20201116094736.hmqnyl3xezeupzyb@holly.lan>
References: <1605519767-25502-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605519767-25502-1-git-send-email-yangtiezhu@loongson.cn>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 16, 2020 at 05:42:47PM +0800, Tiezhu Yang wrote:
> "to into" -> "into"
> 
> Reported-by: Sergei Shtylyov <sergei.shtylyov@gmail.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  Documentation/dev-tools/kgdb.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
> index 77b688e..4345624 100644
> --- a/Documentation/dev-tools/kgdb.rst
> +++ b/Documentation/dev-tools/kgdb.rst
> @@ -63,10 +63,9 @@ will want to turn on ``CONFIG_DEBUG_INFO`` which is called
>  It is advised, but not required, that you turn on the
>  ``CONFIG_FRAME_POINTER`` kernel option which is called :menuselection:`Compile
>  the kernel with frame pointers` in the config menu. This option inserts code
> -to into the compiled executable which saves the frame information in
> -registers or on the stack at different points which allows a debugger
> -such as gdb to more accurately construct stack back traces while
> -debugging the kernel.
> +into the compiled executable which saves the frame information in registers
> +or on the stack at different points which allows a debugger such as gdb to
> +more accurately construct stack back traces while debugging the kernel.
>  
>  If the architecture that you are using supports the kernel option
>  ``CONFIG_STRICT_KERNEL_RWX``, you should consider turning it off. This
> -- 
> 2.1.0
> 

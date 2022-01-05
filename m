Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF308C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  5 Jan 2022 10:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239518AbiAEKw7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Jan 2022 05:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239524AbiAEKw6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jan 2022 05:52:58 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4133C061784
        for <linux-doc@vger.kernel.org>; Wed,  5 Jan 2022 02:52:57 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o30so22678298wms.4
        for <linux-doc@vger.kernel.org>; Wed, 05 Jan 2022 02:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MwY0cQH7cOYpes1nIznV3yte8B54DSPOU0SYxsz81BI=;
        b=GYV/bge8CUizElpheVoqD9WM2QFNRYdnbgetoZIzMN9pmy5Laf3hOofYZy2HDkm2OH
         Lb6MrP70HLD63BEuz1l0EOKclAIDyI3LRibQrZ60eY9H3rB7Xn2rqWCqGlKjgixY+eIS
         5hDfTzZG5G+6rjx7Tz098Ui6covxCRthV8fgF94T2vpBwtAO2qn9gJg3WCsuYeSR/Rbm
         Mlj8yU9Gu7MWFCNmMFuKq2DYP2wj/S68SZeivdzHVZzmNakvmjrvKGs0MKJWRpFtX60Y
         7RioraCz+kup31iKiNwQFrUWWjG8Vdyr9QIPYxxy8YcxpYT4qePMUjqYuoqeFlYchdpp
         3omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MwY0cQH7cOYpes1nIznV3yte8B54DSPOU0SYxsz81BI=;
        b=CzjPvID5gHaNL7zynxekkFO6BH9Ax4AmD0+MNDyZDBfqL8aNOcRFR3mWOtMFUNUzyJ
         aoLbu3U3AU8Vh8j3FUs8y7pZPje4Ahy2z0Za98d+aHKqvLbzJEffQRlsMdq+0kfEYOGs
         hABW6QV9NN1+1wJmyWn3kL3S8LM94LYZTgJy9U13mQK3JuaOsI33JrH/Yshf7cM2Kmqr
         wuGv8PN64nuEg17yZOzlXf4lzLRuVZeW13Cz5hZ/+ddBFBF0vXGTLBoB3XGc+O/vaxa1
         GjPs3eu0kbDuRfinWaG7ftGh+3RIJ1PqRrO7Dp1qFdf19PpjAYnmW/TBih0svSd4Wd9q
         WnHw==
X-Gm-Message-State: AOAM531s/vU+EtWDbIVxN4B3KwsbbD4ivxsfkjr+RkXX+XO7WjPg84of
        xlrY7YdxGDZGWRuFluounOX4Mw==
X-Google-Smtp-Source: ABdhPJw4081AEhBzyDSiuS++21DKAefqX5jgDSUN8HchMHp6MuRdkLCWydeEi0sLK5h34GJwwO7h4g==
X-Received: by 2002:a7b:c1d0:: with SMTP id a16mr2336690wmj.166.1641379975877;
        Wed, 05 Jan 2022 02:52:55 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id o8sm47808403wry.20.2022.01.05.02.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 02:52:55 -0800 (PST)
Date:   Wed, 5 Jan 2022 10:52:53 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Christian =?utf-8?B?TMO2aGxl?= <CLoehle@hyperstone.com>
Cc:     "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dianders@chromium.org" <dianders@chromium.org>,
        "corbet@lwn.net" <corbet@lwn.net>
Subject: Re: [PATCHv2] Documentation: kgdb: Replace deprecated remotebaud
Message-ID: <20220105105253.5x4zsve5vuxvzkzq@maple.lan>
References: <13287b7914344c7995de27224cd2fa73@hyperstone.com>
 <4050689967ed46baaa3bfadda53a0e73@hyperstone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4050689967ed46baaa3bfadda53a0e73@hyperstone.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 05, 2022 at 09:58:38AM +0000, Christian Löhle wrote:
> Using set remotebaud to set the baud rate was deprecated in
> gdb-7.7 and completely removed from the command parser in gdb-7.8
> (released in 2014). Adopt set serial baud instead.
> 
> Signed-off-by: Christian Loehle <cloehle@hyperstone.com>

Thanks for the update.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

PS No need to worry about it this time around but, for future
   reference, if someone provides you one of the tags
   (Reviewed-By, Acked-By, etc) during a review cycle then you are
   normally expected to collect this and add them to tags section when
   you share the next version of the patch or, if there are big
   technical changes that make you choose to view the tag as
   out-of-date then drop the tag but mention why in the patch
   changelog.


> ---
>  Documentation/dev-tools/kgdb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
> index 43456244651a..7c90e111b364 100644
> --- a/Documentation/dev-tools/kgdb.rst
> +++ b/Documentation/dev-tools/kgdb.rst
> @@ -557,7 +557,7 @@ Connecting with gdb to a serial port
>     Example (using a directly connected port)::
> 
>             % gdb ./vmlinux
> -           (gdb) set remotebaud 115200
> +           (gdb) set serial baud 115200
>             (gdb) target remote /dev/ttyS0
> 
> 
> --
> 2.34.1
> Hyperstone GmbH | Reichenaustr. 39a  | 78467 Konstanz
> Managing Director: Dr. Jan Peter Berns.
> Commercial register of local courts: Freiburg HRB381782
> 

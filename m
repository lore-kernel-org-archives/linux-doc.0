Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB97EE49A4
	for <linux-doc@archiver.kernel.org>; Sun, 20 Aug 2023 05:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjHTF5S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Aug 2023 01:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjHTF5P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 20 Aug 2023 01:57:15 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8208F1CABE
        for <linux-doc@vger.kernel.org>; Sat, 19 Aug 2023 21:58:37 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-40fe3850312so16052131cf.1
        for <linux-doc@vger.kernel.org>; Sat, 19 Aug 2023 21:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692507516; x=1693112316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MMDDssiA0TSodWA9QdU8fmSd3+ANZgAOYWrNE4b8lNE=;
        b=apgmdrDqXI3szfK42Uik9d4EWhVR2DPkLEIIT3ziuEXwWTn8hh2qWXKc+S4sdWeGik
         KFs8+4yfNF4c9fKPo08nlFxEQI+R91eLtkCz0+5NrfjZF+tJkBoNxWz88Md8U3ZCL/EP
         DB8O+eFVb72WFOYe+1KjJnCHYyXzdka5s200k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692507516; x=1693112316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMDDssiA0TSodWA9QdU8fmSd3+ANZgAOYWrNE4b8lNE=;
        b=ZfWgpyaNTwcByw2QQ7g2CK3C8ll7otl8jbSLG2BF29eA8EMAX5LaCqROJBwZzAZnc6
         Mtug1ml+javJO8sDcvqNXAhFUDqgxGcnPfZqD0RgJFlNyYsIiXiIMgBhoNKViLYvbXEu
         /NQtCHf5jR7kxfZuBWb39uXRAHTAzYGri3inmTZNnnHuiN5A9d7X+NWKy7zcHONOFur2
         AuDztOGPNgZY6uSEni9NjiWMhzr4CpZp9x+0NaXPLuxdlmfQt3Dg7DT8RNYd60dF5NIw
         rq0C91wyX9nzeg5Hib9B5umfwzHA0eKeOdsYwedTJtatoEoQIyn9ipthNpVHuWqDyNtH
         r1kw==
X-Gm-Message-State: AOJu0YyoSPkNjEKKrste1dv38m3/BkCkseW/+4VNZgtPjrW2PuyxBXIw
        ZqJCVVmip+ks/1Yl0ViHJRJ57w==
X-Google-Smtp-Source: AGHT+IGxvt57F5ru4y7eeh1LIBKHFvIjPVvfi4vi3BYWgrBdp2eL5L/w7zsefhNB91isKGAnKskbzg==
X-Received: by 2002:a05:622a:44:b0:403:a9aa:56d6 with SMTP id y4-20020a05622a004400b00403a9aa56d6mr4726597qtw.58.1692507516534;
        Sat, 19 Aug 2023 21:58:36 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id gc4-20020a17090b310400b00267fbd521dbsm5715770pjb.5.2023.08.19.21.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 21:58:35 -0700 (PDT)
Date:   Sun, 20 Aug 2023 13:58:29 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC][PATCH] kconfig: introduce listunknownconfig
Message-ID: <20230820045829.GL907732@google.com>
References: <20230817012007.131868-1-senozhatsky@chromium.org>
 <CAK7LNASJWKSsdzn5ccgWaC35-XvHGU7pnE6C=eZFDbqrrghtdQ@mail.gmail.com>
 <20230820024519.GK907732@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820024519.GK907732@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On (23/08/20 11:45), Sergey Senozhatsky wrote:
> > 
> > A new target is not what I like to see.
> > 
> > 
> > We decided to add KCONFIG_VERBOSE, which will be used to
> > warn options accidentally disabled or downgraded.
> 
> That doesn't seem cover the cases that I'm concerned with. I don't see
> anything related to "!sym" in the patch.
> 
> What will KCONFIG_VERBOSE do if it reads the following config file?
> 
> // assuming that both config options were valid and existed in the old
> // kernel, but were removed/renamed in the new kernel
> 
>  $ cat .config
>  CONFIG_DISABLE_BUGS=y
>  # CONFIG_ENABLE_WINAPI is not set
> 
> 
> I'd like to see warnings for both lines, even for config that is not
> set, because it maybe we set by a build script depending on USE flags
> for instance, so that build target may still refer to non-existent
> config.

It's also important to exit with an error when non-existent config symbols
are detected. Because that is an error. We are looking at a broken kernel
from the end user PoV: the kernel will compile, get rolled out and at some
point you'll start receiving bug reports of non-functioning peripheral
hardware and whatnot (e.g. some specific USB devices whose config symbol
has been renamed).

So `make FOO-config` should never succeed if old config contains unrecognized
symbols, it should never get to the compilation stage.

That is not what KCONFIG_VERBOSE does (at least in its current form),
as far as I can tell.

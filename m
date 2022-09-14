Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9E1C6FA82
	for <linux-doc@archiver.kernel.org>; Wed, 14 Sep 2022 14:32:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbiINOc6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Sep 2022 10:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiINOc5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Sep 2022 10:32:57 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F57B4C61C
        for <linux-doc@vger.kernel.org>; Wed, 14 Sep 2022 07:32:55 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so19202018pjm.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Sep 2022 07:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=rd6Fj2fC8Goem3fWccKD0y03WABlAKjmm2Db9Cox5Tw=;
        b=H4w3kD3hFmJlmPgcet5r8dxOsHw//Z34IatU/K6OyD43YK4ed++kCCm11SFyN8qqOo
         Bc7GNbvKKBIsoFe08tSzGNkqdNSYLrOD86jzfTTZHZvTb9Y1xyp1+jctaR08fBt9ocs7
         6bHYUCKWcllmAUlmYA92wh3wI6YTx9Hjk+tsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=rd6Fj2fC8Goem3fWccKD0y03WABlAKjmm2Db9Cox5Tw=;
        b=KAmRQojT1qBgZ1SoWlLch/mxmkujqSqmQO/cELlMw6CIJ6dJoMN7UaHskpoOMksUrJ
         rkDyh4cb9YFQ1SNiMqfIqgnhSTS5T+FNgUUROLEHk04hwfyqdIE7z8jXn79iMcvztg11
         G13lrZ15AMkwbINa6YHACTNAcz4zSJ1gY2WayJA/yie0B0bO5sHqV9tggayRgb/2EIEK
         gTlt4MyMRtYicOJ/WuG8m7/Kyrx/jNFcZz0WD2q6ZsVAj048eXzKT1lCHLAZ3T5tD/5s
         yQy2ZGnD1aX9narRhVJl2E3gesoOPAxQnv0rG3NcRgYNlFx42gBLeSLOVEkmG9kb70Oc
         mJeg==
X-Gm-Message-State: ACrzQf1EbYthLCzThoSVnb2YKH1wrI8ApKpUk4vsnNftprEbttELB4ml
        flGLT8NNQBaoe7zigofbDFh2WLIsPUrwyg6T
X-Google-Smtp-Source: AMsMyM7Lkehp4jFAefw+bGpu5ndb1mC1GwpcGhDZW9RVVLJxi6CkwzIZBAVM8VKcnw7lsvsilVonZA==
X-Received: by 2002:a17:90b:4c0a:b0:202:54cc:6d5 with SMTP id na10-20020a17090b4c0a00b0020254cc06d5mr5111424pjb.121.1663165975042;
        Wed, 14 Sep 2022 07:32:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m3-20020a638c03000000b0042bd73400b6sm9801656pgd.87.2022.09.14.07.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:32:54 -0700 (PDT)
Date:   Wed, 14 Sep 2022 07:32:53 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Rewrite the top-level index.rst
Message-ID: <202209140718.991618E@keescook>
References: <20220901231632.518583-1-corbet@lwn.net>
 <938a9905-217c-f02a-b5c2-35c1e5d7822b@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <938a9905-217c-f02a-b5c2-35c1e5d7822b@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 03, 2022 at 12:03:17PM +0200, Thorsten Leemhuis wrote:
> On 02.09.22 01:16, Jonathan Corbet wrote:
> > The top-level index.rst file is the entry point for the kernel's
> > documentation, especially for readers of the HTML output.  It is currently
> > a mess containing everything we thought to throw in there.  Firefox says it
> > would require 26 pages of paper to print it.  That is not a user-friendly
> > introduction.
> <
> > This series aims to improve our documentation entry point with a focus on
> > rewriting index.rst.  The result is, IMO, simpler and more approachable.
> > For anybody who wants to see the rendered results without building the
> > docs, have a look at:
> > 
> >   https://static.lwn.net/kerneldoc/
> > [...]

I like it -- FWIW, I am able to find stuff much more easily with
this. I am traditionally looking most for internal API details, how
to test exposed userspace interfaces, and process docs (so I can send
reference links to contributors when I'm doing reviews). These map to
"how do I do it?", "how do I test it?", and "where can I aim people for
common process details?"

(So I'd expect to see
https://static.lwn.net/kerneldoc/dev-tools/testing-overview.html
linked under "Development tools and processes")

> Great initiative. But looking at the rendered result made me wonder:
> what overall structure for the docs are you aiming for in the end? I'm
> sure you have a picture in your head, but I failed to grasp it, as for
> me a few things looked a little odd:
> 
> * we do all of this for the users, so shouldn't the section aimed at
> users be at the top? And list more things they will look for?

I'd agree with Jon: I expect the primary consumer to be new and existing
contributors. (Where "new" may just mean "new to this area of the code"
too.)

Under "Other documentation" on the front page that can move:
"Atomic Types", "Atomic bitops" can be moved to Core API docs under
"Data structures". I think "Memory Barriers" can go to "Concurrency
primitives".

-Kees

-- 
Kees Cook
